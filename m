Return-Path: <linux-arm-msm+bounces-115638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dOoNG/zrRGry3AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:29:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D396EC26F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:29:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U+USePLe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NCJDXDAk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115638-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115638-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4CDB3022F6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6052A40682E;
	Wed,  1 Jul 2026 10:28:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD054219E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:28:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901722; cv=none; b=j0IGnryGA2sm7HFxzyqEGF1jc9JoPKJjDkOsIHlBtXP7fUX4aRCsFFX50sZpEzGNEh2QSkRyUy0vgTrIiypkwiBO9hc+w3TCA2lLHgFFWuLzsmhCrNNX5zNBK1pSbZ7d9PA8RN/0t2W0eZv+w/XhFwVxGJZNqvumMlJCNC4Z1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901722; c=relaxed/simple;
	bh=N3sK8QdN1h49ymvlU+Bd7WA37xj8CiHWGmjsBWknyz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=geHZSqXqDDln/1RsrVNBNF3GPBK2bgQBCJD8w7yHvbPpM1El7dqsKqLZGm7jsIcl5VKrFEEeApH0xFOOMskEBQoGJCoyz2bowvvueIcLRJl2qTNQEHZQgokcOcK6hKFPlgdd9JwKgsrVU2TyHBm7Gx7WuK65O3eiIDoIKA0PSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+USePLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCJDXDAk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9Kog722675
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56jDefRUI9LpbCl4zNbXyP6AUzMmt0ZvU370B9cHD8A=; b=U+USePLeDxLVNMDp
	hTSpZTj3UPjXWm8IQX5HntuY1bTw5gCbJNjbsMnGKd2WC9TcrfsoeeU9MPTZT5mE
	pdWM0Hs7pkVvIdpECrQx1g7NFncqQwO3W6fE6hHIVrVBhXII3UBYZF4bd+X2Y9J+
	CdO6ufhZ5EH4rvVS4KzOZBfyYd+v8VZOYipYwQEvuz6sOHr1U4FQ/98ajimIGu18
	Q+IyI5j6TsN3YqDnfBMyNh6KjQwQJtYc47pADw9ZKCbBo58XtUSIr+7sN0VJmD2X
	0I5+s4XxuT5EsWVUMgjo8uqKWBnUA/sR1HRs2BeQu7b/mb/FM3hCrydzMySfreVP
	TVxhQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbhat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:28:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so594360a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901716; x=1783506516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56jDefRUI9LpbCl4zNbXyP6AUzMmt0ZvU370B9cHD8A=;
        b=NCJDXDAkTLhpGeTGlURXFpKdRjnp4YJlcn6+ySLbJ+X1rFA53+7s5GgskL9CeYK7w/
         4j7o1phisB2+3O5K8LPPWOwktZyyuW0sHjncOQCn3+1BGR/gZY/3/FHUjBNaVCbxFhqt
         Q9/GXZjBMcZwVwtbeXKs1N3jyXeBfhbvnQbqHEj/9vtMddcPALXET18kqvgU3IyWD09F
         2uEPYm5gTOOAl8iQ35ZS6R0qhNzXxJ+b3JDw1ZuYCEeAcElYcZjDu5gbtPM7MGGZ1Non
         LA9p3JX2IKjMuWThgqQ0l3MGMUXiKp9/zbfR01x2mNs4oyF8P9DZw3KfORmV73P68tJd
         QAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901716; x=1783506516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56jDefRUI9LpbCl4zNbXyP6AUzMmt0ZvU370B9cHD8A=;
        b=pQ4FolT94WT6lVOG3ZR/sZv57vQGsdxjStwJbaCfw1d+3xE9RlfrizEQ6LRSaYSPiv
         faOb5NIuEsaMsW5YQi/OS8B5Lcy0vOAzxUpyllXUlpFJYY4gLyDbUj8XeAe57qSCSZWo
         iD/TB7dPFq291eQisXluMupPHUiu4eprtqza8VaIuax4qdKhlhM/iBLv4ZGPrs+ug+Y8
         W5QuotrSrluUjSGuiHeUMOSyodLVA4lugST8QvKw+CmW2ATfeJrfhePJLQ1hb6QxmMzk
         YTmvu9FXGXzyrJk4X0cWsIniDuilwovIi1gkvrinIE5hmYABj5n/9IOywXccm6jNNQPP
         jBfQ==
