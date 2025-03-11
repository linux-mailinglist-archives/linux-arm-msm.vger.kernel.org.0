Return-Path: <linux-arm-msm+bounces-50917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C6A5BB0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25D661720BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6DC22652D;
	Tue, 11 Mar 2025 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CiZyKxjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47BA226545;
	Tue, 11 Mar 2025 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741682870; cv=none; b=gxsH47SzVrKjJyTPEP8hL4eEwEasuVekOdwGOgHM6MnINQU/e06tL/HI95nmSadwSt1xsus0dVVAocjUKZGrl/+/72vxj/zWmPI5YPGkNQ8wo41/ge/RYSX6FyeffShg5NIum/2/63iJAoq/ge26n90HrP84Q2u+16ccYckie44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741682870; c=relaxed/simple;
	bh=HU7ymW3CwrCL6WRNhhQn4PYspviN266YQvbLhuyNFHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C1gC1zpyiTb1Wqk2e0CeFQ26TBSVLRGjCxhJmMLWBmfVLmdsRertLdeu47+1kyMZdiG+l853xK0WAzkJJ4HJzkpURnTFVwFyesKlCCkb0POKZyLO7kEigW0xbfzSsFjntbYvF3VYNJsujaymwAizvISiD1xVK1ehK2b//SaiSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CiZyKxjj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B1A0gu007495;
	Tue, 11 Mar 2025 08:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ez7DWO84DxfmgRnVTGqExe4MV9tByUT69fm1K/8JfwE=; b=CiZyKxjjpfEYdM8r
	CUzEj2WHT3nwZwVhzAdDugvocNxS5IBh89fb4VXN+nHJvcvMsoJUg0k05XA9V1BQ
	ycw/2D6RlmGTXy3V0nQTRc5/1t5u2XmFnzpIs8+oNwiAQJz+aeYHJHFM5wZCHCmD
	sVqsFTi+T7wIP39+PwOxJe6+e6jVqwwwZTBJxcLmd5UdupPPuEuSGA+T7dLpZbQV
	fW4TZ+VUsX8Kxk+7XLCadOWs1rtyVtd3ojbpEFjmkGDD7IWHaJUErqLENKpAPRiz
	wYRmTIimOW139EPYsnU5+CEsTwOeT8BH5UNQ9sshkASo/y83sPgMAknDFoafECNW
	zhAt1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ab95h57h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:47:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52B8lZHk016196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:47:35 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 01:47:28 -0700
Message-ID: <e0f534c8-5a86-448f-a164-f5d691484721@quicinc.com>
Date: Tue, 11 Mar 2025 14:17:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>
 <mboqw4on22m24njo22r3xajjkgmyobynv5qdx4yhbblz5lekw5@xd6xkhlrh62w>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <mboqw4on22m24njo22r3xajjkgmyobynv5qdx4yhbblz5lekw5@xd6xkhlrh62w>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rog3Z0h1LUS8N5R9i7CCcXqsjYmfanMP
X-Authority-Analysis: v=2.4 cv=fvgmZE4f c=1 sm=1 tr=0 ts=67cff8a7 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=sSzQ2nv1RjrDmx6RhioA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Rog3Z0h1LUS8N5R9i7CCcXqsjYmfanMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110059



On 3/6/2025 3:40 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 06, 2025 at 02:25:33PM +0530, Jagadeesh Kona wrote:
>> To configure the video PLLs and enable the video GDSCs on SM8450,
>> SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
>> with MMCX. Therefore, update the videocc bindings to include
>> the MXC power domain on these platforms.
>>
>> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index 62714fa54db82491a7a108f7f18a253d737f8d61..737efc4b46564c1e475b02873d2dc124329fb775 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -32,9 +32,11 @@ properties:
>>        - description: Video AHB clock from GCC
>>  
>>    power-domains:
>> -    maxItems: 1
>>      description:
>> -      MMCX power domain.
>> +      Power domains required for the clock controller to operate
>> +    items:
>> +      - description: MMCX power domain
>> +      - description: MXC power domain
>>  
>>    required-opps:
>>      maxItems: 1
>> @@ -72,7 +74,8 @@ examples:
>>        reg = <0x0aaf0000 0x10000>;
>>        clocks = <&rpmhcc RPMH_CXO_CLK>,
>>                 <&gcc GCC_VIDEO_AHB_CLK>;
>> -      power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +      power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +                      <&rpmhpd RPMHPD_MXC>;
>>        required-opps = <&rpmhpd_opp_low_svs>;
> 
> As pointed out by Vladimir, you probably also need a second entry in
> required-opps.
> 

Sure, will check and add second entry in the required-opps.

Thanks,
Jagadeesh

>>        #clock-cells = <1>;
>>        #reset-cells = <1>;
>>
>> -- 
>> 2.34.1
>>
> 

