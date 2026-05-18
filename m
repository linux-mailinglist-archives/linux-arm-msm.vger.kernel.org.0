Return-Path: <linux-arm-msm+bounces-108209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF02BYQZC2q9DQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:52:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33856E08D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8365301AA95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26D448A2D1;
	Mon, 18 May 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kT0LVwrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDVs8GKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99BC48A2C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112213; cv=none; b=YCeW0nOABhTwExrfjQvwXvSMK4yg1Xf7yN1VMBdUGKVRySZ58G/HXzNJLbnrn+HZCzhWWOG+WZGcCGnfYHZtQkgZKEXNKLERbjN5Xzd70FQJG2dDb9tuAv6pQNlKDqmbuaBbATRtCrkUGQn0YepvTdrwPmSaQRuyiJub14fYhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112213; c=relaxed/simple;
	bh=1aO9ExS/iJmtGN9nCkni7bF7YETFRBmThZL8SJD8tuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fA0yoZ8uQrvcQ0A+JabVROhVn97Qz9DWHqQQyvtxK2JHbxx76jSllPg4xv7eirqhfHBtuAwHpCQLXRIVhtPB0aIyzd/VGQa5uNUjLCjb8zfkqrB7Kf6dWZ0Zb6AdhS9uaVG6xweaZS2hYcOxdD3ciB8raujNVEka/pHWlA8ihYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kT0LVwrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDVs8GKd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHQ5S2482375
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy1Q1E39uQDwPqLscloGcfc9TxMS8pJ/zjTeEJF4xLo=; b=kT0LVwrSN+sVtjuw
	28QFrVHnMNMveyFVSKGzXd0gLwOm+VTXOm5TLFPFynXGAwVAc7jEY+6UbiP0DeZB
	izyR/W3KZtGHH2Y9jZnFYQyUATk1WEQ7EmuebFIp8sF7UWhYUrm9MioVS6m9Y+ge
	IfflbPt2vf3o0cE+lUIxDDTScy7DxdAYeAq9pDwWwl+eLHO3+KP5d4z4B9ou/cQK
	Ev2/ThgIZKCoxp8dtCzNIcwT8wCJQ9b/ksDqpCxX6MNnkcablJuq70zh+aN6FKk3
	4vypXy32zYRlK8r4IxrpTqU3aObOi3gXp2FSmx0CB3CA38z5ytAD79d3oRiabVBj
	A182lg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvghxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so2270102a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112210; x=1779717010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vy1Q1E39uQDwPqLscloGcfc9TxMS8pJ/zjTeEJF4xLo=;
        b=LDVs8GKdUetFADE0ONQ+jk373MP9TdTMHbIPphkWa04CR5J3z3r6Kv0Mo54zGa8+QF
         1Nrybj9CKHhzFGEFExAt2w1l2mIWYbcCIO4qUAnVbtx5IsffxZAFdUt5mmf8w6ABLVt5
         bipSvIfOez1CjbiliiQbfPZv6XgXBu+xH2FjCl28Y5L6xwaJXFBEzxxBpHdW0LBSTVeL
         TpTSuCEVhXlOFShaLXnTzSJT4E2k6+5vhZ7h2dR3MWJ2Ag+Lnf4VCrigymGnez755OSz
         7a8/d+pUh0pR4amAtZ0T+ENMZ4FxTyfgzEafjCzJ3qCEsroETPX7jZg6Nqq30HmTiFao
         Nvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112210; x=1779717010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vy1Q1E39uQDwPqLscloGcfc9TxMS8pJ/zjTeEJF4xLo=;
        b=TtizKSadK0ePyJNkpWweTg5msHuywIkUv6RsbKoYSZRt6GmBNOgAmTKtswX5K5Kmmj
         1bFWL3oXsJlAuvIJE6Cakfw4VHYUQAekRGd/1KwwNl8HjquOO9EwisIAgxU4WyICzzHu
         ZNHtXBcE0uNhUWLERxKPx9pOX1/c8JA5e9V0agTt/Jk4fEAFNoSAlxzzl9lEsBg9sqaI
         2HFqMzA7psNwMSjd4UPKXsgdOISJ16L6Qj35bJPhQ8YKqjhXVDmt2iPN6dylJq4uVeuU
         AOMrOYCT1KSaCByRTbugCzCRKg50RBxaaM2eNOaJfyMh2ACL3Ab8FFoHqF6qdeGY3WJl
         7J6w==
X-Gm-Message-State: AOJu0YzGG79jOgNFGOTHiBIznAmqk9outazmmUIoii+3mw1lwcIePZ6P
	lZqzM2Tiy64Jp3ZpZq5CACkp3b84rmIVbF7zyi1vK3jL36DPNKpff5ZVD7ccUeY6Ogx4oEGSiZv
	kGgXJoAZxeXYbZaeQBBPqtxY3XyOfwojL3tGI0oSSsvFqWRDshwsMc0zJgaWGiZkmSthZ5OZkRF
	E=
X-Gm-Gg: Acq92OF2td8prPz6mBkBftS607AAFCJpzByP82ObXXO9iv6nSAXyKkHNo5hrO1rEzH8
	vnGTvLnIaPn6sWtWKIJvC8WK/9cpVS6wnlK+MBXlfVLOOKaU9Ni4N1i1RtkaX5ku7OaaN4dGkIi
	LnutX6+oRK5/XUiUZsLjNdv3+L7AeVhKhfdXU+7WYKAYefUZ9MSzHqTqZvLRmUsEkDOg1iOxWIM
	7jgkWkDRyotOEHyzkx5cYeojTlqpyj//DMWPQtVC4rb8J5IgbdfECFmuDEiJ8FZusB/vOfr9yZ9
	/tQcASeD5fTNIeTlMkHhMHAuf9fehSKFrtHuETB90nPb1XYE89cprdKe6SIQfN2ZCHQiDp3Ux+M
	pjHs3iS6emsO1rvoOtYTGUA80TqM6Mnxw37FqZXPcvrI12kg02YI=
