Return-Path: <linux-arm-msm+bounces-73426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B6B56A04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 17:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35F9C175046
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68B5296BC3;
	Sun, 14 Sep 2025 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1faTB5N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C7C1F03DE
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757862445; cv=none; b=J03OTD9QCYThcth0UGOYZ4/m/7l7uTtPCo/7jDmdR8kGyGuOBo4tnTn4N8QfGbdlmaz4FlGAMbpXEp27MvhRcsj/KKIwTG4WhZGcXcdSWiJdPOdd/uvbLOEKyR4ERExSjVQJ44wJPtaUYY3fXaOOhmsB82/mLQQq7hYbAdfao5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757862445; c=relaxed/simple;
	bh=Xm04sNqg6M8XDtv4CgRhGuHsDDCT4cUD0lbe9sIdlTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QSQPn9f8cdbC+lRZRQWaNR6gn+ckRsi4wlICIQ0MLbJCdawcNvU05Sl6eGoLTwCxpf70iIfufAqUNpn0DzVEKzTHK3yHKGGR3wYHp2f7FGe32DvuGMVtRltIQ20mCsu2Ohs5YdfH5LhILyxiD1sMceESnLYiwKqIhdvRxTwxPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1faTB5N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E8ujLI026377
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 15:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mpnZTgEP6/zsg99dZFw1ct
	tV1r11s4EWbty3YUt72oc=; b=n1faTB5NTnl6tRExu54P9tzy9KvFhYyMvlEfrF
	wnxZlqO9dAUICiL1731xglQpvu0vM41eTbQ90ifE1kzFxPMxKRFp7XbClvWaVYoa
	9HnI63WW4IvKMKZNmROy/chuEbaYv6OJDIh4J66A017hCexjDtbkBAmEjTuZCEPu
	1e2elaXGixg7S65lunzMmumzkmAExdK1hfTOB4HAggCpSyfp3RmpaOJoad80AUC2
	ykQ1DngyA8soEYp81sXbpszozrM0HAbWaj/PHkDliI7NyriMmy2DthidHaBeeL5j
	PvgtaxQnlq2GOBDimDoCkpCJjwUFjfJdoulY3WWDv/+FuLow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chaaww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 15:07:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f59889so36489545ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 08:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757862442; x=1758467242;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpnZTgEP6/zsg99dZFw1cttV1r11s4EWbty3YUt72oc=;
        b=EjEdL2IsavnoyrCfhahPI6u2QKQwdU4IfiETh8tzmm50urrMQKuIZEtb4dEm6Jdr3g
         FaNnI2tBO9gvIXKhuBqtwkSYsUET1gXDwn4V14ixpyVHOVJYB/bJenX6xATluK6Rb+Rj
         Cb+la1oPQO3odemfqYcIXhaJvZ9wXagpsex75ywd1zr7hcsqyUxfJlzYXojwk3vAhzPj
         +s5RA2fxBfgyvsMRrZ0HShjN1pNbjRuR1X/STLB/lHJoVw3bXiKoBpUrw4TZabOrWJ2Z
         hObp7+HQDjUJz5+QizvIxH7d+l+SMb5v9rYiIFx46Nlxj4ojeaclOoKFCU4eOR24awY6
         ihhw==
X-Forwarded-Encrypted: i=1; AJvYcCWMmLvaar1HiD1cPW7gW54EE60fHazQidH93Lnpefr3xtJ88DlLqJa7cw6xza49DLXXbZS0DVWN+eiRghdE@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzVBY+i0ICLKT2ylO38BuGukLSs272dAY3p3L+Q1XcOfjW/J9
	ugYNi4wjbnxG2nYlN0PYG+t/xqyZA/ZkUkEksNwLdkfAwlqcqdn5pKe5ZiRj/2lr58JRarsvxKK
	EwZcVoKuTA6AFd8kTwfOk2MTquzd2keb2CKrNxWiOQqUFPC2BO+2FXgg/3729IPblWc67
X-Gm-Gg: ASbGnctM7OVhG5kNE85cV3NOTpZpdhtPsbK+8/qX8eLmCo5KTIR4mFk5VGBpNCXH+Cz
	C4xxBtmE74w104FzGkTMcpSihgU9FZndrZj5ukapW+nBM1b6etiYOyel6mXjDGmvB9jVmILtJuD
	JNoAjvYj/oikueXYcqKi80o+hLY5f8QecJz+HVrDkHhaTBPXY6ZRzM9IYwivHcoCa4/J5PynO1c
	NFs1EuEtheafGlsL5KMom15RFxLnff3wTIYJoxJ+ibchVksnHgfMc9+XDY4HAeEzrdHAog3HqLc
	PH6BGTZsy0szfrbWA0gGZ3Q5fnsl8u6FuqymYrMrRaXRhaCZtsrpsdjmALK5nUIAgSw3WQ==
X-Received: by 2002:a17:903:1acf:b0:25f:9682:74ae with SMTP id d9443c01a7336-25f9682760bmr74240925ad.29.1757862442271;
        Sun, 14 Sep 2025 08:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM2SEI/4RHZARg2DjwJIXHfkwPqpsE8n4zdcMsj54ea6iU2s7Mz+jWRjVuhZf130ZMHHhOOQ==
