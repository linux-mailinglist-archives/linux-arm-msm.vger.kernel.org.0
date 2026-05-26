Return-Path: <linux-arm-msm+bounces-109769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFB0CrBzFWpbVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:19:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCA5D4101
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F231302CD35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF163DCD98;
	Tue, 26 May 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pnmsWBJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+tOicET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA93DCDAC
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790756; cv=none; b=sBdsq9kF+dElaYVpS95ss8iQXKuIazfV9VF3ccJINeC8+SNB1ps4qswpoTSV1Mqh7+GmhZ+H/KkDlouoV7mzwD9NuYkHszaGaIIx+EbAGG2xcxxojCOBThRRNvOYQorZmHupWq9t6Ei0aktEBZOEdX+58GKwVR9hsL2yhg8j8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790756; c=relaxed/simple;
	bh=KMog7D1zSTb8wnRR6eVYIq9bcVDVinAsuMOUfZaTXa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXx2aaPzUoGbpnaC8iFOiwKUf8Yjkm6BtLYOrVniHZ9oahHoM9V6nTgzgOOIKaAancBiTCELQcyVNpzq15CuXWjimhwkWfCEYjEs7IYDHOEp9hGiWg008G3V1M8+VRHNx5ex9BbEif3iS5kbDPdou6DdsP350XYZHQ20hYc3vLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pnmsWBJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+tOicET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q98ulg3657998
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HK4haDG9Zw0Swz2Z7gX/R9iwSWL5VczHkBfklVCM2EE=; b=pnmsWBJ41qk5TWH8
	jQVHcqAMDVispRExzQX0iHCAN7AoZFvSNhabcUnLIiznO3ENhMrxYxS01yvk+N4n
	TH2SKQdFvDbz8vYrCm1crDucbg6YURsCxOunJ0zJuXXW12sdcjKm7JvPn8zQoNmp
	/YtqBBQcsLd9k1G/Ub1+baSg7n+/dG2v/9uRe1g3IV09kq4sROx/fcGMjoQkx5bT
	3QNlUvMRKesZ2U6BmC+FgAMLmjqvoqfUkRxATPqPafpNeI/qpYiHZ4r+XnL6mHzo
	Nys0Q2xQDgomwqBsnUwBPWmzxE6/WTEr1X8yeVZcZ0OZJMzgVHcjRzVH/4ENwTln
	Tmfxbw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbb00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so110068985ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779790752; x=1780395552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HK4haDG9Zw0Swz2Z7gX/R9iwSWL5VczHkBfklVCM2EE=;
        b=C+tOicETUunii1v9VxpxhYU+Cyn7ISMGN3nf0D4x5HjSmDKLMb+ETLwVP1R85dCCrg
         fTMtBcLMmp3qQ31BieQeoXHw25J7lUu77Y4LsWRTxS3wmDBNwQt7ICkGRlzeF+E70XYA
         Ng75O24i/Caev8UVkYJNlB9DHJZGQSAAvnHd0HdEdPWg1K2ClRpQFimG1uW6/8G1oeZj
         xt0BlVDDDZxCoNJ58vBb+uLqhk4ebeqnSd4TBrq+4m9JiOIOA3mSaVVp3sxMn+QEsp2c
         v+RczqinevkeeFuGk6lVw0bO7EV9PJMkrxXjdjfXhZtsDZFGw+5F/koMRSSbuEsPdvsT
         RcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790752; x=1780395552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HK4haDG9Zw0Swz2Z7gX/R9iwSWL5VczHkBfklVCM2EE=;
        b=Cz+NMa7V/Lec0Q0DSSDc9K5B1pn30/WYBtZmdJrWj7/pklf4SrKXZLmsD75J7EUhwk
         UD/oYCPNfD6ps/3zTgAYg5emMTDwIbaMlI+ZNVrhFtxmJeZtgp41rANKhV97iUaf6SUl
         yZSuYcf3pGxJJPBBE/PR5I565Wb5k9SjQ37UBICD8hkG7QoQ3LObuFjKWoAKEk3EVq3D
         nqt9yVASw3t4qnBGAdt6pgpUB0Tl64VaotPKTR2uF3DUNykG1OoV+jTpuDALZod8lw/K
         VPKOPyXzkzMRP23Ft0GeQvdafzui7tuMDLgRIaPm44Q79iEHHVtvvzZ+ZndQvJ26tPR6
         /9Ew==
X-Gm-Message-State: AOJu0Yxmtyds5B0lA+Bx6IoTmz9pMjm9NKpSNKHfKdx9lZoE78P82J23
	hD9trkN/BxosDDq/k4LTcfIplS2bwnFOASjBMoVWhd/Tf4StwwxknEAlaaRKvOZxm/T7luYlPF8
	o7DkCFJcDJvHGzTGhzz5McEJw2U7MUUgcwqpfu1D7+sWwPqK9JTNO6iPNGuanpWA9m7Ho
