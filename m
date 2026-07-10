Return-Path: <linux-arm-msm+bounces-118270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mhOqFjriUGro7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:14:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B273AA2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="E/IgDlPJ";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118270-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118270-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46676300A657
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2661D41CB43;
	Fri, 10 Jul 2026 12:14:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A54192F2;
	Fri, 10 Jul 2026 12:14:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685657; cv=none; b=FMHlbJubhNq+xYvRjArH0DMfgEg8esK/X3wtw98sKWu/MFsTdFWymidxCqn6feINvliPs9JTosw4pkVv9TbFmwnq2NgAgxV5tZaPQ9+jMVk28zE6DJB6Uob/bcXd1v9Us+IxEd1VP15HXHky/3hQdbhTHhmKjKH+r5OHEq2vITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685657; c=relaxed/simple;
	bh=i1/xz8wWfyH4E86yHC/JCwF9URPt4BxDfTfDi2YM368=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWglcygib0oRUy9BGUUx2ke1aY/hzKLmMWZe+ynfsVSwNDXXiPmzOiHxAKsFCio7qUSaZvwvxkrYuX48uZ2lQRyjWW/Dg4EBfKWQ17pK0CJKMBmKPFqBxEUCOGCroI4RKBP0j0SMfJa1uFhF8waPepQ9Wzl/cu+CEfrgFrwESeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/IgDlPJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmLkI471580;
	Fri, 10 Jul 2026 12:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KUp0njjipWTl4NamUY/nyz+LDx31aeyy0BX
	koPLoe9I=; b=E/IgDlPJ8wCYhWst4cQRU5cxcyb0M+oAI21GWhoPlJdkUA62Jzv
	TKpmpVujnowno6lgaMAqyC1LNuDi3jK7UabeDVt17jlMS5f65713amACKjHKnbhP
	ChiJzYfrhqWk8LtwaK6oo9Pijei0JyKwmbf9eaQkOs/2NEe6gKmSqoYqXgBAnxjm
	4lJSJ1OiocBf1XEbHIzH7EBijprmkQ0YZ3eDKuzHV83d+bYclLmkohPOAmJQCi5q
	W+jF0prw0VBjQn7N0paeunmtdbM1aGnQjDenbUVLSXmeVRQl6HYG0QwJv/NJKuN2
	Y+xF9yb+Now4ji8hD3wEgEkjj/6v0+pJcrw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgjdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 12:14:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66ACE9ex026169;
	Fri, 10 Jul 2026 12:14:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8mj2ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 12:14:09 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66ACE90O026162;
	Fri, 10 Jul 2026 12:14:09 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66ACE8TF026160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 12:14:09 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 9025D21BE5; Fri, 10 Jul 2026 17:44:07 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH] i2c: qcom-geni: Use devm_pm_runtime_enable() for PM management
Date: Fri, 10 Jul 2026 17:43:56 +0530
Message-ID: <20260710121356.4054600-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyMSBTYWx0ZWRfX81jIevvi02bN
 2mr9dxIMYSmH637VHDVzrvhuosWsTHvCEKKfjTyJ4Qq6O9YNC/YtgiPcRi9R2ajcQCz8PP7wCkA
 Ep/iaM2EgSmaaPUEvxN5ujbBEWNAVOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyMSBTYWx0ZWRfXzf12iG+LFgHg
 gHzqXEN+OyE2tOFLRlwqgpFgzVWwQJOi5omh1desfcIaHwjwPffW/6R2THvlxWOBehZgysjfZDf
 DUCExHqTTvQsBTADcpyQYx/ba9o7NSx1rc1i+5SAeIL62uxpfgBR9yrsw8UDYGuS/NWjaJWAVY7
 9iWhIC9aQlVvS4ECAJSmUS0epQqq1I+qpmJmgM+7PYNfKTeD+x5dmJHhUcrcPAUMKT3wAxHRd6B
 zpryJjyZaqeaHc0F1MhSiFBXEYF6nV7MmLItUp275ShInVdLcNV5OuLOji0hAXXYBNNWXh52Y17
 Ycu/JKu7rOVOwU+Z0/ZG6K+Kh+/2nhUIFIuUXk7Y40tMu8cT7kCfbRIG7gJIsjQIXNAIKWlS8a8
 JPJcanuACr/pEDGigqDcZn3Lkb2G83a83hJwZ7ZBjGYyEp0Atws69NVY0u7FHvS17y0bSdmoILx
 XYBtfznxbW0cjgp7hZQ==
X-Proofpoint-GUID: 669rlnIQwKc8jqTR4pitJwIUqerVYCDT
X-Proofpoint-ORIG-GUID: 669rlnIQwKc8jqTR4pitJwIUqerVYCDT
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50e215 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=vJYAS9Oye7c21ubkJLQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-118270-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 446B273AA2D

The current implementation manually calls pm_runtime_enable() in probe()
and pm_runtime_disable() in remove() and error paths. This pattern is
error-prone and requires careful cleanup in all failure paths. Using the
devres-managed variant eliminates this complexity.

Migrate from manual pm_runtime_enable()/pm_runtime_disable() calls to
the devres-managed devm_pm_runtime_enable() API. This simplifies the
driver by automatically handling runtime PM cleanup when the device is
removed or probe fails. This helps  with Simplified error handling and
Automatic cleanup.

Changes:
- Replace pm_runtime_enable() with devm_pm_runtime_enable() in probe()
- Remove pm_runtime_disable() from remove() function
- Remove pm_runtime_disable() from probe() error paths after
  geni_i2c_init() and i2c_add_adapter()
- Use 'dev' pointer consistently instead of 'gi2c->se.dev' for PM APIs

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..6d6c2fa287ca 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1126,27 +1126,25 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
-	pm_runtime_set_suspended(gi2c->se.dev);
-	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
-	pm_runtime_use_autosuspend(gi2c->se.dev);
-	pm_runtime_enable(gi2c->se.dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, I2C_AUTO_SUSPEND_DELAY);
+	pm_runtime_use_autosuspend(dev);
 
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