X-Received: by 2002:a17:90b:3f8c:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36951b82f77mr14930686a91.17.1779112209651;
        Mon, 18 May 2026 06:50:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36951b82f77mr14930656a91.17.1779112209139;
        Mon, 18 May 2026 06:50:09 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm185411275ad.21.2026.05.18.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:50:08 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 18 May 2026 19:19:40 +0530
Subject: [PATCH 2/2] power: supply: qcom_battmgr: Add support batteryless
 boards as MAINS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add_dc_in_support-v1-2-31fbaa329879@oss.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
In-Reply-To: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779112197; l=3154;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=1aO9ExS/iJmtGN9nCkni7bF7YETFRBmThZL8SJD8tuQ=;
 b=4U6y2t24JASec3FhMnbBc0UKbrhU17JX/1kC6ZyIjsBlbBhqAUOuuA/JLvK4zBv0uzCDOksk3
 UGxPCewnuF8CQWrCslsvgOwmJ96EW5GNU8mamapnOjooIqjJTfXg9Do
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfXz2W6AlFKlLkJ
 NlXAa+WFRSgNHbSaBgQKRDpKesDdIzbCZ3AjhEwvY+0mWhAZRb5NUVwhmW/CaYufBCTO2IjTFZL
 0MJ6eIJo4B9VmenRxrNCsn0TP4YxSfXQSgxOSoi+DP7xD6I93hko9qgasBVkhRSiEgw3iiNd7bk
 t3lnqNRBXCU4zn8M0+drkpK7R1wwQxqWd/nGCNyDeRSv9cxjkAJ0RJ+Fi0RaSKkC1xG9ywnBehJ
 lxjvzT1qSWDrNLQ0cqdoBaU0R1VwKC/e9/H9hekCmou3Q8vb9b1XaAIhKuYfpseNHCTGgKwYwOx
 Th8/a+2XxaEz7g7QRgoHCpnoYiBnuNHGZ/CrpjxJHNz/OYlUDs6oG/ie8QkdOFKLkAFTMlXZMXs
 BvnZ49o0TgEjqATV/l1WhtRP3IpUSfLFdeMqTqkdjnvhMYz0HwokmYsVVf7wbtOjUQW5Sa2OzCk
 645+g9IG6wPSzMji6uw==
X-Proofpoint-GUID: AxhBvhOxCyldHrxG4Rd0KXt2Bh6E6Q1L
X-Proofpoint-ORIG-GUID: AxhBvhOxCyldHrxG4Rd0KXt2Bh6E6Q1L
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b1912 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HqcgoWIX0-uhnNlxQ_IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108209-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF33856E08D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the "qcom,batteryless" device tree property.
When this boolean property is present, the driver registers the power
supply as POWER_SUPPLY_TYPE_MAINS instead of BATTERY. This prevents
userspace from triggering battery power-saving sequences when using
powered by 12V adapters.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/power/supply/qcom_battmgr.c | 47 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 490137a23d00e97a9e6ced21d1e66fe637db6c9d..35d266375d8c46b161a64f9c2a8c6054dc2211de 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -332,6 +332,7 @@ struct qcom_battmgr {
 	struct qcom_battmgr_wireless wireless;
 
 	struct work_struct enable_work;
+	bool batteryless;
 
 	/*
 	 * @lock is used to prevent concurrent power supply requests to the
@@ -930,6 +931,47 @@ static const struct power_supply_desc sm8550_bat_psy_desc = {
 	.property_is_writeable = qcom_battmgr_bat_is_writeable,
 };
 
+static int qcom_battmgr_dcin_get_property(struct power_supply *psy,
+					  enum power_supply_property psp,
+					  union power_supply_propval *val)
+{
+	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
+	int ret;
+
+	if (!battmgr->service_up)
+		return -EAGAIN;
+
+	ret = qcom_battmgr_bat_sm8350_update(battmgr, psp);
+	if (ret < 0)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = battmgr->status.status;
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = battmgr->info.present;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const enum power_supply_property dcin_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+};
+
+static const struct power_supply_desc dcin_psy_desc = {
+	.name = "qcom-battmgr-dcin",
+	.type = POWER_SUPPLY_TYPE_MAINS,
+	.properties = dcin_props,
+	.num_properties = ARRAY_SIZE(dcin_props),
+	.get_property = qcom_battmgr_dcin_get_property,
+};
+
 static int qcom_battmgr_ac_get_property(struct power_supply *psy,
 					enum power_supply_property psp,
 					union power_supply_propval *val)
@@ -1652,6 +1694,7 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	mutex_init(&battmgr->lock);
 	init_completion(&battmgr->ack);
 
+	battmgr->batteryless = device_property_read_bool(dev, "qcom,batteryless");
 	match = of_match_device(qcom_battmgr_of_variants, dev->parent);
 	if (match)
 		battmgr->variant = (unsigned long)match->data;
@@ -1690,7 +1733,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
 					     "failed to register wireless charing power supply\n");
 	} else {
-		if (battmgr->variant == QCOM_BATTMGR_SM8550)
+		if (battmgr->batteryless)
+			psy_desc = &dcin_psy_desc;
+		else if (battmgr->variant == QCOM_BATTMGR_SM8550)
 			psy_desc = &sm8550_bat_psy_desc;
 		else
 			psy_desc = &sm8350_bat_psy_desc;

-- 
2.34.1