X-Gm-Gg: Acq92OFu81222KmtaXdvlzDcV1UR9aT/0iF8o1LGQwEJJH5JNqhZywfUOZEgqBtYpwN
	+rzij7j3HbJVwqRFEJUxdpYQ1AJti/NtA9BV/X+VlAQOJfZ/P//rNw76VZXaTy+Cz0ZqWYtj/Dd
	UuWJLQXXaUTLh9dgeyCsufTxbMWHxOK32zIdpn2no87+vRAUcyuUpJR0Db6ClvERK6tijaaY2Nr
	va6SRsrAARNqDkM5d9kvWo2RNnPQkl3NAzR7L/bcle9xio2ZibN/8DbCREndPvWDeaZvKeavbHI
	NWFoS8bEvRaQfjOmVzM0tRXlyI26njvkBI/8D66SSCOFTtv+5oIUtHxuzL+87k9LQiVD911tA7P
	Ms2OyEi5AavBbrKxXnTjdG3t4wYgCWKP/oX8JWXhwZMxPIUsgieKl6K8=
X-Received: by 2002:a17:903:2f05:b0:2be:1eb1:eaf7 with SMTP id d9443c01a7336-2beb05b5f70mr210314105ad.24.1779790751847;
        Tue, 26 May 2026 03:19:11 -0700 (PDT)
X-Received: by 2002:a17:903:2f05:b0:2be:1eb1:eaf7 with SMTP id d9443c01a7336-2beb05b5f70mr210313735ad.24.1779790751362;
        Tue, 26 May 2026 03:19:11 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm159941105ad.36.2026.05.26.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:19:11 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:48:37 +0530
Subject: [PATCH 2/2] thermal: qcom: tsens: Disable wakeup interrupt setup
 on automotive targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-tsens_interrupt_wake_control-v1-2-6adcd75555b9@oss.qualcomm.com>
References: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
In-Reply-To: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779790740; l=3513;
 i=priyansh.jain@oss.qualcomm.com; s=20260515; h=from:subject:message-id;
 bh=KMog7D1zSTb8wnRR6eVYIq9bcVDVinAsuMOUfZaTXa4=;
 b=IErSAVzT/vxwTzZ2wtnW20AlPPBuxWakHuH0Ssd+W/qSR0d4lX6e/Y/tnc8l6ns3FzjFm25Xs
 pNgnhkboH7eBa+NIc3yEyrlowEIZ1FVt2o+2VNcEUk84vcUCplC7aVH
X-Developer-Key: i=priyansh.jain@oss.qualcomm.com; a=ed25519;
 pk=xe57jjgIoTuNHN/Dp00kZl1mAJjmROaH7JV9sRxEoEQ=
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a1573a0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PJyjg1ohnCiW5JLUlNMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: s5CHsls2K2S4s9HacGCOlE8QXuBgiPTI
X-Proofpoint-ORIG-GUID: s5CHsls2K2S4s9HacGCOlE8QXuBgiPTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4OCBTYWx0ZWRfX/3t98ysZdqAp
 Wfvza0C0y1dx6ABEkTbT24VywhtrkZXP1ZZhdF5qUiccUywUdbjM/mqWEj2zFzQcjw9AMX4++Bc
 pOzW49tZD7/PoUTZY1tn2Fkmy2kka0nLMWmKx19qprmADGywXim9CTMQz84YnOH6olOwLIk8Nji
 LQSMIONZuPcqTXxurlbJxGnihcHJA7Vc4boHrPXi0Wyrs3dEUogDBx1pZVkOZPGeyJZ7bZM/L1s
 gkgfyWKSNVmTj66oNGSL/DtHqJal4EQXbNozPejEzvgMkiu01zz2tFFyftGru5mPy+TzY4G+Huy
 fpHqL9Tq5oWk0zk0i+LkxZAPEd8M/6Zjs2t+W4YbNdKw/4iFxJ5yx9utv9558Ok8L16J4wDa/LS
 nkKybJYSk7DyCMaM85HhKAN6/fzDJ9xTDSa4L15T0TfkNeDE0W2w6J4CcND/arrIaeOLxEgG/G8
 7mhPNL7Q8Yf7P5Zem2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-109769-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8ADCA5D4101
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
index d5d880a2aa08..71ab62e927db 100644
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
@@ -1387,7 +1393,7 @@ static int tsens_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	device_init_wakeup(dev, true);
+	device_init_wakeup(dev, !data->no_irq_wake);
 
 	if (!priv->ops || !priv->ops->init || !priv->ops->get_temp)
 		return -EINVAL;
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 83a8f3580ed0..f4bb5ee9a2a8 100644
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


