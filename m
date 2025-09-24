Return-Path: <linux-arm-msm+bounces-74732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6EB9C8B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03A0A17B746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1AD25484D;
	Wed, 24 Sep 2025 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpFtAJ5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3DF283FEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756335; cv=none; b=OHdCSAdfnvBztg37m9n2fTZ1pgJoYx52VNJn8wB86a/xTkrDn4jCJgQ2pZbqydG2NwThYoIRlJrXdWNqy6Y7Y/+mTjpq7JkQvLTVxI/009M8Y++IKHuaQf3vPx6s36rDchEuEop2tbjDezRO83xPpS2IlcSEjDlea/ZDamgrnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756335; c=relaxed/simple;
	bh=grnL1nW0aV7OR935DYA9RYWYKNMAc5uMkWKRAdqqSkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YuL4J8OEz52F1ZpbdHJbO0S/R/wCyu85SrBDLp8BM8Sm0NyLxp+tTkHCYlG3SDGNhHh2SEyH3m9UQ5whKjwrTvzMVa/GENTaMfSyGniVyB6ONRc+GJhEoQUIACaPDhBTI6/6QfCd3DejnIHffAmhRSKv2e69R0HCLplY3acdb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpFtAJ5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCtHQv019915
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V0ebCVkmE2Ghy+Rd1cTtrj
	/n09jBrOewJlCkIQnhGlI=; b=HpFtAJ5QDXOW1lrdXKuYyQH+237PfYAFnNF4Jt
	5hL+w2lyrtSEdMWprFDAbNgIT4KN1RQ42I1m5rgZLTS6aaHmbzSTktZRNGGYkP38
	jz9dW2kv0Lc2Z2QZPnGoFVouaweAcQLUigl9By/MH6WJf6cy55126FUu1aYSLOgp
	OxBgMMBdq6ORFkeDGqt4d7affJN3gu01vhRFlbRdXfkXVKD9hDMiWbCc9iQ5tDMW
	cNxGc13L1B3isH9FoNNgSBS0QK2WajFgZ02TgoshiR+XWRqJPpNwmagMvWchwgZX
	EIEtSFC2TRAqx62TxVeHKs8l98nhEMAiq5PZswl5Jbqieb1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy881-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:25:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2681623f927so3370465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756332; x=1759361132;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0ebCVkmE2Ghy+Rd1cTtrj/n09jBrOewJlCkIQnhGlI=;
        b=mVQOwgzi1GEKK/PdpsvsTFdQf+008G2V+b8PgWj1YtMC/l/U1cw+AY/EJmEA9lLWsA
         adka9hNR/BOiLQIAPwmLNti4IIen74y9NkaNLvc249HD748ZBHJInRQs/dcaiYxige06
         LiofTtv36svQotUCOH4+HGgaKPeVo5NhsW4HEkJ9JdYmvsL3SGKBFpnNoRJ1Cq5yRHX+
         O/rZ1cn/KiZOHpS2ey4JQmAKqZisW28dEvnU6GSTmPB6KMWnz5v6Xw5tWaG/WqEOyVCD
         uzF3Wj6DvbmJNB12aBvAomuZfTTTVS51Jh02g1Ip/zP/8I99lIyOXB7gJ1H0sl7seQbK
         rROw==
X-Gm-Message-State: AOJu0YzA569RBy9OrtOLaagPWzuI5De8DJ2Ab81ZOPpXYA2AoVUHMkl2
	wmW75j5pQLVCKCM/XAM8+gYoIETvbjin7zC0AmQRc/GKxkTDHfjKSoN5mdK/jl4tN6W3TdZPctl
	/JrJdUi5xwgkeTHVi3ehCtrOEpJKt1tQvv4/4Ybdfg9VvWmJjJdnKuRBaGM4VkH4IDlbm
