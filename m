Return-Path: <linux-arm-msm+bounces-103623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 272NI0Cp5GkQYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 12:06:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB442399C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 12:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B9B53002128
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 10:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFD528469A;
	Sun, 19 Apr 2026 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puSwcU6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5lw6nuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BE2253EB
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776593212; cv=none; b=Xt7X93wAp8bbNgHL4idx2X5cHMS6cGMD3382sFnaUk0TsuTvxgBPApsiu7dJrIsjPh6qv4+PFv5A8bwyCULZf7AK2pyUPGswIIzBVX0TBkpeAZrouGKtaeCb1Es0apSODVYeHpKC7zQdCbopfkbpsjHP8DE8quTy4NfwSQCmiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776593212; c=relaxed/simple;
	bh=EEADTAAAATVi/7bhEQCpebr9+3kZHFyRY+5bNmk3Akw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Ls/wQhwSNnlsVsnWlxrBDTPAkazarwf6wG5e0G2PndlUHxxehu0coHIgc0RoBZOQIOHFrMgbhey4f2b1foGk0UDMtBdS1pfClAJWBnf3wJXzgqmHft4ndrLyDhQvaL8wLN5T7xjafZiemubvMNlsg6F7kMW7HCBRkunHV4DwbNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puSwcU6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5lw6nuu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J5BRgd3269763
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 10:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XI5BNpMIZ8Y0V/s2/V6NIC81LF/72Sofa7E3Xufqt5U=; b=puSwcU6p8iHAqE6n
	8aa7KUtBbfYH30jSmF1QmXGZkuZ1WYrwNBPOa6Q5ERDF07aPMgfDXN9sH1TRKD5R
	WbkhF/MmAAXWfKqRK2D2FtwC9rZB1YdBbN+YBswcrCd9jngSQRiJVaUGIj8E8ENo
	GVjritebgRtkjUrd4vNNCrM8VkfOsfgDPG0czGpyQQG1Le3765Z76e3JSdJVZJTM
	FfHitXht1Bh2cb/sth8EqcNfmEDpyy5DL/mPtwqUY2mezDkeiITG3sxH2NP+kyKu
	v5eT+ExIqAwaKP3k61uowgp63xgcamOpOrEMKAtUFGxtmdAKjqyrLMk9vq3PAhRA
	Loamrw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34ha8vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 10:06:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso2066551a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776593210; x=1777198010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XI5BNpMIZ8Y0V/s2/V6NIC81LF/72Sofa7E3Xufqt5U=;
        b=J5lw6nuu60gCBIcspz7Etkl1vLI1eqlzzFl8nrwUtsAUOf31jZ7GM43bgSnwNJVUVP
         SQ7Q4ImLUSlmAtUitDRTAWf90unGDV2Dosg3muQd0JBIx5lUMyajFoKFaHjpYfkw5XVi
         4isXhenmzv3muQ+bH+UmXjUX+0d6QGVXcdws+2biLLYLHRHdiYMPQMZrrWxOjZdlu+23
         ewN2OqkTRavnmipxUgSEVmbAJUv/CIuC2jRlPiW2QhKdFBAOt5HQRDknGBuO/W+OoBKt
         oKJz8Qmsj3lAorl5K/GHlPwQwi49WP1ViDRVBgPhlFxnnVoPP70lY4OB3rhhlZNrJlVs
         LH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776593210; x=1777198010;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XI5BNpMIZ8Y0V/s2/V6NIC81LF/72Sofa7E3Xufqt5U=;
        b=QnF0LHEu9VL8VM3t/H4ppkZqCY26V563D9HnyHC7vkUtFq4gFoNQ1TEUiZ2jDYz7Tz
         tA0losla42NPWwBYyJLWf/BIyFnKU7wWfYDxKIAHdAMEJAYE9mVktXN94qTExGvzqgvO
         lVzc84JzSI8xFHe2Iv/vYOZErzY/j68Qa8X2oxlWDw7+E5cYrnoXeuEmg5w0JJsAGSP5
         j4VskFHdCjXnbOelWFJEWwNAJW9YMaDVndr+yfxOI10LN3P6GACIuCXsu23x8dR6T60R
         dk6dtJWXBhgS9HED6Yo0TcggCjyWXZivHeAnJMiX9uG86jBTx/0smWp25SWTKaToajhy
         jYdw==
X-Forwarded-Encrypted: i=1; AFNElJ/q1dle6KaDMhY1CVd9vuA8FZz3zmi+vye6FvK3bWoOp2pssz9wVNflHqVCrblp6o9EUlqWefKB1TimXSyX@vger.kernel.org
X-Gm-Message-State: AOJu0YwITZ6bze5SYhn04UCmLylDzyl6ETdYXDqDZ17GgqeM0kt2VoJT
	XeOH5JWvNKej4oCk0Z2KwQVEYe06ahEIlJ6tL6wWTMclFxd7aNPhbVD6DmgQlsEPjE1zA4PNUrs
	wCGamnxhZxyRG/QwXphEAjPoxwwawoVKTRB32rRxDPhylqbYECMnmJxRC56R2tL3r17kj