X-Received: by 2002:a17:903:1acf:b0:25f:9682:74ae with SMTP id d9443c01a7336-25f9682760bmr74240645ad.29.1757862441744;
        Sun, 14 Sep 2025 08:07:21 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-261d3dd029bsm41290835ad.25.2025.09.14.08.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:07:21 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sun, 14 Sep 2025 20:36:48 +0530
Subject: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAfaxmgC/x3MTQqAIBBA4avErBNGSfq5SkSYTTWLrFRCiO6et
 PwW7z0QyDMF6IoHPN0c+HAZsizAbsatJHjOBoVKYyuVuKxpsEmjN5HG3US7CV3jXFWLljgpyOH
 paeH0T3twFIWjFGF43w+AXFmxbgAAAA==
X-Change-ID: 20250912-qca808x_rate_match-570d44f510b2
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757862438; l=2388;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Xm04sNqg6M8XDtv4CgRhGuHsDDCT4cUD0lbe9sIdlTY=;
 b=yxKm8rrtwIeIwjA72uec0u0qsefs0G7ye/yy0CscNZpqsuIxMj3rdWgjPilCqrX59l/JKDvQQ
 qvP/8f6UxZQCD/nSWnt5401kDVSBftS5L4uMGuX6zwt7uB7F2SIcqMr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c6da2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QNaXVSbgLMPUDDG8BmgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: TUwAmqspfz3601zfAlv5iK1IQvvYBoUS
X-Proofpoint-GUID: TUwAmqspfz3601zfAlv5iK1IQvvYBoUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX2/YyZm/wRjG/
 UB12QLbyxEHYqWUs+3uzw9R8G/VsZWZDDdi3ZFzd4cx7GjMD/MnP414szfwqTWCh9xDcjbffeuq
 D7Um+zCgUV4lk0OhRfgRFjwTpbxaUDHb7WXmZf5ivc/K+69z3opqRGSGUrLCCe0yY3LzCVkUHBO
 2YbMzOFhbvFU4Pfh4TMlItGoCFl8qxJvSZ4ZO2Zs8M+XljnlLlcg4M+8SAGMZ/7fVgedLJ1OOey
 C0nclqMdVJQhWGx6vJyqaE5Hjpjd5bARKFAUqHfhvlTFf9fCwXqgD7dlny79rjrfg3S5BmKqqYP
 C6NG75nqHLjnjn1ZPQu0lFV3L4GHbCtgmVRZXBO3P9zrresOixrGHFSnAddmTHMIRRvgwagPeEI
 B3VJX1Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

Add support for rate matching to the QCA8081 PHY driver to correctly
report its capabilities. Some boards[0][1] with this PHY currently
report support only for 2.5G.

Implement the .get_rate_matching callback to allow phylink to determine
the actual PHY capabilities and report them accurately.

Before:
 # ethtool eth0
  Settings for eth0:
         Supported ports: [  ]
         Supported link modes:   2500baseT/Full
         Supported pause frame use: Symmetric Receive-only
         ...

After:
 # ethtool eth0
  Settings for eth0:
         Supported ports: [  ]
         Supported link modes:   10baseT/Half 10baseT/Full
                                 100baseT/Half 100baseT/Full
                                 1000baseT/Full
                                 2500baseT/Full
         Supported pause frame use: Symmetric Receive-only
         ...

[0] https://lore.kernel.org/all/20250905192350.1223812-3-umang.chheda@oss.qualcomm.com/
[1] https://lore.kernel.org/all/20250908-lemans-evk-bu-v4-12-5c319c696a7d@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/phy/qcom/qca808x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 8eb51b1a006c4c68ddce26c97d7d4f87a68158b0..9d9e93d2fa8f57b1535bc83e169eb011ae549040 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -643,6 +643,15 @@ static void qca808x_get_phy_stats(struct phy_device *phydev,
 	qcom_phy_get_stats(stats, priv->hw_stats);
 }
 
+static int qca808x_get_rate_matching(struct phy_device *phydev,
+				     phy_interface_t iface)
+{
+	if (iface == PHY_INTERFACE_MODE_2500BASEX)
+		return RATE_MATCH_PAUSE;
+
+	return RATE_MATCH_NONE;
+}
+
 static struct phy_driver qca808x_driver[] = {
 {
 	/* Qualcomm QCA8081 */
@@ -674,6 +683,7 @@ static struct phy_driver qca808x_driver[] = {
 	.led_polarity_set	= qca808x_led_polarity_set,
 	.update_stats		= qca808x_update_stats,
 	.get_phy_stats		= qca808x_get_phy_stats,
+	.get_rate_matching	= qca808x_get_rate_matching,
 }, };
 
 module_phy_driver(qca808x_driver);

---
base-commit: 5adf6f2b9972dbb69f4dd11bae52ba251c64ecb7
change-id: 20250912-qca808x_rate_match-570d44f510b2

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


