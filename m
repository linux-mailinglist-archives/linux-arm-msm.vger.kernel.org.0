Return-Path: <linux-arm-msm+bounces-117764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7jr5MR53Tmo1NQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:13:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C888172884C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:13:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lo+ntH4O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ii/F37lh";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117764-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117764-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9209730C2E14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B0F409279;
	Wed,  8 Jul 2026 15:49:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A141CB31
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:49:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525783; cv=none; b=P/8lx9q9+fCWIpBiQ6yRhgOC0XD7Jk+Aon6SwIL0Dr8MQGB7j2c/9bLokyEptFx8KPR3NCw8NKdJJtRWeYbAoxM19UM3ubH2Jo4NbAangn4kOksElaO0pjWhJLMvEFKMmhpC3qFeyUD5q0E6aQdRhyNkfChQgHFgadj89n589/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525783; c=relaxed/simple;
	bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rW1XwXqbKLZj88WS+oltoPAa1TuRzbOcllrEHzDg5pHriaM94G7VBY9n36fyKV2tkwcrr4bsK5npG8nNpDwdCEp8X9ooKuIty2zuSXW1vp8NdO/ee75QszSa3fj+S9p5E2JPYecIHDbNzrlmokEhzVdx/PBR/urZng17GX3BoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lo+ntH4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ii/F37lh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3hBf2580093
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=; b=lo+ntH4OxtmJKG2e
	4pgczLd1RT9mWAow9l+JW7Zb64iyLdZea6vTBVjxRvbM+IBsBOL5BOG/Gc/xp6Mv
	SVDlpv/VUPdtyirvKj6RG5AZrQlADsX79+9F/QkAqC2/CErwMe1kjt8CQ2u/aQfc
	ybDC8c6LDVtXhKX+H/dr3/AbTIAXq/QTznLCF1m0lNPlDINqa2O86ATOm9Dq6TXA
	MJBv+lTcOjwp49oiBukclBDXAv3bPQpn6MVPzBTHaY05fOixOV31pXLPyg53dJ+l
	FNyoHo/Myu2OMQATLP3fqUJAffuCZHSdo4g34fySsw4UIL3ES+O6rM4Wkb9fNSkU
	Et6iLA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbkad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:49:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44cd59ca66dso1011778fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525781; x=1784130581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=ii/F37lhn9+ZSOX7tdzEZZP0XpnODOAjXT8vhRkyfs8HlAQPPxSBHi6t3wuplmYFD6
         TGuU60oAxJdTrS5PigRruasooCFl7sAoq2DRRvXVWxAHCrW3dT3UHztDJ9+NgnYxQktw
         xGmgR5n2jZ0NNltI2yz/c/6zncrxCVxqV2UUAYGbQRPZAHSbJ8Gq2ldE/sAVa/2aAh/O
         Ugyk+JHVHP6zzVf03Eg3ay4Pj+imYbIbbCKqEHgWxNk7wUM36cNctP7Vo2tRJNV3COfn
         kI6w3vddjhxg8JcM0JYWoNnfdeu/v8WYLzBgtsuy+JmpTZ25ZqWLIGzOZKyYowR1MFUM
         AW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525781; x=1784130581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKsF2C/3MI3j8i6agMiuyrY1TkImd1VL5+3mFxLOY3U=;
        b=RNSTgJkZswGAMRmHkZe/P2e1EARtHtYV6d71FrSy008aZFmUEffSD9E65RUFFKMqe8
         +18PHQ+YZTblLlEEsDHFV8jFhYE1zu5rhWD/k6IvNUwXU/Hn0Dmhb54QrNQ0VGk0lD4C
         6ejtJze6qtJZqStDSF95ncj4uQgpS6l4+/N+6Ijfj8LMW03kWECFyKkecBx8tjjOMAql
         svGVfq14o9cx+zY4fjRYSK4CF3n+jAC9EFLe+gFVV4iBB0BEK6vFpj7DfWXSLFZuCXCl
         UY7wRIok+T4t42ORLJWvNqV6nw8LnOKLvU1XPRcnYng/bZ6DwXzAboE8AFU4dfWxadjm
         2rfA==
X-Gm-Message-State: AOJu0YycGjzK7ik5Y23pFhHDzKEOVaQz6k7rF3SuCHmABs3FvqCppk69
	UEgRJTNSyIPb3HJykvpmNCZ/8SDjJTMv7+3VLOMSuHXCeM+jLeqDM0CImMhzJBZyw1u2i8bvIeo
	MNl7BNdNLcF4cMtswjTpQwByAZ5leuIZYDwhHaGKxTfGdtIaj8KiaohBSdzgXkGQcSY0C
