Return-Path: <linux-arm-msm+bounces-64115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C5AFDF5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1E3F7B71C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E9826A0DD;
	Wed,  9 Jul 2025 05:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwNSRG6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E45156678
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 05:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752039838; cv=none; b=rt3BsG1D6ysjybiGQ72gCbQG9AyIvZ4SiQJ8ApGuScXqwOWufoSuCHDwxkciHKXBJ0ogyBmrAlFPzphKKPQMvP3n0tQrQKVm1ntXzxFNHMCGjhze94YMGspWUwOBKO/b2ZRBev1bxxTdQj93hfVaxd24KQmOLjIkqW72at5Gwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752039838; c=relaxed/simple;
	bh=PgSVKhhZOx9fn9xuG9eyWNT5OlxugNfXlcfTAtWc4Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MF7nLovO9ARawxTVxgbeXhY8BJ+pL8OMqlgDPy2TvSIzmQfsmPxXJp7OlsA290ph3l30pIVg0QkznjQoQFlPgQOknn2FpaVhtCYlF95GLn+GjIB2icRCNzeZTbBB5DwF37x458W3I2T4VffS5fB6gHzH0gkzmTxDz6n8a9lg+wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwNSRG6f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568KFXK8031854
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 05:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgSVKhhZOx9fn9xuG9eyWNT5OlxugNfXlcfTAtWc4Dg=; b=VwNSRG6fmyap3vxP
	f5gG+s3GjY2MQbK1O1h7KcdQHh1BvLYnr/d41O78J/EFeneycqz+dSN6IRe7z8is
	Oojhgp4pvxlaTFePZP3RSERhSln5Zy9eT6yz2yZM53I+xz12/xnGl6tbZN06+4G/
	VtOfZez4yJxNGcEf2pXjsiHRgQQkM5aEagSV/GnMJpjKeEmrjW14lkrDHE+47v1G
	6Qa2uz32n7ssusnh1p6NKP2uiVu/KlgSPO0L58F9HylRlz0FwtozUskXoHPPcSBm
	4LWyMKckZkvVUKvL1xQjaoyO81XBRlZB7gXX11aqEoo3k47FBxzoXkh6VMVxSWrV
	taJG3Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qtcd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 05:43:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso383209b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 22:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752039835; x=1752644635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgSVKhhZOx9fn9xuG9eyWNT5OlxugNfXlcfTAtWc4Dg=;
        b=A/bgUlWhlrDJh3nk4Ik+QeXxn959swRi0g3UlobXEcXb6eRs1TFdhdhKZHEt2fCVl6
         doPdQfgyVf5RU1NcVFEAZGYxmlx5fHLyhtBOvd41gUcjVqga1ocEPD6zuT56fgmYzFcf
         TFu/QmuGSLkUpJpiuhrfznwvBjkkRZ74L/STieo2j4X8MwjEyvDmcGuIAI1F6Y4/Bvyp
         KWVV7RX6fJJbLIRHlrlETa6awdplTA414JhRI4LlqiIrzuLrlzoCudhaPm2ZKuoKzqrJ
         lLA3dQhE+cAqlyAPAmZ0Wk1MgmBsWESJYPWiOn7811tDtAlKZXDZ7HWnVkqiMjlWlIbB
         sXVg==
X-Forwarded-Encrypted: i=1; AJvYcCXHNFPozhhxAuN3xZ2PEE4nqld/md3T4nutuPRNgjFcSGSf4FOvbkC0IO1AqSP/OQ/XFOVDavKBKfVfE6xj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8lqtqmxBccMaF8D6iDmVZ7XjQC5Vb2oMrdVLSpaBXi4rCYPET
	bwNHgJsfUyNMjXwV+zwMtp74MdlixQ1mRlxdEKgJtz2BB4NOoLapqAJRAT+LEU6BrPHMUHh98ln
	n/DnzHB0WsOyqcg0eWN5aSFDriaaDhxPfcNIgs6/oWEyi7/ge6oDlTWfzQvmb3Mho6AQQ
X-Gm-Gg: ASbGncvpZl27HQspudAdyUmHoreIeC7AfRbwWPt/1ksnmwjMDKd7WJdPBVzk8JxhdOI
	lvHLCshngiuSEQW8LKtBSSAETK2U+Gs4lzj8lxddgUumZPwpHSgY3O71FVltfcaOMkSQ3Kudd07
	uPiYNS+M97DrovWK+qCKslERhDeUHneWntrYNzVVABUkMglI/A6si54OQ9Cg8zAfwWs9xEDXeyI
	1+9igO2SRvi3W0ZLn7vJcFRKkKOk9ClgaBzqE+zYYNpA8LZxcaeBj6BhYnHA+uqYnjFfcCZcpxB
	pqUQBwsIEmZxbHBV6h1/gk3DP4jUWtPEfr3VjXyAapIw+x3a
