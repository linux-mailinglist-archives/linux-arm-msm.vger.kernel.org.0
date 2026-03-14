Return-Path: <linux-arm-msm+bounces-97680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEz5HCPvtGm/uQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:16:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5328BC01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 06:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C252130A7254
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A388230270;
	Sat, 14 Mar 2026 05:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XicuuCx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTsviMoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEA285CAE
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465272; cv=none; b=LuGRmPPu/tOqhpN2bOjpmp0aLSf5q+Rg8ZfRWFxT5SPKbS1Y65vDtc1gZCesrVuWlx056ow3r1XmhuCbz0m+0KrtPEbyiWS7URFCBI9BmiJVepYtKoLUHGpesfRY3ySQyYtatc0Nbbo3mwj8YBM/JOuW++4594lXeBZMzJo1URc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465272; c=relaxed/simple;
	bh=rzcak6u3jisWsJq67/ZnUo95e6y7cMKLEAGGTIL9OIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoAPWQPj91++1zI5yhGjE8s1AyPOKGf0U8IY5k9ZCwKp68S8kjO5ZGKUSBsf2gZjtZ9hU60PlnmiACHO0Rog0jdeMjNiOUFltSV2ltF+HGg8v+Yrj9dQuu/IjjLhNuMLN70b34mP89VIptc34IyrIpTGDNK24udFoMgFSXOOjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XicuuCx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTsviMoe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4lXCw2006960
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xc0D7EYT+dK
	OMBn5fxcL/5DUSzq9ZKa3q5dm3mbCGVM=; b=XicuuCx6f5LlPoOGEYE4Qgf+Tvi
	a0q5Ai/Z70ASEwQ+SWGyS6VHOzBpMqFixg1kisoW/9YTKGmSZTFNZzixZHVzy+jP
	Hcpd9AHUEIYYfgqSi3/ukbUbvP4/ogPoTClopRfNqMWqbqKByAKh4E8npQMDeKe/
	8GMlSYGkwwC2zzmuVYFl3iyD4XfYx+AdMeeORklV9WCM5Ob6WVK+N09/4jrsfQmV
	6tr9Uy0lOVSxLivubNeNVxBk0GqJB5PZYbtPDeboSsWUkDo4LwH1kNqueHlP+ix8
	CMw8OIpZwvoZmMM3kfLo07rZ4id//3sHm9IpZ07ziWIF3xah+8NMKbTZRyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7r1ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:14:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2beb5d51b27so591944eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 22:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773465270; x=1774070070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc0D7EYT+dKOMBn5fxcL/5DUSzq9ZKa3q5dm3mbCGVM=;
        b=UTsviMoeYRaG5BkcaAptaieGw17MTuSbH0oSSxDPmgbBP/UI1oCqnaAqvXSPBbBD58
         /MsomFkngVkyA4nmCrfIae6sZwEuta06tFOrSVcVLW+R2w+vhWQnYLjf4RcsL+0oTjkd
         KALv6GfaMyBv8Ya68WaGryOnAhEHqTXynmQISoKHoMChqG0Y4ap4NVfTWRiD8oEI2LDF
         8n3NqMJySpIwsO6zzyD389QTKYJw5mZE9p1HQMZLUefPAoIK4rXGdpGB2tdw8K+p4oMO
         f78JKBoSO+NLL7d0numyYab0jNvX/DhLZsLLPajiPtlnuiB8f+sIqOF5dGhDoYAfYhYN
         D71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465270; x=1774070070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xc0D7EYT+dKOMBn5fxcL/5DUSzq9ZKa3q5dm3mbCGVM=;
        b=jX/qXeTLrn4Ftz22VaBHPDdaaEpD+PvPuyRtTvXCmZ0DBen5YSlBPhO+pg2OKb/BVy
         xhyHgeYwbkWm5ZVtrqypqfaBOkc/duucl6YHlm/y14uU52ZuKJsMzLLBQszQvz017gR7
         a4BpZhPyr5Nds15a3QIfn39CnEJYpFXgmXaT8BfVpwnqtBbbS4kHB2ntiQfxQ0My8lp7
         le0C8wI3CU/9R9Kvb1+LwCbfv7yQCh0krlAYrONd67pqyc2SvJHnnmuhPlem4Lt+eXkl
         amhiUX/18YDXQKUI9OR/L5+tR9JZluoOjZFlPKvtd/jK3tNc61cAp3zqjFzvS2I1r42t
         LdDA==
