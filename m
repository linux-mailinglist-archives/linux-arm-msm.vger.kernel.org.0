Return-Path: <linux-arm-msm+bounces-82807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5921C789DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 3A0602D726
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09C7346FB8;
	Fri, 21 Nov 2025 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cv91jIaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eudc4oHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C86346E76
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722891; cv=none; b=G28ZayMlVzU3e9AIxt3VksGPqtvOs8I45Y8mZe4DRzHv11Ew5zoA+nsatSXlLns+ixxozvfgXj/mwgT+uNVrl2byfZ80vK4bUhW46oKGEt9EOn3GPfvWCjguKf8zYE5alpbverWRESnPsIiYYHwo/SUNfRXZhg3HdFGsNlQxvx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722891; c=relaxed/simple;
	bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJ48K4f+7gG6eGhVit+UvqfoZ8LV0pVih3TKOY1yjqZv8GCc1Dxl3erDGhKD68nxcNYTPpB22S2rWbFylVDhFXC8hKcPjP4sw1MErp0Eyij6XcPTAZSrKM2V7X5TYy3Gv+VP+vsp7z7yhMhnQJrHb0LB90mhP2bfmpYjdFWENP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cv91jIaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eudc4oHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7OKl21390780
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=; b=cv91jIaPzROzud47
	IMhTx95eBib5nAW1VaBvZNOlW9UZ9h65WL9qUclSoKynp8ShaSJrZmCubBvHOhgd
	z7srWLllQtFj0hazcpBI6qGvHmKnwGHmPLfGkfn7j3o2smruybnFenzUhzSliGV2
	w0xC+f60XBPFR/kcMGZSDxqyifCoDmfQ2vJ8vswLrAgYwtdFnJDPTkIgsxmpSLw7
	mGcqMIT2VjS+e/VR8iCIK1fJjWKbYon6UDkN4pKB85wU2KY/iZCiDMtrF4CW1dir
	UTDJR/JQ8EsyX8trJ//HkTe3VcbwxWPuDtU2d8BDKqe5248j8vR5As5cWG3ac347
	q6LdBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532716-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299d221b749so54849945ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722888; x=1764327688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=eudc4oHioT8/FohRshMuMUy1i3bnceeNvsr+StliyxeI6ofLzNcJtK5Rw03DyC7n44
         Cqs0wGHb/Rdt4lneVCDs09QfqjQWtoQeVwkKl1MlUfYz0cMs8OtDhu/qG0l8oxkB8FWz
         CxC77Kyte1oXdHWxR44lYJiezSOWJ4CfXgtsUWKPihd02SlQtrX6D/bndldDugvIdPhm
         0wvKMeY99s0Ge6+4QSYCAPN/oe9/fTPYZMxwPtsBlB2HZC4S++NdVFgfRQzqiwo+ta/0
         OVllsQNApaXSy0pPyZ/GXcUF/8s0Y4EfyFSLVSIwua3wl9bcmZzPI3ZfcsUaX8SY/6pj
         9c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722888; x=1764327688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=X4E3ySUI0egpmJ/5GlzM2y3KXzuXraKWGN7LxZGzYMK00DiZXiXggHWVpMnblFiw7Q
         sygYtyMASSKUrY6fsu2B4hGtHHdQmnVfNFgwpiPN5xIQPeGObvPZn0Fl0iHpsbQvppbQ
         hLPs2Tx7dDFU5sW/tvZcBHIyfo5HWBevqm6Ogeg7h0egPuJ6c7VDHhiEhc8gDi1y8OU2
         RrIwVBFUb2ABkZakid+hVEUXXVBMr0Me0j5DkeCCbBOF/2lC0JDf72a8wycWjOyDDKJk
         lqxBPPSf36hSRAzHj6nKuXJ3QmAalvnqtnmi3WgCzm+rmIgzmBx4uM8Whg0rNFO8fC5w
         Bfqw==
