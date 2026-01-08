Return-Path: <linux-arm-msm+bounces-88110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CFD04974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F68D32481DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E644170814;
	Thu,  8 Jan 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REzi3p2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StaXwWVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213DC1A3179
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887396; cv=none; b=DH9p86JdxQ77bvOtdDqkQxOkjS/+84liOwIrYO2e1DSK0bzLN5gOLe2jATiDuhrbbed3SIQmvCx+/9mn7wyejWD7hgx/TMQZOg8bvMzqbZOVQ9/aTzDk4MKsQ5PKk9RgPW+ETiSCFm10xBroj4BTSqYOP4by5qWahSZL3RLmHEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887396; c=relaxed/simple;
	bh=gNG2G3AfiWHhgx9TaUTUD0If5CNcX7AYIH4YYs91AZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=saUBWzQUVcBU1w/4MJwRPtCuSsU1KPcdeolW3rU+1i8+qG0KwbBd/JO3ex4H9hQKTFtIHspBBsDoaDhX+4PX+6rTAIH5xAsVCBW2Pq9KsiFLsMSTBKGeMIe2HibclErWsS6Z+zzrxcnLF5lKhynOj9cjuDDolmNBMQ+/LTNvfEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REzi3p2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StaXwWVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089nOkC126153
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 15:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8IOKWtENpiv
	0D4/lLb+LZe92TFerNNEVo5MCkCNa1to=; b=REzi3p2bO747XxxZEzctnrjy/kj
	D9dGLIWABRv73CLBsZtoSxqz54abuq4YcWbkuB/gXFDAyQqUOCIkz7jrpqFYv7PT
	G+e+Q5W263HFDcZDIjAXeI3QHIPb9xiloPQ8NY0jN/IAin7QdvG3/8RffGojote+
	zb5HZCdKJ0m7cbkEtDwmjEWI2WoVFc/8dhVWBaO7kd/D3WQZ0pClA94rqSVXEsi7
	Nti8Xp6MC233y23VEH1nowhaHBB5H4WJrykIm1KQF0349hkQ9xEBPApCJiC5perd
	ljgvmaH0NOVoPdoJgCK7c9Uw+pDmzHgqdZPL8xxAtaDSVDf91ofVLOUaZOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d6admc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 15:49:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so1227919485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767887393; x=1768492193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IOKWtENpiv0D4/lLb+LZe92TFerNNEVo5MCkCNa1to=;
        b=StaXwWVWw3XqkmP746HqMwIW7bYZmVG4+cIo35NbPDawT8xExBzJJFjO5fAivoYPgx
         JKEhwmxEESSKmGhnZG3eAn38nxfGILWWefKBRqAJSCZ0liyD6EX8+JOwwnGIK/AQL4DX
         7oDXNG4GhzJxdpxIhTgHT5oFKeuj8hTQ63mZrZSiqAdGLAOsaInRXBaluUzKbITSlJIE
         Gf0uw+h9Sqj6PsiivyM1NElYJaEDkTGjf5UwJVkuUt6mPxvzS2+ix/DKdaLxaadVk/A3
         eQqmCYKYzVunnUhfCMe5C1q8yLNKyMucg5ShmXcUH28Iu1VNxCev7gdhAsT2PqSdKhVC
         HZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887393; x=1768492193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IOKWtENpiv0D4/lLb+LZe92TFerNNEVo5MCkCNa1to=;
        b=WmzOZAYCvHIW5weonbOjRZ+OAx5EG5q3EBCLbyZbOJp8X3HBqCkcoQBlJjI9gQnWEp
         3yO2k5u8zeG1VA21TcVwaiN7R3ryjUCVKi+QSZccwuKP7sMwVgbvnSyhwmdH5jIt4Yz/
         8xRuq4oUi5OJg+K2VClfOD84gS3bP9Ej88ch/1zEsj9M2q3GItLGOXCK1wEwYoXDb5ZW
         nJhi2gIOPSQsstjaBFq+gkzDgIIpaICl+uqNE26KJScgneVB7vesHYn5ltUvvG7IZuyb
         7cWWgzbJKYQaI7JpqijuYjSIc9y4UEJ+A5ijDeW4vFy8QIjj0SK3+t3wSrSDnqGb+pTm
         wUmw==
