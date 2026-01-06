Return-Path: <linux-arm-msm+bounces-87713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF6CF92CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AA24303BE28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E1A30FF30;
	Tue,  6 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLDfCaes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNITIDP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB8A2E7165
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714150; cv=none; b=pudsFH3kI3je1Eiw9G5nlE7H8HgN1orl+Y6GOjG4Y5QQR3jYNmUYK2fnZXvZ4eCuUlwhVLUpGSEvkXE8OXIR8JG/lXheByeoDISDf/FavsWrcpLVHtLK5trWcsGbfyPrUbX1zhZCNA3h2S1TFidbr3rsZweV/mg7/FzRmcQjskU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714150; c=relaxed/simple;
	bh=ZPJGICzg/PAxZH8bSEPQLz2TYwfgDekPYOvxH6T3IeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hHgozQ8LiqHvIZ40kyeRWkbctmfrjbUSYbo64/04TXdpX48pHsXH4V+Fyx8uxlmPfYWmm+oFFjO3nof6SpFK585clYviIikjaQRc371F24n5+vP7qe/7iYfQIFkLscSojnIVhzprDUBsXxozsQt7/qGzmRZhzOsD/9EpYzSh+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLDfCaes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNITIDP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Aleoc2254237
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 15:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YESivx2vId7
	pgvI677Lj8GeC8AWBep4KbqgfD3sAVdE=; b=MLDfCaesEqrocpF/1zem1nSU+w3
	I84gJq2GbTFDOdCuerlVlxGrQulwQdQraGxMayP0VRYqTursSIOIOoDDzzdAr37i
	p/mDj+xklYiS97QjLXO29ColTScvsTLkHwoVxmV4EAQGkW0qGICFQwFDL7BXdnrQ
	sFRZr6vzo20INwVASPLwSFHAQOSgrWix7AMiEYJplz/4Gq+g65YbcdnNuZCkBe1M
	LB652m+nM4MGVHeoD26HOjpn4FBEU7YWB4VCEhUUyOWBGN7obInDEauEcsJLnHdb
	24RVmIit6jvlzxjHAzaOabz4LEnAU79a9VIHh6rrwrj4YQ48GQdVAZ2McRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu421wpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 15:42:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso13357135ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767714144; x=1768318944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YESivx2vId7pgvI677Lj8GeC8AWBep4KbqgfD3sAVdE=;
        b=iNITIDP900XeZxhBx1MDnAkUIB4CWc7hO6qTpunR3FBNIEx1ko9zblOBycKQ9qtU8G
         fnZSWXDl1clS7syycsu4rjzrRntE5mDsVrRzMe0cGhiNDQudqZ1MNHEC4z7+i3Z/6x2l
         0dFkaOph2cc1YTkEh64WCB88tScFMt/BU0nVqodwXtGjrrZjDjEB7wGWeMbNcY+j1Cd2
         MbKwhLl+BctOWVHdhyiWx6SeYrIiY5sggr65FjZeoU1I8RMVNBra3Tfvhekiq76AiqH6
         yEnuJXrErso36m4j7f7CFSg4L4P1war1O0vfmuDG2QbYa+L2R/asYaPTSlpiJMUU+HgT
         birg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714144; x=1768318944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YESivx2vId7pgvI677Lj8GeC8AWBep4KbqgfD3sAVdE=;
        b=sgsOL7e8pvod9VE/giB5jm+VlLU1UtiAWciMBLOZIw7VYSD0HFzlnuy18A6Iko8b0w
         5CvEfOaOVN4jb4z0xXuf8q67L4tJ3A0aKowsTcZCahX0ZTEcmgsrZcXdgBXSrXD366y1
         Jt2D4vtlfh194fI0y+N/E8Hvp/OSUiWoTVqnQv/iKF13Fqqosofh4t+uX9XCXQXc1Q4s
         JX8X2LqrjU1AreYtVXY5qP2bhQjYWzxwCkofHV6h8YlR8eMlbP0+UqLZSLPJPeodN/fi
         7SjF2xl/G6ke5Vlz3mkcQtPoIvklDcAANPjMM3jI97W0MLJTMRMob25CqKjq5wZYfWa7
         jcqQ==
