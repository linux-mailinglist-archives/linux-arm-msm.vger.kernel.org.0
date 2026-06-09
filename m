Return-Path: <linux-arm-msm+bounces-112270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o2SROsRyKGqKEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 22:08:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DE664048
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 22:08:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U+4KgRIO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jCLLwXF+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112270-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112270-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5853D3049FEA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 20:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5EC369991;
	Tue,  9 Jun 2026 20:03:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8433112DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 20:03:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035424; cv=none; b=FvtPUXuBS8JCUk4w65DHtrRL3d1168X7nCeG1uQFIZ6gEK3tlG+HXk/pjlY+0O7M6RFJe54BIKk4VokiD2QzcviosrpQ+/dYx/wFuF1KhlmJdZxjq6nxRO/RJfLu8JLWV/kEDuDk2nydMI2U/55ZHRb+KtGhsP4klTAyxmuZy4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035424; c=relaxed/simple;
	bh=nX0ELnEUwepDubWQW9f5f46rW8OESnuwHdSOWr6T1co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wd2ZPz6nAc9On2W6XP+ADUXJD32E9JwHzvVWbJdQ6FbhEe8nOtHrl9If8coOAEUXGlO4pgCBkYujt/RDD/O2MxY6tfvbn2/LquVBvJmIwthW61A2W6Wt3cLxMoP8CvoTvZ4b43SKZaxbZGvkdRQd7G4N35VssCp3pSUESKB35z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+4KgRIO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCLLwXF+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOmT02785590
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 20:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+iDlhgiTQyAJZ+H1EN2BAvPrKf8+QgAknHjV7x0ZDU=; b=U+4KgRIOwOX7SWaU
	GfbWK49NGSGZ3n2YIvvI0tkLctbJKl1yCIXUFpa1j1RlecsO8Ba9/pjJ7MX1bMPI
	h1Jkje4okRBiX2vPEFDqvR37fC5cwFAswWqPx0H0JMkwSJnTpc3cxBFhMd5q0AMn
	OFOGx8cMjQxSqyljb7vpWS1Q5L0gTAzXAqOwPesdUar+ysyuEAXGXL7cqYxvoK8X
	t3aUWcMQMo6APsrqbaicZmWcKUl7EdTOXHqoFudlI3h5M2HFfFgYzP4mneYfOycD
	LDwpIvuT+rlsB9yo1pgBPKvxncJUbCeF5BNTj9u9II50Zuzg3nBL/XUm+QYfkE6S
	PP0yGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3ju58k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 20:03:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bc02d28b6so4456007a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781035422; x=1781640222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+iDlhgiTQyAJZ+H1EN2BAvPrKf8+QgAknHjV7x0ZDU=;
        b=jCLLwXF+9s66JmtxYm4PjERj6tJGNDY+zMCk/+R/k0THTUgzsE5G4PW1fownT8ppPu
         vl1dQOGmak6nFQpbIbDkXgk4JijSWoEzc3ZoWizhF3H1bPf6zYvdZOVQMWUf+R+Q2M9S
         FDyf7tmmYRUqHKZww5Ki4g7RSzkbja4Vk7IKGDZ7FA4OwCALuUWFFSFvjUKt2I6c+R6W
         zc3VO6KiCbtXqZNbyR/HXaUM+og9fzLDeqII7a0iE2DHka/a6iKz4UcsJ0P/TBEpLaZl
         fJUEWxsqdsIDDWsaK6vnJVcb8BLa+IsJUQtboy9x5xPgfmNMLwkTs0xuvkrVIcuTr2bL
         aMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035422; x=1781640222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+iDlhgiTQyAJZ+H1EN2BAvPrKf8+QgAknHjV7x0ZDU=;
        b=Wy/V1jmxsHBpGytaN9KogwoiZpvOEg91gQlaysDnd5bE7Mu/Dhl6nZF9MDue1+m7qj
         eM5ASJIrGECZR8O/IUN0KH26WvZielJtOBEPgDnChXWhsFd/masDfcw+dqLmwy8Ql6zT
         NEIZhBE/Z3SU1TFM/8CtzAyn+IC1DorwmWJx4VRGCQaGJbT+l5cImuGwJEbW6yi+MK8r
         0CUur1zy2/u7tMatzO/IrOSYBiWa6b1haGJd9QFG+y0Fi32idD81H0Nb4Y112a1Gg4P9
         3BAQJgm56YGY4jqgCJtBVeNU3dQRJ4wB4d9vsjlYD1dJxL8gizjgAy9UdJpt39y2x+9i
         fH6w==
