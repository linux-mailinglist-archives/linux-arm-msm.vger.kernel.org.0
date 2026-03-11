Return-Path: <linux-arm-msm+bounces-96917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG/JNhozsWm0rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:17:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E39260251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F27F3302BE2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9353C661E;
	Wed, 11 Mar 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNcu58fm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aneBZEaG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653F3B6371
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220498; cv=none; b=KcaP7YUtiXBvLdAueL0b4GDmn1WkTPsEUZBItwlYzMlMiVnSna2oDWQp3mMKDdJGswAlfjkbSDYkTuDmTy3oGXTTGjrBeQ1uiGwlAArkUM15+7UfErgx6ly4WsxHbX+hle6jmYBQxQGfD/WU4IKMa69hWX4MEkYk+YDsN6GzEGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220498; c=relaxed/simple;
	bh=HU+C+P0O8jbGCZhY9O/WUb0qwktGd/zUZZfKwgYwewE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6HhH+n1+pMCH3RZRmrxW4VgoUVqweSfiGw2x6WhAWwvl+yvNTPK0XMsxynN/FJzo75VFYf68ke8/a8iKsKokCXU8B69LGw2BFjw6C5HOBUitEIu54r0O1EBMVpKAboIl6X+VEdYyKfokd6WDJdtt79Gv0bwTaQAlFDXz3oQAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNcu58fm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aneBZEaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2jWYh2179919
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1kE1FXsuTlVpdfgBDygRuHNKgg5kM5MBIa1mWYDfGw=; b=hNcu58fmdp48B7Lt
	GAqeW3V4O+0ohEkSHUnrqp1j14oVVmrA6a4UUBFjkXK3qDj2Pcj4p+tZqzRgmlfY
	NwuJQtsUdhW9EmI5NUVPcb9ue5UaajZLBc+X3YD4tW10nzkX1NxomRDdk924Z8/I
	4OBHlGtOA4oN31RBhHcoJgmuNTRh3HesBTnx6E573b6qsI0nCje5ilJwd7yGiku/
	gWZ7j0vfNC16wRWktjhQwQKlNscshiKiCyP0RFPyfFiI2TmF7KbA5QBS8WDXnAeN
	V/cJ75jWw7KKwJtvvTDiZ6D2xDfB/AVQvuGoZ84IVrAihINMoaXYqLxf9khdJc6D
	5+ax0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsts9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:14:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a09f050feso12517606d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773220486; x=1773825286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1kE1FXsuTlVpdfgBDygRuHNKgg5kM5MBIa1mWYDfGw=;
        b=aneBZEaG4D23xRf2U7qRU70VmHmCIIOKhLnARKoWTXbIuLwQQvWUIlc7yw7dDrVHhB
         HnnrtakAMCTBsRQx8MHtyRdR9cFYg4m7Ur4ZFweUpYgoxQweRQj3vxaGFdyKdPHvi+Z4
         ndM0rIEHcs8zqbQrwqzj8xznYbCalN1UK79tbuU0xGJZ8XN/YWuavazB27/8a8QAi6Sb
         AMYezBKfXPczlprDYAAL7iCJkqgXL/x70EPGwYw5iUN/BpPmNIAy7HQuXsLZTPyMGC2F
         4EhGTdKa6evt97b/XB//f8qWoXECQKBLHFw4140QmTHniueyMpu1MwMY5itFyBJm2IOn
         gl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220486; x=1773825286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1kE1FXsuTlVpdfgBDygRuHNKgg5kM5MBIa1mWYDfGw=;
        b=syEU0UTDPQ4Dn+e6/EzO9KKuKfClNWJ8yeGnZIFB8PfqLGPS303OMpcL/c6rI/jBxg
         FZukqXpxB8oTnf0Q8ohw8BjESDejFZLFWS8uvyLx0WzY2sxrAw0RwRMWlKXYmQqdntOr
         sJaMu6pd+XFm8Bl6ev9cjBfmVs1GIcIT9RV1XocNfAE1KvJxXuLI+O2SbzQ+aKo23xdg
         Tph74UuGXn3608fbv7kPpp4CyIb5EjxAXu7O3Ysoz/pnNqkR5Uvlb7X071lIFKZxu1Zo
         6ym2gDNcJAWY04d7JsEVDy1EIrtI6QxNbSPJieL5AbszwKkHd37sPdQWUzWmARI0C/sH
         HJzw==
