Return-Path: <linux-arm-msm+bounces-61990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF066AE352C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 07:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7051B16C289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 05:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3B11D63C0;
	Mon, 23 Jun 2025 05:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbVkrWUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1A1C862B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750657825; cv=none; b=i5qB5E4mlJxUexN+8p0OlNxJoX9IAfpZp/2fbNbIQRhI5CyKAmwqitMxpafbkoXQMBu53dR8zInWDpvkiUr6iwZYsjrpcTj7EMoyg7AFUOdpokfP8+OKttZ0zY3bB/9pG0Nczx1+KZTQZHHUb3vjlJd2J7yBBGozV9QgYzaHllU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750657825; c=relaxed/simple;
	bh=NNj9M2HOdP/h62BctWqSnbaG5nCryv8LBTR8EY8kyas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H9+n3Ts7wrCNzE5JWdId86CuRP4M8h9JsWhZhJWqgz/JDQmtovAhxBJKqvS42ZFooCQg4HonBeUtxMPXXhmYjROxggsSgXNNl15+hrRNhvtPZ2K1XUpAng4tFq/VYLhcEIYL/UOT8OU3LIX8W80eti41LnNw1xZJpgEBhqxYXGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbVkrWUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MLP9Yf002182
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fp/yWwMZ3puXYSYCk28v6k
	iy2XUzTZ/rvjgjcL2wxCw=; b=kbVkrWUyj8Gmf2Vv0cI9mYSCWrIO3C2kMr5+hI
	3qwh2CWV306aT0OYFvX2FvM5gRlMzcmAMvgVVMj30/2bfxHb74KTgDDKfsyfSI2i
	P870yzMQCNeXBC3mDz2aR1xKcU+6vZ189tBXpN/LJPq0eT2cYt61cxk1o1dHpl03
	uRKxJYEJm0nWdd6fWcEz1OTjqLG74HnLmumw34O9QY7CRXFYP49mqYTk0Os8meOQ
	G791JCmi0ulqQ5QLbKCpz2UAK4FH3xgsAFiatRMc2jNlx8o20YmYryVFg4DTrJgK
	hIJv576a44rboGtIYDnRwzpA3c49iIiS16lSZhqO6T6xE9Wg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7sp9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:50:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b115fb801bcso4493125a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 22:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750657810; x=1751262610;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp/yWwMZ3puXYSYCk28v6kiy2XUzTZ/rvjgjcL2wxCw=;
        b=kaKtGFmYkO/I1zAcOypz3gR+dLpOHzcIBOQGaEisT+MDb5qkZC2fP+9FwsTOq+Fswm
         re5JJ4qQw2SoGM7AIlbsj9EpBUdkbr/z3vwBMwR7uxbXPFilwssRxivNt5aOw/sAG7Qu
         ImVZJMXJnLwxK4wm4FDMgPtJJAVmBwC64cyh6IkqHZB0DoZ7p6HfrTeyYIvVb44p8LOs
         58uJovx/sO9nsTPKaV/mM4EsVXAnT9usuG1NFSh8cs5PHgJACCzEBg3eaYYWs8l7TNWP
         5rxhQoM/4h094AGg6viwArYICunOq9Noj9HHVt+7aI4clzJcSfSsIxc6KVrNAmP81IEr
         Dbvg==
X-Gm-Message-State: AOJu0YzPjDZANPZ35MHLdp/c6FGmUznwQn9CUdHIi04h+89rm6VTDRdj
	qDe219EiFwCo7aFGeYYBvw3kvKPHxVzWNtP76gFwAQzRp89Exj7UmY1+2MDjEfBEMi7fgyKC+xx
	u7h/w8TCyDILUldWdyOO8v1H9qkCrNHy/exUBQYa2o2MzXjDWQzW09PwZwYfKFmc7JgzUTqRk84
	0l
