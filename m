Return-Path: <linux-arm-msm+bounces-56764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A0AA8FE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F0353B7711
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65241FE477;
	Mon,  5 May 2025 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WrhCTGdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEFD1FDE00;
	Mon,  5 May 2025 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438260; cv=none; b=PYjfT0jE8u3FTIHC7SETJMWZF8VdCA06xggx81fKVeOs3i+dRuaHPQbLCrAa0drkeafPW+E//IkXFx/sXMPK8wNGlnH1dJ++p1CHL5DJKFdnatdTDt8i6YrfyCgg9PvCuZNBli6w1VWRF3+JFd8dvyUisWYb599m7p/a+2dTNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438260; c=relaxed/simple;
	bh=aBSxeVbwRYMijisrX6eBPjQGnctphet6lxh51NOvGdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h+pL7t1F/dmvSe5UyfISABo3ChVNBOxEemnRO+AoXtWr6L+DUOH0ZALMGObFIU9fe6sU9Yqb+Wob5hUe0hDU1jnazdM8fj6fKOfPh+9ZpcSuFkW1r7yyY0DWGv1fOoU7vNjwPIP8aJPECyGuxag2jqbWsIIHQrPt64TjavKsp8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WrhCTGdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544KF2fw023465;
	Mon, 5 May 2025 09:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8ZhTBvNA79B186u574Tm8rETDLy+4bYyYp2DT6R3wU=; b=WrhCTGdv7TXtEIWN
	f8z0gxuF6GlvahbSGAujcwLS8xgMdXCifXFiOQoxSE8Xgz9YOEfNIdAObuHSBzox
	WohNchdf8NcXR6i3VIHxNrhO5lbn51pVXzAVGSpJJo2I9MKQeCGg81O1mkCbKsUk
	ZvfEDR/isFLGGv+d5a2BwqEhNZer1h1GH4BtKG/mU/OjdEZWTSlzE/2fBFbzovxV
	jI/Fw71+lXZoOKV+F/7xi0jfq86AOguth2w8x7ns7yZXTxVR/gltlGSJg13yuYE1
	vpAmHeDsfpz/YsByTCwO2GtYSvyTxDDfmXMcpopW0w91i50XoqRGUJIlog6NXzbp
	AC/AHg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep3sv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:44:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5459iBVs027499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 09:44:11 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 02:44:06 -0700
Message-ID: <61fb2186-7cab-4bb3-a4d4-b0ff50cc9fe6@quicinc.com>
Date: Mon, 5 May 2025 15:13:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add Qualcomm SC8180X Camera
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-2-6bbb514f467c@quicinc.com>
 <20250502-pink-chamois-of-expression-0dc36f@kuoka>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <20250502-pink-chamois-of-expression-0dc36f@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6818886c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=DsprklYSb-owMWUK2b4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0RP8lDm88nKTKjrMlheIWufgGEBRFUCF
X-Proofpoint-GUID: 0RP8lDm88nKTKjrMlheIWufgGEBRFUCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MCBTYWx0ZWRfX3395ucZyp8O4
 JM4ORGvYSFI2Rkbq3eBpgzWa0BaAmuf5PqS8/dUMB5IN/lkmnYbpHmeAJlWkOvMEH4qNc++l3Ju
 oXAFRS4bdbjymTPrIwetKleoWHrFvu6s0eHWjnQi6P6ubA/eddfOrIjAihDoJRfleSCeOn2jXQ2
 I7x3ZOqxkCPq4JX8O6nk/ulrUt8Chpu9AvItkaPIsOv1QUaY1A2ICOvSfOPjUK66jDv7wH6Hkhi
 YY1JA77VaCo3MpDCTjwOg2knGIq7kp5gBeWCKF04qe1ghupB3hvvBbxl8bGtf9nW/yJ9QWz6+ki
 703LOFqsirt57YUyIO/4jumPDZ3/LTnHB43MoQJPhcWFPtjwfrX8kMHPxgoewnwBr6PTiiWBd8f
 ufvG5+k519iAAc5L0bDNhEfkjJc+0gAz4GGYKE7vT9VMuEBP0AHBW3Kc7Eh12jm2zS2quP/u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=767 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050090


On 5/2/2025 12:19 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 30, 2025 at 04:08:56PM GMT, Satya Priya Kakitapalli wrote:
>> +  clocks:
>> +    items:
>> +      - description: Camera AHB clock from GCC
>> +      - description: Board XO source
>> +      - description: Sleep clock source
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      A phandle and PM domain specifier for the MMCX power domain.
>> +
>> +  required-opps:
>> +    maxItems: 1
>> +    description:
>> +      A phandle to an OPP node describing required MMCX performance point.
>> +
>> +allOf:
> allOf: block goes after required: block. See example-schema or other
> bindings.
>
> Now I really wonder what did you take as an example, because none of the
> files have such order, and this suggest you base your code on something
> old or wrong.


Sure, sorry about that, I will update it in v3.


>> +  - $ref: qcom,gcc.yaml#
> Best regards,
> Krzysztof
>
>

