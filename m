Return-Path: <linux-arm-msm+bounces-118647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r/0OJvCIVGoGnAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:42:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B57479CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:42:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fUTpCRkc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118647-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118647-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 313EF300A38B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F14383323;
	Mon, 13 Jul 2026 06:42:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73754383338;
	Mon, 13 Jul 2026 06:42:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924954; cv=none; b=bg5YB6FPcRoylT+sAhJc6Lugzfmimf/IN1icD1IH2Bux2LnSdx/I5kuHwtwlr92lwv+PEVxclpjslAF5MUdSwqSvIfjbTbftZSwfrFjfHGqp+I3anDS6+l1LDXFZ/HBW0mDNe82y+nz1xWN/bpWo1nYl5qF5wMRRPhQnWcuUtmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924954; c=relaxed/simple;
	bh=2CCQtDebxyNVsE4jrp2w28Kml0o9MUN8am+rbo18ics=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXJxHPrp6US5ige670P7aflunUKIQdBMnfVJ8jB9VzFrcWcaxOJbgbbDJRRNVrQw2d64PO6WVntKWZwshIzbreoN1bp36zFnYiYv8tMwOfI+OEMPye1gs2GS2l+8N7TM1JeTIOQtQTOHQD5bWAH+JZoaktkCoQostcN65lz5ipM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUTpCRkc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NpjJ732266;
	Mon, 13 Jul 2026 06:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1QAPAHzHDwS6iTNeYth32rllj3gNFIMr95z
	fcEoMlCY=; b=fUTpCRkcnYPECY+F3rt5EO5JqWo7WCFQj7pTmWt5LQs5hP0g6/E
	4bIa17l6zrqFwzFdI6TUS+Mlau8aspIhjG8B+tVY0ECzUg6JGGs8F5Mo2DYzSN5u
	WhrkfNcn2iXKPJ5xJE822FhgD4pn+0VrJsSzEjiHWFqcrbrEdIOZpDQ2UYHlMXzI
	ri0CeRSOQka+gNvir7fuCGC4f6OKzfG0y8NnAG+xnC0GGnZG9X85DlFCLQfsaVpg
	CFup05f81Ox3glA4cEW+TJqUkKc9hwnJUSiQW7uf6KEWtlwDiz1eB9Whp16CklQM
	t3aoyNTQzbmSPvsqA8Ig+bbTxkbSPUJtlmA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn397y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:42:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66D6gQXP024592;
	Mon, 13 Jul 2026 06:42:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewj2ssb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:42:26 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66D6gQTx024587;
	Mon, 13 Jul 2026 06:42:26 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66D6gQmd024585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:42:26 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 522B321BEF; Mon, 13 Jul 2026 12:12:25 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH v2] i2c: qcom-geni: Use devm_pm_runtime_enable() for PM management
Date: Mon, 13 Jul 2026 12:11:30 +0530
Message-ID: <20260713064130.1681130-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfX/VDosPEkgBtt
 yvBqEDw0ka/5X+b/PyjamzOThlpUmofiZ2XWK3p7VQzcpVqIfjlPtiLjYoihzYM/4py00qrnv5P
 QF01z37AdryUEFJivAaY29CBwOVzVaiE6lyqfW2+39GJu84mBXGuK/anGsLyN1/UVPhmtG9Pjv6
 sNWohRWuDFSyDXpVd4y4kkpq57nWXJL9uvcQxL2IQAalFKQJMh0a7Kj9dNFt20kWbZ8/dM/N226
 0uStDeUeZAeHCs09+AFbmevHb921LKZF/uLsaI/F34o+BIUcUX2aUrsZnlbpjs2Jov95chqeJw6
 pkwuDeDL5YNSWPwtjUIVNd1Y6w/NBEhULiVhHzUzBfPASGKS5m8DEniURTJXl+IR2EvnUdMXRCm
 V0y767zMX/4ipC8eDtC3pqxK7a89JfIS1/xAEHpI1hVLpAHtKA+hlh4xx5pXctXjIvck46G92I5
 ezASaT7J2ftAEAXwPQw==
X-Proofpoint-ORIG-GUID: -dOCLL-j731Q1wFVOWxZJEzwhRClz-3P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfX4I3klwDoD+VM
 B8LBPVK1lchXtpcmahWeialwGWUudEjw31PKRO+PFOw9qJXFLtZLDYT8Hr0alGpLnT//ITgMQb4
 onUPqIfhzdTF9qGorEHrN7bI96FrH+8=
X-Proofpoint-GUID: -dOCLL-j731Q1wFVOWxZJEzwhRClz-3P
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a5488d7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q1d9ZNj4lJCxs8ft27AA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118647-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F05B57479CB

The current implementation manually calls pm_runtime_enable() in probe()
and pm_runtime_disable() in remove() and error paths. This pattern is
error-prone and requires careful cleanup in all failure paths. Using the
devres-managed variant eliminates this complexity.

Migrate from manual pm_runtime_enable()/pm_runtime_disable() calls to
the devres-managed devm_pm_runtime_enable() API. This simplifies the
driver by automatically handling runtime PM cleanup when the device is
removed or probe fails. This helps  with Simplified error handling and
Automatic cleanup.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
v1->v2:
- Fix runtime PM init ordering by calling devm_pm_runtime_enable() after PM state setup.
- Remove unnecessary commit message details.
- Address review feedback from Konrad Dybcio.

Link to v1: https://lore.kernel.org/all/20260710121356.4054600-1-mukesh.savaliya@oss.qualcomm.com/

---
 drivers/i2c/busses/i2c-qcom-geni.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..d5c977e34994 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1126,27 +1126,25 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
-	pm_runtime_set_suspended(gi2c->se.dev);
-	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
-	pm_runtime_use_autosuspend(gi2c->se.dev);
-	pm_runtime_enable(gi2c->se.dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, I2C_AUTO_SUSPEND_DELAY);
+	pm_runtime_use_autosuspend(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = geni_i2c_init(gi2c);
-	if (ret < 0) {
-		pm_runtime_disable(gi2c->se.dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = i2c_add_adapter(&gi2c->adap);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
-		pm_runtime_disable(gi2c->se.dev);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return ret;
+	return 0;
 }
 
 static void geni_i2c_remove(struct platform_device *pdev)
@@ -1155,7 +1153,6 @@ static void geni_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&gi2c->adap);
 	release_gpi_dma(gi2c);
-	pm_runtime_disable(gi2c->se.dev);
 }
 
 static void geni_i2c_shutdown(struct platform_device *pdev)
-- 
2.43.0


