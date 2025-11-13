Return-Path: <linux-arm-msm+bounces-81733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 508ECC5AA20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA5E8355E08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE77533D6C9;
	Thu, 13 Nov 2025 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4d0xxhx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFn8EGNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA432E68D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076731; cv=none; b=F4AcJbEtPKzpMmASOFHw0zvGfrai34NmFfntk9GooiQr0EJZSuyy9szKWaU+ZYAAEhhzwyLcmasAKFRuFadc0+Jzc8jTprY959REKmsEel8jrIMQ9G4XtlcRY5GQiAI22fP8GH0+upckvbdvGn+0EMg+5dIL+6npDeDsK1LBgcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076731; c=relaxed/simple;
	bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfRQvIbVNMPSMEPoKmcwXd0fHL+vb3fwZYiFAXyKs91TnYcCWbaw+7yOEfgUgpGww9TTFckxIzKbmPLTS8vIPd2bckVtcLF5Ut83J3zTVfKsyqEwlByBjbUUsKqhgfE5vhAwk+VYZs8q0X3XfogxjwPYglJ6U2ODaLpYRWGnaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4d0xxhx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFn8EGNb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb5ra1619395
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=a4d0xxhxjAelyvzC
	14qB1RZU5SzKhTR/+8uaIytjkRy615Ki7P82uR95s3soKwi8eYt4+fVbmC68iRZ1
	cbe/m4YgKDZ5Qr+q0IEYv0hqlcQu9CxDIb9C43JVtTCoaRId43Hisw5E0Q/n4KoN
	/EVgjaHKveYm7TrD2OA4QrJ61Gc2nG3OYuth7Zq6XZWaeHFImep4FTP3BYgGQL5k
	ALEDs0hgul8ieiSqAoIJFPE0N3Bm823Na8XfbUWBaZW9MNXm1/6gZLJhjaXo7NCK
	0+72Fh1qLvBCq/a70+gXsIdjmjsYEHHTPQfcd6B0klU/bo/daVsp9Rira1EA52W4
	9VeP+A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h046r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:32:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117fbda6eso1272645b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076728; x=1763681528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=MFn8EGNbvJDd/0IX+39dArpmmsFuZP6RyQnK+NDXs3Js5wH4+SNzylnYl2EIuFpgAH
         4S1DAcvsdQ0OPW732YcshlIniSjnVFf487h+3ljJ04pkIzywZpLUh27lF3eO7iBK2ISt
         NRb+y7s9FRUYjNxDm6w7Pl9iP1XH4If8U0UrpUDy8NjxA/f85TTWRyv83GBntIkPHizw
         QOjORRvZ9X3H2pxr1QUaRxCbW7TTg0uYmYmh3JkhUw6EaYMOA071unmnQVyHrqD1XWmL
         2/BBwsK7Yy6CAmjnW7FHtWsp8Je9p3cSrDwTR84hpR74EDO5uT9f9KgT16VLXWY8R+2J
         U1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076728; x=1763681528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=polzktK0px51fQqg6icRJ6f/ahJHl8tlxi9NYbh5+iwMFfIa3f+Yvkaulv03bWdrAo
         x+/G7mWGoq/Rai42aUM3mBlkh0ZACtUOR1Q6ulQU0syjrR0ES1ghVRUhPZoskf09mYDs
         MG0lRAlA34smip4IKLkhsTl6VezOqVftrkByEuUrRst09WNBt1Q2u9EtrsrFSaBhY6VI
         g/Q144gxwzLfJokDKcJQC+esGzR8Yhy7abtNx5RZ34uvgLZnnEivyB88PbETy5Yauyu+
         l7XhN6auYOCb47x4R4k/Ojgl9j4tM/0Lbnb4mrPIGm/DBinH4eh+m/iegv/gEcMMmgNh
         SSsw==
X-Gm-Message-State: AOJu0YwTcDha9R9s0OZj85KXmQA6EWFdSazroDbAbRQz5I7aPKfdo94j
	M6LFUtlAVB2GGzm1oolcojPwf61d5FEqShbD/4HJB4VidvRs/In98eg697BWgEMDLoh7iaMBYtf
	gzz2mR8XEXZX/RCK5lk9j9G0hqRgVuaUQmJ5s172Ac/m72tPvMoaJmwGjQosYW5a+GRDt
X-Gm-Gg: ASbGncv8W9z2AqH78oHm4EQBhvdReJHXS6x/ea7XiDOwUecsLlmptEZKJVtB9CY62bc
	LQUKYcL3l6nXlJY+w282Fq4swU6ZgjuMy6ZHMCR1XFZCognMj3NVT0Sc6ExdvOkFdlLy3GlGgP8
	ffbpplogp5SLSPh/ky3yi/3hkXX68zlAfupjspQoKWsgsLgnvN9CerYcw162eE/t+RFPVRQAeyJ
	UDk3961gyOzK4A/jvU7sNSkUTiRTmKZd/Af84QjSYj8K3zKRz8y4830D/3aDByLGXaVOUpIg8XK
	CNaxhMsu+umlUdliuhSwAOMVXIyRODHqnKXHv2pmMf6a8CUp3GGVdWOBGbjekVkZFlZtXUWxBSY
	EvEz9ZxKGHYspAgiygWAsR3k=
X-Received: by 2002:a05:6a20:6a05:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-35ba22a50b8mr1324544637.33.1763076728243;
        Thu, 13 Nov 2025 15:32:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6uREXH/Pc10p/MC0DwkzSPYkXnu24e85a2vO48Pf1B0J1ZDbHns3wpDriZyiRRICYi3KciA==
X-Received: by 2002:a05:6a20:6a05:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-35ba22a50b8mr1324510637.33.1763076727731;
        Thu, 13 Nov 2025 15:32:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:32:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:16 +0530
Subject: [PATCH v3 19/20] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-19-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=1I/n72yonmFfJu99nuC9pKcCGZtwySI6gaBDPVUw9OgLX+cy2aGKw/hC07Gf38Zy4Sr4ku1tk
 cZ+/e9WMsW/Bium1P82WjaCDgxrkdRPqz4svvg+Jow+9tYBM2ylPeAi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: t2WzeA-Qx_etDJ4heY6xTYcg5IVIbte7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX6PDtNWdyiDJ5
 YfoFNlAiKJqj7MxqHdCrENEM9yPPtzXH2j3SnMEj4moa1rxPbfQAZBTwvfntLEWJn8+D7uLFCzU
 7rlzMQqYW2l2QRgwNsrmIoLg7JvXfyBSjs3ADTzIVs8ZIAsJFC6Amv7gF4cF5aQzfJ65FySEpqV
 KjigGxbWBe5hMPlV+E/H4Lj+Oq2UnjIafj6e578fxAvxa0c7MQwkysPxxjvr/fjxkWwsbUOVzTk
 sLn/dU37mpGrBk7GizF2Ld61JlbQ4hfqruksAg7Js3aJNLZJYnmLxnXKNmCGUVxrP10qQ8poWsQ
 GiwfolBerLGe03ESmwdArZsaINCEcLKHMONquqiUiHjN6I782YHvZGc21rCA72hs+S/3ukOL5tU
 IbW4tUh9ED7jZ5i+0mphwCu8qgM9Hg==
X-Proofpoint-GUID: t2WzeA-Qx_etDJ4heY6xTYcg5IVIbte7
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69166a79 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

Document Adreno 840 GMU in the dt-binding specification.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc187935744..2ef8fd7e9f52 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[6-8][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
@@ -299,6 +299,34 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-840.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

-- 
2.51.0


