Return-Path: <linux-arm-msm+bounces-117171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CNk9Op+zTGqeoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:06:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FDC718E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mI0scv5Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Osy49GGW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28AF5304C1A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DD53822B4;
	Tue,  7 Jul 2026 07:51:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7562F0661
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:51:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410668; cv=none; b=tKGre6ZdhPBnViRt7dIZeXu/JfxXemCk8GGZP+J3FRpxek03lTruAQCn/p7rR9DMqHRbZjGcFPBYQnkOau03m1E9cuvamJeIvh2ZMHeGjFC8i4xKpEj2/C1pg153S7q4RA4A/Tb5Nf6DzQ+KhaCZYmRe+r1rDX1iFSAS3kgA0ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410668; c=relaxed/simple;
	bh=Maxo1860W3v7cOruvNsebLdIGgVgbGVgvp0cEF5t6ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCr1kz1IHiqTb79bPy1BLQt1hE2xen5wqHTkmf+90RYxK0DPod6x+CdbuxQ7RPLE2DcIPIXIrybcFVr3vhW8PADSTYcIPIGLIkMUmaFG6OcHcZmY+Tricw0dJiFH9K8m0gVq2J0qm94PiSvMsrCF0vYg3nlOyYRNWG2/0FH0lrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mI0scv5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Osy49GGW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748rre2675473
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnZ3rlISTDjYOEAxPA/dNYNjWT8PUBILAhglC5VQ8wg=; b=mI0scv5Y9oHpnFaH
	1jrVtGsFXeuDRR0M6qUoakxnVUc/NPEmENught+XeNsQHp6IHxNauA6l+z8Thka9
	JyRAjZHxtZD1fRaNvq29pbzqkN+jk8g+QbgaSGXeTZ31KK+ppvQAzXpYwlgIq4re
	mIhKqXl180y2e+dZJw3huTKD1OGlsfsBfOYxD96QrNkyMY/39zLirZnnFWj6TZVE
	ceevLNtxdmZlHJYAIujU2NcIXDYpwxIMeNg76RsSdDCZLtsnBzJ1wmsAMUPQWtV1
	mlQ6/0cAvBBc8/PtKsIjGAZ6NfPD/2hbv+MpZJxyXeazOQeUWSf5icwm9gnZ8RSy
	iCqr1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj799xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:51:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c267931ebso23609861cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783410666; x=1784015466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnZ3rlISTDjYOEAxPA/dNYNjWT8PUBILAhglC5VQ8wg=;
        b=Osy49GGWS5Gu1OuvQSCnK9j1V85oDR+Kr/J6wmt+ejjQsDtR/B/JGGtlknxqb4G7nG
         cIWTHp9t4lyh9CPbObS1EU4+n0OFvGtY0DOOYaVm2rIvV5s4NhXFdS842GXlMu78A/oQ
         +rduME4jfSrotaypd97mPa1dXq9omvfbOOlbLpNnu2LVed6PCTQ+62nQrdYYYNOjeOT0
         /GHanP0bFbb/WqYh6RFNz9dXvkuKjYzLxrIRINds7m53gWkqwylct8DNkz7zZNV293tu
         t3HUp18JoawB8ujKw1UslFU4mo6eaOItqjvIdPCPyYFM5+1LMGO+4ylVrSRXsg2VMWdT
         kc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410666; x=1784015466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnZ3rlISTDjYOEAxPA/dNYNjWT8PUBILAhglC5VQ8wg=;
        b=qXfaJJENVuHy6efIc1asFrZ3apOlPvYbe18zIjfsqJVU0Fj40/x42Egs4+qFceRjhA
         TlUM7v7USHe3GAR81RFbRWVidteQ/MIPIzqoh+6PYDnAh42Sqc7pWIIrZtGe1ZiTNI5V
         qFKwa1x3lof+TNFSuJYZbgS45JtXsCsDX7ooodGgcqCINHy+lOHuIXmIZJMMQWm1CTa4
         8/nOiJynwNIaLeGLP42EKs1euzd6E8lD1bFvffdigUQsaJ5BtX+F0Yr1FG1lg9H0fznZ
         o5Fo9rkGuhOL4t6mwhi0CumJr3ciL/c/CDJAQ73h4OMFIe8lLoaKkpLNbCbLESLzpc5K
         NNbA==
