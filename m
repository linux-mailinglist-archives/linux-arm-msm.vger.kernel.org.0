Return-Path: <linux-arm-msm+bounces-50525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F23A54CAF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534F93AE935
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8126F1304BA;
	Thu,  6 Mar 2025 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="KlzG7U7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F2523A9;
	Thu,  6 Mar 2025 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269376; cv=none; b=Y3pZZYTy3Mdq2ifqxu2vp1tKWH8LaLhIRcUoQdUHz698wKtQK0+2euMa4nae5Wlnll/yrGZlk43DI255SMVeELo89UAnrT8th66ddhBe5FwJxHVqsRqhSVkzciv0D1lNbh+f5dABLV0p4e/HENyAIPzDG0eJy3spSS3g95z4veM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269376; c=relaxed/simple;
	bh=+Pimst16aPdCxGYqUpJuW6UMGnHrJPBhkR8LtjurZn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkDgZj4vhpV2dFI3t4mzs/MKbWA5aIpR4W88TK2cudSuw7OEt65XkRmD6j0vNb3u4A5pDJq4+s4rZh7ONE/49nPs4+pG1GmIuRXLuKaQzkFf7v5haF77qyFbwgXwequFZjP89RlhrDmzoHvGbWOIISNITtGgjDCgua5s6dlrHgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=KlzG7U7s; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A61292FC0048;
	Thu,  6 Mar 2025 14:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741269370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bQXDLdPVD7kCqCo4PQ87J+ynI5NxAEe/Nqs7CoZ62A=;
	b=KlzG7U7snk/0gtQgGXFwiDkx1Z0tlRKxaigeNF7+c/LY/I4qeOOFP/t3Xha6GGVzGF9uYi
	TzBCa15UxdWoQi5Jj8KUljJYif0ytUJho1MDGaNs4pEkrZIuCz0xP6TL9J5v9DeCQ7jmd0
	V4b2bpGJiGd82ZJ+yayxWdvP9TX+p7Q=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <d98ad83e-6479-4453-bd1d-4f3703b0dad2@tuxedocomputers.com>
Date: Thu, 6 Mar 2025 14:56:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, wse@tuxedocomputers.com,
 cs@tuxedocomputers.com
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <75c17309-3072-4321-ab15-69d60190f2f7@kernel.org>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
In-Reply-To: <75c17309-3072-4321-ab15-69d60190f2f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Am 06.03.25 um 13:41 schrieb Krzysztof Kozlowski:
...
> 
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also `scripts/checkpatch.pl --strict` and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

Thank you for the advice and the offer to answer further questions.
Didn't know that dtb_check exists.

> ...
> 
>> +
>> +       eusb3_repeater: redriver@47 {
>> +               compatible = "nxp,ptn3222";
>> +               reg = <0x47>;
>> +               #phy-cells = <0>;
>> +
>> +               vdd1v8-supply = <&vreg_l4b_1p8>;
>> +               vdd3v3-supply = <&vreg_l13b_3p0>;
>> +
>> +               reset-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
>> +
>> +               pinctrl-0 = <&eusb3_reset_n>;
>> +               pinctrl-names = "default";
> 
> No graph? Isn't it needed?

What do you mean by ‘no graph’?

>> +       };
>> +
>> +       eusb5_repeater: redriver@43 {
>> +               compatible = "nxp,ptn3222";
>> +               reg = <0x43>;
>> +               #phy-cells = <0>;
>> +
>> +               vdd1v8-supply = <&vreg_l4b_1p8>;
>> +               vdd3v3-supply = <&vreg_l13b_3p0>;
>> +
>> +               reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>> +
>> +               pinctrl-0 = <&eusb6_reset_n>;
>> +               pinctrl-names = "default";
>> +       };
>> +
>> +       eusb6_repeater: redriver@4f {
>> +               compatible = "nxp,ptn3222";
>> +               reg = <0x4f>;
>> +               #phy-cells = <0>;
>> +
>> +               vdd1v8-supply = <&vreg_l4b_1p8>;
>> +               vdd3v3-supply = <&vreg_l13b_3p0>;
>> +
>> +               reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
>> +
>> +               pinctrl-0 = <&eusb6_reset_n>;
>> +               pinctrl-names = "default";
>> +       };
>> +
> 
> Stray blank line

Sorry. Will fix this.

>> +};
>> +
>> +&mdss {
>> +       status = "okay";
>> +};
>> +
> 
> 
>> +
>> +&usb_1_ss0_dwc3_hs {
>> +       remote-endpoint = <&pmic_glink_ss0_hs_in>;
>> +};
>> +
>> +&usb_1_ss0_qmpphy_out {
>> +       remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +};
>> +
> 
> Here as well

Same here.

Regards,
Georg

