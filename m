Return-Path: <linux-arm-msm+bounces-58745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D670DABE077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E98298A44BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E32D26FA7D;
	Tue, 20 May 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFmbxmKu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F8269CFA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757849; cv=none; b=j4A6zeYHO29ZwF4FrElvM4DudCMrBvTJ4cJZf4Uwv9neW4M7nyrdJh/ZSMo+yrV9uGDs8S+5Uglns39wH/WfxRZaOiPWMxv+87nxY8IiohMvgvgSYnT3tN6EQhjpiJQ4o5zZNr+jkreuhVfTY2L3kftobwKZelx9m5rsV3LlrAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757849; c=relaxed/simple;
	bh=eo2ll8aZP6fB5Qmh625oasg94Q1ESOBYvDMW/Yk3xZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqbOD4hJAAc5ho6tXTCZN7zovBzPeLUe9p6tOZ+XeBFrRrEYbFD7bEvSd6GxHZg96FEHw/XUCXvrsodxv8bqn1VNNQ+q7cJ6IVJijj+r710cD51XRnDZ3+5LEIrN+uFME6Vbqx29b0y/qJhQ9O7cYkWghleiMWpMsglaVEIsauo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFmbxmKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrveh011868
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5DHEtpnOzGMRu3IyuKVwLv2uJQf2egjT6GFT5/7JmE=; b=nFmbxmKuKf0MajPi
	nbZFKIDahCZZWjKC4o4z+C+7Uwtmbo5b8w03GI+Qci8WtxU3iiW1jVPgVT59J7h6
	FWmXZ2yXvrk9ZUn/1klNHUtOQLeT107IQiAunmnZfX/0078ASXFr+kGPLt5kgsUG
	LrEMTczuuMupPVwEQlxkZopsAdRlPDAFlzqmih3Smh05TVZ9PUBXMRb1lPKQ+/FT
	wShnPkPJr/vpG5NAmSgoM8P3wU2wsJyuDAHrnXLlESkJ2sX10ejLo86/0D/yYbNz
	Hr3FSNyz2zqlBiG6Zs8fW8rkoQUpvO89MujXGK37ye+4a1TRwHESZF42HIUQWhEj
	23DJ1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyujk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:17:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so7450776d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757844; x=1748362644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5DHEtpnOzGMRu3IyuKVwLv2uJQf2egjT6GFT5/7JmE=;
        b=AIQ7bhNXfb9OsJJKZa/UCxPi32vngS3DmVlmfp0lopkfTdvkXJhS4I8hLP2OO/1ahx
         rTsez3dKKVJ1WoMbsowR4R1MzAW9DWoIQ0ao8SzPGBFVN2Tn5NBrTOChI68abYXMWxSL
         kZEUnZy7HLeHkt9ezxx6go253t7XKLL0rJgI/E0IlHKlnjXlvmUbevnZMoV1eZKAcXNl
         WieUaZSRrxSSwzByiKyn0wlFfUXicARJMB1SMK9LmkzE1DZwNvuzr9HBc2HwAaJqKe/f
         rxlhdlu9yAKG+FQ/4EgtlK28fIEpyT3IitX4oQqU9sOyuXlMXKAQCVx/vdMcLuaNLVbs
         F7JQ==
X-Gm-Message-State: AOJu0Yz2smFTrxzTbWHw/iiQz0Oh+NKtThrMiCqZlhEfP1IIpT+cPqBy
	tllh6O4kRUQ6cTr6lNZW+3sV9CV4o1mdOnsYUiKv9LtwuCOq/IrqYJObav8BFzpKSsi5nfNzrmg
	7v7reOYbo/7p0d94fZjUSRAMp4inCXBOzuTpCOaOSRz2ah9SMGJB3KnzVxxcOjBYVaTg5
X-Gm-Gg: ASbGncvE30Df0YnJwngQ0ePeiStF+yLWBPi7Ap1qW3rOMXO+9m8JEbsxXlrHsHrG/P0
	/QCLYjKqgjafhCOGD5VEbPykP0YeuBwAF2aOsB+O5om3kX9jeaoj8FhOAqFvlc0qI/PwrFHqzjw
	o6Bgo/ZWZXaZ+Fk+dArl/0ThftV46pEt5JTeGHHjkpcKIjc8I0UJASHenIJjNeAkDImkz/8yUg+
	lQSNkgEXkM860dMl8HVbQJWQH0d/WNTckqRekLQqN4gSaUG5pDCjJt8U4Xl1PeaHmu3e04WHizF
	5URelxUdjvFTrg/0SsbY70OgJn9ONJQFyv5reyrkLnd1++VHOI0kYOv6dH3lQ02zbQ==
