Return-Path: <linux-arm-msm+bounces-112733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fP//K3ScKmpWtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:31:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61967156B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:31:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SoWBbeX8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LwebUkWV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112733-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112733-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F34C632E4A3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14703E451C;
	Thu, 11 Jun 2026 11:30:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A473E44FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:30:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177415; cv=none; b=E/IIJdTYiY1fz996LBkNNnbPrPGYj54TfcRUYOIsYZMQAif/PkJ4niGyvKzetqcmzpTySUmRlSL7Xtzz6i0DsOJADOQzR/d4vsJFdCASMYRe+ExJmPQCiXbb3CG9pgN/0Xvk7iopgO9arXwVDiyqvD7OC0fr0/dBpLzzaGl9Jcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177415; c=relaxed/simple;
	bh=JxydoAK4c/x7mitXawfZI4XQhQgJPPm7W+ijBGuaEZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJsqgeoDeXpfYUsWigkgsinTCnjba3wTZQ5XH6iUGu7JmEkoCbOnsW0Axg1UfZrpFFkKJvF2UhfM5nNtlfrqIlU9FNsJXbIkqmhp6Jb4g3nAv9IEodjtY0twAjqNELq1QMUyx0smmYW2H9JWKOHsuf5dGio2KMRx7jRUFrLGjgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoWBbeX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwebUkWV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xL5r2890671
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2ymPIOvipeO
	RT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=; b=SoWBbeX8lbujDAgZ74I0WDKQdVT
	hDSAFKQvm73YPrcLsecCpb+hDv4OBE0hKMf6GXlAHjY32J/Odq2mMfQKlBenzL8b
	wYMUP1yFXCpXlOXykaiQ+7JW45ErwyJsxYofMMsj6oq8+JFZNrtd6vnO9dZ3GEaZ
	haIginipou/bYdZBAkLq/lix3DzMZxZuqLkbEmKNXygwY5JJaogxUimsLVaU0DF3
	dbTkpOyIMrW/2n0RVcsWwJ5qOKr1G3qmCkL6pwf2l2coTo42zzIrY2SkMJ3zXsiO
	yiM3gnZd1u/9VqbipePGHsspKmSPx2c9CLh/GEgOm/KV6zVjZzO9Q+AHO0w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k3y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:30:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8424aac207eso7934888b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177413; x=1781782213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ymPIOvipeORT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=;
        b=LwebUkWVpTdjKhT8zKafWCEwaGw9aW1Yy/gtr4LsdVd8FQVrGFOTnT9oVS9ECdY+uN
         VRU9rmKQ/CvrPJk88MMAJLd9gK6DEWlXtqNzgcyoV7jKAdMUW6v8HH9nMUyspD1PMsba
         kN9vQuHKzNtKiqbLFIsfdSXl+RG5iJRa2meZwxrzcNHY7Up9rIByw6Gbu9C++IN9u47e
         p7V/aLdl1+UsPziJ0Eu6IEr4eOXnQfTQXbHqkbbNJAT5eSn1d9gbRgeajP0vt9x/cxTj
         KtBJX8uTnCNF63/X+mzCaEmCnbmNufKPGv3HZUufK86WqBYJutTUnyL3wlI9UNcibBCs
         LYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177413; x=1781782213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ymPIOvipeORT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=;
        b=iIIZ9QWEDVnRYG+3MW+o9am1o6+FermqAweKEQBCINOoVqhQ028QHloeB6t5XjkfPM
         9RejAbuTGtol04tlHsEBJp9o/HAJMdSmTZvjuNFnehEQOE6ptbPPuG9EyK7hyjR2G41Q
         7s0++5LK9ZknALWEUI8NkqPTJVnJplpRxZvc4h6/1JHAaVf91gYGYAMZf7BnuL9BPHfP
         31oH3i2VY9VswsHeNgYiNNPfku0q2/nSJz5idT1tcGTcucuii59J65mxLH/MpLHmOjVv
         BdwRV7lgPQposxMx7GrV8U8gUK9H7VPWbTv6ttJM+Kp090uDCqB3SgUmXYx61ilapyEz
         2EgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lFcHsZQq4oMdOG7v2Bh/F/hfT/QUXsQFge4kvLKqjHBJBSle5wk3vKTcT+j6ySr0yYItYlgIKk5XcGajW@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOrDmc3zRg4CXks3cV+UdGlXF8Jx8JjPEQIX+5oeMZ/Jx/k98
	1bDQRZ/R5W4/BxsGpBCGaf3Q5dHirGTRRqcjFAY+wF3Tnm+itEapiJKxC2+aHSmsT8TAyHZLTD+
	jj3k0VDeHbqmQ5mqA8HuXbCeopN2ua8GIE4owY39cRt9AHME6XhB6C6RWVlYKmroZzvxN
