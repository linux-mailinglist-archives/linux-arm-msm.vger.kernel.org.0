Return-Path: <linux-arm-msm+bounces-108900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLfIDQ1UDmrJ9wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:38:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768059D57C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3994301BCC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9D727A12F;
	Thu, 21 May 2026 00:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXz3QRKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+bkTokD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7F25B09E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323843; cv=none; b=l8aMZuqf8Xeg7L2mMDk8nLvHfu8yTARf+xiAfmRrJVwoXPExpGvqfQok0uFq2MA6V6Uz/4WLZG7re3Je5DKoLEGPfTcjyRpXWIEKx9LOIjktR99ESzsxVVHeaPjq4skh1eJjWIzrPYLrBXGekPr/gJgLIxM6yUBQmCKAQJlsijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323843; c=relaxed/simple;
	bh=8YDN6rDDgfUMH3s3D+1m6FuPIYASc6HFvPaXsSXVgQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTtbopiyk/UK3EQJmS9PxVq1HWpxNWxNmBb6LKWnssDoocqx90MCdzFftRezIcYhUlae7wi0/zC+RtIJk09AvUmnQ1pZsnZyn1rXG12kq8j1FZvHAzKhAXvCJhI/L/2eam0rb6VXuxa5O5zTHKT7X/qmvf4s2CBE8ittEoLUDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXz3QRKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+bkTokD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KJaNaa317554
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/53XCL17jN3
	51K4aaPlGvru/vziGTGGtsn9yhfrv7hk=; b=eXz3QRKZIFXaBD89KyrgH/U9+4j
	wJVHWfbLEEOJ0YXXbIM3w4KqIrR8Y3bsudCd/ytYzDSNvoQGPIQCK6EwALgkENon
	t0SmaEztdhd3iuBUEqxC3fnzfrlNzcZFuCbdjiJJEShUk4WFKq/d7Fdvf2YGkXIb
	D9eIdo5v0IfmQ1JrS3RSeo/vpTAticWOSUlMfiJ4hHpkOkBQerW9XAkrXRX1JCFf
	J9QHkFV1OXBCNmz6D4FHDEVLDAiZXq4Ya25lYhSQxvRuTNVI8ZTk8E0tiZ+HtjM7
	twJ7cawUdp1HsPu7NSKUea1N3HIt8OypVR+GQL9HwJAfgzixs2fRbT4wuCw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qtkua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:16 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7b3e41a97f0so77998187b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323836; x=1779928636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/53XCL17jN351K4aaPlGvru/vziGTGGtsn9yhfrv7hk=;
        b=L+bkTokDrf6ocedPc4FtXnaLpOo92YrwcYI28mSg6IAnG3Hl5ml900F2pUmRpui7AY
         cMtA/Z3chvXl9o0fnDzKUh9bwaBgYPY1fAyeQwEleOVvBtCfyl42FlWM8tBJbTvoNVx5
         Yb92q/Vqur4U1LDvWw4SCsSX3B9SBOaEsl1H6Ok9kzi3JVaodNLwfSUvVIeEeXh9XVrG
         Hjxrg5leZSMZoTV0lBLT2J/+/3pwRL4ONJSVOlNoq0pMAybXsh9AcaLxiWlzSCkkOsUB
         gCwhGZLe8ZPXMscJOcoJPVyEb8OC0koQdW3SmKfYRMjWXJw1pwqeuEWPBp3ojM7n6nIe
         OZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323836; x=1779928636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/53XCL17jN351K4aaPlGvru/vziGTGGtsn9yhfrv7hk=;
        b=p7giXql+1hHzRuknNY0/UDilaJyuIg6Xq8tHAPfDF14DXw5GazesFG8aDgQlp2/aEq
         Djhk75yfMQEfkNRyVyWllXFhx98ZWMt26aaRM4DpyM1cHEkaUQhCm9LhRkE/TjorVXGN
         0uVNxlx1eiPJjk2/ACpBafktftWjDx4epVO2PwuXzlLYacD3t2/L21hJwyhn7I8Iht7g
         SkPjAJ6YEj17QmkGzRbxhhOZLnDM9ScuYhudCPRIokMcBMizdt7kFfTSOgwHXIPESv8A
         2fbZOfx+QPHAwe0lIJDTvCFHUslskF310QUsNB0TBbtGOIjbXhz/tYB4q1D2m0Tny5en
         lYdw==
