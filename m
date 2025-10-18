Return-Path: <linux-arm-msm+bounces-77863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BABEC8C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 08:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 57141351663
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 06:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3D6284881;
	Sat, 18 Oct 2025 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF2JSD0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AF6242D99
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760770179; cv=none; b=URBCxvvVL8dh2zEI7BcPjjN3grW9I21UMDYo8zu7JUOifzy0Ekk7TaeG+P4nxqWoi8GbbdaKTzA3LhRj5jtEpc9n/K/cUD1bGwtrtSOLwXV1ho40oPZumaayOmTGErcgQnM3ox9U17i+U7uPWBZGLfz95IshAVd2zu7TX5szS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760770179; c=relaxed/simple;
	bh=NjyFIWWiLjNkFVpMIJdFbukfb0uqE8RJDQ6r2TinqO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVkwew8yjdOyPrnXbifLuWcvyYRsVmTU7yESdFZq9r0gW8BgEw4tnnQklJNQOJRIVgVwO8LfpQ0LwMlD9AHEldwkP1eIskFw1wyffy8rjv82qVHLyfFLYZW9jt3K+gR6INKWjolOB/fW+YjraBZ27Ir0CMaiPCWCTM7LxD4NQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF2JSD0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I6Nvln015795
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjyFIWWiLjNkFVpMIJdFbukfb0uqE8RJDQ6r2TinqO8=; b=ZF2JSD0ynOnd7HFH
	txnyqRD8a5lKpNybNzcBvBr9hiukW0Kz76voObJqJOa4VorkBQD9l6r+PvS3eUgQ
	YpVVGX1a+MAFuuWtHYyc+K0kB4ma4Xs/wB0tJjq3CtDjKU1O50ekaeKI26jOvxyE
	Wze4Pu0hIvDtyls5rAzsxZFh+0yeKAgPVU2cFI9Vrr0BdpZuSvEM72/GHI0Al5iQ
	8LOGrXwQDGWo8KitqHqpA96A4N/Pcl8pQskZFbwLC6AHH8RpSAbo6maP8xNXvtfq
	Ao4fIKKdctXff61HeZP9yLDn6BOSOiQ/tkPS72uerS3WkoTKMoMbaZfO7zABvXdy
	CvFq9w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv08tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 06:49:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b57cf8dba28so2386385a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 23:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760770173; x=1761374973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjyFIWWiLjNkFVpMIJdFbukfb0uqE8RJDQ6r2TinqO8=;
        b=O9noCrNkjlPQ5gQHf5TBLhLRRB017R9IWU8NRJMR1ksI4RQSCLN3mk0pA6IJENfOY1
         S0KyoWNmS0sd7JM82gCLOZ1Fs2hkIHgBIQWbXaah0tX/fiu4FoC2cgjk8QE/J75N2df7
         kN0ETFGDRosht/PrBCNAv11Z6MSQx3hi9BHR7COEbu1+nfal7LKTda5XKvf5bM6PQCjf
         1oCEVyQY1BXFCPPx9dDOE0WRB57xtLZ5vIoo2QttiX4Diom+tot36WHxPxQhFw6xGVgU
         c6mMgmtiSqS6lSIlOxbs4N7XqxmV4SY+s9uSTQc1dn6cPyWSmho7chGZ5cNaAiHgk1Xn
         iX5A==
X-Gm-Message-State: AOJu0YxlFWzmzRZ9hdDcUvpGTr1cs2lw/qbrGQshEu1FtbZiM7M/w5bB
	oTTT4hSBDhutQyCbJlnOr1sHyP2/ENZna3Jg+HRkTFlnGmtIlJfSvak+ks1MsE8wYJDwykY0JfE
	H571uJYbfxti91zcMOfIB0FusUUVoh3APpwnIG/REi2x0jUPR72VG2rZjf2Cu0dzqAuu4
X-Gm-Gg: ASbGncvznSCYw/ZbB+k/ke47KePalavLmW2+tAx+mL8euWBSQd0uRqXxNzYQrMOkZcK
	nK0YFzSOWvjXzy+Y9ncRsC1TtziogyV+jGuw5kYf45fnUbf8QyjYGkhaCsFv0o4QZURjT8ioBC/
	TG+cjLAcweYm21aipUU+efs2FuAVXEweJtU7Fl9MgS60dQS0HeyDnQodKuDCy69gYLSi8nci/WY
	NuSDVRIDjZVbPHUqG3Twa1CQHjymp6D39StYaYE1IXCZWPAusd9hE7neav01hcUQMuL/m3dCZxl
	1BIubL7M4G1NV3sPRjJoNtjeGr1W+aKNoyjzNzVfdc0SfopSfVC1p5c/V3d4b9VsXuvCEq1Ex0b
	0HPYzrsKpCHeU/Kl9hMnAhShYXcBE
X-Received: by 2002:a17:90b:58ae:b0:33b:e034:c1c0 with SMTP id 98e67ed59e1d1-33be034c22fmr4958730a91.23.1760770173585;
        Fri, 17 Oct 2025 23:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLKdYdrSsWt/K0na02/iC7US2cAWuk9uzzLTM/xsMIIzhirt1VKeo3sQKvC5k+1NMY5WSAAw==
X-Received: by 2002:a17:90b:58ae:b0:33b:e034:c1c0 with SMTP id 98e67ed59e1d1-33be034c22fmr4958662a91.23.1760770173096;
        Fri, 17 Oct 2025 23:49:33 -0700 (PDT)
