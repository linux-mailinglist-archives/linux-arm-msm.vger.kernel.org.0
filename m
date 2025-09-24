Return-Path: <linux-arm-msm+bounces-74724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68902B9C840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E184A5415
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98AB2D5427;
	Wed, 24 Sep 2025 23:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyVDwjd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD332D5932
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755926; cv=none; b=IE5a7xAEBEoFfD9C8lUeh27D5BColZISFkLYsBvAu5HHpXummAdFN47HKn5PDuq/xo79XI2oiaIOdTli+yAQ3rd67imCurX/KDxTAqaU/p9WqHzw3rfl7VV+isHhco4Ci6aV3XElnPjXZyrci8UrTOxivqjdQTaxLFbNrxiR3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755926; c=relaxed/simple;
	bh=+qkSekDGOjNKG/k7dn905Dlzpg/GVr/t9jtr3sEQRwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f8dU1S+G/4vKEdpMff94L4SF5NUHCPd6DVRuCSKT+NbP6KzmZrs3EPCdNmpAVrJSYNJKsGjP3Ujwg4ojDutJX04eIZWsHU37Gvdx/9VKmkQp6wmbAxJ2U6ReUNl+mjK1RXEuLZp0ekdi9DYbmpqkIsCyktFbentpzr/ADOoq7nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyVDwjd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCiEDS024230
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5ypITQmkoYFzW0JuVREFsC
	yxSWVZiss9ZTnyYLXQQuU=; b=fyVDwjd0aZ9gk527VorQYQ5d1tzMA9uYf5wfrF
	95hMtjqb56a/LsAQlkXyGHCI/l6wIs2hnD8FnYvf/V+9fbMGQ0GI4CswqSkw6CEz
	TnRgSxXFVi/ALu1S3m6JfIme3chs3rRxe6zoFpqWJI1FkTwul3bp94Y/I3OLwAjT
	Y+AfxVn+5CAulN5XkRjjvXF1Amk+oImbRNxMtQRmPzmHeBRlPx6hAff/qxXamUqn
	UZzN//xzlkQKb54RzfcW8q7uanAaiT2XyFh7S75fZbFehjs0v4VO03bmTB33hWIU
	pGx9+wiB8IHxkePSmWHyq0U3n8jvn+Xv/CiYXTAkSm5BFkgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d1rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32edda89a37so291246a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755922; x=1759360722;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ypITQmkoYFzW0JuVREFsCyxSWVZiss9ZTnyYLXQQuU=;
        b=tpNiVWxk4bLcBKwKuvPPCoIIc5I8FDz+VH+Qc1T3xPksqK8xaWD+kkzL57EXFM3x0K
         yGNkAQtCuNIBVfzaEFUloAiJwQxgmGSsgo8Ut4BmfNvYBm9ryncDEakez1BJr2O9Xd9I
         KB40sxVBshe4uGsjpKo1Z1xWmJ1c8/qOjOmcQp9YYpGpqCfRcSEPOof9oNpuiHQ1vL80
         TaLyl5XpNMTU2XRDz1p7az9artQJsaP89PDpHwaUxsZKYk7FC5RmtTtxKo5PV0JZy9Rw
         /XamMb3TqhDvMFtSW/x+UCZgbq+0cjIqlcW0xkGtajhYRLqxUCY9BbbtR8FF/ryYXaAR
         bSIg==
X-Gm-Message-State: AOJu0YyN74ooBzX0aGIxWCPpKGf2acl49qj+Xbjy0xfgVAN5b1Xwp5DE
	/RdZjUZXMPzxu5m6prT0X5nIP4Y4UoCajwhh7D/vAvbiUAaH9fclzGi8x2wMO/SfEfBjo1LGhSh
	GsVrddvpTqzOEekuNix2yVOwuso2pMk/sLFChd1kvRYRzwyAGMdKDxT7vITyQ53md0oCa
