Return-Path: <linux-arm-msm+bounces-113759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f1zZBg/YM2qnHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:35:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC869FC77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:35:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q077ZOca;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=frz1cNpH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93F07300E334
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375BD3998B4;
	Thu, 18 Jun 2026 11:35:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43333C414F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782532; cv=none; b=flHFyfPqwBZ64GDeMt0p11Cv2o9FnkSMtzG8LAEOa5xJ0pu3B3mxVrHrzKOgd7ubBeZk7kYm5tR/jxkW1SYQaWkw/R3xyJnvX2dNoW/65aM1yaWC6oQ7YGETb7PJzyeR3x6324PJXPlMaldiC9Hi5tXD8gLJlsklr8KBDKtBIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782532; c=relaxed/simple;
	bh=iRtdvRTDQSfdyEQ1b2qU5Q6iD9i2989RKufwXpCNRqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0RFc+X+BgOHKAFtezQQqKdPAssT21fQ1pfCTZlicT8+FOGlQCCmU3/m10U36q61DRPFrtZLEBTnVv6TxzG1SB9GsM9CNpxx2/YlxZPw8AD58EGymP9tFirRF+lQqaGS5VvN52Tsujcg/lLAuxP3u9pZMagkvjq4bVAJ1CBljfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q077ZOca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frz1cNpH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAs2hU937500
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LiOrWOZcYYg
	JyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=; b=Q077ZOcav2PPM0hXuwhBfXYt8nQ
	z7eEWw/LAFmplWbLmjnWVrlr1ylG2/8e0GyIpOsSMOVakpJTxkx/IqRIIjBxHqlT
	RyviRx7KXJN7Z9VLK+NJZJWl/IBzCmJi78LjI+2mEDCJy3yJhzTa4MzGptMsmJdj
	hIMV3Oy3WcevZaw55vr3DLy+yfd9IW7yHFGDP6UhBr/AX9XA4R0pFyB69qOXeUxB
	jrYPZc1kh/5FJhXiyGaFnstKzmY385C3BKfjUVE33Jh9YVuwBxGHiBQk0Jw1vVSi
	VmwoL1pI7sw0USmKhitgDo5W/DcMrXDSk/IuYzkGjCTzHoBQcA90foOIQOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt541ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:35:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c6cc4e179so1049831a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782529; x=1782387329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiOrWOZcYYgJyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=;
        b=frz1cNpHjjhDbFEtzB1EADcPOxVNQ6Oymg5VOS8VFD7fXi4kKNeC8/2bzQk2X8DPce
         zqPFjUVuerlCoRi+ZuCQOFTOee0ZxJwboEH3wcDk7Fykyf3ZRop7JmAe9grSIlgZeNsk
         3iXkoFB7HIJF9aHQFPUPbY3m4N9wnx07tMa5JjohX77iOyPWuPMtB30sksCmsnVYYc5L
         q4KCEsbwlOR/e75L2lck7JBJCBII46W+NBG1vGdIcYm8TjG00FS+ZDM1X4HZBBFeAm6n
         R/wN+ekwdiAN6597ePnjMZipNn2gFNkAat9jbg3U6iT2O3/26220v3hnWi4xH1WHACIC
         TFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782529; x=1782387329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiOrWOZcYYgJyOgM9hIn/xfWjfsbdg8NMESze/VVPSA=;
        b=b0hTC1ydCc7IWTbURrKQqvd0KlVXqu+6OTpKwSiQ19M+7ocsy2Oa3Yc0EWIhErePb6
         DOe8noNEtGZunJu43cIrxrjQUs8C4PHnyZgmHpYvBGH4lJLn/0D+AKR8zmILl//1W03s
         7a3UvURgYyfCM2Sy+lEs+Iiq9c6hHKuIinbMbacHIIdqb/BQg4oNtzXCRMm3OaafK9rK
         D7p6vXXvnGYhCLgfsJCd2etOoda7HWV34fb8RPF9VF1+FoNcD5q9z9r5tI1yHbvOLRTK
         Scz8UZQsiJe4hGY1+yagvE2+e5lZLotmWErnUz/sozkU9PfXuq6eEoE5nDS6AGTgH60r
         5BMA==
X-Gm-Message-State: AOJu0YyO0Wbxk3/0Y4XBldocRd7nwrr+tk5hFIgC1dlP3snYh+Dna4ey
	DZLhEGf1MyxCej6rd9aI2UmKVG3KAOyP2fRDcXXZDVm/e1nPJuteCNboQCUrDv+Km5sWKNlwqj/
	EECkMkOOtVoyJmJDapytHQVTfqkxM1caL4sBDjtA4J+2lYbFYCMYmQPWJqXxGIP4Z5fjj
X-Gm-Gg: AfdE7cmgDGWdncps9LpeEvvQGn0zp8ru8pUU7ilzgWCGwx+zrasXO/o8CQCR6VNR4dv
	7hI/J0+PdDxG2Iw9/EHDQGI3wpi0lHN6I6n+W7hBE4cKqjbYScyRHhuZTQjH2dmb03vok8Np67M
	NFGvMhK24HdoKHN7xGCVdbYfC6nh757KCoEoJ5Gac84Td9IRRQm6Kx5leOdjddk1In8LxCN/2ve
	kZU4mmeEfZNvRB0Cgzut2tdZqsXGl+eoVoZF6MiyHX3P1Wrme5U3VHfWS5MM1cZgK2EC8f4gDLB
	7K5NFW4vac6GH9AEAOsjyUPQoLbwRMynFntIvegAlQvZI8v0r/8aDoIgn5CAABUy9pQXbs9NDNP
	TnIiQtcnQ/JBCah16mmu/AtxDtuecbq+QP6Vr+3o=
