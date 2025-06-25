Return-Path: <linux-arm-msm+bounces-62286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63BAE7927
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA6C57A1D3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753C320B81D;
	Wed, 25 Jun 2025 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlPhXTe1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34EA207A26
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838134; cv=none; b=XmaupDRsEExhA55qObybwFyKZWlDJGSDM4l1HYSUz4GsWdBIw5MjuragbTSxboJsO6o9N1qdfR1TUT7+EoNRgohT4f0yhcWaS8uFpZz5NQxwolKc+hd/Y+zVK9j1AVycKkkGFo7/axk+cDbXCbVBGKJeTsYWKKyGWDtkjdLstag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838134; c=relaxed/simple;
	bh=UXLreCEKENzP7lanGUV4Bm2PCN0o7P4FxkHutEz2K/Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=stveoT2+BCRFzJsUPYQnRKHz8l4KqCBjhi4v+wK4fKm9aziArK0xag/5xLRT9uJ9F6Jps/H9ULDEW/lkbcv1f/folXQPPKmyTX7aETVFoq+J9H7kwEB2O5VmalRCJQ7wgLPTU0+rgwXpyX1zgK3WYx9zM+b1gu5ENvSJmFUfPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlPhXTe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1pdRj001532
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mVqTDThOIaWdiBFJIde1gg
	/5zleQ3dpP3d0V7N3R1KQ=; b=nlPhXTe1OMJedP5ZaD5BGs3VF9s0FVa7U+OJnv
	zz+mOI059mPYx1rIpjgOUm7sJ6kYScssekw5MD12l3KdpxhKFDkBuIO6VpZO+xtj
	54feYix7mPRmDpwrv9cgRRD+CV28ycsKr85jyoS2BTBUUITU8yfywNFKrdjAT79p
	kmF0Yc+vrUIOxmA0ZENFfQ/iT2wUXd1tiYVFTD5FBJeRMdRznNyLHdNgTt8DsSC3
	aX9C+44NHzWRRBt4aL3jQ9UlznmcP4D8uHte7ZU687wFQjn5y1KVOJ0hMOx1TnsS
	UoY526SfF8LQNS0Kr/UMPNgtQL70WPfaulF5RwwgG/cAB60A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td8udk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:55:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74858256d38so5083266b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 00:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838131; x=1751442931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVqTDThOIaWdiBFJIde1gg/5zleQ3dpP3d0V7N3R1KQ=;
        b=FuEqLBlr8F1Nm6eQAbaSBk9iF5cbHPz51Ka1TFCR04eMmrtouLtP5K2BCjVjmi7tPR
         VvSMd0LSko4TN3RjPclj9YKdNN1HtERpXWKJq8oJt+shpViVRnEQLSUEasmMAfgmwSTr
         FHG70PD65ubsSIGqQJLyaVqVmWN4kfkTGpDFwNYw5FBqR/VORmoD2Z9TzdOtl73D4tri
         NyTVu+1KH0YicY/gNbdJ3pppZVlrmJxE8g5wNHLJVQbLbuVDpujEwgPDJ0Nxt4yxP1o2
         gvnqCxv4rdDzyCOO88jiJnxpG8uGkHODh6LaX7c5uxEHadU6fBFdi4ZMoF4C0zMQudoQ
         4Q5g==
X-Gm-Message-State: AOJu0YwjA+0ETTdUylLFEyCCF3VurXSRnkqhWJiZZVm8S+GO7uNe6jo9
	vLFpxSxVsj+GTSzY97cVvHpcdXz8XLPzRaC7rgkptRZjE5zqam7KDqjj4TLuePh/3VGgBR1FsdQ
	RsCe/ne2kxA17AD++zoFn1aLoY1vtojX8Zp7PWy4hbWRZyr/cotxp2+/a/TCZZkqvqtK3
X-Gm-Gg: ASbGnctUNr+LOTFseMT+74Ffeq+uD/SM5behd8y6/zmO1GefkQAZMeLJXzpLXYdLqKz
	tkTE7duCZ4SMEClR07G0ZdD99kKi4d+6QNahOMO07EjNZQWb4VU9DqVp5TcRJp9rrOAvb/UdMt0
	qH0zYNXlus8WVEiV071vUXKwt9xbYxLWBMrwtp6ohWg8fg7DovWlbR9Nrecha7oU9aKPpsiAd3s
	VwTNX+MlcpqDlAwfsCbTMkOB29ciD0d9+F4NddTglk3YKCRURaal7qrhz8EG4jJdsfpBx4foN4o
	9lMTrkgTPDRsFLNJH0SypNXP0rj3mlFU9nksS6zAj5NPap3r1W7a2uP/Y5433GXPodW8CxCDnaC
	q4ztvLaHDRg==
