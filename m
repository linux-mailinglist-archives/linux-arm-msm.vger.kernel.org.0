Return-Path: <linux-arm-msm+bounces-92244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM0sJOisiWndAgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:46:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0538B10DB65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8100C301D308
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385F8364EBF;
	Mon,  9 Feb 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnFKki0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8A/1KBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BEB358D34
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630336; cv=none; b=IoOBvYM4Rc1uc6Nj4OZUGmiCTtFPA5U0ZJRrmiD08dxpTjOjsSXKTPXO1ieY98qTCSFAhHkC1BmoO3sPaIdCjJslOlnk01fssDSdUL/3FHcC2tZbf8WOlF5xsyAa3bEP2ERsRCBfnAnFeTdi3eDt6bu8eSQ3LRfu1fFp9Ylc4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630336; c=relaxed/simple;
	bh=vhThEVN7bEXh7GK+VeWEBsmyr1qQdIaHWoZfwvgzGFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFKlNB2buLHIQGjONmmorjNySvSJzVWyh7po3FIIG98kg/Sc6G8T+NDp7TjrEEHmI0sAhgmW7/GQ66fr+CSHrc7M1Ncn1DJZlZ7uj+Ig/deiAGw7rl7Rg0VfpO/VZVgWEznpteCCSD62c7DRFoNkbsp4r3e9W/hg0Bb5ZvYWCDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnFKki0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8A/1KBm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194oHk71476683
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EX2QMubW5FIovSx7YjymkK4QnLvmPm+d7h+uSs5JNRc=; b=nnFKki0NG/2/33vs
	2Z2PkdVHiPQvSncjYlgr6W56nHp6XoXPYQXABWTfB95RkGMK6635fro8HuCY9/4e
	M1Zlf/vRPrPu4sye/BRhcuPTp2Ph7ZPnJHNmlUT5vJGDzHJIA7xKRahwMm6osxzM
	KbG4paOq7/nAgUCf+nSTLb6IbeORb33stFajhujB8ISeANdZVH0hZ9nzAY0hQWEQ
	LSWTR6nfYDncWxBXibeF3oW0v9s/v9CZM8o8/AcFxoZnwKi0RQTvUGbIggMhtI3s
	/3Za6jOYTnwRqnR2cttmKZJCBl49TQDkVpHYI2+8aQY2iSn3P89RFV5/3cBU8LS0
	olpqlw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c64hnm3h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:45:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81ecb6279d9so4542885b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770630335; x=1771235135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX2QMubW5FIovSx7YjymkK4QnLvmPm+d7h+uSs5JNRc=;
        b=S8A/1KBm9MkenVd0SFRCieaHs5/aXNeCpLziYyneEM+xxT5xmMPSjez5P83daSrrdJ
         RVvld25/jKzFd9yAEDBvs4LPsXpTMqWr6VOXFHupjfXgb7J5gOxh4UsS4b08HRBJs24E
         NNh8G+pZc6xU7VULCA0NrLu8DtuF8TTDLURV1FQXyWT5UWXeO3RTqIgk80MNp6VjU1/d
         nxumqbFSWG1zu2ZU9ZR3NKOm10BqvHm00O2gYdgOMsj765a6ZO10WvpkNChTsNh20FDP
         aqmaL5HGIejOeunB7n0iIC3/pAxQgYXrKUbWnopnP3ScdQKlmmxY0gTBGUXRJBiHSzgv
         tb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630335; x=1771235135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EX2QMubW5FIovSx7YjymkK4QnLvmPm+d7h+uSs5JNRc=;
        b=KEtAllr2H874q2OZNL8Q6BDbqxeULddxMZNLwIKaZnaR6EzEH0haSon8c8soy+KJyW
         QRTcFjg1ShTbWiIujLOJb4H1J2LEn781MOfKnE15M+XuTNoctyS3nQ1PXmA6y+dZb+pt
         S9VYiniEQcOaW84yTpVXPR6FapqTmXn02U3qbK7a1y4Tr0sxhyMHQoo2l5G6mW0QqQc/
         qjvN6rJ/8Z0TemzdAzDUJeE6hGO47bTXD+csNQujzfxfaeJ1s/T9sDSfPYJYEMet/a8H
         /izOxLL/7NV7mguH17F/+udZ6rM1gwyGINuhb09BTFIptBp14fWBKJcFeJWd+D9UrGmx
         zZhQ==
X-Gm-Message-State: AOJu0YxoYGAgLjekplKZKU5MIuoCIQmf0UqYlpsRCPvLq52J7TH3Ud2d
	UJ7X/FVfcy54aC7GRHGwDwWrwXJC541JmmSyfi/bLbpgdDbvIpgdyG46J2aip4sumw2eLRHka9m
	D8bJfl5+WdYzI/sni8Y52mZtHi/gFkMWdThc0YU8nRDa3LQj1mVPZVPjaWLvCvSCQ5qN8
