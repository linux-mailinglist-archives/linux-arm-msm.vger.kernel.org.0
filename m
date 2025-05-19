Return-Path: <linux-arm-msm+bounces-58370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B478AABB5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17781898BE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 07:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A9A268FE4;
	Mon, 19 May 2025 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mtOSoylE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6195268C42;
	Mon, 19 May 2025 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638814; cv=none; b=TZS3nbmIPgjybP7uS2b3BjGOsjeHl3wwEEpFjCtEA28fH7B5lpW/nGggm7HOC5HPteiBj9kZPPWyS1APM5Nzv4ntpRRr8lkwVGZn1M/x589aPWPY88P4O/axVQeylr4ShFJo3zoYv5hOW5H+vVWhnJiKo/1yt4DAsHt7aq1T788=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638814; c=relaxed/simple;
	bh=ADIaQA4MX7T346Am8MwIuhqVQVd9hK35wgGMYFazN7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ihy0Mm6lRId1UNnfWBe1LG+qa5b69PxEr2hE2QCo9olpOEMAKxRFnyOjM8qo01W9MrhD+tj5DTm0jApc5vV+ImE5gz29nF0OTBXY+/r5DSHbLk1m7sSK46YEfWg6MmyIG/1Im16+7pI4ieyy6QI4QK13h6iisJKBHozI28/7zak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mtOSoylE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F8L6014393;
	Mon, 19 May 2025 07:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHkFEw6sVdTOUFXGZ67/iBXCfONE1WB0Bo1rp4ZCQy8=; b=mtOSoylEYEr1GYMX
	EytlOJyOx4hPBIBKGoE+F2yeuITsV61ode5CP2X5B554tW53s+Lrtc0k4AAbgKzR
	n2tiXI0pzMSCA7Riye+5h1XZ488ZSOntp0b6Cy2ApKHpJ/NjUVFlYZpHhy7DfDdW
	cDioMWujMqpUdIJkvId25c4InhK/JXa9EOOQijg4PZdDTuYT36P85ocJcjP7mLej
	/XqjD9jqmUWUUcYziwPI4jl2r1L4GNYttYzUuSUCOR16wvxsldywI6PV15LlcHDv
	2F7un+QQFTHmQa5nEKoWZMu0ZnnIqqueFvU20NAbavCVQYlf4uABASipn7XBNz5Z
	IcoOUQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenggen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 07:13:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54J7Cmfd026683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 07:12:48 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 00:12:41 -0700
Message-ID: <14091125-20f4-405d-8022-f02ac3c311b9@quicinc.com>
Date: Mon, 19 May 2025 15:12:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
 <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2_VoA_9Ie_kFe_t33v2Xz0-gQ4NOd36P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA2NiBTYWx0ZWRfXwLNH/R3IrbFi
 UinX3ozmGPLXUYm5/LJi32zU7cO5v94wHNuwsioP1uormqLNVi9XoyHIl5n9PsSthwm04hdXU/0
 3m/wwOeiXhLFIWoib7DXQWQVRPp5pbePHJ6JTVSVnN1ak9QeD6gsdKIphU6ZcADtmq7jKRgxPTf
 H+Vi8CoOGwE4f3JkHfmDOjLNJJNh94vPOK3IDydVaoQ9IyEdjsRoyz3LVD6udZgY/JWcngYabmH
 YmGUeUJhRfYtSNDf9hyg3pVWZSQQQBv1CtO4EIITSJkk4zuxedfbJdebRh4gRkNvlU9apz9DoRd
 JMk72ccsjoBSJjmN3b2sGMFpFgS+N+Qlif5IcMEXbWcPwe+YPbkc6U/MdWd2G5r4yAThsHc14o8
 yej8Z40HzuYJNAggs5c4dkvQZPnYwGgptuyTRWZlzCNqEuLoV9GVuisIl9lCPBdPTcg5iIlI
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682ada18 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TnUyPrpFTRFRPAhg5l4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2_VoA_9Ie_kFe_t33v2Xz0-gQ4NOd36P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=798 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190066



在 5/18/2025 12:59 AM, Konrad Dybcio 写道:
> On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
>> On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
>>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>>> remoteproc functionality.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 86 insertions(+)
>>
>> Is the MPSS not present on the QCS615? It was a part of the SM6150
>> design.
> 
> Hmm.. good point..
> 
> It's surely not there on QC*S*
> 
> it is there on SM6150 though, quite obviously
> 
> downstream ref:
> 
> https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi
> 
> Konrad

Hi Konrad and Dmitry,

I have confirmed with the relavant folks, and this variant of the QCS615 
does not support modem.

-- 
Thx and BRs
Lijuan Gao