X-Received: by 2002:a05:6a00:14c3:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74ad45bb35emr3326855b3a.20.1750838131137;
        Wed, 25 Jun 2025 00:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7fagUQe9PsTurDS3L9VP8Bz0ybv+OrS3Ghz/7SQDJxxmOptDAiB5wA8rQTqU88Mrb2vxlnA==
X-Received: by 2002:a05:6a00:14c3:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74ad45bb35emr3326818b3a.20.1750838130714;
        Wed, 25 Jun 2025 00:55:30 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8853133sm3707478b3a.129.2025.06.25.00.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:55:30 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add WiFi/BT node for qcs615 ride board.
Date: Wed, 25 Jun 2025 15:55:05 +0800
Message-Id: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqrW2gC/13O0Q6CMAwF0F8hfXZkGwwcMcb/MMTArLpEmKxCV
 MK/O+abj7dpT+8MhN4iQZXM4HGyZF0fgtwkYG5Nf0VmzyGD5FLxQio2GCqEYgKbs8Z826IwEJY
 fHi/2FaFj/csehzF4z98QOiRqolclu8gpWfJS8qxIM6U1LwsmWDgxp499j5/w/bAm25vUuG4PK
 3uz9HT+HetOIrr/zSbBOGuDLrTWl9zgwRGlw9jcg9KtFNTLsnwBu6tlffoAAAA=
X-Change-ID: 20250625-qcs615-1ead9e48be1c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750838127; l=1342;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=UXLreCEKENzP7lanGUV4Bm2PCN0o7P4FxkHutEz2K/Q=;
 b=zOJ9RBOaAsOdSchyGpLOO9QG2X9eXdpcnOMYFCvD9uAjuMLw4Um/LHvxErTSChn0uGwr/oELh
 q4aR3DR33VSDy64WHKWRC3RtkCPa9KenJD9kFDS8nptN8660HSRZHcI
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bab74 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=EFI_8_61vd7ygjqh7MsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1OCBTYWx0ZWRfX2PVBRvLEPQJR
 kKwhZ4FMSTOWZ4DfE6F387jGXTK3tYVmIEtaiVWXfx+/YnUqviqsTO/A2NShu0NTvzZ/dhLC8xB
 euVUKFAlrLLqhoGtUFnyxzgdAAeIegHwtz5zkQasOLhBKgI3FpMAm/g58d8L8ciRF30ktXF40m2
 zOJ+k9I9gTEzZaW1tIAOGbOwzuipAhpdu1+3HBeAo4j+A0w7jJoAUy6i1VgN4ACfjR7EJajRnYm
 z3VVlIz/aFzfcESyMDN+G19xWpv002eVkizbwenT1Lzw6i9PE+Wm4ntKBsEV/95KEJ6G4neILzy
 WQz3AX0hZiN1CBcNXGzMhsLVV1TW/3s1oPajfJMHiTnBs1SHd8KWqhokfntdqB/MzOMA5A2gvEZ
 1IX6gZRr+7/DTM8sKQeZT5p1tvWon8tyn0yc1o7D6UXj56YOhpVpajQ4IQtLk4IYWAc+eKVT
X-Proofpoint-GUID: gk-z-voNSElS3o4t9rhybK3YP3or8wDJ
X-Proofpoint-ORIG-GUID: gk-z-voNSElS3o4t9rhybK3YP3or8wDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250058

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250527072036.3599076-1-quic_ziyuzhan@quicinc.com/

Changes in V2:
- Correct the version metadata of the previous patch.
- Separate the modifications to the DTS and DTSI files into different
  commits.
- Formatting: adjust layout based on reviewer feedback.
- Updated the email address.
- Link to v1:
  https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
---
Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 131 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
 2 files changed, 140 insertions(+)
---
base-commit: 025c0cda9c75d499b71b8e02123fea56a13b324d
change-id: 20250625-qcs615-1ead9e48be1c
prerequisite-message-id: <20250527072036.3599076-1-quic_ziyuzhan@quicinc.com>
prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
prerequisite-patch-id: 6d12fa7481ee4900276912d2a7071a9474e62404
prerequisite-patch-id: 7f2e951982cabbae366b1ff516f4cfa233746427
prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98

Best regards,
-- 
Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>