Received: from [192.168.1.14] ([58.84.62.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddeb13csm1554574a91.1.2025.10.17.23.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 23:49:32 -0700 (PDT)
Message-ID: <a26d7160-d303-4257-a63a-1e94b61f5331@oss.qualcomm.com>
Date: Sat, 18 Oct 2025 12:19:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] ufs: core:Add vendor-specific callbacks and update
 setup_xfer_req interface
To: Bart Van Assche <bvanassche@acm.org>, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, peter.griffin@linaro.org,
        krzk@kernel.org, peter.wang@mediatek.com, beanhuo@micron.com,
        quic_nguyenb@quicinc.com, adrian.hunter@intel.com, ebiggers@kernel.org,
        neil.armstrong@linaro.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
 <20251014060406.1420475-2-palash.kambar@oss.qualcomm.com>
 <d027689e-9c45-4584-ac35-411b74b551a9@acm.org>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <d027689e-9c45-4584-ac35-411b74b551a9@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iJgmFqaloUnQThWj7fFs4zTYHKy7tM41
X-Proofpoint-GUID: iJgmFqaloUnQThWj7fFs4zTYHKy7tM41
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f3387e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IrkFCgFlEHDHcOs+Gij41Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zPb30M-LlVYnm6LaiLoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX2LkmIwrBX2yP
 vBbBWXPpL0IvHzuMWOHKRgZM0WNRsA6R2nHTTFo5V9VlhI7DG7QLrztt+dOygxdfumkoBArZNYm
 p8w/02zc7FoCoiI2yynSgIiN5XcuoiiNw4vrAd2kghM1dPUMs0ZSoKbImS7ZTf30jfkxgtFXkKM
 etvMWAMThOvjU2dt3Ih8zCeSTC5gi9VVDF/6kq9ll1I4gEAS+ItLNWwoehP7D9g75jOxfapcVdV
 +DroFwfrSbXncs9OOaLFl/ylqozBnI/w7jUHIhsOwuqXRdzZT2v7O9kXF6z1Xmdo43Kxw8fbSx+
 /YkhYUWVDYF/BwqSdEUKBQlYCCtN2ms/lnmcV2XWXhgUCShpdlNGzvEuQHENjxzLSfZgWZEqYIP
 6MXhrkBq1O7lUBfcIKFQfRigrSFRMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023


On 10/14/2025 9:40 PM, Bart Van Assche wrote:
> On 10/13/25 11:04 PM, palash.kambar@oss.qualcomm.com wrote:
>> On QCOM UFSHC V6 in MCQ mode, a race condition exists where simultaneous
>> data and hibernate commands can cause data commands to be dropped when
>> the Auto-Hibernate Idle Timer (AHIT) is near expiration.
>>
>> To mitigate this, AHIT is disabled before updating the SQ tail pointer,
>> and re-enabled only when no active commands remain. This prevents
>> conflicting command sequences from reaching the UniPro layer during
>> critical timing windows.
>>
>> To support this:
>> - Introduce a new vendor operation `compl_command` to allow vendors to
>>    handle command completion in a customized manner.
>> - Update the argument list for the existing `setup_xfer_req` vendor
>>    operation to align with the updated UFS core interface.
>> - Modify the Exynos-specific `setup_xfer_req` implementation to match
>>    the new interface and support the AHIT handling logic.
>
> Yikes. Please disable AHIT entirely or disable/enable AHIT from inside
> the runtime power management callbacks rather than inventing a new
> mechanism for tracking whether any commands are outstanding.
>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 568a449e7331..fd771d6c315e 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -2383,11 +2383,11 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag,
>>           memcpy(dest, src, utrd_size);
>>           ufshcd_inc_sq_tail(hwq);
>>           spin_unlock(&hwq->sq_lock);
>> +        hba->vops->setup_xfer_req(hba, lrbp);
>
> What will happen if hba->vops->setup_xfer_req == NULL? Will the above
> code trigger a kernel crash? 


Thanks for catching this, will take care of this in next patch set.

>
>> @@ -5637,6 +5637,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
>>       }
>>       cmd = lrbp->cmd;
>>       if (cmd) {
>> +        hba->vops->compl_command(hba, lrbp);
>>           if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
>>               ufshcd_update_monitor(hba, lrbp);
>>           ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
>
> Yikes. New unconditional indirect function calls in the hot path are not
> acceptable because these have a negative performance impact. 
>
Sure, will take care of this in next patch set.


>> @@ -5645,6 +5646,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
>>           /* Do not touch lrbp after scsi done */
>>           scsi_done(cmd);
>>       } else {
>> +        hba->vops->compl_command(hba, lrbp);
>>           if (cqe) {
>>               ocs = le32_to_cpu(cqe->status) & MASK_OCS;
>>               lrbp->utr_descriptor_ptr->header.ocs = ocs;
>
> Same comment here. 

Sure, will take care of this in next patch set.


>
>> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
>> index 70d195179eba..d87276f45e01 100644
>> --- a/drivers/ufs/host/ufs-exynos.c
>> +++ b/drivers/ufs/host/ufs-exynos.c
>> @@ -910,11 +910,15 @@ static int exynos_ufs_post_pwr_mode(struct ufs_hba *hba,
>>   }
>>     static void exynos_ufs_specify_nexus_t_xfer_req(struct ufs_hba *hba,
>> -                        int tag, bool is_scsi_cmd)
>> +                        struct ufshcd_lrb *lrbp)
>>   {
>>       struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>>       u32 type;
>> +    int tag;
>> +    bool is_scsi_cmd;
>>   +    tag = lrbp->task_tag;
>> +    is_scsi_cmd = !!lrbp->cmd;
>>       type =  hci_readl(ufs, HCI_UTRL_NEXUS_TYPE);
>>         if (is_scsi_cmd)
>
> I'm about to remove lrbp->cmd so please don't introduce any new users of
> this structure member.
>
> Bart. 

Sure will update this as per the new change.


Regards,

Palash K



