Return-Path: <linux-arm-msm+bounces-108655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEpSF/p5DWqfxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:08:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E658A6B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98E7D3006B49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113C53BADB6;
	Wed, 20 May 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyYLx734";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjyiShJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8A3BAD9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268062; cv=none; b=lCw8IbfwS7+tlyfh+lTzbmjz1Eka5/kaN3etpUyiNCo39ClVyfPJ8uTavXXJuS8ugDpld8M42sRvs/2NCU3Dlrh9QGBFIV6mrfP8/zYaIxb1bF7Md/5laHXob0sB/DekFJ/KFvqhf3rFiL9qzWFbwLyjx4Oqw1HammB+JbqHpIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268062; c=relaxed/simple;
	bh=vo9QszaRVCVBLynmMk2Tlo0NH6xJ4ftEm46gUfYlE+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=go0Gf9p52rvdAWdW1n9p0drKNpL2GhABVqoAvqjMwh+pi7dwyavLEJ5nNBd7wRhQXq+hV37I8OTHWaJbKf8iskTM0FTIkWiMeZXQIVTbDICdp0OFpG9RZo1OT9euTGublWp+xsQAZ63Aw0+rUcttthE365T/ddYrnI9siR/DNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyYLx734; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjyiShJG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6qsZO2143786
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhUsGD2Ij6JrjuwQpUKSKSZDLzGC8nTynYmL00kksfY=; b=pyYLx734wvdTDEjn
	eapAre0PHFOkv0lyBh10TmY+vlamvFnytEFBhxHUZginb1a0U7sEaHDpMVu1c+FE
	F28+ojGyfRyIi6mMnpvANYltcNm8OSQhLn/yUUryEQyELv2EkDD/qFF4NEUSCQl/
	Gcn4Oh99ytDgD5ZT/D8Fmb/PMp3bxSe1ecMpY4FpA3QHoyYvEPk721ROtBAuWf8H
	iAEdiVh8M3jYR93HIlf112nvegmU+mYJtauGgsJZNre25b6DtGbWWD2uRfcBmgh+
	fIFa0HmqoJWnmGGbqfnP2h9yu7SJW/fuY9EGwZyaJo3pig4JY4TVzbJiZFpgO/UM
	oLIZmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tkykn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso10119232a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268052; x=1779872852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhUsGD2Ij6JrjuwQpUKSKSZDLzGC8nTynYmL00kksfY=;
        b=XjyiShJGIPIxRirJKuAN6fmP+Mk2sYSuvWItqGyZDUm5F/89Rg9TfNe1Jh4uv09EcG
         6chLmD6YjrGzQg9233vKPBra1zy/cQxSAlvCPT2v+gU/0hVmhCJlOK5TXxkjiThHWHNk
         mMp+i794ZF6kM86VMcusbeAPp+DTbIhimx7ZIarLyNZaJo24jSDIIkYWwbGAlacqYxy3
         JxUy9z+nxaNNh7lssMOARarY72Eocewqg0A1sBaCBQ4fBg05jMB2xpWHu96zW2Z3K8mW
         IDMeLx6P6HShr2SZRPpYEOexrx0E9BrLk54lOaNIi4OH3glhGuafkFxX7r2yEN9AUBkr
         +B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268052; x=1779872852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhUsGD2Ij6JrjuwQpUKSKSZDLzGC8nTynYmL00kksfY=;
        b=JuNQFldCdJbwtPT7z6wnhg0V+5K5az/+NXYGktbaNTaxfTaU0rSJApk/S4Tmb+/gxU
         yFV2/TxCoHuu5RNNjNZK9EjNSQo/X4RY6yVckFTXKd+FcutMzLYz+ZM3hWpHUr2IQVxy
         8JADFp4KI92c8nAEV3VpjabOItHG7P7wSQ+0gi7JizgAYSOPJfeKBfrG2XR1VFSB2/Ur
         Hw4YwZzs1OU3UfjWfYVRwP+EBeEMvIZXZD+GYo9fXoxXvB4HcEuTMksUPNYNicxafZZY
         jqnDbq2Y4ZzC6z7up/3PriQdRw2oMf+WjK6kJkxMO5drRtrRY4fOr2wE2uNS4ucGE4N3
         7KCw==
