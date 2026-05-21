Return-Path: <linux-arm-msm+bounces-108904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAxqF+BbDmo4+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:12:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9E59D8CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14616309488B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C212C11E4;
	Thu, 21 May 2026 01:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuaSAZeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBN0ZsZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68822D060B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325797; cv=none; b=BSwSN7spQPyapO3eECP33DIJ4V7/XuJRqKWlEovdMia1HxZsh/PHvPqBTUNaHIGnGlwW0hteiyb0dMQlc1RcXE5kG7n+TqI1DKkos4sI4hdqtmUKgOUc03jxpAdKZodDr/6Mj2UdW1onEfPl1edde5zFn6RD/F1LXmAH3SJ4t2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325797; c=relaxed/simple;
	bh=uQLvCLyLKewaPBfOITpkJUe/bRH5dqsoapo9fOu8YkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGqYEUzUi97iAOqE8f1+lrQ1tYHx0ZhgKAWq6UyaqzhapV53iQrVOPsZNsq4uGnch3EWtwvkcc0SKvFTAm0VvWMRMRI6ceStQx8FhJhLhJeXYPGc2oRbLyyT9AoocES0uCmVbukm5Bc6B+yAIvX6VXSjztIWBo1eCpT4y5phUjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuaSAZeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBN0ZsZM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KLkrcl1798322
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+V9cVsKTNh
	VN5JgnurmHUqaFwybS+3Yl850UmViNVU=; b=YuaSAZeby1ujciVFSKjkfjOJWEB
	/BNSvVWFrwpINlIANgENFA1odq8X/Fk9+OiW1fJ7Sjg5FJoE8biY4I+VqKNVl0pk
	2Hdqi0qmyrmabO/eE3Oe1lNFwCPIwLWXe3VGzxX8/eaLa9O03Qqo755nOszwbbvI
	b+fxf49nYLNkZ/ehFqCfJdUh2a5Os06zS2YuW1wvICTJZOvjmuVLBij2/QhHdJ9s
	r7jjQmvgqrS5T+GeQO+ozFSS/aGCzp5zSrC28BHBQd+d/wz56wF+7vU4mPrlZXxh
	O2cLYh1Uje2ILgsP007rvxtXkxr7cyryszM1T+pR7hl3shmZ1o8hDL8p0hg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu2f88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:09:54 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7d19c3a699fso19019867b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325794; x=1779930594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+V9cVsKTNhVN5JgnurmHUqaFwybS+3Yl850UmViNVU=;
        b=CBN0ZsZMkGloV1S/5i/E8jBx/yhCpWZRxKrMyOHDW6Hbq8Salz5HCuzhC/bUC4w9pJ
         J1GI0KclwXmEt8XQNBY/G5aoSSN4STrWkaAM889XpmtcBRn9nfrFqJVl1SHLSEDH4W/t
         4IMrKZoeMoOu3sQX2ziKLtinOF/X3xFtVVi4ysMPbpfrID1ZTJfAgP/qzpV4Vahy1Gxb
         +cy/RjU5BXJNsPHlv5ETp/eZK74Wcakho57JxSgjTuA9TIZ3pl22UAPlko8K8Nx/5hS6
         ywteEOPWlpOseq1kxMe+HOCd4hYwT6cUiFcF6Mdh0VDAH+W5uDA+KoFK9+cRncm00kXn
         Rg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325794; x=1779930594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+V9cVsKTNhVN5JgnurmHUqaFwybS+3Yl850UmViNVU=;
        b=EaNEp9CfABYA1L540JfCkwW6o6kVRU7jUWJ8kVhp0BAgAL5SFRLubuKSmdsMlaZFMp
         5D9c16rjgt5VgncrF8VHpgR6fH30fS3x6Ko9sYLWW60d/zOdBfYPF1YKQs8C3vf3bRXe
         FBY6LebBO3tY7P9gDohw3SfbzFrvHrYYPBj6cqbK10PCAb8r5jaUuMx3sFlYf6sfXlOg
         lDpsrc6pbqbyX6SbKyHzeNB2P8U/wtSX40wE2MNZ/pwPa8FeVM049MGJdWdI67Bdq27c
         wpTqC+V3Wht/wuV1+odu+pLzHWddaulGNZKgiW1VKK1lyIqSJPJ6DVVmLWFZjzkkmuYl
         VFmg==
