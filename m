Return-Path: <linux-arm-msm+bounces-116714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dr2rKrV9S2omSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:04:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A4770EE1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:04:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IbcFGi2o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LCHoCipk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116714-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116714-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5378A3374618
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6363426432;
	Mon,  6 Jul 2026 09:12:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE934B1A3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:12:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329158; cv=none; b=D1Ynp29Cj95+49thafBiFbM951h9hCyYmzUvoI64xj2Yxnr2Gkz/kEUZ26yCB0MFZoTZ0DQBrT6uGXu5KQ8gu5/2hY50NU3qDKsLOj4O+PhTJeYbA7yPKvl06J9SCA2ohKoZY0YSLjX2g+NhvMzvNG83PC52zuw+rZgRyFT3bAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329158; c=relaxed/simple;
	bh=/1RpH2yqnJjPQNIJTEaItpf2Hr7eS1uAWjtzpS9kJTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/psKDyZSdF1vo9C9lyzY5Dc4ZV3gp2ozWWXYPmmnopExY/xLg6RS2gLTqpsaBdJseDLneYxEac5nu+c62AYLmEjUq+K0iRpiWNCOcHh3mhs+XyMLnHSuhWoaADmLgLbuCRtOsruCOiqjQgeboNTR/GAsStD2bFH2zL3w+0Xoic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbcFGi2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCHoCipk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666946Cj104030
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4k6XIctOMsE4I5wa1lf5vN9/0nZHwVX3CiwfZgZSUM=; b=IbcFGi2oOgmZA5vQ
	rdo75Uts9RobpqOeA3ibXYygsc7tjiNP0TGs/E40Pywm5rpm34E0Keywgi8tXmFI
	iyEqGUY2DXykOPGR7uDhHC0Wonhk+3EINMJKdX2TyvfrhSd/BNncDtjvGRY7HdtT
	mK1OFXKVUL1NY0eHGF/M6P0j3eKKjN5wBvPjGxFI3Nze3ta6Xl3Q/UlpWbJGcAgW
	8v1AgLzyj8w7wjvbSEGZHk1uU8yLvaGMtd7Pq/85IEktjgAqVuH4N+opGg2KOEJL
	62XtiR1UWQFt83csvsKVhcQmOMQyCTgDRuUt8L93gZNx5mb7SefscLKcZ3yU0zNH
	HwWn7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h50938-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:12:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so35288545ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329146; x=1783933946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4k6XIctOMsE4I5wa1lf5vN9/0nZHwVX3CiwfZgZSUM=;
        b=LCHoCipkXO7fDFn0rfQUubqMSi2XAG/v6TqIt/E7Lpq7RZaFLehuRuwvmzQRNSedMk
         3ecQxl0icHc2TmdYKl8/i3vDRNnaw/UCOJsPCMYApxl68ZX9J+3B6/gOKoukF99RR2dK
         9wr7HCAlBF4GxeKCQIY7z0GNZ6XjyPuw1kyFtqF3MbPJbMvKD8n8/i1mPu6RRIxE4Wja
         o+szOFKsSVHP/rXzf4pUvj/wTT1/J/ywDmyMGPdfoPatxWPE+s/efj8Y9/UapdQOhHr6
         DGtHqrM5iyDrEUHk5VsEc8aHMy5I+QQ7q/4aq0cXsA0dp7bhZDMkaODRk7XN4w7pVnWb
         /6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329146; x=1783933946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4k6XIctOMsE4I5wa1lf5vN9/0nZHwVX3CiwfZgZSUM=;
        b=RQYWWtBn243rQnIu7x8LufAxaPcX/hFVk5N68IzzTIi8qofpis3iTUz8r3lLoSdEt5
         uXpVqMpX9vpNwKPAoemWtnXqsZVSQ331Mwq/9hidjNwUWDYbvnm8ylLH4KrhoEMQXXJa
         ToXX0tSAbSfk26RQlVHIb6lM6lqPAQIcRGGM51cDUr8UMZCYOFr1NDsodRrWbBG4S6gq
         nSfWHxlcnmXpltk5HVDcg+IVxuRh7jPEVE6JuMWFKDgvDgGyRD7n63LJyK+pV5ppNxEr
         fOUwSB2QJzhR57Ordnc/a2BMlcLQ6gZXQUGLDUl3IP9k/wtPfNDGAREq7NKhCQnnTHmx
         DWEA==
