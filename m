Return-Path: <linux-arm-msm+bounces-116554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X2+lETuMSmpcEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:54:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F170A9E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:54:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N6bLeD5I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IlJBYE4k;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116554-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116554-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD1E30073D9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 16:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26D42EC0A7;
	Sun,  5 Jul 2026 16:54:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5764728725B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 16:54:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783270456; cv=none; b=RbvTP1b55z1QVWEvcrrs9FGIIs0E6dsftR+JAsx9RJ0k07meqmS5RBiWgA97jUZd7y0qR7UCm+yjG/oHeXVKmmSHleuT4MOEZlexTvExkc8nITTt47YZ03DYm84A/+mQRRwIrHZNsNAWDYfKuaGq8dU/dwPKX4UT6scxCBm/6+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783270456; c=relaxed/simple;
	bh=XnlKrBm20/VNbLExDtA9XB21XZ9ga3CjEVdRTPM8dPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UogaOBgnw+C5Rocf2WjNBKpiIN7L/fRSSYRAmJBvfC5xcK3yXHKnAGAX0cZTtSEVTLxzX7IbN3J1EkQVgfg4p0TuPvM8JkF/o5ZaQUxZv/ufSVjKOlI2vbSJOzaXldsYhxrf694noYAOddXxDFmxjYUsqkbhPazXVfYB+cPCuv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6bLeD5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlJBYE4k; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KYSDM3977162
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 16:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZefyJoUxrrCLKryhkIBNsi
	lLO1/PWO8oOj6x55T8Ecs=; b=N6bLeD5Ib8JH85KoQDmTi+vd3i+8mwvf0obBvQ
	CTo8OI18yMF4fzLFxYTi2madogGjogZ+NklgdVM5tmJpJ0s8sA5Su9x+AudxtcQx
	/XMgARW4I8U571W1IRODM4bRddIB5Xsycd1hQx1az9uaf3Jkqn3Fpx99HqJPvLdc
	y/3cu9ZqdWT6i163KCBpaEC6f4z0qrj8cUb96KjlfZaJhp4Gnvxqsz8Y0O/CHPPQ
	Zl1eNslYWJjeYTxYQkqZdeKg6Q3YJr71X1ST/jTergMOJ4fm1f7SQPcLfbhgk5sO
	pv/IzFvsQygvFFfgSBH35ZsODfZZ5A06FZmkJ60hd4hBUtNA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3b1sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 16:54:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so6093727a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783270454; x=1783875254; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZefyJoUxrrCLKryhkIBNsilLO1/PWO8oOj6x55T8Ecs=;
        b=IlJBYE4k5RiiF1eBheEb0oG49bj6T5t8pYCWbnbfifHT1BaWtlx/6iSd5qAUACjslj
         7EA8LYKyaG0jl2om6b1GRaOJjJIjPT/JEe4U5Jm/Euq2TRy2LlT1rW2+KGwv5sSo9SS5
         Num9gFVN80rOfP232c9DBE6DFGSmzfFzfbV0ZdlqK6VcnrRpzIVX8uGcnffu4Jz0v5Cv
         klKKq5L+HO5rTnGN0hngJmRkzZZ9sxfwYjCrkfCCVV/Mqj8gQIHi6l3J0lye0wP880Mb
         BTgRrljlav2LCY7mhiokTiUy+9CEi4yCdty8p3xd6FyHNBOMjPEKXX2M0TQtHhPYqzg8
         zMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783270454; x=1783875254;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZefyJoUxrrCLKryhkIBNsilLO1/PWO8oOj6x55T8Ecs=;
        b=nCDtYEPOwIevZTY9sO85sBydxHO3vy8K8UZryOH6lmhUbEq2/8zApKW9mAfVtTvPDp
         vzmit6AngwjSWlAajJ+wvacCqiHwbrePFb/KaK2udpvPRDv6J79ujYwxd5EFNSlP+IL0
         lUvIUFECOu798G3yXabYg5QQCbnkesSIhnqtUBZ60HfTyoS3hZEer8nRnmW/fkQdDH4p
         0MT7EPMRDSqRAGI5i3n111WFnskuBFgFDWB7RHGqzfMeATSRmS7TbD75LDrUxaGcQvmF
         5tUEa+L/5xd2pwWn2BlwzrzuPzDsq3eeU6BX9s9qVDupZOlZLDppGfFSsbV9JwDtIuBc
         uHAw==
X-Gm-Message-State: AOJu0Yy98d7bpS+DAUN634TQuQ0mYrZRPVcFxIYuG+lN+zB866dE7O2i
	Gpx2sA8c5MadPJsURMAFeJZeu8eS/7V49lGtvWGftHvjrRihsEUs/IT47WePdtRSst0AahRqVVS
	e6jJK0wVYOJVX6dVH4bGfJXiSLglPdvaZuUjHyVrnqewoMYxAuvU7raS1Q0HiCfkKFofF
