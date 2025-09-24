Return-Path: <linux-arm-msm+bounces-74775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE63B9CAC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF50316EA47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BE8283FE9;
	Wed, 24 Sep 2025 23:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwuBS3cz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE99258CE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757356; cv=none; b=tv4fApZqoo4AHybaQV3uVilLN1BnY0U0pIbq94G/XKveeZONsElkESg61HRRsOUsAKuqoO+IlvV6IlXy960vKpcIlvbMeEtH9/7lMF7A01nr9IQFNy8wusEml4lI7agZ3ssfSAuClGNUL5RdSqpOoqdTzQnEoWunrAsSO7aO6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757356; c=relaxed/simple;
	bh=jC4ARk4/BGMQkPobGqNsBp0H9jAmYJqjCkipkBKj0c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oF4+B+fn4bFdURj0z0iizLAemkniyP/nUdXFtVzU046P1bpUptkuo8FssYeyeGe51GkcyTrCRK6IrtGBBazAgo2IvcPyKvUDs+kg5PCg1hzfppG+Yt58T+RZDepNcVlnb/K5K7sdnRcenlbuB8um7mhEF4biQl+aZgAQZRqOEWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwuBS3cz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD6vWq029974
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qol0uJ/DjY99kV2fcBZLPu
	bkOcStGcswt2KRkk/UfFk=; b=NwuBS3czIexMJitB1kHr3SK31DeAKjuitWevU+
	dccuDvx3KE2EU8surtCASLGqVOnH5ARE5tKjlsZK6zVQs89nKkMy5wnZ4AOBXtxM
	bL++h+ykwT0vAu8ABnI1GUEpl8Wohb+JFM4b9PuDvzhiBh0MpmFj9IHDMjJ1p6jW
	xrQCiF5JBN6OTo12JkVThw/41RAltXCgMJWrA2Q/gCN5NCTQZAyTicavoabzgdjj
	Dgf+TOPukQ52Kjk5zXqc3ZOrrKnMj/eww2oplCznrlm0EuokPWskbs6DeN3UgnXK
	3nLM04z40MUzfMEKewtxzvLEVaqEhA9ProopwBmG3IonQ44w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnxq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:42:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458345f5dso3900055ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757353; x=1759362153;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qol0uJ/DjY99kV2fcBZLPubkOcStGcswt2KRkk/UfFk=;
        b=swayKJ8qKNKrpET0I0GpMygWjfZ9XBQ/p9dmrR8l0GBw7BmPJzN49lT8obGP42O0Y3
         r7C6xkO2prvfUc4mN/2QNJcqHlchg0LTWbA4SgYewEOLq+JR5/PJ/wANL3ru8ZxV5fAW
         B5yNl4POePGqWiEUtIDgIdv8etuLDX4h4XcP8Bs9YSqG+jy7/yqeo8El4Dq0j1wb3Szx
         cnFdrGb6tfibOnBgqAkZC4qxCIeZFmTbER94uoerP5B7Xdq8jdjDx1aWYX5YfLnj5JI6
         lZsHpMS0kFYQWi1ZAEYXAeWxrJzoOwlqDm/35XatORxn6EK0keVObTtROCNAoqFPHNAq
         UxEQ==
X-Gm-Message-State: AOJu0YxxRQR9ifSepZ0x4L1230Q+Wq/+/fJeEN0MTGmPcavGStcfQxGx
	rRx88YnjcMHKeWKf8TGBcJVQjL5pZ5DGeN/iT/PLJdLRiB2jZ7w1hSNjDprQtWUZGCnF0T7i4Ni
	MF/nR1nu/bzOKmKtFy95bD5v2A1yvLKUMzrc7ZlqyEJTvSUP+dmULDtrrVI3hFyQrKRJz