X-Received: by 2002:a05:6214:c67:b0:6f8:4719:c2 with SMTP id 6a1803df08f44-6f8b096f394mr86190716d6.11.1747757844473;
        Tue, 20 May 2025 09:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5E3avK+19A9Td517SGCLdTYA2yrGFAzKGrj13CJfDGLAXTQvQv4IifqqVvRyOTiit6RWrBw==
X-Received: by 2002:a05:6214:c67:b0:6f8:4719:c2 with SMTP id 6a1803df08f44-6f8b096f394mr86190426d6.11.1747757843833;
        Tue, 20 May 2025 09:17:23 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4f8e40sm739096966b.183.2025.05.20.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:17:23 -0700 (PDT)
Message-ID: <78314d48-4220-4d1a-a168-74268286fa2e@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:17:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcs9075-rb8: Enable IMX577 camera
 sensor
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-4-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-rb8_camera-v1-4-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682cab15 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=PwJnW-PDuis0shpFSnMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzNCBTYWx0ZWRfX/X7UaU7H9xzf
 lt8PiMJcWREk/PE7RgoL/Qy929Y9g+nhmg+dwVmbDl55hh7s+i1+BqEbbEKTpnh7t02MVAX3ND5
 OCBtaFQnl4s5FuMntf3djk44v2LN5W8SfvpAKeEHP/Kr5INPBs3kr7ZD+B6JzHl33QE+7M23eWC
 cTDn2ChE/UVc9TNSvQtq5Ie8CXAG1Ih0blNg5iBiRDwuxHvlOBAdwoPbx+4/zE4d8LpfkyrZ5TA
 18zC3h7jivZl59zFg4s4dop+INKiYe2u5KsG5NL11i4ufsI/B7kIBiEP7RAYZbg8ueojPnrjYFU
 MaehNZA6G1fZBpK8egMzViSIFt+4Ys1kucolF2bqZnT/MdPDd5puhlpDiaYW4lh+ro3vf/8x894
 pbhfQ+6wZxwcaiZUeAsigWRlt0UfBwbemiu+aDO+WqO5jxu9s7DlJ2ISTjnf+X6qPrbIJ2tm
X-Proofpoint-ORIG-GUID: hMNletlvy-dZKkn3TM4-FuljN58d3gUU
X-Proofpoint-GUID: hMNletlvy-dZKkn3TM4-FuljN58d3gUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=877 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200134

On 5/14/25 4:40 AM, Wenmeng Liu wrote:
> The qcs9075-iq-9075-evk board has 4 camera CSI interfaces.
> Enable the third interface with an imx577 sensor for qcs9075-iq-9075-evk.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 '0-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +&cci0 {
> +	status = "disabled";
> +	pinctrl-0 = <&cci0_0_default>;
> +	pinctrl-1 = <&cci0_0_sleep>;
> +};

Let's keep them enabled

> +
> +&cci1 {
> +	status = "disabled";
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
> +};
> +
> +&cci2 {
> +	status = "disabled";
> +	pinctrl-0 = <&cci2_0_default>;
> +	pinctrl-1 = <&cci2_0_sleep>;
> +};
> +
> +&cci3 {
> +	status = "okay";
> +	pinctrl-0 = <&cci3_0_default>;
> +	pinctrl-1 = <&cci3_0_sleep>;
> +};

the preferred style is:

&cci3 {
	foo = "foo";
	bar = "bar";

	status = "okay";
};

> +
> +&cci3_i2c0 {
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam3_default>;
> +		pinctrl-1 = <&cam3_suspend>;

property-n
property-names

please

> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_s4a>;
> +		avdd-supply = <&vreg_cam3_1p8>;
> +		/* dvdd-supply = <&vdc_5v>; */

Please either add it or remove the comment

[...]

>  
> +			cam0_default: cam0-default {
> +				mclk {
> +					pins = "gpio72";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rst {
> +					pins = "gpio132";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam0_suspend: cam0-suspend {
> +				mclk {
> +					pins = "gpio72";
> +					function = "cam_mclk";

Don't you want to park the pin to "gpio" in suspend?

> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rst {
> +					pins = "gpio132";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					output-low;
The GPIO framework should take care of output

Konrad

