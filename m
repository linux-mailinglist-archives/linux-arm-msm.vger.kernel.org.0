Return-Path: <linux-arm-msm+bounces-82223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D2C68615
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE584346011
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2ED230FC2E;
	Tue, 18 Nov 2025 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="acW4vh2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlXhpO7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C430E0ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456036; cv=none; b=Z87Hz9G29zI1E8m/wAQi8Ux3FWv8Tcv9bpNLdnl0DzIc7SxxasuFHkczPpNJALLO3KJtvNC9XHss31+CiHCWFDEVSFlxqwFMwujsWmvexdWt6n+qIlUQp0LaT3qs6YR2Vq6e8sa037hR++b0ngR1Z3GfMPmUaaZirHAHcsGZkkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456036; c=relaxed/simple;
	bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2iQPftRQPJOXkGWWWC1+P/Dt4NZ6hyyuuzRo4KOQXQXUyW9M5v/v1Y3qDkmnYoVZo5em5dgGnFVJfXyDWBn9BrBMBTM+UZpI9RAS6e7O2ao7O6QSQnrs/q2GVShCe/wK5Ke22FWUHraUwNo1lz9HrD/VBH5HICZEpTuWF8vJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acW4vh2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlXhpO7q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6gALd2273510
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=; b=acW4vh2C0OBfNK+0
	49zxa4PHlVX/A2qjaLVG/Ltde/DKv2Q8gYXmRe9mSmhL0WU44TeCRR+t1HZ3dSPg
	goarJ/7XHxjsCkDNpR4SmgxNJQwfRey9hFcQDQYG36ZVeNWSjsS4nxCstUQGGx7g
	WD+MbDEcOsXqJ9PUZfbZC2orkJqCu1oyF3hDhP8+qy+ocrDF1zck813KYG3sTxOD
	yqB8MTSbwq/TYvVvePacP2UB1gHNek3BIpXm1o2dJdx0OtuX3Oa5Y6ACWSu+4RZA
	uDZztcrI2M+P8rojhfCjits1PxtYkU+qcJau3x4/m7VGHFlz9Jg9UIxFG+HH0lkM
	qTF1nA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgce5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29557f43d56so66004425ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456033; x=1764060833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=WlXhpO7qBArsXK6isnJHrMhPKvIyBISHDme9ZMriB4MI4Hh3X/Su34xrrlszb2Ng++
         TPOipAQd8Q4yEajSOxxCD1wPxF4tn2UvUmFrXAQBxCTWNe+7jWUCBXnbB0s0CTgS4zVN
         VhVJXPy0tf4TWzp4ZfTJREijMqJutbrGVGGl6vnZpr0YKH+gCViCnVVXR5lmT4CX4VSA
         j7iXE3dVKcUah0trtPe4WB8jaDF3v5vSq9GVw6TnDzkSK63sFeEB7cz27ZrrfsaiRMwW
         a1XFIi7k4XMpjiwAZzeHkMsojOSNRBOPOc1AyclwsfVe7vOddutvAt4Iapn+D8py4o0J
         opFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456033; x=1764060833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK80NgI1LQ+xDyFsHtTpc6wl2L9uxC1wWhpBghxroMY=;
        b=BvWu/OojCnwcEjobV/XxvmnLqTa7u5aAT3bNuaTF2yqi+MPOsu8wMFVzCRY7Czt4o/
         2w8Bdt8w2FsTczPctaCpgCwYouwgmb9YkO/Sx9oclVVZwla7nAwtPeIgFBwdp4RyDTTi
         zqtEe7iC+JEgGolgmiSvVdTNiq9VXK5ZltT8R28+i4A3JRnx/rJJpf8GUAYgr3fI2RBU
         E10sst1CvXM31DYNx8MwhElqCK3EnUCxb5pl+EuOzaPmC6YrmrN2OXovjBX8yfEnXR8N
         B5KUSA5F3YW10+0N5PZn1Zj6eOm2i1H9dc3frMvv2JBHD52V6Fy9ujShVWpy9GI0wzQ3
         ONAQ==
