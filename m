Return-Path: <linux-arm-msm+bounces-116716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cJkHKM6RS2rBVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:30:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEDC70FD95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kA+sWz8E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A5Ocx+6z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E8BB36F076B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B68426431;
	Mon,  6 Jul 2026 09:15:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94405420E9A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:14:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329300; cv=none; b=sLiFMijsQ0CXxC44epzOlukuvrAvvJISk0Daj6T8RPDnpayHxEAVODDDNSePzbYnrc0frP45K47Er09pPkpnsLaebvzUbYkllDHaXfG+hR2FTiDoJC5ys3XZ2PDGbS1tQfc+12v+zOl/2JzbDcRwEeushrxvZ7HCGb27iVClt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329300; c=relaxed/simple;
	bh=dtluOyszjaEVOB5vepSnrwx0MsVZ8OKeN7of4i90dKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+LBLcXjZbkLog16YA2ddOmvYtm5UbpPauao2TpTUTs3nGXdosUALFxVIywo3XRSZd0F0Titfg7vfem9zgijC6w3bchQ9dfwC3bhnKKYt53uRwegnepzuBgD2Ip4GJF9GzNtNbpp2akDB4WZ4Sy58EghxJ/2NwMhVbtG4NZt4/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA+sWz8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5Ocx+6z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693tDs4108067
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=; b=kA+sWz8ECxfCB+g9
	MM4hac2OneKBIHewOxgKvm8no/OEjSLkP6/1nMtV5yE53Nnu07LKUR3PaXwJV9L0
	HqSclmxeAhreVSTX9uYDOYuHxpwiZu86mMGG8NdlgwVeiYDNhvLWZCpJK1Z1qDNh
	CG7JxY3jCa++1Es5ex2tF0nDHfzdtyGkye3dUDZdRPHxJccKlAinW+qVv3Z5mqbZ
	cwm1JvH3ft41Yh/CtkI2QUXRum6j6VASBGBnX9/Udqm0IRN3aV1gK48ubycXkvvL
	CApSdEUxMG0MqVff3/s3Hj7/t9o5by24+A2kuYs1+z7xX3unqaUYrGNE1HRHh76V
	030U8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrfue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:14:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so10898581cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329290; x=1783934090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=;
        b=A5Ocx+6znVH9jYT2aNceNF4BxaLv+gY+xBcLgeFCMkP24ENvmisPNTSfDzJiSD9Mxs
         6sNh043gCmdt/rBF466GaU8ylt6J1Swci+/EPhP+UVHW9rwfhn2HoYxfOrmC/YlHNX+/
         wwXEreZRViZg8TjNf5wBjIoMlGFTActfXEtJEWWc5qZhYnb1lN1p52r9hjBtCuzVI5Gb
         u1SeqEGAYTEWtqF/sgoxUwgUChZPmqFrWTbEPAQ+no9FXwmVzBZ9+DmFXU6EzuFZtCvf
         XChDcSJ2NLcFQo61aDBWm5Lq4ylKNYHw/+eGjMiyk9RdvXa80gC/lIO+L7JmRCAs0thg
         FPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329290; x=1783934090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SeYPeA3On9glZXBNtzM8xrowcIm/sG9q2sr+yoOgf4=;
        b=rYCHA1VO745KcE8SrXiZlm6I9HlT85rAVpiGBmYVV+bGjQAV1Y7+VSNYhYOx8fKiYO
         Fx44bGNqLUMXjMMkWeDi6gA0EgyePidP0j8rsxzTgwQMSVeMnVLF+DgjEBtNSh/My7Sh
         rG1Skp1XutEuOMO4Re95QwfVVGnfAKru+99oERvAjrYhtdQuditt9sAZlKWxGliZkjHN
         wWMCDOR6l/M9Y3XcJey2rPnx3gKtJ50CbNdsreVMJIdQwr1TTD6iyBBdD4qKPRQmzhW0
         r+3gdqiTT79AJt0K/lGAK7RWmtJbXs5afQ3gaKuf1R0r20UV3r03CvBBcQ3up1cTHINC
         i0Zg==
