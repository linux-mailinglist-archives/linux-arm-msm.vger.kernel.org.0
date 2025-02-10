Return-Path: <linux-arm-msm+bounces-47414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F311EA2EADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 12:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A184F162606
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCE91CEEBE;
	Mon, 10 Feb 2025 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dk8ZtkTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4A91B414F;
	Mon, 10 Feb 2025 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186152; cv=none; b=BPUBSFZoowMF1GTeTkw6iPvFDM4HIygmg75dX2mAx+yIqk6xA4vYMTbtAG5rMwLR02kzxZJhf8aYV1g4ktOlbX8qclpOVSDVDgEjqkdd5ODWD8fNO26AJKaBbAolQT/ql1wfQuXmlwKDjw33lS8q1S2iVbh+YncFfWSM5ZmdPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186152; c=relaxed/simple;
	bh=BOOHUEpWTZSL5i9RRmTkOJFKo2narcNl7FiTLRAEYqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SuGkJW+0pPicmI/jXL8B1CBDf9oDADvxmnTUcPwP3R3KRPZEnoMjfMgI+0iTxuWcY50rfI6G9rFxY44MScJ76HhDO96MW003nXD+xrPlzbPoa1ILdOQxQUau3O/FsysVWUjdkLKoN5YmSoQmOWFYHAI7V1wTj4b+bfVatuAeWGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dk8ZtkTT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A76Cuk010407;
	Mon, 10 Feb 2025 11:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwV0O+olVTuwBu36jiuSKcfz1/+C1/1A8aX/BMtVtnE=; b=Dk8ZtkTT11SKYTcl
	wtE2MyB5lmPCCFcegrm2E3dbyFtxL4iCjjVRGRZJBCOaj95C1mekJcZHZY4SBMHR
	B2RFcYjd5ZPS2KoLhRTL121vVYOCeko1MGH3cZb8H4HDwk4ZV3d7a/w5pZ8z4I/b
	E8wNkKMPljPaHltayNkYZj9ea7M4T6xLTyHsVxYOVF/MoQxzldizry0enA3/Rj58
	2r7qt/FOzc1TAa+jyl4fqEVz9MrzkPPMPP3VsMYVoN52VSqoIZ3znS/IX1fFtENc
	uMkGa2GHjoiL9mOKKiWNIQCLAZv8pYW+HOIH8ulB+bVaMC7o4fYstCyE1YfcltSV
	G6mInA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs58r6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:15:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51ABFZWF013481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:15:35 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 03:15:27 -0800
Message-ID: <92e77d82-7c76-4cc4-8e7d-7b72b57ab416@quicinc.com>
Date: Mon, 10 Feb 2025 16:45:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add UFS support for SM8750
To: <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Satya Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Manish Pandey
	<quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>
 <20250209152140.cyry6g7ltccxcmyj@thinkpad>
 <ae9ba351-53c8-4389-b13b-7b23926a8390@linaro.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ae9ba351-53c8-4389-b13b-7b23926a8390@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DmIkOamB9RlxLWlGNq2rO4zHHm3xhCRP
X-Proofpoint-GUID: DmIkOamB9RlxLWlGNq2rO4zHHm3xhCRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100094



On 2/10/2025 3:09 PM, neil.armstrong@linaro.org wrote:
> On 09/02/2025 16:21, Manivannan Sadhasivam wrote:
>> On Fri, Feb 07, 2025 at 11:47:12PM +0100, Konrad Dybcio wrote:
>>> On 13.01.2025 10:46 PM, Melody Olvera wrote:
>>>> Add UFS support for SM8750 SoCs.
>>>>
>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>> ---
>>>> Nitin Rawat (5):
>>>>        dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the 
>>>> SM8750 QMP UFS PHY
>>>>        phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
>>>>        dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
>>>>        arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
>>>>        arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD and 
>>>> MTP boards
>>>
>>> You still need the same workaround 8550/8650 have in the UFS driver
>>> (UFSHCD_QUIRK_BROKEN_LSDBS_CAP) for it to work reliably, or at least
>>> that was the case for me on a 8750 QRD.
>>>
>>> Please check whether we can make that quirk apply based on ctrl
>>> version or so, so that we don't have to keep growing the compatible
>>> list in the driver.
>>>
>>
>> That would be a bizarre. When I added the quirk, I was told that it 
>> would affect
>> only SM8550 and SM8650 (this one I learned later). I'm not against 
>> applying the
>> quirk based on UFSHC version if the bug is carried forward, but that 
>> would be an
>> indication of bad design.
> 
> Isn't 8750 capable of using MCQ now ? because this is the whole issue 
> behind
> this UFSHCD_QUIRK_BROKEN_LSDBS_CAP, it's supposed to use MCQ by 
> default... but
> we don't.
> 
> Is there any news about that ? It's a clear regression against 
> downstream, not
> having MCQ makes the UFS driver struggle to reach high bandwidth when 
> the system
> is busy because we can't spread the load over all CPUs and we have only 
> single
> queue to submit requests.

Hi Neil,

There is no relation b/w LSDBS_CAP Register and MCQ support.
That registers just indicate when MCQ support is present on any SOC,
whether Single queue mode is supported or not on that SOC.

In SM8650 and SM86550, just the pored value of that register was 
incorrect which was fixed by WA but actually functionality was present 
and working fine.

Pored value of that register has been fixed from SM8750 onwards.

Regards,
Nitin

> 
> Neil
> 
>>
>> - Mani
>>
> 


