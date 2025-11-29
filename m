Return-Path: <linux-arm-msm+bounces-83846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB73C93BA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 10:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 24164348EE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55E926ED51;
	Sat, 29 Nov 2025 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boe/txdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvIvx/9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A226560D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764409579; cv=none; b=mBKjg4D8T37CmbJMOxqjccA4phWVfrumOSj7Nf668WNN/uzsfUqQALYRrDietp4MEVMi/AdnRuN9U6itd4baTRMvQ5Zu02P6VI+UfBLH+pT3vMGMeshe9ST10sWkAOKVKOw3XJP2k2vepBQlCPt9K0YatlU+UgqJVMtpgTiHGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764409579; c=relaxed/simple;
	bh=uRpd2cn2vp/H3EIwALlopjhJwKq2UcM/mwO6ghYAUeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tskqWA8dvv8P8sGGIwBIVLRGkdDFYOcwzX43xu4D+u81tusC3OxMyFmYpjgggC9R5NY/ItosBSeFSVikfcC1V26+Fs4gS1tgyaW8MXHSg07C/0CUGE+DOUHZl9ylC/yTo9f2UhMb0QUGJBOWw+o50qJ7AnBIlRtEAp9HghGU9eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boe/txdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvIvx/9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT4diXQ1264246
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 09:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cv+2iS7qHjsBq/waCdbpd8WWRy6Fwb6PhkS
	0TY3pF6g=; b=boe/txdtHz3aIhmo96ti2OkhcKyIX3U28cMaghzUN2BObJuvCTt
	/WhMXnxyTsDqdutijRpyBsEYJ6PxoYagNS1plLKxtbWgvEgTr0bjbRh7+aU/eU+d
	jevhiWsX8ckeNSnu9mT7vTN3Ujnh+RsNdat+Ot267KOfvcCTY5FD58BrqNYps4xF
	fMPq+GwPyHsHMvk8zjRpIadznEWc2kf1Ouks6k/WLuSf1MqTQ7kAfXBR/TqXnDWA
	XFfui2RBUdWy4RMfS2HWVK7vIbeFN7XGFRtZVIUie1Lc/fCuaTzwH1tRkNsISvJO
	oWHgXY4WhD/Bam7bD3Ydvtu3A5JeYLRWemw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j0c1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 09:46:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e19c8558so451679785a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 01:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764409576; x=1765014376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cv+2iS7qHjsBq/waCdbpd8WWRy6Fwb6PhkS0TY3pF6g=;
        b=MvIvx/9WmpPqeM7vdxGABt8R0KGt6d1XyegDVz3bbDR2Qts0mIhRx3xdnZMPzBi/LN
         dM4wGK3zuCyGxEU+U3o0u6pcO0NdyIOsUfQgJpGyaoLnpaIxxdthQdmnSWmncfbeDO9V
         h2Dlj14bSNsbn6YtMWxtkSn5eO/oR7GnFLdkKa4kGk4OiXkIlYA3nDjcyI+x6mnulrJT
         firJG8RJ0OMZXi96Ujd65Sw7hfwdbqG2hecsVQDhglKGpld0KFuUFbwdHDcw8d9XK/mo
         9eMb3RTboGcYnhK4k/KRLHJKEKTzNzUodX27DvZ9bXh7xQ41KgL25u6nYFCyByXlq5C6
         8zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764409576; x=1765014376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv+2iS7qHjsBq/waCdbpd8WWRy6Fwb6PhkS0TY3pF6g=;
        b=NRzXz8MkOoFBHwtqVImYRuD/rqwTxwhkniZ62jWabIuvM4zqM8tX/OeZONacfA5rvX
         FQOg/e0eG/rSoK/YJVJnidso7byayYU6zhjEHHZfKRsXxM0D8pKXd8YNsc9ToaMZ3N2o
         iK9ozKgGG8NfpkbiXrY6e0GfniZCyiX93FESJ4MZ+kIIRHilhimiTjZA3M1NyLVkqwnS
         YW8BhHf1U7rM0rLGq2V4U2AtUL9WW9sIUEDyMvMZ3ZSrLbITJ390pL8+ynmbt6v6poJU
         I5bqpETTd7LXB2BWZch3gOS6E6PM6zfM1q+6iHqaq148DKi6OhkXLbtO07SzLU5Y2F6a
         TjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGFDpOkTTmqpCJKMgD9Xnb97IQyPm4vq/wM7c754qr907RzO00S1Ysmwb1gd5xUqnLax4HeYcV+MC0sSOn@vger.kernel.org
X-Gm-Message-State: AOJu0YygnAs3gKqrsfrp560Y90MkxBQGRgTysRFFALXBO5pnZmQggjSc
	MNTRGrh/vsxuwTdIWhGYqHd4YnzLyGpKRngjFxuQjv5llMhAUJYAt865ZcI41OTbPpk3HKwBDdj
	Mit1PvKo26vmzJdIQFI3KXUxAHGw5/VojyELmn9UOxfiEf1/iQQcojddfHM633oYhFD5O
