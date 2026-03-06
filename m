Return-Path: <linux-arm-msm+bounces-95831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ArMBP7eqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:04:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949822244B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C184302C6E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB64F3AEF2D;
	Fri,  6 Mar 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/mhVq0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmkgpCwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9B3ACF11
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805769; cv=none; b=mKaiHgQwhF0mu6Ow4UKImo1SXfB+iUCbndPxzrMpop8nXgTR9eljZyOPvO0OIwrGR8EwZb1BMZGkBiMdbstj/8wjVvnyITmpaF6Gnuk9k2O4t5AhjANqqGNs8YkH632aqxQFx4yLsuEZ8OPkMVLDa/pwkzAE/k5012s3B6kEJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805769; c=relaxed/simple;
	bh=ctsKjQ8pwXwqej/Qj+cFPJCHHMHgaW3LzO3MUBGDncA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AjSuitbWzfONCCaSBiIk/Xc8cYnToi8gDi7pkl215rrshNej9Pufk9HQRRjtUbhVo/gvlQuPbJr7lTeD3vA1otw2fHEbqOCR4X69Bw949fLyIYIYeBq+tx5kpB1hDDOAOkYaHOZLFyIqtJCRTqezaPQVWeU6UJprfh7a8sdbBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/mhVq0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmkgpCwd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbHpa4151025
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sy/C6mL1bqk
	mxcisFCIjaSDenP5o5m7Jb+jd871MGQc=; b=h/mhVq0PwoXa0w8df6nLYD4qUQ2
	YN9biAKyuXvMi1ye54dVXzDbclOZZP3sxdIaqk9i8NTs2IAXwwkEPbJt3mhNAGvX
	pGSpHcQhSjpkhjti++QU/YUwSKicdqnjIYAg2Ibx/0jQTYFnJvjW7DQ1nq9Bp0xp
	oYsV1yjmVuN2NQ4+GE8kizUCEHmWkustPX3QdBhVk5NV8oOODQCOOpQZPT5sMYzh
	EoTFke7AQjSW93EwrG7lhlJhh4tP76zcvrGJYIKpjvVw31T5FVvzd2bJ5afcpwuB
	1Zb+Yj30js/sLuNnv9ML6MrFswPDajPo8jo4BYab0ku6t4+HngEabK3eAvQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25ucrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:02:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94de9d162feso78280419241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805765; x=1773410565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy/C6mL1bqkmxcisFCIjaSDenP5o5m7Jb+jd871MGQc=;
        b=dmkgpCwdgSsyT/E6mh3qMfCHYb4qziToZH9jR9m34ObwgIduEHjBeUr27Ff8yulhrw
         jmuNuBdvUFxTkHDSlQjNLBDzhmb+TctZ2vcZ3/8wMoPmsmmnXzUnRFyzZxePOWUjDz+M
         +7wPl5d9ubN1DVnx05SGuHMML3UpkOG9OQ9VEw/wi0PWWI9eW3xN7kXd6z6SxGtUMoel
         5Ky5BWTwHRPfaP77EA37GtbhSqPH6NFC39hBJqqqd+i3NxQ4BXInhrRcs6wuDoNVo8P/
         567KiNN3N40tfx4NVa7CsLR+NIQ2e7bv9px8h5Ptmxcb1wr2BjGssoSDo26WBl1xtwHG
         cGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805765; x=1773410565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy/C6mL1bqkmxcisFCIjaSDenP5o5m7Jb+jd871MGQc=;
        b=m3KlCBJVWEIi+fHGmHCcE/GAyUtd2dLiXqCopvJU/XVAi0nCfpeifnR4jNCffubXU6
         3nXY8Ek+RAKWz+vUJSVfZszFX6N3yAdeq72f73UIL6JCVDqfW2QTuigcnxtb5AZJ9NRh
         CEL+/5URmkPGBbTa/J0F3IHBTm3gkWiC0MBcq0YRR/osmxm7jWyKEDzhmEsqrOHzQU5f
         LgdWgoU60J5Q/7YnLd6ijuX5GkKkbBGJ23yE/PJ4rYtrkDQC6Wyi45LP8IzwIjKJ0NC7
         202dT06kQhNliaA82b9nG9EDKsr7S5bJ6HQd+ItAdSnKW2X9J8G/Z1GoOBSiRYSQ7Jwo
         byuw==
X-Forwarded-Encrypted: i=1; AJvYcCUgU3cEiae7cFxwAJpVbZ+7VFAZHRum+oEB/Gz4ncqk2DYXcTuOVCHqI3wMyLlzO9VPjw+BpIxLqOOS4siS@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWw9B9/sKbU9HXPgF0mQ/VX/EiaM4WIMx6yOvB/vED8lYbMg8
	dRjsuuyMYn1w4notn7Y4ArxqRAcAHvVwWs+5Pri2q681TJvAFea4qkYZE7rgGs15oykBmLT8nmM
	VW7y2S3RMIaRPyUhMQb765ZyVy+txVWHFOdGjcYxqF94ZLh8TldH0UevRoymjrgVfvmGu
