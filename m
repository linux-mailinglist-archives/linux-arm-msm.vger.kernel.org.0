Return-Path: <linux-arm-msm+bounces-29147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAA958F58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 22:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FBF21F231EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 20:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA2A1C688D;
	Tue, 20 Aug 2024 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LuK4Qsfn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677441C463F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187012; cv=none; b=ONF3AK09fu7TIYOi7nK0Qtr1tQzAd/gOkTqZwlJ8A3T9uiEShp6DNeYcUJFaDjbMHdj6kDEHy48Q9B37LwxeXmrZAnHLVr+6ShQ/uhTXjxe1WExjWAFfr+3EgR1+A9FBNg71r+LRPtmOJ0bdgQ1IFaSnOXNVjQfH+zOo7FbTMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187012; c=relaxed/simple;
	bh=1C7H2IhePJTQf3u0zqC8CG3Yo+nkiNQntgc1A1k3Bq4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To; b=XmM9Ti+3ow0NvGJzqvw3DiKOCoVKBoJePpTCx/HFnCWliG8IDgIVZgVhyjxyyx5cUeFeHjki9rCRkfDoKIhRz1l3n62F26xsbbrgq67HGWqKE5iyQF8xGlHh8EyPkI5gBrKnUVMr4+YBw3hiDoSXAjKLNNpdwl+51i2so2ErOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LuK4Qsfn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KA5B0E011674
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+yzpF1DmBBvrpsEL6KPH53
	TX3Oz+nxINdND23rj8zF4=; b=LuK4Qsfn+XmEedpajDEE3s04syGVX34yt0y/Xx
	KOvhcejG02mveNT1LLxXTA8TqUnItVQOIJul+wGv0Oo3mFHpH+kse5/nhaRwni5W
	rp/mB9zn332eJkObuEAniT0yKkDL49S+hseNYbz/yziayrHRCaPjOtNhfqcpjdIb
	VO8Nfl4FuboZGiDvPmR3dCx7vG7HFIQsXqV924Jdwk5V9C8a30ShOaCQ9uBOBJ5W
	2B2b0gxJMDLXs3eb0k8Aj4gKsN9DAMwK/u8RUsmmSTy4mRFKdu+KCOQuqAGpKinn
	/JKP4h9QaYY2wkK7ynLBkAHYz2VGc6di7hOXiGZLisUQh9ww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j572vmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KKo7tw025463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 20:50:07 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 13:50:07 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH v3 0/3] soc: qcom: pmic_glink: v6.11-rc bug fixes
Date: Tue, 20 Aug 2024 13:29:29 -0700
Message-ID: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKn8xGYC/4XNPQ7CMAyG4atUmTHKD7QpE/dADK1xWgtISwIRq
 OrdCUwwIMb3k/x4EpECUxSbYhKBEkcefA6zKAT2je8I+JBbaKlX0ioL45kRuhP7I6QSlILQIEU
 wpXHrulyhMbXIx2Mgx/c3vNvn7jleh/B4/0nqtf4lkwIJzla4riqSLdbby42RPS5xOIsXmvQnV
 P+EdIasdWSaVjlJ+hua5/kJkcNTCgcBAAA=
To: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724187007; l=2710;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=1C7H2IhePJTQf3u0zqC8CG3Yo+nkiNQntgc1A1k3Bq4=;
 b=T+GjTLTgELjMWOFxEdng26/Xsl9fniLRtQHxyxQafzdY0zgfgIMtOcl9lbEKeuLVHQ+vgWCoT
 6CT639o+3rpAJxAn3HIITWXSDn6MrpPcx7VI0k2YMjflVlnbC89BJNY
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NOPio5ahUAPpYMWEV0N8h9LVgaY1XScO
X-Proofpoint-GUID: NOPio5ahUAPpYMWEV0N8h9LVgaY1XScO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=43 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=43
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200152

Amit and Johan both reported a NULL pointer dereference in the
pmic_glink client code during initialization, and Stephen Boyd pointed
out the problem (race condition).

While investigating, and writing the fix, I noticed that
ucsi_unregister() is called in atomic context but tries to sleep, and I
also noticed that the condition for when to inform the pmic_glink client
drivers when the remote has gone down is just wrong.

So, let's fix all three.

As mentioned in the commit message for the UCSI fix, I have a series in
the works that makes the GLINK callback happen in a sleepable context,
which would remove the need for the clients list to be protected by a
spinlock, and removing the work scheduling. This is however not -rc
material...

In addition to the NULL pointer dereference, there is the -ECANCELED
issue reported here:
https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/
Johan reports that these fixes do not address that issue.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Changes in v3:
- Renamed new_client()/register_client() to client_alloc()/client_register()
- Actually refer the correct commit in patch 2
- Parenthesis around comparison in patch 2
- IRQ context -> atomic context in commit message of patch 2
- Fixed typo in patch 3 subject
- Link to v2: https://lore.kernel.org/r/20240819-pmic-glink-v6-11-races-v2-0-88fe3ab1f0e2@quicinc.com

Changes in v2:
- Refer to the correct commit in the ucsi_unregister() patch.
- Updated wording in the same commit message about the new error message
  in the log.
- Changed the data type of the introduced state variables, opted to go
  for a bool as we only represent two states (and I would like to
  further clean this up going forward)
- Initialized the spinlock
- Link to v1: https://lore.kernel.org/r/20240818-pmic-glink-v6-11-races-v1-0-f87c577e0bc9@quicinc.com

---
Bjorn Andersson (3):
      soc: qcom: pmic_glink: Fix race during initialization
      usb: typec: ucsi: Move unregister out of atomic section
      soc: qcom: pmic_glink: Actually communicate when remote goes down

 drivers/power/supply/qcom_battmgr.c   | 16 ++++++++-----
 drivers/soc/qcom/pmic_glink.c         | 40 ++++++++++++++++++++++----------
 drivers/soc/qcom/pmic_glink_altmode.c | 17 +++++++++-----
 drivers/usb/typec/ucsi/ucsi_glink.c   | 43 ++++++++++++++++++++++++++---------
 include/linux/soc/qcom/pmic_glink.h   | 11 +++++----
 5 files changed, 87 insertions(+), 40 deletions(-)
---
base-commit: 2fd613d27928293eaa87788b10e8befb6805cd42
change-id: 20240818-pmic-glink-v6-11-races-363f5964c339

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


