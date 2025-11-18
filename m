Return-Path: <linux-arm-msm+bounces-82225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD562C68634
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A60892AC51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48986330329;
	Tue, 18 Nov 2025 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSJrKjwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY8clKCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894C330314
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456051; cv=none; b=Z70hHYHsWB2niXCHdjml2tKGnAR2t5ShMUpVp0M0vtuJbwFTn/z4SAmRacj1hXB4tHl8+Nvn7ElF8l0QrGlIAYQnmC7Ky65LcEk7UF9hbU1LD7UmbwvSsW202CaeI7lvtT5A7xfOD/ASax5tU7HD8NnCNFajsC4TJ0QdQ1XTMRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456051; c=relaxed/simple;
	bh=wceYkLyUbkNoE/pP8sWa3zSzsulvkqlQyOrCItWxr1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1KGQ1I+TUl/XizkWMhQOVe43Fgcrs2By8eVPYSwX0XoRHb8czKINc61u/q1eTp/7UCSmO8DtzEePoJXtjjqCtOXw/K5qpePjrFauGI7EqeHJS1p0szD/cQlXTaAe2Jy4yCxElrExLs8VK0ZZI0Sn390Ez5aEtTvu9/Xbf+30mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSJrKjwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY8clKCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VgFk2250590
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=; b=XSJrKjwoVjc3E6RO
	PWDEeilTCueTASJKgSjrC3dJJBhl95aZ2GbxaMRERmW+cCH1EctTbG8YufS0NXS1
	elUEnVsHJfJqhC5O4e42Z3QfZsGtwJln1BhAzfla/PJE1oPmmGonbgBGJnSbG4S7
	uhsahzWLq29xyCVLAbR0KcDYFFgLR9PyT2/jElEqq9NmUl2UuMkvr9rGk13Xkm64
	jH+s/yuVabDyI8WYgBkIoNj+SQKARX4lmFL5hC2p8ZncvDbO7gXJ6XMvkfFdnf+G
	Q3gDpCgL2p23bFgPTwaXy804y7cUFKerC4U7LKdcxk40VWYDK7UWhQN5HiRg1zx5
	Z8Fmag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g229-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:54:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29809acd049so90960135ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456048; x=1764060848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
        b=hY8clKCCUaJMGPfsx6IzRHJmILX9FL8V8rNUfbJQ1WHEqHfiIkvIVRtsb1ZBJxvkZr
         dyUfWtlyPxEBVt3V/ESOAlwuud3xE9a/Zf3hQLpzpbMWNhntA7CAEMq5+Vw88qZN+xIS
         taQB34P6Gj8+mTukM1IueL7Mn02yaXGHmn9rbBiuyFPLluMWwAxo9+U8sfJtaqa2E/yh
         hjlqsy+pR5pkz782voSaF8Yt+cG9UmvRMayOtfO9d6r5T9j2zwqshrDYh6BHTcVcgicO
         Ve8AN/d4wFkmS8A42KBzxVys+NDUdrgKVJakmZYxsd03taINEj0h8gzjWFr8orSEfxOq
         UVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456048; x=1764060848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
        b=jZs395EeDcbjfPZGRsDpiGhnnr+kT/7BHLoNOvJ8Omf4Oajg1k4mwvVUihPJzEm9FY
         kDlvA78GwxqV1Zv1j5kNa5Hlhr726biXwww6uHHJotJ6eKvoOb+rJc/2bDiAZaTYARA6
         8qpkll2QeZzC6qVq6zmtjI2Au4Iqb4QRa4G6taIWB638JhL3LAsjx4ANRocW35URnR7t
         F6EUcLf/XvjGSO/1tn/NOsckWcUbfrvhtDN43Q88Qmn6UumJfpNRc8y3KigLovCwSdXF
         jg7kZqNwJGGxeNXQ9Ei6Uav5WoL7QcrkrrjRpUmk+RanVFolIY9B3qBzp19uke84dTxr
         9jRA==
