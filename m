Return-Path: <linux-arm-msm+bounces-97493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFFKApIOtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:18:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1EE283966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A61DC3051859
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866D240DFB5;
	Fri, 13 Mar 2026 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQH+UKOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TD3y2FYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E630F94D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407882; cv=none; b=Sf48RzptPVJ8Qw8Kb4PitYwqJOhhSd5dJade71EP2RcWZn4Hj6eiPsBjyTu/aU+7yreiAwr1VRwwnGtOPQAiFUIQ8b1hwwdkrIwjb5qMXUDOiG/xBwKrKVAf0k0+ASDcfhlwwjOsClc9oi42uPxMr2oh1VPOYKPa0YPuPSH1BsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407882; c=relaxed/simple;
	bh=yAz6Zfvl2TFWakR7LeU7y69Nidj6N7zp0U2Up5xvNlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ARlLsRdns0CkA5ESP4FC0UOEp7xYWnJqA4Egphw9QDbiyssqOsmAHraC7RtGxx5wzJIYl37EGxwJjW3UqKtWB6JdOgfEdphkq11gqzzrVPGL3BLnzW6MClKizxYw1Sb/7e+cKVueLsZg30aF4E+MfDgo2oZ7SOd1QrGeer4Onco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQH+UKOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TD3y2FYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vBWP481522
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqfxHF1SIlH
	AAOLH8LxQeWGvlpwAUi+7vcI5segiUVw=; b=jQH+UKOX3SEaIgbDAVvGE1acM/J
	Q2XeCrYPvfpmPQ7nvPIW6o3FGG0pf6PmPf8Gxxmh/6AzCKmJ7bQI79SsjSAUEYd3
	2o7IoCaV/FGPE8hkjN7Tt7AbQn8VAGU6/n2a6xgL8eAqKSRAXZrqjGTNz5RqgYFF
	bJphDDXRpgb9gL0B/K9nL5D058hAo6jdAgDnsulLOhcnRN6LLjvZcWpiAll8Xvnj
	IMAtP+xtRtSiWgxk4r/Vk8DQBalLHW59ZVyloolmBbylpeN7N5PD21DKDPQn+5R2
	j9wg4BSOO4mJXlsF23k0Q2olqylREApvmmFlgLwg16ZjxCZXmj4Cb56/T5Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7ru92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:18:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899e89bf366so78906396d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407879; x=1774012679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqfxHF1SIlHAAOLH8LxQeWGvlpwAUi+7vcI5segiUVw=;
        b=TD3y2FYaZzcVlHQyb+CERiL8SZyey+nMFHToSgwhtZjcpSvjLCD04q+yC6f+Dq5fGv
         qgqycCpwZJvfU03bcVjQvwiqG8sRVJpW3JA+mVGL9+cO6TonmFxT4EFUf2rnQs3fvB9v
         aVkZakPAfIXVuFPiEulLs/g0t91X+XuaTyKqTa8Ww3ydwWJJeF4kJYD0q3vcmSCbZ7PS
         MXZdahtKgHT54z6+hcI/2aY0THrlNjCp3nsx1uNqx2ARRH9wYZcuPW4kiMmYGfI6/O50
         c+xV0jGnCj5GfdFWUp1fnqwseA1izP58vJC6N3+jNYh8k7ZjgKi0WzKkmKdmFn7u08K2
         RZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407879; x=1774012679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqfxHF1SIlHAAOLH8LxQeWGvlpwAUi+7vcI5segiUVw=;
        b=T9xdjtoVw9ZW3zn4WD9/YPezVwTKEdfvhELbvNVAcUCwEgkdzer4HFUTjCGP26zZse
         BrUPiwFTakC9pRFdegahEueOPV9jYj49IZHkiKCnwkGJI2tLFf+lAeEldh03kmS8bzpD
         oEGvpUGi8XIFWfuXhU1MTH7P+3JOKtxwf41nY07xgCkHGXcxUr578qzMVlEen6Yr/FrL
         9skFTw9dvjpz3ZYp0LNn+iihXG3RsPq8n4F2LKqM0CNE8vkvxG4u4FVYB+bQvUCyKAYU
         wCbQDxiBy58z3H248qusyNJy5K+8KRktrduTwCrzoaneYIXZBxJDXDrhUW5nWoGyYHFo
         cZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2DHblKR31uLbr3Kc8sVSMr2br3dr0H6qSWTfIGJNI3f8YARkBMYyNxGEycQhwZZ5zHpUNNtq69wDind+@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0MbWqnPdiwgdUkpP2BbVyHJjV1GWv9MyAUzTkrWelmCSgJao
	5DXp07T6WCxjDwB/CXQ4CqPoT0FkPlGIas+s9h60Ek55vWQ5Y6/B5SnniX6uz4nRQRW4yPhFQzx
	3yuQYecZpjG4N2nqS0wY78DN3vKI2+hwTzd1HpnrRzUlEQ9bVdyKhqWlDnDnRcCrvPs4M
