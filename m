Return-Path: <linux-arm-msm+bounces-115114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9lb1KIB8Qmp08QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:09:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05616DBC39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:09:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=STo7aLk7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115114-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115114-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 974B7304B284
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B180F22156C;
	Mon, 29 Jun 2026 13:42:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2321B192;
	Mon, 29 Jun 2026 13:42:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740524; cv=none; b=f7toWFkV3ObmeZtFIXAavHRB+3XILm9DCvkErLsh/PD362u6UP8oVCihIoGkZVfMTXJ8DwN1Mzz/0lpFmENjNULvhwlmz9sLXKS+IBVvH9gzSBc7bUacoJybNGTLHqU4x9SkBhLept925FH1D4YnCiR3mMmlxb3ndjYy7tWw4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740524; c=relaxed/simple;
	bh=J2Rb1TyYMUeEHGKH0Tiz4lhsiS3qGZWED5XxWQxERmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipCteQf9UMRTU2AiRfUblPnSbMWswamzCE8LFqRs9t9B/uCU44x0t5Nev/qIy5CtxsqtgxGj8WeVXehUu6ZmcWm9EN8JqvHEo6pUvM0MrEMTxQ8qP9LPBupR5BGm4KRUbWK1gWiddnGrloEWI1u5kE92HsQhpnBVXCR2nABZ3ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STo7aLk7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATECC2647844;
	Mon, 29 Jun 2026 13:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CPSzziTkc7x+WIJRL3eg1G/bDdtKedN/z+z
	W/yvhMks=; b=STo7aLk7HYKhXA/x/BoazYSC8tPszWAoAvnOQ7h/kFxjNqT3MeQ
	9FB2OU81oCrTQTuoKdzTkFLPscQ26S5XKJXMxkcnuy7oxZT3WOwNchu0LbKDMnRQ
	HHXj5mCO9jhGpIRFjKUTf4yCnXhpScl38MrwbeMhhX5kWeXaTEyRvS0t9wmceuz6
	5TwhtPK761xUGOlpYOj7+ZSnIlSPISc7FaG4Ex1dPbg7MY3Vyb5WTXxsIgMoZKjB
	JGsfWT7OgNCp73wgYuVLTX6ooH19jUUvRC+GIFiN5BAU4FSildJObLe3Cw8HWW2l
	TZ+d7/lncNWCU1TA0bOFF12tqVbVBkKOjbw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhhu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 13:41:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65TDftK0018562;
	Mon, 29 Jun 2026 13:41:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kj6u2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 13:41:55 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65TDftQJ018555;
	Mon, 29 Jun 2026 13:41:55 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65TDfsPD018553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 13:41:55 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 0E38A21C18; Mon, 29 Jun 2026 19:11:54 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: andi.shyti@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        viken.dadhaniya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorande@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v6] i2c: i2c-qcom-geni: serve transfers during early resume
Date: Mon, 29 Jun 2026 19:11:40 +0530
Message-ID: <20260629134140.755193-1-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: u3eyowhRWAFFR5juDxkE75lKEu51CgEE
X-Proofpoint-ORIG-GUID: u3eyowhRWAFFR5juDxkE75lKEu51CgEE
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a427628 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ADrkd9KHRwTtduNC9T0A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMyBTYWx0ZWRfXxGvUj7sjPGjh
 8uDKxfm2Nu2SsPKRSeJitNRk/rePGIu6aWR1Z50+Hd8cavimDHX1Sb75hLjWufwXrsh8tXmkqmI
 WITUQC9PCocTfakTnH+FNIyCgNbixTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMyBTYWx0ZWRfX5CPLP4UzP685
 K8LIrnN1IIIKTswqu2dMSqQ/vKLNLtM3s4KpNIiYn0JNT1MkrSMBzHhpfxtkNywiChO5DwpLcXm
 8A+Fe04IVT4ltDF+i3Orx+HuzfRlP4a51gqbQ7TpvORa0nS2ACwr9zYpm5SGAjvHjcjdwTibLqs
 UVjyUIR/TQrnvmBF7voFwI0SCv+PU9JD9x4LznyEiAMTqUlims4AAkHy0YP/KMQO3mOKwkh+Ml8
 0ugAPsYwMwrvhcM8WKF1IOWy1Y6jDgjusrfVM83wxigXbevJKxLgLBpOv2b/FX+pM3k2z2lAgn6
 k22nU9zV8MwnL33D93E8xigB4gQOV3S3M9hjl/yY5uGGsh1gshdUAQndW+AseF/ykw+gSUG9QGB
 9m6bV59PRMaFwLZWwepehFZiV5FfutjyMoHKUSXJJpoyIQbk2gJY8JaF2+2gmPAKlEA8iModpId
 lO/ptXr/yBwnijCwlsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115114-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Bjorande@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,linaro.org:url,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F05616DBC39

