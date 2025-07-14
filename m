Return-Path: <linux-arm-msm+bounces-64742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C8B0355D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 567B01783E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 04:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3436F1FECA1;
	Mon, 14 Jul 2025 04:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljYEd3/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855161F4701
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752468804; cv=none; b=US11g+lP+9JR3/2CT/fyIpLKigCB/QyUfkIYUBtVUsVR3zJt2XnGGx/EximjJsYjtHTeSXW2pLvRXf0uoyP0BBxZWZHYM7itLFL4PUs4wFllv3LqXxeh64wosXU+Q7lfpFQkVdwwljacYJ4SoOkAzU1KRP1c4yPEqbzuzxL5AjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752468804; c=relaxed/simple;
	bh=QvGVSx6duPfoOXZGVp8TsRxkNssmW3yTVBJ0qkN66wk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RkVdZ7NrUGyClZtQj2jE/9YQQWVG+uaX35YUdLRJDxgH4sIJ6UERARHqBerwjiM0qMmw/j99oM5CjOGo8ZBsKgNhEYMvjGaadqjuDWyIXyAfJgynorO0zSHfCEjm35xYzlwFoim9o7JJE/wXVhrRdkrq6vP+RZwWr7rgG2yJ3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljYEd3/z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMu34T027809
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pk7vM8iR7o4BlMbQxsyShMMSXch2AmUcOwz
	7sKF99ag=; b=ljYEd3/zjJL3/NUNuW3K6sV80JhWaCaPDozEeoO/r42DNlPE56t
	ntBm3jAgNbWn1USHeLeoky9ZpAdizO3JnQlaAWdFe5XV85XV8BT0iXNS9sJMcdxv
	mVBEH1H91CPKUDOUS3VUSOYA00ElyMf+3clr9xXwVd/sjtjzYPLBg97ffKWdZfNK
	lla5mvf9XpL7mho14zgPinUOmDSxmn0G8eJDf9sl1tCZQCvDI1dW1ptO/3trClCA
	7/kAccd3BVMVviKMnv8l9f1yRnA+iH8VhXMFfRQAoeV43njckCN03bie8oUPQL+f
	F6B+c4J3+zcVEkADdNDJ2Yojsjg1PpqX8+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37u7q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:53:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237f8d64263so39745045ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 21:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752468800; x=1753073600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pk7vM8iR7o4BlMbQxsyShMMSXch2AmUcOwz7sKF99ag=;
        b=lbXWJJHMQJ5NptZ+aurnu0rZoni24Tf6IB7OZw2ZP8f31XQ5QLIPKzOWhrd2I4sALl
         j1SxfblwTb0EiYzkVzRYgbfJaDtEdxZl9M21TqXWBsfK+BR3hjvqWZ4AnGDAceaPXB+L
         P2IBM9AxvKZ8pMK4/pTMZJz5ooY0rNWADMbX6CeTMAFCqJAwtz9ZhDeCpxF3KxZgOHsz
         YzsLrI0yVwm4uhBFh3FsOvpllkVUyflEBYgPT/Ex7PFVWlRGO1lmuW9Vq4ZhdIrBjaSR
         sZu3VR5KfF0R57tqu72X6UwR/tIWf03Tjt5Eujt2oFwZwAzbDw5msnBGZw8FiPNaXbw5
         fiQg==
X-Forwarded-Encrypted: i=1; AJvYcCUaS5jdoVDPM3Azf3gf4mckp70pVHyFxu202MT9YCDhdgIFoKdrvvX7o4J9kdYRyp6ERTtlDlAJYINOKg29@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9utFpVeR8zvqQp0b4AC54cXotP+9fvdyfdk5BIyIbpuksFvF
	bAQp/MgCFLMzjNtVf0tMvb6Yihx3ipmRVNIcTGZ8eiZxkWojJh++fTyKlML1Qg6piytz0nPvFoD
	FJruQZ6SQvUC0UvCHBFjJX5CA8pPUcha8tSVDwpSKCmgCAIUzsDFQzNDhLgLLVqi8ReiN
