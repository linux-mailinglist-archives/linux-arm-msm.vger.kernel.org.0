Return-Path: <linux-arm-msm+bounces-117250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tmc0HznSTGocqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:17:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2471A347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JYoHJ2gJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W4a4An5E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117250-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117250-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3A12300D76B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22373C3429;
	Tue,  7 Jul 2026 10:16:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767A34CFAB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:16:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419385; cv=none; b=SPXFAqcIFm2+FU3rq3SiF/tBq6evnSjethf4PbHV//XGNigOIU2F9K6j8twfb4SO432eTbnEqhQiBkX+z1C6bxhtx3PW8B1Z/W6wGNuJJ3mNJlGTP/Jhr1gRSzevAybmwvdp4DxHyobXSsMbayleOTQnJ1fB6wkS7LcQU0lAXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419385; c=relaxed/simple;
	bh=Nol2MBFLiaw40O8uQ0Z8ousJfKsgyK1D9m5fxsVh8E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8/1OmxuUkuXt0emou9zvZjvEAm8qLJ0ZoTNpCXpOYIYY8r80GKLSCKI8W1DPwKLe6fT+yWqcvuN2iwvfuydYutE9rxmMPhLpGQtvugiLdC/AJ1nIgGmon+nWXtOePKZtmPChrrmNbXrRMHfRIKqgrv5woBeW335SlaZwDtrxys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYoHJ2gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4a4An5E; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A74Lc3471437
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=; b=JYoHJ2gJXK1AWP3E
	ikrG4NbbsYHW6Qn3Vpqn/E34l3DlwxKePDQ1Y1ePCYeXUuQCrRvjCpZcyKXXYRem
	gB9ou/O9eptfed0y0Z4DUQTMa/vrX1GJryY/odwOHM1wQmSuVDgindjNEGZuUwgs
	p06gWovx5kjv+dflKSk1+NkVXSOCnPUyNugRX61sK1PfT6tyhsZ96lmmhcuLCalO
	nK5pg3ZX9lGq5Ar89TZCgBKq1acuoXP6g9RpQAQ69mjbWvoh8QNaBC6AKXSEY69k
	cSYhyUid9itC9Iyg/RqNMSe2zSJNQNoSRJge7wwLyBm1qgYX/Afz/rHo2miwpIL7
	1yxx6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0g14h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:16:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so9344061cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419382; x=1784024182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=;
        b=W4a4An5EgpxXUs61sYUTrWcu0y5e5rMbyGyotNfUplQ5ec6x7by3WTATbE8fRfsLgI
         hGEMKVDiI13uaiu90Zgk7GQGUodIMCISNNs+uffo2TgUx5c7d+zBIiIS/hSDpHkRPahU
         n/1vf5fpj+aXgaQgwLx+h5lNHNpIpEJB2nvLJQ0lsIa0/nv0/wDPHHPvXFxjzeJAHJBA
         YiGO3DmUYsIiLR/DqSFsTTVgOnND9FdSjffsGgpNcBoHkc3Vpvb7vqtMqA5iL6dY0xk+
         AEpY7Tmnx+YVRY0oCPeccnhtmQQaGN9jdSVRchabedGDHuzitkDWmflDiKdd6J02rddU
         6xcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419382; x=1784024182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=;
        b=HKjbhnZpwRwWG7VFyIvQj6iV8Lpwce7bXFcKAGnuNhT15+E95ArnvzBGFaJ2PmnDDy
         NGgpmz///1HHGIdAXyNQ3CrbcvALfcThNmIr64Dc/T65Lqz4IDT9+LrTawjWbSjH9oOb
         nkUckGJ61xuSR0f9yJnxcMc+IZL+gIdsfWAvMpLLNMANRb6OTpGNHgA1ub+K2GYwK7L/
         oP3CQgs0MKFMEc8XWHDpJngP5BVyLtdX+uipY/sVSNEBcuXFn0tsVIwUS0mmto/qnmwS
         Adt+fNgGctkhft+Euq7R3+DuuWwynYEW5FaoF99i2/emVqbpkW6QEBvjYBjcgv67N9QT
         nQOQ==
