Return-Path: <linux-arm-msm+bounces-112715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iasOCBKTKmoiswMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:50:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C9671099
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:50:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QEuT0ujs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Q/u/rHdx";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112715-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112715-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F5113003837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD923D810D;
	Thu, 11 Jun 2026 10:50:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116DB3D16EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175043; cv=none; b=oVrEY4KI9x/lkWZBHpK490AGrP2r0HIeEhvEU46/JQp8o+qUjY32t0dN8QKGjoMB3N+n12kSxCG/bIvvFZZLGxV8ftot2xVw0Cb3+0cTRt66I245/VO0+Ft9PTyff6BZu7XhuuVyjLxWfB18wNUc2ix0X+ct1omqZq1yjaRXLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175043; c=relaxed/simple;
	bh=8ZWWOKTpAlEnSk2zG7CdZOz5PMMpg9lVIa4oHXZQlfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XclpMUgu3eq6+y6UapQwAMtHgDwyzqtD38iKX9CaeXlpNWxdzsKT5GVY5mrHm0yChzUVibGZYmvoR/oAAVKt4PIAnHbz0BkiUh77ACokjdjcsXy490ceXjdLll1zOFWbtka6GhY2+2Rg+r45DxQCUepmBBmF+pVIE/cY8tSmysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEuT0ujs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/u/rHdx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA05QK318976
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=; b=QEuT0ujs5lGyDUK4
	22q/wYlbS5TK4iOx8WdigJPf5IcU3G5nAzI56/az6Lt5vvFBn9Qk3Mb9StCXTUIK
	S5tawApvciJGb68s3xIq70RSP3ebxgM3E484S/oFkiWTwafhy0F1Hg5gYo0P8XQ7
	uvt8A7Wi8h8nbETZ1x0df6I14lvS5OEh3WKhSYTYym9b5gQ8CpjswxMbX8N9AKQ3
	4IU92mjrq6+l9EHlZgPXsSKdwnu3+/hLYkZJzlNe35I5oNuRjLn4DVGhEzsFr1Wd
	up0uhyEr6FoZnDmMs0XnAnyoDICAmxOWyRuG/Q7ZGqDx78yFqXTWt7mgm887m6nd
	bJ9iXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk2k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178a632a12so21203481cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175040; x=1781779840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=;
        b=Q/u/rHdx3kxczXu5Rmi+xoPxTi5BMy1r/j26DaPx0Q/TgVoHYqagsuSH2IPPe/RXZy
         GIWaZicW+QIyXeNdBzufjXG3HCI83M6DzHXMwjhclK3OhSdYMycmNJBzsXUtVKDZA6ZL
         ANrZSY/yHtD8FUodKz056MpkYb0PmIo4vEGvgETHwAcK1seK4hBvS68e80zo0jgF67QB
         thADwG00DUVgj1Ri2CG+r4/DUeEgxzINPgpaZ74gQwxoAo/gbhNsHkEIeHVTAC8rtylX
         GEWKmWxfC2tBy0REmAX8e8OTweLt8fXpmy6Z23m94Hg+Ql1UnjlI7TYo3r1qCUZJNNi9
         wEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175040; x=1781779840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=;
        b=XmjcJSN08vpJjv7N23A9icPvntz/3PPSSuox0VHwocp9H+++ARyjW8pLm/lxNFipcg
         UHlOpvnB7S2JUxViCMOY6un5uy/HjySRndaWIRB7F8NIz/Axd0V/+RL261J6U3+GRlhT
         7xSNfPYuMoBXdRFzGUbMkFwAqqokykPNCpPVFrV+u5+qzwY5VxHfUQytoZ+eVOnERVLv
         +FRqSGx11iX1cyWqHevnfciWp3p+u0m+IUK0y9CPL1K+U5tYT6Ar0euQMaLJ1oiu9GKN
         +B51MrBM8juR9XlFAeybhIqpd/VcETEDCAbrVi1X8D9fGqat+W0I4UrzBje5BJgxeQS2
         n+tQ==
