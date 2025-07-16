Return-Path: <linux-arm-msm+bounces-65123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D826B06C63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 05:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92806562E53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 03:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AF127511F;
	Wed, 16 Jul 2025 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckUsPgXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360A274B44
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637279; cv=none; b=c8RZtpXvEoo2FFEVdTn+hYdfPy2iWVQQFYo3fV25M+ndMa2rVO+pgBAzKKhObgnI2Ubp7H4LgnCiIxSOpvCOUzuR9QNrCOAqwQOg6x9wkmuG0j/9OD0me3r0WmLgV0LNo9S2kyeWRlVmzM0Uc9zTzwq5Og7jyQ6kADWjKPGG6jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637279; c=relaxed/simple;
	bh=x2YmEfi4DOeF3oPusAVS3QHBIEGEUtm+IdK2KqEFIhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOPTBir7gz5T3h5OfyZ006p2YeykbXmz1tIUJZnEIhvjYpetGdDb0/kJ5UuX2GLujM/6g25+amEHtdKS2FwFYO160bcVvbSkof3kfWRXhSp/laY3ofbOBtESPlsi8gg+c7e/A+lrVRlkcJsDwFkqOHtbdtn3x+hyBZ6e8ZElfko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckUsPgXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDEKO007299
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7DlV/8Rgoc2QME5C5b6YyW4QRONXQ6RkE7aJR0KYfE=; b=ckUsPgXsTzHPZyCU
	CH7PPwOU19DHO/qxZJNvXcTjmRoQ2NUYmF/T8sQHMXUSWP/VTHIy1KzV89H4YzRD
	gcY83Kg906J7DisQcSZsUjZbBO7gWRROGBUkiJv1nZhqq30+zL0iV3ak8Mb4kU/Z
	laqrnjsdo3AWDDxBy/+lzMCpiZr/mOI6JPpGSae9TLUCh9Ze9sdawyzddoEKGfe1
	6GBNk0Wmfn1C7/XQWc+D5+iWgON72vxTJwxt1LzaulNuxEcVgYBlm6XNSaReK2SF
	bPYBTlVBZxMt4u98dXnq70F5yPaSBWBi/LYrC6OyEYMlIvTyaVB3Ei7OLuqaoPKc
	/WyhMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5tj0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:41:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237f8d64263so63503165ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637276; x=1753242076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7DlV/8Rgoc2QME5C5b6YyW4QRONXQ6RkE7aJR0KYfE=;
        b=jb4Xfhf375gZgtWJ2hklvMtsBXh5AcMV5WiJ3DV8fMfFVycME+KnBzDHuq0dS2h1Gf
         X+gJ6r9iyOQ6a9MdfmgPd8RxwQZ87uflLQxclFXge4Og1AUErV6YeJhVL7e62oT3HosJ
         hwdUa/wkFIdPO5h4rkjIXnxfPUer0QL9VMq4oWO/R02LXfw88PBFG9Xsnf04wguEzMKB
         lGh6UVoMeBJMvPiBIhLjDzLgg7kKqqPqb//AEYy8WzQc9GjWZErdN7rSjG668b13abyt
         hKFC1ZaQ9QuIp+TV3I9QhOGutgDcZvoqKrKhi1SNCow/nnQIJ8P19I9GS9g21GfXF2Fb
         Wjlg==
X-Forwarded-Encrypted: i=1; AJvYcCUrc9GpYNVo9TLHDNQ7ma2VqGbDSYdqcyfNNHO9NOKVHRJBSOBypRX7/nnu4yygwLxMn8ivqQmAmCorqzYV@vger.kernel.org
X-Gm-Message-State: AOJu0YwspXkSybiPNgHAh7GEorBHhx2/AiKrsO/4mkCUe/T6qkrcbN23
	NStddgiXKIqXF1pSn958bc5txCHo+BIeIVR/sba3llU2LqMGm7uyIFh/Z6gvRe+8GNGZqJ3HGK7
	4fUsuUvnDx5m8yipntrtvMZtVF8CYuaTjdsHWCErd9sLPaZ4/Ew9FJwakKi97IuRuFhvv
X-Gm-Gg: ASbGncujGEB/mTVG6h/UgkymNY9rHHxatsy2nMRse6c5e4fd1Gm7mRse6fHScHWanio
	h0gBhNUPfXJtsdU+wOq0oUX34rq7piUQCm51Pi8QA/4unxY8gN7jDA8I9QNEEudzbTaz5UvprFP
	gbIxnVIm8sITDB/P1LZO2HWWQBG6U8En5a3ijl7pLL9Ktm4htp4nX8AdTyS75Rq1qJ8pky03qhT
	H/Z+IT5sKCQ56DjoC9OaO9l5X8aD2qfCzM5gDq9yS79eUbyb2cKY41qx1FcGQknP/ZjdDxqr5C0
	FTwabRPlq208PJkOpnzPPh+6q/ZvgD61y4ZbKk9O8d3j80/YN7mE2QquC7tht0nI35VTYTjvtst
	27c0f/7aOs5x97fXYacQ+ZhiqXNd9nmkU
