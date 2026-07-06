Return-Path: <linux-arm-msm+bounces-116966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OooQGa7eS2oVbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:58:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58E7139A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:58:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AmrSm8gl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dxcmgj8x;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116966-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116966-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE1BF30262B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFFA435AA4;
	Mon,  6 Jul 2026 16:56:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B2436BFA
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357018; cv=none; b=ujxGaZL4vbYJWjNT3Zf6qephFxJRMSgYKrqgbr2Og3XLC7PCUeUm6W0gHlz4tEENOeMPHBK0xgsgIjM9mspEtjJIuQROjUXnupG3kEd0zF5gcUURpdPKxUOTSycutWF4zuM2OxwXflwR+P3AKk6WFrYj3rJZ2euJqytUQFvoa+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357018; c=relaxed/simple;
	bh=G2Cd/UHUeBLQN2fTTAlASpH57IU25h8iXlFD+D/JrHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWUes5ocQwpLFhLGLGa/W+GjM5bN8r2YroAWnH9zHNa0cU9dYdZPu64LKpUW6vsVHmZpjMe4KKesBn4rn4TCjob1HRhg4AjI/900nxtjU0mJyGpbjHv0nm6oPZjbDwsdrqvpv8ldnwpbGwoJG8GxQhIIKcCJJauRXpfuhO5756I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmrSm8gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dxcmgj8x; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6uG832916
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=; b=AmrSm8glcCZwplQ2
	kXIAQik2uvZ8/h3mi703MpqxLdCkgdpqj1ps0GSiQyIGlGTn0ILnu18URKd/cjRN
	WhQZDRhT2cVSrva2EAxPk2xZP81Agj+1fimUphBuOFAiKoQnp01kDhjrOK46meEw
	S4dcBYQUWmfSSaFR/m4dcpcv8XF2EnRsqSaG4utXvWnk4IlsBEEabnY91FaI61rJ
	qUzixP3cwI4PFsj5kjjunutZP/QojESs6+VU5mT+bfeQtciFL7utXbucj7TSXDPZ
	9n3eB0rgxHhTl+tF+I7xnbUrC69sNC9h0fQdsxDZGShXeEPU+OevA5uFf9R4QleN
	BuJ0Gg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98hvsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:56:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso5168532a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357013; x=1783961813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=;
        b=Dxcmgj8x5W9BqCwYc+iPlQgVUaM6v5IozHe5T1bPL0BQG8P/IPoF/6vj8SqYLJ22zI
         3PzpynLCKpSWHmcMx/pXe32W6SkYh9a8n3XPYuMwjdvHPLFu9F5zPfyNDZd2XXltwqfj
         JOfEFFQBRh2kz40Uv46xbGruyzXKTG5T7QqEr2K8qWXA8BCP/KB7B+18vROsnwZbiKwJ
         gp75ShQIu8QcThoO5hL101TjPB+znNQbSkhccITjgAnSLlQxFYurqo81qkSo2YJf9/Ql
         Z4YT6eSk6AkjSPvl3UVxz/d3fc88qWsJYTiGwrHBNehjkzQVo7yeX3ksitWQhpKdzXAg
         bO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357013; x=1783961813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=;
        b=Lr9GXuZ4J3tdIfixQM19yOkidYGbVU1UmacReczVMgTgaqvILZRlLs6NGFFnnqGD+J
         qOQwNVkLiOh3MQQfBazGuaXoktlmIV4m05Vo5KZYco9QEld6Al6l1lp+KpMH1+XBIVAA
         nqdu/WCsH1I8JbIRieIKigqDMAAmLqIMULH0SKgFPK7qxYQtc/Ph3X/5W7mOeDQvakT+
         wGjQuzv+J75WmDgVsBQyz6EdhjrsTjRIDuamlxYOACSAUbzsctokjgg4CPgLHwgC0TCu
         Vn5xMcCyVOFn2K41i+mC2MCn5WCefnRxVA57PkZZnQ/PXSvEpGcA1hkT84bXvGEVop4D
         oCkA==
