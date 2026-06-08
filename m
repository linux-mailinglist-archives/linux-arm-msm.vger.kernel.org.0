Return-Path: <linux-arm-msm+bounces-111748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YD3PED1/Jmr+XQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:37:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287E654208
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:37:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JbkQ/MMm";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VSj6p1m1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111748-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111748-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24FF7301F492
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE033AF66E;
	Mon,  8 Jun 2026 08:29:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3F3AEF5F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:29:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907345; cv=none; b=bOEXDCOpjDwGTxXWFrEz1YfmJ4nudQLYOXSVWdiFM7elf+JaOP/Ds/dvNOhzmXw6dafCvCCT4R+mGq1HdP6/LRZCSBX71i7Zh7O1N3XcWPbja9g8Eh4csuGs08h1w3hXx41+SucI4WNDzDz+M5zOAnM6cFUxT0D1H3kluTFNerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907345; c=relaxed/simple;
	bh=nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QL183rxDQ3h1Vw9sDIegT/1JVfYfgf4ngxIQTQcW0lRWWXLtL04gJQsPyXfipj4c63MWxEBHCNVSG9WHlyM4U4MJ4+k1Rr9cuIn/pYtNsBwx3Grb3gmrp3/B3HFYOdY1WVZ09E/h1fFicE8fhwMIosQvIK7LQj7X6NMzTzFLlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbkQ/MMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSj6p1m1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PTaa2808216
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=; b=JbkQ/MMmUTcM7MwF
	NK4abuDYYabD058wOwhyB3ZZ8ZTM2+FBtWPZD/4hjlYWgO1FUdxqJZ3uVUuxaZZb
	UbiVwAynVW9TxrKAVXqh6HleynTYmDAEw/Fy25gUn3OKtlTjLlhZEXbvjMeKrdlS
	d63PQ0Swd9GmVBcmcFJ2OL1mO5J5GOzJinOhTmK8/sqrcggWIH7kx4tng1Kf3pAD
	X31elUlmle1CSKDGaxLLv6/vdD4U0DiX3ARTegHvj5zABzzZlYGyUAfxt2xh7rvz
	spNweB4pvZr503yWF0J6Drd28ft5o+SVIN/LjB+zYQoWnjKFaBHF89Pj2hzfunxV
	4nhIKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6ujg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:29:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so10728301cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907342; x=1781512142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=;
        b=VSj6p1m1+/J9ItHTkA5fEUjb4jHXy5DQrM9zlmK8D4DI2SDqvUQfGTKUkBzf0FnH5M
         +RvTNmYdIpa3pQUD+uSMdB1nyxX5I4yIAu0RHVPEwiCrgejLs1G6mMXHkxzk00zElc4h
         uLNT9z6YmB9+FEezB3+1M2ONUwodXOaS8v1NM2WO394z+/xY/fLO0nztWRLyV1OOWX83
         cYO3n5vin7tNkj+c6F9WngJMUCOg+nmGU0QInFkuC0UbnpiklMG88IcLcWJd4Bd44p4v
         GvygNHImz8KgrytflfVq080fQj86rBeAY8i367bkRlU/QWVeCI3P5ur9QDF5FKWJqYQy
         fzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907342; x=1781512142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVHrZcHAyNhal2nEdl1wjK4UhN91S0YpmsgQ+Et2tzU=;
        b=n/NgjjzmeOgh4uoNtSA31YqqTZcc9HtanJhcsXRZMLdMKZEylVCN8wou5JbNm3xWoB
         vTv477m+U1+jLIBaenS2ihfiswwZi5uazJgT7wyaw5lJEGzek/VTQsrlUo5vXyOT/fx0
         hyjQUY2EeWABeJLqfaS6csL3DsZyu/qaI3UXoLoqponk0fjBWhIxSvuv/RBwW06IpsRF
         AwA4wN5raDwo5L0sOwLXreWF8o+maL6pQNTWbRsEHOCr8KxvlqCi9YuNPKmTLY7IjwBh
         1oocL0jD2Aw1TtAdb+ME/qq8ddol/MG80TNjWNrJ6Rak8VAFV7RSTNetHUvoTP+O4zka
         aMjw==