X-Gm-Gg: ATEYQzwY4jvEdXkOv9lxvpsGea7CNqj0HcI+n+XRbaE/F6E8noVhlDdKa55Ug13jg3x
	ETvJ2Kbp6nOlm4bJ/bCt9qQdQJxrQ+D8u2ujG64D80V3bgr7qI73x2+kCrX8+QzrlI943st9pF1
	X78S1jKzMqsQPsHrB4sNtcxFkyo1ncW2oDw1Kj+v9VZQIXU137bFlfbE84M/Ky5T/JYtEqX9PVZ
	lTXtLcSfMpdtUBXySIugc57XIlhFzQNGtKeEgSwPN+F5N8qqIs90j8/9+ryzRA8SrcUOFi61KJw
	BgT7KRrdWxjscj3X5EdKLthMWHyIIGuzvBo8pU8mbTgiUT2RexBt0VYTl/Q0f5tEVjrNiIJ2unt
	xELyPp5pkQIQEaXeqgqzJsEygmsN8xKPklm3q7ijtztmjk/siHnwHzL2+rJ8dDn8X9gd0AhQHOs
	fU+UdtBz/hnXDu
X-Received: by 2002:a05:620a:7002:b0:8cd:7835:87ff with SMTP id af79cd13be357-8cdb5b7b463mr452176785a.69.1773407879426;
        Fri, 13 Mar 2026 06:17:59 -0700 (PDT)
X-Received: by 2002:a05:620a:7002:b0:8cd:7835:87ff with SMTP id af79cd13be357-8cdb5b7b463mr452172685a.69.1773407878979;
        Fri, 13 Mar 2026 06:17:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:17:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Fri, 13 Mar 2026 14:17:46 +0100
Message-Id: <20260313131750.187518-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2l0FHLLeptPp9EjNZHD9GBA5ULVMBZAs
X-Proofpoint-GUID: 2l0FHLLeptPp9EjNZHD9GBA5ULVMBZAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXzLzAqh2basbI
 2tVfXDx3DoABMg56/4m1CU7llrvH6Vv/8dAHuuUtxJsaUC2hx6FKuFyca9oX/lyxXbdy7B7F1El
 tNNyod6PHx3EKWeMRxn4Eh7WeezUlKAhSUtKSuDAXT/GfWOs+6iBZBJqHgq+MqS0VuCjDy840HE
 Pp9Gl3EfAz3rgjXdtRxd/D/UTj6ReQNOoDA4B0jVdO6ngYq5h792x+uhXuh281jRtnw3e9oqJ6U
 8CAIzc7eNzaipk0krQszXxugqs0imGaut7r4c3x5TgZ0iuLgEPasrQbJ6npNF4KSub8DQFmmSq8
 aD1la6HwI//yPpNWy+9tDy8x4ODFQh7yBAyrbps2getkLBuiGwAbaijD+u30UQ5g9Za/TyYmLPG
 c8E4RiFimKCyP38w5jdWhrGvz67/UeYp7iF61g0hByku6rL80ZaVq3ho6dX7UqZN+YOEAJB9MlT
 c91iZrGqKclEnfTtBQQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40e88 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LKvSMrVZLPp8S4whDCgA:9 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97493-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E1EE283966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The former RDI-specific register definitions (CSID_RDI_CFG0/CTRL) are
renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
interface agnostic. This refactoring provides the foundation for
extending csid-340 with missing PIX interface/path support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34..adcbe3e01d62 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,19 +41,20 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
-#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
-#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
-#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
-#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
-#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
-#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
-#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
-#define		CSID_RDI_CFG0_ENABLE			BIT(31)
-
-#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
-#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
-#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
+#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
+#define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
+#define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
+#define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
+#define		CSID_CFG0_VC_MASK			GENMASK(23, 22)
+#define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
+#define		CSID_CFG0_ENABLE			BIT(31)
+
+#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
+#define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -71,7 +72,7 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 
 static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
 {
-	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
+	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
@@ -88,7 +89,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 * the four least significant bits of the five bit VC
 	 * bitfield to generate an internal CID value.
 	 *
-	 * CSID_RDI_CFG0(vc)
+	 * CSID_CFG0(vc)
 	 * DT_ID : 28:27
 	 * VC    : 26:22
 	 * DT    : 21:16
@@ -97,18 +98,18 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	dt_id = vc & 0x03;
 
-	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
-	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
-	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
-	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
+	val = CSID_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
+	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
 
 	if (enable)
-		val |= CSID_RDI_CFG0_ENABLE;
+		val |= CSID_CFG0_ENABLE;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(vc));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
-- 
2.34.1


