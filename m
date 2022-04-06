Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E324F6A0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 21:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbiDFTgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 15:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiDFTfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 15:35:53 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664C61E4629
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 11:02:45 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d15so2623712pll.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FOXsiXJAKtMLGXYAK3r6oxcC+auPPBmHNsoM8lFZURA=;
        b=PAZ/A8rZS2CY5N8UncYL8kPPJsSOXNe1/sGOku+QaGVMSMpyJ3nupUnAicTVxA23vZ
         Wq3Y5a6Qgxs4ExAWWf2yJX6U4DqYlgivwlQ52e/7+C/Nz7vQXv5MFNwPhqCeG1MgZSvD
         4jWp9zXXk0cBtS1yn+3/Xk/S6556cO53u1oM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FOXsiXJAKtMLGXYAK3r6oxcC+auPPBmHNsoM8lFZURA=;
        b=EXFO6K31pBmlCX69F7GXYFEowhuZTr5XZ/6XMfR6F7EM8lQh9pBortrzaWCWXD3k0y
         XrKpzmER+6VTAopqbQ4gUbCSlBx/2vDI4Rh1nCJvgxsdcAZVknrn8OFMwVWJoXNbUDr5
         1muXTnLRJ76v/i4OPWmEjTudmNo8Vtzj5DeKVI36GzDAJa2VgH6pwLalQbs9cuU+1jl8
         4W51DXP7Z/OiLUGM86rqb6ocZFGZRh4KzIanQ7ErPa7QjYeaSk1Z084iblstWwJABhrZ
         0eVD/OkZbWZ+JSU67QeM96b+a888KDyT/8Vsiyrre9rZ2TLH3K5Y49YpyekxB8GfN8Ok
         HUPA==
X-Gm-Message-State: AOAM532GjR8lKYt1Ta7Ur9nXPR0qoNF7cmCpxog5G+szYYdMdgSGwchn
        J+3lKdC570agrbPgiwaOM93gkJ3MFa5GKw==
X-Google-Smtp-Source: ABdhPJzwbh3laItq2cdNTEF67N9FfUifv3GDwvRrfwlLqVMFVY92eizIQGODQlB5BG3tLdlTQ0MFaQ==
X-Received: by 2002:a17:90a:49c1:b0:1ca:c243:db77 with SMTP id l1-20020a17090a49c100b001cac243db77mr11069186pjm.215.1649268164727;
        Wed, 06 Apr 2022 11:02:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:dddf:7cc7:1261:9584])
        by smtp.gmail.com with UTF8SMTPSA id h10-20020a056a00230a00b004faa0f67c3esm18870536pfh.23.2022.04.06.11.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 11:02:43 -0700 (PDT)
Date:   Wed, 6 Apr 2022 11:02:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Message-ID: <Yk3Vwev3AgQgd1LK@google.com>
References: <20220406111303.27670-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220406111303.27670-1-quic_mpubbise@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 06, 2022 at 04:43:03PM +0530, Manikanta Pubbisetty wrote:
> Add DTS node for WCN6750 WiFi chipset.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
