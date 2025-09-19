Return-Path: <linux-arm-msm+bounces-74206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB69B89F35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B981B585318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000BC313E29;
	Fri, 19 Sep 2025 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwB0s+Wy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588F63168F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291979; cv=none; b=t1gwq2Wqp2yJvzG154IVYarAoDdkyXwmJdPqmAiQ+ppi4zTWNWrzU8LJ5b/h9wGi+v/gcaGPYAKBUPmIBfuBRZNIBP39HNlZ3loNxZ35LsiYCgU+PABeH4hjM2W/nsrK1DcMwfA6P2A817tSd/xdmUIyuqvrbDaEk2XWdxBI7cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291979; c=relaxed/simple;
	bh=ZqkBdkbuOLKjKhpqL+qVKtuac3iLEKvjgh8IWhxZI7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzFVm/BVhp75LyF9WpXOl/9mzEEqqI3uaq8YjASro7xIdcejJ1RK1OQLkBViLizcPDhjAG7pVpv+Q6YOlNCRS5EFXe1L8QA+2uTtZukjNSHbxK0waVxb1bY60hOI/og6jtMi45EeIowirvXIOBEIWvp7BgY1Lvvd9CiupaXKrcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwB0s+Wy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9BPHW027215
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCtPUXVGiI4OAMFxMM1v+W6OUs1HWL6gOP86Ti0GuRw=; b=SwB0s+WyW6KvaWL9
	MJlJlqhzBPohuawXRb2OtMdO7hYBzKO47yZ5mVXFGvUH8NYgnjXsC0jfI/uwYqax
	42C3B4RxEOzFl37QYjx4b3X58v6QAuLcqBaqrTool+bBEctS4kn9Z5SuvaLftLmd
	bIhH3xLqpFRpm8YCof1QwmSgqS80D73RZuUd8JPKOOJOuJdTr7EJgHK4cBTFB7tq
	KVM2mH1ZO/1imFqGV9MWY+KKRZE/r7KtJUg+KNrsjhwU+Mf4ohptGthzxtvizz9s
	+0lq17nJVsHnFfdqQWSnu4ta4qdvdzsv1DW3D2tevlEexYlLrRFhRVxlbr7Y+JqV
	0iR0Rg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jgq71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26b3e727467so2157575ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291976; x=1758896776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCtPUXVGiI4OAMFxMM1v+W6OUs1HWL6gOP86Ti0GuRw=;
        b=t9YOknj8fbip8sf76c+nZpdO42aduoWVcSi9N13iKrRapGMV6A/JSjTiL+MhOSRGve
         p5SW91K9z2YHQT6ONEcReVxcCxp5hyCwX7l/9eNtOKdT7cVkL7uWbcwCYSaaPxwrZhtV
         kaIVxloYNTUS4qcyINrdKvfwPqwyJc02gNxQtcdiliwdXgr4sbombrbbCJQea3td7TG5
         NQ32kZJEnjzfcReyNCXtxp8UcTc+7lDDTyuD5coh6bsSqu8GjpvisYMgTJm+R5Pjw0WI
         7kKhuVyyUAEg2d7FvBmX5q6LQfbz/rPrpRuIfNrWmE9Av8nGPjCRss2szlRbn3BKasEC
         vLAw==
X-Gm-Message-State: AOJu0YxpCzElgb2lzegwj8Z3Y5079y+nL2f0fiFxsa6dOaRNZ+njlMte
	7FyLHRjPDXpXAy/Qg7c9uFFsWwRtw7mAuFNHpopEhtC09orJD8RdTqgZivViiHVvzGhdha1b7iQ
	18aE0YO4ffxsNCq3Uc5rPM4//sndO4hYpUagumIOvbvS0djfOLtqDwgm17UMQH0LTk6jJ
