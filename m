Return-Path: <linux-arm-msm+bounces-108046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA5yLwfZCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:04:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35A561DEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63A6B3001CE0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DB63B7770;
	Sun, 17 May 2026 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsRl/kW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbARoENZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F12F3B4EAB
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030272; cv=none; b=ptmOg8zq/n2DFjqr9Hr8TxCmigF/W4OKhCT1YRl2jQL64LjmRv5HuODgwFtdCArLz2fI4o8aUds7RD13XkQFLv4mQp2lY+KH4UwGG5cxH36EbAKXAahIZi6uc0wudPZ9+HsgffkhGEm0BHiAQSzPsljAHPNciLtQof1l2A4ilbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030272; c=relaxed/simple;
	bh=zgBKqmvo/mlM6FAwfCG0BWWZ2cekk8/EaEDfQ0LGdU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYng8J0Sw2GbvV0pht3eAE2gWcFwbXciQPb+nHuIy6u3HAyKf4smRLTb6prBZftafMxlOzJYkDZSSXAYcBgN38jdIzauAhuXBXuPc5ZVtUM0B6Bkimg7b27OH3FlyQHg8A2lfRrCvdTaXsYUkQD5h4SEXmfh3FMEPBvyFsf4ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsRl/kW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbARoENZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLF7e72167400
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRg5yfMiLjjVTzLnOmCYkQHh9tXjvKAmbvjX79fDqnw=; b=fsRl/kW21v3lLkoh
	9VrhsFaeAsrCc+JkCzRHQYBBjvwpjzmYDRVCrPCW6Et+3emLS0w/SVSpE6/SU0PO
	i7r9YSHND9rbY8pykQ6jx3IY6HYqq1F3y9gGoqxA8vYxstM4GYeqTbZGe2Hnmp0o
	VR33teDnIYGOgLDk/y8dL0eDnNy8/5XtRO7w4VuTxhJsTHRXahVnoSUoh1RfZ6fi
	1V5fHAloq7VEAMKPzR735D/XCtAp39r/9BCCB1I9PvsUjfHM/a3mS0vuPgvGBz+9
	sbFu5XukUPGGuW+RbGGJmL+ok2jxv323WvlUtga0cn7CafCjfMLMsthbpe1wnfgH
	pp1xdA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy532yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:04:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575590529a0so3653934e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030268; x=1779635068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRg5yfMiLjjVTzLnOmCYkQHh9tXjvKAmbvjX79fDqnw=;
        b=ZbARoENZL4bwvi6cH4sTprUvy/GmatPZHgfAFEF/iFas14Nv+E2vm2roum7c+cRYmc
         m5BZB/p4trqf2RL80PvSgjuHd0hUu21NvEvo21fDJHIxAC5YAjSq5bM2VBhqycacelx0
         2iHB2NlUyCallajQ3kXeajLx7MDRDaDY4zNfg2qG+smZs7LYnNUYKmlbTEnVrIMHzPfr
         85ORLYMrOAI9nkAJnjaEjFkwXh6qJPl6+5X18uCmS+nMANuCFctQi1K61VwEBuVnV7Pa
         XEWMKgeh1jUxBmqHwtxz20sU6LElES+FrqOMVYKigZQtuNL42Zp2SjQvABWVouGR2qMA
         a05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030268; x=1779635068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRg5yfMiLjjVTzLnOmCYkQHh9tXjvKAmbvjX79fDqnw=;
        b=j/U3mh2fg93ZLERvism8j1H28jaoIkC1sUpCJAVst/jhIizoYAnrMmDV1+vio3rp0i
         xMuf9Ru39nm8kd2eRep6HrZ0nm2d6WQdF1tba8AttUlVaJjLaP4RlwnaeNQ6Hsgy7d1V
         mMPOnmjpqc3k2MsNA8D3Xe9cjYm1rQckL6GSJXTVtNQX1o8b4J0gR5NuzNp03Gs8Bl1A
         qjXRGuIdXu5MgGwHT6BDac776bwj3kh6vAMIXOJXpWD1BGa6fdb7tECPrliKdwaMi7ph
         TpVkEBGI9B7hO+xNBW0ER6ff0KSiMTiI+vU6tUtxMqHUhMocA9Y6FC3XYhNuyCQ/YSRm
         6Uug==