X-Gm-Gg: ASbGncteyoluxrXh5sILPgGxVOLkEdoxJ1XRBB0qVCDedhlkpXgh9QofWNLG17lWjso
	0F67VBCnLDgjRKjm3vNaV/0P3kC2wl/MEpDfQH1jbean7xs98Zs+0he2ShDpoxg066TfS4jKpqQ
	jDQ9kWQMZzUKaYAB/7inJcJebW7ZSETM0LyZdLLWmQz6JZ1PT7rD5yKItaTAtKu5zSTmR/2AFE0
	V4G7Po7rai4bhdt5/Ti+vU498xOLYUwp+p+j3/BNCjlEIWzYWlL01Bjg+kr79Vly70WMKvPyyrv
	c+OQ8vkwfsCntNKw1/Z7tVgt5VRQ9pixckKYKeKR4yDLuUw7t7Rlha2FFjnZGax/56TrDnghPCm
	zBc7DQgQPjUXCuhjB3wfMgYFbwGng
X-Received: by 2002:a05:620a:1729:b0:8b3:3879:7dfb with SMTP id af79cd13be357-8b33d269d2bmr4024110685a.49.1764409576174;
        Sat, 29 Nov 2025 01:46:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbxU4P0DNxzVjULeiiVXoLtq1gZ/snvDZrCOwLHi9IB7JWNikxZfAdBZHFLnzoOJ36FCvvxg==
X-Received: by 2002:a05:620a:1729:b0:8b3:3879:7dfb with SMTP id af79cd13be357-8b33d269d2bmr4024109185a.49.1764409575696;
        Sat, 29 Nov 2025 01:46:15 -0800 (PST)
Received: from kuoka.. ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d5dsm6430966a12.12.2025.11.29.01.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:46:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom,sa8775p-rpmh: Fix incorrectly added reg and clocks
Date: Sat, 29 Nov 2025 10:46:13 +0100
Message-ID: <20251129094612.16838-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: geMqP9M5SPFrIm3dP-WSVK5heXC_h3yk
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692ac0e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gkUskBmUj5qaP5BcApMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: geMqP9M5SPFrIm3dP-WSVK5heXC_h3yk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDA3NiBTYWx0ZWRfX4/nSFCDd2TYV
 hegA89ViRFmGBtb2oKBn9Iq52+h6dV49xSNccChOLGQw7DmcNyciGRhxMwF4iFxN+Bspg9mnyla
 zPnH+8L3Rbvsb0P2jABPWPYRUFWLpDI8ncIu0RhInxaEFw4obnZf4vZsIICyYwaixVdLqBKUP3W
 2Ub0/9LNWR0Y0C2tewjUP+itBBaRNxnTKdFjmH2sSwoOk+oNM9P09FkF3h4HSZLETpbnwLW0eSd
 ReUPE8z33LFk1aD943loPtIw5Ndx/NEdjfwfuH7iPGVXaKeU1GBSnBxKPmH60EGfDt/vnZMpLOL
 hWCJmIr6MimNyRbDogB5MaZxd7UlNGoGJaeaGx+0+7XwbeJfplHr2LFYoTD7lfjLxCGaBa+NcMI
 wqOi0FtoULyK9wXNteEi1N2CsLBUFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290076

Commit 8a55fbe4c94d ("dt-bindings: interconnect: add reg and clocks
properties to enable QoS on sa8775p") claims that all interconnects have
clocks and MMIO address space, but that is just not true.  Only few
have.  Bindings should restrict properties and should not allow
specifying non-existing hardware description, so fix missing constraints
for 'reg' and 'clocks'.

Fixes: 8a55fbe4c94d ("dt-bindings: interconnect: add reg and clocks properties to enable QoS on sa8775p")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interconnect/qcom,sa8775p-rpmh.yaml       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
index 71428d2cce18..3dbe83e2de3d 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
@@ -74,6 +74,37 @@ allOf:
             - description: aggre UFS CARD AXI clock
             - description: RPMH CC IPA clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-config-noc
+              - qcom,sa8775p-dc-noc
+              - qcom,sa8775p-gem-noc
+              - qcom,sa8775p-gpdsp-anoc
+              - qcom,sa8775p-lpass-ag-noc
+              - qcom,sa8775p-mmss-noc
+              - qcom,sa8775p-nspa-noc
+              - qcom,sa8775p-nspb-noc
+              - qcom,sa8775p-pcie-anoc
+              - qcom,sa8775p-system-noc
+    then:
+      properties:
+        clocks: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-clk-virt
+              - qcom,sa8775p-mc-virt
+    then:
+      properties:
+        reg: false
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.48.1


