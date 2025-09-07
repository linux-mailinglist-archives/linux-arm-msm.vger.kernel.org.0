Return-Path: <linux-arm-msm+bounces-72436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434DB47BDD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDA9A17887A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0933E27FB21;
	Sun,  7 Sep 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+5/s9Yq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025927B328
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757256745; cv=none; b=fRLSjhFvn3UobvrPAYHnn9fwSp8Ddr/OShNKF4TM2O1PI1EJUzcZmdD0VptN30UFUELeZ58y9/uq8pTIF2oJtaQZHf05MetEjbukRawZwFKqQvmf4MgJ4x7OyAfIue4W9/HrOg28i7+JRCgTPonkChWiJqIzw0CNC6M53Havw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757256745; c=relaxed/simple;
	bh=/UGpwgqLbcHspMjEQhf+040bOSKXnckhqkr7K5HPcSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzO6et72Ldp3mk+ZpPdnAZ7TjCdFoG8I6xwz7MI2Nkhl1x54kuPJJEMgAZkwtN+tIFGwUbQaYytEW7XNUyhfJdQp5xRogF+GJ25OxN5yzgOmSp9Ml2JnNCjFNjMvoiBPSZhzBG6fGpXPeVHV6+mJ10Si76jK2cwCWMfy7jzpSEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+5/s9Yq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587AeIDJ026612
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 14:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXEvIWnbOkICzt6MJ22YL53UMQf8f9LrhVZWM6rbuZM=; b=k+5/s9Yq0AystLw0
	z47uMBoFuMyOgGp2TvjsW8HNhZa5GFeciREo216E552wXVaExN9H8eKhlPcw42Ch
	UULoZ8wNMc5aRnmqO/VMVzxqDzYvD6Jj2qPthu0p+Mq/EkHTg6ApEbSxHIkqMXTH
	Ml/0WlrthOzud/kTqmwGDVybMz5PO7mTLW0L2u3I04rus1nsAiGcGNmRZDd6fBKr
	VYMhjeqHe/+laUCWSlUdHVa256M35rA4r61HPcbc6ww70BNRT58KIX+s6LqCeMOy
	7/WlZKWRFKCqlvb5T1Ylc8ILFNcEFsEBwdJGaff+x8+zxwFYWjOi9/2gC02Vzqtk
	1FZFhw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kt4bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 14:52:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7224cb09e84so82202816d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 07:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757256742; x=1757861542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXEvIWnbOkICzt6MJ22YL53UMQf8f9LrhVZWM6rbuZM=;
        b=LQg/aOtccdWbZaLnVew4pfhOO2r/YcPC+8CDAaucTbVMzRSs68hiq9iPPTEcvQcJ0F
         nAX6tN7hUFohNo0/iKslDTGbtU60WRC//DT5ocQyL1fhsCazQ2dTLf+bY3Q2t6RfIGQI
         FC47cg9H6swXePsJnxOpfALT8hg6iOULk8cvblwj0guUGfCsTmBb1OoCq8lBuOiXCYlB
         lU7Mw4Zdb+lukYel+NgQy2yydxXj40XrTzM8KOMshRewzk9mAvfbhp3PfYDp8YKloT8L
         MEycchuJoE0P4gQekMgq98uaaqIHfvFOeV51Ybya24uMiBCxVwRMTqArrwOqBrqa4E8Z
         pwxQ==
X-Gm-Message-State: AOJu0YxO7Bb5IqK2p7KVYrrABLneA7Y3548eIfgFP6Xk8aF47bvW/de6
	DWN0iKySp71uKSBltE9GESjeAWEbw3mUeunFsAqJaXI9v4x20P7uQC7faegSItUv/ud+c8sIc29
	7LgdrZEm19KgpVEcdTzqqZaTutdQBGhg7jS7iBlpK9CX3i6TebUZ4pzw75ljfc71r65D1U8gXsu
	ID
X-Gm-Gg: ASbGncsMC2G0CQez0GTTgkwKKYYb58tMjGOCDM68mg5akcGQW2/88GT/vHS0/Be1aql
	jdJJ67ajSbba52GgfuoKBUwsbTd1rA+pZrl3dNi2FwlAfwGv30EBLPSGcLEUKJh4LyNjA4C4Ck8
	6Mx2NOxLddGNUYAb1Mk1s8LpZcKvCXtNE2tWk40KP3ylH2iN2EgwXvTASOcPoMcmKAM8e2nCqD3
	dXI1rPJO0/a3ryxpVyNWgtJ8atYMNeRkNg6MWCMdDKOlaa4FciTDWpRRn5+Y+bVp0I09Wnxrk5P
	NLWcArcibAZhoGYR+DPWtjaoSm/2cmv5B4QGlFPwpk6geewfxPwcZRKbxFZPVOxZXYOq//70PJu
	9iRkz4tOUVDBfn/hms8/e1hshSDJQyROGhA7697w3gMfH85qj+r1K
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id 6a1803df08f44-72bc4f93957mr111576556d6.29.1757256741901;
        Sun, 07 Sep 2025 07:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJHVWmsQlKEwtB5F5SiO5c82N/76wI2OG3Sj8gZLObDi88o8+yPn/Ihsm5i+eJImPr0TQ8pQ==
