Return-Path: <linux-arm-msm+bounces-79584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE705C1EB97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35C484E1E97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABD2336EC4;
	Thu, 30 Oct 2025 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJmdIQy1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdIOLyAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE973358AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808884; cv=none; b=TEg9o1XBTORaAW2LLnvIuMegXbErMxKYOJHQk+ohkv2WGUH65hJFpIk1+ENNwJDbC0SayfCnPtWsQ/1W99WpohHRR0bbDEjskvdFTtC82wsSaXay04+i7j6vNcCDhFJ2PE6MXpC5TBrte9AmTVUinC7M36lgi36YRyddj0bKXDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808884; c=relaxed/simple;
	bh=3ukC6tbY/13+u4PbBz4Lf/+5E1gIoHSg+SZx7O+Z0U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnUZki8//ZSx0jPLnLXMCO4KippVcRoeBKVhcg0Sqz8f7b/zDUo9eCpuefWlatatDknkKJ14THtP4hgdqgV1w3I4yKmNhzBnH1lUP86XCx1sD0S8xw9vsphiS/JzBnNLayWmPATQMRRuFyhA5GyhWUsykC0qj1Y80oxofahxDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJmdIQy1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdIOLyAT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TM2pfu1699843
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LrLH04bvWmhv/7dSuz9/jODN0MrjOzjLTOOh3RzYK98=; b=aJmdIQy1dzNp+YSO
	uYD5v7uBG6WccO2WyWuXmJygidw+st6zcZUCS7lIaBhlmZJpmOylw4iW5z7tzIQj
	CBaIaIFmECBjjXRoQLDWMk5s5RLgnz8ykhYfpF+El3Y33ArA1HM9BKRJQDrJlzg8
	Utf1dubsR4j27TTqKZRMdsjSU9OQpBCI2/hR9Hhwj3PsfUnCBk3PfEeOKWZiR7qG
	RhE9JMfGC5xei95FUIMhAjSAVkvwYXHdKtJtm1v6t1rUxO/+xxo0QgR//A2GwDB3
	/1UkAzswKyOkydIUPmcR2Yddv7v36LcZBzOJU4K+vB3kP8nvhREE+16xCZUtcZLV
	RkBlyQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ucj99u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:21:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6cdfb42466so152013a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761808880; x=1762413680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrLH04bvWmhv/7dSuz9/jODN0MrjOzjLTOOh3RzYK98=;
        b=DdIOLyATS1Q2EdId0TVXEA4WVP0DCm/CWnOBu0Fbc884jB8RuzDUi5qm+MzVzwzMYJ
         66n0NWC19sDNNaJ6Os2qbaAg4dnMBt3RDWAxW33Q1agRJVmJHzfr2IYRfejsuEeOrJpv
         J4/8ZgtYgWKywoo1irSW5XdWzlLMUOCtMwU0fZOF8IfWPJqpPnrOx9o90FL/c+/L2alk
         R0DmfRcVSd2TgDyH9PtcWef7phJWFGlm62PGmrbfXVAPqAd8sNbH0UHK3T4NxKcZ/qGE
         O0vPgEmLImo8muq5V8FS1eBWv0zI4k6BLN8R12pH3ROnctNe+btgK8bm9Mh/Mgc9TiRx
         diwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808880; x=1762413680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LrLH04bvWmhv/7dSuz9/jODN0MrjOzjLTOOh3RzYK98=;
        b=dXtn3PWuSo1EyPP/jlPzBjT1GJbdH8LU9dfTBRb9R/LuHwXBO7s/rN0WPqsFK870uD
         s3WgB3F7+Lt0hUS0/LlsNfu5omRzJOheASgQpk1CZ8D03hVSEgbclox/3agWv4YLzJn9
         LLEuWYLsWe6fJudms26c6q1iqRCo7IO2R6iHGDnxfVgpUipZUV912lJcPAanV7BIq2e0
         52SoaA+8OOOxl/LPfLZpc0StnTLt93DbV/njc8LY8MCRDISrLpsz4prv3GgYjQ6mcmpH
         cZt1/X8vFa+/rAENqf7QFso7iWmP2ZxMhNmKqWOg/KqOF1U86B3GTvWwusVSB2ErWcry
         jwTg==
X-Forwarded-Encrypted: i=1; AJvYcCVGcWQtlsBrr4r+iWkLS0WH5aIIFv9FcprNR/9CcOrXlkosm/Pwsv6um+Iico0nv+SI9itBLsXRNl2Yzmmm@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJwK6iDZKZjVknePOyyUIqjAnFjstNZjh6kzqrsjEJIRoNWiS
	cW3Giv1SKgraWY2NCk7oEqDbj8K8JFxO4QodfmT89rjoFCYD81vhVYu5UiBAjD0cxsTZenGoFt1
	X46M7QjcnWlO+iUFTBGZO5Q38S53Nsxqh+XFN+Pesf921yPX1r1AVFUPUfHpE+etpj93C
X-Gm-Gg: ASbGncvni/X0P1oDK+EC2XcSc1KOfC/j1aQ83L1BHdyBFUzdWvABXJhOX5itgRyn5hH
	C/3xNkfnOze091zh/3x27Xkir5UapTuMhzMuXMpSwhw+PakS+nvqqEkMj1WFofeGln1FUbj4+iE
	oTLQBAPycaHyddGz+gWhv/uZIVH6cuR2A4H7SAzcQMa0FeWevQDja2p9TDr7Dzeavcei0L9NTdO
	5piDa5/sHCHw/mvE/RcnY3Hjl8tw4FrWI1d5qR7kW3l0e+FVhN46wlHLuhI40aOz7yZYeWBoB/q
	tXyHcdFxQbQMP5amh/CNrV119kflNJ2OM+4WjAOXs6Y3+nlQJt+dSD55daipK5xjsTJZJfXfA/6
	93YZ2YKElPEna7GpgaHTxoiKBdnlPLRUBUV7h2N/MzuFS0BBnLxt6JUJVfA9wh+jcPdPsBQ==
