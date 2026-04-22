Return-Path: <linux-arm-msm+bounces-104019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB/zCOdk6GmpJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:04:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8D442439
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8298D3042242
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E4E1B87C0;
	Wed, 22 Apr 2026 06:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlU3BkQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOXq20l4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D522D47FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837745; cv=none; b=qq02xGB8SDtlJQ4ZaywxMDT5mlVoNHeCH+W4P56ApmCFxGSodu1y8wtkwb7zIfugM7SJz9zvBniGFoyhvwvc+d+iQb3ypZK31ehg7/YRXPHcYIciMYHEzOzMSzby1Xt952w9tOzJR6ICRahi9DjfdCSnuFj9XtNvZ/15oHENBuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837745; c=relaxed/simple;
	bh=qmdY+9gqlqyquzs4DveF/+RSKYlbC385O8eG8AwNNHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tphdRx+5bJpRMvnPHzTqFLC80UneFQvgSnbxXy6jRTGAPtpGFVLKtNpTe2ljP62V//FGSzjJ/ZaYJu3VBwEeq3hxKKSTn1zBkovjA3SoAuNE9fQRnoMAmINsZvwg3IT1bkJdZTxNcOo5zU+f/OvXFX9Je5WzhXxxq2FU9VTGX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlU3BkQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOXq20l4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4pjK84051047
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2C61IqPkD5k068uRvM9MVLw5rLsp05NvnfwiorSH3fs=; b=AlU3BkQ8tIeiTKA3
	Cs6IPDFoopQMnCuC28PvHDCsus79qtBNYV07fqFcFL/MRpfOTCtSn4nT2K2DQqQY
	ZL31EdGGxJ3wKAHC2rShmW5V4lww86M19JALkq3AgVUfoXQ5qeb3FwHzjAFE6zwT
	sG5K/wE4ymTK9fQVz/mqezszuH7opmilXyWxmQmJ54UCVfnTtQDQg2ChRyYO8vPa
	MLbIKCd1CC/0Jpabt1i1dSkUEj3/GYZWHhK2+ju7vQ5Hc45mqhLwKWr5GkJS73a9
	ntW3C6Nsdc3uMwglXZtQp3Dr3Ti0noAUXAAY1yNdj192biXXAcW8W6w7vcvhTS6j
	JGSWAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfhxpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ebc7ea2402so526483285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776837742; x=1777442542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2C61IqPkD5k068uRvM9MVLw5rLsp05NvnfwiorSH3fs=;
        b=OOXq20l4USZnqxfCMG9BEcaplpKFuR/zRphE0PGvsUkkmlwrl1lBwP4KJUyjXnrl+P
         2fH4dFiZlwM/sWfQc0YGonrQT86BfRSEHaNQ8JGStFTG9xRfLIioBnHbe8jcHJdfcVtP
         EkBPR+VfSSwFT94rtZrI4jlfDXYTVZcX6vVRRreLKJ+mlJSQe1XjKJzUoJx3iuDv/sUu
         qP2JsBI5URSnrF+ZK8vKhYh9XpSzDX3POP1pv9BG7henYHJk3DMUvY6wcIOZG/4IZhMl
         lAAR96R581JMTJkmcmbeOm2Ut7O7rlx+Q3b+uCZMC/BS1Rv7fl6AIMw8Bwv26Jev6Psi
         v2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837742; x=1777442542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2C61IqPkD5k068uRvM9MVLw5rLsp05NvnfwiorSH3fs=;
        b=Jzluf76Vg5lAR93o76eqZ9YORgb8mIr8OIDTd09s/r1PkuIY/ncsXEI7x3aiQxH7uV
         MNY7VOjXOP0x7lEdnIS0B2b2vuXnTwHYyNdO4mFAXIV3njslP3etwqrlR9J4+/4Eu9Or
         a7lsv+O1cQiZ8fvLHWh6K0/r78Cqm9Y3niZCHRCE1m2lP98J4OkOb8SuN2OyAzUWsvRO
         VinlR8FS0ZyZisZ1fUwrT71BcPKH1c/fwno4vZkJdX6Me1rF+0XxUQdoZfWt3qLBsCHy
         uNnGdYNz1/LHzpF/zB11dR9b9DCeSXEZJTPid6/CJJ0bPZEkoiBzK5t2y2m/J5Lnsapa
         wPJQ==
X-Gm-Message-State: AOJu0Ywph3xaVx8LyWU2yzZa+AILvPW6UXEEWZ1GngsELGL6LsLU5Ajo
	3oeu18Yl9SLfjNRMPYO6FOJtpRYlkxR8W2Ds1fd+RCzdQGbIlz7ITZx8xkiNpG8pXzCjCK1vRR0
	y6c+d3Rm7l6t4UaqD1QauJGhXnIQrA01hUhCDPsxc4h8AIlcwL07p6eGoy+XScjhiW3QlzyDF1R
	/L
X-Gm-Gg: AeBDiev1Vtx3AWWu/3RULItkVc3dsPLC7BnniGlYLTMDQNzHo/KDCHjFocxKgUdVTec
	ve3KMR/U8W/0G9vz+jMXSw0r8AZOjKvBL3WiAo/L+r1BwljT2BRonED0VNKKvWXgKeqYLeVfch8
	12VjUOWDF+WsKGWTOCN2gtgaJyv4zCYTLfJ3Ec6EN4Iq52TU475OxVNegSFMu+4c1c1Q86rW3jm
	+ytEV1qiElqc/6L8Pv/y/PKPXOuIEdgmjRTfISZm38P5OUDu2xmD3efP6VS/T5gz8qlsq+O/Gax
	OkarPfe4plGT9mFdtgOGPt1Ih3XuMN5V2LYbQoZXi3062/9eqRRB9poAVLxzLILmf7W8T+DYsUg
	Q7URr4MoOe3V4vMx2E8eSn8h958LT243KXEDxLpFEec1kgfg5FvM5QIJsN4n1uotwuskCbHph9F
	sfbBr0kZWEF59Jl8/Kbw==
