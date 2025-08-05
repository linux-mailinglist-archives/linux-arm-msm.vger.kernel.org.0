Return-Path: <linux-arm-msm+bounces-67739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D9B1ADD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138033BF940
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3D921930B;
	Tue,  5 Aug 2025 06:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c0k/sLMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29248134AC;
	Tue,  5 Aug 2025 06:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754373836; cv=none; b=jMpPdvQZJcdGeKmezIZEuRNSYDkEoPMBbPXS14ZzOlvjRTFukdarf2a9MV23TdCuRQR75yvWyEZwCr2FmxyxF0C7teiLfDfb3FARdsfyQkxW8GodYXZ0BiLYr3+jYX5GzDGswkLRyHMZLKi6/BlM5sknL15QmVuHDObHPlSxcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754373836; c=relaxed/simple;
	bh=uFx6VkLkVxz98CKMaKd8+oqScAm2qMKIvsHs3hq8To4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SRHVE3fQ6ZRQsQJ9vRKGCyqfklC8tPRExwL+pRiIMMMNIDoGTPVZG2SvEDeu0JBbZJAZKbFcIPxmCSHWn2TuJNc6dBs/pGL/Q2ak+HHQ5bHiFzEJzDXVGRHFY6UH6qvCQX1I7MQSQ0kWuC1Z6sNqPRBMVqzB2fME8Rdn0RHdvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c0k/sLMw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574HLNSt007000;
	Tue, 5 Aug 2025 06:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xsxhO91rKIiNJ+M+FHdT5NrODUMY2n4R0l9UARqQkxs=; b=c0k/sLMwOXZpfaA+
	k3XCGaNW/MtJwDJZAS95ZRQJbx2F/nsW1rqU31KwgkxWdq5N4Gi4DWadAsPLPMtw
	hPBN2/hLT5OAvRg7V0ZyGdWi81IaDxYOu2QIO50eubg1ylfxH07KN2qdjesa8hX2
	cwYQnFwr5V83mjq74ixtwq9kDuvSh891DxJyOSkRq4eWKeY8CPFt2sLueIVSCbk2
	YSLFgtums0VSPqoCQBErtM0xzpZqG/HbiMs6ft11YSpnzfIX2WTz9PATg/NTFtrB
	QN1Uek5kd0YXIkUANenDTf4n2Jn2mOUjS3aGanYOX/fD/X7lgQyRTXEkJfdnlpss
	aSQ2yQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqqbre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 06:03:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57563acM028800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Aug 2025 06:03:36 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 4 Aug
 2025 23:03:31 -0700
Message-ID: <81e403f0-51b4-4efd-a06c-c6d7b02802dd@quicinc.com>
Date: Tue, 5 Aug 2025 14:03:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "avri.altman@wdc.com"
	<avri.altman@wdc.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
 <1989e794-6539-4875-9e87-518da0715083@acm.org>
 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
 <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
 <418bfbe4bfb3f04e805af8fa667144f148787aeb.camel@mediatek.com>
 <08dcffa6-6cf9-4c79-8aa9-a82bd42d3932@acm.org>
 <8a918075-627b-4707-94db-cc86b2f7a5e4@quicinc.com>
 <efdd6dfcca06680bedc02a70fae1b35485083250.camel@mediatek.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <efdd6dfcca06680bedc02a70fae1b35485083250.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PLLLKBRuAfdke-6KifiQfA1XFWA6J33_
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=68919eb8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=xWh9aLBLRyxQ5mn9DpsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0MiBTYWx0ZWRfX/HIqBU2vz/F8
 zOQ9kyUGf9N037Nm82GykD6OL3vhB9ocYA3Vl4+MqAxl5+/aZA3SSg/l7l/7NZjLS0gy4uF/REt
 ks555ejRwbJzu5HVl4ShhvFFdNofjv/m0i5vcvPT7XUhg174GqVE47tbAXaSskdIIMXS4U2HePT
 GDxSVu8DE3hyCSksf1iNwmxxQsGp4XvtuiTd7JQGBx+5vyRUpGCSGLBcH+XXxdYJKbN+z1hIcMu
 rOLUL4hoBt5c7LkTg2yr3LnqLt0aQE25QjfDsOc/E3IqkKiHxdD6mfcyx0FP8e0SNeugzJ7P45f
 LpdR0hy17/fhgehbOc27ix3g0f182XE4VzdQ2lvHTXjWeYfq6OVR+ggz2Sv/NoF635AMJ8fayly
 YL5s/tew4H4QcXcojeNUr9KS7MA4NUm6BtJgvmEooDhRkrOLnf0VvV2U4uQZrq+fTe3rZeoJ
X-Proofpoint-ORIG-GUID: PLLLKBRuAfdke-6KifiQfA1XFWA6J33_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050042



On 8/4/2025 8:43 PM, Peter Wang (王信友) wrote:
> On Mon, 2025-08-04 at 15:54 +0800, Ziqi Chen wrote:
>>
>> Hi  Peter && Bart,
>>
>> How do you think about using
>>
>> if (!mutex_trylock(&hba->host->scan_mutex))
>>          return -EAGAIN;
>>
>> instead of
>>
>> mutex_lock(&hba->host->scan_mutex);
>>
>> But this way will cause one line print of devfreq failed.
>>
>> BRs
>> Ziqi
> 
> 
> Hi Ziqi,
> 
> After applying the patch below, the lockdep issue no longer appears.
> Would you be able to upstream this fix?
> 
> ---
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 2ff91f2..0af34ce 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1435,7 +1435,8 @@ static int ufshcd_clock_scaling_prepare(struct
> ufs_hba *hba, u64 timeout_us)
>   	 * make sure that there are no outstanding requests when
>   	 * clock scaling is in progress
>   	 */
> -	mutex_lock(&hba->host->scan_mutex);
> +	if(!mutex_trylock(&hba->host->scan_mutex))
> +		return -EAGAIN;
>   	blk_mq_quiesce_tagset(&hba->host->tag_set);
>   	mutex_lock(&hba->wb_mutex);
>   	down_write(&hba->clk_scaling_lock);
> 
> 
> Thanks.
> Peter

Hi Peter,

I saw you raised a ACK change to revert this whole change on branch
Android16-6.12. Without this change, you will meet stuck issue during
stability reboot test due to request queue quiesce and unquiesce
mismatch.

This lockdep print just a warning, and as per my analysis before, This
is a misjudgment. But stuck/crash issue is a real issue which has real 
instance.

Can you abort your reverting change?


BRs,
Ziqi