X-Gm-Message-State: AOJu0YwvDJuWXHKPxt69gtuvQYlEA2jtTZHmt0TIPnWHwYfKjb3f/phk
	SuT+fmaCu2EpAq+zxgxddeuZQbGojKMqyu0DmrfFSSeWcCvjiNcMqdKXk+Mlk7VGRl0g4SIo/ww
	MDtiDuSq6gSWOmouwWnB+4gg59jnfg0FLwM8kjykcEeSGVruGHueED81uYgcYw/ZcoeI=
X-Gm-Gg: AfdE7cnyjwwJwdilNeYnm78J3LqIeG2meZJfDoDGBABpRa0098hzqXirUzUyuh0Hgv4
	6MJHlNi9j7brXfHYo7HivChGjdCKgI67v16s4ABVshXG2/e3H2CEqmgxX8pICWPTjSqZIf0anp3
	5sUIN4HjAiEKF5Ha8HbR8Hy/744LKuwr/LICJ73/h22Qetq0W9sRGBkKuvupRCAhOA3rWZj+6nL
	orscPhPby0k7Di8sQm1Pmhg1F6DyOVHmAx1g+pZVM9irAqYk6w3nuhtpMNkdPEjsg4jpmGrwvY0
	HwIkyK8TO8k/y0aEMwBVQs39+iY4rOn8gZhppm7qZlfNf3noE0z4BZQRlIeiSgO+j7pI9PzWBb1
	gwDIv6o44dkjUEQl6g/71BJ9M27wWvG/GFUil0KFU
X-Received: by 2002:a17:90b:17d1:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38069c54d60mr4223400a91.13.1782901715874;
        Wed, 01 Jul 2026 03:28:35 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38069c54d60mr4223370a91.13.1782901715311;
        Wed, 01 Jul 2026 03:28:35 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:35 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:58:04 +0530
Subject: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=6127;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=N3sK8QdN1h49ymvlU+Bd7WA37xj8CiHWGmjsBWknyz0=;
 b=v156YdLiUZ6ExfdivTmm49Oiz96fY2slFalyeayWjz8fIrfQ5+hIgZNnC4cQv0Rt/3yntiLDZ
 JFnhUbbAfydBN5MpylnbU+hvvJMCA4jpjXTporW9jB0Ygv1PrtvgsWd
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: kYnvQb3K3NcU5I61tXFR6ZjQB8MyYjhu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX29ZLR1iJLRKB
 l1dr5oshgf58TwHedAxdhPMvU9DLcqmlIWJpXNLd6JUlieQTvc/mUhWvFrs2qdIu2GHcLPTdnVH
 blkS80ih5cnO/zVjSP2xDdCXlf24Xs8=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44ebd4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xNrmRdIuzdWpR3jzgYgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: kYnvQb3K3NcU5I61tXFR6ZjQB8MyYjhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX/BoTNXxOEHE6
 0KxZQHoQGYRSRo3JlPoY/o+jz9jKF3BhJNH1pGguM75jakEIKeGxfaTn3pFScz1IzQrwXYU7Xc0
 ws2SOEoShukLpmTz2bs5PXYO6sLK+KbQYfwxHns2rtBj9uP9De5Qn9C69EF4Xtf7ulNpfnDjAVi
 Zz1Zxv669INscOG7tnIIIuRQmvhb+fqGN25JK41uEiHt8AJVVt8VJSMe/W0z8VOm01Ddhct+P/Y
 KM9j/U9Pp3OsqffYuQWQqjTYffmeC7PyvECSWSsYxCJVpM6UTzYTaYxeSwT2m9Er+DpsZZ4qhae
 u3KrKfvlAQkG++/BqXjyxDeYv4et+tB7JnLeo8/iTCC9Evp35XdlLNDpJQzzMp0lI5SmwyEjD1p
 R0HWtVEjxF47Ecn3TGEl2V60tiTEZHEZYigq3if3J3APjIojzFsT56MTjVpwztqs1Xi33jQnWGB
 C1BzuGiRcT5i2UEdOpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115638-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1D396EC26F

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
index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..40e7e5589d5b499b2e84a00b2cfa754fba7e2f0f 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,10 +20,35 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM4125_VBOOST_EN		0x50
+#define PM4125_VBOOST_CFG		0x52
+#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
+#define PM4125_VBOOST_CFG		0x56
+#define PM4125_OTG_EN_SRC_CFG		BIT(0)
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
+	.cmd_otg = PM4125_VBOOST_EN,
+	.otg_cfg = PM4125_VBOOST_CFG,
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


