Return-Path: <linux-arm-msm+bounces-92748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKWhJ3fTjmnJFAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:32:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D243133955
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74DA303F469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CE02F39AB;
	Fri, 13 Feb 2026 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWXXekWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtO6Pk4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D526FD93
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967918; cv=none; b=Lhgq0piY7MW+4/NpAqI6DKo3As4C7lw8GAToXnBkOAhgtQqA41vnqcnXanoa6YOQs2dessznUpNWODNr8O9B5oGC32BN38QUdZBqTyyhpZfMsP2Uvrd9X/DVG0vDXZ3oWllQY3y7GFTpRt5OF2CMWuXCQ/kkL177K/uamdSU0XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967918; c=relaxed/simple;
	bh=NaPXmY+LnAd/hjr/pBZl9SyPVTtHkdOI2cAXDQbrB5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKGCymKQpD4vLxZ+LhnEdAR0DVPFUCino6tOEBCmiXOc2bVvgMVuv3VUpsD8keq+oUaNHL7hA7SHNs5qB/+gxQSckdR9zGHWCQ38DbacyqHiLIBuIznFERXK1k9I9qSKs9BmrO7c2WmltQL57haDghLIkjOQlKiAOrjTSEDcTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWXXekWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtO6Pk4P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D4Rq8c455924
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uzg2+4Pt++kTwMPXPgXFyvJ13EJCTj2BTGpaDamIP6s=; b=kWXXekWHeXM8z1Vq
	60ckABEsMoo7Rww7FFs5fQPXcEytof+GYSbUH02Ldoz60kkxGTNV25aFgaR3PPKZ
	onpeVbTLyXRmWpzHS0F71JloDcm9F/40AzAoFwOs7RhzHtct021FuR0cVM3cW2Xn
	ZcI7vQjWnsKFebaUHDK58PuKLIt3oGYvd31GQNlGoBL5VplTnUQl3zaTfin+fgtx
	mWWyPMMws0nNzyEsx45tzqqHLqJJyrfjSI0s1VcfmKmBsR8D+8PTcACe8BCWI+Fg
	6Ps4KFLiPkPspAA0X4gFB7Oe4+puXgh5Iix7uUwSKc1Zf5RDc7EsVD+cb7dn3LKj
	lJjDcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mev2a8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:31:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso332043085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 23:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770967915; x=1771572715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uzg2+4Pt++kTwMPXPgXFyvJ13EJCTj2BTGpaDamIP6s=;
        b=NtO6Pk4PK+owZrPLVDZ0yuDPcT9bE0cpC4kw12xx8NgSxi/zhsJPuwPBwhF7F7yEbb
         MNwOgoLeAuvcAKaq+e5tfGYdLKNfTVEYamAum1XOY8WRxa/aO/y0Rpc7UG/B/73bI05Q
         l8JgfOo4wmcxpP4iaszzY4V7tZ5a4S8kVPpdLQJTq6RFJTzOKCJe7vu1gQ8wmu1a+J52
         NLT1BcSqb/H2yQJjCaeCmhnkly9mUBQ6z3sdXiMhgXSzGpppWvRMQ0vAR0IB3UyF28NH
         EzoYnf1IXe1iKHmL/ygS2b45fOGfSGB/ojUxr4/BzQ0sdYrt+HTdB9aOWifkmxKP+mi2
         4qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967915; x=1771572715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uzg2+4Pt++kTwMPXPgXFyvJ13EJCTj2BTGpaDamIP6s=;
        b=E4MVT2VjTUX4GIk0PbIDQgJwtCecxdPpLtj3x//w0EDRVzbWP5GPTIvwfLV9vSHyAW
         tKSpxQbJNN1mgRmHOKTQI9vky3SdhOVPRnDYsyFFPdhf66lXuWIvvXa8qiRA1OV3Y9HD
         /0oZ8nEJwULBQktDNaLlalAhkwgCHATo0h1mfAjNe47FeVS50QKH3HpbASjXWOaUu83u
         2nAY+bgCDPmT7UQ/1c5Lb7pnQaOtMnoUklSvjukoOV4v/xCcfdrlkTTtZ2rqJStDWNUi
         qZuPGIbKPEDaki/z2IS+oQ+nxBRFbjOTc+aqGMg9ianrM2vNsoEN5piqrHfXfLvdQ8sD
         tWuw==
X-Gm-Message-State: AOJu0YwdMa/xBFijAjz/lkjKTJzjvrXMzx2+DcwRQarGcq5ZkyBGddby
	kygw7ho92UjzI4CeBIiDCiEZrFR+p7bTHlr3d98H6wmxdXSxc/FqmbqZz5Oz0AQgdOMAlrsBK7y
	aXY4C/C2pJkKY10Nr24kwuUk2XrFEbyXZL42LvghbGv817yt+ibR7fznxDytWMhRsM6Rq
X-Gm-Gg: AZuq6aLgI/KAHKl9fO857ZvIhkyDJddhaXoTAquD7Cx20RcrhZPQwizhq77Nc8CpfM9
	27a9LM/tkbBLpMKEE3gvzryYhmBddypX93xL1nusAcNqxovUA9Vr2f5zwPvcuYah16LAtUuZo/X
	lrvbfkaTurgXxhZpwIGF6EmkBR8n/orNWg5DGEAbmRNFVrMMECzsxCS8UkAA/PCb3HUJsFvAEA4
	C48tP7bHyINHXtupToUxPH+4Hmn/QKZvi1sRZi/wmNxktftrLCPq5dl70MXEXSQ40D6txmmFprB
	AXF1NjXr1MhSGPfnwvAklxnN8JHWEAT0YpOHJaJEn74vifA6ZuxNHyjYJt/z6o7/0J355CfWECU
	E9sUquE3bgY6TyrH4AivrAp5T3PpNV59jdQwcabasxXaZPz6/Ug2Do7amUJ+3xrEK41XDSsoXtY
	Lv80o2/LA=
