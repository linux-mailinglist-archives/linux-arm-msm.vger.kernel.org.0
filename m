Return-Path: <linux-arm-msm+bounces-119214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eMQnBDNkV2rMKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:42:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E187075D13C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iJfSX9gJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XXZytLAw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFBF73004430
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10FF443A8B;
	Wed, 15 Jul 2026 10:42:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F15443319
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:42:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112171; cv=none; b=N8CHoWK09xZRrB13cbFJU12eTsw+5Q4DLb8BNI72ubXD1eisnbC+DGWZ6Er7LLyOO4fpT7q+brNFcmB/AAol2SCu7QKXEUD7YwrvZZzz+ElW7N54QOKClXehrwxFg5kqUpT3IklDOTlAmwI9HWSnZ98CrFEAAS12aoCiX89zltQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112171; c=relaxed/simple;
	bh=9NO6Xg19eD54IlnB31oIGDBM5eDI7zAlqt9sPpTxg+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S09tsK0+xBsEn8PHtgWAZWkppAh2ZYnH+mrUrVL4OaVVrmZ3S6914tS7ftp9IhPjfLP7V65sG65w6Q3Yn7imJug7tLXS7IL+BB8pj+dPTbGVhu40zXY9xynh0NOm79wh0CtjdGlDP15jTjXwYRVyW5OReMh7KVR7a6JiN7FaVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJfSX9gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXZytLAw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F93Ogf165340
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=; b=iJfSX9gJMPaBvTKD
	xCzhca+FTeRnhIar5PP9UyGp732a49P2vJwWm3kJksIhkcqu9tZcb3EmUxxkOmnP
	wiq+QZ6kQk4ehZHRoxxDhX+nKZGT53xOHtrluYFFK6lmbp9fxH2qqGgmRUOOWKsM
	9Y/9wVfNg2sHOyGkKswPcm8OvRDEynf8cweZlgwaLpcFBAnByv7GSiFk0DsGJ7MD
	jrd7a+NTfgxrHZIWyPK7z3N7hvMdH2IdyzreoB75+C8Wog3j5BAwRdIWRby+JE9b
	1+La9MwcEqdaQ+UdP4DMZXhwcKmmWq1Qj5OgCKDS5gKSsdFIdiRciprfSAIwb2ui
	DkAs1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrm0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:42:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so97861285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784112169; x=1784716969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=;
        b=XXZytLAwRaOHUa6Q3xiLBcm+a/ECbiQ03baOkkgl61CS9G3Rk/a6O94hzS7ZPL5U6H
         b4nUL0w9dyGihUe1KuiiVXSiHq6saDo06FCniluYan+xmKAvp2NQerXoDU9lTf55VcG0
         PhhhcJRGCd1q+wu2Jc+Dd7MHaIZEdcmA8rBJKi8XfEIha6B5D+WR/vAER0z2Rt+N4d8u
         6Xj8mnUGSFjTLjBtTo+BdJvZY84bEA23BrIeBXrD5vsXUDJ2gKhx6tvK+kaa/f0esF3M
         uRAjJYaiADtZpk1ueMJUnR+eH0z201JCjJ+qruCRTzObA4rWzhOTzxPS7I1Yh3WHxUCF
         +//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112169; x=1784716969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=;
        b=JFAmSpCUCfkPThAj+vMVUUtssIBC+qZ0Tbj7IdSW7N4zwQfM+Q68tmagABmLvr1JeV
         ISUpmtxX3Qja777OApvIwQE762UGw8ovIjXbGwsrVSCkYCGt3OxtX9dKImxrsQefZplN
         op8OxACxg7aIJEy1SfHhN8jg1Dmxn2hMxa6mm+ozXJpF+9WjvY84mjSHsxT2AeG1Upqr
         oJvhrJfilqRjriWqgvncDyPxE/laoSfEByDxy6wxxdSWTaqZxHD50HONF58uBSrZ6tfb
         cBmCZLbNFOOmScdqrZDWu3uyY7PWXObyIjBcm8h+Xb5/15xCsHACd+CmLQ9UYIMddxvm
         giug==
X-Gm-Message-State: AOJu0Yzp5KwuojNLDeyikhggUtRvASH3w7BhZ5OWsGBXhnCiqpMsYN5y
	UJPNjKJkV5etcBmHxBmPIm5wL0xTwuhk8XlY2YHY/OE5UKyqFoNUkEcDIQO6JyHD+Qo9nIIAwPf
	uz2eFtA2WAfejetryTDu+/oLjt0ey/tIUAl2zBRPda5duuBIMXZ2pRJCxzw0XsT7NGeM1
