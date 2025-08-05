Return-Path: <linux-arm-msm+bounces-67756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B5B1B0E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9644B7A36E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C845259CAF;
	Tue,  5 Aug 2025 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R94D9elE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B082F257AEC;
	Tue,  5 Aug 2025 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754385587; cv=none; b=IQOWHZT9dLtfb6+jZ+oDPLW6JasjJ6zZlDmOpDH+qkExEOB6v64xfSBBndQTUzBy6KOKY4bHsxcmtDXkwRR9VSuK8uwFqUrOf9UEqn1+ehBrMsMSBihQcPSTXhHmX9Bjv8G3c8by0RqGKMC3g+tkHsvVZxFOKLTGSQUpVTri5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754385587; c=relaxed/simple;
	bh=7mC3wl9r2WjfTNJhBB1YZNFGNWPZwe8RJuAByGvexao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OK/X2iIAcLUw3ynwqz15B2OWK4eJsOgi/OkVHaADpkKxz8DKPV5RQR3T+AHe6stONXKw9sCT3mTtIt+LAA3iTVDzNjpEqzmhZ2O70XZytjrpUo1AicVE79AfcN3Z1ysCp9BMv+SG7x384ejwad5LvVAq0sqpTXXuZ4Ax59n4TCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R94D9elE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5751pD7c007598;
	Tue, 5 Aug 2025 09:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfI0YkisqyQiDBbFFGLao7qusuEIEbYmrnUakGa8wH4=; b=R94D9elErWGrCGCG
	TBMGq4hZolBiawCsOUFXmNasbOucsWh2cAC0b/oHS4lnjP0ob9hrEtV377qxlfv3
	4RsMJaprMU0ON+11DL5lC8QeuNBtkFGPhl4vedwPHwahSARtKd4WtrpMgwKxnnb8
	+D2HRmOgZRLDXK0GzqY7+h32FtjX0KHbsjLS+ddVi+99JyFK76/low15MamqwejX
	L5MAkY1d1SM5X3afMajQEeCxTNdOZIfPoAf6N8CfgWYCJD2rDeDCVKtZICPAQJ8L
	WS7qzDNjk691TOPTOOcCmy8bjx0RFAq6saExOW4Tpi+Oa+tnXJO1fS6RAGy+waUk
	itEPAA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a7sc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 09:19:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5759JceB012879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Aug 2025 09:19:38 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 5 Aug
 2025 02:19:32 -0700
Message-ID: <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
Date: Tue, 5 Aug 2025 14:49:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6891ccab cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=1q2MIjjhIDf-Krenf6QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Rnz1D7qDn-xKlhuAdL1WPvdsOEv87e3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA2NiBTYWx0ZWRfX4k91tHBAnPOJ
 b6sNBFEp+yKxOUnHHgZqXnYFQJ7qyD/LM2+rlv6/c9XuZ3FfaN5YzhCjwD9tM872MmKVHvTAJuz
 YC2xvV9CAtx73aKAbz1hq0OhYpRltBWzU/l3WbDM67P6PZode8xEcgux9Z8tueQTrXD3FPzgLV1
 nkqzuf00CKy4y2Nh+j2CFaKzUPce/6AsU4bMoWwg9qxDULKeQvA2LyMmrjxeeWAsDUi56xnybfv
 V/qkghpJfvWkXHHs2QFeD+jx1HdfOuHU+AvtQ5Q5DsChoeq3vSUu1GsMjbs3rbeLnWEYVTpK14x
 1HBfoNZ42C/h8L68CrFcKadmXEKjl6mzOZ28Kf9zwWLSuI/CBgisMBxa7L2UuSmX+b4TMJ4V8st
 IGESpQj/OELcuiKCb97hCi6sKFZsJ4Na9b9j9/SmK1dZSI4E1ixPqe9PTsjrZbDzplzLjTFC
X-Proofpoint-GUID: Rnz1D7qDn-xKlhuAdL1WPvdsOEv87e3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=971 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050066



On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 10:45, Sarthak Garg wrote:
>> The kernel now handles level shifter limitations affecting SD card
>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>> capabilities in the device tree.
>>
>> However, due to board-specific hardware constraints particularly related
>> to level shifter in this case the maximum frequency for SD High-Speed
>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>> in the board DTS.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
>>   4 files changed, 3 insertions(+), 3 deletions(-)
>>
> 
> This will break MMC for all of the users and nothing in commit msg or
> cover letter explains that or mentions merging strategy.
> 
> Exactly this case is covered by your internal guideline, no? Please read it.
> 
> Best regards,
> Krzysztof

Just to make sure I’m addressing the right concern — are you primarily 
worried about the introduction of the max-sd-hs-frequency property in 
the board DTS files, or about the removal of the sdhci-caps-mask
from the common sm8550.dtsi?

