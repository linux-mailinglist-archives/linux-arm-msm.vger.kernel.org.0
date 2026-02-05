Return-Path: <linux-arm-msm+bounces-91878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKMJIilhhGng2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:21:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54CF090D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 614E83027122
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B650539E6F6;
	Thu,  5 Feb 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9G2JH3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok/wE8tK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F739E6F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282162; cv=none; b=hm4bo1DhnvTZei20zKyVL0PQZzgwoWDUqNXRDTb4hT6ZdfmG9TJbvwWxrgoTUjkegEQ4SZ68Keo9Ie4g27x5qWtkwoO6S69l9IjjZBa83Qv8/V72R8O4ZorhJvhg344FsRjWA9789Ncjl3VcbZqHpWvFaLTNOfRAhn/gTBCcQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282162; c=relaxed/simple;
	bh=+dhBtouLWSvY3jALl9A606nvQKrGJ8Wx29beMgUMgtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=mRoE5gzIYGUv2f2yZ2rkGrgu3hFLB1Hc6Py9frnxH71dn3u0hO4ksY7r9odAWkx/BR0AZVW7thZTp46sMHWiibuR6VXnRMJZajFNhMtmGLbEWvcoCv+P5ZQmY8Rds80cB4i6PXA780yZnTjBzP8miBNh27lw/JLJ7PrEqeiS5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9G2JH3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok/wE8tK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153douT3240952
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOdyGAn6x8GSzehJDyJ9HjphbmLW3tpOReuTJmduJx4=; b=Z9G2JH3v2b6P7yor
	/9sx4yGotW6kJ/btGBUXUE26kLTIqSDnms/J9+yWAqG2hPDjuxw6wPI76Y0BYYkV
	Tc8XF7M2O2Vpm0015J0cpbUfJhOzUYLDr4+iLnmBLX5IoShm50hznS+n+LJDMmNH
	xpQZ4a2ZELbqN8jbg4V2P0lWCE77xgJHjgo3xVcbpZnOgEirNL0+64trKlXHnHIc
	rDmC1XdQwMOuT7WVFIlp7gxTDMJbD84VShB2Y8Yh/FHGoYtBM4u5nxKwjmYZHb5v
	aef2KEQSElp2eSvzC3uMkOIclB1tWPdIVHf+AuX86LVByzzzR4Kn68xWrau8K9rh
	PacvXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51xub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:02:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82184c384aeso1300547b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282161; x=1770886961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOdyGAn6x8GSzehJDyJ9HjphbmLW3tpOReuTJmduJx4=;
        b=Ok/wE8tKodt5cgOqT7PGvR9TM/VEu288vbw2Yegb8bn+xQT4lia5KGUtj3RB/tZ9tX
         l17RgJ5cfBONYZ1xoFw264T+2DgwR5d+ixfTbfZ3UY1gKQCnj2Yot+iRPiygCV9EVFRC
         Li/O1Wk8Zi9eI5g4qxtx0orzhcL/oxCQ+h1NPoJc70lj31unXy+erSVlx03DFKtTWHQl
         Th0FROZbb2Ot/IXyq3ayLAA+kD4NmQQcuuZodNxOQw6NRaHfCbu7zW5cEYF5z46WLqcX
         39OBIMmKBTs2iAeqjXAnoF5kJOpV++V7A+TNU6jUOOBW6omIzxG02dbv+NqPz9lueMdw
         prAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282161; x=1770886961;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOdyGAn6x8GSzehJDyJ9HjphbmLW3tpOReuTJmduJx4=;
        b=HRgIKJhhrt+qIccTZRqxC6Zg1+lTLfHmm8677/2Zbdfu3v+OOKH8F/0PJ2wqVdAHHs
         xcCUk2idoLpm2EUBwVAXjQJjM/vGxRn6zFd6dObUSjEdezfoTJK6bDjkDPsv0RK1jZdr
         Z/itSkecIVMLnFYfvfMOLrCvzQeGE9xZTl+5ZUFj/y1jNVl+1HbP5RwQdSVtoTzstqPo
         4tqD8s//XxHPBtB+FB1o7SMObjUgdLeEXDu7CC0iOl/GO8oK3RHbTGetkOJTnlRXa4Bj
         qsYgLdDwsGiSGfJAW/K2TZwqfb1/1z9WPyEkNTpXC6ZCltcWaCcfFkShKInaaDKtkDY/
         QuxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrQ0aTdOSTC11TnJ+UL8r+jPvOxolw/7x/7emqo1xxANV8o4q4fAeyLQdC2P2/NdKRLSLLIRyPr8hr4FvY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvm+Y36efRmLVSGc+Y7EOITj+yJY/OSYX6EIWhe0JTEhZYeKrV
	+Jvw7ZhovM4KKtWqEGXS+MHQUZh3AAy1zAIpKRBY6Xp+QFgkd/LhWVDJyxjy0RHRn2psL8A8hLk
	sgac008m3ImUPD2oUS7mgT4fflaCy11Dzb0MV7w0X9Ecr5s2r5uHow/yi1sf5E7+mw/C2