X-Gm-Gg: AfdE7clBBmMMVvn0rMVG3jjTduwTdp5kVj/8Thv4gzgqFD/BHOdHPrhinIJtl5ivzYy
	G6E+3tGbvSHYuVbvr88yRbQsTEzZnEHd9+qNkO3dNBo8vaXANR1/YQPEKmuW1r+iTEM5/czTA4D
	ri5vdO/LsNMUEqFVXstpudFS2Qc9zcdpcs28skJ+QSQHj0TZ2ktEAXtyPVXJf0JBe2XwUy6Kc//
	nwuF8TQGhIZtS7BDQOKW2+oDLjhRww/pZLuwMEOs63ItNHLP58Hvl97ivxd1SF+FOtc82KAEpMd
	OVpyGtt5GLnOEqrzo56fUAXN5OY4VJJhGaEwyM0QcavgndPTCjuTnxzPXRTQgU3gljwqvqmCov4
	RZztILC8dbKPAzuvzP5ZvQrNUAnAUquAHKt0=
X-Received: by 2002:a05:620a:404b:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ef2af8da7mr1347437585a.2.1784112168529;
        Wed, 15 Jul 2026 03:42:48 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ef2af8da7mr1347436085a.2.1784112168078;
        Wed, 15 Jul 2026 03:42:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687171464sm2801666b.19.2026.07.15.03.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:42:46 -0700 (PDT)
Message-ID: <53354eeb-21da-4a9d-868e-970a6c4331e5@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: fix ngd register base address
To: federico@izzo.pro, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KfCpuqya0h5RaD6W6-diYYhbaTDFvRu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX1kMwHYSNoXfC
 nFpzaJFVkjz2pVlloW1JjcVcHqZR7HigVi3RfJ1cHdvZt1pLf7HP80YZHzZawuFnwGXldGLFGHe
 KbXBXqp9XcFInCmubXPffwyC+v0/PQ+gDv42QMjxxPQ8bfWpVcIINzJLF8TYdfOevGyZa+SOA5+
 itDVeHpYQQwb5G1DF0oHhB/yrPu2Dm5zK6MgDofspB/MgwHXSNr8wdXJyHaqQBaQMrwlU1feWZD
 Y1Av6pVettADtxMndoAMKhzRsS37pRf8fCBi0CAIOcCxnyqNfP+xQlrtp2poV+xZNwSX3+1CFCz
 KuDwVsTq8wBcuTV9zd7ANJbNN6q9nYkdGGPqhd8gt46qJc7KZpuf4SbKDq88LbZalOs3p1noMBE
 EnBMqzfJ8QeGqyi8+fOdOE+Hxmk+99z+F7QbTecdr1598F9NfcOI7Otq5i4dW9WtpPKg6M9I7jU
 r6F7xaijv1WLFFes6Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX2clLALS27ebd
 kSMlKhRIPbCgRMvehWF4r44XsNbnMnsyNNhWOc+a4CrBO/hs7+7KEkagbTYS9bG/IfEDlke6ybZ
 0F1ezfrqU6Si1XqHshDsuP00xmR9S4g=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a576429 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=W2E--wPkvXKHDmt8G8wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KfCpuqya0h5RaD6W6-diYYhbaTDFvRu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:federico@izzo.pro,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,izzo.pro:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E187075D13C

On 7/10/26 12:28 PM, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> The slimbus controller register base was calculated using the
> controller ID and the register size, producing wrong results for ID > 1.
> 
> The expression reduces to ngd->base = ctrl->base for controller with ID = 1;
> but for ID > 1 the other factors produce a wrong base address.
> This bug caused a crash while trying to bring-up the secondary
> slimbus controller (ID = 3) on oneplus-enchilada with sdm845.

SDM845 has 2 slimbus controllers:

AUD_SLIM @ 0x171c0000 (the currently described node in sdm845.dtsi)
QCA_SLIM @ 0x17240000 (the one you're trying to enable)

Each one of these controllers has 2 NGDs (indexed 1 and 2), located
at an offset of +0x1000 from the base of the controller and spaced
0x1000 apart from each other (i.e. the current calculation is right)

You do however need to pass the right ID to the QMI message, so the
bug is in this line:

req.instance = (ctrl->ngd->id >> 1);

This shouldn't be the same ID.

Downstream solves this using a `cell-index` property, which
represents the ordinal of the instance of a hw block, but that's
highly discouraged in dt-bindings nowadays. Instead, the recommended
way would be to introduce a struct like:

{ .base = 0x171c0000, .index = 1 },
{ .base = 0x17240000, .index = 3 },

However that would further need a sdm845-specific compatible to bind
the data to this specific SoC. I think we can introduce one without any
regressions (because the other slimbus controller is not yet described)

Konrad