X-Received: by 2002:a05:620a:3f97:b0:8ca:2a05:6d00 with SMTP id af79cd13be357-8cb42288f2cmr109597685a.32.1770967915167;
        Thu, 12 Feb 2026 23:31:55 -0800 (PST)
X-Received: by 2002:a05:620a:3f97:b0:8ca:2a05:6d00 with SMTP id af79cd13be357-8cb42288f2cmr109595885a.32.1770967914657;
        Thu, 12 Feb 2026 23:31:54 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bda6fsm541156485a.9.2026.02.12.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:31:54 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 15:31:43 +0800
Subject: [PATCH v2 2/2] phy: qcom: edp: Add per-version LDO configuration
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-edp_phy-v2-2-43c40976435e@oss.qualcomm.com>
References: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
In-Reply-To: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770967906; l=6315;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=NaPXmY+LnAd/hjr/pBZl9SyPVTtHkdOI2cAXDQbrB5M=;
 b=HlHI0Q6IiWFTupejL5Z0gDQNHokzBg8C63zQ8vzjDA6fNVTUFgp6psSLIL74T9VsehLDcEi0p
 JIrOHgnOGUgCopvlsF5mglL44yk1UkLrte7bzz95toZwsbUgBZV+3wv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Zq7g6t7G c=1 sm=1 tr=0 ts=698ed36b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wstf64DO4dhji1mrokQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: h9hLRkmGkA1FGV_h0ricMLLGiKIc9sA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA1NyBTYWx0ZWRfXwibRjir8VmB0
 xDSxiRgyqt2PHn4bdgmIi41+IoVK+/Uq01EY487a1hUBWRgDRet37b7twNe4Bc3RuU3SpeAB7oK
 MYBOKZQiAFktDhD0jWpMW2QRNwz4+KtcqqrrgAspFIjJY0xpn7jp0SiCpal5n2NWdxVH+5v5GF0
 tkPOxGbPQ9wS4l95cUe5/cKDRoHYhDOhzGtZ/NKU4Y8MiG3FeZg1lPtLB52UV0XUHNQlRy4RCbI
 tkxwuJvQRxBo1GXN4K/C92rbSaX71QZa+coC9u3XOtyleXu1mFVKaRYVuMElamte8Y9UfYOx64X
 m5DCu1w7pBsLIFO8TZAfPtielJFstpTYNFkB4Q6bDvOQZJODnanxzLvpdVyKlHiavZYVXknbNeQ
 ul6PfnPyfEe9Tzd9h1VgnzYwAKUOVJW3qXKQkIZyXU4ZOzxg6d9JLVCR37bV4pOJBq/ZJSVQmen
 vPTIfLxWO4l+lMbBI1A==
X-Proofpoint-GUID: h9hLRkmGkA1FGV_h0ricMLLGiKIc9sA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92748-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D243133955
X-Rspamd-Action: no action

For eDP low Vdiff, the LDO setting depends on the PHY version, instead of
being a simple 0x0 or 0x01. Introduce the com_ldo_config callback to
correct LDO setting accroding to the HPG.

Since SC7280 uses different LDO settings than SA8775P/SC8280XP, introduce
qcom_edp_phy_ops_v3 to keep the LDO setting correct.

Cc: stable@vger.kernel.org
Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 86 ++++++++++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index ff14de41cb1c..6464df8d2a62 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -81,6 +81,7 @@ struct phy_ver_ops {
 	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
+	int (*com_ldo_config)(const struct qcom_edp *edp);
 };
 
 struct qcom_edp_phy_cfg {
@@ -304,7 +305,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	const struct qcom_edp_swing_pre_emph_cfg *cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
-	u8 ldo_config;
+	int ret;
 	u8 swing;
 	u8 emph;
 	int i;
@@ -330,13 +331,13 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
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
 
@@ -560,6 +561,52 @@ static int qcom_edp_com_configure_pll_v4(const struct qcom_edp *edp)
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
+		ldo_config = 0xc1;
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
@@ -567,6 +614,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
+	.com_ldo_config		= qcom_edp_ldo_config_v4,
 };
 
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
@@ -583,7 +631,7 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
-	.ver_ops = &qcom_edp_phy_ops_v4,
+	.ver_ops = &qcom_edp_phy_ops_v3,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
@@ -768,12 +816,31 @@ static int qcom_edp_com_configure_pll_v6(const struct qcom_edp *edp)
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
@@ -954,6 +1021,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v8,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
+	.com_ldo_config		= qcom_edp_ldo_config_v6,
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
@@ -969,7 +1037,6 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	const struct qcom_edp *edp = phy_get_drvdata(phy);
 	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
 	unsigned long pixel_freq;
-	u8 ldo_config = 0x0;
 	int ret;
 	u32 val;
 	u8 cfg1;
@@ -978,11 +1045,10 @@ static int qcom_edp_phy_power_on(struct phy *phy)
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