X-Gm-Message-State: AOJu0YwHp76QZvOtIxM1g0XQuKUm/z4DSOXL1oZHsnOB+Fu2vXkfYT/+
	RJUIH17LUW6D6H53nFMtQiasUvmeWc4urXopsdhs//s5K/9LJAoy9ZEaocJ6imE/JrYA5eoEcKl
	yaCm+sedPdBGVWwE+S21Uaiu5zcVDSirgtttEWiUcoChTwQMIYvc2Cj5GECB4OXisnjj6pR/iCn
	sw
X-Gm-Gg: Acq92OGWyWKoCswIVVddCC9btBFoT07Gec2o7zPKI+XSL/AqllDDWYUFLFQB0M9y7PL
	ao9oowoMf7OmDLFMPktC+rxR4dviJNlRjyOl8jpgiEKIfL3wySlXoTqxyzOqTVSfAH0vllXSTki
	oV7viY6ue8W5ccJOWQ0fapofBnNKpPXAO3KY5FyVgwWOlGO2XcEYBwrEWjBFVUOtxVS64jb5veQ
	5fbYovfFO3Rob58mDMUbcqdOQXWTv6Izekwx/h0JhY+Ku4HLmK0K82q4zndHZCh9pBSGxxiE+Jv
	urNPjsHNqe2ki2YqyA/RoRMff14+zlhsVa8t8RbMp/TmHCdw33/NhJDmj6E12zg0OSzilH6MRJC
	MXZ3yFG962X/NE33uLsDeR/of5LEP6/PrdiG0KorZIkAuIA06wi+Ya+KbVNCeStIZLFSMp0efJJ
	Mq22TcWLZfftEbcEs=
X-Received: by 2002:a05:690c:6387:b0:7b2:136d:240a with SMTP id 00721157ae682-7d20aa9cb6fmr9422037b3.9.1779325794027;
        Wed, 20 May 2026 18:09:54 -0700 (PDT)
X-Received: by 2002:a05:690c:6387:b0:7b2:136d:240a with SMTP id 00721157ae682-7d20aa9cb6fmr9421707b3.9.1779325793555;
        Wed, 20 May 2026 18:09:53 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:52 -0700 (PDT)
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
Subject: [PATCH v2 1/4] phy: qcom: qmp-combo: skip USB power_off/exit after device teardown
Date: Wed, 20 May 2026 18:09:32 -0700
Message-ID: <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX4uaHEAPphW1x
 p5+CsZVnmmuk3Jz8CheRlPf3RduH6L0+bkVqavCjyJBreqJvd2s5PLlJ08cAQiHeMCnVXRMiky/
 zT9doXitDTvEEyofOw4T7lS7bplRvkj/ih+fhGQ0Pe1MnCUEngNF0jms1GGXn5hLUh9zXjnyrtl
 t+4to50GIsn1NX/ArobvH0UPR7l+WWx6Vdx4vjfyLPt90RnUvlHe9tw92PMW5XXoqdLS+Kw1rLu
 TFLN/dVnZ/UuLpqV03Ni7p79qBYxxq2B2J8KotXi661JrYRqeqz51TbQWLIP9rsy1QnTutZ4J3u
 qB/XtknxRFt+BKN/+EoDBWJwsHgfGfCg1vaTvHRdOcgNe+CNTltp12j25SfF9yMUhni5FYpbUBO
 vNzcXDoUM1Hn1QhUnGsIPCdaE3KHKMvKqMweXXTwPNXF8I5j9RXX+Er1rvASDHPxOWgOv47/Lxo
 38u/h5BRgk8POZhHtSA==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0e5b62 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EvQFHbMspfJCUfrvVzMA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: jTx0Ku3meX2t1kETCSqkugtKcqPZiUYh
X-Proofpoint-ORIG-GUID: jTx0Ku3meX2t1kETCSqkugtKcqPZiUYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-108904-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9F9E59D8CA
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
index cdcfad2e86b1..0db200292642 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3926,6 +3926,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
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
 	/* PHY reset */
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
@@ -3968,6 +3979,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
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