X-Received: by 2002:a17:90b:390f:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37c936a1d28mr8713794a91.3.1781782529356;
        Thu, 18 Jun 2026 04:35:29 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37c936a1d28mr8713756a91.3.1781782528920;
        Thu, 18 Jun 2026 04:35:28 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:28 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: sound: qcom,q6apm-dai: add memory-region property
Date: Thu, 18 Jun 2026 17:05:08 +0530
Message-Id: <20260618113509.2025881-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ypjS6HiOUBVKJOEfjtZiobv127x-81Uc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX19IiOy7qDRRr
 6pfGfjWmATpYGKyvqtES3Nv4W0IkpfvZ4uvGFtCdEWMfXzFdQWJNWCoguBep50PPWyY+62kKYd2
 fVxRSCmOwO5UTUcvUqr54MRx6fH+XRs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX1ObhDItcXekj
 J7OTlR6iI5Uabc1z58Yq3hWq+X7klI+A+9huZvzZ639vbxcI69SChNt1HKJZcLH1rRNiPpwDM8c
 bwi+S+fpJ2Hr7ki8YRsdx1IuCG9QYzmimW0bW1lgWsx/YpLOTas3Gu2bl4bGBviwHTBT8PE34Dm
 swkahDEFE3iwcA82rZ4uYnbgJFZQbOEtKLP2Ie/mLP2C5cv8ZGuS0/NwVxL8jMvgTVIdw5ORW+N
 jPPaG0UbUHMgEnv38Kh3GCezc5659EknRZb5EVSwWezHODK7JDZXX9in/OZC5bAmGgZypuXRGon
 PjQpTt6FyO9s4s+NgpwgPH/vbrya2CzBTAuUohG5Ao7EST3e6MXUeiMfptwJS7L3cESECLShG06
 MOaJx7tbDzpX1yrD3i2D1k8X2BnyYCMiWRGaI9M/GFIQzR73z2nMZuE/P916RnlR5H83bVO9em6
 hlXU3ya0cQr3Y3jWA8g==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33d802 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PVp8ma6cCIai9-343ekA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ypjS6HiOUBVKJOEfjtZiobv127x-81Uc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113759-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17AC869FC77

Document the new memory-region property that allows one or more
reserved-memory carveout regions to be SCM-assigned to the VMIDs
listed in qcom,vmid.

- Add memory-region as an optional phandle-array (1-8 entries).
  Each entry must point to a shared-dma-pool, no-map reserved-memory
  node. Index 0 is the control-path buffer; subsequent entries are
  data-path buffers.
- Enforce via dependentRequired that memory-region is only valid
  when qcom,vmid is also present.
- Expand qcom,vmid description to mention carveout regions and the
  qcom_scm_is_available() probe-defer requirement.
- Add a second example showing both properties in use with two
  carveout regions and two destination VMIDs.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index b767625985a7..601055182da6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -10,7 +10,11 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APM DAIs in DSP
+  This binding describes the Qualcomm APM DAIs in DSP.
+  When qcom,vmid is present, the driver performs SCM memory
+  assignment for PCM DMA buffers and any reserved-memory regions
+  listed in memory-region, granting the specified VMIDs RW access
+  while retaining HLOS as a co-owner.
 
 properties:
   compatible:
@@ -20,9 +24,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    description:
+      List of phandles to reserved-memory regions (shared-dma-pool,
+      no-map) that must be SCM-assigned to the VMIDs in qcom,vmid.
+      The first entry is the control-path buffer; subsequent entries
+      are data-path buffers. Only meaningful when qcom,vmid is present.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
+    minItems: 1
+    maxItems: 8
+
   qcom,vmid:
-    description: Optional list of destination VMIDs to share PCM DMA buffers with.
-      HLOS retains RW access as source owner and must not be listed.
+    description:
+      Optional list of destination VMIDs to grant RW access to PCM DMA
+      buffers and any memory-region carveouts. HLOS retains RW access
+      as source owner and must not be listed. When present,
+      qcom_scm_is_available() must return true at probe time.
     $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       minimum: 1
@@ -34,6 +53,10 @@ required:
   - compatible
   - iommus
 
+dependentRequired:
+  memory-region:
+    - qcom,vmid
+
 additionalProperties: false
 
 examples:
@@ -42,3 +65,12 @@ examples:
         compatible = "qcom,q6apm-dais";
         iommus = <&apps_smmu 0x1801 0x0>;
     };
+  - |
+    #include <dt-bindings/firmware/qcom,scm.h>
+    dais {
+        compatible = "qcom,q6apm-dais";
+        iommus = <&apps_smmu 0x0c01 0x0>;
+        /* index 0: control path, index 1: data path */
+        memory-region = <&audio_heap_mem &audio_mdsp_carveout_mem>;
+        qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_LPASS>;
+    };
-- 
2.34.1


