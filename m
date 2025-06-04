Return-Path: <linux-arm-msm+bounces-60173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 553FEACD7A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80CB0188E4DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 06:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE80230BF6;
	Wed,  4 Jun 2025 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7/ZZT/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90F433B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016830; cv=none; b=J//UyLZD/um7DuEymxxkrsmEqJOKdrX2QXb3WDP6+7KDT0aGAyXTFYNPd0wzClSAgFy4f+96qBRrKBrR+rmoS6IhRyEIoBdYvkgcC66i33Wb0rBf7HvYfUatcKfQ2ORdTn7tWRw8uGE5alHbcFGLCjjKmEanQzH38l3nbU3olo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016830; c=relaxed/simple;
	bh=0+TEVJg7p2jL1KfAfPfpeOEnS0LGaLrv7X5P6gJE1cA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VgwiMq0wflp5a9nN4XzXiCWSll8PSCTT5eKawdm3VbCcBLuCioJVKwCNwZUDboT/rSqXvtySnPiMHydcBLv9YjU7OX+UoBqrsOpjmPXj4KRx+WHdZbVyStFBqLCinpae2rx0dpH47nPpNoFXKAOMp1lEgrZ2Tb0ijFCkb6CdbQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7/ZZT/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540F1iG012737
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/LV17/bXn+ta4up463Ni2dQX99wlzghOGZu
	OYVPW/f8=; b=d7/ZZT/6RqMfxHF5fLGEWlueeuiQB/GTlyb50MrS8FZXeh+mnpf
	Lzxr6hpzyCLrybj8y8kakAJq4vDP1DjHgZ8mzsmvTNHYQcvzTj1fWAuBZNN8wFNV
	PspmJozjQ/InRfKIs8DL/HuPhdI1wowiLW9RpAAsiLrMRcTYtaugRKT2J++jGY1Y
	OfnQgU3/5RRhs0u+4JoWAQIOcNss+EaWGLbHczaAXjn4FEPQqZy8CY3ELiE6pctd
	fODFTei6sO4ZGUOqiFgoha+cCVxeflsWwPwKG9qxBrGvbU2eGLY/n/EdaO28ZyA3
	DZgtM9Y0DVHFSK8K9KQ442iUglYT6qstrig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be80pxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:00:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234aceaf591so45618795ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 23:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016827; x=1749621627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LV17/bXn+ta4up463Ni2dQX99wlzghOGZuOYVPW/f8=;
        b=XSMYKMA7kMF0oPnHNYiu5kecuHc3xXxEfXymfqNDduQ7EavldXYNMwjoa3POttKwCL
         77nyzTsRX0W0BGQ7Dv8FAC3tNuE38hvwDrthQ2EAT6XPyuw0JmaZVScZEUHvs5S7+iZb
         tz1ILf44NyTt//+y7lGI3xWLzhT9LOTDlHDhGUSVySBEklXzaStaQtHZGvEhP6wx6q0m
         0D9iwFUkmFoA4Kn1y3bkRaUnRo0S30lBMbYWggbgLiR3+Cqy8U5FDjy/5ipBw2j5waSD
         f5ba/QhX0tb/r6EgWixsKhey9WtXpYom5CRL8YD2DsVu4EfmV5HCg+szGwFEfQcrYI0v
         FFWg==
X-Gm-Message-State: AOJu0YxRlxTzkHXBBPrV4YHq8ussSwEMdLja6ygHto9Y6sg9pLmkAHM+
	zwOX2qXNJzDwSgi0FSwadhV6ICsabLkI9Q35gdteOv7HycnkRnB5HlRXiZTFH7nvnQnok7j8Sz6
	Nn9ySMQRy49j2Y9LJEj5VHZpwwski2usa08rT+aJBzB1ujolROWMjfOU5INayF2Qe5L3+
X-Gm-Gg: ASbGncveTd5MO86CaL+uiwmU9ybgmZhObsuEYbH7uGwlRI2Nqm/Yhuj3S5ubv1TrK4t
	vGpw27Cw8vtki2MKxKPkfU3PK0rBsLJrqFfD115kiPe4IunBcStPW4Ln+rtu2vu8Pne9k7eyz4X
	5tBd8GGy3T4OFBZub1gqgXV9aBVTRrp09MstdEBHifuPBKqJxQQcPUa432t8AmGVAlIR8zSfkIP
	KEfnoeRJhbQLyfTok+H9bXa5vf1B857jlaoWwN3ifuVNoXdfPAvjj/W13OUDD4eMqtX2/aNVfRD
	nPqfu3QHNhGCn94K+cd7qY3TjcDvOG0sIzQUrPvtyLwNiKm1dw==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr23432245ad.39.1749016827107;
        Tue, 03 Jun 2025 23:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW3A3paX4fMhfimwAYJuU41jJO6w5XA12vlCaJUDb2iyxsilOXnnW8zPr0niNBljXMt9j3ig==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr23431645ad.39.1749016826607;
        Tue, 03 Jun 2025 23:00:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312e73face1sm1417579a91.1.2025.06.03.23.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:00:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
Date: Wed,  4 Jun 2025 11:30:19 +0530
Message-Id: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683fe0fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rzSUB_1TqBMNDQYVAdkA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NsuvML18PMC31KZ63a5bqx6E9gDD_7MW
X-Proofpoint-ORIG-GUID: NsuvML18PMC31KZ63a5bqx6E9gDD_7MW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0OSBTYWx0ZWRfX+oo7zhDyR2KA
 IJXnvwmDxO9eB2aJRA1rZfhWhA8/VnTYCMTGopHZn+RoarAtyIsT+51GVa58hJiZ3L/2G8d8PcG
 6Ite91JBVzqzehePVTMQ/H32lojHYtL/iQXYwvQbEo3MCkpQgSWZIuz8/6KDRUESxkx+ssAXrpw
 lhghYXayXi90nl0ZkAboi8g/V/puwoXC+tXc1PxPKUQ1nQAw5Sji+S/2XglpMimqgOeQSl/bxgc
 nkb0VPrDyLrYICuF3L92UhIGY9CQWxbFsgv7xUJv8gVPYJPuIZ3ZnzJSGhWW7a9r3Ph+OT4Z/iw
 pde9jnFT/cAlvqvHHa22CTiP6JgX1N9IEkixwDjV4KHUfwi1nJDJ1ula9nNj8st0M9n+sIqvvAC
 CHnUyyipVhg+XuKlJqdtqgJGZcHaPBkx801373aWW4OP7YQPCujzNA0YCnGxWR+xfAXsSpQ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=976 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040049

Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
blocks any subsequent attempts of probing the device, e.g. after a probe
deferral, with the following showing in the log:

[    1.332226] usb30_prim_gdsc status stuck at 'off'

Leave the BCR deasserted when exiting the driver to avoid this issue.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7334de85ad10..ca7e1c02773a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -680,12 +680,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		goto reset_assert;
+		return ret;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		goto reset_assert;
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -755,8 +755,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-reset_assert:
-	reset_control_assert(qcom->resets);
 
 	return ret;
 }
@@ -771,7 +769,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	dwc3_qcom_interconnect_exit(qcom);
-	reset_control_assert(qcom->resets);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
-- 
2.34.1


