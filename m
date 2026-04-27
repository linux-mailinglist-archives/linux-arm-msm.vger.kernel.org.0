Return-Path: <linux-arm-msm+bounces-104606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKnEFRIE72lz3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:37:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DC46DA13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E114302332F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409D338F651;
	Mon, 27 Apr 2026 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2UJ7JZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NktejEih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9338F653
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271742; cv=none; b=n5wqDtcRHnmp1m5F+40PpIPR9e9C82T8JPiWhhg9YbbHQYIOOwHvSkzWS6ayB1Z5LW+nLCuJTm8kuBGrlQLgeNJwJXBJXgM8z4+GsF47tGdxlpSbeZzzsm3SY+JNFkgqRlVv9lvIpMIh82ye/34pR9IflrXRjZwJFC/mW1MqK/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271742; c=relaxed/simple;
	bh=R2IzNDqGo6HtlEfDbgCxfFqgBnJCRQP8v/nOXy+Ydls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=us+TMdAbZkKEgWQKortmG/1ZF+IyOEF4SdGdVYFPTAfvnskCuMe8bn61wSHNnotNHa+vIj1Cubv1szb6YNfPnY9oWwYBBR9bJpM4Yl9fvnHIg6rb+Eh4TMt3Pjz5yGY0rMeqkjhieNpAk4FaVSZITllnnifd8qBC4VOWSOpBKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2UJ7JZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NktejEih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R15EBL1232141
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MOejmSdyeyE767wPf4LJqa7khHTtZoxzm9fKm4l9sgg=; b=K2UJ7JZPw7f4hXuj
	wdA4UgRA4HUE5z7Bx3Id33T/Vdc0xekCCpdFOVoZWNy7OKFReXmg3noBcswgVG/E
	mer3iYacWtgqem+QNf016nY0rYdfnxE31Q+NqduE4cWGvayGrDmJBV72u/jgozIf
	lNa7XwPWFrBiK7ryX8VfBXMUiQuIlY0b8TEE0IGOYRK/fm25U1yCbOYM16X6UiQw
	vMqfLCOBQIIfSbfDz7lvr9DBf4qdiBfz8YlAvS8bgwr9I2WGOjCpG3R3jqq5BkxU
	Gezux8F8m7ki7eh0MRJfSESHEHxVXkjZoTa55rKnvnVV6KSvc9ck2GBa+FUJG7un
	pdE4Ng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdmp8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:35:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b02af4345fso42734316d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271739; x=1777876539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOejmSdyeyE767wPf4LJqa7khHTtZoxzm9fKm4l9sgg=;
        b=NktejEih2EnIQKolaOn1XiwmJzRSxOHTo0bN+xX0WBTbsOA4LTQMvKtGEJ6BabdpvX
         yn286LbsrlN3FAJFi0xe2M/knk7gdWMessqLRmzBTLZj8M+c05t6OL7oHW6S+jQcS9Ct
         m2mXo3emqryEKEBClAO/8biCcWclsHaoq7KYHlvJQMWV1Gs8VBRy6fnA+4IYtiZGYYX1
         3Ywlvn0SdoOXrdUZxg3HQF9vUVGKTiq+RF36UgMFv1OZhcP0R2AZRnsdprC/SpP8q+fL
         jIDZratLeeF7ZXlveRAH15CSbR8GugGJd9HvQxZ+8wXUMuHCj6FilTG71I4HUeYnUBE5
         3WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271739; x=1777876539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOejmSdyeyE767wPf4LJqa7khHTtZoxzm9fKm4l9sgg=;
        b=HTd+1Vv7kpEzuIvTfPqTXB0mQS5hilCBt3JE2+89wBZbY/XNGfrM3TviYhFg9JRAjU
         wGiFcS5Pygxons77iE+sQSHgxz4xmUP59sg6wJSz9F74m1YmoxbYo09+A18PB3T3697e
         8GSGJoI/RgKhcAS96ZUTiKehCJ5VDk9wIgfoHhqWivykL3UsE2OIxb/UJhhgrfAght7D
         0i4suxPVpcnIDvQCKByYibms/Af2U2E1lbRd8L9jAvQboJSL+BMtyfSebbPkvddqho/m
         PNNwHYbdjSyWYq2FrIM0VDt941BsDKoOifnNG5xLzaLbfYLGJGxZ66wobIoHuZ4KgNLo
         NDRA==
X-Gm-Message-State: AOJu0Yzt+XdEj4n9nnhfxWgMtfPt3GV6j0h7CnJaACZfQEYC2B1pMMqK
	tMKk4NTVIJnOuqSD5Q4AV5hHjbpIFFPE9stm5DQhLvsGv8lBujxjN9Vb2OS6PUOVbCdlVfwybG4
	ALshxjlWWZ7Chmr6kEa1Bjr2ccGUxI35l0PW5VOcMWaI5gxfs5CYDbfLmqGk6gkMtC7can+26jM
	e6
