Return-Path: <linux-arm-msm+bounces-43649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3465D9FE72E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239EA1880459
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFF71A76BC;
	Mon, 30 Dec 2024 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz9H2CMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419918870F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735569257; cv=none; b=qpUs5tgUKQtxAXmJI4DyiVY2W3oy/PMKgk4bbI4zjiFlr7VcTNH8zFXGXys6Rx4p/31zbFrdSELH6bGcp42vLJu8n4kaOBRNIBhQqm+RWanVmtASclTvr4r5+Qd80YhFbvmsN7pk7wR1byuiAoSlGQQK8tpUtNTZyW4jkV3pqd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735569257; c=relaxed/simple;
	bh=/OZOIiHfOgqtrL+6R2DWCp/BnIlHFzCQGOutMDwjn/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4ciuAGPujjV2p36rF82Cm9BTUCIx1IKm88jlDkeXndnOFHwFmVDXhg6EoH1KbxS4EhpguIaSkmNGPVJyf64BNsfcy7d6WkUHWJoXCmPJlVInANH/6RLD3mYAUcdCWbYQbYqkAGlm0j6Z3SsH7AsSFYcMQtJSn+zyKQFMC64w1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz9H2CMt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU7Fu96027215
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2r1z1SJ0ITksMt9LsqubVRDiVDF1gkZyhC4tRCFwQFk=; b=Lz9H2CMtHffX3DNM
	zjS6xYK4Lnr6GnNhh2V+8MHPy+00JeSuvfq/aNAdLe/JUDNpmYKImG9JDXnlOpDR
	elK7mZ4DgoC8cJVM8TG/+hsRai6WOjOrnIZ9wj0vZAyOhzC4TVOeVjdvQxkQu429
	wtCl0yie/7PzlLaMhvU4ArBkyjoB0DwobvW8eme4qfKul2N/4bFqiygBJZXhzsVe
	UjVmVWlFiEJXTCj7ofMnC0AQDCgvaJsSzRx6NRv5OYm9pYZrG2yt0kBDs2sOFQjk
	/bRSR3XrCTtd/+Tp4dLpwyVnV48lYjzLgWZxKahqfqhn8D1+mtMuiPam/ToScVoN
	zbFodg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43upyr8vh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:34:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467975f1b53so24977781cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735569254; x=1736174054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r1z1SJ0ITksMt9LsqubVRDiVDF1gkZyhC4tRCFwQFk=;
        b=r3+Dff/3fs/J/D3Gb0VmvWPH6SdSguVdcXF0H5ClZKjsZjaSjKyEa5i/ZfOiOHFakm
         Txok7CQ+Dm3F5U+mdMyz7pfLFcISRg8MdgbQNeGH8BkcOeYsWWp8A7tms+afXpNkhDRq
         3nDgS8BLNNTL4WxpXkmJj34afDGqP2cLz4daZnBYiKm5uik/rnwxOVTCJqPxangigFC4
         H/VPkT7KGNWUOcuw53bEMMcXO46pEOnQU15jMF8vUh4vHw7WIRr4Z3GKhyyy3gtBRbdB
         m0k5jxa3PXIyv1fuGSevs5eUumuvlhdW3PCZ2xvT4in2ZXQ33dGBuykMkaGIYsiEW6kU
         YdMw==
X-Gm-Message-State: AOJu0Yzz9n9B4DFZdf4XKHmjYKN1ix4LerQpZhzGw4PB5c+MTcJEjcwz
	Kx2lHw/JsOY55xflQuL/sneE9seM80fVKWxqU+2RruvSfr6FB1hm5NUszldJXYeIGSEAYHhlU7v
	zkb3fJUKdGqJNhZRXDtSRRMLwnrjao7Grl1VBdyrRfevvSXXh8R5IPu0j7rog4v0N
X-Gm-Gg: ASbGncu9jAn+I5cim+PbgnKP3/8z4hGc03biUDtWt6NjGABNg8H40+ELuWuAnOGRn0G
	lTdXBmFh4qG1YzjbedIdeNq2UVXXafe7VpHf913KUeALcNbIKtlUjyqkDsNsqPGxXNg+aAhnROM
	WgrhFNiev2wb4RLpXXm/gPyECp7ebMWfRoSnGbQTy16OEnQ/pO0vNGhVILjeUTuh2J3CKFHItpY
	oadvvZ0YdqztUvL5Ty4APrXqUkRPlD88/V4Ss/0BQm15MqHkWu7vt38Znr3k2LOTO4K/OWDrb4K
	hLstfSd5FLZWlV7zDmUQxG6+FPjJij5wVt8=
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr224253891cf.10.1735569254174;
        Mon, 30 Dec 2024 06:34:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaJBNseNxrUEyERjucbatWq4SoQcqxRjxIXX5/6Qg5Q0MI6fjFq8upab7vFJb34lVtzHnCLA==
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr224253731cf.10.1735569253816;
        Mon, 30 Dec 2024 06:34:13 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701c94csm14738764a12.85.2024.12.30.06.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:34:12 -0800 (PST)
Message-ID: <85d6703c-ffd2-4a57-93f2-db00f054a864@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:34:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
 <20241226-dts_qcs8300-v2-1-ec8d4fb65cba@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241226-dts_qcs8300-v2-1-ec8d4fb65cba@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gJqL-YUmpdT3grODnmLCHg1eRlHts0cz
X-Proofpoint-ORIG-GUID: gJqL-YUmpdT3grODnmLCHg1eRlHts0cz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300125

On 26.12.2024 11:43 AM, Yongxing Mou wrote:
> Add devicetree changes to enable MDSS display-subsystem,
> display-controller(DPU), DisplayPort controller and eDP PHY for
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 204 +++++++++++++++++++++++++++++++++-
>  1 file changed, 203 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 80226992a65d867124b33dfa490c3c9ca1030c75..8d88fe4a266432f05192d7ef0dd80362bdbdab85 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -952,6 +952,206 @@ camcc: clock-controller@ade0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,qcs8300-mdss";
> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem",
> +					     "mdp1-mem",
> +					     "cpu-cfg";

Only the CPU path should be ACTIVE_ONLY, the rest should be
QCOM_ICC_TAG_ALWAYS

> +
> +			resets = <&dispcc MDSS_DISP_CC_MDSS_CORE_BCR>;
> +
> +			power-domains = <&dispcc MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +			clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc MDSS_DISP_CC_MDSS_MDP_CLK>;

Please align the property order with x1e80100.dtsi

[...]

> +			mdss_dp0_phy: phy@aec2a00 {
> +				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
> +
> +				reg = <0x0 0x0aec2a00 0x0 0x19c>,
> +				      <0x0 0x0aec2200 0x0 0xec>,
> +				      <0x0 0x0aec2600 0x0 0xec>,
> +				      <0x0 0x0aec2000 0x0 0x1c8>;
> +
> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
> +				clock-names = "aux",
> +					      "cfg_ahb";
> +
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;

The PHYs generally sit on a MX-like rail, please verify this

Konrad

