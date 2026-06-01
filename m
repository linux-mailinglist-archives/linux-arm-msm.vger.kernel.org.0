Return-Path: <linux-arm-msm+bounces-110508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGhLCvooHWq6VwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:38:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D861A449
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2623301C979
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 06:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA67A37754D;
	Mon,  1 Jun 2026 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fo1bvltx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzPBv5rr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E7D36DA08
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295896; cv=none; b=plwksZLD3BxmkFghB9xvT91lbyqZ409nw7dNA7v76RWlHQlzjOd3Nk0vg9GBJZ2Nq8ScZ3E9gUSdde3AHC6TH7asGXCPFzozXOG3uzlaT7ZOnyct2u+/y3v8Twdl4UHr+mEMy3AsEhoAS0dm69eNgyMYoNz5JLR4+G/teQ/Ydjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295896; c=relaxed/simple;
	bh=MKOSKfy5HVKspOCH3nNHGWVz9K6OmlhyitqwNsphRo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXxTeDkEvR0iPok5dA7Im+Dc+wyIAWHsxNkRRRnyGkHbVJ7UD3cknwEk/xOewDUFJmMg1bTEpSJWygmXkN8CuRQ2+e70fzaHsEg3df6FDroN6phcAyaSVCx5y5b1zVLWcwWNTN62romYV5g/tGz0LEJwy1Sh/6RtI079xOO/B0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fo1bvltx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzPBv5rr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNliE1045294
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 06:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+ZAvj5oFG/y4ZUnZyUxx7ksRw8f9xhtX9EZCxAOa6A=; b=fo1bvltxnWVYxHTK
	pcSArR0Vgty+pXAO/s1H/DeFLPs9z7JYv6IzJtoQbAi0hvFPkYOSVC65f2FhnzmY
	oXYhvfd1m8l9t50Q7iAmgmEQXhcCNup1YI/ZdA9TYvSJNVmRoldPcWxe28UL6L5W
	yz+8P7VkdANxeMHuuF4H4WXQWZd/QaFwW4ycPv9yQaxMqfngG5jT1wvuYaXqmrHl
	4RhAFsWikQ0a2xdDSxUvUtYzbQb3QUyamtmPe9Y4JEL8ggwmVuCvDpG0zd0wA4cu
	0bbFX8oVAzeyy7wh85dsStGDhEDnukOyaFuwE3iQRKefQYTLR3nrwpFXNbzw6XAc
	yViOdQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrnce3ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:38:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1250807b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 23:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780295894; x=1780900694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+ZAvj5oFG/y4ZUnZyUxx7ksRw8f9xhtX9EZCxAOa6A=;
        b=LzPBv5rrrF8VguoSPuuIznLlHEm4372ToruMeXQmyOUvX35ZnpsR9LcE8tttfttu97
         tohD24vpkYiDmTMVtiKp2IM23kbLJQWJcqBDUQFVoxwm+c0gKjnS6PyEGR9rMGuGAYC7
         aqK8ZWf+3IrrObjyd1wJIJuLTtoPRdkI6cuNP7g5nmNhKi8aZKsXZ0Q8n6VKX/hYrDtl
         hppi4FAkIUr3WWxyllIMmQ9C2rTVwjmhuMM9+mLLnSGWb9KYV6Ulm5oiyg4xnsYBGbR2
         EiGn4kUR1n76AsvWdZ0ODIBHbl2LP2oUbBqi0XtOCsXYPWTm6vZSBHZfdrKEBbtQ7f04
         qQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295894; x=1780900694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+ZAvj5oFG/y4ZUnZyUxx7ksRw8f9xhtX9EZCxAOa6A=;
        b=LXJi8IOzZ3vGmA/JO4Oqs0lj6VcfHVfmWltuN5pSziCYRT5VWW53M2p+DkQSYBR0qR
         e+0TIzUe24BJYUy3PCxFRDk315eew/BYrWHhRUXdYdi9GDyfrY629xnQNleYJ4h5onib
         FOnAH/WH6p/e7XiBQgsKLM8hoFf3k1fZPztJn6N9dsiDzXIVlMvLh+ynierYCVJKLLfL
         h5XStoNYu1kCV6sp4KcHZ1fjrmcY4CzmdkQozRyf1cBvUCJO+ESt7dxN9ouy/aWi7BLR
         qbrhnH9RVBhFSMyAw8Q0vHaSFH+pKOlMlR3J9tIYzFr9Ysxp4ABoV7KyrcbABe1Uw5O3
         ndZA==