X-Received: by 2002:a05:6a21:1fc8:b0:21a:df04:3285 with SMTP id adf61e73a8af0-22cd7487eabmr1845824637.22.1752039834889;
        Tue, 08 Jul 2025 22:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYl76ZnEWcsba95ueqkMuH7zTvwhyN2CeXbn/Yj4+3XI4AUN1nTonvDbA0E2YPPM2a34+eFw==
X-Received: by 2002:a05:6a21:1fc8:b0:21a:df04:3285 with SMTP id adf61e73a8af0-22cd7487eabmr1845798637.22.1752039834447;
        Tue, 08 Jul 2025 22:43:54 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62dd5fsm13371115a12.55.2025.07.08.22.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 22:43:54 -0700 (PDT)
Message-ID: <8b877eeb-941a-47c5-a67d-450dfb772d6e@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 11:13:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
 <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA0OSBTYWx0ZWRfX945gpLlEv4Pn
 xJuRMCsrlL8A9QFyKTtXlsD/TEcsQmz0dna/TYfgV3zZ5071ga9SRQJcUz1m3QLdtpETJs+XXVR
 K+a4mp04kn2WA2YGlQlaHJuj7KykWAvnHnU7L+1p1g+6bkD9gmKAr8QpKuCvGMZG4X7UIrO1Elw
 GXWcRMssUQqtEAJ+Jn4L4lSDzCLVeyNO1HmOhooP3e+w8LgwGwjdP/TFSVq4u7ErGiJAjZub7yZ
 7bdC66DkTct9choRbss6wKK6K5MUB9Em0gFXoDJM91Wxqq9R7MQSjh2CbLPMePUr+fBo7wi8QLD
 ndRVqFfi6/JId0AK4RR0WuOVJS8Ns7E9jJukI28j6cwfN5cDSpuaWzQVYFdbaOQAmoQVKQEJcT/
 tGVtfOn8a6VENAGdg3nDLwDsE7rDoedq2N7mj1Ko7tGg+gRkh2F9jnD1ZcHNcRnklSajOr85
X-Proofpoint-GUID: ENYOUkYXC8om-RcwJIfHkmNnwT9h0OHa
X-Proofpoint-ORIG-GUID: ENYOUkYXC8om-RcwJIfHkmNnwT9h0OHa
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686e019c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=8S-o2TYjEKDqIBSC5TwA:9 a=pl74wFF6UHmSd9ON:21 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090049



On 6/12/2025 3:54 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
>>
>> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
>>>> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
>>>>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>>>>>> interface but support for unmap is missing. This could result in
>>>>>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>>>>>> Can this memory be in use by the remote proc?
>>>>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>>>>>> running on DSP are not intended to use this request.
>>>>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>>>>>> use? What happens if userspace by mistake tries to unmap memory too
>>>>>>> early? Or if it happens intentionally, at some specific time during
>>>>>>> work.
>>>>>> If the unmap is restricted to audio daemon, then the unmap will only
>>>>>> happen if the remoteproc is no longer using this memory.
>>>>>>
>>>>>> But without this restriction, yes it possible that some userspace process
>>>>>> calls unmap which tries to move the ownership back to HLOS which the
>>>>>> remoteproc is still using the memory. This might lead to memory access
>>>>>> problems.
>>>>> This needs to be fixed in the driver. We need to track which memory is
>>>>> being used by the remoteproc and unmap it once remoteproc stops using
>>>>> it, without additional userspace intervention.
>>>> If it's the audio daemon which is requesting for unmap then it basically means that
>>>> the remoteproc is no longer using the memory. Audio PD can request for both grow
>>>> and shrink operations for it's dedicated heap. The case of grow is already supported
>>>> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
>>>> memory) is not yet available. This memory is more specific to audio PD rather than
>>>> complete remoteproc.
>>>>
>>>> If we have to control this completely from driver then I see a problem in freeing/unmapping
>>>> the memory when the PD is no longer using the memory.
>>> What happens if userspace requests to free the memory that is still in
>>> use by the PD
>> I understand your point, for this I was thinking to limit the unmap functionality to the process
>> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
>> memory from userspace.
> Ugh... and what if the adsprpcd misbehaves?
>
>>> How does PD signal the memory is no longer in use?
>> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.
> I don't see how this can be made robust. I fear that the only way would
> be to unmap the memory only on audio PD restart / shutdown. Such
> requests should never leave the kernel.
>
> Moreover, the payload should not be trusted, however you don't validate
> the length that you've got from the remote side.
I was thinking of giving the entire reserved memory to audio PD when
init_create_static_process is called. This way, we can avoid any need to
support grow/free request from user process and the audio PD pool on
DSP will have sufficient memory support the use cases.

This way the free can be moved to fastrpc_rpmsg_remove(When DSP
is shutting down) or during Audio PD restart(Static PD restart is not
yet supported, but clean-up can be done when PDR framework is
implemented in the future).

Do you see any drawbacks with this design?

>
>> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231


