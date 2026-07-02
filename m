Return-Path: <linux-arm-msm+bounces-116000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2U40EKZZRmqQRQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:29:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD56F7978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:29:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U5SiOrV+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ReNDy5xz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116000-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116000-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B32F131C5F52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28071480DE8;
	Thu,  2 Jul 2026 12:02:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8434963CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:02:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993735; cv=none; b=fSJWtk4928A6wdyeL2RRaCPVRFT2930TO4PxFxSPdkdMP/s36dlFsNED/0TGYQLLXy96iCuD+9P6gWzzZCr7giwel+XlVppV+LaBPTRKs7HRMYPU2oMoU7x2g5VVFB0C9c6G3PPUcWZZM8+mWlB+sZ8h9yOHz+2LOux0AhLZ8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993735; c=relaxed/simple;
	bh=QA/ENzAWWx+dEPMYrFm0KhUY5vthlEuvCNpUs4D060A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OACAWAdxk96wxfTkhDKy9kZGoD6zz1eSDtujTNMnFIrRPLzOlBq5uI1BKmPVqfV5FZdy88oXGWrFztNecY+9VAP0MGAkw8SDjDPGpY7yy/TdXSc9A1Hp2GXb6mINfvLB7Hu3pIrkiPCKA/dKlSdKuJVEAqG0SGUzl9jncREWa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5SiOrV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReNDy5xz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628eh7v3049477
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mP7A3YJtlG0opNpKbxx0bXCptx4rkqA7j4b9Cs5OfE=; b=U5SiOrV+xk0NzOQE
	yBo5JuN6+sPGfWixt3JzY9h4OSUJA1juEV4dWreVMW7BYe8sYFOtb1zK1FeO3Z4/
	mh0HPVi0JTeTHZc8Q5WX9A8scTOgSdPfqLsrq0l2A9SyttQKp9v+oSfvE0giBM8Z
	P/MXtLD9hL7ZdzVW0QiBedvrIkDHA9syviDnmegGVpjOJvptXYvqE9FDCARfrVqZ
	LX29iyplDzqGBj8kXLOA3DdHZmHWdvjmxuoDjMD9kuENkm7VDus7qa2p4/+NR/aP
	VJBCgsPa3UQdZ/eAOa+xJNXnXMStH6q+86yEaba6YiPxwBB5JFa0JLJaJtuXESmI
	dH2GwQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vjt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:02:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96917d46b8dso50397241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993732; x=1783598532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mP7A3YJtlG0opNpKbxx0bXCptx4rkqA7j4b9Cs5OfE=;
        b=ReNDy5xzqAdqXV2vyxHo/VnJ6JBPxx03vGkBoLnSGGiLOn8Q9uIk3NGjkfIzDYESOZ
         C/EjiGcjXKfd8sxo1jyF8BoSXSPeErJQ3yW5t0E1qYEYTlAraSimZBxSzDKhQ2l9Cbli
         rvQvNxEtXb6X+rNhIySAICRFwlwGrN0GeOqqgAcc4NGUew1QXWqGoJOPtrYZJPH1gR2s
         unnyItONBQp0ZVpic8m5LFfak4mw7U/xVz8q6OxVDDTgvF3APeYjFmO230nib/sNB/rl
         gbEbkEaRhK3nbiKV/ZAaTyMZei1ZNwR5gokAUfOhjoCzV7BaoJlGUgKl0/6mN8GuHmG4
         yR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993732; x=1783598532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mP7A3YJtlG0opNpKbxx0bXCptx4rkqA7j4b9Cs5OfE=;
        b=PYmkIyWzN1/UgJPI1+0jzqzDspVM8XEyxPcytI+9hzBLo3DyPzrkn3Rd3UtTFsQZnF
         +OXNGOMhPa8mtkHy+iMp1xJYAGnl7opNWiF7SrcRbjwnibEWqqD4bKJYAixG8799eQ1H
         F+gbdoyScyYVoKTbm+t4kzXd80qAaHG/3oujXztw3te6M4iz8ACG2+BnUV23XYaGijO5
         w5PXOhGu5mD8hkKIS9SNXBdAnEN0tn59M0KJed51MwYVKkhm4bz5bT99qvrGCZuApSQH
         5BAgbNbt16KYEtsJXtPbcYayeVsSfdHZhuhznncUu41DJuqd4hToMiS/PY8RnzoL7jjf
         tWLw==