X-Forwarded-Encrypted: i=1; AHgh+RqYxLrO0lW8em5+WUCrXR9B+G3ePnbCEUfzB598u1WWekhaSJcrqxm8fCkECK7GXN76Oev7BpfEPR+craZ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw65R+/X88akn7qDcwnnHWDBY+rwS5UWBeNDJMrzKj48DI/d5D0
	Aic3RGYWqlx7JHO2tTn0GKewa+12ueS0cC+t7jKhekB3Xs+LBk0MNndw3ZWU7KOVM4RoumRLNIH
	Nq4zFbYvH5OKgFZuo8MKR1qA7Z80ySN1L7SjWMZLUHuLdqztlyZh2FUBTXAS0vtPlLPq5
X-Gm-Gg: AfdE7ckFHB1l/IeOLtPWpfIBXhZ2mbvVBn0RhanTkN+rBivgrkppE3NaarqkHCrwneP
	PidyreNZtk8zvgfcO7qrZ/Xlzn5jMM/NmBWVtbi3JUtQVA6Ks2v4gPkLocXneC1Q5liAKL98CsO
	KyD/Y69bGJm6iaB3oH3IFgC5wL6HI3oIJ6/wbdOIArsXbLIjfRHPwlyyTfnjturhsVYiVhDlk46
	iwB3AZmxX87h0o2xhfGm6lk492BZRrgsW8eQM90/GBNynElQjZOY0hR+t6JRqXjn0fHf8HGJaoX
	z6isjhLMOj20jROa+uenqUVR3X0q//SmLA2gSSQ4NGS6hpkW8S3wXhQeHH3epmhayK1WSqDgYuX
	CPHW+EPm1FIMpfr4KghL0SaSzoaFgUD5JiPWkbMohhg==
X-Received: by 2002:a05:6a21:9206:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c08f00256bmr1778672637.59.1783357013400;
        Mon, 06 Jul 2026 09:56:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c08f00256bmr1778641637.59.1783357012962;
        Mon, 06 Jul 2026 09:56:52 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:52 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:34 +0530
Subject: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1911;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=G2Cd/UHUeBLQN2fTTAlASpH57IU25h8iXlFD+D/JrHk=;
 b=E3aaeHiOrUd5FHK/d5Be0RRksYkwbu7lJwMG6vthS+PW3jji0kN6C6H0hq9Gx21ucOO1ddRs4
 U/2VitKxsIsDyjaUbkpDSupX0WqV+pJUrxlFbLlgxX6WmpHhkLtmKX0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bde56 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX3HY/fCiGtlaD
 Hmp6YPxqP9IE5TIhNXNoLuMW+wyUKD8QbuA6C4J8Y99X6AJ19H3TWH7WCAZRm+JwfMw2zGWV7yw
 PpU1YQFfltNg6Pk1K7o9T9MylsFhx4mj6WTukXqgBT7HD9fb8CSfzc5fvSWsJ5CpUaI6Rg8BF1K
 /cBcEUwPi+Hvr6/lVWo+MpOVM0RUN6MYF6dtjR3NIw3SX9z8sEawK5T19swiyniY40sNJZjIes0
 0sI+KpgUoxxkbF5ZC6eqq0wi2ZIqk8jLPmAkoMEz2Jd7Kf1zuKok0Uau0j8Id9gfn1e6nB967vV
 Pol5j0vFi8PjjdWHSc+VEl0/a0oVOuxYWK0FWt+A6UTwZsYIkTqY2zcRYlML03+vJUzh+aiC/Kp
 kYZMmpubtYiBwOQS504zoLkoQX+NoGX6wR8PPQAPquAQs6uPWr/jiNPFkU++8pyOucAbeQHbYyw
 PQpLYiVGCHA6Xg+aquQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX5bP7cRvyBZdp
 JlPbbufGApfd6W7KcTTD5AY0325ler9wXXyqqR+nqRvLthC9Aoa4T7IbSkziMOqiSJ3b0rSEk1A
 0TP73rplQZcmLsB7jnfXq8YO2W7Swio=
X-Proofpoint-GUID: ez4-cvbR3XGJqRSTIXqDl1Q_I4IUhTcq
X-Proofpoint-ORIG-GUID: ez4-cvbR3XGJqRSTIXqDl1Q_I4IUhTcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116966-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF58E7139A2

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..fab8944d7b63 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -246,6 +246,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -644,6 +651,26 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sc7280-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1


