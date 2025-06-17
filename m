Return-Path: <linux-arm-msm+bounces-61534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25232ADC340
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 377793AD951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 07:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382B328F926;
	Tue, 17 Jun 2025 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m+BxeSXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0C128DB52;
	Tue, 17 Jun 2025 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145359; cv=none; b=Zz9THOEMN4Y+lDm9rfh66hTQ51Q1xaU/hWuOee785fV8V6D3LdusIU14Gqb6XBzzCy+cRr4P6WuSu6orh+tHvFKuD29xW3cLbpkftdjtQsfHp/bsLbNbklKxi+UJVeWCNFgWHYYSt0ZSqZ8n3mrwCiJxdU5MLo2MdMKHaCmdLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145359; c=relaxed/simple;
	bh=VyENZKauuDeBrrKt2n8AKQyMl1M43hdMKLCK7wP7A94=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nI2vsBnRuywsKzKVz7EpYZWsRS2T5gbfxuI4fAwGy3VV2dgG32d3X3yp/m9DukOYEw34v/KHciqATVdn33BDQju69MOE6LGO8NO7MuRH5SY9nafZa7yQhioroPwbvfAp+ne8bvE0mR8UQ8I6lL3kc1AP6yWHrLLtRL+K/7iRDNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m+BxeSXK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHeQM3003294;
	Tue, 17 Jun 2025 07:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0m/yi0v3ncuT01hs8j6QehsDq3J189wt8xy/BN0+Qqg=; b=m+BxeSXKKbDrBBEB
	vh84jVMcmcaenFlBj+tVSfJS9PIbGFIQMx3fSuNJWaKIAKAOGx3C3ooSiVamxAtJ
	/fpnQHSnMUU8MJ5hDhr7oZNeO49WgX0ZlR4hA03fR2pRRH6vAU1OE/UPY2y2ZyAk
	M2Hy+MEdMxvTfiYNkUj564GrSk7QjTfjnn3MubIr6ooZtwz/Y5sEA0dXy2zHli3y
	Ynn7yazWF1V2zi4IFtlAqqZYbsyBd/g61ogU3dcJ4SnAFD4SZ5fQRSOzKcWtx6vF
	J9Dav+wuvmYKqUZC2oZ62fHKfs6Eha7SXhh7iqsyQCeGSjM1Qnw5SSBzmeRXUPVI
	oNb46w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag233cpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 07:29:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H7TCgO032143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 07:29:12 GMT
Received: from [10.216.28.134] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 00:29:07 -0700
Message-ID: <8bceae03-33fe-4ec0-b1da-785af793dd86@quicinc.com>
Date: Tue, 17 Jun 2025 12:59:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
 <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
 <89536376-6619-49a5-a267-b5a6b98940d8@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <89536376-6619-49a5-a267-b5a6b98940d8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8xqLLyvg422DOm-1pJAEj9kr8DpGfBq_
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68511949 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=wwDBjVCMs2Sz-d9jcOMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1OSBTYWx0ZWRfX3Oxp4d7DCkxP
 lD5r9jUd6xawigPMgwivdNVS4ZDgv9Vp28l0Uv3KW2+AcdpAo1yy6vshUm8C+2EnUP/sGHTIikF
 GIzk1Mj7kjg8lCD24XTQNHKjnCIYjtntEo82YhgKeoeClb1e1pYa89Rw8i5gEutH2txqxwxdNI0
 naZ8mhyGVx7EOXdu2EIMO4ARa4ib9i61G0qWn2dOXTIHtUkRm0IRckCt71CyHzCLkIaZ1F9gF7k
 17yDF+F+MpnNIjAeF0h6fMfx9hfieUcdxgbt+X3gTG3WWAIdbAnLwEfNhMWrEgm/LdymlWQgzz6
 LS4ohjrEZozYWo+fG5DOUdviDWSmqU74/0mrrI0jk32aw+cG8Cw3o19ACXfS9FU8WsiK7CMJ2+z
 KLUE45qt62YxX6bPtqEk5isHayy9IvWUBcGpBxHgEEpEXdjPlg5XBr9VPblx5GGYMDom1jI7
X-Proofpoint-GUID: 8xqLLyvg422DOm-1pJAEj9kr8DpGfBq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=957 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170059



On 6/17/2025 12:27 PM, Taniya Das wrote:
> 
> 
> On 6/13/2025 6:40 PM, Dmitry Baryshkov wrote:
>> On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
>>> Add cpufreq-hw node to support CPU frequency scaling.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> +
>>> +		cpufreq_hw: cpufreq@18323000 {
>>> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
>>
>> This wasn't build-tested (or was edited after being compile-tested).
> 
> This is already tested on the QCS615.
>>

Seems there is a syntax issue, could you please check?
 
- compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
+ compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";

>>> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
>>> +			reg-names = "freq-domain0", "freq-domain1";
>>> +
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>>> +			clock-names = "xo", "alternate";
>>> +
>>> +			#freq-domain-cells = <1>;
>>> +			#clock-cells = <1>;
>>> +		};
>>> +
>>>  	};
>>>  
>>>  	arch_timer: timer {
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 