X-Gm-Gg: ASbGncvcaxUGUAQm1822MMwdQPMFBbHSsT8ZIYipQRfMxbAtTKzU70/alYPFRSUK8sC
	whkqsdco7QjpNcYz4U3+iaQm1SnA6AEuQt/utsQipZfEXENqD27zexxlSegqUcDKax+jE3zj19m
	EvT3NaswgevPTEF3Q8Urp9tMHfD5xQGKEDPzEq6jQ0HEy3Vgrs6VOA76clhh2BHJIl7/L6Wc2SQ
	VANKL/gQFgyPompy5U1PXiGSwRhj6hrjdtM/P37blyqmogYYzPkqPDh+pnFwAIOPaEfzsPQNW78
	9YmV0mXtUN5qhgNsBpnID5AeOIDO7a5RBuSL5JR/RSSflr+T04Fzu+46RLd0q4NoDrs9Gt8L9Wd
	0tAE2YWFhSgNtEEc=
X-Received: by 2002:a17:903:3884:b0:274:3e52:4d2d with SMTP id d9443c01a7336-27ed4a76e00mr13607135ad.37.1758757352997;
        Wed, 24 Sep 2025 16:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp0ELExHw39ifx72JdOIvm51XVaQYe4XvSjpj7wId74sWV9ba8kb7eCIuoI3H4RYdXKNqZcw==
X-Received: by 2002:a17:903:3884:b0:274:3e52:4d2d with SMTP id d9443c01a7336-27ed4a76e00mr13607015ad.37.1758757352572;
        Wed, 24 Sep 2025 16:42:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed65e8e89sm4984905ad.0.2025.09.24.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:42:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:42:26 -0700
Subject: [PATCH] dt-bindings: spmi: add binding for kaanapali-spmi-pmic-arb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-spmi-binding-v1-1-b4ace3f7a838@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOGB1GgC/y2NQQqDMBBFryJZNxBH1MarFBdJZqJDSbSJLQXx7
 k1rlw/e/28XmRJTFkO1i0QvzrzEAvWlEm42cSLJWFiAglZpaOQ9rjKvgaXliBwnWSO0iOigdyj
 KbE3k+f27vI2FrckkbTLRzd+jYPJG6S8mejxLcjvtU3VLCLwNlSFAUKp0+w7hqhtyxvvSsg325
 HWtlXHKdmI8jg9VEEVaxwAAAA==
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757351; l=1290;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jC4ARk4/BGMQkPobGqNsBp0H9jAmYJqjCkipkBKj0c8=;
 b=bUOmbq9O7Hpb3ld92WPfktpqQhKSchaIuN4V/NH9ki9iiYHe2NOMscIvmZ74sqhTYAcAyAUdv
 DNjGcAJpk9KAFn7Ja8qj3RSgxcuYgaBewlHn0xoFi9kHwCv4YHKPBco
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: MzMKfY0AuJzHmglU4rhwlql2xGRjmERB
X-Proofpoint-GUID: MzMKfY0AuJzHmglU4rhwlql2xGRjmERB
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d481e9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TXiNhvdN9S-nxoxCruEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX0Yd+sXe/qXIp
 t04KwvkOvXDFPozYo4dDFsLOtaK3jM/s5KJH2yss6UKk1he6Cy/KAdiN7y1x3QgfGzMv855xigV
 tEB5hbIM3U4hsX8wCqtP1lkAbhh8eFxjwBAyo89opDZM2/E+vMNjdKD0o1bHFNhPGz+fFiZ6p5w
 KKvO2Ja+OM/zxMC4JI8ePE7GFgVIok3OrHQWsWEBDrTA4ystLNxSUMLOwAWCKK/H+65VtLWdBhZ
 CXYhTf0zMVyQF9AQDpLOtt899IY5KCI/F6YUl2MokAf5Hfq5thyKTLpjg6IbrulmLWQfIgGy45t
 qYSgYcdHYUq2H4/z3fsqYSvbvYw8MJNj4HLtS0/CSozAZDRxCNHvYwQdhFDXvzal6e3nvNlDVJf
 ALFT80Dx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Document SPMI PMIC Arbiter for Qualcomm Kaanapali, which is compatible
with Glymur, use fallback to indicate that.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
dependency:
https://lore.kernel.org/all/20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com/
---
 .../devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index e80997a5fb4b..1d2424f27b65 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -19,8 +19,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-spmi-pmic-arb
+    OneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-spmi-pmic-arb
+          - const: qcom,glymur-spmi-pmic-arb
+      - enum:
+          - qcom,glymur-spmi-pmic-arb
 
   reg:
     items:

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250923-knp-spmi-binding-1d25dddc27cd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