X-Gm-Gg: AfdE7clJIpqZe9q2S3ecFIpTYKBV6FXmdnt0ZyITI/WPsZO99VwGnq8YZc+kfimllDD
	ZlyFzMAPYn3wpYO0kSy7mEcUlan7rBH9oEoYGXQB5w2Y4Ieb3wl97IU8JiS3gQMUOKe2dXtSo83
	RhLGTjfTRNdQtQX8rRboxdRjDXbtpcEkWYhsVonAbgMLiQfO3CaB66uCVVNoW4oVhncMk73N415
	sY6PmnLS5in/MU/bUFgCRhVBdfHBe9jJjc9tuHPC62ksLuL9MgB3IGiIJkMhnKrVM18Ml0odxvi
	lwpYqCTu9dehAHkYZRdrcHF7GSZqsMGrO0K+LieTZD3mJU5WwlfiGmqtWyQ1rjQyyuOh76+CvC8
	5smPdTsc6JcPqa+zvNpkaM2950Fau0w==
X-Received: by 2002:a05:6a21:494:b0:3b3:fdb0:2295 with SMTP id adf61e73a8af0-3c03e1a89c8mr7573859637.6.1783270453752;
        Sun, 05 Jul 2026 09:54:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:494:b0:3b3:fdb0:2295 with SMTP id adf61e73a8af0-3c03e1a89c8mr7573829637.6.1783270453299;
        Sun, 05 Jul 2026 09:54:13 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm38253593eec.12.2026.07.05.09.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:54:12 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v3 0/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Date: Sun, 05 Jul 2026 22:23:32 +0530
Message-Id: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAyMSmoC/23N3wrCIBQG8FcZXudQ96fsqveIGOrONqPN0k2Ks
 XdPF0GDbg588J3fNyMHVoNDx2RGFrx22gwhZLsEqU4MLWBdh4wYYSUpaI5bGLJK1Koae5xTUiv
 JDxJKhsLH3UKjn6t2vnyym+QV1BiJ2Oi0G419rXOext5XLjayp5jgjEvBeMNlLuTJOJc+JnFTp
 u/TcFAc8OyHYOWWYIHYE9ZIoTjlQv0hlmV5AxYKrH4CAQAA
X-Change-ID: 20260514-gen3_adc_tm-410dcb98be62
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783270447; l=5109;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=XnlKrBm20/VNbLExDtA9XB21XZ9ga3CjEVdRTPM8dPQ=;
 b=mS0oXYAemY/9xl9m3tbNwkBcx+OYtnfhJ2n/JFxqoYWIVFY+iboOuX4F8CMxMOYLz7bEpjNtJ
 uHkbEJce3mbC4wl5dVM59ILaohZYYiYQpd/OXF6KrRSmEAdj33tVlAs
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4MCBTYWx0ZWRfX18+vjbdieSpj
 8qdnG/2IVWwgnHbJRJSOQ68qevEqpddLTJM5nt3tQIyw8jQG5f7eJLnqEqJrpo1LFgeGB6A/FKT
 3MHGtR+b2hcXiuZcSgvLjCAB3sgNcLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4MCBTYWx0ZWRfX59QvtEAYJNAW
 6Gk9Pbrd7nM+mx9pxO+5WpWb75YmNsk/q+D+BhOon6VpOPdZgBsgFQUSVTMDqp4gj4aGsStacvl
 aomgbcAgwDNJW+A55MMg3XWZ6A0j18YfX6556bIxOmhPwm/PjJcU9YewaCj90Z4tG2tOK6oIiGL
 s6xLEcOS4FxMWRHFktVmUQ9Y0WZm/O0hmxBziJRi5ALnrWMN6OJaZ8trXjm3L1D1/4mcediH4gL
 E7hJZLKV8+bCC6OlfrO8H6zrQhAmBqF0yFOp+beLc4slB6OrTKEHVz3W1e9+eUP05W4arlrcS8z
 ELplFdZbDJ3CbC9+2Xwzk/XoruwPwRbM3eOuOglIohit8QB4ILTj2Lb8uaNaYIsNMx1mBcqvp/q
 owF3Jycw4R9LodoBVr9aicszy99IFsgpkBCW5KFPVId299OE3jVfHALyIp8wp7TgwGVLd6b+7u4
 WZThdwYPAU3/LS1pROA==
X-Proofpoint-GUID: opsgpcrlMfqo_9CstGScPlYiMbwrZAg2
X-Proofpoint-ORIG-GUID: opsgpcrlMfqo_9CstGScPlYiMbwrZAg2
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a8c36 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Y40OH6ZSaRz8CUe3D6IA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116554-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:jishnu.prakash@oss.qualcomm.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 969F170A9E4