X-Forwarded-Encrypted: i=1; AHgh+RpYNinDv0ub4MIXPLPrhyqNwri1uY7QDf8vzdHx0bcyXqd8IS7RLee2X142AN1pcvZbwBux/AtSYFjsw3ld@vger.kernel.org
X-Gm-Message-State: AOJu0YwWAKB8uIgEiQnKRpCoYsGh1O0QO/+2E+p/nXOOqMn8IlezL3+f
	nEAfmIwNzQ0s9a8zFLK2OZGZ0aOkmibOcNqaGXu+Wd3d1DIWKBp9WOR3w6ocdLULxCpgIhBk7SJ
	dhN1AO1Z13TWcwph4+G+2ibEF7s2h2ReamIJ2y4SR6HJ8A3g6+yk56Uh98F1+PnTQ3M+4
X-Gm-Gg: AfdE7cl8qUq0ad+IO0UUK1pZp5/f8NFFdIGxyMpc0SP8tmK1l6EIgVc/ne+DGDMmTd+
	V2SQ559PtSmpD1Pdz4Jnow9uQdX3Ai5Uvs3qx63Gozg8bl/HGqQFeTcWrdvJG5Z1EV16jd7U82n
	grfEN0AUvGFw6ntjbNBcfH7odadq7T52DFgaxIWGiOlnI51F/jjUZSW8A8K8yxDy9AQA+afcuzh
	+sQFkUt4rClq4qZ/o37m9kBpXyR3vA/lxzCXc1kbR+FjQsoWyNhWpaVJiXROLjllbFNhJW0jVVl
	Iku7WjCQo4/FJYcCPUk/NMIEYXWDeYtpJm0n1FAHZ67GShv32wWD/ZHGb+2ENPqzZXhFo33xAue
	VQsEiE0q9H8LzDPiqOCtrA9lGa/kshWmbkn4=
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr91899461cf.3.1783329290572;
        Mon, 06 Jul 2026 02:14:50 -0700 (PDT)
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr91899191cf.3.1783329290140;
        Mon, 06 Jul 2026 02:14:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b605506csm701001266b.6.2026.07.06.02.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:14:49 -0700 (PDT)
Message-ID: <373bbf80-a874-459c-b77e-a86dc5f75d51@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5bQO3zM5EKxek9nmL-I06QBWzbhO7Ky1
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b720b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=32KPdnK23d6YPOs0wU4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MyBTYWx0ZWRfX6zprxsNbgF4V
 EV3GjcZtiPXH/IZSCvaO8eB7aFLLGlRaaWRG1rTU1UKSameiiaq8VLaLiIHF6ME0WLGw1TzdGTG
 tERh72WhIGdkDwuFC0oQ5ieRQLIa7pg=
X-Proofpoint-GUID: 5bQO3zM5EKxek9nmL-I06QBWzbhO7Ky1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MyBTYWx0ZWRfXzRo4AP7S4bDB
 jjCxXOoPTJRPuI+CIzENb12Lz3Qz/6p0jMK/BoxuddS2AyRph9jNAhYUcQmq487SVkj/ictmG7E
 X2pINd3WWV4ElvFcF7al9Ag6BMoPlttshZjvxmCWG9neTb1c2y5F/2P1wVYlfdHrE6NlIw/6HsC
 C2GE01JpGoeMrrxMXkBvHShchydBWSf5VP/cVE8zpMNeYLYssmV+hpGBqyxqssdepBryeAgM1UT
 gFrVSKuSILds0uIeNMvZ3urNnylOKqyHeUkrUKWLf8OTijq6D3IgfgKFY7/+Wt4wSwk3+WauaFj
 YwB9o27u1AqeU9D0bHdZTQ3JZrLSm7iG4tLfjBVu2Ukpw2ybw2sqbN21OdFrO4msUOV8E4yP5os
 jz/T0qNPsdSWFF7FsW8vO0POXuR6Z7n4YsCQ9Pl6HeD7TsmV2X3rCHplX5MmWXuRDL4SKFr1n0c
 JQRwjvahDuVAzTpYhNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,ixit.cz:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEEDC70FD95

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This looks good, but since the binding is not YAML, it introduces:

failed to match any schema with compatible: ['cirrus,cs35l36']

so please also fix that up

Konrad

