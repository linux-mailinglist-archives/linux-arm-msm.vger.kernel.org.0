Return-Path: <linux-arm-msm+bounces-108899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MbwEAZUDmrJ9wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:38:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2359D575
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B3473019DAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5F72248A0;
	Thu, 21 May 2026 00:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGBK2bA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxfuAwfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64421ADC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323838; cv=none; b=geoDQlpacvzlVjEgUv6f6G1n4Ny3VIQeuHA6wYGuBewUS0bbwZeNe9z9Smvwf8R21CcUAodNURCpPcr/YplJtSX2baIDBpcXnndjpttJNw9XjPJPMHySDF6yFTSx1yWvOr2nR1NZ1WlwKjJXz2GYLRuxFxY2lHIHtPWI8Pe6wIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323838; c=relaxed/simple;
	bh=bENYEI93+kfAxffqfWequDJcPC9SYuAS3BBUWcNvBV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8pZfAsPDo8MDeSHJJaoR2WntwXodrbjAFaeqJ+8dY5CQ5SVIx+oFILTNyXOm//3pFyI9WsXhm1Vka5JFTIZzfhPgJf9wk2H08DUKxbB+SLn3Fus6+3oMpCB4In924MRnwCQyjCxymQA1nlCPfFFT07nQcLoeQpIPJXA5Cf+fo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGBK2bA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxfuAwfF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KNZ5TV964044
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fdw4wGz0s7N
	X7rZlmQyXYCSIQlXchuQ2tG5rGljK0io=; b=PGBK2bA8MWsiAutAPM87yw4W7Ir
	5m+2p23yoSDwzTi7LI4GgFR5OkME+NiTyJvGjpAKDVkpwmJRMXQi8gcK4tJnkrzO
	jUzAcKqkmKDbFZFsOADV4kxN655nok5LxZfyTikA7BQovndHJxqOoBujqCl5Tt92
	KfxQ8sUPN8GzaQnf7Z5zecmSCgqkdEptILaMVsS08/Gp14N7qvXTWTqK/7Qw2IF4
	dRyyTGB6B2FuCHiBZLX5yBROslF0DS51PI7VrawMFZjDrIzIiGHEbDVcRDh6jjb1
	zGc07qAkXrFr3eHUI+J5SdTSviiVzPA+ZSxWT9qy0Htkx+Fcx0EdSm5+1SQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh28q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:12 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bf8075f04eso103003257b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323832; x=1779928632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fdw4wGz0s7NX7rZlmQyXYCSIQlXchuQ2tG5rGljK0io=;
        b=XxfuAwfF3g4xKO7li1b714kA7c2pykbP4Cu/u5AQj1QC7nCEm/TjkP6t4qAS2+3qkk
         LDWcKnizHE9ZRVsLUELDehwMp3AwKJxzpA5mJjVozq/ObsRTaKhQhVmnRJ9bwWRhAEan
         gZQzwTvlFT2LDo+32q7ELKZoeYDksWGcc3wumVDHupO7Uk7vL97pO+fQmt8+q1oir+kq
         +or8MnvGNdUplzez7T+4RYAZ3MBKBg+ZInShlMFZSYjvv+bV8XP6sYirE8SZF6A1tKkD
         MGVj/FiImIsxEwAlv7/CU+WqGmr1tp+/gUrxackkCUd16+icP4wBQcs93bY5zt4YH/fV
         aCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323832; x=1779928632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fdw4wGz0s7NX7rZlmQyXYCSIQlXchuQ2tG5rGljK0io=;
        b=g7jLpczAvIuFuwVe7nSl8xoqhDRLiMe4UbkHZsX12zyQTxDiFCM7smDu7i0UOgqlIq
         r32TqgvjADwA0NDIfg7x4U+n8NFsIHNSHSmk6qxxiPNg4IX3ZxWs1NL9zl0INl4jwdID
         wp+JR6XAQ7nKzShYWDhPoAxe0bO/aUwrS23d9sIZMdjl4h4HUPa8UOgc4DeIocpiS3Bt
         dXH6iBk7k9X3PmWaWNGYvqG01lDaKaMreeI0STXhiS1BfCKnua43FNRjWfYb79lwcqot
         wq5D3lOaNU+wM4mG9pb4dk23wiz0bdqv9+zSwN+IVfp2fJL2gEgzttmPkDLrrHg5BAWM
         tNRA==