X-Gm-Message-State: AOJu0YwqnFPQMd0doUtphDA3lfKG6PoqndeGvwzfzjH9r85XYqlIh/mP
	vF3cYjm8TbNQSpW50cL7Sud2XpTDVKubqBtEmzq4NDrdsDvfUQD9K0oPCrROrMfLoV22d0fPnBh
	BG/D9tMQIfPUpU3gTRJLVEsA05uzVoiBEa5oVi8VKoQN/xYl2HPXSpI0kQslXylkc8lBJ
X-Gm-Gg: AY/fxX7Cm0FJZw/4jfnjU5vZkoh/NlSfbSpPtfo0GCTL/z6W16SOBQ7N+k/HbCUiWZp
	rHRx0p/Y3VFoBdvgu+RLRf6FHQpyEMjNF0dRbWAcoa6ktFAl+evH+BonYBX8lViMMIhXjne60dO
	s3w6WEgYDXoV48BSQLLCUPIpgiY63X93XizzzBlcOT2qQMV86Pm1+aFkBlVTX55Be/q9h9OjUhi
	rFT6rB7LcLpYvaYSKm9cXVHtT2LZX0Kq1OR7fhHm006WIFBXQ793gIBC0BgZ9qkboNbfImwz5Am
	JK8i0b9sjUpC7SSdSTYZcIKh1Sgn9CyDXn3sg3X4y5ok427oEtIkA4upQiHNsi1gSaraa8dGGip
	HKIi+eD95UUCjDj30VyUw6r8qQWZvq3/Wktva2iglvkOm9nzoJfpb2HdnGEWgkdAh/5uX0O9QcF
	lf
X-Received: by 2002:a05:620a:bcd:b0:8b6:134e:22f3 with SMTP id af79cd13be357-8c38940a480mr876914885a.61.1767887393250;
        Thu, 08 Jan 2026 07:49:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4WlCvDgIMdHtNQtoW94734C1f8Vfnefv3i5sgNVAFzEXNki80UgWGOZNBArTf0cBpjFlP/g==
X-Received: by 2002:a05:620a:bcd:b0:8b6:134e:22f3 with SMTP id af79cd13be357-8c38940a480mr876910985a.61.1767887392744;
        Thu, 08 Jan 2026 07:49:52 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm8078121a12.17.2026.01.08.07.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:49:52 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/4] phy: qcom: qmp-usbc: Fix possible NULL-deref on early runtime suspend
Date: Thu,  8 Jan 2026 16:49:42 +0100
Message-Id: <20260108154944.211886-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XUCweaZffHqhvYnJ7V6tCET2giRJdPWR
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695fd221 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GnikDSHSz1V4xWV9RsQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNSBTYWx0ZWRfX26le/QkE/pzE
 8bYuGWUs8OGpdnX1/ave7AqQTiczx7iGJZ+//Ijyf1/mRNfCuSfTzFmSQpQ1WsrvBHjl5MmmobR
 WxgJqtgunX6VGjazLh6b/z5stPqLYvncbdG3JhxsJ4vWc5BaZY2N0FlIlRyRc09tuP+F5U6YFWv
 W+x4PW9xDjl6Bh7WXjnIZ3OOMvtdJoCFveKpByPxz/suL5ubIdswTnKeFRu/YqVI9MQeeXr5ybZ
 8w/rxHVTFX78+Gc1NqcCXL9w5Z6odjOy7u2zj1o1P6ryAnO+9h8ZrHV8IBd+O83AVrXgunUZZLD
 3nKSsfTMJAGHKxADKahA3sOOTrMkOGlyoptfcqIIeSuEs0o8XLcbx6r2cap+iEPY4GGucZa28pZ
 ZYAsDMk0zTBwzjSIFdSLFj/rJryEPaO0BwbUUkXZ00YBCUwyGepkzOsdwpHH3W4oTXsEKoZP1ox
 EpPTBRNZvp3OSW45rjw==
X-Proofpoint-ORIG-GUID: XUCweaZffHqhvYnJ7V6tCET2giRJdPWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080115

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
    `if (!qmp->phy->init_count) {`

Use qmp->usb_init_count instead of qmp->phy->init_count to avoid
depending on the possibly uninitialized phy pointer.

Also reorder pm_runtime_enable() and pm_runtime_forbid() to prevent
the window where an unnecessary runtime suspend can occur.

Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a..05717ca85c5b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -710,7 +710,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1083,15 +1083,15 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-- 
2.34.1