X-Gm-Message-State: AOJu0Yykxw0uwP4vU9rrpEz0gJBygKOqlkIYA9WEMGNt90SfYRdrajR3
	4zuocs7JX1ScA5RH223c4jAcBV/X07H2fsiKVPfym04GUCZTJ9DMRpMlo3kgYS4TVBfKQueBAGZ
	1DOf23yZGN8PeFJtBAB+c32o6botkYog5LYCkMGwVOVFGh76QxgIudOGZqQ6gUi3Dsn4=
X-Gm-Gg: Acq92OH1gASVVNtd7TWJYpk6jEhvVykaEEYeXuL60KYVJxGfvbtrlQeWFEGfHguyf0q
	43xUMomehdbSbjJNJdfiWvYAHUUTEA8CUd0MVEa99SCHA6KsXe5iO9gKO+zsINvE8bw2hAOnGSU
	9azCHcGjdlD1uMg5Z7mQrD5KreyY430P+JZiHHPBzbcrdIEL7ZlsSXBWI6fTLByTOK6l0DBASBL
	i5VhsnxsfbgMRD9wD7amRzAldQLuiE4ijVU6fOHq70YCq4BRMsssncsYMcPNQOUYED+ZcQohs+V
	8VKA2LrWTs+x57Saz8IFZxrznAsPOIDymfQUBqAm3X3FZqfB3YAul0YL+5KZlITpehuvyz5xP0F
	DaHzopGExtl234jXlwxtglN6q9SvR4FMN9UlNmfQOi7Fo8Mxf9L9s9UDfF2It3g==
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr23314342a91.17.1779268052168;
        Wed, 20 May 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr23314303a91.17.1779268051647;
        Wed, 20 May 2026 02:07:31 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a8612sm17079903a91.12.2026.05.20.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:07:31 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:37:12 +0530
Subject: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779268039; l=6127;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=vo9QszaRVCVBLynmMk2Tlo0NH6xJ4ftEm46gUfYlE+w=;
 b=5oRumBCBbUQiupUigj6X/K4pwShmcJcZu8NFnst5iC/MrZgyo6e+UoBVpLJNTk9JHbmssG1UE
 gO6dez28JwtAaRgcK6iTYmLXbJbbei3eeXiMA8IkEfhMz+18eZ1eme7
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0d79d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xNrmRdIuzdWpR3jzgYgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rpRCpyG_g7PWn-zeV8QfIe3ikEKmjqgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NyBTYWx0ZWRfXzkHeYU5Cj0A8
 ZQQFISU4/8W/PqESf2jb1LLgfi+0m1y717X+RApV51u89vAgnbgJKnMYTxpAcnK8XuZ2no/9/7k
 tNWUzzf4EaichS3Fsw83d81c+YiqtSgVZE5VT/qaMCH1xNr0dNPFzgRaxTAnIO4/lUDmV8lFTvf
 enPybv2KrzFb6BY6+mJHeritXZLpJAdJkX9Suko1nKPTQaRRFd7m7BUr7dRH2Hb1bHNdPyqFwXA
 jDgg/3hphXjHDNQirRav+/MVcR+2NqZOEDWxkh21Quh/8eG5iKsC03+7F1d/apLnR8MR7DWd1G5
 R4kvt6E8/ETzfuF6CIwI1vmNg5PAZxO1WqMpLhR75kRre/+zcL9YIJwRs+FPjaqxspnm1Vr1y0r
 2hF24wYG3SuHJuOV4o4RmC1OM2g1kggsBfEnA4Tj6ZRZn48EiFbgfqRbb1YG4aKQdYRX1zJvbYy
 u66AGZExOCxHVsd8DtQ==
X-Proofpoint-GUID: rpRCpyG_g7PWn-zeV8QfIe3ikEKmjqgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108655-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 027E658A6B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PM4125 PMIC uses a different register layout for USB VBUS control
compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
a current-limit selector.

