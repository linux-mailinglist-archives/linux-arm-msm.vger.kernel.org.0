Return-Path: <linux-arm-msm+bounces-102243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DA0DJx81Wl96wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:52:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3473B5240
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8ACB3026765
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 21:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951A237E30E;
	Tue,  7 Apr 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmffRrGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQBge165"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2B33C53F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775598731; cv=none; b=FRfjUnHzztxBzd1ni8mm3veHDscMv9kOtIWhBNVrS4ID8T+0SdVMtYc+k1HZurNIwOf1hfdxmXNIIh0irB4KywliaB+pZBbs/DZq1kbAWAhgSPt+oczaPcYtJsYosi5udsGU/w/9e3L2wKgVnzKA/SAcX0Z30cqs1axSUCI4do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775598731; c=relaxed/simple;
	bh=JiMXN5S+khsxEmu/YLnrH2mt71+1ZhM3x6LB0MpuESU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctoAZcdPNGWNQzr0vBE6cuaFjKJZs5SqpfUU4QpaoTCvVti50BD/LGbD+IuHnceySfeBxtufNle4ToFWw17n8YwfkzBlB3pHJua9Q3Cj69GpOc9VD0Gl9ObUnqkUGe8oTxCuZEmtkVs0lDKqSwHzwh2QeZB35qP8cW+/Xj8Bjhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmffRrGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQBge165; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637H7ElH2412018
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 21:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hC3RvSZ8HyqLaVrBqnS8owGniowsj4R1b4lXtsexSKo=; b=WmffRrGDOg3L1jJ6
	CCDGWq0785ohz5Fz+8B/b/tT0Bq0ClvrvvspRIml4K0nXCcqrUyivv6u77+Bpl/U
	wGFaG7UMmcUvh4ATK9Bd1VhvYjwlqnAj4zXbw76P+EZOYF6dood1rJW+dG8U2nE3
	G+SV16PthmYuNGzla/Se7o1KmIaoVck4i1AyC2aFSy1FXzUP438Hflu6L09MuyvG
	0WU1bjAHJsMHrhuQq+px4+xAZe1a/9GW7Bvx3aMD+cgycll9sqZhVFE6f9ocZzvt
	ZdyxkqiqNQLfyOpT4X9JC6kJUIN9eEiseuWbwj68vu7767apWpRHw7+msugP9huk
	jfr/oQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61v8y71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 21:52:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1275c6fc58aso8296494c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775598728; x=1776203528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hC3RvSZ8HyqLaVrBqnS8owGniowsj4R1b4lXtsexSKo=;
        b=NQBge165TqlLG9PeSrEMh8R2qBx863ruI0jLZ01YjxsDTlgS+1ULvhTMpERwLavgTY
         8M+oxTzufI2mINwdKILTSLErf1SQ0BQ+eQ7j2jgbe6x8x3kBEtWFQ8KuUQSQYcxtRMpI
         yzhtCuXfVnU6CO/oN/k5QbKpsBqV6fhzQkxpjD+0lQCiPQ4Zgs+ZDMMIQ2VR/sKIeO0M
         DHNflLBkfPvL+BhzoBduTFwixA8M8Thru7DchYxZ7DQQwRDODGxGjW60APAwZkfwSFBx
         DP8oT6RWDeRdCWshw79SF5be9W3OUMSofcK8gxTrrah0luqzim9aOaEzildC8JNGStX5
         MtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775598728; x=1776203528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hC3RvSZ8HyqLaVrBqnS8owGniowsj4R1b4lXtsexSKo=;
        b=Ko5MCFw/Qk/lMTDik3VCLTa0Jrk7TZ1WGNMX+U4OiXNdD6nZItM3pGkQ53ylOP3Xky
         kXrPOe5yEnXIQ6EWFsElzEa6eeMpY98TiktNLDAGyZjgFVjfi0aE2D7MfEUTHJwgF6X7
         4FXZWVJDYrCnIXbpwT0zN9eNyWBqUJsoQsy6RQL+bfYrDg3jApn9VhN5MUmTbSBT8ppB
         gXWyoJk6y+SMU2IFeqvb2zOdzNGPjvAkURTQY/2VUOkIiuakoGpLt8YRx2Pyp8/t0ZDw
         KnHU1qzFApiBifTucNeQSAznnE5j86fWBnM3jPhiEQjpG6eREEx7BKqGR6GbV5KabOT0
         62AA==
X-Gm-Message-State: AOJu0YyCN9sfVyTAPjjnzEDQFjgEcd/GFi3bnbFTbpRjgu1gH8aI0Fvx
	h8m8I3f1XomkDAMzMb48FSy9vw59SrhMHJOSUsMhM4FRinhW/ufRmDyaII0Hix1kfTyyG/Hfrmi
	TO0zTHjVKJLLQsalfSfAFGGmmyw5M/vj04SHGZd4Wmoq9AraRb7TYrG3SxOadNAIfQtQ=
