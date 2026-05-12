Return-Path: <linux-arm-msm+bounces-107164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JenDG1+A2pV6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:24:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C364F5289E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5722630E034F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC6C37F744;
	Tue, 12 May 2026 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJakw1D6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsNdG6Iy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0F36F8EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613728; cv=none; b=To7iB62iSE1gwCImGquiETwwyE2LWO+TNaLNaM9cj1VQ0cA6QxwTK9aRxGj4YXgd49jVc0J2/RbE4rA3PA6GGCt9zAQ77Q4qnokKpw/n5mK5HtXfOeRAsB6hDRjrgdaKwT4Fb4i3vpDkcjDVinek1NaQN3NBrKQVtqM/+WDc+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613728; c=relaxed/simple;
	bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Am7E0svQzQuUgVbdCF/XJux4H1WbQOoKVN92gnjOTlQcvmjefOWwxQxOVX9gse2Q3y5x/AxzGAw7e9aVF5MaSWwOpRQnHitTvojcHhG/qs0fkAiGR6MCcEr1nxqBfyKmnFcxpOB/St4G+L34uYjXybUk+Qi3wKnIEbrag6u/NRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJakw1D6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsNdG6Iy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLXmE3422497
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=; b=mJakw1D6cVqieOmn
	f10Zv4ujgl/+bv8kijme+B507ip9cG5AQPru7SOfLm5m1mCzkjPRn/Zb9GskcdXW
	H/xmhPBw1TJ/925r2vDYSj1si4leuJm5zSAElbXAnBqsSxK/lCLpzlWIyQfkmRjl
	3v+XgfDYF3m4SFkTQLbDdEHavpFc415EpCk3IRfpaCVaUR+U7Ottq2v90qtT5h+E
	5K7farLe5Z0XEh4OAo3EXQbhg/rxjWXqBCU0RyMtYyTaSbyV/26JxALHR6mjkpEd
	mBn2v/G/JRgRU2pitgagSaMIn7wg6cBw4o+m5Du9/q71FgTOwJpplMzqCLWIV//H
	ZVakRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9rycr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba718173d1so102990385ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613725; x=1779218525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=BsNdG6IycVybUCcNZj8FBoC+p26ip4tkxgKnztNUTT1zdN8O5iCOzbiU/Y0+ARb6cM
         BxR85F1vE9AIX6z+AgLywkDuzKBANLRH+ftZ6t9DbPzT8n9Tj/TACBORftfHW5ndktrJ
         OuqHtiP9vsLaNZE+9LFNSxmhyNSWY+FDXHFcfSR7czsJuGlDhyC0pIzbEt1KiBUgrtR0
         oJ08bp9Gn0wK+KDUpLwv9IPpEKDOWmYUnYFJcEEY9h8v29D47EajAIwGapuN6z8sBtni
         9Fq5b7qrqfMEnd+vZ+S60J58Wlojyn1nWWcdvxjCsF/HoqWQ2KR5ffzrZ0GMREzbwysi
         uGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613725; x=1779218525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6K3yheIQTvNblsixGApswikdFYlZRnnf5XfM5ye4b6k=;
        b=VFCb+mE3IVMcaU5BpHq2EbBskDZhT2bXy7ivMUd+UGB4vU0yOJCXpHO7IaV6+XHxOz
         OUMLuXz/iHM/DwNQtajcUkkybYfxc72Llo/ePf6sy44tQ0vAzaZKMoLARjCMknBshvOO
         ASXzU5YT98LRNkCVXNt6JS5syzwTKPEkrpDLOUI6ZGeV8WIz0uoELpMIW1E+G7CSnVVm
         8xwKo66gGZYK+Ayrl5i6Ib3BjZ06q4jnvmel6ZTcvmD1yX/JowRpf2j39yVi2/PMa5QT
         CqGBSEOiVUJewLmmlDJLSM6gzp96Py+q9TBXSX0mKM4jO1HC0KncJZ7o1MOzfKUgIaga
         wi0g==