X-Gm-Message-State: AOJu0Ywtsi9vutN232xiiryW7vwLcr7yb9N9JNlkNAUtxlQuLoQFTdrZ
	fJYVTQTHTjRlVg8ax9q4IoJoVWalbvMB0vSPtsfGgRhpDch6+hUA9D+Fn2W1MaNzaRx7kvQQ+2o
	SgE90S5tFswktt4lukcuvrbV0e6sH0rFoitT6XlwFq3zM2q6Ns09SIP2oACs3CXL+bBJk
X-Gm-Gg: AY/fxX5K59u9dRCciU+mzCmN5MaYXzzw27doO681d0s3l+MRLbv9u8pvNU8aSA9uLy1
	h+2Zjw4nhFBbz603IayX8JodDA3yl1xH30HlAFSwh9fo734DOfI9ABVgl2znsoUytdn+ye7qTKU
	lUB+JioFKgXYCMg0asoeF+/mfuXuL5+C8nrQTkE42H8qaN/KU6Mvegl77bs7KlqoRDk/HT0a7En
	CrqN/IjQQ0+jbSuP+wBwd/zcyzKnDn30y4g42rg6nDkejw2ygTsqk/s2j1nAybR045prlvNr9Qy
	mRagx+H5pxnDwfmt2c323vBvAV2/MBMU8NTTq54K2eVn9mC9WlEPaagbC3QM5xpDtQYMFRA8qb2
	43PxYW1S35uhhU4cYXc7nUXeNId0SVfdRXVqIfIqPpKneesDHdNTW
X-Received: by 2002:a17:902:db07:b0:2a3:1b33:ae30 with SMTP id d9443c01a7336-2a3e2d2f36emr21943485ad.51.1767714143927;
        Tue, 06 Jan 2026 07:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGay4nVOi1x4DbIYZyz8vZ1XzEs0+0iXhI5PWvt/W510lDGQiyOk1gcoRq7cSfvhWP9CNq/Dw==
X-Received: by 2002:a17:902:db07:b0:2a3:1b33:ae30 with SMTP id d9443c01a7336-2a3e2d2f36emr21943305ad.51.1767714143388;
        Tue, 06 Jan 2026 07:42:23 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492esm26606395ad.98.2026.01.06.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:42:23 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V4 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible
Date: Tue,  6 Jan 2026 21:12:04 +0530
Message-Id: <20260106154207.1871487-2-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695d2d61 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Csm91wPUG_1LpuPihvAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: udun-mXspJ3xRK-YW8wLGlumnXZJ9ufA
X-Proofpoint-ORIG-GUID: udun-mXspJ3xRK-YW8wLGlumnXZJ9ufA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzNiBTYWx0ZWRfX4WLb+YVBnLLu
 X4vcaGytyavvdGi2aRp8yRI9bkz1iTNea17L9lYAE6OlEYi6UpwxCDyvWsxqqBLvXsXITAVyV2m
 ngm2qvtfUlBdhHT6Vn/DliFoA0imMFTPpNT8InALH5xlpX8nkjzRvOiKnvNJ3X0C1/SkHxV6CgE
 YFUWUgsVJ4LNdWYfqO3amAWM4gfOOHVXTw5z2jQ8TwIp+en7sVEiz5/3M/Z/AhfGe7qICww8uz4
 iO4ei0SgkCTbq+u4D5GSHEbXGjVLE/NExgj7v9/b7nqA3nGbCyWlAAWB1mUzqVN0MaD5fcKq3/k
 +/WOiq2jzIba8L50yTm0l9DF+ekXoG7VpS2JBARc3QVe9t8wJQ8CvUZsLXEKygUJgcoX9Zc70HW
 eHJsEzlid9sW5ChxXhb84fwgLDvtGHLeNYk58Qga2KP2zNqL6nqdAuFRol147auy1BS5TsBvJKk
 hHw3Uu2iuC+8f0ZkC7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060136

Document QMP UFS PHY compatible for x1e80100 SoC. Use SM8550 as a
fallback since x1e80100 is fully compatible with it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index fba7b2549dde..166e3787db58 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -20,6 +20,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,x1e80100-qmp-ufs-phy
+          - const: qcom,sm8550-qmp-ufs-phy
       - items:
           - enum:
               - qcom,qcs8300-qmp-ufs-phy
-- 
2.34.1