X-Forwarded-Encrypted: i=1; AFNElJ/uIW6G66RaIbRcKCC14exM9UTJ05dPpk663g6jmjbvPOts8h55E84pjEUA4MFr2zsJ8dEZ56Ho7wqWgGaB@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXv0S1SIe1GruZMi9eWos/cnBpHPDEShnMOmlRCWycSkOwmy0
	u0dh/CKvlsulRGyxO4looPkgpaMvUqWizZBKHyi3ggkRgYTUxsTCQtghv5Ec2Ro3qM84PI033Uo
	nq2dzHqT0l+49TLDXVivHhLeOP1k9v13YtiGyjwe3ILz74fSsjKe40yfXL2RdzL7QLAHA
X-Gm-Gg: Acq92OEl16UlQwQhtL8EXChybkTg6zteHEgbcPXpSRN/QdlyPY3wA0IbXEyVqKBhhAq
	+BOuDbNXP3uSI8nzxHqOsDLJl6ungya5krohW2IseSeNAvZUqLXhdxlMEyaLk7zoNbqiQbNXjbb
	xLxMZ+n+NlD+PxYjwFeOLKowpiuFwQIDJ+3hfX4EyXoGgDuoaYdBMy4UFaLH/0ui4XUFEmIzJF8
	95D42ypSR7nDwZs2VqXI+57w1n2HvxoW4YhMbMLhDtcAFAnhy8FCxRSBwl8EK/bes4Xdi1yF11I
	Oo3VMYDGK0ZRyqZsPfTpTuHXjM7cbpCjiBEQVvKaDM2gUgchWS1/0SEHdl2KItYgCLEuYI9M0wN
	kMuBhD4sYT2/tsrBpdtoRQ7jBaww7jos7el+17dClBVKrI5Yt18hjKkDF
X-Received: by 2002:a17:90b:4a50:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-370f0c4ecf2mr23289068a91.21.1781035421755;
        Tue, 09 Jun 2026 13:03:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-370f0c4ecf2mr23289030a91.21.1781035421239;
        Tue, 09 Jun 2026 13:03:41 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.228.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376212812ffsm241869a91.3.2026.06.09.13.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 13:03:40 -0700 (PDT)
Message-ID: <b8d6f4eb-49b8-4886-8c78-8adb2ffd0b3d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 01:33:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/a6xx: Fix IRQ storm during msm_recovery test
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
 <CACSVV01dbQcjE+nTic+9R4VfCtNGvpwODH8BMZi8B7LFtcCCfQ@mail.gmail.com>
 <49b8530f-24d3-4201-b22c-0f8eaea9f4e0@oss.qualcomm.com>
 <CACSVV00vFNZDCN24wSdffZFRWpijb53qbX_-3b09ny4noa7-Mw@mail.gmail.com>
 <d153235f-ffec-4fee-87b2-6008f26d7014@oss.qualcomm.com>
 <CACSVV02_Yh21Ld5NX6Z6iaG0sfTGseOD5S9X_avSC=7RAfNt6w@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV02_Yh21Ld5NX6Z6iaG0sfTGseOD5S9X_avSC=7RAfNt6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NCy2GL5D91_D6kttGw_TkTj45tr0Zk81
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28719e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Q2jhz0oZVy1Wt6PcVz7aQg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mdSVG8094VgbVpz2fjIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4OCBTYWx0ZWRfX7+Bssbq9YEph
 5YOltCI2e8Xk/Gn8QKnbl5zQxuHNZZOR0oOokkE2Ru9P+kJXkEKGO4kk2lEao194sGX4+ec2jXa
 biOq20dvylsmaEUznaZRDJScOAWBh1+Um5hE8t1nH81B69E2vXTLFsqd08SYGBSWF5rf2EKcOz3
 lPx5uzVDo4KJc+aXVsN9VJG1G1wBh2i/qaKBcZtJw8ATm4ecTrthEl8ReP61VwyRskE3i9AHhga
 xiLwqkU65s6oQ0KpFpd2UMQ5w8GdVu89kqfOzv/X1elA6DkyiEG/sdcArwOE4H7F+J28WpxuKKd
 An5fPkS8aKHswdxtyBs3XaNNG1k18g6QK4/M4EdOcOqCYxg1+xBfyJuGRLqR0CqKCraMX1TPVYV
 ox4cjPW54UD2mECUUJc/Blp3OkWlqR+viraemsYSJ8cxkc7O7PvkxI0NwFYpzwCwT+6S/vPSw8L
 X8zWWVI4l55sdOkxz7w==
X-Proofpoint-ORIG-GUID: NCy2GL5D91_D6kttGw_TkTj45tr0Zk81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090188
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112270-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C0DE664048

