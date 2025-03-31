Return-Path: <linux-arm-msm+bounces-52859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E753A76081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697843A8858
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 07:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B171D61BC;
	Mon, 31 Mar 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM/pd9GY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C981D5CC2;
	Mon, 31 Mar 2025 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407422; cv=none; b=MZsYuTzu9cbQq9KixQ2AvKNbZRBhm24/hM/UDnEBf95soEFDhUnIMIPa4HJ8e0OagCNe8lZ6GHAg0nYrPbbDGA0jtQxWaZPca/KUMX4jL1iZyvsI7F+acWGzyFhnhhluxw+5UqvLlXpZrwPqcGSUocUxEY3pmMQ+XHhCX9ly+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407422; c=relaxed/simple;
	bh=prYw5u8aOVdWtVy6m/f9wz2b6yIFj/X4vl/CDi7qjyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL+PzlE3Mb4zuHHfiEyUWIud+aRx5CvFSPZyG/H1+VEC6s9f8nA+zO/y6ELlihf/Zu41WeRX3t7H6nLK06jxjPuqPihdQuMypby4Ik9E4+zikp5DkCKOR2nVh5peMm120nvQybpUhL+zHc5vZiCqnhSnVEEarpOJpUOBBhPVXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM/pd9GY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6366C4CEE3;
	Mon, 31 Mar 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743407421;
	bh=prYw5u8aOVdWtVy6m/f9wz2b6yIFj/X4vl/CDi7qjyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AM/pd9GYteRQlJHH/4X+M0M8nhgTeNEfVSpqgsbbU5wiwkmMPlyVTd8bLxqEmRFPA
	 4lcFyj0NdCqddz2tPlng2UW+ZkqHQ7ft6RKN6Z8NrjawnLDfNbDzz1JbEk+001y7bW
	 cgz0/f3YJRN3QfcvpffdtzpVomt7JntgcUSbeUC1xR2cRLZWAqujDuzFtGpNiAeW3Q
	 mXLrwE6TxaxDk6h3898Tk1UBLaqBFOCIJdKn/5URXjlXyMdmmuqxrmfp6TMfo5GT1b
	 PPHYRRdy/ZucFP7tgDqFLY+5hTH28fwsLQm4Z48NUkMwPNya62eDQzlpFRTCd9P0OW
	 JKlXVaiCG+0Eg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tz9uZ-00000000574-2xYS;
	Mon, 31 Mar 2025 09:50:23 +0200
Date: Mon, 31 Mar 2025 09:50:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
Message-ID: <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>

On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO property is used in
> both the OLED and LCD models which inherit this device tree.

AFAICT, this patch is not correct as the hotplug detect signal is
connected directly to the display controller on (these) Qualcomm SoCs
and is already handled by its driver.

Describing it as you do here leads to less accurate delays, see commits:
	
	2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
	3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")

Perhaps you lose some other functionality too.
 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -980,8 +980,12 @@ &mdss_dp3 {
>  	aux-bus {
>  		panel: panel {
>  			compatible = "edp-panel";
> +			hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
>  			power-supply = <&vreg_edp_3p3>;
>  
> +			pinctrl-0 = <&edp_hpd_n_default>;
> +			pinctrl-names = "default";
> +
>  			port {
>  				edp_panel_in: endpoint {
>  					remote-endpoint = <&mdss_dp3_out>;
> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
>  		bias-disable;
>  	};
>  
> +	edp_hpd_n_default: edp-hpd-n-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};

I checked the firmware configuration for this pin on my T14s, which
does not match what you have here. Instead the function is set to
"edp0_hot" which forwards the signal to the display controller which
already handles the signal on panel power on. (And there is also no
internal pull up enabled).

We may want to describe this pin configuration somewhere, but that's a
separate issue.

Johan

