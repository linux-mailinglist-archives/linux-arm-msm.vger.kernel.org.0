Return-Path: <linux-arm-msm+bounces-70880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A7B35A78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3ABC3A60AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51313176FF;
	Tue, 26 Aug 2025 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfvKEqCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19877305E08
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205654; cv=none; b=uWR06uvnoUeL+eUkuYoZuqzsY9PiRy/+SC9UqNmOcGZMCmcjt+mQPIpubxaXGKvTRaUNMUFWLhMJRS6BQStScO2k/uBtYKtzldyCtERRXLfuxgH2TP2IekWfvOoirzdyKuKcwkygva54KLpyIMPp3oGvvZx1my0KXw9uXdm2za0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205654; c=relaxed/simple;
	bh=KqqqFnVGCDs3nesGBqstpqJfzfP452kea0rfZ5Uc++4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f499KOz1g/VIKU1cNweytIJ98ixy3GPzjCXrzpj+FHOGsBV19tOTMUtSoJ71ZEGgp8abOhlHnhifZ7ycgl0aKST5XVAaEB46Rpy1u5Nfn2s/1/KiYwQHyGv5sf8/n4LjT7gwFQ9a1ab7mvyTc9ZBvTrEqzr2KuPBZIRb83yMGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfvKEqCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4dNtX032260
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 10:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9siQtWl1MwhzgADY9KZJpCqrJPXOzFq6MVL
	FHhgMkmQ=; b=BfvKEqCmFpq8+WUHNP9dfwjrxSmfjpP8EtujzsswfT9MIJmH34L
	iVcJU6YJ0uXNGSHoK8kQGgEaPNYQrlp9vi4X8CxGROKuIG8HtMX0pdeoaLVD8Uhk
	9R0yFtdh01X/NT2LQhDJD3O3zjAdZpUT3OLz+82AsIOfDl7YflJgA/32kD1JOnzz
	OATgHCJabhehK09Z/pFU/RYhSKaETrcN3VKU0zUn00PLYdVvOlKFatuC846ZAxqL
	GmCnKeKgCugMMYL6E0FXTdOBHRbGOXssILVHlP9iqFD34eEqI1ZuFvi5b2aN42xl
	RW7ncQPcGPI+eDNpguIwlzKKppUgVOmpdXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6tj0h03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 10:54:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-246088fc25cso60815235ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 03:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205651; x=1756810451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9siQtWl1MwhzgADY9KZJpCqrJPXOzFq6MVLFHhgMkmQ=;
        b=i2VJM7bm+6vmxOrE8GF+sgG158LJUtBQWyXyADyNqfYBPgajFMAPqLxXApwlFQ+Dio
         riDEx8DUVIiY5OgTvKOh1rCRuHuj51CYHPAqeNhkchH3YwzoCSIG15Jqwzsl1yL66IMP
         yYy3PfnILuH8EUkh7JgxoT9gA4s8at0gUced8PWOJHExfHWQ8owqZ5Qja50V0Bz5F4li
         bEUW/RElHsgscE/PmIuby8cib+Bj1lKROhEypJEsHEyqxKKYiaC505uRqxXjTsGXk2+q
         tMrFDeesEem/0+BPjJeNi2AvfGPl+JDRZvmA/X0vFiugiiSfLQsulnJX2FlOFMy9keg2
         Ttrg==
X-Gm-Message-State: AOJu0Yzj2z8OY0/xJbG6fh3ARIrs4b1GwABe5OZH1193OFWyeXOHR9o1
	Sogt7x0/RYEF/jpbzKM0YILLJ7pfbXnc7pGj/gkqgqVQyaY9ToNAimHWHJXV5Y7qyEfoZxI+2BT
	jGsMxpFkm0J0b9VDY8VWOYMj9MhYlPH9ZN213/uFf4CE86syPfq5/TgtwBFUmvK2CMd1k
X-Gm-Gg: ASbGnct49CYiUkduqrFkbE5aKmcLb8n4HwuQ3SFrNlOzJDiaDyPwEzTweSWDQrJm9Bo
	jmztY0yRp9VtSHM7vZQQRoR3yHB1akQ0gh+ENeOg+Sk+cE94MqnsjKaRRP0oX8LloZDs2CP7ElK
	quJB1RFNMSzz3M13vsBfuO9fhVP2XxUBURlWOUw2ySBJtt+iGEwsqujgv7VAfgSXz6AwWWSDSYC
	ZvrjnH17vKuuZOBXvYOzWJrXvT6xcg05ALCE6JBvF8HUawx3twP6Oox06aNGUVRTR6Aqt9/kHp6
	2z1CHeWF96PD2suDIdPhfr4seo2j9HmZk5pfv82vqyl2tpWa48e86vijqZwKOAp5g957
X-Received: by 2002:a17:902:dad1:b0:240:86b2:aeb6 with SMTP id d9443c01a7336-2462eeabb40mr237650345ad.26.1756205651406;
        Tue, 26 Aug 2025 03:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH61LPvg+slhOhBJV7cnFrlMGYe2vTWQvsbBvOIzQ4SQYG7XOswOXn6RSmy6CqhX7Amd41+Og==
X-Received: by 2002:a17:902:dad1:b0:240:86b2:aeb6 with SMTP id d9443c01a7336-2462eeabb40mr237649485ad.26.1756205650218;
        Tue, 26 Aug 2025 03:54:10 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246a4e7f517sm69316285ad.117.2025.08.26.03.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 03:54:09 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: m31-eusb2: Fix the error log while enabling clock
Date: Tue, 26 Aug 2025 16:22:54 +0530
Message-Id: <20250826105254.3758803-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX1+dGoif9X2Hj
 hSpgh7qj/92eg7mpNR4733GOZ0FCLLTm+EqAQZmiVjY01t6VB8USQTOY6U6I6PXqPIgcHD4JXvc
 GDGDGUigh4S/8PDgT+FGZo3I3QVoX9dAW9LlYAnEBgTVlS2+rrBDu202rMqdyQOgcCSZvcjZms1
 yfWyU9Sqpvxc9H4HjRvdZjyeZraXIoEPXjcG4GAgKCEFMv9DcQef03EJFxVf1l8NAyvSljESyA1
 Kby5WvJnCBFOYEg5HXLyolE9l7EUfdeGOQBQIVS4ZoHD7opFit7oV2/mFhCY1taf+cDJYaH6yL5
 S4uIA5gEzA/uV1o6w1hln4qyVhiIrWr87cbRvVJJfcQWP2ra0fLXQ47BbzySgca6pnjEftZFkfr
 B75PiIKW
X-Proofpoint-ORIG-GUID: cxQ206cWuZuXx8PwSTaIsrzKm6AvL3C8
X-Proofpoint-GUID: cxQ206cWuZuXx8PwSTaIsrzKm6AvL3C8
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ad9254 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FDOyUFNpIdPerGCltuEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

While enabling clock, we incorrectly log 'ref clk' as 'cfg ahb clk'
Fix this since the devicetree bindings mentions it as ref clock.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index bf32572566c4..0a0d2d9fc846 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -196,7 +196,7 @@ static int m31eusb2_phy_init(struct phy *uphy)
 
 	ret = clk_prepare_enable(phy->clk);
 	if (ret) {
-		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
+		dev_err(&uphy->dev, "failed to enable ref clock, %d\n", ret);
 		goto disable_repeater;
 	}
 
-- 
2.25.1


