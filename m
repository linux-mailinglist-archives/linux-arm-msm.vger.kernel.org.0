Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB71653FF88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 14:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbiFGM4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 08:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243100AbiFGM4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 08:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 296C87B9EA
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654606604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1Rbq682qHkie0T2qkttWMwrGDd2uup8QmAgrwANFZPc=;
        b=AQCFRaD+2e/YHKWhfL45c6gOWiCIvKRQv5W8ZRYSQJNJDZi6iXsFoQqJOHnHq0FVGCyZVw
        a4vsnSLQyNXFWvualVfOdwcpKeVFEdREU3RKbuKk7VRAu5jMSBAVnStkMSVjPSxh+eYi34
        Wv6hIupU187+UVxydX2jLNztGCLQazQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-YA33swqTOi2iQxKm_pMF3Q-1; Tue, 07 Jun 2022 08:56:42 -0400
X-MC-Unique: YA33swqTOi2iQxKm_pMF3Q-1
Received: by mail-qt1-f197.google.com with SMTP id c1-20020ac81101000000b002f9219952f0so13849252qtj.15
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 05:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1Rbq682qHkie0T2qkttWMwrGDd2uup8QmAgrwANFZPc=;
        b=qwGOOhh5N3V/wolJDloGRmrn/5ChrRrwvQeLwfuI9lgGIM8f1FZT1vnq90GfU2IF7p
         nyTxiCopVwULRQz/yt3FWNSENbYbMBkqGHHL1W1jMJQkipP4uVxV1MlDdQ/hzBq0PPQ7
         Y6gEcdEYNTwGC31l6+L38gTuFuH2CpYRX4ZXkpSFLcgdzM18s8H5wGAZLSnbNXHyQ1U+
         T1C56s6UhMbWj2KilVFb8pTqOrhHvozJIYxAYRmKfL6h2nu5Skt+PMA97dYqFsSl2G8D
         2UYJUojnqRO4TU64MXqbcv7StorA21bAPU/dlFqc88iRNzMvBUID2ypDfULUNdZz7mb/
         sO2A==
X-Gm-Message-State: AOAM532CwM2t0BFEehqbU0yWVvbGrr2sEycZbfSMnZH38MJPGHrqeIpk
        h5Qx+11dFbqyr7GC1KcqjyeHAP6zZKJoU0q/aOaA+mEseXzTyJEY5Dja/HQwJOszkIm3eOmu3B3
        H8bZvQ84e7LjkUlbzAsuxfrtEMA==
X-Received: by 2002:a37:9401:0:b0:6a6:9a6c:978 with SMTP id w1-20020a379401000000b006a69a6c0978mr14617900qkd.384.1654606602267;
        Tue, 07 Jun 2022 05:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypFmTXed6eVoM6aXAyGQ7JN7OB9xM5GOGMdgK9bojKeFJYnbQ0e9gSI1pzMMsUODMNBimfRw==
X-Received: by 2002:a37:9401:0:b0:6a6:9a6c:978 with SMTP id w1-20020a379401000000b006a69a6c0978mr14617884qkd.384.1654606602042;
        Tue, 07 Jun 2022 05:56:42 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id k23-20020ac84757000000b00304eda87219sm3549304qtp.31.2022.06.07.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:56:41 -0700 (PDT)
Date:   Tue, 7 Jun 2022 08:56:39 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable qcom interconnect drivers
Message-ID: <Yp9LB4DLpqpKRfZW@xps13>
References: <20220607103831.766162-1-vkoul@kernel.org>
 <20220607103831.766162-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607103831.766162-2-vkoul@kernel.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 07, 2022 at 04:08:31PM +0530, Vinod Koul wrote:
> While enabling QCS404 interconnect driver, I found that other drivers
> are missing too, so add all the interconnect driver
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6d3f4d8d50b8..fc5a340bcacd 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1249,7 +1249,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_QCOM=y
>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
> +CONFIG_INTERCONNECT_QCOM_MSM8974=m

msm8974 is arm32 only and should be removed from here.

Brian

