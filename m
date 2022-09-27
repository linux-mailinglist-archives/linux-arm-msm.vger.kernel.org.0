Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4905EB7AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 04:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiI0CbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 22:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiI0CbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 22:31:01 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E52995AE6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 19:30:59 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 129so6752828pgc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=A415gP/CRCjugI919Jgs4A7RjNMw5l2C7zh5BSt6/9c=;
        b=cw1mNAoz6pNqX9M9TacTMaWM7ZPCbyB8Mb9RNo7yXHBX9IKQGVa/41aGSh5SNA6ReX
         rlJ5CyiLsludHGviO+mcCHmKxOv/8lplcVMUt36CtQJX4wiVF2N1YfBw0fLcmU6PXtIB
         vy23Ig8jYsSrL0qGNTlVykrfFGMrYNkRW5iF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=A415gP/CRCjugI919Jgs4A7RjNMw5l2C7zh5BSt6/9c=;
        b=Ckev/bb0WcVdC2fcW/601/VcaDWQFh3mM7J6hOtk9l4ZAM1R1YnWE1yc83ct5OK2pT
         6HO7Y1+uDYvvVlX+s6m5F+mgu5H+JUy7nSQE/en+MCk3LrBS03uIsOqSDHym+n8ktL+o
         sXlitBnSgU/DfxlOt9TyS9wvhuvbw1f1uS0HpkuctWSZOXREg9gyEMWuS/uTElQtE5G2
         2shnK1evKtFljIXCAHL0pQT1kceVHiruq4EtlwMvUUf+rNmiDPBLWA98qx7X8XplFpzA
         s5snwIFMYDa5rfHXpcHOZkT9m5aOEK1JfMk/YmBqVAQG+1LcB8FPs395Us0b/5DkxuVg
         ID9w==
X-Gm-Message-State: ACrzQf0XrbwhUR+2PyIj/a1ZRq6j8KYEWpOtGSz13eWAvdbvuX3gHYqz
        sIHAsFKUGZp6bumd77BoBcPIiw==
X-Google-Smtp-Source: AMsMyM6AY2+tFrwQWLzXm+PKLmT1J0IOCatxxUFW3+DUfSmE3r+tA8R98tAzBB0w523VWRgHKThzyw==
X-Received: by 2002:a63:b957:0:b0:434:c30d:84b0 with SMTP id v23-20020a63b957000000b00434c30d84b0mr23027587pgo.293.1664245858318;
        Mon, 26 Sep 2022 19:30:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b0016ed20eacd2sm144134plg.150.2022.09.26.19.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 19:30:57 -0700 (PDT)
Date:   Mon, 26 Sep 2022 19:30:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] soc: qcom: smd-rpm: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <202209261930.A34FE7B@keescook>
References: <YzIvNIyPhWaG2DTr@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzIvNIyPhWaG2DTr@work>
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 26, 2022 at 06:01:08PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/224
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
