Return-Path: <linux-arm-msm+bounces-55348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31614A9A8A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 482623B7A00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8C5221291;
	Thu, 24 Apr 2025 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CC7WMzFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A41A316A;
	Thu, 24 Apr 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487331; cv=none; b=Z0snaoiJ2HlYOXZYCPiJMNgHIyT/jAwc2xvRIWocRHUyVCH//uzB33xnbAtKnSYaVZOPluivujp1dgF8nMK9bnIQI+5yZdTW9QUJ/qG7nH6sU0WwkUffQTrIsm708vNVwi+XbJwjUO/gl5lGkowR0wwGbguqFJzDizW9IowB1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487331; c=relaxed/simple;
	bh=+embqwyAzdbXL5TZrTEz22HR8CvSfNAORYXrKfyEivs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f1OaKwVc008QSVH/ryBnf51O3F624QRQ3mSRv/vgLkbAQCtdaVe1Eeowpal70MtxBegOx2F4f5hZabB7Oqr066LW7SWen44wzgcq9t0Qic+7D/Abnn1bEXgrbJtdZ110nu/6sGJOJRH52CR4b9BhqPA8ULGTcQ65/1xsD/5TGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CC7WMzFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6ue028353;
	Thu, 24 Apr 2025 09:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEwcveSMr05G49mJTq32jJbxq00tOstvui7brwnp6pg=; b=CC7WMzFE080IGvpP
	lKGNP8i2bZOPFz8wCroaIEwmdxtnSnPwvlSmvZH1VXqwI0f9YHlRIthpOTevwR33
	tyz7I1a+D/+ulW6Qm2y8mzo0ojahK0amDCsRkrtWRgxosSNqdTmpOk/CA+HDlldt
	PppDU47S2KsIAGLpERFuBLl6HcMsos0/ilOH4bv7ZZc79lJuv/lhC/3tgxBLGgdq
	jw9kkS5j0lqfhYrv3KJIxJ1Ghr5N3qXVgDIklomma2mLKt+wEmfMhJxTDq1g++/W
	Z3j351UMa3bvZCSOftOhUeRf417kt8HB2am88KWbJj+269q5FBfIfx4A0Bh/wz9y
	nK7/VA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy50j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:35:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9ZLXo019249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:35:21 GMT
Received: from [10.218.40.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 02:35:15 -0700
Message-ID: <8586e84c-4a2c-4aca-831a-6fde0cd39a45@quicinc.com>
Date: Thu, 24 Apr 2025 15:05:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com>
 <20250414-qcs615-mm-v7-clock-controllers-v7-4-ebab8e3a96e9@quicinc.com>
 <ac5f2ada-1561-45f4-91c6-f6b403f65e20@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ac5f2ada-1561-45f4-91c6-f6b403f65e20@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXyuR1Lxg74svK 33n28murralb5y4gblr1FWcfULI0c+2Z9GuAaCXZFcuj2OldJjEC5BMiKqx4KHK+QilDYJJLoQy 6rFcTcAyxhkXyEhEN+kwEWBFgaPCYZTGuq+HCWr6zLWmGHBpVlaQh4lvmPoKeloDLzorvZdC6O7
 1pm9UVCJhiYAVxJFrrwkikSiH1avdV3Cz/CTUc1a5FuqsO3Zn+PvicIty9BMNBA+YJpqjJV2kmv KJ+cvLNv0+NFnHSguoQYxQqRp2/kTfYPdZiIBRtGdLptTS+N2b/QMEVM2+yNbTREnwftWm1zP9a 1519iE923udFlz0hgNcBI61gv8UYP5Eow91MrifXg1sBNQ60m85WV4fAS5rj68fkULTSvmZcNwr
 GpVs8EOnNYzgbD32S0RXtbTDF1zvC7PRDq+CTqAH8m3mIeXdHLfNhJN0A3WORzF140u2QJ/N
X-Proofpoint-GUID: 9Nr0r2JWEqMjrqaMfrlbyKSl6fpN3vms
X-Proofpoint-ORIG-GUID: 9Nr0r2JWEqMjrqaMfrlbyKSl6fpN3vms
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a05da cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=xQW9tI0NYmVP74NBxscA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063



On 4/15/2025 10:55 AM, Krzysztof Kozlowski wrote:
> On 14/04/2025 10:42, Taniya Das wrote:
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Drop
> 
>> +  - clocks
>> +  - '#clock-cells'
> 
> Drop
> 
>> +  - '#reset-cells'
> 
> Drop
> 
> Please look at other bindings when writing yours.

Unfortunately I picked the wrong example. But fixed it in the next patch.

> 
>> +  - '#power-domain-cells'
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    clock-controller@af00000 {
>> +      compatible = "qcom,qcs615-dispcc";
>> +      reg = <0x0af00000 0x20000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +               <&mdss_dsi0_phy 0>,
>> +               <&mdss_dsi0_phy 1>,
>> +               <&mdss_dsi1_phy 0>,
>> +               <&mdss_dp_phy   0>,
>> +               <&mdss_dp_vco   0>;
> 
> 
> Drop excessive spaces before '0'.
> 
Fixed in the latest patch.
> 
> Best regards,
> Krzysztof
> 


