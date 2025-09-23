Return-Path: <linux-arm-msm+bounces-74535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F68B96C43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 18:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B33153A7F97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 16:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863D82E8DEC;
	Tue, 23 Sep 2025 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItMpgK5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB572257842
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643878; cv=none; b=nWQtB5cn+UdzmtXGTDbQhQtBWLJRQY5x9Vc3H4CIj/pkN3kbvmIssWoVbUUdN1M1wPOYJyRkTbdixhN76BaO13e09W5rw2EDYMD5lmC2vbUgVHel3roPskUTu/dOMn2m3zu6QVzGfs7Hm+O1QaFiJDkW7REI03ay8ooppu+V7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643878; c=relaxed/simple;
	bh=S4DCabmUgx7wjr90gBdV2xwMP4UhxJhIHvHJUN0oTwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IkpO+Bv/x7ZYjgCA7uxDXIfcZ9rFTR/fdKVH/8vP8Y6IzuOgnngmBnZWjp7KbJAtsr6YLNYaVWFpwZR84ydl+e0XxibKwyXsM2p3w6u18oJb047sbsal/T6RF6/AWR/Y98UaUSb8cMESEOgtRXV6K6dZJsdRlnX36h8Ek2MYeLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItMpgK5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFRBJa026284
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 16:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gXXsKXWMrsrDa77n53dShpXPwdnJeODNX87
	cwfB/X0E=; b=ItMpgK5ElJA1rzXHuvX92lzLJX1qYK58moE+OG+55xJtEIdNsXh
	79TLrAVXpNC4aEsW0AudBc8nJ53ORbf5U6gOqKRLr0Xn7xSptnCx5dsOpsw+m+UX
	SZ7coVyOHeo4yP3ku2TpwRX8zB6E3ABkLPNEi9thJ0gbEgT5+ttODNBRV/NV2E8l
	BUoddyml667eDVr8cAC98GHSk3h/hJTCHwpjsp4sJKR5SzZXgC9j0jOAWbBDJK+c
	q9BUjHR8KMNm0SgKJV9UBC0doC+5PH4u6dhidxKWCGXwhvxcYFL/6NFP1mwbjkmL
	2OrrtmFbQmG+6W+efq4p46U7Tvd96ZnOr4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeshsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 16:11:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2681623f927so55582855ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 09:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643875; x=1759248675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXXsKXWMrsrDa77n53dShpXPwdnJeODNX87cwfB/X0E=;
        b=DTeDHR8HtdUW9ByG1eTaXFNFLgOBAdtacofgjfLehCtvHHVdeDingbjHZavROtGUzZ
         CDBkWNpxQU4hTt10mFa/kecbiF/LJSZxXZQIbRYLZfNT9guz6Em+BxL94jh3rlwREgIi
         B0vBT0x7WItK055x9al9DlDBaS5U/1OUe9W0RniHJNg6xC5t8PVs3QPm2OsPd8m/FhIW
         PVdYsXvwtFqxfXxHJaEoglGSh2tzpp//ACm0M6p6ZawHmAoypJOrb38wFITC2nNwFaPk
         L2dyod/rU6y8hRtw3dxERUIauHQXQ7FrNuKcmrsk9aZUmPUX6/u9oaExQFq5kfpjg+Q2
         4YQg==
X-Forwarded-Encrypted: i=1; AJvYcCUW0Hb2XPHc/BzTwlamsZTSexljFf8TJGaqGYer3GGXz2+ff5K31RaprZOZJ4KzMyJ/b+79g7irWlUGguSY@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3C0kk2nDQ29SyOWlgdgNlcT5/KLih94kM7aDQQabZvBLmYr+
	TiG39e2PxnrtcEqmlzLmY6le4MD78rpCkood9b1nsJcdV7mcsIUQeUALwyCu2/orkQbo9FpVuGa
	6GGF532BfcPAtZOQo1M3zULfvcpwrunPIdDpJSwdYVSF2QOUrKdJ71YZKHMFWrbUsaLeN
X-Gm-Gg: ASbGnct8SiIEgEyZNbk0cUNO+BQ3ZAh/qh8v1eW/dgMQZuTxh42VFny36XzOzk0lG6E
	sjpGM1aO576w9fY3pO7B40r/T5nxhxzUV0GTUYf7e//a7/CNYU9rYFR+IYGkXpBaXSAwnFom7S4
	Sx8zLLMfnkHaamGznRChQ7PIvzs5U0N7CXLIJZK7PkOrhPRl9OktZMw90vSOJjzsm4X9/Pj/vqH
	rXhY3uL6le/+Vvjc0yWNjg8QJpjoxfIUGx8+/4w8oQbqUGz712TaZ8aZUZy8iREgJMQmxsxEFeS
	+I7Mhh9OtdOZDBBPdvBOC7SfZyqFrIh3N+GAqqSo5VbcY1iFsCZgRbX8xTwQbZ8TNMv480yeiO2
	t
X-Received: by 2002:a17:902:ea05:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-27ccaae76b4mr38001825ad.59.1758643874811;
        Tue, 23 Sep 2025 09:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcgDc1k1R7cpq+knm9wZ1c7VQL4r/SXF4203S/1vo1F+pemSrTnIlVN5YxWckIRKZQ3VmD4Q==
X-Received: by 2002:a17:902:ea05:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-27ccaae76b4mr38000965ad.59.1758643873541;
        Tue, 23 Sep 2025 09:11:13 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033d2a7sm162680525ad.132.2025.09.23.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 09:11:13 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name to QUPv3 nodes
Date: Tue, 23 Sep 2025 21:41:07 +0530
Message-Id: <20250923161107.3541698-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VmmOh9AzELqCqN42sAe2_q752i1PbaGB
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d2c6a3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8rlZebuS5uYMG-XfLoEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX90XbL6SZYuWD
 NHXhsOY6FyMqvzDpWA3iSAC4XgWdNy61Bn/wOKrL0pr36sXgy2J6onhctOOZHcgTdAdkqGt6qy1
 6ab3gcxFQnbB+Zg3I7btaORirsSDvoqDOCvK1l9gD7xI/wfTwjzPw5icV+x4xQoBddGrkP35UIc
 njAjbaqt0YrYnsug5f+Pm2wXs5JF9poiFdRKVVli2dqilX8E83vysKll4zCBT+bnhwvV3EgShwa
 0D21VuHXFnR7X2Awoqm+sBWhoBncJfho2kymuGBc4I3MnlAnxpklMUqrtG7t50Y9A5Es6T0UyMB
 QsBLH/F8hhtKFXUCHHt5MD9Bsp6oQjXPrXB/e5e1jLfNe9Ova2DXz3pBYT6Q2OrCVRDxwK6QQpL
 m4jlRmnZ
X-Proofpoint-ORIG-GUID: VmmOh9AzELqCqN42sAe2_q752i1PbaGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v1 -> v2:

- Updated the commit log.

v1 Link: https://lore.kernel.org/all/20250923143431.3490452-1-viken.dadhaniya@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001..4e361580ddf1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1009,10 +1009,12 @@ &qup_uart7_tx {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcs6490/qupv3fw.elf";
 	status = "okay";
 };
 
 &qupv3_id_1 {
+	firmware-name = "qcom/qcs6490/qupv3fw.elf";
 	status = "okay";
 };
 
-- 
2.34.1


