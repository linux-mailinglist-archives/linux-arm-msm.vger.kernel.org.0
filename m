Return-Path: <linux-arm-msm+bounces-107483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAYPIuPoBGrCQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:10:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9F53AE35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8AA5300B5B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DAD39A070;
	Wed, 13 May 2026 21:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3ZTMjoa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4Dqgf6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083A396D1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706653; cv=none; b=jpfJLT745wjRwPTI0lsblTJ3bCZhb1ynlP+b0jM+SEwqeuh2EZ/ulgoFGbcJ6rEcdk4OzKaiBRaCoUfevu2JVCqr28NYKU6/VvMgu797l2/SISWwMHrpcnT3KNAMJ+Tya8Ak1z7XkivV1wtVMWXumoFAdXMQZbI/t4c6AWeZ4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706653; c=relaxed/simple;
	bh=nuZfkdDWsvYa1cNyD9mSrJeJvpMLYKmpe1Y7IstjXJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VApDgsgLc0Kb95ABfFQCSow4H7a0xpIjzcj2RB4EyRfhvApi39Mh+RTNLM7wPEps/gbQEJwN4me8Ao9Rcc/29v0mDU8RhnW2gFf8j+JxL9AzLj/g4I82VYRESOtwf5tk4M5F3i4mWJEUTc7CTWoZeSnQcC6d5RkL9896uO58Hqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ZTMjoa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4Dqgf6k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DIUUU73324660
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EP3xjrgY2XMSo+tnYkujYFohkhHAzdynEqCAcazAHkk=; b=V3ZTMjoaZ1BdtS+p
	M4LwfZsI/ayfy4CicDWmR9bbK1xGJksY4o9heQnzoxxRlRjF/DPCWgtb7tdCZmHj
	wSAaVMLrFYmgKqc92ECa6P2gyokl7KtPbKSNHLWV1LBQf8UipU2KH9Qh8EvzTk2K
	IXxRnMrNhNAjQkE3cBYvWA8BMRy8S0PVNrTA+3Hap0V1tqq8IIJ1POwdw1ZpRVGe
	aAiulVO6ru3Lo0zgcJgBk2blQ52jb06umsRDB9rFq7cdqI6BrgHlmUiiNz2B795O
	GXBErlTmAeL8cS25ZkILYVSQ9YQ3BbQ+Bb8Y2yByzvioM3zS2beL9a2oLzKXTL2S
	XS7HLA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdbhmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:10:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365faf6006dso8398361a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778706647; x=1779311447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EP3xjrgY2XMSo+tnYkujYFohkhHAzdynEqCAcazAHkk=;
        b=K4Dqgf6kgkKY426jY/k0pSK6XvWATK3gWQCGVDJCLeGdWnNbdLDpeosKHawdNZOFKY
         DPA0PhDcrmKU01IfXGyJF4SvH1tRSRwCLsV8H1TrEInkUrVKJ87cmDMsT9WKlG/zoobo
         KP4s0BuaElcp1a9nhHeX+Si3aWUUthzItUfAg/wdX1t3OJ/r1aHRBE7e6i3cNLLCGqev
         WHYxB6vIl0u3ikWsgzVDLhS/gMt8wqlaOxsFFH1ym7uJ9rGfnSW5BGSQDimVuJw6twgM
         ow8Mr14XTxdMG7ZvxF6/JpHOl2G3InokqDX+mblO0BGRaVM1xQzqn8LaDpcJ4mG9naYY
         JEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778706647; x=1779311447;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EP3xjrgY2XMSo+tnYkujYFohkhHAzdynEqCAcazAHkk=;
        b=pwmU3y3p18q/+2GJFzD6cwSva35KSx3+oTlVSKVi+IzDZzX5GBsMxNiew6Ne0g7del
         HWi5Ur5OFzjVO2kUNMpord9v4YYw9yfBEZRlfSBYROF7zD9W0+BAXjWX0HXR2Gi9cQ2K
         ant1J6xME2DFgN9NgCkB+nhLKBF+4nrwq/zt1RXjD06wBmzcHRPMpdfng3kxG44PBM9u
         JyeJkf7Vx7FZ1U9I2OEmoZq8moM6iAhWQcuzdgV+6YP7T2iyDkvroI1Q7+MqUtx8delC
         nld0YQxj8ogarGUt1YVxLhbwBQf7TZr7XBDae6DQatIksNs4X6hJrctE7LC7OhYn9GfM
         QmgA==
X-Forwarded-Encrypted: i=1; AFNElJ+kosbPUJzC4QLjECgBj5mQmm5GlLHE4Eb4oqHfiTY/LxAmZn4u8S4gAQL3LF0icoieR/T7Zsc4AW4pq2PA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJIc5WPrDiEIddcfZ0V4DsDFA1UVuOYDA+hIce3cKNNb5PnhxZ
	USy+u1kVFss72+Q4AmynXMQfujzKaeZdHR6FD5ZFDxiKny8NRAvPNAUaFGG3+lv0QcNXa5L7GqK
	IXuSXANdO2eqYix+B4zYlg8W1q6qvorCR/hqI/+7N9cxbOMYPZ9C1MdbMLr2i7WJCkQ5C
