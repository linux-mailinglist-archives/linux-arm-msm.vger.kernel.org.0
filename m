Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B22BA17CC8C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 07:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgCGGrt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Mar 2020 01:47:49 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52803 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgCGGrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Mar 2020 01:47:49 -0500
Received: by mail-pj1-f66.google.com with SMTP id lt1so2010441pjb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 22:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3XumrZ40MzFVU4HmZXprzdGg7Hog13O70eKaDAnf/CA=;
        b=FrKlxNxhxM2pEVmntVlgHSo3+W0adkc6KBMPJRU9msAvi6L6VP4QWw+3wbjv4D+GSY
         HcERtbV+BENclYI1TIl/J/Ehzj8hGe751BYTomSa5wQNN2Cunz8li8H57gWJ9XSEptoX
         NRYYIKBSzBvhX3NuCvw9ut+PxXmR35646GADwZti5UuspcOwkgzEFQSZAWg4fkXtN30d
         gMOtOte7Pv/7diwPliBp4HPC2sxeObOGCObfF/qjJu80qMtVTYOJjr/Z0Q6y/lqaO7Jp
         deKgE83j9D4pD9y3XNT1rhkFSmM8EE8cDadr96FYkeyDM1lptTdRW7ReHPAjHGpBipOB
         3Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3XumrZ40MzFVU4HmZXprzdGg7Hog13O70eKaDAnf/CA=;
        b=fxH/wttvi75asa/bmm9gv4Tc0REA1SKU7Hzeh0UbY4AAcDzDdRflNPeJT/GRumySwt
         otwHtYigDol3LDhscDbelMCi9UyVVYzuIU/5Zp8eu1ZgtKb0WcYgw3SsgRJ3M6q50Vx6
         zIPC2BCWeh743094H3Nmto62Z7KmgAlKVdXAenX1pTj7/v1iRAm4LNTJyFuK5GeZxdsZ
         41l6slprHPZ1XJCRhkpbp4HgkD54cqR/iF32s+M+GrnJ/WICCnv/qfbfSR25HVS3S/YS
         2PPugNOPrOqlA7icuEHkAY6x5oeU5eAPFNS0fyxcOI/iHJoN5xEoqEJfNkxWg5rPJhdQ
         iLMA==
X-Gm-Message-State: ANhLgQ3Mtd//Da4vUiQ5iCNIiB384XLshTtIBPO9S61DWnrwVerHhvw5
        mdiII+ziV/izxXxL+WuFC6qBSQ==
X-Google-Smtp-Source: ADFU+vsySmVLCRkawPc+B3e9/zIlDJRiq2vUEl3nAFCcJoHAgzWBSA5pwkkQYCQq42T95hI5vTt4DQ==
X-Received: by 2002:a17:90a:77c3:: with SMTP id e3mr7266802pjs.143.1583563668006;
        Fri, 06 Mar 2020 22:47:48 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f127sm86929pfa.9.2020.03.06.22.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 22:47:47 -0800 (PST)
Date:   Fri, 6 Mar 2020 22:47:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc7180: Enable SoC sleep stats
Message-ID: <20200307064744.GG1094083@builder>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
 <1583479412-18320-4-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583479412-18320-4-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Mar 23:23 PST 2020, Maulik Shah wrote:

> Add device node for SoC sleep stats driver which provides various
> low power mode stats.
> 
> Also update the reg size of aoss_qmp device to 0x400.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 253274d..b5b0f3f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1610,7 +1610,7 @@
>  
>  		aoss_qmp: qmp@c300000 {
>  			compatible = "qcom,sc7180-aoss-qmp";
> -			reg = <0 0x0c300000 0 0x100000>;
> +			reg = <0 0x0c300000 0 0x400>;
>  			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
>  			mboxes = <&apss_shared 0>;
>  
> @@ -1618,6 +1618,11 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		rpmh_sleep_stats@c3f0000 {
> +			compatible = "qcom,rpmh-sleep-stats";
> +			reg = <0 0x0c3f0000 0 0x400>;
> +		};
> +
>  		spmi_bus: spmi@c440000 {
>  			compatible = "qcom,spmi-pmic-arb";
>  			reg = <0 0x0c440000 0 0x1100>,
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
