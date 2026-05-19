Return-Path: <linux-arm-msm+bounces-108326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLEQHAj6C2qISwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:50:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD435577907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FEEB305D5FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB3334F46D;
	Tue, 19 May 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkRnk846";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPOtuErF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C72DF68
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169649; cv=none; b=QSvrkqVAtc2A0c1pGphwi3QGwbavP8qCtOJaJ4Xi3CvPWWV5co/byex2H4g3gqBq+VgUv8IaWEWsUkMGT09LhIjn4O6bitw/vG+5br8RjMcU9gfhhttEC/np/9dDaPdeRb4Gi+97XX5lKgUXzSBwtW7gnaeKcu+Cm6sOQt3C0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169649; c=relaxed/simple;
	bh=MbaTZPbJ/JsKncMTk7duiSh2ZYiCvvSREcklhYtrLDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVLBflJoaZSqsLjGyCLdL1UBPQTQ0r4G4kq/HvfWBnhlvm00LdIIT/ZVXBNZqdw3Ioj3OlcdwcV0vMluruFbyhlmp6Vb+0XRLPxaF4IMvirYm+E4g9sxl+V8WVQysCJ82ibZAlbNw/h+QF1iDlMTxYtIrQAnbj2D4UbU2KJIHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkRnk846; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPOtuErF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J59ng91251662
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5B1VrBCZnVKjjIU3TaDRNw/BnDir7OFUrpirZ5gPu8=; b=gkRnk846rzCIkExj
	s0v+5HaktDA1pg0paPZD5FI5hLgM4E33gUQmnvskFjG/GxAsXJiRc/LxNjfR81LJ
	qN3l5poLWdI0p4/5DGg2m6UfG0CtBJa11MqW6OWED+bYOIqUbFcoQrz/qHeUChuL
	dwIVsdJ9RfAIGSWIxm3WswngL3h723JS8jqgIiqq09/yzedtb2XpiSliRT2OOJfC
	+yjcdhvg1l74W2aG1Yobxa1amTtKoRuL1gT45G4Ha35Urevo6YGuFPN5e2IRWBmr
	LgTWXlKGeIEVKeoelIcCJLv7kpOBsU3rSdhxaBwfNtC21Rt57g9AuKWuLOk7PDy/
	knH/JA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kj96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2fded513994so14401856eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169646; x=1779774446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5B1VrBCZnVKjjIU3TaDRNw/BnDir7OFUrpirZ5gPu8=;
        b=aPOtuErFes1hPrc30DhQkXqx5/0zZWtdh1rOcBXNRGnt6sCejna+W2AFB4FnPzDAHB
         yBybWarkTGgRJZmtLmkVT5U83KEMjNCsNV01efVgn+18dJEugjCaouDZx1I3KxL9bdN3
         mhKgRvTFKRKIXMyXK/0fOwv5N+sPqOPV7DNWAkNyKKn/GBJE4Echt7qqLoJi/6nuJ3Kx
         1AtHoeLCqxdFCXp39x341M/icjlPbHbjp71LPr4sLlCzLDBRC1YkdEqBMbg76DZYzMAh
         Ld+PW0XfJr7GwATLsgtmp+UvNgrw8Mo1A5YwvX3p3TGtaArJ0LFnxoT0S90ruOav0fwE
         mqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169646; x=1779774446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5B1VrBCZnVKjjIU3TaDRNw/BnDir7OFUrpirZ5gPu8=;
        b=CjX88QTWyYx0kBwoB3E7JX81NrbP7rUvBjX6Fyp61Ie+l74JUlCEUVGAxCt2D/bIv9
         By7BF9Tjs/VI8M/l6llDUs6EmY2tlUClQEhDRUMV1UxzhWlztX9buuhOfBy35ftbnJTy
         b4L1GB66KeccEdNQ/7CHC/VfsqkzYnij1bzB5NUAdEYQIZEEgR4D/Riyrz7IzBGL9wr3
         QCbHIgUJ3KDtVPYGJdXaDbsujMQZDRj5SmJh+Voh8hn30VsE6d6VDOB3ZsTSJIzkAw9r
         wN4iWvOiDXF2UXw58Nyccj8cUtTlFR/+Aq6sAkWHQadFlDdBxtJwH0MrocMUjr3UYysR
         BFQg==