X-Gm-Gg: AeBDiethmGBavJqKdT0x7kZjOZA2+bwD07kvBkToi7iN53UyeE1WmTYeFsF29o8ymXa
	bGdZr/pdQ8o111PCz2/AxB9fKGfLvDhmJH+Q+Ym5e+8Smtixo7Jfiv8Y50fEiMhZXMJ+dNWgw6x
	gBprYEcUgOlXOJAu3df5uoKpMAk0ciX58Eluk1XVuFhxtYWqvzTc6vgCyZxTK7HXiSU2rEwT9Qt
	EadUfDKtQ/Z35J6pTxNvgD65b5SXDov9Kml7oWVtIfEFN+gqJNvN2KQ2aVTje8UiTz0BczRi5mS
	l02Kdwk4baWFpp26Kj+FM5BRtP67Vfnw+v4L1uDdO1hCG1tW8zsIyMDU/ZGBOLuafKGvVmOXO4c
	8XsgcllB39UiGDmqHJe7mAmXtvnfeUCfjHYLFfTGYezGsQFbxCAPhqiVB3OaCRb+a6yr6lg4nVA
	==
X-Received: by 2002:a05:7022:6097:b0:128:df3d:cd97 with SMTP id a92af1059eb24-12bfb76759amr8382883c88.35.1775598727518;
        Tue, 07 Apr 2026 14:52:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6097:b0:128:df3d:cd97 with SMTP id a92af1059eb24-12bfb76759amr8382858c88.35.1775598726842;
        Tue, 07 Apr 2026 14:52:06 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm16224123c88.2.2026.04.07.14.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:52:05 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 14:51:47 -0700
Subject: [PATCH v2 1/3] dt-bindings: cache: qcom,llcc: Document Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-external_llcc_changes2set-v2-1-b5017ce2020b@oss.qualcomm.com>
References: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
In-Reply-To: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775598722; l=2092;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=JiMXN5S+khsxEmu/YLnrH2mt71+1ZhM3x6LB0MpuESU=;
 b=1QqFNH0elm/zALyXd4UmResxPKUk2tddNnaN3I35PveQ6ZFsfJfjqlOvG0PjoVnde4vh9yKhD
 utrV3NYkMW8A1kHe6sGR+jHe+jWgvj9CNSDxCIjZrynXEm6lMoJk+hI
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIwMCBTYWx0ZWRfXxIYKAxFiX2Qm
 lGPo50cKjxGrXWGrNISOj7LNwz+w228TWtqfEiAyy3Rk317eUkm1TtbVPsCAc8YRJVbcXcT4x1k
 VBJ9I9RpaaOEvpJK7zI+Yi/wVuwyGh+WIodAvLCNCcy2eXLB+E2YRuyR9jvPiH2k3nj8qwm41hP
 12UQO6PLdGK1Y6+Mm92CASKWHZyDhebwhA1vomZA06KH9+eKZI6fr1ptaBvP5m+1sjrf743ErGa
 X/dG40aaNTS2Hm/bzuCugLgptIcoi61BhJzwPSDFWROrbLbqDPgob4TkqDax6leK/xEmRK4dcis
 oW1NC4WjNwWJBnz/OwTCGcv4P+KI1IPPSIraW/3/YQ4vwXjphnMGMW5Gpao3S+Myzb/BJt2l/OP
 RQgGpHGevVaOe5uQ30D2WF7Uk6KHXpkCypCBuOrHs7LXUYeZjVxG+uKhAdpDLXFper3VUlcyjiX
 +om1eeyC6fBhaiv/Esg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d57c89 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cctpUGu4WP7Cl6E8askA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 0K2h0xetlM5kBsODocwJljQdcr29BvDC
X-Proofpoint-GUID: 0K2h0xetlM5kBsODocwJljQdcr29BvDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070200
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF3473B5240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the Last Level Cache Controller (LLCC) bindings
to support Hawi SoC where the System Cache Table (SCT) is programmed
by firmware outside of Linux.

Introduce a property that specifies the base address of the shared
memory region from which the driver should read SCT descriptors
provided by firmware.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..40b737ad2230 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-llcc
+      - qcom,hawi-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
       - qcom,qcs615-llcc
@@ -57,6 +58,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: handle to a reserved-memory node used for firmware-populated
+      SLC/SCT shared memory.
+
   nvmem-cells:
     items:
       - description: Reference to an nvmem node for multi channel DDR
@@ -318,6 +324,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-llcc
+              - qcom,hawi-llcc
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
@@ -340,6 +347,18 @@ allOf:
             - const: llcc3_base
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-llcc
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
 
 additionalProperties: false
 

-- 
2.34.1


