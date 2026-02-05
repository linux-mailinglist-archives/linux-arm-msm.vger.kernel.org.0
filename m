Return-Path: <linux-arm-msm+bounces-91888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCpFOA9jhGkM2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:29:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C5F0C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809E93061E39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860DB3921E7;
	Thu,  5 Feb 2026 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cl4qwNsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvufpaYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DB39280F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283272; cv=none; b=AD7MqvJOFsTWM88KHxF66jqAyeYqyGm+OJ6IbBkEYA/FEf9cG+zqE7pEeHpI0GJ7CXvrmb8x/L0j6YfjDgRY7HVWgM+5yzRcdSO8atuqmgHoRlx+4RTbeSqP0SgaXIBCjAE8lEJ612GOeyrhVnDt3e4nFC6Q2gNOf6GhUCN1YQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283272; c=relaxed/simple;
	bh=dhNtEciXmxe7JOgKKpPwPoFS/KpvqGImKVUMYUBSVDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xyq7KcLNWZYjQ2B75fPb8N8wMUpzn+Ne+bL+DhrTSV0Bh2YOUmEgxpbmkoq9IjLhEPJ/yNJfxxnpNaDJmCqfYAQoVjHKXyXamcaWFBs2GcqsJy4GE2eWgMLxgAynryw/CKwFTlqxM2dpx3MAzbd3PakPTPFbcim+FM8SlfNr1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cl4qwNsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvufpaYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155q65Q4165727
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNaLzAhccsQGnghKHwgdkz4yLlY7liCyjd5PqcCdZhc=; b=Cl4qwNsCIds8SPzg
	+SSjWdQwUuTPtOiSp48aCteM2tT8uaAqElOhIu0BH22W0Qx34+qjGseQvwIAbzFC
	okWUFMzelnF3k3YqeolYTo5pWwYwMfjMYR12CQAVI8gVKN0Jven6JE6hS0u2Psc9
	fd3nOh4ZF4D/fW0VsqB30QuxeWCafQt48wESBKeNV44pQSpTP723BhkIuyrHlPHV
	Ve/aWwNHM3Rk26TMkN5+SFyKG0K9apkDgYF+VSDq8o070WaDO2vrahp0deeT2yh9
	iTyBLpZKkTvNTlQ/WgfnUyC3RkmxtDQUnW6yFcpL59+tMXNcFVtV+R+g2wLRRkSj
	rk0tkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8mn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:21:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so63362085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770283270; x=1770888070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNaLzAhccsQGnghKHwgdkz4yLlY7liCyjd5PqcCdZhc=;
        b=AvufpaYXTOeyzbBTVhktwv7ksYu0C+4tIHkiN0gl5b/GVLczR8RDmvqI7rV7rx+TeO
         9idoj2QkPSZ7u6sPMES0s8e+4U/eYgtvQ1OnkHy06kY/lvTDyP5ifTA4z290GRmo+qqF
         6Wb6q8L9jGt17qcfVErnelsGYKtpHXgaM5+/Ca5LeuMBFiukcmiLOZ1/DS5aF84lr/w3
         6sVCZ3AwxSQpBrhjfjur5tH6uAecKuouWmmDD1AND2zR65QXL5pjl4fx8yabwDr6Dk3D
         JgAwmygpS3Cxf7ea6wnFfrQvi3OP1IVx5B1K8N95u5Y8jEXbSW7xXOCfa2r+4QHPCGzO
         0FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283270; x=1770888070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jNaLzAhccsQGnghKHwgdkz4yLlY7liCyjd5PqcCdZhc=;
        b=DkvLYbJkkIU3h2kIGShJe30XGHhoovB832BxYwuS+9c/7HcOwIXv4n5h0XTerwodyd
         p28/oicxUz7KUGUuHt1RnvFzl+n2VYqsMjG4UM6heQJpMaJMksBJaGwdbrRdggZAbPBy
         C+bElM39JDRObn3PHNaqE0/7zj//NjvPVKHuFg+2FmEF7zoQKBPLjIX38G5hhbgmrxI9
         X9+Oesb1U4EwejBUq4nE6CYGfoOoqHgTBEBTFzttrB05E3MnVdZmmwUEy1A3w/LGpoNT
         IjbzvCYO2YoeggrFBEcDeFbxa+KDm/foOJ5L/Z5Q6D8y1Hi91b+zNtV+GJ6Z00rKfKNP
         T17g==