X-Gm-Gg: AZuq6aLNm6rf3hyummU4dVchg9t68CR476vhzQc1IdBdBVsO5O+M9IjE02UOIf7PNmf
	sLqiwpUg77R7+H0kLTjyaSf9835RtyeQNPGDN8ShVnbtqGN2wMC/lUUul44Rci2A5hIwEwWtoa8
	iOc2q2IdosKJJ5aTjgZz150PE2ZYWYgRciysquzuDGOX4CF0kfsENI8rZyMJko9nOLRALmNimw1
	E3yEjT1XsdDQ1DZuIfYabqlIDpbZNDdMJCXNs7XAe3RACsCfySIeesAWTyOTx3tP+4hRCptqGeU
	qPBHzEIMiTcEayV/geKQ5A9Ivek8gUsSZ0PHUXvGzQOiVrQ3lD/AfZMmleGnE+Z3kKivhem2MHP
	mwZGilHEKATJCWiLLODe981K3Ci10XVoU
X-Received: by 2002:a05:6a00:3a22:b0:81f:3c92:1699 with SMTP id d2e1a72fcca58-8244176cdb0mr10333109b3a.59.1770630334493;
        Mon, 09 Feb 2026 01:45:34 -0800 (PST)
X-Received: by 2002:a05:6a00:3a22:b0:81f:3c92:1699 with SMTP id d2e1a72fcca58-8244176cdb0mr10333083b3a.59.1770630333968;
        Mon, 09 Feb 2026 01:45:33 -0800 (PST)