X-Gm-Gg: AeBDies+AY9u5GNq4Z1VFptxTTd7AiD6TGWnvVvPP/NoLQ07nafx2CVSxwPYTokQnmv
	xJJSya/BQ4+dZLocZjD1Dp71SpRinh5pqSsDLYu1mDBVUbv+dchnVfs+gto6w5FMYx6L8v7Epyb
	Lm0/aUoNsz1ornuwain0vIrOSn35g2RAo7L6ZtJL4zO73OxMEemwA8WIlPcYnh1ZYF0Lv8Yi7Sx
	Ozj7MbH3zpM/+CQ3RxpUxwtmxjZjtOV/19zrGQmA4UprypvBzFhbA6NSK3m4m5UqvruDWSh+G64
	edeJWgukg1c3QrkPWSs+3SxPEhvcdP/h7uBt3BshtfoYCl4jmF9VzE+/u/E6PljRdNxnZdgBpAt
	8/+xKJpB3EF+Fp5nLrcDvAQptTsFp1m+TWC98lhc8sLDeuMxLLVNPbUnCxaAOvfUX+kJQ+fE1ep
	67xC23LRixQzqLhvje28vrftbLIQ==
X-Received: by 2002:a17:90b:380c:b0:35f:b5df:448 with SMTP id 98e67ed59e1d1-3614049ed12mr9946219a91.24.1776593209580;
        Sun, 19 Apr 2026 03:06:49 -0700 (PDT)
X-Received: by 2002:a17:90b:380c:b0:35f:b5df:448 with SMTP id 98e67ed59e1d1-3614049ed12mr9946186a91.24.1776593209087;
        Sun, 19 Apr 2026 03:06:49 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7cb5sm7357149a91.9.2026.04.19.03.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 03:06:48 -0700 (PDT)
Message-ID: <cf0b6133-e15b-49fa-b9ba-e67ac8bcf7d3@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 18:06:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
 <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
 <7rfiwbbunlbzmhdjvsfqccltdx7cveahbgg2rk6kkom2jesta4@nnbas4vn63we>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com
In-Reply-To: <7rfiwbbunlbzmhdjvsfqccltdx7cveahbgg2rk6kkom2jesta4@nnbas4vn63we>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e4a93a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LlW_7vAnNt5ooDS3Xh8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JO8cXJe3bFYWxjTwVn0f9BBM6vJytLHb
X-Proofpoint-ORIG-GUID: JO8cXJe3bFYWxjTwVn0f9BBM6vJytLHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDEwNSBTYWx0ZWRfXy15x77uYhF0Z
 MfhHn5iLQTjHs/PalL/rDqhTXu2rNNZ+nFjdPAQdlhtED5kgzoAkifjw2kb0dkdQY4HUecXgspE
 OGN75JnSF7iWLuMT8Bgun7icP4+7cjoGlS7wDyrtllw3Ag/1vcHEa9mHJEsLFEvxiKa1YoSXdOi
 KCFobgedt1fp7uzVpTScysr8f3p8MPUVzbAJ2B9yHoldN/N7Ym5B6z7lAM3IEIYkZ9jlA77zBN6
 mTmrIKon3V4gSfdCDcEdWqIKBzzHEcYa2lyyBOZi48QfT6w19/N0eLpqnogdk4cy1npTThW7DX2
 xXBHi7xDV0CKf+S8sJ1y+HLR/jVPvvj2m6xSKoHAnsehDF9O8PuhVsF3XeL3nWnESr/lOGxJRqD
 iA864cEaM/15PLzwzvaENKtWVppc9FtxiUa830WYsaB3tYUXU2Z1b7cF2DmbItrJ7MOfjcVx0am
 /+UMvUp5T3kJX9qg9Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103623-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: D2AB442399C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/18/2026 2:31 AM, Dmitry Baryshkov wrote:
> On Thu, Apr 09, 2026 at 02:26:16PM +0800, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
>> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
>> controlled alloc/free and ensures memory is reclaimed only when the DSP
>> shuts down.
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 104 +++++++++++++++++++++--------------------
>>   1 file changed, 53 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 148085c3b61a..a67ae991c0b0 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1295,15 +1297,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_init_create_static init;
>>   	struct fastrpc_invoke_args *args;
>>   	struct fastrpc_phy_page pages[1];
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
> What was the base for this series? It doesn't apply to linux-next. The
> code here is different.

This series is based on the patch submitted last month. I will redo the next version of
the patch based on the latest linux-next submission.

Thanks,
Jianping.

>
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>>   		u32 pageslen;
> This struct is way bigger.

In the fastrpc_init_create_static_process function, the
inbuf structure has only three members; it only becomes bigger in the
fastrpc_init_create_process function.

>
>>   	} inbuf;
>>   	u32 sc;
>> +	unsigned long flags;
>>   
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)