X-Gm-Gg: ATEYQzyCxplQx31hWHrIweKx2MMy0rRHflq8e2bUubpNSZAr6V3Md1+dIay/LS6v2+T
	JRHkKqOZGPxI9S2o2b5uwzyRJkH1yKXycNEAfRT9DdEmoLtgn/TKoefs+zpE2ZzvxQMg/oZzw+k
	FfhznqIBsxQmcjKKOcMp4DTTyBmasxyBW+93687VLLVPPPH9PSwNdIYrdDYasO83wZ4tVtJi5nn
	KOkqvwJsh6eqfFPmioO9ExVaxueUk+lWb8r1pIX9mNLgkJrIefzdFzut+Dz78IufxFnT9CdI1a1
	fbUK/Muk+qqtHMRxdPdI+qksKYIZTzrdqdVEYcSFnLRSXl7zFkZFC+kVlAzu03r4Tj9ABnx4rZC
	+doOGff1PQ140dKdKvXCNRaD9FmwQtgcpJTspoXM3F9R+Wo7tVuK/F0UrP4GHiLjUXwGSCi5F0+
	PgTU7goPlwR8MtxuET7hBOtpV14GpQEeFKHZS3lk0qOA==
X-Received: by 2002:a05:6102:3e93:b0:5f5:320c:4d36 with SMTP id ada2fe7eead31-5ffe639be56mr739497137.40.1772805763674;
        Fri, 06 Mar 2026 06:02:43 -0800 (PST)
X-Received: by 2002:a05:6102:3e93:b0:5f5:320c:4d36 with SMTP id ada2fe7eead31-5ffe639be56mr738605137.40.1772805755002;
        Fri, 06 Mar 2026 06:02:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 4/5] media: qcom: camss: vfe-340: Proper client handling
Date: Fri,  6 Mar 2026 15:02:19 +0100
Message-Id: <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: b3WVInnZijZ75Br1ewhb2YcIF0JDXj21
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aade86 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=h8qAYbA_W9CmfXd5NcUA:9 a=SNiEU36zzXyr6W74:21 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX/dnlQxAw9f4I
 K+wwlXBt8fl831NpaAmUbkFlNtdOpWuuSFP81AG/m4Py4pGPp4nrNFdX2VrJw8E5cHzX5Slze0R
 SjYDIuqzjudNEgpnGFLzfMLZxQNhQz7bL4LM8ZoIANppvg3QE0ewlfpj922jCee+Amgxj+AMen/
 l9nvWZYdiFknuO3HKnruJ/xKEIni61/KmrnApedDMUgQ2dmvxYPD25eVvha7iTC2oi+Yz6bXiZ5
 +lCg6dvOgoPKFtNEuLQGXqUG8Klh4czqXNANlwTHdosYjMuzppzXTo/+7gT7++S0mBcmGsvPfMJ
 x1/B3xOQZAxRBgYdGm9QFpJaxIKq4y0hqDbyWbwTCbOl6uy00pZs1HYLg21rEmRgvU0IhvC+swD
 mM8dJVoBB/+We3HJ8vIb+xpj4ll51A+NxvtljWpHS1Kvz8VtKmjXD3j7yE0DXZJj9W9vr5AGrCb
 6gMINjzJtZdhDmx1K3A==
X-Proofpoint-GUID: b3WVInnZijZ75Br1ewhb2YcIF0JDXj21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 0949822244B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95831-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

We need to properly map camss WM index to our internal WM client
instance. Today we only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++--------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..2f8205fa40a4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -69,24 +69,19 @@
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
-/*
- * TODO: differentiate the port id based on requested type of RDI, BHIST etc
- *
- * TFE write master IDs (clients)
- *
- * BAYER		0
- * IDEAL_RAW		1
- * STATS_TINTLESS_BG	2
- * STATS_BHIST		3
- * STATS_AWB_BG		4
- * STATS_AEC_BG		5
- * STATS_BAF		6
- * RDI0			7
- * RDI1			8
- * RDI2			9
- */
-#define RDI_WM(n)		(7 + (n))
-#define TFE_WM_NUM		10
+enum tfe_client {
+	TFE_CLI_BAYER,
+	TFE_CLI_IDEAL_RAW,
+	TFE_CLI_STATS_TINTLESS_BG,
+	TFE_CLI_STATS_BHIST,
+	TFE_CLI_STATS_AWB_BG,
+	TFE_CLI_STATS_AEC_BG,
+	TFE_CLI_STATS_BAF,
+	TFE_CLI_RDI0,
+	TFE_CLI_RDI1,
+	TFE_CLI_RDI2,
+	TFE_CLI_NUM
+};
 
 enum tfe_iface {
 	TFE_IFACE_PIX,
@@ -108,6 +103,13 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
+static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
+	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
+	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
+	[VFE_LINE_PIX] = TFE_CLI_BAYER,
+};
+
 static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
 	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
@@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
 	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
 };
 
+static inline enum tfe_client  __wm_to_client(u8 wm)
+{
+	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
+		pr_warn("VFE: Invalid WM%u\n", wm);
+		return TFE_CLI_RDI0;
+	}
+
+	return tfe_wm_client_map[wm];
+}
+
 static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
 {
 	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
@@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
 	if (status) {
 		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
-		for (i = 0; i < TFE_WM_NUM; i++) {
+		for (i = 0; i < TFE_CLI_NUM; i++) {
 			if (status & BIT(i))
 				dev_err_ratelimited(vfe->camss->dev,
-						    "VFE%u: bus overflow for wm %u\n",
+						    "VFE%u: bus overflow for client %u\n",
 						    vfe->id, i);
 		}
 	}
@@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
 	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
 
 	/* No dropped frames, one irq per frame */
-	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
-	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
 
 	vfe_enable_irq(vfe);
 
 	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	       vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
-		vfe->id, rdi, pix->width, pix->height, stride);
+	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
+		vfe->id, client, pix->width, pix->height, client);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