Received: from [169.254.0.6] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm10748666b3a.39.2026.02.09.01.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:45:33 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 09:44:28 +0000
Subject: [PATCH v3 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Mahua SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-mahua_icc-v3-1-c65f3dfd72c8@oss.qualcomm.com>
References: <20260209-mahua_icc-v3-0-c65f3dfd72c8@oss.qualcomm.com>
In-Reply-To: <20260209-mahua_icc-v3-0-c65f3dfd72c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: CUPNbl3E43RIfHoYhx30S00Vq1jHfZdv
X-Proofpoint-ORIG-GUID: CUPNbl3E43RIfHoYhx30S00Vq1jHfZdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MCBTYWx0ZWRfX3t8GHaDO6+CI
 MEYxhEpTQaWa9oT6lSTKWWG+3RYpUesJhRUS/ivSAx7Qcly9yEMMeBetn8qC/O/SAn1QiLoMemT
 2L/OrapvodVKUfAuYhUKVTxMTDUmhzY1qjZcIBH+UvhckKQtvTix7RjOZP0vYIYouzsJXu88VYM
 ApfIssmRfUhugpIB55lQDy/vOhMSFtd8LKSudVvVf26c2fsESQyMF7LkeZQIrEsq/y+ngpD6lX/
 xHhbSuLU1lA+1cqm5jp1kwUEAzydd4QfvRXx+whqMyOzx7wpUedgdagQI65wolsTGe8BPklLtcf
 vUqWvXEFO/89ejHsDzgVGeq8FCUtmZ8DNfV3CN64EWGYkQGr9O/gVhpokjK8peWAo9P3Sxi8h1b
 /99qcAIPjBRhp3VtROXMhNGOMvmchuR38XUJUl8dDdNt9IezE4uoVAQEfGGtTbNqcrnlL8/yD5M
 H/tOKEjHIjXT7U/q+kA==
X-Authority-Analysis: v=2.4 cv=SNlPlevH c=1 sm=1 tr=0 ts=6989acbf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=XbHj8r4lGLmVoAHgLPwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92244-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0538B10DB65
X-Rspamd-Action: no action

Document the RPMh Network-on-Chip (NoC) interconnect for the Qualcomm
Mahua platform.

Mahua is a derivative of the Glymur SoC. Many interconnect nodes are
identical and continue to use Glymur fallback compatibles. Mahua
introduces SoC-specific configurations and topologies for several
NoC blocks, including CNOC, HSCNOC, PCIe West ANoC/Slave NoCs.
This updates the existing Glymur yaml schema to include Mahua-specific
compatible strings, using two-cell "fallback" compatibles wherever
the hardware is identical with Glymur.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,glymur-rpmh.yaml    | 136 +++++++++++++++++----
 1 file changed, 111 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
index d55a7bcf5591eea79c173a12b12c659321ca3c2e..f69b2facb658e076bd622f832b3e2844b6e72c29 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm RPMh Network-On-Chip Interconnect on GLYMUR
+title: Qualcomm RPMh Network-On-Chip Interconnect on Glymur and Mahua SoCs
 
 maintainers:
   - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
@@ -21,28 +21,98 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-aggre1-noc
-      - qcom,glymur-aggre2-noc
-      - qcom,glymur-aggre3-noc
-      - qcom,glymur-aggre4-noc
-      - qcom,glymur-clk-virt
-      - qcom,glymur-cnoc-cfg
-      - qcom,glymur-cnoc-main
-      - qcom,glymur-hscnoc
-      - qcom,glymur-lpass-ag-noc
-      - qcom,glymur-lpass-lpiaon-noc
-      - qcom,glymur-lpass-lpicx-noc
-      - qcom,glymur-mc-virt
-      - qcom,glymur-mmss-noc
-      - qcom,glymur-nsinoc
-      - qcom,glymur-nsp-noc
-      - qcom,glymur-oobm-ss-noc
-      - qcom,glymur-pcie-east-anoc
-      - qcom,glymur-pcie-east-slv-noc
-      - qcom,glymur-pcie-west-anoc
-      - qcom,glymur-pcie-west-slv-noc
-      - qcom,glymur-system-noc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,mahua-aggre1-noc
+          - const: qcom,glymur-aggre1-noc
+      - items:
+          - enum:
+              - qcom,mahua-aggre2-noc
+          - const: qcom,glymur-aggre2-noc
+      - items:
+          - enum:
+              - qcom,mahua-aggre3-noc
+          - const: qcom,glymur-aggre3-noc
+      - items:
+          - enum:
+              - qcom,mahua-aggre4-noc
+          - const: qcom,glymur-aggre4-noc
+      - items:
+          - enum:
+              - qcom,mahua-clk-virt
+          - const: qcom,glymur-clk-virt
+      - items:
+          - enum:
+              - qcom,mahua-cnoc-main
+          - const: qcom,glymur-cnoc-main
+      - items:
+          - enum:
+              - qcom,mahua-lpass-ag-noc
+          - const: qcom,glymur-lpass-ag-noc
+      - items:
+          - enum:
+              - qcom,mahua-lpass-lpiaon-noc
+          - const: qcom,glymur-lpass-lpiaon-noc
+      - items:
+          - enum:
+              - qcom,mahua-lpass-lpicx-noc
+          - const: qcom,glymur-lpass-lpicx-noc
+      - items:
+          - enum:
+              - qcom,mahua-mmss-noc
+          - const: qcom,glymur-mmss-noc
+      - items:
+          - enum:
+              - qcom,mahua-nsinoc
+          - const: qcom,glymur-nsinoc
+      - items:
+          - enum:
+              - qcom,mahua-nsp-noc
+          - const: qcom,glymur-nsp-noc
+      - items:
+          - enum:
+              - qcom,mahua-oobm-ss-noc
+          - const: qcom,glymur-oobm-ss-noc
+      - items:
+          - enum:
+              - qcom,mahua-pcie-east-anoc
+          - const: qcom,glymur-pcie-east-anoc
+      - items:
+          - enum:
+              - qcom,mahua-pcie-east-slv-noc
+          - const: qcom,glymur-pcie-east-slv-noc
+      - items:
+          - enum:
+              - qcom,mahua-system-noc
+          - const: qcom,glymur-system-noc
+      - enum:
+          - qcom,glymur-aggre1-noc
+          - qcom,glymur-aggre2-noc
+          - qcom,glymur-aggre3-noc
+          - qcom,glymur-aggre4-noc
+          - qcom,glymur-clk-virt
+          - qcom,glymur-cnoc-cfg
+          - qcom,glymur-cnoc-main
+          - qcom,glymur-hscnoc
+          - qcom,glymur-lpass-ag-noc
+          - qcom,glymur-lpass-lpiaon-noc
+          - qcom,glymur-lpass-lpicx-noc
+          - qcom,glymur-mc-virt
+          - qcom,glymur-mmss-noc
+          - qcom,glymur-nsinoc
+          - qcom,glymur-nsp-noc
+          - qcom,glymur-oobm-ss-noc
+          - qcom,glymur-pcie-east-anoc
+          - qcom,glymur-pcie-east-slv-noc
+          - qcom,glymur-pcie-west-anoc
+          - qcom,glymur-pcie-west-slv-noc
+          - qcom,glymur-system-noc
+          - qcom,mahua-cnoc-cfg
+          - qcom,mahua-hscnoc
+          - qcom,mahua-mc-virt
+          - qcom,mahua-pcie-west-anoc
+          - qcom,mahua-pcie-west-slv-noc
 
   reg:
     maxItems: 1
@@ -63,6 +133,7 @@ allOf:
             enum:
               - qcom,glymur-clk-virt
               - qcom,glymur-mc-virt
+              - qcom,mahua-mc-virt
     then:
       properties:
         reg: false
@@ -85,6 +156,20 @@ allOf:
             - description: aggre PCIE_4 WEST AXI clock
             - description: aggre PCIE_6 WEST AXI clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mahua-pcie-west-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre PCIE_3B WEST AXI clock
+            - description: aggre PCIE_4 WEST AXI clock
+            - description: aggre PCIE_6 WEST AXI clock
+
   - if:
       properties:
         compatible:
@@ -131,10 +216,11 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,glymur-pcie-west-anoc
-              - qcom,glymur-pcie-east-anoc
               - qcom,glymur-aggre2-noc
               - qcom,glymur-aggre4-noc
+              - qcom,glymur-pcie-east-anoc
+              - qcom,glymur-pcie-west-anoc
+              - qcom,mahua-pcie-west-anoc
     then:
       required:
         - clocks

-- 
2.43.0