Support for the main PMIC5 Gen3 ADC driver has been merged now.

In order to complete adding support for the Gen3 ADC_TM auxiliary
driver, some more changes are needed in the main driver, mainly to
improve its shared interrupt's handling mechanism.

Patch 1 simplifies the interrupt handling in the main ADC driver
by declaring the interrupt as a shared one and dropping the logic
used to call the ADC_TM notifier for handling ADC_TM interrupts on
the first SDAM whose interrupt is shared.

Patch 2 removes an unneeded print in the main ADC driver.

Patch 3 adds the auxiliary thermal driver which supports the ADC_TM
functionality of ADC5 Gen3.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v3:
- Collected Reviewed-by tag from Jonathan on patch 1.
- Added new patch to remove an unnecessary print in main ADC driver, as
  suggested by Andy.
- Made following changes suggested by Andy in auxiliary ADC_TM driver:
  - Fixed the layouts of structs adc_tm5_gen3_channel_props and adc_tm5_gen3_chip
    to optimize memory consumption.
  - Moved IRQ request call for shared IRQ into existing for loop.
  - Made some minor style changes.
- Made following changes suggested by Jonathan in auxiliary ADC_TM driver:
  - Removed inclusion of kernel.h.
  - Added 'at_least' markings to array pointers passed as input arguments to
    adc5_gen3_tm_status_check.
  - Updated threaded IRQ handler to handle only events on the same SDAM whose
    IRQ triggering led to the threaded handler call.
  - Updated buf[4] assignment in adc_tm5_gen3_configure.
  - Made some minor style changes.
- Moved thermal zone registration call to before IRQ registration call to avoid
  NULL pointer dereference in case of IRQ firing during device unbind between
  thermal zone unregistration and IRQ disablement.
- Removed the logic to read ADC_TM data registers in adc5_gen3_tm_status_check
  to capture temperatures that led to thermal violation, as we now rely on
  immediate reads alone in the get_temp() call for this.
- Link to v2: https://patch.msgid.link/20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com

Changes in v2:
- Updated IRQ request API to request threaded interrupt in main ADC driver, keeping
  primary handler NULL and using existing handler as threaded handler, to avoid
  kernel warning for using IRQF_ONESHOT with non-threaded interrupts.
- Link to v1: https://patch.msgid.link/20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com

Link to previous ADC5 Gen3 patch series: 
V10: https://lore.kernel.org/all/20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com/

Patches 1-3 of the above series have been merged now. Patch 4 received some
later comments which are addressed in this series.
Patch 2 of this present series is derived from patch 4 of the above series,
with some changes.

Changes since V10:
- Added patch 1 of this series to make the SDAM0 IRQ a shared IRQ and
  remove ADC_TM notifier, as suggested by Daniel.
- Made following changes to address Daniel's comments on patch 4 in
  previous series:
  - Added IRQ request call for SDAM0 IRQ, marking it as a shared IRQ.
  - Split interrupt handler into main and threaded IRQ functions.
  - Removed workqueue used in IRQ handler and its cleanup, instead use threaded
    part of handler for same functionality. 
  - Removed callback function exposed to main ADC driver for TM IRQ handling on first SDAM.
  - Removed workaround to capture temperature causing threshold violation inside interrupt
    handler and then return this on next get_temp() call.
  - Removed all error prints in interrupt handler and updated return value to IRQ_NONE
    in case of errors.
  - Removed explicit check to disable ADC_TM channel in case of (INT_MAX/-INT_MAX)
    high/low thresholds being set in .set_trips callback.
- Also addressed Jonathan's comments on V10 patch 4 related to header file inclusion and for()
  loop iterator initialization.
- Dropped Reviewed-by tag from Jonathan on V10 patch 4 due to significant changes made now.
- Added a status clearing register write in adc_tm5_gen3_disable_channel(), missed earlier.
- Moved cleanup action to disable ADC_TM channels in driver probe to just before IRQ requests,
  for proper utilization.

---
Jishnu Prakash (3):
      iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with ADC_TM auxiliary driver
      iio: adc: qcom-spmi-adc5-gen3: Remove an unnecessary print
      thermal: qcom: add support for PMIC5 Gen3 ADC thermal monitoring

 drivers/iio/adc/qcom-spmi-adc5-gen3.c         |  69 ++---
 drivers/thermal/qcom/Kconfig                  |   9 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 425 ++++++++++++++++++++++++++
 include/linux/iio/adc/qcom-adc5-gen3-common.h |   2 -
 5 files changed, 454 insertions(+), 52 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260514-gen3_adc_tm-410dcb98be62

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


