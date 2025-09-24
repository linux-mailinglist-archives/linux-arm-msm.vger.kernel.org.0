Return-Path: <linux-arm-msm+bounces-74726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A88B9C861
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDA2B3A5141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5868423814D;
	Wed, 24 Sep 2025 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvEFPhSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11902D052
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756194; cv=none; b=rwakXmfbqvP9HvCgg5cHYZGUdG5f2eLUrYJMb7Fw3iMXpuaD9HEPOc3Ce2TZOR1KN0UkLiU/o02yufald0QIcax46iK0jfmoKlD0YAevhIIN6O+z9ABYGakBHY14hjbgbyLsoHMNiRg7RKKlNKcS3zr4Fp7VR1NmrXq/4gQHEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756194; c=relaxed/simple;
	bh=gFCePsoPbzM0W7ILRRpK1/MIcPC3NfbicImFa/pze/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QNnxHWr0sr7VDzeg6V8IqLUKu5ijaDTsmb/4kdqqdgOJf/oziShpKHNTkVR9WkfMCIg1lc0o95LZXSwh+Z/5F1/cAzQR6ekZ0JIMWKah8b4pMa45JQw88/q6E951oW2sr2ZqjsOTsEBUwK8nrzd3NhaDxxv5Rdu81EsRn5CxUB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvEFPhSK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD5hoe029706
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t+4IWnHke+FbZXG2BMohmw
	IxnzVqYF1Hh5Q4vtTVF14=; b=CvEFPhSKrrUhj+GRR6fC+xUvy/vJMkmFKKmQeH
	GKtoHahug2qzX0EwPmHrtQk8pMt6KvdIYTgPbflkrO4Usc94OakuQ7pz6FpJ8ZD4
	yS23wRPdTxevF3Iy3fYziUmNHJBRdc7fCmaFaX3kkKmMbC3hlLviYBBlDvliO50a
	Ed5j274sF9FRmyTJJslGAAK7deWhjyn1D6MthELa0gsAJJTwMiz3FK/6w3WX3W+g
	kIAC+gCJuZtiPRetLCVmPDL6fwuDY5PYWlQ0j0WD5/cCqgxyI50U/x73PRYG4t4d
	B54dG5mZqxPqbOHsDY8FEhV9ylOnBAStd7PMLM6iG7v+sS2w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnw4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:23:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6fc6so5259215ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756191; x=1759360991;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+4IWnHke+FbZXG2BMohmwIxnzVqYF1Hh5Q4vtTVF14=;
        b=swU9rpr8kAKJpnD4FtWhlHuAYiJWn3HVI5t5zPPBFZyUXAZilC/FNODfRXBnbFoNnK
         QbQ+NIPTaaMarqaBgDD0yM4s8yCCRH4ryl7IHZe4AS0fCjr5J5FU//TbqizU4otA+xgk
         tZW70VfXf6DbcDfM8m3m4jgmU54g8crcptzrLuT+n+HSkU/Ly3r40SicsyOQnpQMIkRJ
         D3dGH+BloFim+lGYETkyZYPFKSshHcyjN6oH2uSpqYWb8OpcDaG86qLl+StSsgm6kU2V
         /QLjfrifUVrJBQil44vTSQleXMnc9gMiH5uleiXPKgTCPBRURZtuUZ9pdi82Bfj8MaZv
         Zw3Q==
X-Gm-Message-State: AOJu0YyQWAWJHJ7m3ymKDpCq5eBw3dQxO08YpS3823Ve0uvNM0mUMnSd
	faJJvjs5+CmCAWwtxK3ONcTxD5Hmcfh79vNlmtzrKtEnHUHExd6wtccbkJPl9yx3KfjqbcnT5bR
	T4vy3A2sCRa7pLMSrLs5CEu3pNXWJ7K6HcRZkSXLLKCMz2rcdlIcke03OXr005WkY3ziS
