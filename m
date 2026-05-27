Return-Path: <linux-arm-msm+bounces-109942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF2HDdGwFmoRowcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:52:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5A5E15C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47794300360F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 08:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD6C3E2AC9;
	Wed, 27 May 2026 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnBxcLQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtgPt8n0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840DA3E2AD6
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871950; cv=none; b=fdqN8z0wxRK/OJkByymFPCknZI04Fb4Xpkg/QWF1jmrY14SJ8C/qWHmk6BVxsMTfCvX48sdsEzNwYhk6wlOiqIiFRZoFQGm6AqzZGnXG362jVaBGY6flN5k878RA0bQ81DWhp8AKpXZuH1y1qI3aPS52ReD7i1633wIMB2tK1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871950; c=relaxed/simple;
	bh=ydp3iiH3t45YwufOFs9xQs9qEz4U89SME+5Zvi/mahQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCwlyCXLCnuOjj0vKPeaQzUKFjcNhUDJMzBLOBLE2+h4ejNux8yBifb1s0wF3/3h2k+/jy7aa9RSECvBCLf/tx71R9oeYBgExo2tjH5NsxKuM6OUhQA3EFBrOQa7/J+TFwxY2T5NCHOUwaqLmwOo2tYXeR+umsh1dRNzs80xYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnBxcLQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtgPt8n0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8minY1351121
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 08:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T/chsqjTnFdkud9/UATRE73Ia/WpFMOscnZ
	9VfaUcDU=; b=RnBxcLQl9ZT8ZlB8FzkL7qCzH1WwZHdUKv9nDPX4iD45gPPTuHy
	xIDLe5fKg3JTdb2o/2kPdhlPdiwH0IfF7zi1q3T4VbLLU4XUCP1HB/Ql8RdGHpdE
	wDpwXCIW0wjmiMT+VljDh69SqBV+ZVQX0WrixfjpErXMgXQvID0Cng02xaOlkYc3
	lcjPZ0zDXu7qJZMMUc+qxkyYRYz+1QgUU9CibfvqOCGJM/MB4vBklRemNnvBnoGM
	ySJCLBq7WVoCQscvThl6+YsgzFepzutFT+F3sVhLBjL1bKAtkfbjOM2qTt8es0+p
	vbcq71TZOCDVGv8WO+DzyE8RrWG9b5tz3wg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentk6ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 08:52:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ba8a1f3dd7so27304786d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779871947; x=1780476747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/chsqjTnFdkud9/UATRE73Ia/WpFMOscnZ9VfaUcDU=;
        b=JtgPt8n0JB1JeD61eqmEOogyWR5nCsidRK8UPgoLe85TuSX2DHA3oXnovQhTXXFAru
         ZpooZF5CXXYi7eG40p9u7b7Qad794jw0rfxBaDDsXbFZIOZ54mq0Jam2YhkdBUcKEAEI
         0QZFWt3VhD4S4WZWbJTTTj0IZ9+RTxgrrBx7x8N5d41OqMgi8VRh8xRG0heJI6bovFx6
         OF1BejvMFQfT9mCT+L7A7IJx69AFPbUxMJmwS1A3X/JpoWIFHnNykr6pK6xc213igQjh
         g9VDShD5GU/5l1q/jtVxCPnORMGByIKCsRjR2hzSZ+mARhAE0NS2oRUvcElyrDTCK/Vt
         INJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779871947; x=1780476747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/chsqjTnFdkud9/UATRE73Ia/WpFMOscnZ9VfaUcDU=;
        b=L1EOEJPwwd3ezsSSDSP0ErXdAXoyPXC/BiU0YDMjHxlAeRaPxDEy0Dw1lPYyGMN0k1
         MEsqSbhpOiNfCXLn8X1WVFBfQHU1NdT9Pm4gKAtCW7vrH9yhoO78jF0rbuHjrBzCqOic
         PbKrGcP4P31L5dDcbmcfH+fnZ0DL4th0fusQVfLxAHdf2G6TWZBOfCTYAaEYGlW6GHtZ
         X6cbw+2BD6wMSm3Pse8IhS8ret18TzqYAta3fmR2g2l4i9HS6wem/wN45diixrlGOlgf
         2nvyh+eSUXd3B7Cy+Ec9pELDquQXOHOnStWMpjtdhJ4GF6cV1gV+3YIL1pJHf7ujg9VB
         tAbg==
X-Gm-Message-State: AOJu0YxSMpF4gecEYf8x/PkQUg69f2sP4aSyNk5GflSNDon0EvJMZo5q
	Q25grgY4fnnt3FJKYNngWOE4KrwLZWymAnAe3TPqFdp4RFVWVBrfL0L9651m8JhNnhdBx7qqgQl
	HMYZ9NxFqVrA1KITnU5BKMe7edTL2VOmighZ+q1q7A6o6BNuKMvdgTyJoXn/SUH5tALlB