X-Gm-Message-State: AOJu0YyZQ1+vMzBlxwBUr5NQEhGncNmOUGls3X2FbwoXZ2ukGXv91XdF
	nW7YjV02CKVEUO7lZu+mVw1St6eAepl41No/7K0UQhbWs0B02XgeBZfhyxzzVPThnYB3tFknPwU
	uFAkdxU6set8ZJ/RjOQo4U0xwsq2js8yADWRdPTtdsH/ntGKRmR3hB6C6qm+qdhS9nF16
X-Gm-Gg: AZuq6aLFmJ4btOXKL4J6s9EGjiL4lLYWhpCEDdAYVHGE8T24YA4DLqDfZjzyrjlEuE7
	nMKRuSieE8U4KpzTh5OLc5xYYK4lx9+ZgDmAYGLEbS1DbaOkQlxR9ec4jryoA05X0G3iVPhJpdQ
	wE8QrhCwntn+Q7oUkQaw5emZ0ttVxkUoZz26AAx9MKsnvCpGoZg19MkzJOg9HE3zvFWlcfTmv2z
	ZvkV/e4Ytv4KperKHT7lNNOV9WLFj1MCk+klVK/afWrTm/7LFZWocE+z7AYCZTArlSnfpR3CUj3
	14nIlpDR83xCS4e/REzUMv3dkzdANnxHwtXG8VN4U0vBdk/iFYdRCtlqszsOTCQ2j6DFgv8NJWk
	NtJXQsJCPyVS0N3lAtdQyvhnBQTjXcPdMlPbV3Kxnuc7BiMb6w2uwVijnhIGL9OadqgeCvs0=
X-Received: by 2002:a05:620a:4629:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8ca2f84a173mr843233385a.29.1770283270481;
        Thu, 05 Feb 2026 01:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:4629:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8ca2f84a173mr843230785a.29.1770283269996;
        Thu, 05 Feb 2026 01:21:09 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd2c3easm353674885a.32.2026.02.05.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:21:09 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 17:20:54 +0800
Subject: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
In-Reply-To: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283262; l=5992;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=dhNtEciXmxe7JOgKKpPwPoFS/KpvqGImKVUMYUBSVDI=;
 b=t1Qg1qmlB/s5FnDaWUtxt2AvlSg9gQrY/zes/o6FLTiWxnP36YjgHcJP8hsZj7dpX2xzVuEth
 32vuizWSdgMBLFRFsK92V5YcVT8hSwu5GfW3Zp+nm6hJOEP9jgjT/08
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NyBTYWx0ZWRfX7NppCnhog8Vd
 8MUvmMnAqa39iF59sC5zil/IH3qtbT7kBmSMemL6CA/lP6ta7wFOZYeEyHgoZJVIqz7HH/7Y8DI
 fSEtlDUNfx7JDdUgpcYvXBMY/bWBKI0z9FIlPle4lFsK0bHkhAyEBMpC2jpB6tIFzwIYfz5mJVG
 caZefqboj1GJK9KsHYWfnFWhMQpW1eCmDPgZQNB8ZBw9NbHjkoMV6utaMRU+BQuNZ60JgE4rhl+
 +er/aOGckBQosnkfHmIHTVkeieTKpfHNqfEl8HPzhvDFsTKhahlYqPMo+kz2ZD001yQzSFVMx1s
 M4Jk2Fi3uITWXQhUxPOaLPkovBYoV2ywP2kSHMqlfJ/A1/NcFB7gsAdrvY2GlsmA0ervxRxR4cY
 UHKxXazjzdecOJMUZPWpu/eOkxHIUwXPT7JJlS7CocaYHl9WGeLwEqqVu/5jGcm1ZQE51BX3Er1
 4Eq51npROc+4McQVkmw==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=69846107 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7aH6mENmw-U4l7sLY48A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OR-uos5oF6VVHXwm_9MijhQci8SZTMrp
