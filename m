Return-Path: <linux-arm-msm+bounces-108905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF1AO/ZbDmo4+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:12:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109059D8E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8512230AFC04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559182C15BE;
	Thu, 21 May 2026 01:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeTJ0U3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3yvDGuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99702C11E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325800; cv=none; b=ZoMYijM2oRYv6XJv7jol9sbpt8O2RNCAyKaXBIqrvIgARkZXNxXKjH95PjkWI9BiD4hixcRvMmGS46ITgCRVValdfcpD9MbND6OCeitS+j7NyB4XOzii/9DLhe6SV2lcGOyyExUv8AHaC2WSmfyjt4yvm9IX8wJJxPG74UtFElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325800; c=relaxed/simple;
	bh=RFXz2fENqdLVWccMwug3ybapgQvtvrvDR4bLa4G95Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUcafH8GFGS2jiOKfneGW/wJlWxi6LYIbudTj2iMOsz50sn5gKTDyi35DZUKpJ5+jrC+XrWay5EcL5CVLnr0PZmRs20FW8YvLXqY2TjTsd2oqhhpgNzcKGSeJ12kM46y5vKsiwwcRtLhXNEzW7PSSsC1x2at+9C7duPcxv9xPqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeTJ0U3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3yvDGuA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGFteh1177853
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RAFhQHBj3Lj
	iJryw0ojmCoWQ4BfJtI8S4Cf5s+zUFFQ=; b=AeTJ0U3lg2EM6QPLXxU6coHV1f4
	ecTy3rgtK9Ufuw3WIyRN2h9RxTGviqISV83pGohZJOgSdKohtUGKqlCwDfiRqOCO
	/I/8e9JjxyhKzTUtDYdGhees7Oj+g8RzaYrYkfpk5f+c/luRyjCqtVgnA0tcDdzE
	Ln4F7zwrFjFP9TypYSVp6LFZGvUnEaRCRP2qfyk2pd/I/ig5H23hOwG/lp2OCNUp
	oQlz/nfC9KLaGnS+pfrZgVZxEY9dmLVvLdjuG3J2X7QCexvRrMf4bJEd2euCyLvR
	/R3fxd9Hg6QK4IkSidR5DjqidFiQwT8sYzW73ooL2/k9vIXrmseAf3Nx5Ew==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6u9b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:57 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7cff695e4a3so53528487b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325797; x=1779930597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAFhQHBj3LjiJryw0ojmCoWQ4BfJtI8S4Cf5s+zUFFQ=;
        b=E3yvDGuAH1Ue3g4E0wRZfb6NM1cOBIC0Xylzs7R4EqRLaEtTg47GVKje9bZ0D2awTz
         lWMLq3b2GoPwMbGmHXLdwfgubRRdpfjRDLpgVKOhiWH/BvSNK5wUejp6oizbCNzmgI9/
         iiLIWrFkCFbjfXsFOhYVfuKeD7cmBO4/9deapNIRH5zPmJ+eI6WAR7QBEQSSYqMOZ0Y2
         jA4KsGklmunOgRmOY+dP7hmf9iR1dZtkBIRlxWcTHuVu+D2j3ZBt0+l7baXujBqxXbQi
         SY+NAarOJ+D1EIvpm2hC5hx63TK6vCso2H6eu9p1hPtUu+pW0gVBKd+3cwd0S69Gx3dL
         EcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325797; x=1779930597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAFhQHBj3LjiJryw0ojmCoWQ4BfJtI8S4Cf5s+zUFFQ=;
        b=GAjAo+HYpasS+M3sCj+liznR1bZ1WzHuIiD3JcZV4Jd3F0vPPIAO4+Np4HNDbMBeZ5
         qpS2H6kZ0UGaAolKWef4r0us/pYymSwh0QpoPotrNJqEY79sfWhDKROuWQN/fVuULWqQ
         LUAvoF5qU3d/Zohjd0OYnZ7JBFaT4j7u50B/NK7/vOd3cNhoW0mQKpba+LUaWWXrp/T/
         Zu/Vn8uIiERk2RdUqWtzavQ3yTvwIqGrtHi3Ef2J2oAm3TClSGinIgsyqz7jvyTWBLgQ
         2vQ3HiYhihV7cdxt4b7LpJJuVNEUnL8H7IxVHJr5d0+riyfyF1a4eLUJQeeyt7QHGfuJ
         67sA==
