Return-Path: <linux-arm-msm+bounces-84029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539AC9A0E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 06:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F8534E2745
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 05:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4B02F690F;
	Tue,  2 Dec 2025 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3l4rGvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C812F549E;
	Tue,  2 Dec 2025 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764652518; cv=none; b=ejguh9SACGfWgVAykqBhLDo9ZM5OstSzA0HkikD0wbEdJccfm7RaqsFiuUStAt9GYzQsRKUY7QLW7+/yMf7scDkT04XRjNf/C4dO52Qc65o8i8wxC0FkLyOKnX2RgDZ517Vch+8V3qQBKIOMzKDWsGEBcaQqBtcNI8jehkByxxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764652518; c=relaxed/simple;
	bh=TBql347zRBUolY5tjSQJUadKcvbybIBvP0WJuiVfEzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQ1tHZKhuhIXPiAYkmmRxb2p8ahsfWiXQKv2RB24yAriqXbox9tDmkp9rhTM4J3xWOLCXaXk9+lOaBmz66aKT4VFIlTjF6NItGyfzrJ8Bs+V+Tl3YvTPGmA+hwTcAAawHLm512JfM8fZqUO7V7Z2knq6uvSfKpi3oT+9jlAN0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3l4rGvc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F83C4CEF1;
	Tue,  2 Dec 2025 05:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764652518;
	bh=TBql347zRBUolY5tjSQJUadKcvbybIBvP0WJuiVfEzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3l4rGvcTFn7JnyDSoY2MXWfU4yAddRH+rI1ZDwaDrJovNOgRy5RVXw8fKs+UUxg+
	 oGl3iAzUHREiaecRISBWAtFyxH1qgENRsz5zSvwezs/GM1I2Prcw6b+eZ8l/Rlmg7x
	 5lCLWz94U7+GQnarY/fDR7mhCHXU1UaTMRMOmP5IfLn2VngBt9nbDwGtRAqgScvoKh
	 73UbiFIyAZMpPMava7ybnhV5uqPGJ1mhdkydCS6lzsrNNZz5OU+Zjq4olSW+AoZiQq
	 crTG33Wn5FYW1o7FuQdw68Sk2kqGxofqQSSxfusCXWMABvOOKqBPxdo57fURneY0eD
	 Im3RWN4Nw72ww==
Date: Mon, 1 Dec 2025 23:21:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sriram Dash <sriram.dash@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com, 
	krishna.kurapati@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
Message-ID: <cwtbvgoljjqfvuktwlnnsnroa4jj7m6l63yq6t34hccs4wa6xp@mggosrleq7vl>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
 <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>

