Return-Path: <linux-arm-msm+bounces-78283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79ABFA8D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84A104F68BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA27A2FB0AD;
	Wed, 22 Oct 2025 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbmhU2yt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6362F8BFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118145; cv=none; b=WdYl06Sm0hYbOSX4dwMoslmRByPr8gaRDbMjeIhHcUDPXtLsKKLuwaS1VmanwbSBEy8CWVujlWis7QZYGHci62rUHFYc1ScHoUg2dEzUe6eFKsYP/eo+7QTVBPq1leG4VfM+qJCMu4QENs+KOzN8lQpphwAb9vgU3xzTGc1YaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118145; c=relaxed/simple;
	bh=GvkHRIdYVLe77R0ZY9NDb/kKn2TWXxRRo7L7n8igm6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4XPad6hnKY3zudN5mF6WtZhdxKXT3b6ScsC181chCiDkrYUCmSplFTRL4wbHG9NhP3i7YLS+CYPRW7qyz0o8NGX3U+AUB8vYG3pDJtosqg5TRsZiKYiR+/bkUf+EstMxcX/sBXU786iyMKBEESfGoIQ4CUlVLe3IsuQqCy+PYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbmhU2yt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2cRuI031052
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8pAfJ4YrVrXXN0p5roas6qTfq3KICUipgTwtkvr89nQ=; b=nbmhU2yt5d7Gdy2J
	w/CfvZTdagQddRBtD0pS/j/BljwZuqTZYvCqhJ8g22FZu0px1QMKNF6HO0nX7nhY
	NA3bKWI80yjIi4fB2zpZqpeiNXjxloHaoc0YfcRC0lzRWh0qGiEzYOn7GhoB06+U
	z3Hw/LMuosMSVCHbry1IdWT4bNzogkya50+CtjCYqHtxD9OC8WX5qDn+VPGduslF
	VYVFzTrH2yy5ouZhSeJsLKmynvuZPVp6U6i5jEYde+i83YtVns746Zc2XB1OBqhe
	G6b8P4hfXXup7IkU2F3oBy9umyAQ7oua1kno+7koH9plkSGNv/pMd6PorsaWNhcO
	0YCl7w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kbgy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so5372181a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118143; x=1761722943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pAfJ4YrVrXXN0p5roas6qTfq3KICUipgTwtkvr89nQ=;
        b=wb+BSeqjPNhKl8Di6Lzfm6HApTpxFaKMPudnuLwqqwb8xG/Q0t1PXG1pL+8/IlYxws
         bt5XbATAaOD+tGeEXf6y8ipBrBzT7FR7QtpgVmEyX7lndjqBuq7HZ2ymCOpTGn9+VJCp
         bh21SwHvhe04qJo3g9KQbLW8D0+tOHZIm7pkTmoAzWc7QqBd0bf0WsQpGCiYYcgluoon
         EmfFv3Q2HPnMUqB5ta/SLhxdonz0VY5wAPgZbiwbrRmpG2rgAVgzxe20RuTYCb5ITw7d
         biIp01SP+xZt50FRcABP18MiF+/qJFgAHRfpbjQ7Vk5OYadILTDZ11gM1/3n1hsZZGxJ
         GxZg==
X-Forwarded-Encrypted: i=1; AJvYcCWomJ+10/WI6GOgkq7sVuVfwKo/zT5NEAzZLGNKICx7a18GmlVvgKMw6n3umeC/+MPs/MMUp29hnVjXmoxP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywts+jy7yvUbQRL7wWRkhUCbrzG8BRCRiFy/1FxL3t/yrPFL0vb
	K6DsMxevqQWsJemXqRxBxw1MU/7BO+8LLMAJFhtHRnCmoCjE+vIXIt35HNvDkWSwjhBscet3qRV
	y5CSbHNBzm6j9y9tM/OdQO76K7/8PkwQjtNQf52NGtaDWJjJ2DLrv2z2DzT11sjXmnhLz