X-Gm-Message-State: AOJu0Yye5jnBf4GAppYIqyPUXsf/OKjvRJCzqMQ8nPzMGhROZuk67nVL
	gTEM6Y6+av0OdSs1d0zIKc2/oWU5KIy6lCFbxZFqRXcWj2FH/W0he+iWchoMIyxN6J93CwincHm
	UGNZ9sjEoNqp+j7tsJl+Fh8Fqy0jm6zljyoXT8eqaBYP3NFXX7oCjPyYZ4UBB/R6I6jmx
X-Gm-Gg: ASbGncuntY1w8lJAcwiZ06+cdIHSQdPHbj/YmqLNhSexh2L0WKB7e5T1xDrhfOKOX3d
	DP1GzXFQ1IzEi64T74fcXbVRP08n5op5O0467tVbDChJOfnK3sR5plLQzP0Hp5PMHVsMCRUT8xH
	HFcpgemZHqdB/vDrQ0/1G5w2sha5bPN/dBNNEWnyqGfOPR9AEluL+5ZGgTebXhVeYV26/lw3Y77
	pdoVTdf+IKEAS3GHYuCGfU3d3xI8F+W3RE1qXaVaI0kSHz19F4mFw5us3Ost2A7v034QJ79HqTK
	WTEf59g/Oidyxrcrtj8aoPss9JLIFe0RnjuBDNYIPKKuJDXYkLfvTt9fiF8zjrFBFJZTVtZdzVX
	Koj8xb48KRjRF0PNJkludcGk=
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id d9443c01a7336-2986a752d2dmr184977865ad.47.1763456048185;
        Tue, 18 Nov 2025 00:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVjIlIvPTSiLdTNwr5hmoMfFZEBIQrZl3YPil3Ox+0tEXFjgQlXvbvrH6me3SXOyh31lsTdA==
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id d9443c01a7336-2986a752d2dmr184977645ad.47.1763456047717;
        Tue, 18 Nov 2025 00:54:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:54:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:49 +0530
Subject: [PATCH v4 22/22] drm/msm/a8xx: Add UBWC v6 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-22-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=712;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wceYkLyUbkNoE/pP8sWa3zSzsulvkqlQyOrCItWxr1g=;
 b=ab9CsH8NF32fs2MhCaQYzdCr2lNXGHBIXRiN2OcE/b/eGPfTzV94cxPkR/EkNz+ftEVQXOWXR
 YhM7yhyZPncD+Uqsl3lAE5hf7Myb66BTpP+CS3Bd1dT6SCaSlLLFKhI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 8KY0P7_PXPzLULwXNHz78q5Q6dB9bQN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX+hAv9VWPxCKD
 1QonWB8S7XL2sRTrQq6emICMqGh4+qXm9mUAKRnxUCYX4jwEKe3NNip6uAXfwAg7oV/1YOxCo1z
 xekprCcVogtVkN71eRgNM6lIAwUhUoi7OGVsxK/wJgDkpMfrb0hNJbl/8GgUFznol218ghIh8EM
 +LgNkbO6mvmG5wkXJ61WblMTeUzl2SJvsc1/ulGcuRjt6XK1u0+xA4sK4qiS4CkMSCwZGEwOZP9
 bpTIqy3SOKN2E2B4zmFWZdxHdjeO/cEaGZ+3vZk0ZCSPKt4b+jIt+maqV4QOtW1wOXF5BEFBizc
 db0arLejDi68ecBjz1eIIsBq0PZxAQ9fMwIZ/Ww3YxBj6Qlfm7PZgVfiM2VpIurVolLOegv6nNj
 fN/gzOvrmLekbDJkLZ4yy/PtEaMdrw==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c3430 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LUS0w5LV-g8XRIoliPwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 8KY0P7_PXPzLULwXNHz78q5Q6dB9bQN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

-- 
2.51.0