X-Gm-Gg: ASbGncuO4dE+eCuKeL7GmPreowyqHC3sPxUEp1mxWOTJDzg6Sm3hflNhfH6ZxYpx/H4
	3xhofGo4I2TazXUdRwS3xWc6aau035BFcIiED489EtAJnMJ+bZcDanNRCwh1Au5ManMPyGyZwNu
	rlWkuMBrsDYThPZ2Lsfi5Qzr9Vyw407lpXZqIFsUxVGyFnCE+EKLeNn5dkK1jeosVQaYnKAwH0b
	ZRI4PIfuEmZaBYZK7GRLSYKbqyjXy/QGt73vwVreOVnhPtVn51IxEGZhBeoJYKhETj6q0pVQMuv
	vRj0LPMZeBbVBDD74th+Vw9xOqGvRpoOpMPXrqR73caT1OgCuowTNei8jRtkMmczBk2cTr28xZT
	nILUtfIaXx99oTVU=
X-Received: by 2002:a17:903:b8f:b0:267:bd8d:1ca with SMTP id d9443c01a7336-27ed4a6e8dbmr17494285ad.43.1758756191145;
        Wed, 24 Sep 2025 16:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcViyIgc/11XVapybWYXt7+h+ARrhm5NS+/jC2pUC+Hh+STkUep9GhTZoOG6ot9Z7n+IN+bA==
X-Received: by 2002:a17:903:b8f:b0:267:bd8d:1ca with SMTP id d9443c01a7336-27ed4a6e8dbmr17493985ad.43.1758756190697;
        Wed, 24 Sep 2025 16:23:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821aesm4048915ad.90.2025.09.24.16.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:23:10 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:23:06 -0700
Subject: [PATCH] dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
 bindings for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cpufreq-v1-1-1bda16702bb1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFl91GgC/x3MwQqDMAyA4VeRnBeodSLuVcYOsaYziF2XbCKI7
 26343f4/x2MVdjgVu2gvIrJKxXUlwrCROnJKGMxeOdb19cdziljyN+o/MZr17jomtD7lqAUWTn
 K9r/dH8UDGeOglML0eyxkH1Y4jhMG/iSYdgAAAA==
To: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756189; l=1188;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gFCePsoPbzM0W7ILRRpK1/MIcPC3NfbicImFa/pze/I=;
 b=VZHuxitp5BD5mBW/K7gCz7zoYBjX1GT1qVkD7uakOrEFz5fRHBnj0g4pKPiDPAKTCfCfe0ITC
 lDAN8jWU+sjCPkQGlwK2Nyu2IEx2iA8oRnD+/8LhqNY54i8/ta/irJk
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 5SA-KIIvIWsLbYp7cj_t1ovvemzGWaR3
X-Proofpoint-GUID: 5SA-KIIvIWsLbYp7cj_t1ovvemzGWaR3
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d47d60 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8jNUSCxD5SpwfXmMkmYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX4Xz5vwtPFetJ
 gZ3lurDlWmWmcDSTaJP6jo8qd5PHtojq5yc9Hnr3nSJbjd8v18C0VsSgEEgpVvlEUVdrf3y3z6m
 JA4ZeEaPugHnBCUAaaMhSIDNr3yovgYJNE+2JfMEq0UoWDKWJ7KBTeTOCwmSRT6UjxpXnEQmCsx
 yYJI8jjv4zg1ZmoCB0d32UKWiSLLTx1pHhQ5ffwuZlbTYN4h25voCO7lXyDU4CIMahfoa9Vcqm5
 6qa3l6au855gWUnX81OD3FXZMdxCehYrz119xeDkd48L7zPqKqOkAt5lPVt9U+yTaGPN42gEJ2W
 hCC1CL6qMXk0c/it4sFoqGRnwzoWK6nNPcwQM8CMVJx9v2Xw/9UAP44as/Aunx1BGh2NkdXHYWk
 vjq70wxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
Kaanapali, which is compatible with X1E80100, use fallback to indicate
this.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index f7342d04beec..6f72f78e4b72 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -15,8 +15,13 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: qcom,x1e80100-cpucp-mbox
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-cpucp-mbox
+          - const: qcom,x1e80100-cpucp-mbox
+      - enum:
+          - qcom,x1e80100-cpucp-mbox
 
   reg:
     items:

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-cpufreq-4730f03c925a

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