X-Gm-Gg: ASbGncuyTRpP+bSHCHZ0yg+CaUrScYNHgeIafcpAH97Jzfkgi8l/tkk3uL9k8lHcIY0
	vbnSAX/I6k4er4JHb2YaDXzKVOXe9SnIb633GhQUXyBVEeq5kVshWouQFTppdzHrhE3jtZyr3n5
	B6D2+8sVyZUX7n9/JX5Qr/yNQ8clLok43gkCfaZqAdTc4Uir4vhBkoN85DnNO59zznshgJfYsz6
	I6Pmv055UP0VoliifSwgWCEwuzY1ADZRhJyeyl1OHKvhBHU3QenlyHt5YdGzVsVW6iW3LuX1yiz
	mlANujtputFbmwhDVmCVUf3h/2OV6L4w4M1m
X-Received: by 2002:a05:6a21:6012:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-22026d34e1emr16612770637.8.1750657810620;
        Sun, 22 Jun 2025 22:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVZQ9J90mvffYB9LBxTB3UZK/srTKT/xMdhJfIlGFSBrXMhugTgLedsxiHCL2bQSGtXoVFeg==
X-Received: by 2002:a05:6a21:6012:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-22026d34e1emr16612746637.8.1750657810229;
        Sun, 22 Jun 2025 22:50:10 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a0d7bsm7399431b3a.160.2025.06.22.22.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:50:09 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 11:19:43 +0530
Subject: [PATCH] soc: qcom: rpmh-rsc: Add RSC version 4 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfqWGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3aLi5PgyE93UZEODRMPExJSkJAsloOKCotS0zAqwQdGxtbUAOGR
 zJ1gAAAA=
X-Change-ID: 20250623-rsc_v4-ec10a1aadbb8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750657808; l=1052;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=NNj9M2HOdP/h62BctWqSnbaG5nCryv8LBTR8EY8kyas=;
 b=SJwBvNcoSAwGr/aqL+uwi9ioWFQrI3rplwk94RNyX4Yb3wYnZ3+LiAIoU6Mo6BU/8PQC534la
 x8DLHDvrwK4BM3Zq054c9d9Yf5PPyNtJa72bVUAhDZ2yIAF2X4fS2/H
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: ZCqDdJP1wHxrDTrwD6MTcuRMYClBFg6a
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=6858eb1f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ix4VcxSuoxF8C4LDBM4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzMyBTYWx0ZWRfX3+Z9fhb/HoBj
 OCacsAP2McZfUJGtqXylu/2cZGQXfrjVsAEyCZSnZRI18Cn+Q9Hr7WMnzDRCFzccKfO1nFpBbXY
 YX7nu4tfzMtL4705p2uoaYD3GXedXkFlwUm0O8nvrGdBoA36pXOE4Bxo+AYcTOZhEO2RzTni6dr
 icUPdwaELUkyV//T926PJmrvqAS8qOzHRnKE0WtwVQm/8GPCQCQn9/XT7Oyl3/V0uVdo3K7SzWS
 wAUmmFRo5H71H+8NLi4gBMQlpfuMnXJCyMYjZJtx0AL76IUYSdmgkTTjG63v0z6R8g5CAQNBcle
 OGZhZSlpm3IsvRplDPv1HxvhuT26hSpGT+dBhg88GnltbR1TH8MFoCNo06bKS3CHWPkyHwXMTi+
 v0bgsWYgea0tbQv+iM0ZW9+8UG1DWTT2xxHCsR5e1rhZGtoU59PYT7LXf90sWRJgMNneUCaB
X-Proofpoint-GUID: ZCqDdJP1wHxrDTrwD6MTcuRMYClBFg6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230033

Register offsets for v3 and v4 versions are backward compatible. Assign v3
offsets for v4 and all higher versions to avoid end up using v2 offsets.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index cb82e887b51d4401edba713348eed9621622b73b..fdab2b1067dbb13efbbef5cc3ef795a65fc2d6a1 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1072,7 +1072,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	drv->ver.minor = rsc_id & (MINOR_VER_MASK << MINOR_VER_SHIFT);
 	drv->ver.minor >>= MINOR_VER_SHIFT;
 
-	if (drv->ver.major == 3)
+	if (drv->ver.major >= 3)
 		drv->regs = rpmh_rsc_reg_offset_ver_3_0;
 	else
 		drv->regs = rpmh_rsc_reg_offset_ver_2_7;

---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250623-rsc_v4-ec10a1aadbb8

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


