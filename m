Return-Path: <linux-arm-msm+bounces-77100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E9BD7F41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B58C4E0F30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE5619CCF5;
	Tue, 14 Oct 2025 07:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxJx0KAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9923D7FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760427340; cv=none; b=DQY+AujaqKRl1QUTGYGOdr0fuMwoYLG461gsQjFao8B8D3jUFpITwW/U2PcFNtJr6lo9cT+RpEB9+3tlAwdgCyxxRC4bzd+OPv5ZlZD1y04KluuyR5qlfejfcK85bBiQ11tlDLAu2Qv3rjauifJSzYdeQzzfZi35p49uhx7t630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760427340; c=relaxed/simple;
	bh=+9KJgUfIBS11iAKR5LnNdo1j7qdwGm2mPaEPeiV2PwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yu8W4Av6+VyX1YVYdkNULTtFSYqlw51VyCZeXnOhjm/kwU/rVVkgWclULA9Nn4C5x83uxvoT5JoVst0ON/g73QZsT4cgdnKP9nqPn1hGm2Fm3IBXgs6HRApIo0ZSBEUXa+GRtyJ0ipO5wEEcl5i3A00NXLQpQy7OoHWR8lkQt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxJx0KAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6LKlY016843
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aA7JCiuVVRCy3V30ThlamZSn/80oafKR6lF
	slO98isQ=; b=YxJx0KAxO2DqDO8I0IKd7HJf3ZDdKG0xzvCT/lLqkhtagBriu9E
	qR42JQe0OQhY2Nke4Vpeh9pTtdbGcOAVVfNmtg+l2gTL5Q9iWQAoBlQFET1Wiere
	cY+l05G5XIiXa8S1mE4DhMJ9Lqhgir+iR2ftCKJUGRcUOJjKDRmL9mQaJ+qfRwEd
	6fILSLEHu+Cwag/8EcpfEgRIB06tWg7Bm6J9U9gWDisWxCXc3W4cn7sJz0ssCohl
	2JRGe6Jph4NnrktfzmOxvVOoxqVGEsRTdCHbT/QAGbbWy9MyEAUVGjnszAi7uIdv
	WkBaRAjf0QALrxwJ6CXxZJn89NMjzq1BobA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1abwhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 07:35:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso116432475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760427337; x=1761032137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aA7JCiuVVRCy3V30ThlamZSn/80oafKR6lFslO98isQ=;
        b=Ydzpx5iXhddSbjDP49PvB4yVRnCZl1Q+B8+IWMOvF6YaxSbnCUqEJxnOFow4/RV3S0
         uhk1now+Cm256R7pLMwABMmHRQGbjY+/xV8SPXyCQ0ge/4sVQYy4LF+bMPiU5e8Lh+z9
         KerFDb+lThyG7R/PzZw+2WPkn3W/0h7lmQHBWHmjBjcr2Au32gmHIWQN+17+0pMMCUMw
         iThxWv3vLcU9L7jwhuK2mXFB6jeU7CykA179Fu+/tMlCujvcX8gCpK2M5QquxA0uXjn9
         86O7mFMj6NtNqhV3j/ec2fKw0OhsLeFWHkWDa3OOvkW9HTHDZXRtElQS0MKTapvyogCW
         6dUg==
X-Forwarded-Encrypted: i=1; AJvYcCUi1VSlhvHwp1udTJeRRC7K3vNxGl7kSTpX+KhsOLotM9HZdM1O/+0Aht1A/ZNuejsUfMuzONzlVcKIp64A@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQg5ZAztz9pq0Q5Ez2aCJF/dqg8evulBEFE5taLbUyJ4ackcC
	a3cthHhL4r0BMuiLLBAtb4ZF1T0s5HRyxitlCdliNXsNWCTUp1Jkh4gEUZXw3+kdetI1BZBKSWS
	oQUjFclupZYBu08c3RttgnXr2Y4FGI58q+STJLsY8PPVxB5YGN7d+Y2d/fQtNs5SFlJrr
X-Gm-Gg: ASbGncvLCIUVKAFUOu0bPtz0LTbA9Jq+HUcr3DMCDe8C0FlqRDSb4+lDBY06wp1Vc7R
	tf5zvBg645oz7rAcvELPrVDrPb1p7DFt4/pQntaLr55msKd2c24P2PIlCEfiacvZWJixzWBKmTR
	bMNhVFB1mxkImyo8Q15g/t0RJatUtP+4qsCF66/tceamCq/0+NO9sXXveBqDmp8hWT3lX8EuNji
	MJZNf38UumCJ9pm7Oxzqx3I5xyFQH64iFD7gZe0hhfHsS9O3Jxcnsb8lapEjoMyqQdgHs1H4bu9
	5Xh0XxoJitF9M0oZl+m5BnpnLewjxSBBsbNoEbVYrNtmx+swDffE+XtxtjDwa6xNqRTXu6mNBVa
	xaDMmneNaVvX/1PRAZ3o=
X-Received: by 2002:a17:903:2acc:b0:264:ee2:c40f with SMTP id d9443c01a7336-2902730237dmr320265095ad.52.1760427337280;
        Tue, 14 Oct 2025 00:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOxdIo88Y+BDPv1KzmWMec2XJ9wxExeRxOPDZ/MXxz4c5ZQPBmyG0bxZVL0yu6B0smPV2waQ==
X-Received: by 2002:a17:903:2acc:b0:264:ee2:c40f with SMTP id d9443c01a7336-2902730237dmr320264835ad.52.1760427336782;
        Tue, 14 Oct 2025 00:35:36 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b66sm156070585ad.124.2025.10.14.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:35:36 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
To: sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.tipton@oss.qualcomm.com,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Date: Tue, 14 Oct 2025 00:34:54 -0700
Message-Id: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68edfd4a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5ooIImjpSQmp0NYUP-EA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: pl9WA44Evzhq_pRflPiZqGM14n_rxdr4
X-Proofpoint-ORIG-GUID: pl9WA44Evzhq_pRflPiZqGM14n_rxdr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX47Qp0FJVKjgi
 9poNP3X5MpMEhC/ijKi38z8YQqdgp/56n/derUJWWD8vuZmKtD58Pc1a1OUlx67OCdg+4VQfVwM
 JqGtqvHCkfrqqFJ9HQbAp7Pc/qkh1fXoUO1As1k9jUesuC9Jrhc21nhJetPd4fGjlVjFkNBkInR
 J8YRm5bBoy1Is4B31kA6v25dp+BFj/Nk6sEQzJpvUcFS0uXc51wpSIkdr3wm5qCoDhwCKk2pK0q
 361W7k66j278QQgOp7w6Pu5jWDbx8EHb95jgFy56cOz3okwG5Bi0+FGOzNOHKOe5hr+eL6B1w3h
 bQHV9CjJLeIfx1bqGaeg8+iAhmmS9oGdIdxY9ko62kLpBecuvoQrj0++STXKfr0qm6Alpy+tLPS
 950C68UwwzRuO2KXUpReV8edCvv+FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Some upcoming SoCs define more than 32 operating performance points (OPPs),
exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
(next power of 2) to support these configurations.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 683fd9b85c5c..2249ef7fe790 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -27,7 +27,7 @@
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x40000
 
-#define MAX_OPPS		32
+#define MAX_OPPS		64
 
 enum scmi_performance_protocol_cmd {
 	PERF_DOMAIN_ATTRIBUTES = 0x3,
-- 
2.34.1


