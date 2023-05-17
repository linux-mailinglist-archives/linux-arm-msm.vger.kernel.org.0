Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9BAE707156
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 20:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjEQSyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 14:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEQSya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 14:54:30 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7040192
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 11:54:28 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-24e01ba9e03so938345a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684349668; x=1686941668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R54qrXpRXauvJnkZnQVt+Z87JHaYQBFqFu4dbWlWKuU=;
        b=YOBsq8PP05/w38VDa0SXCGmdQh/1emiGk49qoBF9cz1Jc6Eoas/qpQPA7EbPAmB7S0
         aZFk3Z2iHcKzdKa388FofA0Up5h+ZFapgP9NTHcTzV/eRtJZP0CeSe214oQGRChz4F96
         88O5wM9zSkZr8bnOxQ3PwNnFIdFUoMaKhUmNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684349668; x=1686941668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R54qrXpRXauvJnkZnQVt+Z87JHaYQBFqFu4dbWlWKuU=;
        b=OIjSck3AXQ+TE2NEu8VwM4cV9/fUqvBNBJzXyAkdiTtpuf3OHxU+hmX/Qzlj2bp+wT
         74eHWaIcqoiL5+wV70HG/O+QkgQiWXXzuWW+AaCAjxcVWT+V4zoAJjbcT4qc8IuTAoGD
         91GRxoT6oRCk3jIS/NY/UGhgYsPGlKfqrwHacHKtG8VTGd+1LHYnF3epIK20Mi06NSak
         tNoh2PSVjuFek8StR0Jm2vu4r0Nd3ypZm9srGy/MJSWqFiV43rGlAMe2slE63xuRk7nr
         1Q85+AcwmFg1pypnGhRQCLDvG/IuUs3auu/M6D45Y7mA6eHRDhiwJ5HB16TUl7Wa+IO8
         fiTw==
X-Gm-Message-State: AC+VfDwrAaXFu7cMk88agotL3eBFmNs9XtoRE7JuAb51+z5SGj7xq6f1
        /UrFbimChZ9HE+kagHrVo6iN2ATM0WkF+JiH4nk=
X-Google-Smtp-Source: ACHHUZ6+0qmyB748J64aWK2VoC7egUUCgofve5208iCv5bsbGWtl4XBIGCzOemSDxj8LWHRRM1KRTA==
X-Received: by 2002:a17:90b:2398:b0:253:3e9d:f92a with SMTP id mr24-20020a17090b239800b002533e9df92amr633903pjb.29.1684349668336;
        Wed, 17 May 2023 11:54:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id om11-20020a17090b3a8b00b0024e268985b1sm1941458pjb.9.2023.05.17.11.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 11:54:27 -0700 (PDT)
Date:   Wed, 17 May 2023 11:54:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: venus: hfi_cmds: Replace fake flex-arrays
 with flexible-array members
Message-ID: <202305171152.79664B158@keescook>
References: <ZGQrSQ/zHu+pk7WU@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGQrSQ/zHu+pk7WU@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 16, 2023 at 07:18:01PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element arrays with flexible-array
> members in multiple structures.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/294
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

The subject is very close to the related patch (plural vs non-plural):
https://lore.kernel.org/all/e4b13d7b79d1477e775c6d4564f7b23c4cf967f2.1684278538.git.gustavoars@kernel.org/

So it might be nice to name struct hfi_session_set_buffers_pkt
specifically in the other patch's subject, but otherwise:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