X-Gm-Gg: AeBDiesY/8V7zwvtpLB510lvlzla7ts95vAhX1CsK4o4NUkK1hxSQuLkb7YzpFg4iYT
	OoXYJXZ5LPgo1DGtLps/RXOsFTQpbLtgpI0+QLT4fzLVsayZG0jHHkXAeURbh++uh89nKQQCT4X
	oH59l4xtEH1O5E2AaFzRwGGWIVfqxrp16MVQoA5g4sgKKzXY/R6pxxECUKZBrJea1ntrC5TomcS
	n5Va9geLFqi/CrGTs+e+UM3P5zGNzVyvvaNFs1TdnD3yQ/VPwRlLcBEd4MCrW981KfWwkhD1l45
	DDNnse6PY2vInKgVqxnb53XPwGpiIa6G074Tck3ZRY8H8X6yAymdS3Z2lKezEZHO4WXtfUJ0eMM
	PPzdJvuGqBquSe4dJAwGUewQfjsI6MVrw6xPq2utnuqQTDil9WanYtVGK3mz9FmOljqveFjTo8J
	t+Drnqm4/EJ+cr7usWSQ==
X-Received: by 2002:a05:6214:4f18:b0:8ac:ae21:466 with SMTP id 6a1803df08f44-8b0280ce5bfmr601793776d6.24.1777271738982;
        Sun, 26 Apr 2026 23:35:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4f18:b0:8ac:ae21:466 with SMTP id 6a1803df08f44-8b0280ce5bfmr601793536d6.24.1777271738489;
        Sun, 26 Apr 2026 23:35:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm251899256d6.20.2026.04.26.23.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:35:21 +0800
Subject: [PATCH v5 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-edp_phy-v5-3-3bb876824475@oss.qualcomm.com>
References: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
In-Reply-To: <20260427-edp_phy-v5-0-3bb876824475@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777271722; l=5099;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=R2IzNDqGo6HtlEfDbgCxfFqgBnJCRQP8v/nOXy+Ydls=;
 b=esc5roMnJw7OaG85PNh1QTtRz5jMiXXxIeh1/mFItaQ6gg+lIgGGd4FVItjASJqkyKSj8Aa5d
 G+WKOZqRxDODO4R2WwPRlWIDNcF6lM+I4HeiCRvNXIRTZ0qgDtF9XHu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfXzittCXczUD0K
 sfeoH2NJGSZA7XwwG6wPRvThi2MBwwwXIEfg5B9vtjzBqS4/RYbGyZXqz+Ua00CgRi+Qb0cN5jx
 eHAK3JmUlJNWH/eZP8/bBMd86EJELJj8/E6VJki9zq8DQNAqpwWktblew5UENNq26XoHCQwBfZL
 pYxhbyL9oiIWJqw00cQ+iH0EsM/52PL+imBQrPGbwNzEZzUmH4vDBE6B51wnLCk74fuRW+BFMc3
 fIzSF+gqDLZAaPhOtcxu9DcxgRv4me0Pz1qIab5QiaW72PJEYTpfuOoQLYGd1WOAQ30eyM/0mLu
 X9xArhp5CwSeNk8WVyKRziDtrW8DKszK0himHdFUcHVNYH/8p0tw1q9QZ+2sIdJc2NHHfNVw7f4
 ZRyqSqn8HKlsWkJfzj51CJn85vcMP9akKpRWcHAwDmDrlHjAKLOxOlp8lgfobLQZ+9A8b1c3dqk
 NsKDRBx4Xvpk0qnbyfg==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69ef03bc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MHk7-D5nQAs65VpelYQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: BGdXDsOfwvHfXBDFPPpiGNgY-dCRptuV
X-Proofpoint-GUID: BGdXDsOfwvHfXBDFPPpiGNgY-dCRptuV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: E30DC46DA13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104606-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

SC7280 and SC8180X previously shared the same cfg because they did not use
swing/pre-emphasis tables. Add the corresponding tables for these
platforms. Since they have different PHY sub-versions, their eDP/DP mode
tables also differ, so move SC8180X to its own cfg instead of reusing the
SC7280 one.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 84 +++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 3266026cfe37..3e613b374032 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -165,6 +165,33 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
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
+	/*
+	 * NOTE: The HPG does not specify a separate swing_hbr_rbr table.
+	 * Reuse the HBR2/HBR3 table for now.
+	 *
+	 * TODO: Update this once the HPG explicitly defines RBR/HBR swing values.
+	 */
+	.swing_hbr_rbr = &dp_swing_hbr2_hbr3_v2,
+	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3_v2,
+	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr2_hbr3_v2,
+	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3_v2,
+};
+
 static const u8 edp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x0d, 0x16, 0x1e, 0xff },
@@ -208,6 +235,48 @@ static const u8 edp_phy_vco_div_cfg_v4[4] = {
 	0x01, 0x01, 0x02, 0x00,
 };
 
+static const u8 edp_pre_emp_hbr_rbr_v2[4][4] = {
+	{ 0x05, 0x12, 0x17, 0x1d },
+	{ 0x05, 0x11, 0x18, 0xff },
+	{ 0x06, 0x11, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff }
+};
+
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
+	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v2,
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
@@ -298,9 +367,6 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	else
 		cfg = edp->cfg->dp_swing_pre_emph_cfg;
 
-	if (!cfg)
-		return 0;
-
 	for (i = 0; i < dp_opts->lanes; i++) {
 		v_level = max(v_level, dp_opts->voltage[i]);
 		p_level = max(p_level, dp_opts->pre[i]);
@@ -568,6 +634,16 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
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
 
@@ -1348,7 +1424,7 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
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