X-Gm-Message-State: AOJu0YyJXn3ABtStpGwZFNcN6hzpbMd1+89rogynSrgXDfdiiiqoJxg5
	xyaUktFEYtbuGEDDGF7DIASxJaZVlckLyN28lUCd1VtukWe6EvU7T2kHaJzg4UGz4pnoOlIQRCm
	AaW41VaQYZjRcRt+znd0yioLg4a5WUSxJLkv0QgbuNw+p9f+SNFcH3qqjljwHrAAOkWuQWelIGc
	/S
X-Gm-Gg: Acq92OGdh5ZVX7lz+hbXyn2l3MVCeE9dnh1QVBm5bLXbT9K1b1rDIaCqLxcf8wug2as
	i9K3SLDaOxOU2HOu8MFKX0sphbSLxo4y/i47Z9RLJkKkm0+gBn2hgCuyuUzPSafnhFSDBzOWAyL
	QbDq7LHBmKTBAQdpZU66ZE4eGyUeKoHjhBUS/ZVbuCK74L69oThCGQeLDnxL1E6QodoAWmtfOUZ
	RfZeXtxEE0cHN3UbEv+KEsmg/N14AYYGIdI0/oKr6D/SuOndbGFca8NMO+C7CLIL1s2j9SPdDXG
	Ftdfx9xaGsXfPoQsM5oU53qNyKi0Urb2seKYpnSWjPIZq6EOIADXwK7Gy5RzqlHQG8ECsiFMaxx
	wsX3znlKZuF/jvQcXs8vgE/1ksWJ9s49uK0oURlz2lmBgp3ECMXuCZvapBcWZjSWbX5qQNOGslF
	HN23CNM/VyG0DYIRw=
X-Received: by 2002:a05:690c:6202:b0:79a:6249:a046 with SMTP id 00721157ae682-7d209cd3355mr7511277b3.9.1779323835786;
        Wed, 20 May 2026 17:37:15 -0700 (PDT)
X-Received: by 2002:a05:690c:6202:b0:79a:6249:a046 with SMTP id 00721157ae682-7d209cd3355mr7510937b3.9.1779323835378;
        Wed, 20 May 2026 17:37:15 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:14 -0700 (PDT)
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
Subject: [PATCH 2/4] phy: qcom: qmp-combo: track whether the cached typec_mux mode was committed to hardware
Date: Wed, 20 May 2026 17:36:13 -0700
Message-ID: <20260521003615.1260844-3-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfXx/5+Uwwtq2Xq
 aPmTaNiKajLcKu34DJHC+r3O9TXMgAmiEpjXSi1LoCizfikgd8CqQr14bueCWBDyGrX4TQmW3oh
 LUc+APqIHmIOw79dNAjr+Aeiu4o/O4c2QV8qVKLRbFImeCUGTWRw3Gre4wK/sGEBZUpvHN3kbw2
 IQHlq3dPSxmVyl7WC+7weRX0B8iAUfZCQi91AU7kIcTGVLegDGu/0HmxAgFtpSxRMRGknl9tH7+
 hH/TCZKpsUE++AuPlI8TMOYNgqbbMnPQdPs/wbCIj0HMEZh9McRBLSdAFL0+Mamkatvx23xWIkG
 eANyZRjLC3KoxAsvYcCkRHr88JEkFj5cM/TWGNMhMqu00QEweUR9kZW3F/vFsn7dKLR3VzPKTGJ
 9ytZoqcG8UOnXNgCXX6Ib3czeSvD7KYJ1/yiYtbsrQ+lyDGf4QtslBAIv9PPnowRx6EA87MLnyZ
 y1iK7M5m9wIMZTAWsRg==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0e53bc cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GhrnwN_qMCjkbgjgO0kA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: EFW_Wds_D5Mlyq3vpXC02lZZ-_FmkqFB
X-Proofpoint-ORIG-GUID: EFW_Wds_D5Mlyq3vpXC02lZZ-_FmkqFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210003
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108900-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5768059D57C
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
index 4057583c0cfe..9b6da783ce60 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2295,6 +2295,7 @@ struct qmp_combo {
 	struct mutex phy_mutex;
 	int init_count;
 	enum qmpphy_mode qmpphy_mode;
+	bool qmpphy_mode_committed;
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
@@ -3747,6 +3748,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
+	/* com_init() just programmed registers from qmp->qmpphy_mode. */
+	qmp->qmpphy_mode_committed = true;
+
 	return 0;
 
 err_assert_reset:
@@ -4507,9 +4511,22 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
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
@@ -4521,6 +4538,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		qmp->qmpphy_mode, new_mode);
 
 	qmp->qmpphy_mode = new_mode;
+	qmp->qmpphy_mode_committed = false;
 
 	if (qmp->init_count) {
 		if (qmp->usb_init_count)
@@ -4549,6 +4567,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
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