X-Received: by 2002:ad4:5de2:0:b0:722:2301:315 with SMTP id 6a1803df08f44-72bc4f93957mr111576406d6.29.1757256741535;
        Sun, 07 Sep 2025 07:52:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab939d5sm2936738e87.46.2025.09.07.07.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 07:52:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 07 Sep 2025 17:52:12 +0300
Subject: [PATCH 3/4] phy: qcom: qmp-pcie: simplify AUX clock registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-qcom-dp-phy-v1-3-46634a6a980b@oss.qualcomm.com>
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/UGpwgqLbcHspMjEQhf+040bOSKXnckhqkr7K5HPcSw=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGi9nB+i9+O9rWaagO59RyRA3FTS3nlrOFKSSJecf0T6cqpxR
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJovZwfAAoJEIs8ij4CKSjVJ0MH/174
 EKbry2VSI0M+MUUSLJmimpY5GH7+VCNsepDpKLUGeAx9epYlURX1qqEWtMLgZhnC7fxl0Ms9Gj6
 vEsnSYED1WugA8B07PptbGtGULT/ZaoymEJPZmnNnLiOf7NcxrLlH0/+5TK1CdmIjNKRyfwe/hU
 hFXMuLJ00qiU4O0Qy2SD6/IW0EDyFgGIVOM/Mf//WKD/DHNbPv+I0TZUKbTqn1r++ftc3Ni2hAe
 fzXhjUvgpFuviZhcT+f/CdsuGoyWtgBGZ/ljCPqlgSjhig+dtejUKa0dPa4zHD6VUDU1t8kAbEc
 0EptjSVcqQXN+SDvHcdet2KL7Ua/DOSCmOM5vks=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXygEVLHRBTe8K
 YT2/c/MC2QZhxytTgoF1PGhEe93CrpG1OW1GcCT7uLkXjyEjKjoXlK2WpckkbspXcXUvjYE2198
 cxffZJjUZhBkg9Q2mrMuLIIR0e6dP915tNo6EiK/kLM1ncZAIrJ1tQuIYvDCqLlRDyPH1SudGJI
 pr6aw1/ZFRhQYa1/jelOk8zufQ3y1NRbBbCxocsHdAzrMQX1Eykb6sFcPl/RcsWnceplZKp9pLt
 pH2KY0k4Ggj7knadfW65IofmJ6STqNBiScs/L4UTmtBls/w/PazxaTAlwEZFzvn7Pgug7LJxNcZ
 boQLrIworddcKB+K0lc//RrhfYMFzVzQq9rC3IUqeLsXZT+GmnU2WL87bTrOoIIf3ckHS1/N9Yk
 IfYwMYfN
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bd9c27 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UpTUyc56fgFd2ZLN3CkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 99_niVk4GseVc0p6Kg2lda2mg0kMqpkM
X-Proofpoint-ORIG-GUID: 99_niVk4GseVc0p6Kg2lda2mg0kMqpkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Instead of hand-coding it, use devm_clk_hw_register_fixed_rate() to
register the PHY AUX clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index dad44cc0648355fc1533c9afd176b7d37cfa9018..a81facec7e45304f26ca3ce165af90aa5ff56f4e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3173,7 +3173,7 @@ struct qmp_pcie {
 	int mode;
 
 	struct clk_hw *pipe_clk_hw;
-	struct clk_fixed_rate aux_clk_fixed;
+	struct clk_hw *aux_clk_hw;
 };
 
 static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
@@ -4809,19 +4809,13 @@ static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
  */
 static int phy_aux_clk_register(struct qmp_pcie *qmp, struct device_node *np)
 {
-	struct clk_fixed_rate *fixed = &qmp->aux_clk_fixed;
-	struct clk_init_data init = { };
 	char name[64];
 
 	snprintf(name, sizeof(name), "%s::phy_aux_clk", dev_name(qmp->dev));
 
-	init.name = name;
-	init.ops = &clk_fixed_rate_ops;
-
-	fixed->fixed_rate = qmp->cfg->aux_clock_rate;
-	fixed->hw.init = &init;
-
-	return devm_clk_hw_register(qmp->dev, &fixed->hw);
+	qmp->aux_clk_hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0,
+							  qmp->cfg->aux_clock_rate);
+	return PTR_ERR_OR_ZERO(qmp->aux_clk_hw);
 }
 
 static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void *data)
@@ -4836,7 +4830,7 @@ static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void
 	case QMP_PCIE_PIPE_CLK:
 		return qmp->pipe_clk_hw;
 	case QMP_PCIE_PHY_AUX_CLK:
-		return &qmp->aux_clk_fixed.hw;
+		return qmp->aux_clk_hw;
 	}
 
 	return ERR_PTR(-EINVAL);

-- 
2.47.3