X-Gm-Message-State: AOJu0Yz/EgY4f0fjfD/PSHg3yB1J85LxbkPi6rvVtextjQmMRSBgQwen
	8wk6TlMfR0XCxeTYLnMkhTSLOvUp9RMzf4ssr/dSsnEMqOfnmPwko0cxVxXYNuM+pyJJ/LUQXmK
	kMNJfq8cT5YE94cTkcDe6/cVH//ZZFspBIX4vKpZlUejjarhmPN9D4F8FGTVWpqk0adhq
X-Gm-Gg: ATEYQzxcXaGWKCsfJYj81fdBzqVLtC/ErFZREwRnq/CzCxkkZhOHGm7XllHeTItzrgQ
	zT/Sk9Y7LkVlCz6ghtjE2wydXUgaticvfq7xkVVyvSBliJVD7UYYeda4UEaoOW6UQ3w7t3ArCKs
	riVAjl3i30dJbEPq7nv5FVGHyrEZ7tFrZCd5zLxep8uCPdcmToZOHQcTPWGO+0hucdVkzuUza2O
	68LYVkRcN/Lg+a9IZfL6IpySeLyi/GuIwTBTpLHyEYq93S12B92kJvt1avrHzqaQJDKI/xsg7/+
	hRZ3XhvUmFY5I0Z2uXO7KES0zFhLB2ZjtNeH8JwPMNQ4/3M5+yQAiC4BFXiJQvDt8S2ddLcLO2f
	vJCPvCPXr79AHYWJHGKrLzxMGTDDXcTac/hT+dHv4d1MpUPpJStQ6CVoQOOuM8UntwAPcNkw7JP
	2EZyE=
X-Received: by 2002:a05:6214:601c:b0:89a:53f8:2df0 with SMTP id 6a1803df08f44-89a66adadb0mr14515136d6.5.1773220485957;
        Wed, 11 Mar 2026 02:14:45 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:53f8:2df0 with SMTP id 6a1803df08f44-89a66adadb0mr14514846d6.5.1773220485414;
        Wed, 11 Mar 2026 02:14:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97359236easm14315666b.65.2026.03.11.02.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 02:14:44 -0700 (PDT)
Message-ID: <f66b7818-a5b0-470f-90c1-8b5d353bb94e@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:14:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: msm8917-xiaomi-riva: Fix
 board-id for all bootloader
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-1-3bfc23996857@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-riva-common-v2-1-3bfc23996857@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NyBTYWx0ZWRfXzdIU0mHdREYD
 NEzP3CYBRFkUpzytT+pYZXoZSKahkGw7vY2HU6MSvyC4XO/i2gSPMOWD5VEhirQMYtGNEHx9B1b
 X2LHFkxC68f6CR/7xGUKE3szzQ02mL5jdle9hsyvPfGLZ2PbxK9oaZpdut0vboufgARPDnZ0ZfE
 qoKkau+K3GeloAZ8yADhUhGBPqRJTbCmlhRuVBei0eyhev5IuQ7m8/Ez+q6K+W2WndAkr8WAFVr
 wJrq9jiszWm193lDUL34t3SBq7WExqds2Ybg5svukhpeJHreg3g/VfGo3fnJGn2Qg0Uh2hc1pfb
 ocugvFtodRTkPtKXR1X8vmGx+NPB9XhcVGrf4jhYUtx5VjNZ6eOD2oxHUajprGknrP9xPwLcorB
 DRgvn5K9W0Zx2z/22M38Hrwy/3YHF5dWHbpknIArYPn4LcA8VCsFAdVx5msLs4UmZK3GPf+lXXW
 k09R4cxP/YTo4FMHubA==
X-Proofpoint-ORIG-GUID: hZ4g0_815CelOd0A3Dc97WESfb5bfSXG
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b13286 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=-Zrnz3ZjQlaq5mEAGuQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: hZ4g0_815CelOd0A3Dc97WESfb5bfSXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110077
X-Rspamd-Queue-Id: 42E39260251
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.12 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.54)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,mainlining.org:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96917-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 6:21 PM, Barnabás Czémán wrote:
> Redmi 5A comes with multiple bootloader versions where the expected
> board-id is different.
> Change the board-id to unified form what works on both bootloader
> version.
> 
> Fixes: 26633b582056 ("arm64: dts: qcom: Add Xiaomi Redmi 5A")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

