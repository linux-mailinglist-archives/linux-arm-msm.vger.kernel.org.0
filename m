Return-Path: <linux-arm-msm+bounces-105538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLg3OWnf9Gn8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:14:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6334AE6D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84D99301D3A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7C23EB808;
	Fri,  1 May 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsAT2e0a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjRm9W2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8653F20F0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655470; cv=none; b=qB4bv8Mr/Zy8HdO3JYdj2cTqEB0Txi/Jd3xeJ9G7y9+iEhJ+dd/AzQ+ytBFCj4P5aiSM1zoxW3qZZ2PYLvsWM3FiJ4E3crkhHnzpcWpUH09KyvusVNhj7LVLJfylPCU4Zk14/uPDH1/Squo5cnavBK2F/lJ00g9a2zLt87iZmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655470; c=relaxed/simple;
	bh=AJlLPOqIput4lZvz7Qw7pxDO1mYbGZ42K21QV1AC8DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmF9xX3sb8RK1OWeaqFxbK5fAa54fAql0xOcXcTbHZW/HWi2STCTumdnuwWfdZjL6GTeqojS3KgVT02XbSzciX39AMuK2Y7RXqh5WUV76aXQt1Ykio/SjhJTL5K1BmNSjK5vBHRNcud2rZXDZ0JJFRJpbyrKuPHG7b570b5/Qn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsAT2e0a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjRm9W2h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLnsY1754668
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvactydo9LBndlL4M8ALZ02yKT1EFcq++vAUvHqcA6M=; b=DsAT2e0aWUQX4dql
	3CLFX31JDIo9f38d3NbN8QtRZOyr00CBqT232plbrBEKkRaABib/K/mVuK2cfUIj
	uTqAVv0PmjiMhoeUh2MCnrS2mpzE/PgTDtKEWc9cpsBGlb80G3YLkK+GjkO2U0gp
	wWLaivnH3d3+G/P7cO67JCBhWQo4lWRSSy90iMJfrvubdxZodX8gzPIUj+PBV1aB
	rLzfXiJIcIh4YN/hdDbdmYkY3YvMTDQYIvuxk1IMYEX6Ygnys92zj6YCSkvsI7NZ
	AK0jqPt2LvlJkdl7pAZJobW8Zds3WzbYbe9LoCERfyitkMxGycoL2bZawccQTfIu
	Lg4wrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvyde87u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:11:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70dd30025fso2840766a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655468; x=1778260268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvactydo9LBndlL4M8ALZ02yKT1EFcq++vAUvHqcA6M=;
        b=MjRm9W2hYX41Vpcs9IR6PPNXcGkYDI2FS8hZ0MBnDtH7LJ9IFceYKSwZrqOFeXMB3i
         M+kpMtRtMaWTmksGm7cLHBhzcAPCL8oY8E54R/bskpW8c33kR0dVNUUAag4ldU2UJK2s
         2l0Jobn3Q+fkwJV0FGP1jkK4N6up2KNMhP1dX7COSmz/kNBG/7CqiMY7zX1hBcblF+am
         tG7fiYjcIhxkiuHDbaDWPcVyjnJklin/tfKLKI8i5FkV5tP62hQttxiT5YFuJX1HmSN+
         6GuVs3hQ2y4o5TTZnRvGDWaUxM5o0iae7ijlh9GMCON/ShjgR/gg2MJE0PAxq4xlASQN
         yCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655468; x=1778260268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qvactydo9LBndlL4M8ALZ02yKT1EFcq++vAUvHqcA6M=;
        b=JFU6NFF4qK1HSyzjt8BvpKRWNGRpHIHTDKylHNUl8ks5bDDao4/vepdRIcA7t2BIQu
         5Wt1r3UkR4BH8jEUgWsgR9tK72Eeq8jpY3LauDTZrHagGFBCvlC/srvUUzJF6/grdLdi
         30ZgxXv1MJjY8fcJIUIyugLmf4kiFRyZMocutTsYoi1RJK4q4GCMIFezGjJLjRP2weid
         zvc0/iUVWxc+KrqY/xrHulb7jNwSOhtmQ9tG2xoRSfnU3dpsvcMfVzqZKHPu+ZvMmwwS
         t3rrYItUkXixes1iMdSVvJXnoBT207i/6XrLhyNeE2UhJIrWnRJnYL0YE4DACfxMMiHc
         6fAA==
