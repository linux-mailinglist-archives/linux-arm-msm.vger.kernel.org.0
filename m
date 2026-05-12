Return-Path: <linux-arm-msm+bounces-107147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOeEIL5hA2o55gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B5525BE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BF99308601C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F05385D60;
	Tue, 12 May 2026 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2PdfjBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CUkE46gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F56385D8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605753; cv=none; b=FoiR7gFpsDBcwBvI+ZwZUpXONa6kt+o3JioMqIabLC6QFeUgMWk7dqE6CZtiVF3Py1P/n1Fp1pQYdbbZthXfo5sf3w5oLq50/CrDgQmsAWsgJ/injrQdQ9kUCTlJKmrdxWan/gxeWjlNMBqxHEJzCFN1d1RdyX1tcnxao8/35BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605753; c=relaxed/simple;
	bh=6BfNCAwXB6Z98KuNe2rjlnNRLT48No4Urhx+Vkp6kHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdCYoNqjy4yawyD9y2A7VoJkv85yzxW33duJKlAHTaFKACRBCBJUDa4jJwALoKv2bIHzIhWJCXBd0P5X+uYsOkRr9Acv/mwt6bZh34E0+Il4gl5fuKA0vM8vekevXjoUv9hzW+oalySxtTxQbzBxqsKOYoD5RXlWzrilo9P6b8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2PdfjBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CUkE46gO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CChAnE1410255
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMWRYi8BYzto0LrWIzUiqfuqVp6k7lmRKbzQ04eMDSk=; b=h2PdfjBe9tg/BM/A
	8KK9orsDoK9hWP+UApHZiYFiuu69ax8y8Ct2+Pa3TZOVWhSOpNQCOuljUJZ0AVdp
	r5/fX9jQINrBz/oy8yhJ71pGw/KYEEigWvH7OxMMynslJM7Gi+VxLCQNIHreqwgm
	0aTIhK4ZaRLfRD5ESbSuIm2KBU/6a2j9i8J5wv7V031VHuUGvXlBWA5P7xbWeRyL
	Kb6AbIzhjFobItQ4ZSljRYfmG2U8qzVtJ4UPcrI0FfzxpbueW35WxvlhImhr8YZ3
	x5TPR0rEeWJ7Eq4lNTJgk+J0iHZ7UD4TX5CpCRt0P+lIgoMx1u2Y13Qo+y+o85ip
	kPY+MQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f311s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:09:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso7417559eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778605750; x=1779210550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMWRYi8BYzto0LrWIzUiqfuqVp6k7lmRKbzQ04eMDSk=;
        b=CUkE46gOd+qfg4Neiv05QjQ6XrIj7t/H+xcGZZinRaOhofa6LTbqAzv4GE1ZYjOLbn
         Xi/ldA4REpx2VipXtKP+5GX89NS+7j5cNP01CPMhRxVISKJoYh5uJsGJn2kVH61Km37m
         0ILtpRpM6IpCdQU0Twxak+d7l/esHWdQq88MoqPoMmdmn5RPF8hpVCQqpkcxnl+yM8EO
         rWaN8w4zl/jsb9S7DcSoCIlEzbLbJMuugmc9sc59IYXlmeSK7qTZAp9hLGbKebWY234r
         +bdmtYE7aMHk58fy6nHlA2kKTfUU6Yrho0u1blO1vk4tLmzFQZsSJOWv0VA2p6O6ipdH
         pypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605750; x=1779210550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMWRYi8BYzto0LrWIzUiqfuqVp6k7lmRKbzQ04eMDSk=;
        b=ix8EPWtXBqEen/JBRWBQgpxABR8OCoYhLxW96YuVmNB4PQ57uVP+QKHUZX69R5zFtI
         moIuX5Bd/MLOwfhVFeEFVkvAF+hEM5qPqpHmgsqCZMLdapO10oVCKTALVls9Ycz7mOZL
         MihjdOZBv7GG8rTzjuYdQzaDyA6/WXk364dS4Qkl4M4C2byBm+Mq//yq8kjg9etsowek
         RnYOrJ/kisqXMLT5/nw1KOsBuKb8DqbvQy4hCR57fJhSN6dR9xgY2wxO/IeJO6xlmYhe
         fC9CqypR6EmwmVDZdBYfAgTcciTjDncR5jD2wjrcuo56S8DiFZlHaR9nvqyiVG+1mbmZ
         Q0+g==