X-Gm-Message-State: AOJu0YwRDCLeEL4A67gMWXKbySD2ma9GFVv4sBmVKu0+H4Vji+jmR3KB
	rTYdc8wv7AePKGFSflOy+/JYuFgRyCtcBcGv+dGOIvaAGAgszL3exyi85VL7LSsXnBs2b6RNxG+
	xIY+XhfkMrb8xNV4Kf+bKMpYolX99Ebm9PNiUeXhO8HM6l/TAufhrhCNDIO1NIpgMEeiF
X-Gm-Gg: AfdE7cmgjFncMcP2E75QGrUiUs64rsuUzyAyWG+OZOS0l/i5M0XGmKI839wxLGExYsi
	0Bp2Y9qoEbY0pPbalQNyUc5KKHW/C/4mnZL2Gj/07g6sdvXGVbQr/W9RVPGpmSdOQ1TRmxgd/05
	Jt2//NOi8oprTv731zWcnf0FPKmKzHBcK4CIe6/NqM2q02f/gQVN1awOFgXSeybHE4CgLfMzgRJ
	qTiFyoAk7MUluW7a1ofspDEhVBsVxI7XTqvC+S9r4ZHjLCstrSsu6uECDn3I78deviYBdKUuCpH
	cEXRY1/2tE+ioAhhrago/EwUWunXhsN5rUT+h8ZNCow+XXaOAuhluRW2mYle2FuBef6VsdDK10h
	J5x4bVao/By6KUxz4Q77gx5NTgsTWnjFCU3c=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr121324981cf.10.1783419382498;
        Tue, 07 Jul 2026 03:16:22 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr121324741cf.10.1783419381969;
        Tue, 07 Jul 2026 03:16:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm5807352a12.14.2026.07.07.03.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:16:21 -0700 (PDT)
Message-ID: <b2ea73d8-7fc2-43b2-a9a4-58185d937d88@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:16:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QeiRNxi3n01evfb_QY-7W-HoU3iKfkSg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXxe3s92nj57nw
 jNvKIVIbzZVcbHt5j2eoq+sgW9klBjaqdn0uESkptWUmfqR61r18zSXr5qToGKktjERABC4QFM2
 s1lx/7Mgt2s4wUwGhnPkmKz6Uu/TWcU=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cd1f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-EjxOQQyEQsex0ImKKQA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: QeiRNxi3n01evfb_QY-7W-HoU3iKfkSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX4BTnBvxj9x0g
 mZ8Pi4G+MdlG3nQsexcHUHDPJen/lWM7C5lr00i9s/KCCSJbJpxlNyPGewjzaiDVsR9niEyO2p1
 8komDh7oJXHdz8uNhtDjSRsqZ0SX/V90zg5yulPiNv+jdMW0K9pwOSzOPB9iFXekIIXlreOHJsn
 R1/ADxoJjUzm5ZH8hAo7yHZy5wi5Xuy87kJuTJpnfjtM0XP2b622ipohHIFg2Hgz0dtClDn48xp
 4huu/rl4P+S005gXwJFHLcQsgblT7I7t9FQdf82Lxp65vAAvYwdn1RapuPe5Fy0ckS42zx+7AVz
 cnmOtfcNqEMsz1lrfoAKC/evWtrsY3RmSIDSLhrk9SSIkPkA/DDGoJFDb2Uf0KFxWfK4XKukctN
 xDw26/QVcvQK4PrmSMIR/7WeaYJ2ItbWNdZ77oVSSEbNO1nI6kLD0fLB5SAITuh1yXoslYcplkJ
 wAmYPQ5vfq15+4dmC4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117250-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,igalia.com];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,postmarketos.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 15D2471A347

On 7/5/26 12:30 PM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:
> - Framebuffer
> - GPIO keys
> - Hall sensor
> - Vibrator
> - Regulators
> - Reset input
> - Real-time clock
> - SD card
> - UFS
> - USB
> 
> Tested-by: Stefan Hansson <newbyte@postmarketos.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

With the usb3 situation going either way:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