X-Gm-Message-State: AOJu0YzNzR6ynfRR6aBHvd9n+JIoqGpmx27schDDRg/3txOq8fpNYxID
	lAqWRh1/MpM4mFO2gFiDCuj7RKbg1s8U4JDRih1P9/TFc10Th1VUMkL1hDHTJAGtAULGMvV/Cl0
	GzYRrv9j0Tsqp+1vmIevx7KeITN/gSYiMI9wS9R7U7+qqjOAcmQbb+aC4fh5WSLBxmd4H
X-Gm-Gg: AfdE7ck5Ais2pTCSYiCurJ7slWEWFhh2FKWotbeXJP08L9m4PjaHtTV3NLKA8q5foGb
	09Pe8DhMGHwnmQLrngn3v63lfWofplPkMOS7c2WYlYZc7/Kgo3b6m3uoK5jVQRcvNdJBw0yeKcu
	NdhNnkVPoCFRQ+Wt+/N3Rk9+rP8M5gSmudnFnS3ndZx0dvLXHTRpWVVMRI60l3MUZ2gDHOIRHEJ
	DLmp1L2blR1FX5Y5ybWBfp+YaIY1GpVKaPj1le4hgJ0Is98iQ31+KOL8CU0Ca+hpLEMcL7GTEZX
	GgxwDpfMCk+GkctmZYU7Hc0EA9EPAgumaGnQ83r9klOnzHAPK2RNRa1U9WszLX5iQX+jVHlD9BA
	99lSAFCqo1f5VDbnaZWm2L+ZaHhCClQv/vQZf2mvC
X-Received: by 2002:a17:903:1ac3:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2cbb9efe1afmr101027815ad.33.1783329140807;
        Mon, 06 Jul 2026 02:12:20 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2cbb9efe1afmr101025025ad.33.1783329135456;
        Mon, 06 Jul 2026 02:12:15 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870ff3sm45614775ad.58.2026.07.06.02.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:12:15 -0700 (PDT)
Message-ID: <91fc1aa6-b237-49e5-be50-87d6a06c6bd6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:42:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m2fos-nVIRscz_pmoMJd6QtsmyHTwQvs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfXw1Ir9JORCnBA
 O2ufpBl+ZAY4+SQ+6qjn8SHLEuZ1XIf7gVZI2CQgzcwxu24/4Eef3x0fpn6/hbBAsFAPBHK5L68
 cAFdPrlpRQQc1o2l/GvMo0ZixpgBgrA=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b717a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8IRLu_cne5rxmUM_wKoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfXxXIHg++I9L7c
 AY/d8EEhoZHjUTLeVVtW85SOGJ79DMHkPYkMTQ2FGuhe7dKTxTZLAcBBvaA9N+TrSYrDQ7j1zVv
 AO95FIa+4cqvHj53V2c4DTtWgslhNdgzYHbwi/Mzwk66kSnyVTbVAUhnRYb+RwHsOqIMg8swy3f
 Dy6mvNxInBjHBDdZ7B3H3UP+S7i3j5ZPnmWUdkUubIgxsLfDh+FKXbb8YCAewIX/1j5BtokqdTR
 QmxJ33nPkz/1IjnVGTFn0qPPPzsN7jMITIQMoB7kCGL6z72kMZx4gACjgpMxZvx/SqKFuHKfvFj
 8zkEfzwfyRJ12A/SPVYwHvIz7EsFR1fvklY4rwijCoFvCrZuGWVGO9BqlII/3fiJr88MeoDTe01
 +i9Hm61d/WiYf9UkwV2uBY7PiGDElzdO8T9ESPd/WpdiGhLksRuS8q1PV5woGVMUony4bcPQqHt
 Rh53cPQlth+R0ENr3cw==
X-Proofpoint-ORIG-GUID: m2fos-nVIRscz_pmoMJd6QtsmyHTwQvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060092
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116714-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46A4770EE1F



On 7/3/2026 4:43 PM, Sneh Mankad wrote:
> SoC sleep stats are present in RPM message RAM and subsystem sleep
> stats are present in SMEM for Shikra.

minor nit: use RPM MSGRAM term in above line as well.

> 
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
> was used for subsystem sleep stats since those stats were populated in
> RPM MSGRAM.
> 

[...]

> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem sleep stats      | SoC sleep stats           |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
> 

[...]

> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

other than minor nit:, looks good,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