X-Gm-Gg: ASbGncuvKXeoBfP6+JYF8/VElHmwkOq+qJ0rD9oXmMufQRjZ6PxZccmiX7O7zq0uQAL
	6PH5at4EHAt34/f2IacFJUwHWQ3YP7/EEBkW2b69TYzc2EtfxZJ+GWG2eU4QrjiXae9J4vHGeVN
	TrkNLRcmFiIxFjFTrHZ0Z1alR6D5OdSClAoTzG7yqQxdIOX0e7VSgW9AWYMEjT43/frLCGb8QgH
	XHmw4OYiGWgTeuOjHYl/QF7F6OYXywQ0pDTt1OK8ybSZRkNCsSAhcU1f1nKYh/nhZyGbke2MiWz
	xgQGruuBgvqVrDU1lm4Wu1Me2440bWlPZlS6TugAEiIeLWbFUTGg+p1ZNpLwZiD07z750fMn04y
	e5xS2vAqerbKmUv0=
X-Received: by 2002:a17:90b:1e0a:b0:32e:4924:690f with SMTP id 98e67ed59e1d1-3342a2437c4mr1307650a91.6.1758755922279;
        Wed, 24 Sep 2025 16:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnkwZW7OOokn8gI0yk0E3I0Ln5FclDoYgmkYTDIztv/RM5NLyWdggkDIInIpcowpngDxQM+w==
X-Received: by 2002:a17:90b:1e0a:b0:32e:4924:690f with SMTP id 98e67ed59e1d1-3342a2437c4mr1307628a91.6.1758755921840;
        Wed, 24 Sep 2025 16:18:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53d9160sm385470a12.22.2025.09.24.16.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:18:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:18:35 -0700
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Kaanapali IPCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-ipcc-v1-1-5d9e9cb59ad4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEp81GgC/x3MQQqDQAxA0atI1g2Mjlrbq4iLOEYNpdMhKUUQ7
 +7Y5YPP38FYhQ2exQ7KPzH5xIzyVkBYKS6MMmVD5arGPco7vmJCSSGgc633vvNEdQc5T8qzbP9
 VP2SPZIyjUgzrNXiTfVnhOE7/l9eKcwAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755920; l=1157;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=+qkSekDGOjNKG/k7dn905Dlzpg/GVr/t9jtr3sEQRwg=;
 b=QQAn2FTnIVHInKPF5KCqvL/M8G6naMhW9ZVdAAUor+YhEmraG26rDoDSqc2sr6WTpTQ57JzrU
 XeJwFCepJ6yBA2P/cO8VwzTcJwI93Y2YPT1AF4d/GohtRYG6dyhtX6o
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d47c53 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U9C9QlmAXZJKE0jXtekA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vcPgDfYe7AIDjTAtNtJvncElgoqdIf-Q
X-Proofpoint-ORIG-GUID: vcPgDfYe7AIDjTAtNtJvncElgoqdIf-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXzU8HEiKXubkw
 awT5+LigLOG37g02GFk2dp+2c4e7iA4oEPaYTbCFYxZDT4keCBPO3/vJujcEdJKHFuKZnEpTYxH
 Up8km1J+DN6ylsWrj9D+MgXZLLgsQ8hmD6oiqhaxS9Bf8dkmdbRYKBRMfPuu6W/KAUxtyPfkCug
 r4N1iW0UkTk8PAFWdYjNH+76fJPShaKLOcKdRHSWdkkT+E93s87YWXADFNWK9ktJQjJNXH4FbWY
 DsG1d9leA2+rO3e7D60c+2b/sC3e47tovHGAmBfnaQtDyG/9t7P9I/2Dof18dGb2bT4F1+bxnOB
 MkMNm/LIsZIielSm9xZkGUQCOyVGaJEGMzuT4GG6crMh/3QY1SMJal8sEojXeBxS70YqgX2mRsJ
 eoDGK4cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

Document the Inter-Processor Communication Controller on the Qualcomm
Kaanapali Platform, which will be used to route interrupts across various
subsystems found on the SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Add support for Inter-Processor Communication Controller on Qualcomm
Kaanapali platform. Including the document and the new bindings.
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index e5c423130db6..ee3fe093e3ca 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,kaanapali-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-ipcc-00633383aa48

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