Introduce per-compatible regulator descriptor data to accommodate these
differences. This keeps the existing PM8150B current-limit logic intact
while adding a dedicated voltage-selector path for PM4125.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,10 +20,35 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM4125_CMD_OTG			0x50
+#define PM4125_VBOOST_CFG		0x52
+#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
+#define PM4125_OTG_CFG			0x56
+#define PM4125_OTG_EN_SRC_CFG          BIT(0)
+
+struct qcom_usb_vbus_reg_data {
+	u16 cmd_otg;
+	u16 otg_cfg;
+	u8  otg_en_src_cfg;
+	u16 csel_reg;
+	u8 csel_mask;
+	const unsigned int *curr_table;
+	unsigned int n_current_limits;
+	u16 vsel_reg;
+	u8 vsel_mask;
+	const unsigned int *volt_table;
+	unsigned int n_voltages;
+	const struct regulator_ops *ops;
+};
+
 static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int pm4125_vboost_table[] = {
+	4250000, 4500000, 4750000, 5000000,
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -32,19 +57,43 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.set_current_limit = regulator_set_current_limit_regmap,
 };
 
-static struct regulator_desc qcom_usb_vbus_rdesc = {
-	.name = "usb_vbus",
-	.ops = &qcom_usb_vbus_reg_ops,
-	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_table,
+};
+
+static const struct qcom_usb_vbus_reg_data pm8150b_data = {
+	.cmd_otg = CMD_OTG,
+	.otg_cfg = OTG_CFG,
+	.otg_en_src_cfg = OTG_EN_SRC_CFG,
+	.csel_reg = OTG_CURRENT_LIMIT_CFG,
+	.csel_mask = OTG_CURRENT_LIMIT_MASK,
 	.curr_table = curr_table,
 	.n_current_limits = ARRAY_SIZE(curr_table),
+	.ops = &qcom_usb_vbus_reg_ops,
+};
+
+static const struct qcom_usb_vbus_reg_data pm4125_data = {
+	.cmd_otg = PM4125_CMD_OTG,
+	.otg_cfg = PM4125_OTG_CFG,
+	.otg_en_src_cfg = PM4125_OTG_EN_SRC_CFG,
+	.vsel_reg = PM4125_VBOOST_CFG,
+	.vsel_mask = PM4125_VBOOST_CFG_MASK,
+	.volt_table = pm4125_vboost_table,
+	.n_voltages = ARRAY_SIZE(pm4125_vboost_table),
+	.ops = &qcom_usb_vbus_pm4125_reg_ops,
 };
 
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct qcom_usb_vbus_reg_data *data;
 	struct regulator_dev *rdev;
+	struct regulator_desc *rdesc;
 	struct regmap *regmap;
 	struct regulator_config config = { };
 	struct regulator_init_data *init_data;
@@ -57,27 +106,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
 	regmap = dev_get_regmap(dev->parent, NULL);
 	if (!regmap) {
 		dev_err(dev, "Failed to get regmap\n");
 		return -ENOENT;
 	}
 
-	init_data = of_get_regulator_init_data(dev, dev->of_node,
-					       &qcom_usb_vbus_rdesc);
+	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
+	if (!rdesc)
+		return -ENOMEM;
+
+	rdesc->name = "usb_vbus";
+	rdesc->ops = data->ops;
+	rdesc->owner = THIS_MODULE;
+	rdesc->type = REGULATOR_VOLTAGE;
+	rdesc->enable_reg = base + data->cmd_otg;
+	rdesc->enable_mask = OTG_EN;
+
+	if (data->curr_table) {
+		rdesc->curr_table = data->curr_table;
+		rdesc->n_current_limits = data->n_current_limits;
+		rdesc->csel_reg = base + data->csel_reg;
+		rdesc->csel_mask = data->csel_mask;
+	}
+
+	if (data->volt_table) {
+		rdesc->volt_table = data->volt_table;
+		rdesc->n_voltages = data->n_voltages;
+		rdesc->vsel_reg = base + data->vsel_reg;
+		rdesc->vsel_mask = data->vsel_mask;
+	}
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
 	if (!init_data)
 		return -ENOMEM;
 
-	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
-	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
-	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
-	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
 	config.dev = dev;
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
 
-	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
+	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 		dev_err(dev, "not able to register vbus reg %d\n", ret);
@@ -85,13 +158,14 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	/* Disable HW logic for VBUS enable */
-	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
+	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
 
 	return 0;
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
+	{ .compatible = "qcom,pm4125-vbus-reg", .data = &pm4125_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

-- 
2.34.1