X-Gm-Message-State: AOJu0YwS7fmiZoaC72pLHChckIdupdvuaZAACCdafkfGSpNzReVApg2A
	E2KXwfTs5U3titG7u2Bq6L8iWjIjoNspKHTKKa8QBS/XE0SORgA+0Kz/lsvXzhg/lm64oKZsDF/
	xPPLuovtd88xBns0X4/lGuvNrWx79TpDUbSVZ9vIvc/+pdnWtcsu7e+K2R02wdnzkwyzK
X-Gm-Gg: Acq92OEz/AXAbjg4kRaQyPTJYmnkxDW+f4NprzRHvMAWCj2/Yl9pCZwDYBty1JebtTa
	qZidf23U0/ATA3N6Mtv7+NaP2kG8dfBtO61IffwidvlBdMA6XRjIBnqB52CLxL5hblC6JmsOcOI
	Pwdo+js4THjmlz4+J3vQrcA7NXKuXGQMI+95v64GeW1o8H0/FrLY4a698MtxaTCpq+KoxzfK/yZ
	F7dhYJyqTG5zYEjKtL2OjlrO1MKB78Tgtx1EjE6Z28B6sijQ6Alb1CUb2uIXy9BFsEMiuK/bfub
	Cl+el2G5sqMmVKIuw2wOkqF4r4xSnf/yS7XB1F9W4Dw3541R1I2G2R33uvirRCW386LfgY+e5Jb
	F0o1SHd3/sBfSi6KcdWZgnNGlzRRizspazBFdoQzU4epLZASUZ2kNUPRyNhejroXtIw==
X-Received: by 2002:a05:6a00:2186:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-84225490c67mr9382048b3a.33.1780295894045;
        Sun, 31 May 2026 23:38:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:2186:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-84225490c67mr9382027b3a.33.1780295893597;
        Sun, 31 May 2026 23:38:13 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c9252bsm9321358b3a.39.2026.05.31.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 23:38:13 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:07:57 +0530
Subject: [PATCH v2 2/2] thermal: qcom: tsens: Disable wakeup interrupt
 setup on automotive targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-tsens_interrupt_wake_control-v2-2-ce9570946abd@oss.qualcomm.com>
References: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
In-Reply-To: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780295882; l=3513;
 i=priyansh.jain@oss.qualcomm.com; s=20260515; h=from:subject:message-id;
 bh=MKOSKfy5HVKspOCH3nNHGWVz9K6OmlhyitqwNsphRo8=;
 b=t22Pgs2NN0JJK/dfiohdEJGJBmzt/RmIaKXEW/bqpEyFcV/SGVIQFmimoAg3k/5Bnyi/zrPWe
 mTylDvkmCGdBum7wMBxPAAy+IHQVCIXl0YyyblwNFXa7EOFbFR/ayTh
X-Developer-Key: i=priyansh.jain@oss.qualcomm.com; a=ed25519;
 pk=xe57jjgIoTuNHN/Dp00kZl1mAJjmROaH7JV9sRxEoEQ=