On 6/9/2026 7:55 PM, Rob Clark wrote:
> On Tue, Jun 9, 2026 at 6:09 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 6/9/2026 5:50 AM, Rob Clark wrote:
>>> On Mon, Jun 8, 2026 at 2:55 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/5/2026 12:20 PM, Rob Clark wrote:
>>>>> On Thu, Jun 4, 2026 at 1:10 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>>>>
>>>>>> Once a hang is triggered by the msm_recovery test, the gpu error irq
>>>>>> remains asserted and triggers an interrupt storm. In the worst case,
>>>>>> this IRQ storm lands on the CPU core where the hangcheck timer is
>>>>>> scheduled, blocking it from running. This eventually leads to CPU
>>>>>> watchdog timeouts.
>>>>>>
>>>>>> To fix this, mask the gpu error irqs during msm_recovery test and
>>>>>> enable them back during the recovery.
>>>>>>
>>>>>> Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handling")
>>>>>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
>>>>>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
>>>>>>  drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
>>>>>>  4 files changed, 15 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>>>> index 2c0bbac43c52..f1df2514c613 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>>>> @@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>>>>>>                 status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
>>>>>>
>>>>>>         if (priv->disable_err_irq) {
>>>>>> +               /* Turn off interrupts to avoid interrupt storm */
>>>>>> +               gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
>>>>>> +                              A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>>>>>> +                              A5XX_RBBM_INT_0_MASK_CP_SW);
>>>>>> +
>>>>>>                 status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>>>>>>                           A5XX_RBBM_INT_0_MASK_CP_SW;
>>>>>>         }
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index 8b3bb2fd433b..9a4f9d0e1780 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>>>>>
>>>>>>         gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>>>>>>
>>>>>> -       if (priv->disable_err_irq)
>>>>>> +       if (priv->disable_err_irq) {
>>>>>> +               /* Turn off interrupts to avoid interrupt storm */
>>>>>> +               gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
>>>>>>                 status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
>>>>>> +       }
>>>>>>
>>>>>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>>>>>>                 a6xx_fault_detect_irq(gpu);
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>>>>> index 9e44fd1ae634..0f6fd35bd587 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>>>>> @@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
>>>>>>
>>>>>>         gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
>>>>>>
>>>>>> -       if (priv->disable_err_irq)
>>>>>> +       if (priv->disable_err_irq) {
>>>>>> +               /* Turn off interrupts to avoid interrupt storm */
>>>>>> +               gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
>>>>>>                 status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
>>>>>> +       }
>>>>>>
>>>>>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>>>>>>                 a8xx_fault_detect_irq(gpu);
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>>>>> index 9ac7740a87f0..48ac51f4119b 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>>>> @@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *work)
>>>>>>                 msm_update_fence(ring->fctx, fence);
>>>>>>         }
>>>>>>
>>>>>> +       priv->disable_err_irq = false;
>>>>>
>>>>> Ok, so we rely on recovery to re-enable the error irqs..  that is
>>>>> probably ok, given the intended purpose of the debugfs file.  And,
>>>>> well, it is debugfs.  But why do we clear disable_err_irq here?
>>>>
>>>> Now that we are updating the IRQ mask register which won't reset until
>>>> there is a gpu suspend, its side effect will be felt even after
>>>> userspace deasserts the debugfs knob, potentially into the next
>>>> testcase. This is different from the older behavior. So, I felt it would
>>>> be better to reset this flag during the recovery, considering
>>>> msm_recovery is the only user of this knob, afaiu.
>>>
>>> Hmm... maybe debugfs writes should just immediately update the irq
>>> mask (if the gpu is powered)?
>>
>> That needs some plumbing in adreno func table to program the register.
>> We can do that if you prefer that, but is it an overkill for this usecase?
> 
> Yeah, that is why I didn't suggest it earlier.  But stealth re-enable
> of err irqs makes the behavior harder to reason about, which I
> dislike.  I guess it works now because msm_recovery only does a single
> hang-test w/ hw error irq's disabled.  But from userspace PoV it seems
> natural to expect error irq's to remain disabled until writing debugfs
> again.
> 
> Since it is about debugfs and a single igt test, maybe it is just best
> to document that this is how it works.
> 
> Or, would it be reasonable just to update the irq mask in gpu->submit()?

IFPC complicates this a little bit. We need to vote OOB to keep the GX
domain up to program this register. And I am not sure if we have any
existing OOB bit that we can use for this purpose.

I feel this debugfs knob is not worth any additional complications in
the driver at the moment. We can consider improving this when more
usecases show up. For now, I feel it is better to just document the
modified behavior.

-Akhil

> 
> BR,
> -R
> 
> 
>> -Akhil
>>
>>>
>>> BR,
>>> -R
>>>
>>>> I should have explicitly called out this new behavior of disable_err_irq
>>>> in the commit text, but I forgot.
>>>>
>>>> -Akhil.
>>>>
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> +
>>>>>>         gpu->funcs->recover(gpu);
>>>>>>
>>>>>>         /* retire completed submits, plus the one that hung: */
>>>>>>
>>>>>> --
>>>>>> 2.51.0
>>>>>>
>>>>
>>