X-Gm-Gg: ASbGnctwtA+7CWTZ9B0MJcatcAYdofUI076t0E/Fj28w/zMEdjLS3E5c1+vRuXp4Ab+
	KoYw1jWXvZeEYlsp+38rieQgvu0lsUokkbVJpdcjI3U1dOvw3ttSRKc0qzOE1Rbo9azRnD/YT4F
	NKxdTSlNlfwI7oJdrvLQf4l4y6qD5/WNJ3jPWBRmJhrVG7KBeodTvPfYBwzwUJZwEsHEazrad/w
	XYnf0aDs5hq8fNXca+bT3JBzsqTEjIXYcMvyvKxHFfaOLbQcAapT9/7oGdt5rdPi6O/OKvFlhk1
	SMD4IlEH/Vad0HzLR5gM5AjOilTOv9b55Wull+nLAnTcaa1Wbzr+LrX2OrknGrF+hxNHOwm6w42
	j0IdpOL26pIQ8Sz6xU6EAjciLx1RSE+LADC0PsWUuARL4P/re/g==
X-Received: by 2002:a17:90b:1d88:b0:32b:df0e:9283 with SMTP id 98e67ed59e1d1-33bcf90e86cmr26048947a91.34.1761118142597;
        Wed, 22 Oct 2025 00:29:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIMO6d7zAOPgfCMZwZKqFbhQZ1V3768KfUIrEE5Dg9T9Yv30w2Pj+u0Fx38etiZsyYsQlxOA==
X-Received: by 2002:a17:90b:1d88:b0:32b:df0e:9283 with SMTP id 98e67ed59e1d1-33bcf90e86cmr26048920a91.34.1761118142167;
        Wed, 22 Oct 2025 00:29:02 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff4498d0sm1687342a91.11.2025.10.22.00.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:29:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 00:28:44 -0700
Subject: [PATCH v2 4/4] dt-bindings: soc: qcom,aoss-qmp: Document the
 Glymur AOSS side channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-knp-soc-binding-v2-4-3cd3f390f3e2@oss.qualcomm.com>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
In-Reply-To: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761118135; l=848;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QlU4swPOtMyVnMly1EPGcYn4f1CqtJk6gC1HvBg/Spg=;
 b=uDXfTnComZRzOmtSJSvtsrOS4zxYWzyuufJG9+frDHW/icoJKt1XneC/Cqsa15kiaVvUByhug
 VX4tFJqzxkwBMvCqvI0vbCOvkn7jsa7d/icywcNoEO2CpO4deDp1sGz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: ruwHZ8_aDVrGLG6V-7VvCiV1K_gIAa45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX6hrcgkejQfF8
 DXPWrKoz/QvIQB/4DL5klxXVy3QGzd+M/i3nOkWJdb6bP5Ya1xf618hb9p3wvKapts4MQa0bDuL
 0AS5p7UwsyUPXBNI9Mxqw5ntOOIT/94yRNUjsDRo65cFegwlp+SZYVitqT97kXY2MRqt7sacEbw
 EQM2eWW3GHQrjRAUYypFJtadUy1xmWRhWzXMH7DyP83PnvqDtIHK+57B6FDdYRTc2irgX9Iie7v
 lgXpPHEj/mjUxw4asg77SvjHJfvkVoABEB4o7myMhZkYrkmw6NSquNgDuZSrImjGQLpvqCkTk+W
 qetjbTWi4kTxTn17CqErEDVzwYtWNh2IhhguHjaKP/YffAzVKQWAGLggOiJnOq8G5LZzVbZdubm
 Zz+zwVDj2UBlQWqnZnwFNRZrzZg1oQ==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f887bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3zIzYcw04eZ5cjS3wW4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ruwHZ8_aDVrGLG6V-7VvCiV1K_gIAa45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Document the Always-on Subsystem side channel on the Glymur SoC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 57aa819939f0..c5c1bac2db01 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp

-- 
2.25.1