X-Gm-Gg: ASbGnctP7naVFbKhEjQ1Vb89WGnKeQqwN4W/n6EnHSY5UKwrOBrUTYGXlZFp7I36N/U
	/ibFWV3S+d7eND9yU1phkLeMiLhYR0Kvo7XL2MYB0+HYd0u4hhfyxf+IYlJBXHbZVh19llMNE7o
	Phvz5aRkNChhYBn0QcAR8iTIv/2q4FmM2wEsggeXFD1XCQIoFb+M+efAv5wxLQIQfNqkEryzPP+
	RxEeIw4mrtxqrINNNnHl8ifpyvFpaAIEg8iBhSxS3kO5ytJwcsI4qHcGlMC5JelAvLTC6Y5yQYc
	6gEJd4IXTtPYZN+AwRaiN0NgUK8KEOma6YIHDMEeao4A3o0qpe7J0mqlyENZiPt8uM32L1ByKG5
	kAg==
X-Received: by 2002:a17:902:f70a:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23df08e5e30mr184101025ad.27.1752468800111;
        Sun, 13 Jul 2025 21:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlV73S9kgnxtMSDiX6ciJJa0pMHds7dtbdrLub0f7j+fXjTHuuXR8CeV8xnJfnl9GO/5bWOQ==
X-Received: by 2002:a17:902:f70a:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23df08e5e30mr184100755ad.27.1752468799678;
        Sun, 13 Jul 2025 21:53:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42864a8sm85664325ad.42.2025.07.13.21.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 21:53:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Flattening USB controller on SM8450
Date: Mon, 14 Jul 2025 10:23:08 +0530
Message-Id: <20250714045310.2092385-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAyNiBTYWx0ZWRfXw+3/8kmR+NzM
 EY+lf+88fH63zrTWQDG18QaJ/RVYoO0v0GzeonNMv6g5xvirrUe4WgI6Z5f7jsMwC/sQiw7WLEt
 YDwgzr8Awvv5hWfC+crhgjUBTGClLQ1tl7vJEk+gc4r4Ohu+OGe8B5H3qa1Yr/z3Hykg6mIoJMA
 nVHD4VkQRQXtZ+1oJua4BgKlnTgZufHcWAb4puEDZ5aEseK47uO5yYNaodtEA/zoNwV4jTHQOr2
 +6IkyZ4z4McJWiCsSZRCt+VWEhtijpTQLonQoxVTeOtqXKU/DzQbYoKMBrwEYuoxJtWzaZNDqBq
 MLSB/5srbQl2B8Q/BFsQm1PAu2icSy7Pu804XMhdEHIsEAhRgbQRoap9WO0oAUtE9Ri3x7Vawfh
 9L7/LHqYp/fX0+D2nq0SQc4Xug+g0AoTYp9Q1nw2qri2OWpwS8Y4/sTjETtggbT/GTDfEKMx
X-Proofpoint-GUID: rbWuRdRhAoQ0LWaQYmdgeZfrnDoDhFPr
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68748d41 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UcbzNMOkSj1vwIQaWDsA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rbWuRdRhAoQ0LWaQYmdgeZfrnDoDhFPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=719 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140026

Flatten USB Controller node on SM8450 QRD to move away from legacy USB
Qualcomm glue driver and make use of new one.

Tested the series on top of a QRD. As per Neil's comments, made changes
for HDK as well. Gave a compile test for the sony-xperia-nagara changes.

Changes in v3:
As per comments received:
a) Flattened all platforms.
b) Addressed Dmitry's comments - moving properties from QRD to base DT.

Changes in v2:
Rebase from RFC.

Link to v2:
https://lore.kernel.org/all/20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com/

Link to RFC:
https://lore.kernel.org/all/20231017131851.8299-5-quic_kriskura@quicinc.com/
https://lore.kernel.org/all/20231017131851.8299-6-quic_kriskura@quicinc.com/


Krishna Kurapati (2):
  arm64: dts: qcom: sm8450-qrd: add pmic glink node
  arm64: dts: qcom: sm8450: Flatten usb controller node

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  5 --
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       | 51 ++++++++++++++++-
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 57 +++++++++----------
 4 files changed, 76 insertions(+), 42 deletions(-)

-- 
2.34.1