X-Gm-Gg: Acq92OFAC3PIGN/Vs6vjL/CW7uZYbfhmN5Sh4nLFJYy6Xm3jkk7Te56RvrRjN7oQZMh
	YMNKWDo3X7fwBZGfB8hmCrfdfzznbf1ZUj1s3o6bJDaSxyhrdOgIahNRDS1dDNPbfnled9eE3gV
	kJ3AlszlDIGGuNfKP9NOb9ELgvY1voHMFSIam4yxN5Hra5mJvAVYCNPmpywZDazYqAUrAV/o4tU
	RVt7lkRcQqKFYD4/w8HhPTkKJg0ryCozfJiV6n1QRakUxJQ196eFC+ofAQQbZ4v+D7/XPgYNKg2
	Rl1zpkxGUijorhswztqUt0/zGJ4DX9gpq4ANGNYz5fpG+kixYVDpe2NtRTRPBU6nLD8gdPLgsi6
	+rP8rITYOIk9T0LzXEcsutD4JNIMqOtnTSPIvHwyHLw9l
X-Received: by 2002:a17:90b:3a46:b0:368:ac5f:d313 with SMTP id 98e67ed59e1d1-368f3e7b6e1mr5521370a91.20.1778706647262;
        Wed, 13 May 2026 14:10:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:368:ac5f:d313 with SMTP id 98e67ed59e1d1-368f3e7b6e1mr5521348a91.20.1778706646758;
        Wed, 13 May 2026 14:10:46 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692f4a3c8fsm187754a91.16.2026.05.13.14.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 14:10:46 -0700 (PDT)
Message-ID: <1dc269c5-fe74-427b-94d6-85b5aada318d@oss.qualcomm.com>
Date: Thu, 14 May 2026 02:40:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/5] drm/msm: Centralize the standalone drm device
 check for GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-2-6e33e6aa9b4f@oss.qualcomm.com>
 <roeaegvmg2nvzt6j5yhmsv6p5vzhvsglzkmtvbnw7yq7u6bqqm@lo27u5mwsrwv>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <roeaegvmg2nvzt6j5yhmsv6p5vzhvsglzkmtvbnw7yq7u6bqqm@lo27u5mwsrwv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7wqmDYN9YRPTP4EwS7zxdTCqpjFWIUBq
X-Proofpoint-ORIG-GUID: 7wqmDYN9YRPTP4EwS7zxdTCqpjFWIUBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIxMCBTYWx0ZWRfX1Q5bqUGFRHeC
 8o/Yjl8gMFFt4zx2jJF2n4QyqKRbVEorL+KCbOtCTRenZLANj8fsaBhXGfD4Ve7w8aQNTBUmVWR
 z52HS0r9LDz79o19vRgkBtftyW7ns1I6nRvnjv/lDhTsA6eWnL9f+uudnk0AIg4kug5KaH92gUA
 VCR3zc0VaUfyV1DowUp9p0HPyU1eB0r5gO++5MxGLDA4Y30ZlEnp0Vb6mNfEqzra51PkoNVjUA6
 iySv2RTuBtdxXtNhJ1vnCCL2oG3GpgOgWH2s5cPsQhS1sawILmxiPJ++gVxo26xwZxzIkfWauWi
 Ays+Z0wLkrlvDftv2lgFE7XTxK1LnSXG1P7ZYSsjeE7X6SqLxLYcWLaveWt6lDSn21Nmo2xt90Y
 pL0amnD6UXsm4bTXpXczDya+y6EHApL4UEFbeXhnO0wBw48vxLXvBiU6hzl4q0IMvyA1zAo9ceP
 bHIETt69dR8Zhb5M1Gw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04e8d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nm1BsBjGsf7C+PoY3QnOXg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZzDrR4TfVffB5w7mJ1MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130210
X-Rspamd-Queue-Id: 51B9F53AE35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107483-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/2026 11:11 AM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 02:22:57AM +0530, Akhil P Oommen wrote:
>> Replace msm_gpu_no_components() with msm_gpu_use_separate_drm_dev() and
>> move the platform-specific check for "amd,imageon" into the helper so the
>> policy is centralized and reused by both the core driver and adreno probe
>> path. No functional change intended.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +--
>>  drivers/gpu/drm/msm/msm_drv.c              | 11 +++++++----
>>  drivers/gpu/drm/msm/msm_drv.h              |  2 +-
>>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> For the next iteration please swap this and the next patches (yes,
> introducing some code duplication). It's generally not recommended to
> have fixes which depend on a non-fix patches.

Ack.

-Akhil.

> 
> 