X-Gm-Gg: ASbGncuW2DYKYIzlg49z+xveSo2MVuhQDo+6hNMF8blRAowyBDlKDtJnx/HZwYlnZLa
	UT4udp8uOPLyEp5sURHYmBEPPtuaRIRkx6wZyJtYqD72IZerovmbof+N8RRtlKHGLZ+KCil79Kk
	coK64eVpCyfnlcijInaTwaItq8+YeBQPihf54FL7tALTHIzT6pI7WfQrm0KuhAV5eawQLY99PxJ
	7q86NcDt8PavipTTv10x5zhsSEnKVkWNiEAabMsbJIAJJCKhZ/7j2yDMf9A29Bpi9IR8ork6nGo
	Q3mk8i0IYE7Zl418lJKg5AJ/fIRR/oE3Yl18/H3o4MA4vkDONkpVVLkgAo8twvtI67qbXGtXakm
	JaEppSwmLPDwGi8Y=
X-Received: by 2002:a17:902:ecca:b0:269:8d16:42d1 with SMTP id d9443c01a7336-27ed4aac32cmr11420195ad.50.1758756332052;
        Wed, 24 Sep 2025 16:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ6J7fDY5Pic/eRJccWKxjHx2Ra6IqcBRO+w4mduPo4gLOtd4HvrD/wBGFrTmoXvb2WGJbmA==
X-Received: by 2002:a17:902:ecca:b0:269:8d16:42d1 with SMTP id d9443c01a7336-27ed4aac32cmr11419975ad.50.1758756331606;
        Wed, 24 Sep 2025 16:25:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d2fecsm4313305ad.12.2025.09.24.16.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:25:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:25:27 -0700
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Kaanapali
 BWMONs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-bwmon-v1-1-56a9cdda7d72@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOZ91GgC/x3M0QqCUAzG8VeRXTc4Ghn1KtHFznHpCKdsooH47
 q0ufx8f/x2cTdjhXu1gvIrLpIH6VEEZSHtG6cLQpOaSbvUV3zpj3sZJsTtzrKlQmxPEfzZ+yef
 fejzDmZwxG2kZfoWRfGGD4/gCOUmNxHQAAAA=
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756330; l=1131;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=NasTWIQxtuAN2SnlNbGqk0YKf8tGhQVZDl3ik55ZSSk=;
 b=Zpga3xyX8vht81SRVnZs0Lmfn6J45kM1HVjHjv85pOrRQi4r2F/rkDWH5g96qCSWaekSmoDbq
 FbbhMr0lv6ZBGy8dvjvJAkPjurOa+k4baBH6aUR7UOMY9/D+FQtbmkb
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: ov3oq7xuZlRdkY9hqBd5s5_xaYIdgy0v
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d47ded cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hqsPwQ9-5byHO2hE57MA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ov3oq7xuZlRdkY9hqBd5s5_xaYIdgy0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX1xfey6RjKhwh
 CW05uJ07TwFQQ7f00lSJ4Hx0bpHzYYUmahIrGTm9bRA21+T048w7ffok9UNfNYTLec/rzpEc5EL
 Vzh3mDxKuQhN0QO3cdIt+6aeJvUQr/0IwN1276w2QTOLIpZOGFHrOTIqlgl8ZPuojEtJf6hTTpF
 HHe9X0l/IG92q4oqUAoh/fXb8caCCczEYekE9QhjFFqeL6lnLDEk9TJDojHal9uaCuZrZQ+Ujfc
 xgMMFd98IwRBlIe+9vYUle9BkDk36WagGtGI3ELgKDmJYjmCMDQEt9Ss8iUO7hDfP+YvePMRYeA
 sjrds1eGNuG6ge1odQWF3U6k+4juhJ91xu0uZPMTNe8A15wA86IRlpmz95A13AaIhtcgg7JKVxp
 EacqQabm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Amir Vajid <amir.vajid@oss.qualcomm.com>

Document the Kaanapali BWMONs, which have one instance per
cluster of BWMONv4.

Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 256de140c03d..0d1a268db921 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,kaanapali-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-bwmon-d3e2020ca6b0

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