X-Received: by 2002:a17:902:ebc7:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23e24f4a753mr19665215ad.21.1752637276379;
        Tue, 15 Jul 2025 20:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHukbpKkFgMl3hVwwU3jnULq2RJj+tfCmviMWav/frdVjPYvdY0FvZcJh3foXEWacaWXgS/gQ==
X-Received: by 2002:a17:902:ebc7:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23e24f4a753mr19664785ad.21.1752637275925;
        Tue, 15 Jul 2025 20:41:15 -0700 (PDT)
Received: from [10.133.33.219] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4289274sm116090665ad.43.2025.07.15.20.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 20:41:15 -0700 (PDT)
Message-ID: <05afc25c-f5ab-4382-8b66-c47a6ea2fa2f@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:41:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] bus: mhi: host: keep bhi buffer through suspend
 cycle
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Yan Zhen <yanzhen@vivo.com>, Sujeev Dias <sdias@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel@collabora.com, stable@vger.kernel.org
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
 <20250715132509.2643305-2-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250715132509.2643305-2-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68771f5d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VXRy36hZkihdVoTD-JQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yYBbzBgOXGKHi1J2AZKEbeKyC64p-Y1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAzMSBTYWx0ZWRfX/px61glnvWy+
 3SKH3eujiYVDPcyNZQJkGB245gAXDkv1UB1ENSN5vye6AOHiGtw4nQf0rDNhiOYeux+8UbHFCvM
 Zf0iDtSOpdNNO9CsCR92f9/AzSTnWlISDj9xlWtdlizpB1ZSsqLIyXufhPqKTrvQHYcHe4iRRyM
 rXzbLRs1R2zIMmadEaiasdVCg9L4ZvFDUPgEVCl9iWGQKQHGN2ax5FfGval9l6h8/pyMpwyzSpe
 fJatZ/Zp9yY6ylhkCNvFuSDxtVd8f5usrXuqNWo9a5/hmtoRAkRCLEZvdqhoG8vM3kg5dZFbuUu
 fCR88uC3i9rIM+M9qwkyX3pVeDk34DKVb+g5NYw6DqotS8lMLnp0O7ntvA1Bj0TAVzw7DWJLezR
 +Mil3j3jgs+16Ye2bTsg9nyQ0csTHdEBbPtaisQ4Bz6TcGWXkTvE9AAhVK2IVrtP8nIew57N
X-Proofpoint-ORIG-GUID: yYBbzBgOXGKHi1J2AZKEbeKyC64p-Y1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160031



On 7/15/2025 9:25 PM, Muhammad Usama Anjum wrote:
> When there is memory pressure, at resume time dma_alloc_coherent()
> returns error which in turn fails the loading of firmware and hence
> the driver crashes:
> 
> kernel: kworker/u33:5: page allocation failure: order:7,
> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> kernel: CPU: 1 UID: 0 PID: 7693 Comm: kworker/u33:5 Not tainted 6.11.11-valve17-1-neptune-611-g027868a0ac03 #1 3843143b92e9da0fa2d3d5f21f51beaed15c7d59
> kernel: Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> kernel: Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  dump_stack_lvl+0x4e/0x70
> kernel:  warn_alloc+0x164/0x190
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  ? __alloc_pages_direct_compact+0xaf/0x360
> kernel:  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
> kernel:  __alloc_pages_noprof+0x321/0x350
> kernel:  __dma_direct_alloc_pages.isra.0+0x14a/0x290
> kernel:  dma_direct_alloc+0x70/0x270
> kernel:  mhi_fw_load_handler+0x126/0x340 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
> kernel:  mhi_pm_st_worker+0x5e8/0xac0 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  process_one_work+0x17e/0x330
> kernel:  worker_thread+0x2ce/0x3f0
> kernel:  ? __pfx_worker_thread+0x10/0x10
> kernel:  kthread+0xd2/0x100
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork+0x34/0x50
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork_asm+0x1a/0x30
> kernel:  </TASK>
> kernel: Mem-Info:
> kernel: active_anon:513809 inactive_anon:152 isolated_anon:0
>     active_file:359315 inactive_file:2487001 isolated_file:0
>     unevictable:637 dirty:19 writeback:0
>     slab_reclaimable:160391 slab_unreclaimable:39729
>     mapped:175836 shmem:51039 pagetables:4415
>     sec_pagetables:0 bounce:0
>     kernel_misc_reclaimable:0
>     free:125666 free_pcp:0 free_cma:0
> 
> In above example, if we sum all the consumed memory, it comes out
> to be 15.5GB and free memory is ~ 500MB from a total of 16GB RAM.
> Even though memory is present. But all of the dma memory has been
> exhausted or fragmented.
> 
> Fix it by allocating it only once and then reuse the same allocated
> memory. As we'll allocate this memory only once, this memory will stay
> allocated.

BHI buffer is not needed anymore after initial firmware loaded. So IMO we can not keep it
just for the purpose of avoiding OOM in the future.


