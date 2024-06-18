Return-Path: <linux-arm-msm+bounces-23105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785290D68C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 17:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF7542859B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAADE200B7;
	Tue, 18 Jun 2024 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="FuDQ+uBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E53208A0;
	Tue, 18 Jun 2024 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723156; cv=none; b=VhCIaTgAs2k6u+62+UMnLn26605xXV0Ih4/n31i0AhUfK4z9qt9yX7TcfydVs81a2+1u3sBCRr/M8tDrzodYif6JXcUeKTDb5S4v1gLBSUc0/11V04rWitgVPfuCKZg3XZqLtES4yuOkTUXOSg3Nxrabtj2FJ7T/5KdsjH7V2A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723156; c=relaxed/simple;
	bh=xD6H5N5EA3hm3uG1dpUoMdkeBOh3n5ZJIZFUKP8qA+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImTJlTn7QPr8b7qrF+VERpl7f+59cdfAP2mUCDQhS7zI75XYOX3hqhs3iBNiAckWZjDrebndTDx+XEI0dWq3XDuyWb9sYMug2a7Xl2zHjwuv8QPi8IR/yk3lAMq/+Z6xVcxvGN9lfFSIA1fZRhxcXzEhdcufjYxpcy6uuy+1CkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=FuDQ+uBK; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: luca.weiss@fairphone.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1718723150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbRspr//u1/FN9+1Fqd4DR9tBkA4YUmT0KQo9IetTDM=;
	b=FuDQ+uBKOq/PfM+gGEVu45x3kJ2GXcYKk9LftMmPIUfxvhLL0Li686kQMIl2ucInAD8axa
	MkrJaT9VUMo6YvgKH8J8Sg6hBpvtRV8P/kDCdk/sdYg6+FSS3gzHt++fH+4bH6HMQxplb0
	WmAJlw2v1o9ymqUa5XSUCbuQ6m00raTW0R70BrOej2ArUmdILBkvsp/Scxldk9/UoscUQO
	yrlwk5WklPG5D5+7y0I9naZxpuksd2tWSI+VSJC9dBC6BVhoM3Cgot6nVx1hqCLjZcXuRB
	aQfccVtbrtDMslRsvMKqJqdshnSdba3XP8CICjCewrHEyN5Jx9tlOQfOScYvKQ==
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: amartinz@shiftphones.com
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: phone-devel@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <75c70d8d-500b-4707-a21a-a138742516fc@postmarketos.org>
Date: Tue, 18 Jun 2024 17:05:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-shift-otter: Name the
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
 <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 18/06/2024 15:30, Luca Weiss wrote:
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 35 ++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index e82938cab953..4667e47a74bc 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -235,46 +235,54 @@ regulators-0 {
>   		qcom,pmic-id = "b";
>   
>   		vreg_s1b: smps1 {
> +			regulator-name = "vreg_s1b";
>   			regulator-min-microvolt = <1840000>;
>   			regulator-max-microvolt = <2040000>;
>   		};
>   
>   		vreg_s7b: smps7 {
> +			regulator-name = "vreg_s7b";
>   			regulator-min-microvolt = <535000>;
>   			regulator-max-microvolt = <1120000>;
>   		};
>   
>   		vreg_s8b: smps8 {
> +			regulator-name = "vreg_s8b";
>   			regulator-min-microvolt = <1200000>;
>   			regulator-max-microvolt = <1500000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
>   		};
>   
>   		vreg_l1b: ldo1 {
> +			regulator-name = "vreg_l1b";
>   			regulator-min-microvolt = <825000>;
>   			regulator-max-microvolt = <925000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l2b: ldo2 {
> +			regulator-name = "vreg_l2b";
>   			regulator-min-microvolt = <2700000>;
>   			regulator-max-microvolt = <3544000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l3b: ldo3 {
> +			regulator-name = "vreg_l3b";
>   			regulator-min-microvolt = <312000>;
>   			regulator-max-microvolt = <910000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l6b: ldo6 {
> +			regulator-name = "vreg_l6b";
>   			regulator-min-microvolt = <1140000>;
>   			regulator-max-microvolt = <1260000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l7b: ldo7 {
> +			regulator-name = "vreg_l7b";
>   			/* Constrained for UFS VCC, at least until UFS driver scales voltage */
>   			regulator-min-microvolt = <2952000>;
>   			regulator-max-microvolt = <2952000>;
> @@ -282,66 +290,77 @@ vreg_l7b: ldo7 {
>   		};
>   
>   		vreg_l8b: ldo8 {
> +			regulator-name = "vreg_l8b";
>   			regulator-min-microvolt = <870000>;
>   			regulator-max-microvolt = <970000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l9b: ldo9 {
> +			regulator-name = "vreg_l9b";
>   			regulator-min-microvolt = <1200000>;
>   			regulator-max-microvolt = <1304000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l11b: ldo11 {
> +			regulator-name = "vreg_l11b";
>   			regulator-min-microvolt = <1504000>;
>   			regulator-max-microvolt = <2000000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l12b: ldo12 {
> +			regulator-name = "vreg_l12b";
>   			regulator-min-microvolt = <751000>;
>   			regulator-max-microvolt = <824000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l13b: ldo13 {
> +			regulator-name = "vreg_l13b";
>   			regulator-min-microvolt = <530000>;
>   			regulator-max-microvolt = <824000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l14b: ldo14 {
> +			regulator-name = "vreg_l14b";
>   			regulator-min-microvolt = <1080000>;
>   			regulator-max-microvolt = <1304000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l15b: ldo15 {
> +			regulator-name = "vreg_l15b";
>   			regulator-min-microvolt = <765000>;
>   			regulator-max-microvolt = <1020000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l16b: ldo16 {
> +			regulator-name = "vreg_l16b";
>   			regulator-min-microvolt = <1100000>;
>   			regulator-max-microvolt = <1300000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l17b: ldo17 {
> +			regulator-name = "vreg_l17b";
>   			regulator-min-microvolt = <1700000>;
>   			regulator-max-microvolt = <1900000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l18b: ldo18 {
> +			regulator-name = "vreg_l18b";
>   			regulator-min-microvolt = <1800000>;
>   			regulator-max-microvolt = <2000000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l19b: ldo19 {
> +			regulator-name = "vreg_l19b";
>   			regulator-min-microvolt = <1800000>;
>   			regulator-max-microvolt = <2000000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> @@ -353,96 +372,112 @@ regulators-1 {
>   		qcom,pmic-id = "c";
>   
>   		vreg_s1c: smps1 {
> +			regulator-name = "vreg_s1c";
>   			regulator-min-microvolt = <2190000>;
>   			regulator-max-microvolt = <2210000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_s9c: smps9 {
> +			regulator-name = "vreg_s9c";
>   			regulator-min-microvolt = <1010000>;
>   			regulator-max-microvolt = <1170000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l1c: ldo1 {
> +			regulator-name = "vreg_l1c";
>   			regulator-min-microvolt = <1800000>;
>   			regulator-max-microvolt = <1980000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l2c: ldo2 {
> +			regulator-name = "vreg_l2c";
>   			regulator-min-microvolt = <1800000>;
>   			regulator-max-microvolt = <1950000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l3c: ldo3 {
> +			regulator-name = "vreg_l3c";
>   			regulator-min-microvolt = <3000000>;
>   			regulator-max-microvolt = <3400000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l4c: ldo4 {
> +			regulator-name = "vreg_l4c";
>   			regulator-min-microvolt = <1620000>;
>   			regulator-max-microvolt = <3300000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l5c: ldo5 {
> +			regulator-name = "vreg_l5c";
>   			regulator-min-microvolt = <1620000>;
>   			regulator-max-microvolt = <3300000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l6c: ldo6 {
> +			regulator-name = "vreg_l6c";
>   			regulator-min-microvolt = <1650000>;
>   			regulator-max-microvolt = <3544000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l7c: ldo7 {
> +			regulator-name = "vreg_l7c";
>   			regulator-min-microvolt = <3000000>;
>   			regulator-max-microvolt = <3544000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l8c: ldo8 {
> +			regulator-name = "vreg_l8c";
>   			regulator-min-microvolt = <1620000>;
>   			regulator-max-microvolt = <2000000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l9c: ldo9 {
> +			regulator-name = "vreg_l9c";
>   			regulator-min-microvolt = <2700000>;
>   			regulator-max-microvolt = <3544000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l10c: ldo10 {
> +			regulator-name = "vreg_l10c";
>   			regulator-min-microvolt = <720000>;
>   			regulator-max-microvolt = <1050000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l11c: ldo11 {
> +			regulator-name = "vreg_l11c";
>   			regulator-min-microvolt = <2800000>;
>   			regulator-max-microvolt = <3544000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l12c: ldo12 {
> +			regulator-name = "vreg_l12c";
>   			regulator-min-microvolt = <1650000>;
>   			regulator-max-microvolt = <2000000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l13c: ldo13 {
> +			regulator-name = "vreg_l13c";
>   			regulator-min-microvolt = <2700000>;
>   			regulator-max-microvolt = <3544000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_bob: bob {
> +			regulator-name = "vreg_bob";
>   			regulator-min-microvolt = <3008000>;
>   			regulator-max-microvolt = <3960000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> 