On Thu, Nov 27, 2025 at 04:01:45PM +0530, Sriram Dash wrote:
> Add support for firmware-managed resource states in the
> Qualcomm DWC3 USB controller driver. On platforms
> like sa8255p, where controller resources are abstracted
> and managed collectively by firmware, the driver communicates
> power management transitions using dedicated resource state
> levels via dev_pm_opp_set_level().
> 
> Macros are introduced to represent key lifecycle events:
> initialization, system and runtime suspend/resume, and exit.
> The driver sets the appropriate resource state during probe,
> remove, suspend, and resume operations, enabling bulk ON/OFF
> transitions of grouped resources according to the
> controller's operational state.
> 
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 97 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 88 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9ac75547820d..9615ca6cfcae 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -13,6 +13,8 @@
>  #include <linux/kernel.h>
>  #include <linux/interconnect.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
> @@ -85,10 +87,48 @@ struct dwc3_qcom {
>  	struct icc_path		*icc_path_apps;
>  
>  	enum usb_role		current_role;
> +	bool			fw_managed;
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>  
> +/*
> + * QCOM DWC3 USB Controller: Firmware-Managed Resource State Levels
> + *
> + * On select Qualcomm platforms, the USB controller’s power-related
> + * resources including GDSC, reset lines, clocks, and interconnects
> + * are managed collectively by system firmware via SCMI. The driver
> + * signals the controller’s operational state to firmware using these
> + * levels, each mapped to a specific power management transition or
> + * lifecycle event:
> + *
> + * DWC3_QCOM_FW_MANAGED_INIT

Both power and performance states are typically...states...
But these are actions/transitions between states.


The purpose of doing firmware assisted resource management (like done in
ACPI) is that it abstracts away the power management aspects from the OS
implementation, here we instead seems to complicate the OS
implementation.

> + *	Enable GDSC, Assert and Deassert Resets, and turn ON all clocks
> + *	and interconnects.
> + *
> + * DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME
> + *	Enable GDSC and turn ON all clocks and interconnects.
> + *
> + * DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME
> + *	Turn ON all clocks and interconnects.
> + *
> + * DWC3_QCOM_FW_MANAGED_EXIT
> + *	Turn OFF all clocks and interconnects, Assert reset and disable GDSC.
> + *
> + * DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND
> + *	Turn OFF all clocks and interconnects and disable GDSC.
> + *
> + * DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND
> + *	Turn OFF clocks and interconnects.
> + */
> +
> +#define DWC3_QCOM_FW_MANAGED_INIT			1
> +#define DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME		2
> +#define DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME		3

Given that dwc3_core_probe() calls pm_runtime_forbid(), do we actually
hit these states, or are you in practice only hitting some "D0" and "D3"
states?

Could this be simplified to match what we would need here for an ACPI
system?

Regards,
Bjorn

> +#define DWC3_QCOM_FW_MANAGED_EXIT			8
> +#define DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND		9
> +#define DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND		10
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -335,7 +375,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup, pm_message_t msg)
>  {
>  	u32 val;
>  	int i, ret;
> @@ -348,6 +388,13 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>  			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>  	}
> +	if (qcom->fw_managed) {
> +		if (PMSG_IS_AUTO(msg))
> +			dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND);
> +		else
> +			dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND);
> +	}
> +
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
>  	ret = dwc3_qcom_interconnect_disable(qcom);
> @@ -369,7 +416,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup, pm_message_t msg)
>  {
>  	int ret;
>  	int i;
> @@ -380,6 +427,18 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);
>  
> +	if (qcom->fw_managed) {
> +		if (PMSG_IS_AUTO(msg))
> +			ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME);
> +		else
> +			ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME);
> +
> +		if (ret < 0) {
> +			dev_err(qcom->dev, "Failed to Resume fw managed device\n");
> +			return ret;
> +		}
> +	}
> +
>  	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>  	if (ret < 0)
>  		return ret;
> @@ -624,10 +683,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	qcom->dev = &pdev->dev;
>  
> +	qcom->fw_managed = device_get_match_data(dev);
> +	if (qcom->fw_managed) {
> +		ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_INIT);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>  	if (IS_ERR(qcom->resets)) {
> -		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> -				     "failed to get resets\n");
> +		dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> +			      "failed to get resets\n");
> +		goto resources_off;
>  	}
>  
>  	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
> @@ -638,7 +705,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	ret = reset_control_assert(qcom->resets);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
> -		return ret;
> +		goto resources_off;
>  	}
>  
>  	usleep_range(10, 1000);
> @@ -727,6 +794,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  clk_disable:
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
> +resources_off:
> +	if (qcom->fw_managed)
> +		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
> +
>  	return ret;
>  }
>  
> @@ -739,6 +810,10 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  		return;
>  
>  	dwc3_core_remove(&qcom->dwc);
> +
> +	if (qcom->fw_managed)
> +		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
> +
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  	dwc3_qcom_interconnect_exit(qcom);
>  
> @@ -756,7 +831,7 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, wakeup, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>  
> @@ -772,7 +847,7 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, wakeup, PMSG_RESUME);
>  	if (ret)
>  		return ret;
>  
> @@ -809,7 +884,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, true, PMSG_AUTO_SUSPEND);
>  }
>  
>  static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -818,7 +893,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, true, PMSG_AUTO_RESUME);
>  	if (ret)
>  		return ret;
>  
> @@ -839,6 +914,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>  };
>  
>  static const struct of_device_id dwc3_qcom_of_match[] = {
> +	{
> +		.compatible	= "qcom,snps-dwc3-fw-managed",
> +		.data		= (void *)true,
> +	},
>  	{ .compatible = "qcom,snps-dwc3" },
>  	{ }
>  };
> 
> -- 
> 2.34.1
> 