X-Gm-Message-State: AOJu0YzeQqhcUyo6Emq9UKBnRS2EGaPfwNIIgd7n5hZ1iXu1giUFKVvl
	vOWhbAhjPv+/+wzo2sWXpAz4PFOafsrhKkyHhS9TWrv7nUroXHkwQmsmb5Ic2apgBLUbjm68+ag
	I+vyKw7zCgTVjDKrwXxO8irNCgXCHSN/PTdzC8hyPfhFqfpKwHt0DpptXHeWpW6M1ro9J
X-Gm-Gg: ASbGncuUvHegbtrhDCNBTuZbRSjYv3ZCKr1JGbf6zR/ZUh9W7JeCASehvRKqeNU71+6
	mR7mPolzn47Wspk7Dmr8tyeqLZGdrGIg7almbyRvpU4IUbCfDW6G7kD2xdJ4alGyxBvQZgANZvC
	2oz1TgxzDrPOeuS5htto1Y6hPA0+CRMfmqDEbWOH2Egu1DZP9dtqjfYOGH90tnpsPG9+CK+HJ1g
	V3rvdqXhthQuawR2QdxgTZ6LdJTOfNSDwJstfFpV47pTGzpoKGNf7HCs2bLdSxcTGyN86xrex+9
	iYPifndAnmONKNdlcPTj50ZPkqKnPx0Mrq1xvur+jJ2v1LgAskj0cnaQaDvcjtBPnsal4aWumyy
	SlpUwn0gTQV+g3t+ixpBZoPM=
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id d9443c01a7336-2986a733373mr199740055ad.37.1763456032941;
        Tue, 18 Nov 2025 00:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAYYS70u+Ee2zagd/j5aTO/ulost5I9qswBrR/l8KD04TpBbwpgzQvRoU7wV90gj86EvfwBQ==
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id d9443c01a7336-2986a733373mr199739635ad.37.1763456032365;
        Tue, 18 Nov 2025 00:53:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:47 +0530
Subject: [PATCH v4 20/22] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-20-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1792;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NcxT59isJ8a73ABBo5632Wjovo4V8SjmsWcRhDa2gQw=;
 b=j7F8HzU/j38mbjoyk5aE6lcoDgwRxl8yKHoa/I9iVW6SXOUfEtgqkULnZ3q2RFEcVTcBHYZqN
 5H9tDBA4YdZBkuxB8GVxkab8xAf7MHBF8hHFiFj7sxlD9y89W4liF17
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXx8pqgji5yGA0
 b+mv3JdI1n5k7hXSKeNmnsAMRmqhkLPXOfEiKuXzoZdsll4OTR4geQbyV0rvjsf2T/IDDnLSd4D
 d9FZSro2JSEO7JjqoUJdseKgLvqUfXYhgw2kByO8+sFyH19jcrsmwn503pDFQdYX1jCt0iiDMuH
 3YSVw+A2h876igQYC1PsawByUYtNK4njy0cMUpD/XHZ1Ao1SJD9KaLWFJtqNO2wiX/LSt5TnXuE
 1OGoiv++LCoXBxcPKnXLSpmnvFYSc5+NN3IneZY3m09gCFRDdAsuYr+LyoQCor3JCHGqaD9+4hg
 4ofPYDyji4+hBwX29zPY7UvQDCBWp8exjncDPEolQx0PHzw+YmjJSexhsuH2EMzB4qYwZl+59CJ
 HAMx92GPCaYVNFSB09PmGl1X4BxakQ==
X-Proofpoint-ORIG-GUID: S1KWxX_8z7Z01gkfNTcoD3M1kGVdPPD2
X-Proofpoint-GUID: S1KWxX_8z7Z01gkfNTcoD3M1kGVdPPD2
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c3421 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e8idWDajkKX97RI96f4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

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


