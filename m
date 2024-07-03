Return-Path: <linux-arm-msm+bounces-25214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E4926B44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 00:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8D711C21621
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 22:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794FB13D892;
	Wed,  3 Jul 2024 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CZ4G/26l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE913BADF;
	Wed,  3 Jul 2024 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720044751; cv=none; b=Pfia8MguUMWVTjXAxIb5Ycziw/izaqqDxGg8H3JGZuSqaqbFYRwnOXkFXP0/J5a+0yxUw4RtGHrPWBvik/84Mgk1g7+GQCgodkLK8PA7O4RrffsMWK7oTHmeipuACRXH3GdjME5SQRDooBNVbY0GfRqPFD4PLzh/pay42wrsuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720044751; c=relaxed/simple;
	bh=MZ0WvAunE6U8aGANnBGcIBYCu1MEtz1FEgY2uyX4Eo4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rmrshfUhgCHpu6UAnhJmqUbrTQTYcjRD79ibCqLEHMYBh6iTnQhX6rDp+LjOyapybE1SVUHwr2Do8+DpEaMp0+uAtkB1ef0UUgV/Y3a1XwFCfMEWpxMCjB9qo1c6xM8azQVmbTWK90lfLkCi117GCrFdV4VgHTkTtI3MUaHt3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CZ4G/26l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463ENiZX011674;
	Wed, 3 Jul 2024 22:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pMCGGTUkS8c0/01CMRlNdv
	Nzmn73YBwGygIb3R8HjI8=; b=CZ4G/26lnMPk05Bj6ISJNMyo4tN2DK0RpqZdVs
	N6RTmHqys1vMtePUt3imKFRO19G/LOTMbJf00BUXYLpo6lCbyCHa+ZYHwvlDkONK
	juUm4o8519ZfoBTUSwi83PQMQ+cUEufOQEeYEGWTNsTNSS6aMZDOUTwUeeGp8pAO
	AQ+U7FthSpCidKp0gVKAIe9zItidCJ1hks715BdYkiXAO4F71D/kYzilDVhj/Ghl
	vDzUs64eqLkuyiqSiNublxZjahIiTLUer1wVeenF7Rpod50UZInYgdgWKS95Re1n
	oSDBxs38tItbHARv1nkoTMvuD3OZ1rgH3xBH5K+TnzgRF80Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yr9a5vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 22:12:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463MCPcb009444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 22:12:25 GMT
Received: from hu-collinsd-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Jul 2024 15:12:24 -0700
From: David Collins <quic_collinsd@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>, <linux-kernel@vger.kernel.org>
CC: David Collins <quic_collinsd@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
Subject: [PATCH] spmi: pmic-arb: use correct node when adding irq domain
Date: Wed, 3 Jul 2024 15:11:57 -0700
Message-ID: <20240703221157.3640361-1-quic_collinsd@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IR3GwurfXaz78LBw7FxNC2fvqcNF1Juc
X-Proofpoint-ORIG-GUID: IR3GwurfXaz78LBw7FxNC2fvqcNF1Juc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_16,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030165

Pass a pointer to the SPMI bus subnode instead of the top-
level PMIC arbiter node when calling irq_domain_add_tree().
This ensures that consumer IRQ mappings can be found
successfully at runtime.

Here is an example of a consumer device probe deferral that
happens without this fix in place:

[   18.197271] platform c42d000.spmi:qcom,pmk8550@0:pon_hlos@1300:pwrkey:
  deferred probe pending: pm8941-pwrkey: IRQ index 0 not found
[   18.197275] platform c42d000.spmi:qcom,pmk8550@0:pon_hlos@1300:resin:
  deferred probe pending: pm8941-pwrkey: IRQ index 0 not found

Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
Signed-off-by: David Collins <quic_collinsd@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 791cdc160c51..e6a4bf3abb1f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1737,8 +1737,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 
 	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
 
-	bus->domain = irq_domain_add_tree(dev->of_node,
-					  &pmic_arb_irq_domain_ops, bus);
+	bus->domain = irq_domain_add_tree(node, &pmic_arb_irq_domain_ops, bus);
 	if (!bus->domain) {
 		dev_err(&pdev->dev, "unable to create irq_domain\n");
 		return -ENOMEM;
-- 
2.25.1


