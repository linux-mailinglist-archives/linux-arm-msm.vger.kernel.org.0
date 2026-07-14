Return-Path: <linux-arm-msm+bounces-118931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BrSmNpTGVWrdsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:18:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3241F751120
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:18:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ASo2TEfG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D345304C2CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A28305673;
	Tue, 14 Jul 2026 05:15:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB554309EEB;
	Tue, 14 Jul 2026 05:15:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006123; cv=none; b=LsSlxHWQKO83iYwizuFAuQspAufznFIY17fUaynqquWMHfQSvgxdRvo/iB/I3LNgy6LXxXaVnHf0yGedwLHeb7QjsNCqnLXp84u/wzIx/tN8pzHx3VwqwOMbTjytLGaKaWsESvZXB5k7XON+fGfaINyj8UgLpXJ7W2BMHX/f6FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006123; c=relaxed/simple;
	bh=gWuEyuSnkMv6cVh8Vdl6vshRuEZGCvqG3ptDiJFqBfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLJk+L+IL/0rYoX15PNUcpHPNtxlZxXABtYCLNwCTHatRKizZ74ds3tim64oOTotHw79mAVFo5h4bqVOh/b4sKlGKEAFoO8JIfXJph/wEMOowac4LaEsHUA0eKhSXU7inrySjd34ptVF7EVJqx9o8ZPRi1YD8YMhiZDVnrsT+zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASo2TEfG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38P0N3483155;
	Tue, 14 Jul 2026 05:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q1YGfeaSKt0ZPds5mpaIzMy1AwKlI8p2khy
	jh6f8N9k=; b=ASo2TEfGvdKn7eu8FjEEohB6XFdRV9M3EjopgNcc+O0swOn7BMa
	nVj2SMms+1BUBL0g6rS8h5E0s7Z4TQBiN20jS1H2gqFOB5DNHh/6Af4etgvaXzI8
	cvVHQjX3UH/aZmURMX0YKtowb6tabUx2kG1UmNd5Tgt1sq/WtjNSY/i9I1WVFzbr
	LwWpmpC5S85Q6S1HHz3YHXffPTqPzVATr5zQ1LJ0m+E0R1fD7PW1lAC6ydOQVT+h
	9KL1M0p7FHHirh0yok/iGABbmxCCRWE3fhuOTcauaycTb01i+QOIRckz+W5jaGsT
	5ITvfcuhC0s3kaSJk1WfgigEqj6xK6V6MCA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xab1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 05:15:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66E5FGqd008616;
	Tue, 14 Jul 2026 05:15:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewjf9k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 05:15:16 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66E5FFFM008606;
	Tue, 14 Jul 2026 05:15:15 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66E5FF6N008594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 05:15:15 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 7342521BE5; Tue, 14 Jul 2026 10:45:14 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH v3] i2c: qcom-geni: Use devm_pm_runtime_enable() for PM management
Date: Tue, 14 Jul 2026 10:45:12 +0530
Message-ID: <20260714051512.3732551-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MSBTYWx0ZWRfXwe5pk1ffqDII
 B84TtV4i3j1yq+zyL5qu8cId7dRl8jQobgHRTr9KDV8qVCNoNrQGyKzES5cH8pazM38BfHV3zSx
 CRrBjdikWov/NzkPBlgRu6483rcLZBtgHTTIsnkOt8AdZxnrAHyERi4vK9RlemO708WsOT2QCpl
 Pjd8l5ArH/Tauq9f7pWcHdkI4bDRhrQzrzXnWcsxqYze+Vx3yKFMaMVzZVWDRaxWCCKkAMhC0of
 ovXJR/wUyYC31D6hmMPD+gJaaSEerwvFmiIp/heaCyam/cmH+G1mAIiWTD1SFeZyTPBMZUHgXmW
 bP98qk3i+dDpSWHBRrs0ZAL3yter2eKYomWUSvwbazPI6/HRuEIY5YVvY/B+yBLd2jlaR1q+r4z
 MCGKt5B/DSZAL/R3LGdjpPuzJFhXzb8oIn+qu4epAKNCitqAJqYyAQKr3qSe5rgcJB4fd6IBuG/
 7/b0aQa3F7z5W7R1Hcg==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55c5e7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q1d9ZNj4lJCxs8ft27AA:9
X-Proofpoint-ORIG-GUID: mhMHleBgkBdh83ycLCkUfLqNEl9dQ9Xf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MSBTYWx0ZWRfXzaD9OoBzlNzw
 zW2BsZUod50sO20pVuaqJYMsHYckJIG+GB7rfTY5w1DkTkqzB6XuSDxG9/Roh4tdbBP31giAY6t
 COwHyJHjUAxhncm2eD1P0DMvaIWKC40=
X-Proofpoint-GUID: mhMHleBgkBdh83ycLCkUfLqNEl9dQ9Xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140051
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
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118931-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3241F751120

The current implementation manually calls pm_runtime_enable() in probe()
and pm_runtime_disable() in remove() and error paths. This pattern is
error-prone and requires careful cleanup in all failure paths. Using the
devres-managed variant eliminates this complexity.

Migrate from manual pm_runtime_enable()/pm_runtime_disable() calls to
the devres-managed devm_pm_runtime_enable() API. This simplifies the
driver by automatically handling runtime PM cleanup when the device is
removed or probe fails. This helps  with Simplified error handling and
Automatic cleanup.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
v2->v3:
- Added Reviewed-by tag from Konrad Dybcio.
Link to v2: https://lore.kernel.org/all/20260713064130.1681130-1-mukesh.savaliya@oss.qualcomm.com/

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