X-Received: by 2002:a05:6a21:4d8c:b0:341:fcbf:90b9 with SMTP id adf61e73a8af0-34653c0cc95mr3991168637.4.1761808880200;
        Thu, 30 Oct 2025 00:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzZrHhcc1HTqPJ7CvrAphUHOthYYbudWGXcSpWUVourKLOVpK1kqUouzpCpiUJ1uwL+BHxGw==
X-Received: by 2002:a05:6a21:4d8c:b0:341:fcbf:90b9 with SMTP id adf61e73a8af0-34653c0cc95mr3991136637.4.1761808879701;
        Thu, 30 Oct 2025 00:21:19 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b8c0d2364d5sm3941558a12.19.2025.10.30.00.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 00:21:19 -0700 (PDT)
Message-ID: <da6eebe0-13ec-4168-aac1-2eef9db3bd13@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:21:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-3-c4316975dd0e@oss.qualcomm.com>
 <xjes5h45y44cahs7avj4xngprwnks3alnf25tsbptyvckajz3q@lhawlg5vamls>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xjes5h45y44cahs7avj4xngprwnks3alnf25tsbptyvckajz3q@lhawlg5vamls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1OCBTYWx0ZWRfX/Cme+RLp+8J+
 WYGyQeaCv9Qk8FXCgWabbVGb43FzUDCxnVc5oUmyeVkGTyie6oVgzpSyahfhSlM1y6Cgsu0U1GI
 Mi2U2L05ITdu1k2Wi+lAkSkdG1d3vCAmVml6SJ0mXCli6Tckei6i0MgRFr7eU0rG0lzmrF1AIvg
 1rD/2gTOADpyatlEWGYYJICHlpU9WC7oehmqMFztBoY/Y7Ya4mPGa8gM/LhBFlxC/yPJg+K2vxR
 q97PP9yEN89rPRCl05uZ5srUL+LVsN/wU+uRgRLoC3EGsTP7/72oGZEkAAt/crEk8khoL+nK2ca
 FO7G5RKlXd4Ir7gKTCCvuEkSCCQn0uofTlPvjaimmkfGTwr/6IYbOgkAwOcoynNbpfnDm0CsREz
 fzS2QMan1jLnlGrY2dWQ6orzj5bTmw==
X-Proofpoint-ORIG-GUID: bh9-oEJnsGWG_1JbI8Q3TywIau03Ymdr
X-Authority-Analysis: v=2.4 cv=V+RwEOni c=1 sm=1 tr=0 ts=690311f1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tU0UsG_G8rlFAKuj474A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: bh9-oEJnsGWG_1JbI8Q3TywIau03Ymdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300058


On 10/30/2025 1:32 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:03PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
> Please fix the subject prefix and drop the "for SM6150" suffix.
>
> Regards,
> Bjorn


Ok, due to sm6150.dtsi have renamed to talos.dtsi in newest version.

Will update to 'arm64: dts: qcom: talos: Add DisplayPort and QMP USB3DP PHY'


>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 115 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 113 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..9741f8d14c72ed7dd6a5e483c5c0d578662f1d31 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -14,6 +14,7 @@
>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> @@ -3717,6 +3718,7 @@ port@0 {
>>  						reg = <0>;
>>  
>>  						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>>  
>> @@ -3749,6 +3751,89 @@ opp-307200000 {
>>  				};
>>  			};
>>  
>> +			mdss_dp0: displayport-controller@ae90000 {
>> +				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
>> +
>> +				reg = <0x0 0x0ae90000 0x0 0x200>,
>> +				      <0x0 0x0ae90200 0x0 0x200>,
>> +				      <0x0 0x0ae90400 0x0 0x600>,
>> +				      <0x0 0x0ae90a00 0x0 0x600>,
>> +				      <0x0 0x0ae91000 0x0 0x600>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel",
>> +					      "stream_1_pixel";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>> +				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>,
>> +							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_CX>;
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						mdss_dp0_out: endpoint {
>> +							data-lanes = <3 2 0 1>;
>> +						};
>> +					};
>> +				};
>> +
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +				};
>> +			};
>> +
>>  			mdss_dsi0: dsi@ae94000 {
>>  				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>>  				reg = <0x0 0x0ae94000 0x0 0x400>;
>> @@ -3844,8 +3929,8 @@ dispcc: clock-controller@af00000 {
>>  				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>>  				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
>>  				 <0>,
>> -				 <0>,
>> -				 <0>;
>> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
>> +				 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
>>  
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>> @@ -4214,6 +4299,32 @@ usb_qmpphy: phy@88e6000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		usb_qmpphy_2: phy@88e8000 {
>> +			compatible = "qcom,qcs615-qmp-usb3-dp-phy";
>> +			reg = <0x0 0x088e8000 0x0 0x2000>;
>> +
>> +			clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
>> +				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
>> +				 <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +				 <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "ref",
>> +				      "cfg_ahb",
>> +				      "pipe";
>> +
>> +			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
>> +				 <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +			reset-names = "phy_phy",
>> +				      "dp_phy";
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <1>;
>> +
>> +			qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>>  		usb_1: usb@a6f8800 {
>>  			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
>>  			reg = <0x0 0x0a6f8800 0x0 0x400>;
>>
>> -- 
>> 2.34.1
>>
>>