X-Gm-Message-State: AOJu0YxvTIiY3NQvp/LS2qnmv6Bdm37opbDcwrP2KGdkQT3lVB7+Rtm7
	a5xWUy6BxBKxIY5IaEsUIc2OC8yPwMbof2mODM56tgwYep+IBMfQ2O/taKSKv00fCC0aRq2desZ
	fflUnyKP9ddOXkjYfjqtMviovyTYZw1gAMfG64gmvpLBpg88mX951tbEcneh94aHNw+3V
X-Gm-Gg: ASbGncsAd/fJEnRyMjJ769I7m6TT61JAaO5LAzxoNvjNAqonc8mce38e2ns1bYz5tx1
	rdl+LauYYRNAhd+ipxjchQ+1cY7yhnyZPrzTTSNDnD85lVCOFFN8hRNQ6/jjSYxCM0taPq+Se10
	6lJvCltC2Qv1kUXE6st63XpUWM5B0CgIuAyiJEQlZiL+X7kLdrPC9j8RDXgjSbqr9BVhF87AsiT
	JGBm8dmhaB3IYZsISp6W+t/UrbocX/rLla7zXUWRS//4/NzMSTPj5It5L7zj+BXQPiOpPSrp+9c
	lypkpzWkXD/oGT1C5vQruKzpmNuSZ+1Ix23LBArKlTUC1r9sI03edSIs1NOS6r6KK4JqDKRGxL7
	ubEHGbko+T+H+lBxs+0r95wmTAkwS6q2qWhz5
X-Received: by 2002:a17:903:2ad0:b0:295:4d97:84dd with SMTP id d9443c01a7336-29b6c6b87d3mr24634525ad.51.1763722888004;
        Fri, 21 Nov 2025 03:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEl5BDq+JwLlgnwGD8sLOEYzV73S2Wo1shOKcjpoBNg05GK5vt2WVysz/arNBau/dJyD11vw==
X-Received: by 2002:a17:903:2ad0:b0:295:4d97:84dd with SMTP id d9443c01a7336-29b6c6b87d3mr24633985ad.51.1763722887332;
        Fri, 21 Nov 2025 03:01:27 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:27 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:03 +0530
Subject: [PATCH v8 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-1-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=1346;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
 b=nics4Afx9r45d10kQzixveh/IFAL08pfx/B9GvoJmwVM/e1/qB5k04yXPGDKghA3/buLMSV4a
 ACl6ra/514fBwS5DwSBGivRMTqTmzi04h+IRNpfB23Qz6LVLlQ/x7tR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 8-y0wUKQED7qMWh7g-Pc_O-a6vsCp84N
X-Proofpoint-ORIG-GUID: 8-y0wUKQED7qMWh7g-Pc_O-a6vsCp84N
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=69204689 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nDsJnkO8JLPJ0mjf3QIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX035r/EWYMenr
 g0mvnnVi+XUH5fqZi+P4frKIFF8RJqyzv+TwYErR6p4bgj6OCo83YiQh3aoV+Ri9KA+T4iSJ/93
 p2fHQe9O3b5JNnkoIwQbUvcPcGstKZUFNdovUGK4WtJaW3OZ3GW+07RwH0uEFSs1rvSP/u4mwhO
 6nqrXKGR4aG4bK5h5WgpOX18ydffhJiTJZ8+71T7KqK3oDGKAzHIsz9jcGqIzBPh0n+dIWhV1nx
 DHnJBD65erXJ/KHMc6OFEIHfgUDBERdbxXMt/xGBAXSYueGu+lGsv4nVYzrl9NSgwNAfiAPe4Z0
 8KQjBVVSNSwAnggDiSB4/cCl5sho+C7cdjh2alpZlAKhXOO0jfK9pjnGm3sfxNlRmRaWIZQYRMS
 1698Jc54cWO3AC1o8Svvgyhn8NM0lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210084

On most Qualcomm platforms, the Qualcomm Hypervisor Execution
Environment (QHEE) is either used as a standalone hypervisor or
co-exists as a module with the Gunyah hypervisor. When QHEE is
present, it configures firmware streams for remote processors.
If QHEE is not available, the operating system must perform
these configurations instead and for that remote processor
firmware stream should be presented to the operating system.
To support this, add the iommus property as an optional property
for PAS-supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..68c17bf18987 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