X-Gm-Gg: Acq92OHXVT/p4F+j9GQkqGlPzXWCO4K2CXHxt5Uj8AT1Qc1IAM9q+MsxoxHlZZO7ohF
	w2uAYscsw+Idx/OT1s5C/KZNnffe9N24cWF57gIVKLtwCsyPlPJuOs58/8opgTtAPNy1cEeZop5
	Vgrk5AxJfJicJH7SHc8ixObVDi0Jrzg6pRG8DraEcPbdEGjsQ6uKyO188q3Cw2mAEMJnsz6b5GN
	+XpzAgwv+GDH14sO0Qdm5WUDwKgRT18kMi6uRYlvvTphRaVkqihZTWg++6RN5h65jQY1na4Lar9
	a5UARaqesNFVXF6ZwXeiEKa1G7WRGy1rddRxYApep/YZDyGX2GD5CsJHbwmGSyIM0EDPUwKo90Z
	8eDbtRum+W6P23WWaU64z8Fa5Obm/g9FBNkNWOqAzqRJjYip9XZ6t+p2ECTvj
X-Received: by 2002:a05:6a00:3e0d:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-843367eb6e4mr2783379b3a.2.1781177412760;
        Thu, 11 Jun 2026 04:30:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e0d:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-843367eb6e4mr2783265b3a.2.1781177411306;
        Thu, 11 Jun 2026 04:30:11 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine variants
Date: Thu, 11 Jun 2026 16:59:46 +0530
Message-Id: <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OdfclDAnLtqJfnNXD1C4n6SzVDvGeklz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX5OlCoe/fJMkn
 MUBmLrtjFnLgFXaOmK438zo8VzWJiBACbvQyJVnYLidgvZe7zc8CyyVhtULUmbhgN9ORFplrHu8
 oUrGlvgef+LnGACEBQDNNb2UpPC9dcvBpuKPuUvJZ3qeyxMOo4Ttx0DJWSf2wx4Hh4zsJxPc3mA
 DUJEji38jgbvSAgThfwMzl0+uispEYo9mdTdaT8zEE9mr0StLCvucqASSfkWwsfZNCaFfDzmXDO
 YoGTzRbvmQgHHLh5cwjLJC+kMVLEWG4AbDrwbbnoQPy91KRMYl0sfZwoPLureHqK0MLh7C51y23
 I3dH540QezSAmNnNvCkhTipWRR59dowvIxzoaHP5KBbPXsHpaah7lJrAGQDM1FwYO9+MiHCzTot
 aqFqNtQT8vSmSg+cgIusRg2fEabZcWTvPQRUqi01WbmFZUKdQv6EYZ4ZvSYiKMO+L1WGQQ3jMhn
 a8Mv3dG39d+f8XO2vkA==
X-Proofpoint-GUID: OdfclDAnLtqJfnNXD1C4n6SzVDvGeklz
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9c45 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=t_tmAbmC07WJz_vCYN0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX3fxqA5eZQkly
 iBUG67aWZXkzcn8btOfT+CXQeFpWfPtSf5nWuYhVPJJGo7oDoNf1CNnyXQZAZbW6Gccc8j4z6s/
 6HZCEaz0TUQDtQvIB4UHECu6asNeZHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112733-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E61967156B

Add machine-driver support for Qualcomm Shikra EVK variants by matching
dedicated compatible strings and applying board-specific audio behavior.

Shikra platforms are available as CQM, CQS, and IQS variants with
different audio components and processing architectures:

- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQM runs in DSP-bypass mode, where the complete audio pipeline runs
  on CPU only and no DSP is involved.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Introduce variant-specific handling so codec controls, DAPM widgets, and
clock programming match the board design and avoid invalid clock setup on
variants where it is not applicable.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/common.c   |  2 ++
 sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
 sound/soc/qcom/sdw.c      |  3 ++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index f42c98ded..32d6c09b2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,qaif.h>
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case QAIF_CDC_DMA_RX0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e5d23e244..4c985f81c 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
+static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new shikra_iqs_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 struct snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -49,6 +68,7 @@ struct snd_soc_common {
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
+	bool dsp_bypass;
 };
 
 struct sc8280xp_snd_data {
@@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	int mclk_freq = sc8280xp_get_mclk_freq(params);
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 
+    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
+	if (data->snd_soc_common_priv->dsp_bypass)
+		return 0;
+
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
@@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 					       SND_SOC_CLOCK_IN);
 
 		if (data->snd_soc_common_priv->codec_sysclk_set)
-			snd_soc_dai_set_sysclk(cpu_dai,
+			snd_soc_dai_set_sysclk(codec_dai,
 					       0, mclk_freq,
 					       SND_SOC_CLOCK_IN);
 		break;
@@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
@@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
+static const struct snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.dsp_bypass = true,
+};
+
+static const struct snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
+static const struct snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_iqs_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
+	.controls = shikra_iqs_controls,
+	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+};
+
 static struct snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
 	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
 	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
+	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
+	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
+	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
 	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
 	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
 	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4..0be743cec 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,qaif.h>
 #include <linux/module.h>
 #include <sound/soc.h>
 #include "sdw.h"
@@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case QAIF_CDC_DMA_VA_TX0:
+	case QAIF_CDC_DMA_RX0:
 		return true;
 	default:
 		break;
-- 
2.34.1

