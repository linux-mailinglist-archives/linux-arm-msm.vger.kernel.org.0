Return-Path: <linux-arm-msm+bounces-109193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBj0Lm0LEGpqSwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:53:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4125B03D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF2793005D19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D941386C2A;
	Fri, 22 May 2026 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDDYluL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehbx3CWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D03624B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436060; cv=none; b=IyQb+jCLpO0I6bbyqfWG6gbiAeF/w5b+uGqBGUqd1xv8oY6+kkU6lwcvswT6cWALJ/AdWEAKED6mMIWIWbxbSkUhORrSu0FDgSazn++g+Kbu2JNc6otDtOhn7SJXj+hZ1dveC4NcjCfjf8szhT5KaZ6u8vND8h1TzlbFyYyfA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436060; c=relaxed/simple;
	bh=5KMfQqM5yIRy01sPruuWrSoPgsJF1BXuLYYNHGbg5ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=e+ts4RqN3yj86MubY3Y5xDeX0Aon/dFh1NXzv0l3MXNEqSDgrtxHZfia8F3tVM8ZYSZafMMYOtqemr77LWrdpdptpm8N2Kufa2P9v7K8fJ7hm4svBdATxn9tFXkOsL47n6CXSh032s4Mcoo4IJ/1eXPUmYomLWbc/73Syn5PLoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDDYluL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehbx3CWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6Y4K51298124
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HStTuWaVOAJ9glhTw5Ili583PqBxaZli5bgevCDJEdc=; b=fDDYluL0Ud6xeXny
	WL3CL8yX1+0c7XeRp/6jO4d2cgAA8afXq3PZK1oL82GZXsyAr0AblWltaFcQ9eIv
	btxrgl5TXDhhWWYT5X5jaF2SUbop6QnzI28fyVHRtdb9bXZOdiLtm9AX1oW6nsnw
	IICCCuXuIsrNOKSdJFrQhDjc3mCYKonKxtQqGvZbO8mBuqEIYMTsF7U3WbNEwIPS
	XWe7lhLmTCmBa0AWNpnJ/jvWdQaFITsTvQNbK1GU9qlFSg85dahHD59geBDyTOLL
	adAFHSe/NBYBaQ/UxT0716IYjWOgSYzM5uUaRcw0yp5hNQ+VuYvpDADG1Qh700qV
	zzPxBw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah09q2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:47:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so162133835ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779436058; x=1780040858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HStTuWaVOAJ9glhTw5Ili583PqBxaZli5bgevCDJEdc=;
        b=ehbx3CWqkjUdXh2krhSlYMR7SroiVRzcmntY2vhQXkEJgntBnBeWWEdkBOKSX35h0D
         kVu9uRaH9m5392xqiDNhKMVVPqblAyHyc15bXi/oyZxJ7FtMIeZLXqdMVbIpfP/mWnbc
         +oLUnQ+L3/wGl8uAx3cJgtQG4p8KNVYvoWLh2w6Pq4muwvv2zoPtQ/Kk+3fHwgzQsquy
         JNrrojW1W/ekgB1vSL0Q1sXF7oPy0+XoSeEg+MxI90HOs2In6l5b8i1k1WLVSqcg6Jhr
         dB5dmjpOy5dTqkwJseoXoGr3NMegwcitMghgMuziFuHyCvLPwBKJDEGGtqwUnPsHRAN4
         ebbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436058; x=1780040858;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HStTuWaVOAJ9glhTw5Ili583PqBxaZli5bgevCDJEdc=;
        b=X295/vFQZZwoVrmUo/su7h2UsqTXhSYOUnO/j4uFyMRTAcY9tlLKqfLUibqW00Mu5h
         rY4JywkFVShx/PJRLhgtCgPXNOZ57StBY98cWCSMufGVpPCzNJINsaGx8jWIz6iik+mf
         E6Zc01FK2yl/uAwaXpe8AO2bknjX9zAqeoUSl6Oov7HgsdnDTuu22quvYYDIMDun3xlb
         zAfQl1C9ARuvhFKO8kS3+nIyYxobwFOSKjEcuILgqCFb1X+bC711zmcy/Xvk2pNwhR85
         21KMh6B0O7kHrhuZiyvjFgWx4Ezyuk6lx5xkXkOcJlSlp87Bg3XlzXoRYAyygdpJCasX
         4zrg==