X-Proofpoint-GUID: ApUmmaO_dAlPWaBoqqPD0XTzlcNquPfE
X-Proofpoint-ORIG-GUID: ApUmmaO_dAlPWaBoqqPD0XTzlcNquPfE
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1d28d6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PJyjg1ohnCiW5JLUlNMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NCBTYWx0ZWRfX549G1Aqgyu73
 0VHAqCBt1LRBhvgMCxtUxLTAbN9aX3cuUBFCnx/YTXzLMoF4VIjiQWhwDMjnjV28NOBWXTUZxCS
 AFbRLosHH0mUI+NerGqJG6E2gD2feO3z6Sui+sWlNkV8Vr0SyKvWNYxDKUai6Auvcg4m53Zpyue
 J1QB0UqH+55F8pLPHg88yQq6PIXfwtIi+loBf2Gupsd9WKTzPMFTro+sZa/+WsKjAOmZH+kyIH7
 xUK9sd/KCLjnFMQ2efqLiPf3mUnqYFh0xT6jVQqYxoTcj0zVr4nhSPBJAzIed4kiVjxArm+1EqM
 1OSSHrUHUggGgDP3Cotn5sqrFq9pqiiZ2/GA50JfaRTBlihmK3LBKKHYgnhGTXKrs98rPCM7BJq
 9ZNkwPUayQb6FhPSEmk4sv3NxWnpDp/Q/eSGd5oymjHCABWVy5n7MpsQ6uuSpFcnierikwXAK07
 MjIkqFsrSbmrRMWZf/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-110508-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B4D861A449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a no_irq_wake flag to struct tsens_plat_data to allow platforms
to control whether TSENS interrupts should be configured as wakeup
sources.

Create a new data_automotive structure and add compatible strings for
automotive TSENS variants (SA8775P, SA8255P) with wakeup interrupts
disabled.

Automotive platforms can enter a low-power parking suspend state where the
application processors and thermal mitigation paths are not active. In this
state, waking the system due to TSENS threshold interrupts does not enable
useful thermal action, but it does repeatedly break suspend residency and
increase battery drain.

Allow these automotive variants to keep TSENS monitoring enabled during
normal runtime while opting out of TSENS wakeup interrupts during suspend,
so the system can remain in low power until ignition/resume.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 8 +++++++-
 drivers/thermal/qcom/tsens.h    | 5 +++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index e06f8e5802e8..2ee117aa91ba 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -306,3 +306,11 @@ struct tsens_plat_data data_8996 = {
 	.feat		= &tsens_v2_feat,
 	.fields	= tsens_v2_regfields,
 };
+
+/* Do not enable wakeup capable interrupts for automotive platforms */
+struct tsens_plat_data data_automotive_v2 = {
+	.ops		= &ops_generic_v2,
+	.feat		= &tsens_v2_feat,
+	.fields		= tsens_v2_regfields,
+	.no_irq_wake = true,
+};
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 5210985b3767..6237e000640b 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1169,6 +1169,12 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,tsens-v2",
 		.data = &data_tsens_v2,
+	}, {
+		.compatible = "qcom,sa8775p-tsens",
+		.data = &data_automotive_v2,
+	}, {
+		.compatible = "qcom,sa8255p-tsens",
+		.data = &data_automotive_v2,
 	},
 	{}
 };
@@ -1381,7 +1387,7 @@ static int tsens_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	device_init_wakeup(dev, true);
+	device_init_wakeup(dev, !data->no_irq_wake);
 
 	if (!priv->ops || !priv->ops->init || !priv->ops->get_temp)
 		return -EINVAL;
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 5e2da4e0d51b..d20d514bf8ce 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -531,6 +531,7 @@ struct tsens_features {
  * @hw_ids: Subset of sensors ids supported by platform, if not the first n
  * @feat: features of the IP
  * @fields: bitfield locations
+ * @no_irq_wake: if set, TSENS interrupts will not be configured as wakeup sources
  */
 struct tsens_plat_data {
 	const u32		num_sensors;
@@ -538,6 +539,7 @@ struct tsens_plat_data {
 	unsigned int		*hw_ids;
 	struct tsens_features	*feat;
 	const struct reg_field		*fields;
+	bool		no_irq_wake;
 };
 
 /**
@@ -675,4 +677,7 @@ extern const struct tsens_plat_data data_ipq5018;
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
 extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
 
+/* TSENS automotive targets */
+extern struct tsens_plat_data data_automotive_v2;
+
 #endif /* __QCOM_TSENS_H__ */

-- 
2.43.0