X-Gm-Message-State: AOJu0YzV2zEgwvg4jeHDbZxIE6RpL4dxrRWLkbkDTLnqe1JdCjsx9T21
	bOQISOQYVPAXrN/rUb/H0W7Bf4iSINN1N8JboyaHXfTEi9FKZ9ueszKfxiygpxiNecI/BSRSnry
	y7RhcYg+QX4NslNNPIPSg50LmDaj8Et0slk69KSG0tjcCD7qJ7TwYnNonEQxikFziD0/5TREfV0
	o4
X-Gm-Gg: Acq92OFGK3QTgoPqJ8XqIFzWPID8HwczdMbigYOxosAPcI2idejo4TpPqQM1LwLmv1r
	TDDrvriC6rPYMN9I4UwMJ4EUbJeCBf9cDWD4kTcJ/iSrgCzSgGalWHwh96o3mG8T0Z3/wM6w4Yj
	jsZIwARIYgV4wXDo/UEnQ/sWiJa9QMxAvmsnIjiUFN3HZCnrkGctyUOiey/fVHBdOESPSiChGpy
	ms3TTQ/RrNkUv42DK7MwyHsWxVg7RAN6MZGluGtN98xDTe5+Suq7ykr55+40kmS2gb8T7Vnodz6
	b8flMhXvN60D9UzI+dBuKyKJ90w6BHvARn5brMj5dB9vwYxJllcASB20GJ40wJx5ck/PAfzEw7B
	Vy4+WCbtWpR5b9MbRR3zJmsn2uPgCmparegMqYFoFsvdS1vXqttai21Yx7WJ4KyNyoY0icDoxA8
	6Vrom7O3nJv0tR2bs=
X-Received: by 2002:a05:690c:498b:b0:7cf:e22b:fc49 with SMTP id 00721157ae682-7d20c047039mr8476437b3.31.1779325797073;
        Wed, 20 May 2026 18:09:57 -0700 (PDT)
X-Received: by 2002:a05:690c:498b:b0:7cf:e22b:fc49 with SMTP id 00721157ae682-7d20c047039mr8476247b3.31.1779325796610;
        Wed, 20 May 2026 18:09:56 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:56 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH v2 2/4] phy: qcom: qmp-combo: track whether the cached typec_mux mode was committed to hardware
Date: Wed, 20 May 2026 18:09:33 -0700
Message-ID: <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fFdLy1y1zEzMUEqGPMwYLRLYEemjzRz8
X-Proofpoint-ORIG-GUID: fFdLy1y1zEzMUEqGPMwYLRLYEemjzRz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX42R1EcWfsHoG
 KwBo9sy84HhqYhbFNqOM9IUUKp0Yn6H3pCQapOpmxBV13/wHYYm6iUtkbWNrokvndvtrJ6boOrJ
 QGcD+HL4LK/kSIf08LaNnlBPwlUQHjLiLAuD/OSa78uALwSZitBvGzXX59OG9Kp4MbT9pFdXiYE
 Dv2nrWlip6aI0MoY5NskZZtb8MRFac4OLFDlV+vsoWw81btDjgM1ot8wX6gVVITc3/u03L9hdzS
 A7KKjuAA77e09833IjSXXEIi3UP8qPFAmMkbEyMKq2oAZAiZTTzfybwaEjwdtv6MzOCEHjMpft9
 fFwBj6REfiyl7+LhPn6HnEKdFGML6l9H9P8u59qrlVTs+DicholgrQUDX7Xt305n0vA27Yj96Yb
 HXo07RyMPY6EkD9E5PAInNLHLj601OR4bjybO4Loaif4V1TvIu+mF4kZ5N1CfcZZ6O+HeCiTqrr
 0dugrEsO/QzeXcE8hoQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e5b66 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GhrnwN_qMCjkbgjgO0kA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108905-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8109059D8E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qmp_combo_typec_mux_set() updates qmp->qmpphy_mode (the cached state)