X-Forwarded-Encrypted: i=1; AJvYcCUMVpoXE8WG3ff2uNAa42lbwjGFoYkVA6zsJh3dzTOmZmrK+YKbdbFCOsy0CATLbdqlxp1kezGjAOigopsK@vger.kernel.org
X-Gm-Message-State: AOJu0YznUYcRXSMv+mGsjurdrKdc2vhAqymZylkLaoOMoL6Dua2P7rpx
	0LtlO8p7NqaUz2UQ59eyQ6wTAKmeI3azgVpQ+vqOtOXM7PbQeujU50zlp1JgYoU0SVvD4cH2B5S
	s8qW/nTzuCtIhK+VbL6mkadWuSGKEUSHWdov5pphxRoVXto9XmiL70qLrSBxRKqQHzGc4
X-Gm-Gg: ATEYQzwTtxrbK5EyhLGBAURP2qalIRAMp159Q6TCobBfriuxD7SD8ApH6dZnOsHt+3Y
	Tu14H3GK91h5mnW/KsreVwef/ogwTUlvRRKNIDgEmZ54PwZspJ8IT8YTU3oX0XkETWtd+p/Hga2
	XrwfsvdJ57r3kXvaN7alBdisEdBMub6g5fdUU25qED7K6FPoMKS6MTm7ErIurCfacN4X4ZTJcPS
	93QlARXX8ZzwbtyypcJudFGuWN6inQtgM5XyVvJpSwpGVHIskNEE/AFsg0UegPVEfD0qxOLlgad
	AZtzEAZiOtogBdxLZ9zepNz6B2CXMWI7xW58FolAhot88kUXQEHpFaO+6u7zk9fzlA1jnd10Oer
	1SoRRE0iKZGBC03mIg+6VAH+Y8HJqdF/+lgVz6tUXh0UxGa9d3hL/9JZ0nAA8yCMDlG/u9iZY37
	0/F+Dy8g==
X-Received: by 2002:a05:7022:6b97:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-128f3dea833mr2577276c88.30.1773465269578;
        Fri, 13 Mar 2026 22:14:29 -0700 (PDT)
X-Received: by 2002:a05:7022:6b97:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-128f3dea833mr2577269c88.30.1773465268998;
        Fri, 13 Mar 2026 22:14:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c098cbd4dasm1784045eec.0.2026.03.13.22.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:14:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/6] phy: qcom-qmp-usbc: Use register definitions in qserdes-txrx-v3