X-Gm-Gg: AZuq6aLiikKsTC4G7WUyicIF3DTq7HzNXiu6MvHoQV6tBtt0kxZ0xhFPWvFydOzJbgz
	sBU5i4uGTUuGPy4wwJCycs3QSP7PCpxqvYH0j3MJsgjCmIUZGOOM/YCYVB3cDStWccjrq+ca2ww
	PdnBajyYyBYYSXZsL6kr+j4gBQR3SQGuFO/p5dABuHkvAp4gkXYtosoR6mGGgGHEFx1Bgyw252h
	ksjp5OKTjD1nuUF+3n/zbDSluW4LFymGDS6s4k1zVQvxzktjBNrkj1wmEuEn1+bhR7V+CIvbrRC
	k1TC+/bLtevOcLQTAYxXJu+enckaYhJSTiVIgjo9a4RSeN3X0aPlKAnM3Tv9YiTXqVpYbR6AEKc
	hrHVq6oxWhX3ETuWE2zj0OyR40YvsvxYETzXn+CGmzzGnZF8IKem2ztI44spR8PSzVbfidziLl8
	9ceYBc
X-Received: by 2002:a05:6a00:3cd6:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-8241c4c4babmr6387700b3a.42.1770282161134;
        Thu, 05 Feb 2026 01:02:41 -0800 (PST)
X-Received: by 2002:a05:6a00:3cd6:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-8241c4c4babmr6387676b3a.42.1770282160705;
        Thu, 05 Feb 2026 01:02:40 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1694c8sm5176743b3a.8.2026.02.05.01.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:02:40 -0800 (PST)
Message-ID: <b114f326-cbe3-4b05-8e6a-2d62636898c9@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:02:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
 <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69845cb1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hk6yhF1Z7CYCzsAHo9MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ZFD7Yg_Zsp1Dkp2-3ouEu3wkzP5ibRJn
X-Proofpoint-GUID: ZFD7Yg_Zsp1Dkp2-3ouEu3wkzP5ibRJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX8RzXotClPSfO
 IbMNDQ0CjQszfgtq79TrhYyxx6PasUz+W2/zQfyD3IkbucynCkdZQzuXWg3OJ+GM8zIbnhepx5O
 RbmH8tuNrJ2DZuWRE/C7lbPOn4nfLSledwFvCCCtLkYqxlqfY5ArYu6poHTShWZ/tXTLUoVbaYs
 Rf+a4brCNAQ2z7nu9xsx9rbe2hDxHrCyE14GuzYFU2rlw+br7y41XfDn04sR6qH251avpg+U5T+
 AT+CQN5Ch60MXDO4Sgr+kk9GGfO14wluOsTaqiQfREGJ80DLx6ylzBWRLay8XSGSHiHHSDGnoDm
 2w2+BEYZ0qat+VR2nmDPYjIoIR8PkUToqdlAvVqOM8QaOognRploq3Bb9StGhqRtahF8yfQmhZM
 wR/3pg6BADviNjfWrzE+PtH5Ud8ub/Wq+GNI+GW/uzwPBMjg+pC/AfgtUvY4JMYPyUSBYVevJjD
 laJRj8Mhf7Z8h75f84w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA54CF090D
X-Rspamd-Action: no action



On 2/4/2026 5:19 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
>>>> The entire reserved-memory region is now assigned to DSP VMIDs during
>>>> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
>>>> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
>>>> heap lifecycle to the rpmsg channel.
>>>
>>>> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>    	args[1].length = inbuf.namelen;
>>>>    	args[1].fd = -1;
>>>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>> -	pages[0].size = fl->cctx->remote_heap->size;
>>>> +	if (!fl->cctx->audio_init_mem) {
>>>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>> +		pages[0].size = fl->cctx->remote_heap->size;
>>>
>>> Do we need a flag? Can't we assume that remote_heap is always to be
>>> allocated to the PD?
>> We do need the audio_init_mem flag.
>> Once the PD starts and daemon takes the memory for the first time, PD will
>> start using the memory,
>> meanwhile, the daemon can be killed and restarted. In this case, the memory
>> is still with the PD and the next
>> daemon connection should not take any memory for the next request. This flag
>> is maintained to ensure that.
>> The memory needs to be resent only if Audio PD on DSP restarts(due to
>> PD-restart or Subsystem-restart)
> 
> This needs to be explained in the changelog.
I will add it.
> 
>>
>>>
>>>> +		fl->cctx->audio_init_mem = true;
> 
> What if there are two racing IOCTLs, trying to init AudioPD process?

There may be a chance that two threads enter ioctl at the same time, and 
seeing that audio_init_mem is false causes it to send twice, so a 
cctx->lock needs to be added here to ensure that two threads do not 
enter simultaneously.

> 
>>>> +		inbuf.pageslen = 1;
>>>> +	} else {
>>>> +		pages[0].addr = 0;
>>>> +		pages[0].size = 0;
>>>> +	}
>>>>    	args[2].ptr = (u64)(uintptr_t) pages;
>>>>    	args[2].length = sizeof(*pages);
> 