X-Gm-Message-State: AOJu0YxifFRqjDrJfVOmia1o+gGu8/3pPSWHDtYDVBv30Xr85ijjAwI3
	HPasUDbtXK151ThXfYJN8gywgkBL0VhqkZMYcRcjMCpgytGrXY7Vw6jDZdOEwf/UkZGy8OW153v
	GEbnesxiArCMDoeW4aHLJk4UdvmkpjybGXvb14STCBlTBO0Npf58ohnMi9FkLVnXKMmk6
X-Gm-Gg: AfdE7cmuBjkapdWqusqEoSpZ1Iq3Oyti31y2PGsMnPYuKKnGFRkjnuP+Mm7ReSjZEcD
	a2B26F/3GbMDYy0eRXBphUcVqbCvlA1kZlUO/NBYy8eQqkCWVRrXDxGqdMvWIea0BqYOWX1Iqfq
	zntKST9MAiPV9MkC5X86Bh2aMbaCcpJqEFzdVIefeHWDMydgdqtfxmExVjBj3tSyA5io0N+OKdp
	KJQXAGfQGlEPmmgvxtUrLTQvB/FrxhBAalzuxfMLLIpuwIvqNp8JHCV+m8AHV5MDZXAYBhSyv/s
	E24wqJxJ3npjG2NWDLV0cF9PNKNuYRWKdRwfoZVr8vGrhcEjzSx99O88dPlruJ7kDNyFsNxB7lx
	8lwFGHmBser6R5coHnAo9kOiw7fLa5spJQdE=
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr125903251cf.9.1783410665677;
        Tue, 07 Jul 2026 00:51:05 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c4be98f79mr125902741cf.9.1783410664424;
        Tue, 07 Jul 2026 00:51:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm75025366b.8.2026.07.07.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:51:03 -0700 (PDT)
Message-ID: <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ycUKvvqXGTgRnSuy0Rp20sB4jzAfduGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfX341HQBswGUTW
 o2CLLL5tlVeSL1WSN2MBbqu2z9KlOJe2e6LHyGe7rCKMKkS1RfnIFJzcPMexi+Chw9KMGHfHMGc
 mImnTBa3A94Qj45DykNxlk5uVjxN5koP8dq94Ts4OzlQH9UFQhz6dCjQp5irmOzJxH3UDq58M9F
 WgYLf2beeDy3zAn83kqFq1TYuH8fdQOANKq0LXHV/0bs+VEuOQUXgseEiVCXSmsDJfiY9QfRJ9t
 VfTT8p83v5jpmh18vCHPg42lLukmhAPt2adEsbnNjJZ6B6adlheLtUWABn3LAV8bu00JUiVKxjE
 sQKL5/NUtGzkhJV2CpSobD4lGKlCgPAM0EYxMJtPgFy0pOzbfy4JPedl3R7MqjutuQSrlr2oiu7
 KAMsoGzQrATfbV1X4ZpwIThNIBlMkLuZk7ovKT7KPLgkuOuy8Q1dlIvM5jUMOvRRV+W8h16VBQA
 OX/nA2clvF3J/+8lQxQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cafea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=t82OjkPGvLD1vuDj7LAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfX6v5sFbt31KXa
 f13RrlLAmMWruQrNznFM/x4B607nrK9B0Ow/VD8PQYoLBeJYGw4iUHBM6DKoYx3rXsABVkClZgr
 mGnc/s7ddnLyv/FTEtwxT1bzTt5MYZc=
X-Proofpoint-GUID: ycUKvvqXGTgRnSuy0Rp20sB4jzAfduGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 06FDC718E3F

On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add nodes for the reserved memory carveout and Bluetooth.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

> @@ -136,6 +153,11 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		btss_region: bluetooth@7000000 {
> +			reg = <0x0 0x07000000 0x0 0x58000>;

FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
just be the 'reg' value of the bluetooth node. This makes even more
sense as you write to this region using I/O accessors

Konrad