X-Gm-Message-State: AOJu0YxiJ58gc2fBQ9vIgq+5dDttGp+DXHopUVBM3J8MqKqne7UbqGjS
	1KZ+Gdgr6cAm5crBE7wLEoiKwaWjcSXeoXkFAL18lWgurfkIQ7y158ONgua3YD1hMwFB/wcQG/m
	cCrb3JrzBOqqvvxOtnklth3UMo/6Brnw33ofV4mGu7xF+AfKqHbKckz8kQ5HY3lcz1T64
X-Gm-Gg: AeBDieumqiKkWFBuWN/yLtpY3YNTJCGy3cZ7RmjJHmpc9/ngrf4GHjKsg79tqHX0r6/
	Xw24c+Z7OJ2iy++31PSCuFGn199ngWC6pQJtDD+9Xri1/90HtNC7qsbyLimSTZoNywdA/vPeuha
	FuTHFDbY4qdOC/VO0bB4sW6jwcq4QTx10TwhpsK5a5oVjkoby1YRzbBJ8bSwxIBfgAuc3EIpn8I
	HlyA1szWN/1IOJihtRwMD4pYu8Ox4jMfB5yWYPplPSVehHhVy2Z5jXTkFxMuommVqeXkyV+wqDm
	AGGqxak4JhiL1vKio+fdDbAzRqfc7iOk04/rzNK1O8nmZrdUFdnKQbEJUCLbLS0w+Gv6wIrI//Y
	ybDSsYIZOU/dhJsF2mlpBeflR1avwdCkux9iQu1qnwt921BdRWrOR0fxu
X-Received: by 2002:a05:6a00:a10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-8352d1fa3f0mr86201b3a.29.1777655468143;
        Fri, 01 May 2026 10:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-8352d1fa3f0mr86172b3a.29.1777655467620;
        Fri, 01 May 2026 10:11:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm3099323b3a.13.2026.05.01.10.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:11:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 01 May 2026 22:40:38 +0530
Subject: [PATCH v2 2/4] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-glymur-gpu-dt-v2-2-2f128b5596bb@oss.qualcomm.com>
References: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
In-Reply-To: <20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777655447; l=1314;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AJlLPOqIput4lZvz7Qw7pxDO1mYbGZ42K21QV1AC8DA=;
 b=RQBbUHg7ynwcZIYGXJfF5UjeI27Y9iCGT60Yo3GTy0d0b8UlsVvDPNbblzrR8sySspG5ewvHE
 /W0QN6tlcmmBOI/mEoHoI7ooCg9EDOnjjkJ7y3pda4rg/Tt+k1Tgn5e
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ztxy0QEhJGxAy69_6MZlpZjJibZ0bbLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OSBTYWx0ZWRfX35d5DwlrvMIc
 nmyHc3L/UjFqVRU8B1HMBVOPYx0/wXCHtN/JZaYkvJB92Y845+pOkETaLcYV5Wgag1PtYMZO82y
 wdFlo6prtxL4J0+UNT0FRzchkZLVauX5NXj0r7WqWYaLatB3A3kBdlHBfMTh4tcPoN3AFlwOhCH
 X1U9Zc+2SpQO8hcWBaT49Io3n9Qqyj7C+1m2QvhMc5qjVn2p7lk2+QP2oIaEYlxRT3obMY1znIm
 JagWwj3vY228mwLrltJ0Fo2VKrDCNd62WagoWXz5yTxIMb3r+GlZJyrpWiP3k0Nk59hSi7F2/DI
 VJPQ5YwfwyAtMBAxTnezOwpclefQVsLO1tEqMCfGmqHLFnAEIwDUATlsf2rBztwOfn1WCfYRqvX
 dbK8AKk2jmAzFBt3VjFSDVvBXEA5ZmTb3gn4Ctj3jZIxsR8YLV76Als2ymMcLfwJKYA22Hy8uZP
 eBcyYSr1nUu8g63JaoQ==
X-Authority-Analysis: v=2.4 cv=Iaa3n2qa c=1 sm=1 tr=0 ts=69f4deac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BshQC2s5e-qBobt13pcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ztxy0QEhJGxAy69_6MZlpZjJibZ0bbLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010169
X-Rspamd-Queue-Id: 2F6334AE6D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105538-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

Add the interconnects property to the common SMMU properties and extend
the sm8750 clock description section to also cover Glymur since it uses
the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..df67ab2aa715f81f5a10678b936558827c105bd9 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,9 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -566,7 +569,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500

-- 
2.51.0