X-Forwarded-Encrypted: i=1; AFNElJ/9C07gQs+lyntwNjHl2M2YFjvimaxIu3Ps7jlZB8JI2AJvtIOCOtdoprU08YkImLZlyfPvxf9kPwlO7d4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1wZqHpKV8E1W0hJ6AWTf0Z5pHhP+CyT2AUoymEeV6Z8We0CaO
	a+oIkAeNO+tPETIFd0fNSLXNKJJNyvj67533s7Mt6dhHbP0dtRqS1OOiUQPad0z18IZJJDTU7Nq
	z6h/KkZQrrpUgcSloKuaZE6dzWvJFvUkMiJVqs7iPhKk1VlNlBB7rfZ9GCtC0uLcM9G/L
X-Gm-Gg: Acq92OEoo6ZDjPNEJIG5FkGcOhuqSqF3WgZTTzD3tavQv2v+oREZnHRQR2gpnNivIKC
	/JbQkOF14KJy+Z6tBXNA8ppL8pm/DAkGe6aHfzjncguj8PdKZu+CDa591l/yDHU2WezhsC/QOQN
	alGl0hNoKQLyQ0R2OXVaUTOC7ERB4rnvTENFDB4kNpIv2YjmJeBbxMq/SiknKnjB9yq+NLmjmFH
	gDKo8wAyITW0U/SOjiNCfzOEwMIwaAeHsOjfbQ97fiYOYEGDj/xFHQRAan28yONV9AMG+OQlkSS
	9x5QjSXS42ioDECOmnOYEBN4rWQN6yRWAco5th/9xX2Wh/4zhmHBlc2COXTDfh80EU1KPhrUQOL
	LHrsO8SbmO/8SXl9MoWmz53EJ8TW8bahiWEMiq1T+HUvMdQuYe7G+An1ytkAqDD+/ik68zlKvdp
	J7RRf2NB2nnVMx6JcBejk=
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr1488679e0c.11.1779030267691;
        Sun, 17 May 2026 08:04:27 -0700 (PDT)
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr1488648e0c.11.1779030267339;
        Sun, 17 May 2026 08:04:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88e5asm207620125e9.6.2026.05.17.08.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:04:26 -0700 (PDT)
Message-ID: <3aaa5d3a-4aca-4c16-81a1-5afa17fd49d1@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:04:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document the Hawi
 Temperature Sensor
To: dipa.mantre@oss.qualcomm.com, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com
References: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260512-dtbinding-hawi-v1-1-96149d06cccf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a09d8fc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0pnJn9-L8U1tA-XNDBQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: dx0ARpS-97Om72V5tBEKaR8tt7aj_TRP
X-Proofpoint-ORIG-GUID: dx0ARpS-97Om72V5tBEKaR8tt7aj_TRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MiBTYWx0ZWRfXwMfNiuGmgRq9
 jFiGeuL0Ym+GVrTCkiJF6VMx7Wlme3f8FQ8uhrG9lL8b95/i2en1giBJdssO9Nn/yVbSWGSDq7d
 Am4YbdJSKfMbM2+MRbtM2CPZX4wdczYMYHPF0cFfqNBBTn9m3/moV1b0SlW4ct2+ES/wvz68x7p
 iRAcpCBMdDAA3O6alztgQWRkasiZn64T9gvIu+Jxd6F1sw5/I9TwLaGhknjPNISv08m0K+uFphL
 ttcqYvE/m6iXJgjwXLsP/Fsr1gX9cJzYMizuQ681e7GPL0UjokSqGSObUSB8FesiUl6mgTFXJZQ
 zAH+TnY1KABVgpilFVEuEE0eHg1USBBmTBXUEH62qfFmV1B19XfvgKN4F+pyCH2tGJW4teR1rVb
 w7nhoFdvWNGRa0Qw11FvIVWPBYPZOBajBCQxsDuCk2XVAjY9Rfi2bZJtnliu8oAoS3FzAZ0zm6O
 CQdM1Hu3pvdmfJgyxLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170162
X-Rspamd-Queue-Id: BB35A561DEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108046-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 13:13, Dipa Ramesh Mantre via B4 Relay wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Document the Temperature Sensor (TSENS) on the Qualcomm Hawi SoC.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

Applied, thanks