X-Gm-Gg: AfdE7clRHF35KsZcF3n840XVvuBZagb62G+/OvcM69tGejeXzhCS8lQmE3svfbdbop6
	Mft3Sjs3tMY7cRXsrZOedNE4r5urAVh/u5xv8ASdwmjZ2M7fJKI4jDdivQQKbcg2+BzwR3Ncrlq
	WUMUoZVG7Ex6xYAab8ZJtUoi3NQHEfzlL6Z7/CtEBjO5WeKOcvkNg9ouJ6Z4jt60KW1bodTqhX+
	YAVvIlCaP8gy5EinaxbmOAwxzXvuQBbYbiYDO3Jw0z12ohw8SnP9yhRZF8Ts2Z9Xh0kK7TncKRm
	L2URvHNfoGaPdTmV+ZgKY+PH86XNA7E5yuezyXuegteg1/4ScsusB8MzZybyjA8xWpGcGkcG0Sd
	tE85OCQLcYlP15AgNJIENLQhfH4I7IbUUhkWEhdoo
X-Received: by 2002:a05:6870:164e:b0:448:5591:15de with SMTP id 586e51a60fabf-45163e38963mr1977627fac.42.1783525780663;
        Wed, 08 Jul 2026 08:49:40 -0700 (PDT)
X-Received: by 2002:a05:6870:164e:b0:448:5591:15de with SMTP id 586e51a60fabf-45163e38963mr1977599fac.42.1783525780085;
        Wed, 08 Jul 2026 08:49:40 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 21:19:11 +0530
Subject: [PATCH v2 2/3] soc: qcom: stats: Add stats compatible and config
 for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra_stats-v2-2-beb52f24f1fd@oss.qualcomm.com>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=3195;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=TEpHAboYRCNrYmWuk7cTn4eFB1sF9eD4GmknSB3JeVs=;
 b=RvKbKqkI/esze5m5ycbA5rdxHGWHQdaAl35cKkOvShlhbIGDhl6qVLj81VPMB9+dRCk2XYMOa
 cf+u1rff3SbCvx9Lrv8sw8jnI1yrPJg2rHx4LruGrOHf5plpK//HcZa
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX+Icpmmm3VgNG
 X0V+zf9F2t5UV7G28YxRNbbN4SaXR3U2jLlCDoVgFE7j+CYkd94Inal5VtEec2/PL5N8OrKmQdD
 Us6RRtzrRVV2IzQjyLBynptWAhA8dww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX3saE4xzgQn09
 xGz5tF7lonBrItGwPMa3TZFfT0ehJwBf+7EeLQAVH/zPTufNMEha1wKwoqozKsC3sZwQgP2xRzz
 eDVb/gv06jazDssSKFrCUR9pzUarYDzoypJw+zG6glEN21hNcfrOhZXuBdxz1NFrGuhajegnnS6
 Drj/+cwA73rbkCygE5i6zZuCpjt/DVST7w6+r7mAeZwYwMTt/+/Tgaz4iu9QHPLJaYPo7V6I3kn
 ArDaFI2dJonrMyRK7cGpW77s1i4E47mQcNs8JW/aVFnV/t7Bvlhi4Bmd+0ZrGQLhq3C71KdIh3p
 uFsAXXGshmBLADdKJzpI1WOrPgprVfoERIfIAdBJ+soaYh3ATtB4nVwsuOfFBckUvkRDqBt8Q5i
 uAu82KHE9adcCLmPDd5eU8fKoFWrm52SCMgLlIUDSbUH0SVTygUSFRRAPhhDQkVyB5nb8LgqW2k
 O5+C34l/S0wW6ZM/k/w==
X-Proofpoint-ORIG-GUID: WZXwomhS12uF-yosnNcwYi1Aok4bWgrj
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e7195 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: WZXwomhS12uF-yosnNcwYi1Aok4bWgrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117764-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C888172884C

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c was
used for subsystem LPM stats since those stats were populated in RPM
MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 2e380faf9080354fae120e74f0b9bd1f3786d3e5..2f1615e583bbc6ea596d8b73d9bb0a2a00953cfb 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -376,6 +376,14 @@ static const struct stats_config rpm_data_dba0 = {
 	.subsystem_stats_in_smem = false,
 };
 
+static const struct stats_config rpm_data_shikra = {
+	.stats_offset = 0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = true,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data_sdm845 = {
 	.stats_offset = 0x48,
 	.num_records = 2,
@@ -401,6 +409,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,shikra-rpm-stats", .data = &rpm_data_shikra },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);

-- 
2.34.1


