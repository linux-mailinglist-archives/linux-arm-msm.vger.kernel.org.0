Return-Path: <linux-arm-msm+bounces-53946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B5A8554D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DCF13B5FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2514027E1B0;
	Fri, 11 Apr 2025 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V/vG/JOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D38626FA47;
	Fri, 11 Apr 2025 07:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355825; cv=none; b=dnLtquWfJMGsiAr0chzeweGNyNOck6pzCBAl54OHvIFS9NBn9ROfXrEPgtdlBPo46leYpGTwqWME+myHNGrtc7h2p6yPH/hwJ+2FGbKcr9vfIvAAw3qcZtZKkplauUNB0KWIpWl8mVLypjHkfO6x0UKrolEDv5R5kmZl7VyI1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355825; c=relaxed/simple;
	bh=rcR2zyimgt9f04I1InrGGFxvSbaEobKZB/d5wJ3F9B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e6hCACLB+8sNBtqcgEUTtyW3kqNDZasJPI+i/LbRyZadbzU2oEmN1c0uDOH/ZT0ZuBy5nNbuabbSccn1WRGZzSfJQeBHeC7DpnOeMTtKX/aY90WzIbgFJtrk+w0g7tv8PhBr3a4qgVJLg55a70+M2GMlCyKfM4CPJpQlHEwiMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V/vG/JOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5Ksn6013871;
	Fri, 11 Apr 2025 07:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGZ60w+aUSnPgf+eMvzcULIVP/4egO2dKsVfAMyddWg=; b=V/vG/JOOIBNTrk35
	vScIPUH0MfMfPAE2moJcNE50LWKgJVcClyrx1eJLlulJvMHSeKpawi9Wn7hgl1MJ
	QenbobSYa7oUFRFAd8WvYPVIU9fkPJ0c4kpv2Qisq+vk7Oy+TcjzCJUphIvI4FJk
	1EaByyBccmuZxsq30xf+Qo8JkKMGlRVezQlrywTUJb2i7fwOuddPQxOMp2Bd1BiC
	okkEAXhI1cHsk6BJvdTjKNYZrT3C+sVo/mZua/eXbHFShjXjWyoPvmbspZAqP12d
	FODM5I0rVtTQ8LI2n37YUdFalLMjh9ZMEWzAeh5rq6na5PsUpzEzm02J4aRJryc/
	D6d3jQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbehkmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:16:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B7Gwub007245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:16:58 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 00:16:51 -0700
Message-ID: <44dad3b5-ea3d-47db-8aca-8f67294fced9@quicinc.com>
Date: Fri, 11 Apr 2025 12:46:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: Add MXC power domain to
 videocc node on SM8650
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-15-895fafd62627@quicinc.com>
 <12986cda-99eb-4a1b-a97b-544ea01e2dbb@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <12986cda-99eb-4a1b-a97b-544ea01e2dbb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b6d0Xt6LXxBq9MxDSkBpg3KPP3KMUfZY
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f8c1eb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=6YLGWxb0gomxboG-hEAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b6d0Xt6LXxBq9MxDSkBpg3KPP3KMUfZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=997 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049



On 4/1/2025 8:57 PM, Konrad Dybcio wrote:
> On 3/27/25 10:52 AM, Jagadeesh Kona wrote:
>> Videocc requires both MMCX and MXC rails to be powered ON to configure
>> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
>> node on SM8650.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 818db6ba3b3be99c187512ea4acf2004422f6a18..ad60596b71d25bb0198b26660dc41195a1210a23 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -4959,7 +4959,8 @@ videocc: clock-controller@aaf0000 {
>>  			reg = <0 0x0aaf0000 0 0x10000>;
>>  			clocks = <&bi_tcxo_div2>,
>>  				 <&gcc GCC_VIDEO_AHB_CLK>;
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MXC>;
> 
> So all other DTs touched in this series reference low_svs in required-opps
> 
> Is that an actual requirement? Otherwise since Commit e3e56c050ab6
> ("soc: qcom: rpmhpd: Make power_on actually enable the domain") we get the
> first nonzero state, which can be something like low_svs_d2
> 
Yes, commit e3e56c050ab6 enables the power-domain at first non-zero level, but in
some chipsets, the first nonzero state could be retention, which is not sufficient
for clock controller to operate. So required-opps is needed to ensure the rails are
at a level above retention for clock controller to operate. low_svs was choosen since
that is a level that is generally supported across all the chipsets, but low_svs_d2
may not be supported on some chipsets.

And required-opps is not mandatory for MXC power domain due to commit f0cc5f7cb43f
(pmdomain: qcom: rpmhpd: Skip retention level for Power Domains), which ensures MXC
always gets enabled above retention level. But it was added to make number of
required-opps uniform with the number of power domains based on discussion at [1].

[1]: https://lore.kernel.org/all/eoqqz5hyyq6ej5uo6phijbeu5qafbpfxlnreyzzcyfw23pl2yq@ftxnasc6sr2t/#t

Thanks,
Jagadeesh

> Konrad

