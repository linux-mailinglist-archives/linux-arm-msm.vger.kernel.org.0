Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7392B394D57
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 19:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhE2RJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 May 2021 13:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhE2RJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 May 2021 13:09:10 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80963C06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 10:07:34 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so6687793otk.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YA91sBPn0zwwbxlssSM8hTajsH+fA9/jt+cb29CA/KE=;
        b=KftmWWC+YlHD6Lhc3x7HrpPfD2MzZqfDFwgxXZJcQH2kUHXATovRhUeSCArLVUHJKE
         1SpcswWKX9fE/KE9pPcN/Q0Y9V1od9D5GoxmAQQyvMaXPfC39Jzx6uwLMKYvrws1/gxK
         LeyxO2DJpcTAQipj0pYzfYbRfKcx0Ubd3E0O+fKtAaEa08jNChtaz61oOkziNDREeD/2
         eGNQLbpA3d6yLhdpY5FgEjiNQjGyxUdzPCkKkUEEptD4Irjc6TNdkgzty1ebV5vTaVmp
         Yhz1lnyZTmBQF013RaOOZVsN32Fhx2x69JtO+IXtnF8j2beZOyNq8dQIxC6SkFQpmdR7
         4Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YA91sBPn0zwwbxlssSM8hTajsH+fA9/jt+cb29CA/KE=;
        b=JN8Ow1wTn155iwo+yCq88SLJoDvdS7kZKT9jqT5ei/w2yK3dSpZTzpNobNfQVagWVz
         7jp65zDzWTNbFXi7iXyUlidomGkZm7tMIgoklV7g2cIP0eLgkzdTsa5BUNVrqezbMkvY
         GtLNdqotPsBQHx1IsM15F1ZAO/Kg6lx8hmne/hidsSpIYCfXjXM0azjHfos/LKSiDIAY
         tQG/qwrAxXh/4O2kQazPH1A+knsgY/0B5JRVgyqR2ZvGcs7DZObDj+M7CiSJuwCGcN6U
         y+TSVwKuqVizif2+B8lS8PQyT9soarG6R9Mm+RJvV6zny2PfpHqbnv2G+c811hYp6IsI
         mIrA==
X-Gm-Message-State: AOAM531dZpNEUxAl46BZYRNoPt8uGlAgIJacAdapVytmeOXepNBbBuaD
        LLBNQa6K/7eyzb+pp+PR+y5geg==
X-Google-Smtp-Source: ABdhPJzgUBYSwpCjkaEAyLAysdd0MI9ukwHNAwy5t9SKrqcg6zp6seZaqyUp6lAB4xB7JLMcOrKGxg==
X-Received: by 2002:a9d:8c2:: with SMTP id 60mr11775276otf.217.1622308053620;
        Sat, 29 May 2021 10:07:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w6sm1887879otj.5.2021.05.29.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 10:07:33 -0700 (PDT)
Date:   Sat, 29 May 2021 12:07:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v8 5/5] arm64: boot: dts: qcom: sm8150: Enable dynamic TX
 FIFO resize logic
Message-ID: <YLJ000lIVhZM5WEV@builder.lan>
References: <1621410238-31395-1-git-send-email-wcheng@codeaurora.org>
 <1621410238-31395-6-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621410238-31395-6-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 19 May 02:43 CDT 2021, Wesley Cheng wrote:

> Enable the flexible TX FIFO resize logic on SM8150.  Using a larger TX FIFO
> SZ can help account for situations when system latency is greater than the
> USB bus transmission latency.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>

Based on my previous request of always adding this for the Qualcomm
platforms that supports it, which is implemented in patch 4, I don't see
a need for this patch.

Am I missing something?

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 51235a9..8f532cb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2275,6 +2275,7 @@
>  				iommus = <&apps_smmu 0x140 0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
> +				tx-fifo-resize;
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  			};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