X-Gm-Message-State: AOJu0Yy31arRF/gjnaIc3LcaleHpem6KomXc6adRtTMXQq0InzwrzKuE
	EZTmoOli6piCLvXFA+eC8etoGeyCJUYlVKGhxfD7P4hIez0W7syFB22Q0BaXpJT+QdYWnvmdWsC
	lYAvt7BlodnJ82kbGDMU8IQpsO4Ea8qvsT7L3Mu5rxZ/Q1u4O7MOdVrAGVCMcoJybFrS6
X-Gm-Gg: AfdE7clmbbGGbn3ahA3ZcDngKIRDz+c+L3WIl5SWJ8ahAKMZC38X/6ZEjk1AAiIf3lp
	7t25eqCmRRw8WgDfk6/ZzRe8/Z+b19XD7CwiEa/rlHwSRR2SJqIbPpzm/1BA8IGMVAshAViBrfI
	pz547KW942sFGvzoUsqlBEDdnkcS43QcV6wAdppy6DKst/i2UpK9rOXZRsyX4jp/MjjVxNZh+O0
	T3EWqJpySU2fEmbk2Ga1Wksq3pB9XD7BpRn7+vM9DZWbnMWjafBnTeKgHlr/ydXZAA+32rfvUK/
	7IGlr2D3nqsBFmE3daxGSvJuCZIstjmKCSzUjAjSRwGoo8MVQ97LGep4H4ExCGuZa2fOCcHqJ5g
	MsHBN9jiq7TLxXNlVTs22eMNJm2ZlLxazWJY=
X-Received: by 2002:a05:6102:94d:b0:727:36b9:dee with SMTP id ada2fe7eead31-73dab613362mr882654137.8.1782993731854;
        Thu, 02 Jul 2026 05:02:11 -0700 (PDT)
X-Received: by 2002:a05:6102:94d:b0:727:36b9:dee with SMTP id ada2fe7eead31-73dab613362mr882618137.8.1782993731439;
        Thu, 02 Jul 2026 05:02:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4a72sm117871966b.43.2026.07.02.05.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:02:10 -0700 (PDT)
Message-ID: <8e11f002-0394-4d9a-8dc6-477320e4418a@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: don't unrelated bits if autoresume
 is not used
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8wZaU4oKeRGUA_J5MffsodA0qpIBKj3P
X-Proofpoint-ORIG-GUID: 8wZaU4oKeRGUA_J5MffsodA0qpIBKj3P
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a465344 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Y22fvUz4BkWrnB2esuoA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX6MwVCmtFZEy8
 VgzpNdh7DffCxM2XOgLRg2ulS/H0/mN8r/2duu+CIe1TDSDYuu/ihnTMPN6S228rDSWnhT721Uf
 gsHEcvJjs4ewrqVKchYQPP3JF3kn19LRPA4f/fNDAfrG0gWO/Y/48fvgAMHcjr2GZbP4KgwBcAK
 T7Ti0LXbpn1m/kpcgv30wSL4M53bE/vSwdYnJ7gx3ZGcvScBibRFo+6umEf9bLOKl4BCWpTDhIu
 zydxANmv4w2K1TSXtEeT754k37+mtC/YX79G4KewDVwdGZGSoLjbCqRnFLJ+DQCAZCBWXEHX1Su
 k0m6SvKupRPMdGFUmwpM3X/f4R3S8TYydEiWN8J1+AKGxDyW0MxFPaANlwL6jGiB8+9+pxFccI9
 7zx0og+mfbM9909iBynFdkulefQq40YDd4QK/zDtK2FYdRLpWqh5dmQJPL7wRuphRr7bhnQuZn4
 BgZL2rH2pMozjJAdY1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX+osTC2XGrsU4
 sIErch3hoy69ZmRC/RU3Ac15CdiDHgOcxeY6KsVCxkS1DcUfafAFKGYAZCZRIfYW7J9ncaWKM5m
 EjY8WWbYNK6EtQoNnh+CLY0kvIWHxIA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116000-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55DD56F7978

On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
> The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
> bit. However the driver ended up toggling a completely unrelated bit
> (BIT 0 in the TEST1 register) instead of skipping the autoresume bit
> programmign at all.
> 
> Update those two platforms to specify 0 mask for the autoresume_en and
> skip programming if the mask is 0.

I'd say that we should just use the correct value of BIT(3) for both
and order this patch after the other one

Konrad