X-Forwarded-Encrypted: i=1; AFNElJ+uwZ6coRUTRqK58ygS5VoYjS8MmVOBF/rXFVg4G2vks1J3C1b/GmqR5xCwtjktis3geBVm3oNjoVHbXK0J@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjYeEDyToSecYAvAV6sZK5JAtb7Z26+3uW0cg0QrdbEXuHKK0
	XGf14086R5eGhwk/GTcEUOEpCCPdvOomMWAGsj05YLJVN9vqKrtP7VEe+3QDL3LsYkGzrK8zpy/
	KWBAfOePHi8sE8fVoQ0ZugE9egaDN5ydXQyNizqZetTDDg1rMxWsIbX6tUri7upKZ4kPY
X-Gm-Gg: Acq92OESudZF0fchMBnS8wN4208a/tiBzjzHnOtNWi34fd8zysaj9QB67J0JUlnnOQ+
	6zTDOlFftZjLifZNjBF0jjsKewbyxk1bLGaRez3O6pugMMxpqUm6hXMqSMToaWpeP0ro88qhMuh
	eT90oZg7UZppypgZ5A4dhbsLe9ET9S/Nhi39fO6jldKQyKzXD+nq3NTCtn/T3rfmv5lXYmngsAP
	DNnNwwVQOMI1xesiQlSWju53LJMymKxGaPRZOJaeH1jaIF3F1qC/pVj6kBPO0qp4fRjVA1FlmUz
	8fU0Si7kEaBDh+1Hl6Hd2EqTecrNGKHVmUcg9BDese3XRMA5BmGbyONd9JMCs3jXW1JtkafLrbR
	GmHavJO62wwYcSxtuEXTicJ4pZEJt17id2q7znWxfYjXH3ZiS03Z3ZfERauwZzqPo+1eh0yek1X
	KWLE0=
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id 5a478bee46e88-303986b7f00mr9394478eec.34.1779169646376;
        Mon, 18 May 2026 22:47:26 -0700 (PDT)
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id 5a478bee46e88-303986b7f00mr9394456eec.34.1779169645860;
        Mon, 18 May 2026 22:47:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:25 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:16 -0700
Subject: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk register
 and parse_dt helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=5256;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=MbaTZPbJ/JsKncMTk7duiSh2ZYiCvvSREcklhYtrLDc=;
 b=Dq3RCcs82o0H2virjARvXvlTSyqDuHN+lBQRphnHRjl/IthNFWB96EylAfdOP6gHzuQPubGCY
 3RMr5wszk+1Ce83B2703ATv5W3RlvPKpcAXgRqGxLvicpvvGZAfXDtQ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX6DTu86is/5IO
 Nl+HoHC+8RioTNG3eb7tEp2VkgOJN4EAWeVddHlABx7xxcg1fVhFkGXPNcSj7kIjvCzY18pazbk
 uH/HMXfYs8xacj4BZnRwvcaxp+Wqo3ynFf4MFi9ViXk0dRaaTq1AAEW4PpCiijS9iHZDYI923KM
 2UUg+GERsvfsfA0J7wnIQSUri5Uu2UVOjY52TcUPmqoVsC2Ju0XAInkqMYTn4Yo6YdFcL26VFVF
 Pj2NAofov/PVrhVysA5ykqOrJyhSg/3GZ59frECLEJWntF7F0OA8xpVx1997awNySelft3TFA4P
 r64axlO3LlLoPXvGxnX7A0opFaiavdfGUKVM5NX2UXTPUhmqsv/lHVKFIVz5qCT9+upoFnQFG9u
 V0M6JjKxlgwYblfXxaLx0ek+eEnPCPwCsNCUTB6AlQ6VsWhJFyJWHXhFVd1RsNeLM19Lnij1mC3
 xPpMWR8DfgPiZDTl5/w==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0bf96f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2AX8zLxBezjo-DDFgScA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: jY19E1rTjiSFXB3o-gi3K9tle09HP7Xt
X-Proofpoint-ORIG-GUID: jY19E1rTjiSFXB3o-gi3K9tle09HP7Xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108326-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD435577907
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
under a single DT node, each requiring its own pipe clock registration and
DT resource mapping. The current helpers are tightly coupled to a single
qmp_pcie instance, which prevents reuse across sub-PHY instances.

Refactor __phy_pipe_clk_register() as a generic helper and reduce
phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
mapping and pipe-clock setup that will be shared between sub-PHY instances,
with pipe clock names parameterised per instance.