X-Gm-Message-State: AOJu0YyL38hoYFlegCMuU0psffKZ37+osxe9BqElvN5RrpwYM4OkU1+P
	nDIlOhDxA5EVAbh07nTw6/GkWEEwliLtgFUbLbX3k1YV+3YaEgslBf8t9g8C4Evo0zOkY5EyAli
	/aaExifC8O6mNm7IvKozpjVg2+bazQsThU+mmdvz1iNBIWaZzW0o5gCi1/5tRE/aBLOJrtt9cdl
	S6
X-Gm-Gg: Acq92OEO/mZTX95ZqE11v6mfI8cQMG6HR2wCC4CeHbrWv2OQ1/cpFtrGCDRYYcKk0HE
	jHxDc9ql0NdAbTK/FzTsffBDSK7ol1cHlgGLIGdTby63rzRTf7J+zoaJ7dA1b1HejCDyC0dkP4O
	wbJAfxP47RtuQOdCDRX7B4wrtz3qo5Ad2IxjS6b/dtOKV52kW7fuD4F8DjO13GAOLzldPiQIYnW
	rjuoQ6MOs4xd2bhTm7vnwnHo7oK7/M6cOMePkR0MdjswTNrzxcFHLH3qOcDdDHC6+fIYg6dLuQK
	xmk4GKseh1rN9Nks6umKuzytRDTSL2h/ysTG6gJImpF11IGwvxirjxCQWQdhCAG4Q93tzul3UO6
	yBhrGmNm7/Ah6bCQQyRTYG2Qdxzuc7b0Df3YgPuQkS7BVRPssLkXoGrRaeC7qeUmVFOxUG9VfDt
	QyBYqOC3NZ2znQMUf4y9dASy/UiQ==
X-Received: by 2002:a05:690c:b8e:b0:7cf:d9bc:80af with SMTP id 00721157ae682-7d20c54bdfdmr7903227b3.30.1779323832402;
        Wed, 20 May 2026 17:37:12 -0700 (PDT)
X-Received: by 2002:a05:690c:b8e:b0:7cf:d9bc:80af with SMTP id 00721157ae682-7d20c54bdfdmr7902977b3.30.1779323832015;
        Wed, 20 May 2026 17:37:12 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:11 -0700 (PDT)
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
Subject: [PATCH 1/4] phy: qcom: qmp-combo: skip USB power_off/exit after device teardown
Date: Wed, 20 May 2026 17:36:12 -0700
Message-ID: <20260521003615.1260844-2-mike.scott@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0e53b8 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EvQFHbMspfJCUfrvVzMA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfX99+NzvoRCkac
 TQF43kQOMfXt3pgO8bf9HvnmbqmnDOLrumgiFZ+CAdVTNZot877DXhmZC3qqTUacKSX2uwFp2kJ
 pDwBzNrG1c4OlnCyQ3or9DihNQKFEQAjVtly4E2DjXF+gzJAh1rHxRkP8Qt5k90t5xbuxlu8A5O
 QEObkMfbFYzeg9H4e0dapNUyGs+Rm4MFjkEkKEv7Qxe991ZI8RUE/lL6vTMJtH40c2tu2cGoX6H
 IjakPGjy1xZa3aBhOX5SBb6gpYckVZuTITzfVFMXUHsP7j7S3+EUVHBhmiEBi9CSdZRjSOKPM8C
 ySQzU++HEzhknYRH8Ip6dclIo09GCD3sWCFjHMaQLwxvkcEJfXT0hRozr/Hq9jzeT7MMFhnybCm
 6suwSUsAGCxa79VSm5zydlyGGfzHCz52Ir18DZTxzf81DBrRGshjamCgQAqhwjXIs0alAURVFZY
 rDYpv01rLY2cehE0n5w==