X-Forwarded-Encrypted: i=1; AFNElJ/cpvyNH9YpWq3CISu6GAavoBp41jvDQGHCnELa3ysTO2YeHO+jp7aoVPry0+WPKksC1UwsdkACe543J5eH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+v3JIJL3JOFD0zZPr2SJbFEvLOld2MYXw6h30WTcVE3L1Oaw
	ghF9b3duLoY9r3XfHhheOzCfAfmpYWyxwWeppg38+r76sgCPo0WnsKTbpCpl1xJ/tkEort0D0Xs
	i/6yxPIuvbputK7xvgW3974TgzKLHGhZ2zYfIX507lV8m1uzwaco4YRrvXQ5Q/oN6g/4b
X-Gm-Gg: Acq92OE5BTe+JXRsrmXC67RLk1SV1RAbDsTIk+z4smCJTKkg6XrHh+IoOTMY/qNYdGU
	p47CNydR/QcYB2hrae1tzpRywrFD0r2DM83oInpg9TQcvpIkIShzRDFtY2FbVKjVP5AxNB2hGHu
	jkoJUZfzRczNSyN68Ma7kDKdfF8nBVBv4MDm528OcOYqgmj7yPvCCBaq8qaC0jGVAr4WsuRmu33
	UBI1aaeZzavlML0DBB41Fo0+OLLOGjJF0oobZL4TAvCDebO5UAVz3RTSYzL81uuEqCCLh/hg5Cs
	7Bfku5ipFXY7EXUs8zUNOEf5KhQ1Xi6dDF+C+cSZV5JWaCVMxEQtWjVwpkFBh/TRngRUofK05JV
	KNpkDTqRUGjhgE29qAyMwAzWhIRHAynI6r5kFetjgopYCVGmTjTac91+gJ8ThjYxE1xP1hS1hFN
	N+XVigKIcuiR+A8eHiicH0N+oaEs0=
X-Received: by 2002:a17:902:d2c1:b0:2bd:b6f6:3446 with SMTP id d9443c01a7336-2beb0633f1emr28086955ad.3.1779436057439;
        Fri, 22 May 2026 00:47:37 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2bd:b6f6:3446 with SMTP id d9443c01a7336-2beb0633f1emr28086605ad.3.1779436056988;
        Fri, 22 May 2026 00:47:36 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5924211sm7030285ad.84.2026.05.22.00.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:47:36 -0700 (PDT)
Message-ID: <fb00c836-95bc-451b-9430-2ebdf0be2630@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:47:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-5-jianping.li@oss.qualcomm.com>
 <v3qkvvqlggrk7thn57ff4tlbilz26nt3nlma6deixlalq74i2k@nbxbqyppzwte>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com
In-Reply-To: <v3qkvvqlggrk7thn57ff4tlbilz26nt3nlma6deixlalq74i2k@nbxbqyppzwte>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NiBTYWx0ZWRfX6Gr602/L+icb
 1qmBSrwb/pEPwGQa5xT8WDURAd41Vj8GtzjG9sxwNQ83G/VmHc3zNLM2RHa+ILZqJmH5lvqk+CD
 ybd/IEqzNR5T2Wsv4iKFZ8PYoeCxsDt7wFZgyu7BMvSEk+rAw1CBI9RUJkB5A698aGrepCOintl
 7bUvrlIRFFbyZbLn2FrozhXqVQVoHgjZPEySxXT19joaEr7N42day3mBaM4nomUdTx35zxJem8b
 2skkVyaaRLqTCHohgbJ7kfnUQwI+7wggiCOqBeanHFjIAGbKLK5UFQNiqyvr1tYLMIbBw/r6NR2
 itXYHiq7ss4BVd6YjFc6t5mP5M4ZHv3abTPQe4lhNlVHxmYjXtm8VX9a26lhxTs8HeZ4vEOiTop
 cQlQ9svCd2bNW8LRsrleg1YfMIQMAau6TnIATf1LG5DLwvIFQNN3MyEEH7GUP2a3SpfgCVY5Mw8
 gJloGuj90d5k1M84yFQ==
X-Proofpoint-GUID: hj-rUmm6_r5AhZB3HKmzX9r5RGVdSd7M
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a100a1a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gttq3t2AYlGpivilpbwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hj-rUmm6_r5AhZB3HKmzX9r5RGVdSd7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109193-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E4125B03D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/15/2026 9:38 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 08:42:16PM +0800, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
>> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
>> controlled alloc/free and ensures memory is reclaimed only when the DSP
>> shuts down.
> So, is this a bugfix or not? Is it possible to make the kernel misbehave
> without this patch being applied?

Yes, this is a bug fix.
  
Because currently after the audio PD requests to grow the heap,
the current kernel does not support shrinking the heap, which will all cause memory leaks.

The current modification is to allocate in advance and release uniformly, which will avoid this error.

Thanks,
Jianping.

>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 107 +++++++++++++++++++----------------------
>>   1 file changed, 49 insertions(+), 58 deletions(-)
>>

