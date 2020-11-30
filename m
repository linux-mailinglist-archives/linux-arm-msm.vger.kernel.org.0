Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2CE2C8999
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbgK3QcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgK3QcH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:32:07 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1706C0613D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:31:26 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id z24so11861354oto.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Cp6V5Cicb9Rn/nnxXd4XAbduDf40Lj5FfeVGA4tCpao=;
        b=WC702NwxALuG0BQnBLlGWZ8LR2TJ2zpNYOwyjyrOJsLaNv1UK+0dtXTvIFMXA6Bm32
         Kn8CW961O0EA+K+pXSyYDWV1tgIFCUukBvGugNwqbjX9fx1rRmnotm9lD/T/Te8NyKZ1
         RS+EQDOyCQtkDdOsxR/jGQTJIXKhGNOhCv2l/r/LHsYCqhar4NsY5jXVR9zHpRs6lpwJ
         raxLXVLZ3tYkJWmZ5HELTiO7n6dcdZXXiA8HbIRlNqt/l0MfULZEiAloLg6PQi6iO7tn
         /tvQu28OCjgRPNTbiYWG1dbmR2EUA+3w2SFeXSSp/uvj46QnN3GIwJ9WeYAXcUyPfm6Z
         938Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Cp6V5Cicb9Rn/nnxXd4XAbduDf40Lj5FfeVGA4tCpao=;
        b=NCHAcbfNUMd1U+BcshS7qOxxNznPo03MT+tnvHAUdNtkffODe52EMy53qh1GrEw2lX
         oEQQOrafEa5soPRLjO2LAQLRR4Xxnm4/1ZWJ3Y7KEKRF95eS2N1Xc3suP2UYdZ/fIoug
         o2dJBUpTSunEcYOvawQ5adfQCxN0GLTVYN0RNv0KrA6CyWqyYJhpRpJy7xAX3OS22mUJ
         Paw32OM6JihvcWgcqU4GT1s2J9kW6FuMf+ysUKPmDNqtRqaS1JPi7hF6QeYq7xUcp5aB
         s+Jqca8Nz6Vahplf7yBHe637v20IsKvNlzX9d6IChw0xJysXcsLGI2eVGQglKGocDpcC
         UHcw==
X-Gm-Message-State: AOAM5332Gf4QLtrCoAI7dC1E2vIWy+3lDkJSpuJRZnZTy+ZgSjAcQUNQ
        GGb5D8+71BaoGYg3NUTnu0C4G9+crjU9FE+jijo=
X-Google-Smtp-Source: ABdhPJyTHIfeZagS3+8wbp5eAbVikhJHfWNd29fNTxrpdZPR85Dz19OSrQrErBQW7zK8km0/9hJhFg==
X-Received: by 2002:a05:6830:84:: with SMTP id a4mr17256833oto.341.1606753886240;
        Mon, 30 Nov 2020 08:31:26 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com. [173.175.113.3])
        by smtp.gmail.com with ESMTPSA id m81sm9833442oib.37.2020.11.30.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:31:25 -0800 (PST)
Subject: Re: [PATCH] arm64: defconfig: Enable TMPFS Posix ACL
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201130163007.310384-1-bjorn.andersson@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <45722761-d70e-b398-dbb6-91c1ba029640@kali.org>
Date:   Mon, 30 Nov 2020 10:31:24 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201130163007.310384-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/30/20 10:30 AM, Bjorn Andersson wrote:
> The lack of TMPFS Posix ACL prevents the upstream defconfig from booting
> e.g. Ubuntu, so enable this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index f4d0b3a61e41..3d2a1de6e8d6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1075,6 +1075,7 @@ CONFIG_FUSE_FS=m
>  CONFIG_CUSE=m
>  CONFIG_OVERLAY_FS=m
>  CONFIG_VFAT_FS=y
> +CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_HUGETLBFS=y
>  CONFIG_CONFIGFS_FS=y
>  CONFIG_EFIVAR_FS=y

Tested-by: Steev Klimaszewski <steev@kali.org>