X-Gm-Message-State: AOJu0Yzd1kK6jtShp2bOhy8zgDpz2piv4d4QXlMZIwbcaL7Gspl1pi8n
	tqI15Fco3+XdLx5DhXPWNUducq1WQiJAYkmth34Z+Us3RwmskbaUWr4CP+tmdOjtEpHF6qivnFL
	dvHnwHNNUAc3Ww5kUggPzJsBcYc9Mwb4lbss5YXFlGmV88B0a1uIROcisbcS7LM1hBszc
X-Gm-Gg: Acq92OHFx+sSTABuFRcV9P0kNhvQRvE13pWSKewltBsSYJ99Wk7g6OPO8f1ikR9Uj3U
	PRQnmFUlT4YMjI6Hhc44yTOyVeumgURfU5NiqJleYSXtYayJHSvr647m3jeWOAzNgTwxuPa8/Pu
	jtlTYmko5h+7ciZRiJTkrSXFA8XGNBdbhoskAt6/C8zuhMUgtbyelMikO6mTjqAmpCrB9FUpyVl
	OH6T7sUQYBqfwSR3PZafzLUnzCF08Zwf7Hzm4qsoDOIJnoduIQ1C4TVR+e8si12chqpy8b93WY6
	3h7BCexei0pqfXB+95LDiSZfDNWlVM2eJlWbpx0D9BSqOS8ru3SKpjNl1Fov9JADuc/9JNd2C9Q
	2xkUs1MBqPmhVjDrIy46M9lvWFR8vxnDx5lakxE17anXe1l0YIdoXa4Gn
X-Received: by 2002:ac8:57c5:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ee28c903mr21050691cf.8.1781175040362;
        Thu, 11 Jun 2026 03:50:40 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ee28c903mr21050521cf.8.1781175039910;
        Thu, 11 Jun 2026 03:50:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb53c23c2sm48462166b.40.2026.06.11.03.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:50:39 -0700 (PDT)
Message-ID: <c036a07f-525d-4af1-9e87-d62e111cc908@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:50:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W_E-ZEf7xvEDVtEMbymgW65gauMKF4xl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfXzRHNC9RX8hT1
 UHVnJY3uVaqi6uXJDwTVjn3FTipk1ATBSuyhfIAqDohZiXnEWce7/eWXwwfU50IApl0REisMXqi
 F5/RAvT8P5sfzzN+SfhjRRUzQaGJj80=
X-Proofpoint-ORIG-GUID: W_E-ZEf7xvEDVtEMbymgW65gauMKF4xl
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a9301 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KDmjLdlVZ6sBUA2Pg_0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX4DL2n00hFKGv
 7uzVp/YgjhFLigPZSeerqzUe7e2WJPq73xnvsrGDTVL9tLlsSaO9rnMufVbQ3guUDSxLNs939r5
 pbx9fDq/NdfRIcamxSKnpfqoGb6wN9Yd6kF/ojdqaSrdNChb3tHRYEGAl473dNfP0afIIl9YlPC
 VvS9n7CplhvF0oLoGr3DttetSuXQ8w6mOEwIAuO9SKlB3kaFJ13Sw7WMvqqHAnipdz2psf57PcB
 d2c4/zv0qZVXQeb2MN3gvf48WK+bjYoh9Iv8OYvgkiMDsxtdL5jAJqwVl2KufUekAV3eImEOEcW
 JE57bT5T5Zw0aIZtesdh0zwsFgqTqNPmuwfwnPpwDnU3eRAinLyHyaI4KUFMR/pKo7xroLWyXaK
 DvMVGL52X2xf6K71DXovTefsmsX02s1g2mr2Jj3BnvpMmg3qRnhe9U9SzGC65wXJtu0WUT5V97y
 F3/jcXevNC6GHmAKW2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112715-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A7C9671099

On 5/26/26 12:54 PM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> +struct pdc_desc {
> +	void __iomem *base;
> +	void __iomem *prev_base;
> +	u32 version;
> +	const struct pdc_regs *regs;
> +	const struct pdc_cfg *cfg;

"cfg" is a bit vague, perhaps irq_cfg_fields or something similar?
That said, "irq_cfg_fields" isn't very catchy, so if you have a better
name, go ahead

Konrad