X-Proofpoint-GUID: OR-uos5oF6VVHXwm_9MijhQci8SZTMrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91888-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D3C5F0C3F
X-Rspamd-Action: no action

Introduce the com_ldo_config callback to support per‑PHY LDO
configuration.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 86 ++++++++++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 10cbb7d9a8a0..388226dbad7f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -81,6 +81,7 @@ struct phy_ver_ops {
 	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
+	int (*com_ldo_config)(const struct qcom_edp *edp);
 };
 
 struct qcom_edp_phy_cfg {
@@ -273,7 +274,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
-	u8 ldo_config;
+	int ret;
 	u8 swing;
 	u8 emph;
 	int i;
@@ -300,13 +301,13 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	if (swing == 0xff || emph == 0xff)
 		return -EINVAL;
 
-	ldo_config = edp->is_edp ? 0x0 : 0x1;
+	ret = edp->cfg->ver_ops->com_ldo_config(edp);
+	if (ret)
+		return ret;
 
-	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
 	writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx0 + TXn_TX_EMP_POST1_LVL);
 
-	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
 	writel(swing, edp->tx1 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
 
@@ -530,6 +531,52 @@ static int qcom_edp_com_configure_pll_v4(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_ldo_config_v3(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (!edp->is_edp)
+		ldo_config = 0x0;
+	else if (dp_opts->link_rate <= 2700)
+		ldo_config = 0x81;
+	else
+		ldo_config = 0x41;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
+static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (!edp->is_edp)
+		ldo_config = 0x0;
+	else if (dp_opts->link_rate <= 2700)
+		ldo_config = 0xC1;
+	else
+		ldo_config = 0x81;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
+static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
+	.com_power_on		= qcom_edp_phy_power_on_v4,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v4,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
+	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
+	.com_ldo_config		= qcom_edp_ldo_config_v3,
+};
+
 static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_power_on		= qcom_edp_phy_power_on_v4,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
@@ -537,6 +584,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
+	.com_ldo_config		= qcom_edp_ldo_config_v4,
 };
 
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
@@ -550,7 +598,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.ver_ops = &qcom_edp_phy_ops_v4,
+	.ver_ops = &qcom_edp_phy_ops_v3,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
@@ -733,12 +781,31 @@ static int qcom_edp_com_configure_pll_v6(const struct qcom_edp *edp)
 	return 0;
 }
 
+static int qcom_edp_ldo_config_v6(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+
+	if (!edp->is_edp)
+		ldo_config = 0x0;
+	else if (dp_opts->link_rate <= 2700)
+		ldo_config = 0x51;
+	else
+		ldo_config = 0x91;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
+
+	return 0;
+}
+
 static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_power_on		= qcom_edp_phy_power_on_v6,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
 	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
+	.com_ldo_config		= qcom_edp_ldo_config_v6,
 };
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
@@ -918,6 +985,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v8,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
+	.com_ldo_config		= qcom_edp_ldo_config_v6,
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
@@ -932,7 +1000,6 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	const struct qcom_edp *edp = phy_get_drvdata(phy);
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	unsigned long pixel_freq;
-	u8 ldo_config = 0x0;
 	int ret;
 	u32 val;
 	u8 cfg1;
@@ -941,11 +1008,10 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
-		ldo_config = 0x1;
+	ret = edp->cfg->ver_ops->com_ldo_config(edp);
+	if (ret)
+		return ret;
 
-	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
-	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
 	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
 	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
 

-- 
2.43.0