X-Gm-Gg: Acq92OE2D2sMeKFxefMtcnxYr9HThjzdpc5Q3MjD5LtZ0uRj7EQQeRZvJxYtG/iBpj5
	Rkttn99bS+CPpa7+4pHnwK7+I8yL52m2w/DDcWdkYO/jSa26K/hMkp1S3uKgCuBFDXZpBKnNcvB
	2NjB/Jgx0D8l4NH+GHhIH6Sx5USAqXwHF9PCNw+vg/k2kq1WV3CbF2FRoMV3qHPkKRzIAuggzoY
	yMU/7HlrOYfov4n/5vy8u/NodYqxCnO3EdKfSkSAqSJQpe7IEzqKrntPLf8Al08m7h4FiniMt0K
	9CrUOfW4yRWGNx+CTccV7j6eJhAK59CgE8VKr/sJc69vjEzjgzVXDzeN0iA5vcAMkZqEbC6lREk
	wGUY2qwrkCAYVV+gM9NujV7XbFK0uN+P172Cx78ULAvqS3g1g3XHd/w3TAW7bp2EinYdCwViD0d
	wXH97mMhEmQjdM/gqU9aYMeg==
X-Received: by 2002:ac8:5a45:0:b0:517:146c:c869 with SMTP id d75a77b69052e-517146cebebmr13526701cf.31.1779871946507;
        Wed, 27 May 2026 01:52:26 -0700 (PDT)
X-Received: by 2002:ac8:5a45:0:b0:517:146c:c869 with SMTP id d75a77b69052e-517146cebebmr13526431cf.31.1779871945964;
        Wed, 27 May 2026 01:52:25 -0700 (PDT)
Received: from work.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c27e7sm4601127f8f.35.2026.05.27.01.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:52:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Fix the physical function check
Date: Wed, 27 May 2026 10:52:20 +0200
Message-ID: <20260527085220.14139-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16b0cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Byx-y9mGAAAA:8
 a=EUspDBNiAAAA:8 a=_ArHcOP2DiPeV0EhLvoA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 3SgZe7kCguQn7VfeILrsjLcgkeU1rOQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA4NSBTYWx0ZWRfX6GVWUf2k+2NK
 QReeM14DdAzr5nnZS1wwwpfT7nxLKozhWNjKWjUrk2mmHDkJW4JwoYyjUBFPWSpHboAuHmE1t7r
 irgChKsRLXDIphinoSm+R1baneewnJWsDp02DkEAlQ8Dbm9GOZc52aAB6HkaRV7jZHRMn8CfPM8
 Z4SI4LWXF7NbmNMNyuYEb61tDr7Rl1TAX5Cuf6JlO5aLl2hf+oJLP2izksbQf+nGK3DMherDIB9
 +rkwMIr9rmlbD4JEs506Mzh0836HXDWbvVzB7C8QBqPWkQmmqfdZ5AGnEOww6wxoDiqyAwqVcEK
 0V5ECmVXn0Od5+KwDS+ZaoSuZHZ/k0Cv0mgNosI+VM0g7XtX4DiQrSSiqsfHqxbEBcNPSujGdnu
 Hwnqy3Lx13iv5/VKR21XV49Jp8NVAflM4XBvfa5ZfZ7x7+M4TimcNkUrYhjv7m6bxYx0EbZqKw3
 NXss/oAxJlh8DT6WsXA==
X-Proofpoint-GUID: 3SgZe7kCguQn7VfeILrsjLcgkeU1rOQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270085
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,163.com];
	TAGGED_FROM(0.00)[bounces-109942-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1C5A5E15C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit b4d01c5b9a9d ("bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID
for VF's to check status") added the check for physical function by
checking for 'pdev->is_physfn. But 'pdev->is_physfn' is only set for the
physical function of a SR-IOV capable device. But for the non-SR-IOV device
this variable will be 0. So this check ended up breaking the health check
functionality for all non-SR-IOV devices.

Fix it by checking for '!pdev->is_virtfn' to make sure that the check is
only skipped for virtual functions.

Reported-by: Slark Xiao <slark_xiao@163.com>
Fixes: b4d01c5b9a9d ("bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 5836ecb0ea32..0d0d9c7ffa4b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1261,7 +1261,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete(&mhi_pdev->health_check_timer);
 
 	pm_runtime_forbid(&pdev->dev);
@@ -1291,7 +1291,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	return;
@@ -1382,7 +1382,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		mhi_cntrl_config = info->config;
 
 	/* Initialize health check monitor only for Physical functions */
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
@@ -1404,7 +1404,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mhi_pdev->reset_on_remove = info->reset_on_remove;
 
 	if (info->edl_trigger)
@@ -1453,7 +1453,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
 	/* start health check */
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
@@ -1482,7 +1482,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	pm_runtime_forbid(&pdev->dev);
 	pci_disable_sriov(pdev);
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
@@ -1514,7 +1514,7 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete(&mhi_pdev->health_check_timer);
 
 	/* Clean up MHI state */
@@ -1560,7 +1560,7 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
@@ -1626,7 +1626,7 @@ static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
 	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
 		return 0;
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete(&mhi_pdev->health_check_timer);
 
 	cancel_work_sync(&mhi_pdev->recovery_work);
@@ -1679,7 +1679,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 	}
 
 	/* Resume health check */
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* It can be a remote wakeup (no mhi runtime_get), update access time */
-- 
2.51.0