unconditionally, but only reprograms hardware when qmp->init_count is
non-zero. If pmic_glink_altmode (or any other typec_mux consumer)
calls into the PHY before DWC3 has performed phy_init() -- a real
ordering observed during testing of USB-C role-switch enablement on
Snapdragon X (X1E80100) -- the cache transitions away from the
probe default QMPPHY_MODE_USB3DP but the hardware is never touched.

Subsequent calls (for example on partner detach, where TYPEC_STATE_SAFE
also resolves to QMPPHY_MODE_USB3_ONLY in the !DP-SVID branch) then
match the cached mode and the function bails out early with:

  qcom-qmp-combo-phy faXX000.phy: typec_mux_set: same qmpphy mode, bail out

leaving the lane mux in whatever configuration it powered up in. On
the Dell Latitude 7455 this manifests as the SS lanes being left in
the default state when the first altmode notification arrives during
DWC3 probe, with the function bailing out on every subsequent attach.

Track separately whether the cached mode has actually been committed
to hardware. The bail-out optimization is only safe when the cache
truly reflects the hardware:

  - qmp_combo_typec_mux_set(): bail only when the cached mode matches
    and was committed; clear the committed flag whenever the cache is
    updated, set it again after a successful reprogram inside the
    init_count-guarded block.

  - qmp_combo_com_init(): set the committed flag at the end of a
    successful init, since com_init() programs registers from the
    cached qmpphy_mode.

No behavioural change on platforms where typec_mux_set never fires
before phy_init -- committed remains true through normal operation.

Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 25 +++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 0db200292642..e28bc1cc7a78 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2295,6 +2295,7 @@ struct qmp_combo {
 	struct mutex phy_mutex;
 	int init_count;
 	enum qmpphy_mode qmpphy_mode;
+	bool qmpphy_mode_committed;
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
@@ -3754,6 +3755,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
+	/* com_init() just programmed registers from qmp->qmpphy_mode. */
+	qmp->qmpphy_mode_committed = true;
+
 	return 0;
 
 err_disable_clocks:
@@ -4509,9 +4513,22 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		new_mode = QMPPHY_MODE_USB3_ONLY;
 	}
 
+	/*
+	 * Fast-path bail only when the cached mode is also known to be
+	 * committed to hardware. The cache may be ahead of the hardware
+	 * if a typec_mux_set arrived while the PHY had not yet been
+	 * initialised (init_count == 0); in that case the cache update
+	 * below was the only thing that ran, and we still need to drive
+	 * the registers when the PHY does come up.
+	 */
 	if (new_mode == qmp->qmpphy_mode) {
-		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
-		return 0;
+		if (qmp->qmpphy_mode_committed) {
+			dev_dbg(qmp->dev,
+				"typec_mux_set: same qmpphy mode (committed), bail out\n");
+			return 0;
+		}
+		dev_dbg(qmp->dev,
+			"typec_mux_set: same qmpphy mode but uncommitted; reprogramming\n");
 	}
 
 	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
@@ -4523,6 +4540,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		qmp->qmpphy_mode, new_mode);
 
 	qmp->qmpphy_mode = new_mode;
+	qmp->qmpphy_mode_committed = false;
 
 	if (qmp->init_count) {
 		if (qmp->usb_init_count)
@@ -4551,6 +4569,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 			if (qmp->dp_init_count)
 				cfg->dp_aux_init(qmp);
 		}
+
+		/* Reprogram complete; cache now reflects hardware. */
+		qmp->qmpphy_mode_committed = true;
 	}
 
 	return 0;
-- 
2.53.0