X-Proofpoint-GUID: -ohFRS41OJHDF6Bi5GiuKMJEw0JTNVzd
X-Proofpoint-ORIG-GUID: -ohFRS41OJHDF6Bi5GiuKMJEw0JTNVzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210003
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108899-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84E2359D575
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qmp_combo_usb_power_off() is reachable from an external consumer
(notably dwc3 via phy_exit() during driver unbind) after this device's
backing resources have already been released along a separate teardown
chain. The dereference of qmp->pcs (whose ioremap mapping has been
freed by devm cleanup) then takes a level-3 translation fault and
oopses.

Easily reproducible during testing of USB-C role-switch enablement on
Dell Latitude 7455 (X1E80100), by writing "none" to a USB-C DWC3's
usb_role_switch role attribute, e.g.

  echo none > /sys/class/usb_role/a800000.usb-role-switch/role

which triggers the chain:

  Unable to handle kernel paging request at virtual address ffff8000876c5400
  pc : qmp_combo_usb_power_off.isra.0+0x58/0x470 [phy_qcom_qmp_combo]
  Call trace:
    qmp_combo_usb_power_off+0x58/0x470 [phy_qcom_qmp_combo]
    qmp_combo_usb_exit+0x38/0x90 [phy_qcom_qmp_combo]
    phy_exit
    dwc3_phy_exit [dwc3]
    dwc3_core_remove [dwc3]
    dwc3_remove [dwc3]
    platform_remove
    device_release_driver_internal
    device_driver_detach
    unbind_store
    sysfs_kf_write
    vfs_write
    ksys_write
    __arm64_sys_write
    el0_svc

Two WARNs precede the oops from the same teardown chain, confirming
the resource ordering:

  WARNING: drivers/clk/clk.c:4494 at clk_nodrv_disable_unprepare+0x8/0x18
  WARNING: drivers/regulator/core.c:2657 at _regulator_put+0x84/0x98

i.e. the pipe clock provider has been unregistered and the regulators
released before qmp_combo_usb_power_off() runs.

The proper long-term fix is a teardown-ordering rework so the QMP
PHY's backing resources outlive any consumer that may still call its
phy_ops. Pending that, guard the power_off/exit paths with the
existing usb_init_count balance so re-entry after teardown does not
oops. usb_init_count tracks the balance of usb_power_on/off; if it
is zero we have either never powered on or have already powered off,
and there is nothing to do.

The same guard is added to qmp_combo_usb_exit() since it is the entry
point used by external consumers via phy_exit().

Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..4057583c0cfe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3922,6 +3922,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
+	/*
+	 * Reachable as ->exit from external consumers (notably dwc3) after
+	 * this device's backing resources have already been released along
+	 * a teardown chain. Refuse to touch registers in that case.
+	 */
+	if (!qmp->usb_init_count) {
+		dev_dbg(qmp->dev, "%s: PHY not powered on, skipping\n",
+			__func__);
+		return 0;
+	}
+
 	clk_disable_unprepare(qmp->pipe_clk);
 
 	/* PHY reset */
@@ -3966,6 +3977,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	/*
+	 * See qmp_combo_usb_power_off(): an external consumer may call
+	 * phy_exit() after the QMP device's resources have been torn
+	 * down. usb_init_count tracks usb_init/usb_exit balance.
+	 */
+	if (!qmp->usb_init_count) {
+		dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
+			__func__);
+		return 0;
+	}
+
 	mutex_lock(&qmp->phy_mutex);
 	ret = qmp_combo_usb_power_off(phy);
 	if (ret)
-- 
2.53.0