X-Forwarded-Encrypted: i=1; AFNElJ+onNvzyFjRqtNZ/J56sQb+DTBaMlF29hAGmvtiVz82pc8TntjjbIcXd7PQxQtI0B9L+e3jmEilvyEkCmrT@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiOK2MecmLKG5JYAukmrT5wHV32+2CyStUFJJFkPQZOcI2dZb
	95p9n57Q1XVKTdAE+XcPoNGz32dkmroWA1WR4cDo7zd5FvzL+aTYoYvuE++bTNOQ4jKzxMzuJu3
	UEnPqo276+A5oIeQ7v+3QvwciVFi0VpiwuU4G4G78cjdCKp6nK6AeL+TuvGjT86uWqpXP
X-Gm-Gg: Acq92OElDoXYquaTkefvxwYnGbe9dcuIwFAtpr16Z8N2Q+LRmYJDDP0U4icTQ4l3SXI
	w8+ZfC/Bi8QyYQe+HiQpNoDDq3BTaDc5hYs+bVB5CkFHcG5w8emhaMBZlVhjYQ7ZfJyWjs/QzGm
	NgUOhRz9QNz0BAkJPYQQyHRHKL6P4mB2H7J/I9cf5lh92NMKb36ukCQwBkarCOBZ7QO6NXrgKyr
	etOQh9j7kRJKoIJwvBNYzkIqMFPK00ZFgQ2eiOvpiefVyoxTDmMzLzHcCgVAgYV9qwyDRpk7/DF
	hyyGgVrMFXvwMPLC9tdSTfLp0lugJJv/jk/o4O/k5lV56zbaNUaz530SVYcYlqLgTGVoraUNyC3
	vh56QIZW8pkza2t49pCWZfs6aMikyonIIPKUG37uFD0gCICfVP3OsmxYa
X-Received: by 2002:a05:620a:1a18:b0:90d:11b2:80f3 with SMTP id af79cd13be357-915a9e00484mr1429225285a.7.1780907342581;
        Mon, 08 Jun 2026 01:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:90d:11b2:80f3 with SMTP id af79cd13be357-915a9e00484mr1429222885a.7.1780907342126;
        Mon, 08 Jun 2026 01:29:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm822366766b.43.2026.06.08.01.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:29:01 -0700 (PDT)
Message-ID: <4f0461e8-e277-4a6e-8c89-50bf04bf23dc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Old patch version was applied accidently
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bI7kIdNuz6RBZpdFVkLVStv_Ts6LIEae
X-Proofpoint-GUID: bI7kIdNuz6RBZpdFVkLVStv_Ts6LIEae
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a267d4f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=WZn9R-PGD3BZfLL3dosA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OCBTYWx0ZWRfXxD8vq1iAMQkm
 cauQa+4HWUzhKJDYicLg9faANrN+oTwsLwInqNSLm8JkjSxL7VmKpLfdRcJ41wRlgXE1wvXHO3H
 Meua4OOq5rkJ4Hs7qYx50xMqnxkTg2zFtasowzQD45jV+1hzYKFgDUPRGCai4Y8QWfqmlc6R24X
 ZtcUhdrS6pFJlv3ssBMxQ0PJBU167P/+8KDTYVnj5i7OHM0XcZ8JO9AZ4JdGKKtazo46LY2+E9Z
 veCh4VYfFjy9r+UGbpzy0qdlN9E/oQNJxE4DK0MFLwcwELvj3KdkdkOBsL3eV9d9GB7AcD4Qeyo
 e4mv7v4amMAMi956dvp6+RS0aw0S1WSb/pxeKwRcWABA/rzG0uGWpuwo5KF9E1WdjzYzIzxPM5i
 vpA3efQa3vRvrBHNb9EHxZXteeH9e9uJpinkQmzevxYrSLN33s5bSYT7yXYWFpcO4cUdTLBoVQ4
 CjablLNj7d1k6beW3Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111748-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9287E654208

On 6/4/26 6:04 PM, Yedaya Katsman wrote:
> Hello, an old version of a patch I sent was applied, presumably since the patch
> series title changed between versions (learned for next time).
> Can the newest version be picked up?
> The patch that was picked up:
> https://lore.kernel.org/all/20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com/
> The up to date patch:
> https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
> The difference is only in the name of the compatible (O to zero), and
> the updated
> compatible in the driver is already applied in next.
> I don't want a release to come out with a wrong compatible.

Please send a fix-up

Konrad

