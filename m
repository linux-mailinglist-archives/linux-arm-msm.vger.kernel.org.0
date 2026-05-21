Return-Path: <linux-arm-msm+bounces-109135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AnjMkJHD2ptIgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:56:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 479335AAA6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84A3C3151148
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE5739BFF9;
	Thu, 21 May 2026 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjeRRB+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AB1ZP03M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB11386C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383957; cv=none; b=kVDbIjMaFwK9mm2N7Bb2ndgKhpOSHwHjkyP5s7Bn/x/z6M/9wLRaK+JDX7AA/pw145mDeCqx+UWgaLPYMLdsjiBgx8qDvi5hREnCAOd1fEvX+Kyk9ij/dPtEpO+XeJPSJwGP4vYZogrtuXtGkGS7oJoAahZeGXVbo/eAw6K43rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383957; c=relaxed/simple;
	bh=lOsbTXyy6RN3zDEn9HQJqgmDm8wkXpcOOq9sn9xR5Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4P9MTQ3Cwm4WFjqW5sk4Y9Lg8/8hCkoTjz7MbwiLClHG0lMkQA4rkjN4nSPf5Ix7AnYsWTjtV/wLDgKhGBss3VN7sC61SpCX/Aqt8BBvoCH+HJjt02B1fCPcXGckBOoMxZJtwlf8QiP4bTet4dCqRtuYsIhhVMFremBLbvBwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjeRRB+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AB1ZP03M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGkDpA4155588
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 17:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NChGK1BaG/5O12ttfPi5g+d3i1i9KIbHQzRVIByizgI=; b=cjeRRB+NnFEldVki
	Ddl0yyw4gBTS51youqMGfmAs3pY+11Gge3pcpBKDidGmZGq/U7ad+aaGqEImmLyF
	lsHj12PMW+ilyuZ5DtvoO+FLmNZZeuh0zZcdxlIHzybY9P3rx/rm/k2eA30rVbUN
	OD8SmuQptxGAvYAFsr+xf5lbMt5oi0Igv9+E+N67mCFmcu46AVIwwmLYligWNbIz
	1ZvtMm2sLPHLjoNmDrWk68fxKo14pCa7940YUgMVARBik/0Req8thCz5qtp/7AYd
	P478yAvwvEFq3AVyUx37aa/Da+tNgu5uhecwqlL10+r3/7T64rMhQ0OdTaboNDZY
	DdBUcQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r963ps3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 17:19:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fd0a49df1so9215147241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779383954; x=1779988754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NChGK1BaG/5O12ttfPi5g+d3i1i9KIbHQzRVIByizgI=;
        b=AB1ZP03Mzg2wMemMh5qGKsMd5GRFtJKOm76p+rg3pf1OIvuwgZul6RjK5ytoEfMtQn
         vdyaGtVTb51tawfOKQ7XUrP1MrLvgxLxmCWWz/ZeaPOZSbEDs6zIv+yF4413DjDXORn7
         ZeyDGmrwV0wUUHY18in6IJHpN3VlioNENqYRyuZJuokxAu+BTpCf+wmTHXmW+NXzOCWS
         5C7CEsekaBcKCjiBH+FpY8piHI57irACm2Aei2mylhvn33OKcMxeAdax99LvX7jjcLfQ
         0ghLR3g98lEKbLvPPxdLaGGNvNfZQ9yzpamfNEEEDrVuIORhjK7jcRG0zGqPsFMlkdZx
         PN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383954; x=1779988754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NChGK1BaG/5O12ttfPi5g+d3i1i9KIbHQzRVIByizgI=;
        b=i2bYhxjPIm7pcN20YUjnwpBcbyyroAr1nHGZRRtPPXoVwYe1KfC1ebl/Jmc8K99k4J
         kRWmek6yGaLFJ7xH+Y573TdcNygHuol1eEdVzwI3b4Ef4LOfhha00QBIEq27qrVaJar/
         jiQkaIJWtoO5UfSZt1mW62hf/ONyyW52jCO6E/qhsMyI6+rPhLIALIn0BxOgwqTqFAjz
         T7LkBzVon1Aq0Kfu9eUCdxyTj2VvJE0lW9drVFNXu7zA+8j4VQK7F/Z1g1sOEcvHnLff
         rW18mz6gtQ8bRjvpyOT9Eo5raQIpWCRfHYwL/f5c0F81YFEjng/wKiTC5kFoynRfiXQd
         s8ug==
X-Forwarded-Encrypted: i=1; AFNElJ/g363qvBsuoGFY7IJbAO+VSNa8dX7ndIuEMPYhAz5BlEsd419AQB91iuYahfxdTIoq79JGTpbPdO9H9tDa@vger.kernel.org
X-Gm-Message-State: AOJu0YwomdFaGFhqJfgGd7SqLbhQgVt+2pCqtqWBU1Z6hu8nswT5f4lD
	PVPqnVbnHTyg7xRBNo/xTfT7rcsfFkjUqM0JRtuDJPEWwDN0Dn0ticdl4rRqNnA6Agwd34/kQ2M
	nX90qWnCEqvIHdyBc7zxtO8sCR0Qi1h43vKwNBwFNCtClvqe4v9o/4Xk7ntTyG0PEQ/TW