X-Forwarded-Encrypted: i=1; AFNElJ98cT6cFjXo4mYHjhca/dJJxWT2br5g8ptM8inkhJs3bDA+NtF31A30//eWFAMHrY2t6ariFg0VmkgE1wBu@vger.kernel.org
X-Gm-Message-State: AOJu0YzhuKUELgXrw0vPufjMgagReFVFt8kEENZdKU28B62Z13Jmg2Ao
	/8WK7LuZOpKsAIBoKZFf+wZ4NSy0jBpWPfHB12iGNMnBzuJuHYNkYyt2/LHQOXFItWWny7pevsQ
	VEWQngziULGBibpavGDueZcTnGQInBBzbXP7+4hd75h9bbpiNEmrsyBgX6KS68Bnh6JaD
X-Gm-Gg: Acq92OF6BMtc8CpmajouN+s7UaYpQ82Bfylm5Y4SZbTLn9vVBL1MiPEi/rcbrVvg0wK
	RIEJZM6H2jFTno99QoG+mMu2jpZpZJ/D5NbpHranqRdnw+0c/UD+vgNu4gRVftqnIUqKi2o2DrC
	+LRDc/sPel/gPvZG004hXXEryg/fYrarj51r/eEO30vCXwjVVGb1JaDHLEFv7vsnzPn/7GkRI1F
	RZzvqqqIn91lC6j8m2FPFYOYwa52JmmWY8PgF7u+wz9MnQfkXesneLLF6wK6JJ3vOr5B0R9OH5l
	HWuL3di/LCSPelscNAGwXuOO959vCalH+k7YhLE/TYkvWplqJlZziEnnBjADc3RL1q5vot8wrP2
	5Z6pD5lvCPPS2zifOQOyPvpWfca6Zmiv8dh+EtMndX+pE0Ha3hysdMTyk6Xg5TW2dHuVhygMo1q
	U=
X-Received: by 2002:a05:7300:6ca8:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-2f54d696b08mr15445429eec.3.1778605750201;
        Tue, 12 May 2026 10:09:10 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca8:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-2f54d696b08mr15445403eec.3.1778605749553;
        Tue, 12 May 2026 10:09:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafc2sm23409769eec.4.2026.05.12.10.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 10:09:09 -0700 (PDT)
Message-ID: <fe4759b2-4123-44c5-a10d-8ad4697f6de5@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:09:07 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add overflow check to remap_pfn_range
 during mmap
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        youssef.abdulrahman@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Lukas Maar <lukas.maar@tugraz.at>
References: <20260430193858.1178641-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260430193858.1178641-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BRt8n6itB0p2JSvDwahmXG39dCl_t1Z9
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a035eb6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ixu4JsPXSrMzd3x0NycA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3OCBTYWx0ZWRfXz3e5T9Twq/q+
 It3IsHVHXitlOyyTUeJUQYSrAlLGWSQhjOLrVOlqxXmnfLQj0dqexcZriz56OFRPV75BNnqBU7l
 d5i8DrA9YSd9ukMtpqvty5RubIhD1Q/wYezv3kXExa2BecFQuX2bjJdgapQGkRfVxrf9LkglMEP
 Whb1E1d0idlXIr0bp78PdFPxjgVY8pJJ2FQbGvn3g1lSoqoF3H1hEPpcPvgByLCrLp8HPxqMhrQ
 xiYLL5bfU/qlgkMxSQ+LEstdFbmP5v7dnsPw8IrTTw8ijNzLGswGH/MhySOxJgL/AUNnZjyLA63
 /DUmxaKGGoSTSR1jn9cgODYocbg7MC8hrhkMUQzvsy8BloJKoANbXx9845RDE/kLMYWeyszAme+
 N7EzRcj8JqFf5uvJHZLi6CplBIBfEiUdusICZdwC3mejknztBJJWIBQWG+jzzxIyylVyGLPyMgd
 a4bMRoRqbvcBUWsa79g==
X-Proofpoint-GUID: BRt8n6itB0p2JSvDwahmXG39dCl_t1Z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120178
X-Rspamd-Queue-Id: 863B5525BE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tugraz.at:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107147-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/30/2026 1:39 PM, Zack McKevitt wrote:
> The call to remap_pfn_range in qaic_gem_object_mmap is susceptible to
> (re)mapping beyond the VMA if the BO is too large. This can cause use
> after free issues when munmap() unmaps only the VMA region and not the
> additional mappings. To prevent this, check the remaining size of the
> VMA before remapping and truncate the remapped length if sg->length is
> too large.
> 
> Reported-by: Lukas Maar <lukas.maar@tugraz.at>
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Applied to drm-misc-fixes

-Jeff