X-Gm-Gg: ASbGncue7xLopC4CTb/1JjzATVRmpldYyAruj5ZZdEY9LGdljgtUIQegSl3cg3mEfj2
	nTrTodOm1CLroDkLRubKrTSRIqTadROMA73R31LUk0qaW+yeGRl/rfqgSC+fa0FQsD4o+ZfpaEq
	qoeq5wAub7YcO9lnLRhlcnRZk2prBGbcGvgDIgCmhJxZGNmY0CXBV/H2QQQNXeiCGkqthFQ860o
	D29pBGiaCjuOlaLtz7gQ18AjzuZcWIe6Jk6r5SQPCHVDvIAkfOGXa221xQLwKn0iqvGfFAX5lDl
	eOT+I54ju0DWN8B6CN8EkAjlTGU7Rw5YMLdz+ZEfdYb2ZQ6pkdLWKNuOMPfw3WiTM/phA5i+ANv
	EA18VSD6Id75R0A==
X-Received: by 2002:a17:903:60f:b0:269:af66:5e70 with SMTP id d9443c01a7336-269ba53ab71mr18399025ad.9.1758291975558;
        Fri, 19 Sep 2025 07:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjyPEK1QysizToe/QvWiGmgoytkSIQmldJZSwEnBeedNOnUc+qD02mwjMOxWcY1o8sbdk5Ew==
X-Received: by 2002:a17:903:60f:b0:269:af66:5e70 with SMTP id d9443c01a7336-269ba53ab71mr18398725ad.9.1758291974951;
        Fri, 19 Sep 2025 07:26:14 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:26:14 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:27 +0800
Subject: [PATCH v5 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-10-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291895; l=1866;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ZqkBdkbuOLKjKhpqL+qVKtuac3iLEKvjgh8IWhxZI7c=;
 b=O5F9/yXwTXdOv/GVyK3wv2N1g/rrnmq7IdOhKWoKm5ItBn+rhZs3wgEhpB2OqKYvn36rwXC0W
 BAB4OJbv2SFD08xVW9qM0ZS7Z5kv7ryh+7xs6mqcF8r1i83eHo/SKIp
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: CL9pSmDAyndWWGUmC3XvNF-61pUjLfPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX0tPD/AW3b4e/
 dRj7MOiDA0OepKRjClRbId7QMFT37cJAwApsDkUOBBCiQ6/H9qwULTPkxysumTdWi6CdxD1s5Eh
 PExvLf9swJpBQLaQooiefAhaNzrkFeTuC+0AHiauhg5FhC8FpluH1zSpM1b/dknu9n+w7lFksLB
 IKr/9HIw1vKzMFW+mP45Sm2EaYaE99Z1XxnKH+MFjIY0v8VyVaDVFqdiEFa2CEKsS44LZ3uD+IS
 uYW1E99mqgQ47tagLZGXhWLmyhft9MbkF/GoI0LhceLD0+Mg4KaVMgKokMI4FU9sNSxGs/kVU+D
 3emAB70OjH+mwWzvK5CoDs5yoy+wJZS1Bz2SyB7bKXcpHWoCwJxvKDsbNCUPPqiCfMJzWbt1XNz
 TBKCWnLk
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cd6809 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RloG_8Ug8mropJZ47ewA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CL9pSmDAyndWWGUmC3XvNF-61pUjLfPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

When both USB and DP PHY modes are enabled simultaneously on the same
QMP USBC PHY, it can lead to hardware misconfiguration and undefined
behavior. This happens because the PHY resources are not designed to
operate in both modes at the same time.

To prevent this, introduce a mutual exclusion check between USB and DP
PHY modes.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 74dcf954845bcf8209202b75e9db10c3f6bdebd9..8030422d64382aa231d69dec9788778cdb0f218e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -670,6 +670,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_usbc_check_phy_status(struct qmp_usbc *qmp, bool is_dp)
+{
+	if ((is_dp && qmp->usb_init_count) ||
+	    (!is_dp && qmp->dp_init_count)) {
+		dev_err(qmp->dev,
+			"PHY is configured for %s, can not enable %s\n",
+			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -677,6 +690,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -730,6 +747,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto dp_init_unlock;

-- 
2.34.1