X-Gm-Gg: Acq92OG6ORKLNyZiApo1VPro8zM7GMRRW42Y9PzDu9G420aOsQ4dI7pxIxpjT6shVeu
	OYq4lckw+suCUwl/haJk1NLSShUlW4Vr/2kUdxFwBLC8MOVEFCKzDdv6Dn/DjJHGB87uFkExglu
	29PuAOV40WfRrOdJ+6kC18sTKm+vRM5zULUG6g0AP0b/cqZTjsiJ0rg87GHafO2aQcnWlm4L+t6
	JTi9XzExfu+E9/+QQBriSxhrDZpEep4svAowO9J+nB7VP7lx4Gtt72UHa9EKRPxNQF70f6sZX5q
	nQwKaYLY4zm1h53BbR8VMIt4wfvrSci3AQNbv0XS7qM3oTorIFzPMKywYb1TOzYDj1XnZLrfkhR
	eR2nrSfBtKR43ouCEQmJu+t98QYn24Cv7CFkiaCNL3aFSLoLY
X-Received: by 2002:a05:6102:3e09:b0:636:984a:1e5d with SMTP id ada2fe7eead31-6738ef6cdf8mr2969478137.11.1779383952852;
        Thu, 21 May 2026 10:19:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:636:984a:1e5d with SMTP id ada2fe7eead31-6738ef6cdf8mr2969377137.11.1779383951916;
        Thu, 21 May 2026 10:19:11 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eaa7cf58fsm6207119f8f.3.2026.05.21.10.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 10:19:11 -0700 (PDT)
Message-ID: <1b56fe76-981f-4193-bd39-ceadb7b551e2@oss.qualcomm.com>
Date: Thu, 21 May 2026 17:19:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: apr: Check response packet length by
 router type
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
 <3381259a-1deb-460c-bbde-a97263914e15@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3381259a-1deb-460c-bbde-a97263914e15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cFAijeVV9q7q8-eUczjkWntbdLD-RS5h
X-Proofpoint-GUID: cFAijeVV9q7q8-eUczjkWntbdLD-RS5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE3NCBTYWx0ZWRfX8nDmf8vf4dA2
 EWCVomgBEBSkcnTVXmd2e1vOaIb1TxRY36kHVrcqVDUahnh2yWZIrfSGTkAfi/gQ2Rk+Yrs24VH
 oRvbe9hJeA7bfTLEWBwJaOWC7BtXFtesjMFw2OWnKMkSbxDNuDy9hdo3tiATErrPzCEEval/tGZ
 5hfiT5X2kF6JYSQaHa53nWG2T1UqpxU4pLFFvbgiryFDL8WGuE03c+yv9KTIEugIfDhcNALoUtK
 PI2H99b0ksPcDVK42mZbdCYHBmzRVCOLGQxpKSi6OAuylpGQxTmuO9iVRCTcFvDciMAFhrWpBeK
 QcHiDJaFgCs6t2NKyDw4pQuEa4q/VUwlgCn/TGJmUYbvk5ezaSPMY4yi6LtgvpCVOt08WkH1JXD
 maBIK9QnM3FxTs6yKisIqg9EnO3V6xB9+DTzlDthJfksMLCNGBM/RHu3XcHg0lYIkR/MJfvSItX
 X45qKy3tKJvfw6nfD7g==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f3e92 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QEoGycGYwv9BmkwOSYYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109135-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 479335AAA6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 9:45 AM, Konrad Dybcio wrote:
> On 5/14/26 5:50 PM, Srinivas Kandagatla wrote:
>> apr_callback() currently validates all received packets against
>> APR_HDR_SIZE before queueing them for the RX worker. This is not correct
>> for GPR packets, which use a different header size.
>>
>> Validate the received packet length against the header size matching the
>> packet router type before copying the packet.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/apr.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
>> index 127204c195ea..68b357462438 100644
>> --- a/drivers/soc/qcom/apr.c
>> +++ b/drivers/soc/qcom/apr.c
>> @@ -165,9 +165,20 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
>>  	struct apr_rx_buf *abuf;
>>  	unsigned long flags;
>>  
>> -	if (len <= APR_HDR_SIZE) {
>> -		dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n",
>> -			buf, len);
>> +	switch (apr->type) {
>> +	case PR_TYPE_APR:
>> +		if (len <= APR_HDR_SIZE) {
>> +			dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n", buf, len);
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +	case PR_TYPE_GPR:
>> +		if (len <= GPR_HDR_SIZE) {
>> +			dev_err(apr->dev, "APR: Improper gpr pkt received:%p %d\n", buf, len);
> 
> It first says "APR:" and then "[ag]pr" later, please at least make the
> case consistent

Ah, seems like an overlook, thanks for spotting it, will fix this in
next spin.


> 
>> +			return -EINVAL;
>> +		}
>> +		break;
> 
> Switch seems a little far-fetched, unless there'll be more packet types
never know...  we have similar checks in the driver, atleast its
consistent with that.



--srini
> 
> Konrad


