Return-Path: <linux-arm-msm+bounces-73627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCAB58CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 06:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1074C4843E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C213C29A9F9;
	Tue, 16 Sep 2025 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol7u3fui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B48248B;
	Tue, 16 Sep 2025 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757995723; cv=none; b=sot760H/d7CzpcMYGAMEmrTScxvs8Iir3przN+aCZlB+uWgRYCPnGD6DcSO5iFTMHsnD2JDiS7tnwz9foOHpx3a2J3ORHhcCd4u+sqv6OIAjCo689fmF2Jv/dvdjmLtYD36NFK31dEGujMyMB75aBmaa4U8Av9JIrzL1nkTZZJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757995723; c=relaxed/simple;
	bh=RKlBUMEmah/S4UwmVeB7EGIXLIhiwyPctDOINOzxFEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJB2RtWHLUn8Q0gd66sIdMsRIknfMc+fe7w+G/LWPYx12EDXhTVuEmiiFJDFA4G8niKlGC0F36mFXL4XcKYOA+tnBI5eE1CUtkRhHbcf+hit/e5s03UTplAupaGRIr7qTLdMr9QJBhlfeO3yqe81rPw9ywFTxOG3u2tTVJVxrDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol7u3fui; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49F1C4CEEB;
	Tue, 16 Sep 2025 04:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757995723;
	bh=RKlBUMEmah/S4UwmVeB7EGIXLIhiwyPctDOINOzxFEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol7u3fui3NNLUyBKBcHAiqvESbKOMj5HTE6VDCjwVyqAiZMdR04X/2khyjcGO0ocT
	 yxrsIuuuQ7/xyb93faJsetShuvM/uQVO+YY3r4WSDi4MU/ikxx/1+ZA9Tkjsbyn787
	 is0N6f+BEgGTHlKHXow4YmWeZ7bfEA3vo1BwY5ewxz5ai/cWIGKgAWwyjsFGgRVrUj
	 Rk2gfaQj7LDUC8JSvpnryaaYkAfs8r03u7ign3CdNt5Ya6mVOEcJ8/9BgeiUpAPnlB
	 oZ48RARyxE1BwaJQtIiVhOwb8n47JOhqCpiz2OZVK271eqKBut3UKPREPK62bdQdvU
	 DGY7Xwtk8rz1Q==
Date: Mon, 15 Sep 2025 23:08:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490: Introduce the Particle
 Tachyon
Message-ID: <zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <20250910-tachyon-v1-3-5090bfd133e0@oss.qualcomm.com>
 <ec31257b-fe10-4de7-8fb6-d649677f680e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec31257b-fe10-4de7-8fb6-d649677f680e@oss.qualcomm.com>

On Fri, Sep 12, 2025 at 01:13:17PM +0200, Konrad Dybcio wrote:
> On 9/11/25 1:05 AM, Bjorn Andersson wrote:
> > The Particle Tachyon is a single board computer with 5G connectivity
> > with AI accelerator, based on the Qualcomm QCM6490 platform.
> > 
> > Introduce the board, with support for UFS, USB, USB Type-C PD and
> > altmode (DisplayPort), GPU, charger/battery status, PCIe shield,
> > SD-card, and remoteprocs.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&activity_led_state>;
> 
> property-n
> property-names
> 
> is preferred, file-wide (you currently have a mixture)
> 
> [...]
> 
> > +
> > +&i2c1 {
> > +	status = "okay";
> 
> This likely results in a "falling back to 100 KHz" warning/notice,
> please specify the bus speed explicitly
> 
> [...]
> 
> > +&mdss_dp_out {
> > +	data-lanes = <0 1>;
> 
> Is 2 lanes a hw limitation?
> 

[   20.947242] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* max v_level reached
[   20.955002] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link training #1 on phy 0 failed. ret=-11
[   20.964702] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link training on sink failed. ret=-11

I believe I saw the same problem on Rb3Gen2. Do we know if there's any
sc7280 that has working 4-lane DP, or are we perhaps missing something
in the PHY sequences?

Regards,
Bjorn

> [...]
> 
> > +&pmk8350_rtc {
> 
> I see no reason for RTC not to be enabled by default
> 
> [...]
> 
> > +&pon_pwrkey {
> 
> Same here> +	status = "okay";
> > +};
> 
> 
> > +&uart7 {
> > +	/delete-property/interrupts;
> 
> /delete-property/(space)interrupts, please
> 
> (yes we desperately need a formatter)
> 
> [...]
> 
> > +&usb_1_qmpphy {
> > +	vdda-phy-supply = <&vreg_l6b_1p2>;
> > +	vdda-pll-supply = <&vreg_l1b_0p912>;
> > +
> > +	orientation-switch;
> 
> This is specified in the SoC DTSI
> 
> [...]
> 
> > +&usb_dp_qmpphy_dp_in {
> > +	remote-endpoint = <&mdss_dp_out>;
> > +};
> 
> And so is this link
> 
> > +
> > +&usb_dp_qmpphy_out {
> > +	remote-endpoint = <&pmic_glink_ss_in>;
> > +};
> > +
> > +&usb_dp_qmpphy_usb_ss_in {
> > +	remote-endpoint = <&usb_1_dwc3_ss>;
> > +};
> 
> And this one
> 
> Konrad

