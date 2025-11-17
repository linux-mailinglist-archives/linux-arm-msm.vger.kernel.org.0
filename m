Return-Path: <linux-arm-msm+bounces-82056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE6FC62B51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B1C04E2A02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8253930EF7E;
	Mon, 17 Nov 2025 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JftLM7Qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112032459E5;
	Mon, 17 Nov 2025 07:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364110; cv=none; b=F/dF11ovP4EM3CI+hhzBWD3STO7vXe33YHNd8E7ttYHzZHkieJ9lJzK5ImZx3gAWw3lpnb5kxxuVH+pWtORASqdaLNX9F6jnHfPWpbrOAFCf+auFuw7Jb9ImLBEaSxyPJlgownlqs+bqyXrhdLETp1s+Wt7Lbde/OaEZzh6jfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364110; c=relaxed/simple;
	bh=/hiUj9v7C8eFR6vyPQODkaUG6fJDfRoXrDIm9IcVOsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UfhDHUkkz7iyj3zb8G0m+0Kzb+FQeXQMTo4NmAUuHHEwWn6OKORJMIAgRgiRtPZIeL8KtXOKIFSEGCo2yJgbEPQh7NNcrdwY7DnTOdtheogBu27g8/JFDy5ks8PtxsbhP251Svv3ZmRe9JmAn5GdTvUXmMRzeYICtASZm7/wA2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JftLM7Qd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oW8o2911818;
	Mon, 17 Nov 2025 07:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHrS6EkPR1/omWAQQChZOxtha1BhKk3YL47jFCVm+2o=; b=JftLM7QdrGbYKufL
	1E2nWb/8/h2g1LQdFsENDKt/llE5tWZnZHZtLBYHAwYzoEMtBRK6EPzVkLCrDDHy
	TDgFOxUBcUGXsaWOAdhk9ldjS2yQWcCZAFuenMleQQFdyw0+dzeh+1G/fMnaBZx+
	0TiRUOhn1Ct1iMmsT5BHB3JoR9mt9k+ahguQ7LfPaGwBSzDefj3SIOjRVRn6+l++
	KTlA0qPI8SIUbQvVHdxzUeNsMsI60YBi45q4pKXaFv8LgEtsEhXDbNtf5PnPmfhV
	BQ955mFD4RTpxIfx+E7xlr6R8iETZOvNPtaU1n1dF4Geufyd24S6J89GI0AFAeZ0
	SpKXZw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcbqqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 07:21:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AH7Lhm6020937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 07:21:43 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 16 Nov
 2025 23:21:40 -0800
Message-ID: <1ae6abe1-ffe2-1233-0778-f5031ec239a8@quicinc.com>
Date: Mon, 17 Nov 2025 12:51:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Eric Biggers <ebiggers@kernel.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_varada@quicinc.com>
References: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
 <20251111205212.GA245945@sol>
 <dbea629d-5aa9-4a85-6316-25ac82a33520@quicinc.com>
 <20251113173500.GE1792@sol>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20251113173500.GE1792@sol>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MdNmeQKNZKIa9p04xDxB1aQmdPelg0U2
X-Proofpoint-GUID: MdNmeQKNZKIa9p04xDxB1aQmdPelg0U2
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691acd07 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fHQkT2EN1QDR2Zix81YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2MCBTYWx0ZWRfX5Sxzlw0W3Nwj
 /J9c0qgjI2JYFc/Hpx5r0Ap11mtVsUReZP9DPW2fZvXoxTp0Fp1o3xe1cz4CM/4+tbr84zOC3fZ
 rVryrHjmEeQLX+RSJxQBvI4L6SHVLPdT2f35u0yV8diKPWgJM2RWfcGT2YMkXMiYM+kSEXDVgTC
 AoMqdQKliwAeQXja2ShnX4kxCWw/CS8q8f0tcn/3Qs3xaW4XnlOwiT4f5lmfmXWRGGhN+rtbb0b
 xB4NDUKhBZhrFHR8OG9SVQ65d6EK0ACfhXv22CNgnuHRjc78h2+eS0rl7FO4pTF83pVMkCrvO5l
 H0Wf8iZRyQ4KHL4JTkJcSrQ9K4dI+xQ4guJQgHhsc28valCqc0c7fYyDOrzob3+feU2oQH3V5Lx
 5gDBJWyuaKlbihuiBwdiuCcZJQqO4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170060

Hi,

On 11/13/2025 11:05 PM, Eric Biggers wrote:
> On Thu, Nov 13, 2025 at 12:41:28PM +0530, Md Sadre Alam wrote:
>>>> +	if (mrq->crypto_ctx) {
>>>> +		if (!msm_host->ice_init_done) {
>>>> +			sdhci_msm_non_cqe_ice_init(host);
>>>> +			msm_host->ice_init_done = true;
>>>> +		}
>>>
>>> This means sdhci_msm_ice_enable() is called only once per host
>>> controller.  It looks like the existing call to sdhci_msm_ice_enable()
>>> happens each time after the host controller is resumed.  So there seems
>>> to be an inconsistency there.  Which way is correct?
>> Thank you for highlighting this. After revisiting the code paths, I believe
>> the behavior is consistent across both CQE and non-CQE modes.
>> ICE is re-enabled on every resume via the common sdhci_msm_runtime_resume()
>> → sdhci_msm_ice_resume() → qcom_ice_resume() → sdhci_msm_ice_enable() path.
>> The ice_init_done flag only governs one-time initialization in
>> sdhci_msm_ice_cfg() and doesn’t interfere with the resume logic.
>>
>> In summary:
>> CQE mode: ICE enabled during sdhci_msm_cqe_enable() + every resume
>> Non-CQE mode: ICE enabled on first crypto request + every resume
> 
> I was looking at sdhci_msm_cqe_enable().  Based on the caller, it seems
> to be a per-resume thing too.  So it doesn't seem consistent.
You are absolutely correct. After reviewing the code paths more 
carefully, I see that sdhci_msm_cqe_enable() is indeed called per-resume 
(via cqhci_resume() → cqhci_enable() → sdhci_msm_cqe_enable()).

So For consistency, I Will remove the sdhci_msm_ice_enable() call from 
sdhci_msm_non_cqe_ice_init() ? since ICE is already enabled on every 
resume through the runtime PM path.

Thanks,
Alam.




