Return-Path: <linux-arm-msm+bounces-72964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE1B51593
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72839179A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BCD3191C4;
	Wed, 10 Sep 2025 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwfUD00L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902182D1920
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503575; cv=none; b=A2LhZDy1VIoJ0oYAM5n5xxaVTa8z89PBspLsMbo2iJj57v4REVfIEpjVN32D/GOibD/nECs4bq78tnt02vWx+Ig8+Y09hR+fZKlB1XpJ/Kceu3lB4Kcvh/3IGpIF24OuRkT7BA0hiN977fJPA+3434in26v5JTmv8oDcSt95Gfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503575; c=relaxed/simple;
	bh=uzPVmN95UYA3m4eO5APKZbdkhOvUBX1OERZwHXJ9QPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbjOrWoVHWahudep71VHthbzxRgvm3yu8PYVkVdBqPT6kRfVcflOWpKfjMle24eyKFoJt4+lG2fAtehEnqPdd/CW14w/XdjmRWp5a1PF40DdlRhqj+Es/EEiMb816Jqy/VooohdC08RaWcaMARl1BA9yAMBCv0jXn3nEPbEQ0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwfUD00L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFGU3022192
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gt3lMrqxrsh5HFvqVveVdKW5qqiAGEIrNSWV3HoZYpQ=; b=RwfUD00LFWtG3E6I
	qKtyTpK4TrrkwOlzlHuWsp++82VkijRFCSQvCmJddvXXATjlU+h3uIzB6pZsxbRC
	fYYHhj28oiWAfiiQFMeVSDMZ7dozANHrVlGmLGMoh/Nd3j+n90/+6tlUujQ6xHDz
	styoXDDMymUjx9dZGHlS11AqskLNnd3NBFT8mmoE9jKDVf+eFEI9nxvdNGlIgS/a
	vErf1RZUznb/WyfpL0HTZvayy5T75hHKMoZV4MbYDAedpSsLWX7iHZjO8PLzVrBq
	nzcxj4gTs9x3eVCuZLGkx0tgOG9qBCvptcGGObZxugE7BOgrW/csjBCm3hgqYFFK
	2QFRSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0umeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77429fb6ce4so4616225b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503571; x=1758108371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gt3lMrqxrsh5HFvqVveVdKW5qqiAGEIrNSWV3HoZYpQ=;
        b=JrBr+Ix2eCX30+SM8ctO8e3GvVLCwyeVuwnJUOvBm9RPFYeIBN7HGS4LYkwXEZA7S/
         wPc86MEgb0z+i9M8aQ/9AquLrZK/TQaNhhlu1MGv4FfBp/J8igRR6yrAsLStYrcWPYsg
         N03dkSGRPMqPgzy1hEzOoeD8RskinwWlMcXM7+l0FDTdv5J/tsmYvqmyTH+zJLls6uYl
         IT30ASD2nakw4x99eqDHwHrk781NZeitR8kfEGGNrgsnsWW9EaqjwUIyBdPmcb8CYy9c
         ndcZC/xZkZf/zMmDOSm7IDDHUf+l6oJ+J8aJ4c+4NoS6EKnJfI59gYpeOgUWxbq2YloU
         CZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmNhEPHExpN6L1e5i60IDCtXDxam9ZA6ifmNtewJnAKEm5Cm//ziud1AQs2rXvt7l/WdzE80ZGWUMEvQJ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwVeo5BpEcm5S4DduyNGimL4DHSVJlI1Yf9C8tgd7OhxcqpVm9O
	aaLmiZ2XDEIfS8rtCMy1Jn345V2BJnkpPRSXOUNu/a/H9kF0FWYAFkNmD1+D4ijneAuIwrNxRJw
	mBiGIJJwCraz6aYau9ml1b2bi3zL7JJb119NjH27wkEFNnTqPCtyYg1i6bmb6A4hM6Gja
X-Gm-Gg: ASbGncuPK0RQzJSgFTG40QUyeRhFIm+nijNQEutjud6dafeSz6B2D7gbAGobxitrbLQ
	5ZOTUN37yWwfay14hIoL0G0Ktj+VYOqSi76uvAKP+X+d8MiaFtQ0cyf5pSd/AN6xFerVwUfvCCj
	MCIHPGD7vf/P+BDMjSIzhgtG3hXxFuBuNXOeMOqPBj6f3k+ZSY1iVbipb+GhAMOf2v39YaAJdLV
	aA3YopaIKmmCJmYzJYBtXwpGsEnnooe5N0Tdujn9eyugrRH8mNvRHjaU7Vq9iB1FmG5s+rcTiFH
	OFOwh/HbKiVHt1+AA2qFrdessJawrJtQZQ+os/jWz3vZH0HL8r7FTehLKEhcKa/F
X-Received: by 2002:a05:6a00:14ce:b0:772:3b9d:70fb with SMTP id d2e1a72fcca58-7742ded7359mr21704535b3a.31.1757503570718;
        Wed, 10 Sep 2025 04:26:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL+jXRvCFnuy9K5s7zAAadG0Sf39RWmu+cwoO05ITAyVd+5McQwptiwhwv3oQ8fuawRfi01w==
X-Received: by 2002:a05:6a00:14ce:b0:772:3b9d:70fb with SMTP id d2e1a72fcca58-7742ded7359mr21704478b3a.31.1757503570177;
        Wed, 10 Sep 2025 04:26:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:26:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:21 +0530
Subject: [PATCH v6 1/6] drm/msm/adreno: Add speedbins for A663 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-1-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uzPVmN95UYA3m4eO5APKZbdkhOvUBX1OERZwHXJ9QPs=;
 b=U1kGtdA1U9VR5G5dL7kDdE3dQA4lZ77QOfk2JkSYOMau99SLXDF4cj/W5i6UUvvnnF1JCd/cA
 NOgMg7nJzKUCKhcldklSwobxAc4fXE5pFPx13Sljlvxso5+uZn5kWOc
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: NwkGg2pcyb0BzJbneXm6Chx3nR6q7R4B
X-Proofpoint-GUID: NwkGg2pcyb0BzJbneXm6Chx3nR6q7R4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX3RMiYcRQRaRG
 JF8T3jDErBLOKi2fmXUP3R1Wse7FY7TGGoPlx8XA+ozWKiVuMr2XEej+FBndkjqWFJ5xwfxn6Uv
 n1CBErUdlRgzXt+37Of8yzIzMMa+y47ucDZ0IoxAA7zCgV5SutagTlzI0CfQO81+SW0Bz7lTieF
 ePISMkljng27vr6ckr6IzaPI3iW3PLEAuSSYUGTriezWWy5PCijPhSwqZpbkQo/bRHYe5fgQf5c
 ZTbFhTRKEQXINk2tv4tfwSg8DSYXeVlUx5u8RydKfZeZ8EGKRxRjQPNhVPkOqYxQTUXE3qPFcHO
 EU9bDjjKOjQr1bJz1lCD1WhHLabv3902Kv1RhUrApSjIM3xJu1v+BK1OXd29UdQKMaiw6NsdW7e
 sfLYZ1+g
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c16054 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=92do0itG5Mw8xxZS-WcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Add speedbin mappings for A663 GPU.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..2b1c41f6cfeee912ba59f00c1beb4a43f0914796 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,

-- 
2.50.1