Date: Sat, 14 Mar 2026 13:13:22 +0800
Message-ID: <20260314051325.198137-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z_GL-3ZFTPFgUYnkfbDzjNWDDIm24KuR
X-Proofpoint-ORIG-GUID: Z_GL-3ZFTPFgUYnkfbDzjNWDDIm24KuR
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b4eeb6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=f3I94rbs0dppKun-wmkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAzOCBTYWx0ZWRfX7L2TP6Iiy3/8
 dWWrh6es4FMuHEVQl2w40CPRzybXyWNsJuqSYgbny6r5Kpw1KYKpeT6Dm+TooDl8qqxtwRy0WIA
 80vjdeSCwcDJcPcFsOTTRiThGTjbNodNB4pc187srFl02B0+uXfFY8gK6ygMy2M8hsw3V5naN5o
 IlkcKUOCIKEYcRm3FfxaMU485lnmvG+rA8gXwZ9t4uiRQbqX6abr/PXfWNS9oGZgoYAOeOV4lQs
 2lgozg5EL/MtHOaMOnOxd/iSU1XOjHcaV3Md7/1bpg+s9Av24lepzn2cFM8KjE4yeXY1JFmOAEl
 SX11mK3hJp+aP6FigwpiVPdq4qNTGFgo58xClxLO6p3KmWG2AZ9/Ky3uLdndvdEYr1bpeU4CihS
 AXpci7S40Ekcrxys/QVyve7B7kzYOomqzkPyZLSLD7cqRinrKnfQ1mfM00KqghzecqMApOVvJMY
 yQrxjg+F0uKKI+IZ3Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140038
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-97680-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0E5328BC01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The register definitions in header qserdes-txrx-v2 and qserdes-txrx-v3
are actually identical.  Considering that QSERDES TX/RX v2 is already
defined by header qserdes-txrx, qserdes-txrx-v2 is really just
a duplication of qserdes-txrx-v3 for QSERDES TX/RX v3.  Switch
qcom-qmp-usbc driver to use v3 registers.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 64 ++++++++++++------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 1b841e805536..3f8c4280b933 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -351,20 +351,20 @@ static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_hbr2[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v2_dp_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TRANSCEIVER_BIAS_EN, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_VMODE_CTRL1, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_INTERFACE_SELECT, 0x3d),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_CLKBUF_ENABLE, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RESET_TSYNC_EN, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TRAN_DRVR_EMP_EN, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_INTERFACE_MODE, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_EMP_POST1_LVL, 0x2b),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_DRV_LVL, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_TX_BAND, 0x4),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V2_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
 };
 
 struct qmp_usbc_offsets {
@@ -809,10 +809,10 @@ static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
 	if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
 		return -EINVAL;
 
-	writel(voltage_swing_cfg, tx + QSERDES_V2_TX_TX_DRV_LVL);
-	writel(pre_emphasis_cfg, tx + QSERDES_V2_TX_TX_EMP_POST1_LVL);
-	writel(voltage_swing_cfg, tx2 + QSERDES_V2_TX_TX_DRV_LVL);
-	writel(pre_emphasis_cfg, tx2 + QSERDES_V2_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
 
 	return 0;
 }
@@ -871,17 +871,17 @@ static void qmp_v2_configure_dp_tx(struct qmp_usbc *qmp)
 	void __iomem *tx2 = qmp->dp_tx2;
 
 	/* program default setting first */
-	writel(0x2a, tx + QSERDES_V2_TX_TX_DRV_LVL);
-	writel(0x20, tx + QSERDES_V2_TX_TX_EMP_POST1_LVL);
-	writel(0x2a, tx2 + QSERDES_V2_TX_TX_DRV_LVL);
-	writel(0x20, tx2 + QSERDES_V2_TX_TX_EMP_POST1_LVL);
+	writel(0x2a, tx + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
+	writel(0x2a, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
+	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
 
 	if (dp_opts->link_rate >= 2700) {
-		writel(0xc4, tx + QSERDES_V2_TX_LANE_MODE_1);
-		writel(0xc4, tx2 + QSERDES_V2_TX_LANE_MODE_1);
+		writel(0xc4, tx + QSERDES_V3_TX_LANE_MODE_1);
+		writel(0xc4, tx2 + QSERDES_V3_TX_LANE_MODE_1);
 	} else {
-		writel(0xc6, tx + QSERDES_V2_TX_LANE_MODE_1);
-		writel(0xc6, tx2 + QSERDES_V2_TX_LANE_MODE_1);
+		writel(0xc6, tx + QSERDES_V3_TX_LANE_MODE_1);
+		writel(0xc6, tx2 + QSERDES_V3_TX_LANE_MODE_1);
 	}
 
 	qmp_v2_configure_dp_swing(qmp);
@@ -955,12 +955,12 @@ static int qmp_v2_configure_dp_phy(struct qmp_usbc *qmp)
 		return -ETIMEDOUT;
 	}
 
-	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
-	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
-	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
-	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
-	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
-	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
+	writel(0x3f, qmp->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, qmp->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, qmp->dp_tx + QSERDES_V3_TX_TX_POL_INV);
+	writel(0x3f, qmp->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
+	writel(0x10, qmp->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
+	writel(0x0a, qmp->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
 
 	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-- 
2.43.0