I2C transfers issued during the resume_noirq phase can fail on GENI I2C
controllers.

Some devices require I2C communication before their resume sequence can
complete. One example is a USB Ethernet device attached through PCIe,
where device configuration must be restored over I2C before PCIe link
initialization can proceed. Since such accesses occur during
resume_noirq(), the underlying I2C controller must be able to service
transfers at that stage.

However, GENI I2C transfers rely on interrupts for command completion,
while IRQ handling is still suspended during early resume. Additionally,
runtime PM may remain disabled until later in the resume sequence, causing
pm_runtime_get_sync() to return -EACCES and preventing controller
resources from being enabled.

Allow the controller to operate during early resume by requesting the IRQ
with IRQF_NO_SUSPEND and IRQF_EARLY_RESUME so completion interrupts can be
delivered during the noirq phase. Also restore runtime PM from
resume_noirq() when it is disabled and tolerate transient -EACCES failures
from pm_runtime_get_sync() during the PM state transition.

This enables GENI I2C transfers to complete successfully during the
resume_noirq phase and allows dependent devices to finish their resume
sequence.

Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
v5->v6 :
- Modified commit log to start with problem description as suggested by Bjorn.
- Moved to new implementation of the logic while earlier replied to comments on
  older design and considers latest fix added recently.
- Made change generic to I2C including GPI mode transfer, this was not done earlier.
- Changed email address to oss.qualcomm.com domain.
Link to V5: https://lore.kernel.org/lkml/20241227130236.755794-1-quic_msavaliy@quicinc.com/

---
v4->v5:
- Commit log enhanced considering Bjorn's comments by explaining PCIe usecase.
- Enhanced comment with reason when using pm_runtime_force_resume().
- Corrected IS_ENABLED(CONFIG_PM) condition inside geni_i2c_xfer().
- Improved debug log as per Bjorn's suggestions during suspend, resume.
- Reverted back comment before devm_request_irq().
Link to V4: https://lore.kernel.org/lkml/bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com/

---
v3->v4 :
 - Enhanced commit log by explaining client usecase scenario during early resume.
 - Covered 'usage_count' of 'struct dev_pm_info' under CONFIG_PM to compile non PM CONFIG.
Link to V3: https://lore.kernel.org/all/20241119143031.3331753-1-quic_msavaliy@quicinc.com/T/

---
v2 -> v3:
 - Updated exact usecase and scenario in the commit log description.
 - Removed bulleted points from technical description, added details in free flow.
 - Used pm_runtime_force_resume/suspend() instead customized local implementation.
 - Added debug log after pm_runtime_force_suspend().
Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/

---
v1 -> v2:
 - Changed gi2c->se.dev to dev during dev_dbg() calls.
 - Addressed review comments from Andi and Bjorn.
 - Returned 0 instead garbage inside geni_i2c_force_resume().
 - Added comments explaining forced resume transfer when runtime PM
   remains disabled.
Link to V1: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
---
---
 drivers/dma/qcom/gpi.c             |  3 ++-
 drivers/i2c/busses/i2c-qcom-geni.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c9a6f610ffd9..332f3aa40628 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -615,7 +615,8 @@ static int gpi_config_interrupts(struct gpii *gpii, enum gpii_irq_settings setti
 
 	if (!gpii->configured_irq) {
 		ret = devm_request_irq(gpii->gpi_dev->dev, gpii->irq,
-				       gpi_handle_irq, IRQF_TRIGGER_HIGH,
+				       gpi_handle_irq,
+				       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
 				       "gpi-dma", gpii);
 		if (ret < 0) {
 			dev_err(gpii->gpi_dev->dev, "error request irq:%d ret:%d\n",
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index d2f5055b0b10..d56b36bd1d26 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -913,6 +913,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	gi2c->err = 0;
 	reinit_completion(&gi2c->done);
 	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret == -EACCES) {
+		dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
+		ret = 0;
+	}
 	if (ret < 0) {
 		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
 		pm_runtime_put_noidle(gi2c->se.dev);
@@ -1045,7 +1049,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gi2c);
 
 	/* Keep interrupts disabled initially to allow for low-power modes */
-	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
+	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
+			       IRQF_NO_AUTOEN | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
 			       dev_name(dev), gi2c);
 	if (ret)
 		return dev_err_probe(dev, ret,
@@ -1257,7 +1262,12 @@ static int __maybe_unused geni_i2c_resume_noirq(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Enforced disable_depth = 0 to actually enable runtime PM during noirq phase */
+	if (!pm_runtime_enabled(dev))
+		pm_runtime_enable(dev);
+
 	i2c_mark_adapter_resumed(&gi2c->adap);
+
 	return 0;
 }
 
-- 
2.43.0