X-Received: by 2002:a05:620a:9490:b0:8ea:f0e0:26dc with SMTP id af79cd13be357-8eaf0e028cdmr1240643085a.24.1776837742016;
        Tue, 21 Apr 2026 23:02:22 -0700 (PDT)
X-Received: by 2002:a05:620a:9490:b0:8ea:f0e0:26dc with SMTP id af79cd13be357-8eaf0e028cdmr1240639985a.24.1776837741512;
        Tue, 21 Apr 2026 23:02:21 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm237379985a.18.2026.04.21.23.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:02:21 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:01:53 +0800
Subject: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
In-Reply-To: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776837726; l=4697;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=qmdY+9gqlqyquzs4DveF/+RSKYlbC385O8eG8AwNNHM=;
 b=JjvDcCCg0EEmMdEu1teFQ8pogQUG6h1zjK9yxEINuUJFgZcvgRLOTkCnGTZPN5O7HqVmTowrz
 rsoZtdU8ocOBxxXg7l16VNISxwvOMgT2TJHqT/6lk6mn9BLMWLGREiE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NiBTYWx0ZWRfX5PO3UZvumgup
 +/49Nej+ia1jRTiRAUwdcECI4mACOv97X5YYYJvrLgMb9RDLwExzGAYgtPTpB+GSFfsVUf/0P72
 bllNhtrx+LnPgmpuzVmDYPQVhd8OvwV56f2InD9HbCQG17itXRJNgn3J29400liLmFdN3OdyRUV
 jaCsd2QVNWnHfhTj8vlzHuWgM3FZP6kds228aBqxXh6yH8YTnS4DlbDRL6L0bgAUk9UYIk7pj7g
 sewHdV1CiB3S+9eeZttkcXyFkVjGjtqptKTJo0ZvEfAnHnTLnMMKdLvkSClyekw+X+H2NvVjqTV
 +wugnbZEnyuGEx0rIxOjgH0b4zCXPg0zyUuZ68+xls+fOw/pudK9M1uIB9gBLj2YCs8ZlDB90ED
 e34PlmtZMjhmAZq1tOZR1WecZLPr6mbVJim/odzEsnvO6d/3Df/0xAvuaXGJjX5qmW3Ui32aUAK
 zc3CSDBsVv1JHe1niew==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8646f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=30kYINvD9rJISS9apoAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GGXuKJyL6_U_0v9xeIfnvRq-GdhHT6LP
X-Proofpoint-ORIG-GUID: GGXuKJyL6_U_0v9xeIfnvRq-GdhHT6LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104019-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54C8D442439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SC7280 and SC8180X previously shared the same cfg because they did not use
swing/pre-emphasis tables. Add the corresponding tables for these
platforms. Since they have different PHY sub-versions, their eDP/DP mode
tables also differ, so move SC8180X to its own cfg instead of reusing the
SC7280 one.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 71 ++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 3266026cfe37..7ac2f502c7a0 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -165,6 +165,27 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
 	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 dp_swing_hbr2_hbr3_v2[4][4] = {
+	{ 0x27, 0x2f, 0x36, 0xff },
+	{ 0x31, 0x3e, 0x3f, 0xff },
+	{ 0x3a, 0x3f, 0xff, 0xff },
+	{ 0xff, 0xff, 0xff, 0xff }
+};
+
+static const u8 dp_pre_emp_hbr2_hbr3_v2[4][4] = {
+	{ 0x20, 0x2e, 0x35, 0xff },
+	{ 0x20, 0x2e, 0x35, 0xff },
+	{ 0x20, 0x2e, 0xff, 0xff },
+	{ 0xff, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v2 = {
+	.swing_hbr_rbr = &dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3_v2,
+	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3_v2,
+};
+
 static const u8 edp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x0d, 0x16, 0x1e, 0xff },
@@ -208,6 +229,41 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
 	0x01, 0x01, 0x02, 0x00,
 };
 
+static const u8 edp_pre_emp_hbr2_hbr3_v2[4][4] = {
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x08, 0x15, 0x19, 0xff },
+	{ 0x0e, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
+	.swing_hbr_rbr = &edp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v2,
+};
+
+static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
+	{ 0x06, 0x11, 0x16, 0x1b },
+	{ 0x0b, 0x19, 0x1f, 0xff },
+	{ 0x18, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x09, 0x14, 0x19, 0xff },
+	{ 0x0f, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
+	.swing_hbr_rbr = &edp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
+	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
+};
+
 static const u8 edp_phy_aux_cfg_v5[DP_AUX_CFG_SIZE] = {
 	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
 };
@@ -298,9 +354,6 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	else
 		cfg = edp->cfg->dp_swing_pre_emph_cfg;
 
-	if (!cfg)
-		return 0;
-
 	for (i = 0; i < dp_opts->lanes; i++) {
 		v_level = max(v_level, dp_opts->voltage[i]);
 		p_level = max(p_level, dp_opts->pre[i]);
@@ -568,6 +621,16 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
+	.ver_ops = &qcom_edp_phy_ops_v4,
+};
+
+static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
+	.aux_cfg = edp_phy_aux_cfg_v4,
+	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v2,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v2,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -1348,7 +1411,7 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
 	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
-	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
+	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc8180x_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
 	{ .compatible = "qcom,x1e80100-dp-phy", .data = &x1e80100_phy_cfg, },

-- 
2.43.0