X-Gm-Message-State: AOJu0YyIOy7LeKA2lLW6C7bd9XeNB2RpNXxXTaEwP+12+Dhkz1BeBmdF
	anMIOdjK06fr4NPq4HgoPXktz4LiMNUWR+FT1+1Rx6mi1Fk5V/48y5bAcrC4GAuRE4eja85T74Y
	XHcQr318JQ2hYOtg1Lo/VcRIwTlq6Ojs5YkeT6r5eXvhvcICf6UCT+8/aal9POyjFGJal
X-Gm-Gg: Acq92OHMFuBGKCiLGTzy53ASA7BDyQLL494QSMxxJUTUVFs6CUqAeCJGvr3js9iv+oz
	4qI4Ilo1xF3LVtAajtJR9QjtDbUANUfbF7U+TUxTwzDWjlIobsPc2TO8Zy/kcp7wNu8q/amdD0U
	+CSd4zt29Mk/38DJ6tU7jG+BrVGNz91UV0Yg8Vm5a1caM1kTqnNmIL6cJycbeCoKIY5iRP6MSG8
	644/nQ0k8WWPoeM3lhM0c9ziCPlGmM+6M434jNuSZ+wANO3+OAE0cSq8Ko7Vs96o4hRs77KG/Km
	XYg8DyQTjsNiQPt8ljP1Uxjvbo/SowVJ/gNdWrTaAqfAxUvVU8j53KL/wFkweHc1KKPDZCH3lzN
	lZ2vbxMMQD7tNA6ZaSMyMUOMmCc4WVAofXNFxRLxJYHMq6g==
X-Received: by 2002:a17:902:70c8:b0:2ba:df8c:11d3 with SMTP id d9443c01a7336-2bd275d00a3mr2773375ad.32.1778613725303;
        Tue, 12 May 2026 12:22:05 -0700 (PDT)
X-Received: by 2002:a17:902:70c8:b0:2ba:df8c:11d3 with SMTP id d9443c01a7336-2bd275d00a3mr2772965ad.32.1778613724679;
        Tue, 12 May 2026 12:22:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:19 +0530
Subject: [PATCH v4 2/6] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1607;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Mpr6Q33aJKvJH4hPu7N8/Msc5ivh6tKB28dTURNeqko=;
 b=Gx9R8cnM6dmWa7xP8HG35i9llcmnCvT54E/MmvyhWf9dgg+yrc2NmmfCLxs6WzuV6JSZJdKkD
 rwYBNyfDpaABoe22B55Lf5pwSwQzUZVwZXKhfFNU6SBGUwmDH0uqd6A
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX6gfEj5EIAMya
 eUtb6MF/qo7hkvRoBzuQO+J61MErtpLcIYDTJZ8noxP6s26EjMu7oWS7uGfCyl+8tqtDad4NwW8
 CFUhIHrn8G1Ve22uKGxVO5Ias/HDknU0ELBkjWKV1IvWtbSVsn+iW/YD5CT58YeOhDwJscQ9d5G
 X1nhR14WvJBWgj1w+mK3SI5sCWLzfZzWb0X2rrH7HVTfcVGyNbKzkTYqLFNLmJ4Oet494Ka47Xs
 k2iojcoeJzgjgL+Lc0db7dzXSTmSviTIL5M4WUoaBgbWOjIlUdSH40loGbBCazh6h/3yp9kPRt+
 sK/xbLxb7F6HhR+bLwFqzXSteWVMuR09l06n2kFQp7EdHf8WY8ToyhCKs9IgGGbw687OAAlJiY8
 SreviwCMbpYu5jeyCRbROMYIapwDDJ58eIHDYzZOLjMMdA/AtcP9+kBZ5ZG1tsybFIMO6qDnaBU
 /YCCWKXg1NageXDFuEQ==
X-Proofpoint-GUID: Tc7tPIvVXo8zvt5f9GfUoc12-UcXxBsr
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a037dde cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Tc7tPIvVXo8zvt5f9GfUoc12-UcXxBsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-Rspamd-Queue-Id: C364F5289E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107164-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..e67cd708dda2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,22 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-44070001
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+
   - if:
       properties:
         compatible:
@@ -434,6 +450,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0