This is a preparatory step before adding multi-PHY support. No functional
change for existing platforms.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 1dee4733d4f2..6332f15f78ca 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -5116,32 +5116,34 @@ static void phy_clk_release_provider(void *res)
  *    clk  |   +-------+   |                   +-----+
  *         +---------------+
  */
-static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
+static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
+				   int clk_name_index, struct clk_fixed_rate *fixed)
 {
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
 	struct clk_init_data init = { };
 	int ret;
 
-	ret = of_property_read_string_index(np, "clock-output-names", 0, &init.name);
+	ret = of_property_read_string_index(np, "clock-output-names", clk_name_index,
+					    &init.name);
 	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
+		dev_err(dev, "%pOFn: No clock-output-names\n", np);
 		return ret;
 	}
 
 	init.ops = &clk_fixed_rate_ops;
 
-	/*
-	 * Controllers using QMP PHY-s use 125MHz pipe clock interface
-	 * unless other frequency is specified in the PHY config.
-	 */
-	if (qmp->cfg->pipe_clock_rate)
-		fixed->fixed_rate = qmp->cfg->pipe_clock_rate;
-	else
+	/* Default to 125MHz if caller did not pre-populate a rate. */
+	if (!fixed->fixed_rate)
 		fixed->fixed_rate = 125000000;
 
 	fixed->hw.init = &init;
 
-	return devm_clk_hw_register(qmp->dev, &fixed->hw);
+	return devm_clk_hw_register(dev, &fixed->hw);
+}
+
+static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
+{
+	qmp->pipe_clk_fixed.fixed_rate = qmp->cfg->pipe_clock_rate;
+	return __phy_pipe_clk_register(qmp->dev, np, 0, &qmp->pipe_clk_fixed);
 }
 
 /*
@@ -5336,26 +5338,18 @@ static int qmp_pcie_get_4ln_config(struct qmp_pcie *qmp)
 	return 0;
 }
 
-static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
+static int qmp_pcie_parse_dt_common(struct qmp_pcie *qmp, void __iomem *base,
+				    const char *pipe_clk_name,
+				    const char *pipediv2_clk_name)
 {
-	struct platform_device *pdev = to_platform_device(qmp->dev);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct qmp_pcie_offsets *offs = cfg->offsets;
 	struct device *dev = qmp->dev;
-	void __iomem *base;
 	int ret;
 
 	if (!offs)
 		return -EINVAL;
 
-	ret = qmp_pcie_get_4ln_config(qmp);
-	if (ret)
-		return ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
 	qmp->serdes = base + offs->serdes;
 	qmp->pcs = base + offs->pcs;
 	qmp->pcs_misc = base + offs->pcs_misc;
@@ -5368,12 +5362,6 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 		qmp->rx2 = base + offs->rx2;
 	}
 
-	if (qmp->cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
-		qmp->port_b = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(qmp->port_b))
-			return PTR_ERR(qmp->port_b);
-	}
-
 	qmp->txz = base + offs->txz;
 	qmp->rxz = base + offs->rxz;
 
@@ -5381,17 +5369,41 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 		qmp->ln_shrd = base + offs->ln_shrd;
 
 	qmp->num_pipe_clks = 2;
-	qmp->pipe_clks[0].id = "pipe";
-	qmp->pipe_clks[1].id = "pipediv2";
+	qmp->pipe_clks[0].id = pipe_clk_name;
+	qmp->pipe_clks[1].id = pipediv2_clk_name;
 
 	ret = devm_clk_bulk_get(dev, 1, qmp->pipe_clks);
 	if (ret)
 		return ret;
 
-	ret = devm_clk_bulk_get_optional(dev, qmp->num_pipe_clks - 1, qmp->pipe_clks + 1);
+	return devm_clk_bulk_get_optional(dev, qmp->num_pipe_clks - 1,
+					  qmp->pipe_clks + 1);
+}
+
+static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	void __iomem *base;
+	int ret;
+
+	ret = qmp_pcie_get_4ln_config(qmp);
+	if (ret)
+		return ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = qmp_pcie_parse_dt_common(qmp, base, "pipe", "pipediv2");
 	if (ret)
 		return ret;
 
+	if (qmp->cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
+		qmp->port_b = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(qmp->port_b))
+			return PTR_ERR(qmp->port_b);
+	}
+
 	return 0;
 }
 

-- 
2.34.1


