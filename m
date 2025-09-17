Return-Path: <linux-arm-msm+bounces-73953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5AB7FFF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED66540A45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E671299937;
	Wed, 17 Sep 2025 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hLWa/b6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977B33C77A;
	Wed, 17 Sep 2025 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118799; cv=none; b=qqWPFYuKebWv2sX8j7sxeS2n0/FRu3lBfocMEroCJcO5Hyk9B7C48YEFKmfLf9Bb068yKli5gelNBfGn0rU+Oeq50qH7Ud8Pq3RcieOjEGZHmtvWTRuImHKZspEiBiU4Jn8oIuG5pB7diPVMxqkB3rctT6fk9ZEt7LH3aBW76kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118799; c=relaxed/simple;
	bh=K8AzLf7x2a9JNhbTQRQliEaTadQE9bAB6ts5jXpmOOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QZnNEYAzmoeLrR5k20EX5to4gn0PAFK+Ux5Tdrsi9aYFo3/P93A9anCAkGhPNwXxPwyMwgl6XkC1VBNdsi3POgF6Myfsn6t2KoOgnTN+iTOjujS4fwa9WmNFy701yKtn9go3pDWNx22/T+k1L7J78syRDlNt2mLcXBHWfd59wwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hLWa/b6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xafb021451;
	Wed, 17 Sep 2025 14:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QClkAHTCsjCfKUD7nA/NyZmaWUaO8cGUX++gkDPGqS0=; b=hLWa/b6aA4kHDM4d
	qbNNlapMynzRtfzhtbLDvtibkQCRHi9nz6uzjJq5Q6+7IpG4laEzcOc3Tvz6piX2
	wwoWi1Eadqw3nOGTd4JI657i+BlXdT9NM3R5pWqx+wyDxSkxEatwWFiovq9WOVJL
	Iw5IHH0R0V+0dv2oEhb0tgM8olUpFrqBTxw7TXyNzg+L0dhEGDEPFcYIYaJX6bLI
	Y5rMkEcIVBPOvxcnEC0NNagBeNhOHH1E08bhJvziB/LP0QFCzdYnhY6j+kH2Hy1+
	Mo+VDPxP0cT3dFmbk8ryKXdRaB+o59VFcSW6KqEymqICMqEpp7xYDmx5pFRpAxIX
	9ju7sA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5an25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:19:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEJjXO029528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:19:45 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 17 Sep
 2025 07:19:41 -0700
Message-ID: <2a3903f5-4494-4053-b821-435a75b1ad7b@quicinc.com>
Date: Wed, 17 Sep 2025 19:49:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 0/4] Add DT-based gear and rate limiting support
To: Alim Akhtar <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <CGME20250902164927epcas5p459352c28c0d5c5a4c04bd88345a049f0@epcas5p4.samsung.com>
 <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
 <3a9101dc1c8d$f476b8e0$dd642aa0$@samsung.com>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <3a9101dc1c8d$f476b8e0$dd642aa0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XTpOCO247mJJyou_uzo_-nSWIJjDP4ZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5Ve8HZQOx8E9
 u5uQYBI80UHUr9QAyYfnstmOdU8lC69fuamhRR/o0LNJi/Z7izg0E5XCBXCNPpiX7u9wNvYJP49
 NGjuMaIeR5JsRtMjtID5aZOU13829ddQRdDXfJidFGInqhTNgfeOYpdzQbXRh06MZZndYjXTmeC
 kZcO5UF9vzMUYzRP2M/hV4WiJhyq+FHrMWjc+Ij0WIPvnpdEtjBlZTr+9Yi8+uEL28ybRDy6qJo
 WVQyk9tJWUxHQ5Yn39sbssJM0tHni/G9Ffa2g0qPk1NvzhJVf/D4taI4eqFMovbsvgzgNuzuY09
 1NBMCb2q5vNrt15HmkxH2GKZaUmUcLskS9ofK0sBa6oqeyOYVVZHU8eHdAkGPjX6tS93e3d+kbw
 LHU3T44/
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cac382 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=hD80L64hAAAA:8 a=JF9118EUAAAA:8 a=N54-gffFAAAA:8 a=VwQbUJbxAAAA:8
 a=bLk-5xynAAAA:8 a=yPCof4ZbAAAA:8 a=tC5-z0Gf1kRdzandcvAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=xVlTc564ipvMDusKsbsT:22
 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-ORIG-GUID: XTpOCO247mJJyou_uzo_-nSWIJjDP4ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 03-Sep-25 10:18 AM, Alim Akhtar wrote:
> Hi Ram
> 
>> -----Original Message-----
>> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Sent: Tuesday, September 2, 2025 10:19 PM
>> To: alim.akhtar@samsung.com; avri.altman@wdc.com;
>> bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; mani@kernel.org;
>> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
>> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
>> Subject: [PATCH V5 0/4] Add DT-based gear and rate limiting support
>>
>> This patch series adds support for limiting the maximum high-speed gear
> and
>> rate used by the UFS controller via device tree properties.
>>
>> Some platforms may have signal integrity, clock configuration, or layout
>> issues that prevent reliable operation at higher gears or rates.
>> This is especially critical in automotive and other platforms where
> stability is
>> prioritized over peak performance.
>>
>> The series follows this logical progression:
>> 1. Document the new DT properties in the common UFS binding 2. Clean up
>> existing redundant code in the qcom driver 3. Add platform-level parsing
>> support for the new properties 4. Integrate the platform support in the
> qcom
>> driver
>>
>> This approach makes the functionality available to other UFS host drivers
> and
>> provides a cleaner, more maintainable implementation.
>>
>> Changes from V1:
>> - Restructured patch series for better logical flow and maintainability.
>> - Moved DT bindings to ufs-common.yaml making it available for all UFS
>>   controllers.
>> - Added platform-level support in ufshcd-pltfrm.c for code reusability.
>> - Separated the cleanup patch to remove redundant hs_rate assignment in
>>   qcom driver.
>> - Removed SA8155 DTS changes to keep the series focused on core
>>   functionality.
>> - Improved commit messages with better technical rationale.
>>
>> Changes from V2:
>> - Documented default values of limit-rate and limit-hs-gear in DT bindings
>>   as per Krzysztof's suggestion.
>>
>> Changes from V3:
>> - Changed limit-rate property from numeric values 1 and 2 to string values
>>   Rate-A and Rate-B for better readability and clarity as suggested by
>>   Bart and Krzysztof.
>> - Added Co-developed-by tag for Nitin Rawat in 3rd patch.
>>
>> Changes from V4:
>> - Added the missing argument to the error message while parsing
>>   limit-rate property.
>> - Updated the maximum supported value and default for limit-gear
>>   property to gear 6, as per Krzysztof's and Bart's recommendation.
>> - Renamed Rate-A and Rate-B to lowercase (rate-a, rate-b) as suggested
>>   by Krzysztof.
>>
> Please allow minimum 4 ~ 5 days for reviewers to complete the review before
> posting next version.
> That will also help to reduce the number of iteration a patch goes through.
> Thanks

Hi Alim,

Thanks for input. I’ll make sure to allow at least 4–5 days for the 
reviewers to complete their review before posting the next version.

Thanks,
Ram.> 
> 
> 


