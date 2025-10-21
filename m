Return-Path: <linux-arm-msm+bounces-78167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0EFBF6793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0517219A1142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313201624C5;
	Tue, 21 Oct 2025 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YJm9uCKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28B32ED24;
	Tue, 21 Oct 2025 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050128; cv=none; b=TSexJHBzqZ3nmLzZae4Vv8eo+IPhHs6tRzrGAnkLnDZqf+Sc5tDTpPymgmypU2/Nx6SbVFrm4bBhIUnEqtCNmSgpG8LzUnxiP9kvotu56N/r80gxer1jFqsBOGEDsJBk8zXkwYQOQZTIG2jsj/JKIheAyOrh/pFKnMdzrPBoxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050128; c=relaxed/simple;
	bh=V8ojkgLybtZ5Y872QcEoFC6y33wkXENgdMlPGFwqi6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nQOM6CxOrmD7xuGfuCkwJZ8u77/1Vx5ieTJo9f13oiKTfJVowt44ebvaa8JqdLPSJ3Tewk2E24r7AZfmkISkGedjr9kHpYdBPUeM0TjNDna13R3x7kLH7xiTrS2I/TuTcnkUegBe550cG+sEvryJHbadVPle7cb1th+LtfdSrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YJm9uCKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8BdZo029817;
	Tue, 21 Oct 2025 12:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1P5hepNjzkMZLkylt62MKjPLYr+HOOcamjKRQWyTs+E=; b=YJm9uCKn0Rx9UN6o
	WIb+s7kSUiLOqgiDkaA5AMS4U1UXDVAJlcgPqZMT/gi4lwtKLB1v1Mf2BHTh9V5L
	F6VeZfKLrvSAmoyyCwlF2UL8LNmSdwedHaa0FWgR3neCediKfYkYccK8DKd7N1Ak
	jDe+hNG2SaWZP6eoYz4lqYGXAkjPLpKd/uz6CIQvDQ9ua9e2Dm4qEDx6qAXoxNXr
	BmfNPDtKsAnKNrrX+OGuA5x9ntrMdNksetoWpBey7UDOmADYpGR+RuaVAJVRTsh0
	UREyUgK6nj0VQqAApqF+KTTeGQw2N4Ch9JuU/TaVkIVq87YH4tleggZn/hqoX5E1
	SwA37Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge0pee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 12:35:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59LCZKh1012046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 12:35:20 GMT
Received: from [10.217.223.199] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 21 Oct
 2025 05:35:18 -0700
Message-ID: <413d84ad-0858-4e96-94e5-c0a2ed68e6a2@quicinc.com>
Date: Tue, 21 Oct 2025 18:04:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qcom: ice: Prevent client probe failures on unsupported
 ICE
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <quic_neersoni@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20251021040337.787980-1-quic_dmukhopa@quicinc.com>
 <89150929-873f-4d09-9cec-727f92572d17@oss.qualcomm.com>
From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
In-Reply-To: <89150929-873f-4d09-9cec-727f92572d17@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXyEjT2tCMCDID
 5Xw0gQvOtWastKMMgjsz342DNA8UoqMrBO4cGr/dIxllLLGR2EOb5rItQ52NHQJ6XyxVbDVAjvw
 GFNvHTVNZIeudacOnld0UypHK1ROPgv3J6B3j1Z3FvaUJlUicg+JCgziLA/d/YOWijgLl3IoTB8
 XgFuNACvGupaiM2ylPJnlyklDdlLYI1AixOEZlhuOQxh97YLp6N4SjTWCxb9yOjeMxLRwzHjoAA
 evR/QI924C45rctKtpl8zjA2We8/zHdZkUbyd2dT0nVZ7BaJ0AiXVyxgPQ6vMWPWrXJaxJ2q+UE
 fGl/Z7yuYiVRY11wIF6pPDDXEmSoVW8I4m0WtCTBY3NFpianCllOjMWPWGTyrHi+MsKhnLPlz1X
 7SW1DG9XYNl67myiyZgf5qYi5BK9kw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f77e0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=D4aVSg9HDBEUpO1k-lYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 50PRCV7EWvA_vaPa5IddaNmag6cH101u
X-Proofpoint-ORIG-GUID: 50PRCV7EWvA_vaPa5IddaNmag6cH101u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

Hi Konrad,

Thanks for your comment. Please find my response inline below.


On 10/21/2025 2:57 PM, Konrad Dybcio wrote:
> On 10/21/25 6:03 AM, Debraj Mukhopadhyay wrote:
>> Storage clients (ex. UFS and MMC) invoke of_qcom_ice_get() to obtain the
>> handle from ICE (Inline Crypto Engine) driver. Currently if ICE is
>> unsupported, the return code from probe could prevent the client
>> initialization which is a bug. To fix this a new flag
>> qcom_ice_create_error is introduced which caches the error encountered
>> during ICE probe.
> Probe currently only happens if the ICE node is present in the DT and
> referred to from the storage controller. What does this patch solve?
>
> Konrad

Even if the DT node is present it is possible that The SCM support for 
ICE is unavailable in the underlying TZ framework. With the existing 
logic, qcom_scm_ice_available() would have failed in such cases, 
returning NULL to storage clients where the clients like storage may 
keep retrying which potentially can cause boot up issues. This patch 
corrects that behavior by explicitly returning -EOPNOTSUPP to the 
clients. I will update the commit message accordingly.

Thanks,

Debraj

>
>> The qcom_ice_create() and of_qcom_ice_get() functions are updated to
>> return -EOPNOTSUPP when ICE is unsupported, allowing clients to proceed
>> without ICE.
>>
>> For other failures, such as ICE not yet initialized, the existing
>> behavior (e.g., -EPROBE_DEFER) is retained to ensure proper error
>> handling.
>>
>> This improves error signaling and ensures that client initialization is
>> not blocked unnecessarily.
>>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>> ---

