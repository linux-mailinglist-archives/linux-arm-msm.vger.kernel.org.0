Return-Path: <linux-arm-msm+bounces-83174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A8BC83920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F86D34CF59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBDB2FD7D2;
	Tue, 25 Nov 2025 06:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaDg3Zts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfNzaHHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB62FD69F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053386; cv=none; b=ilCULn9zWpjLfIn/6NpE1F2Y/P3VSKGm1nCjGFbJrG3XUg7HsRkOi6X6ZE+wDlB+mUbuQJWyRAusGDJQf2oSCSCUGfw/e3EAMT7bPetqZQm6/AzaUi1ZQe6vdxrjkeUYsRjoXaVOCTKsXMumn/BHC1UdBPAXr4MtOGo8+dEyr2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053386; c=relaxed/simple;
	bh=CWfkoJLjgIy2gUgRXCOUxurYebB6LVsEC7XgknJptQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXY/6Pf+aZPQjQ099oXh2thwF/T7UbzwvI+wheQoUzUs7hvc4dNuOCWVJPVxR1emxmBpSedfUhdDjGlfomcXkm5RJi7+3act/u9tyVejTA/swbuO6jheV55fNBFLEutPML9JKJHNCPQd4JiWurlHfN/PTJ44u26vix1uRF8/e9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaDg3Zts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfNzaHHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2giEO1741153
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZtV4X5cR6Ur
	U16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=; b=BaDg3ZtschB6e07Sx+8ui2qu92j
	9TRotQC8bRrFgSaxJRMlwBy06ZFM0ODpA4mzF+3/aBRFjLiwjkxbY/01l+IJDdR3
	ex/vOTHgvLXqVGqY1HafwDgswbSXZ1XeMku35Cf07u0lUuBExXjEzEvlNWEmwHfc
	wuhCACETM+G6TedGUtjyo4JrAQFf+mHP+02PKbap/iGELYorDD0jPxchBKMx2MQI
	Vt0M3wS9o1l3gKYIQ/9R4jjlCldWfDadUQ2F+dFnpaFjHzqxLeZxIiG01cKR/zTa
	SQoSh5VBddicuvxyaU0K3wtXlXAayE7sjWrQ+DqdcIgJyj62sIhHaPk0dtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteba85x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso148136461cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053378; x=1764658178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
        b=bfNzaHHEJ076A4ayFXqsP/D20/Rz3wgoXgvHBlrTeVQ0wx1Hx3EXp8AaWeA0GAW6Z4
         SXPQzw5zyV8JutlAS8RXA+IwoPC+iR9A3eBTbIta9Xi+hLRuYJaXN4GKeJSvqctBTkmm
         iIEO5TRc0eHIkmHnSNgWNbN2sUhOG8gJpmHalYqKgoXXDsvVXqB94AbXTxGDDv+Wy20E
         YfMg86ATFx/Iog1RiOMK5kg8P6Dbxinxb23INhvl4d+XZ012mWR2myeQetep3C2jN1K0
         rbUJWCoR6NkatyMzh5G6TSy+OeVdgwULgYfMDkDjxP3RRaRCQBwZPiIHTpBvwcY/qNvN
         W0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053378; x=1764658178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
        b=nz3pbmKWJZOd/ohIf37w3phmEnwYEB+MXOeCibSkjfehnhmxyMSxijMx/ojf69gcPq
         3e4CMA1efEF8rSXcjDr/n3bhDPL8N4qgP16T7gkpp/I+L1VTUd9iCFuD9hV786ukbIxT
         zkyzdPa5PRlVlINJ9MiAdChEUlc4wO633ttDZbboe8yd4MxcvBULR5LfPF1IEQ9vtgmH
         UKGalQGNaZds5F2l5IJWJzKYM107VlDuFCcv6/n5GfQxQfcRgHst+09V+svDKaHE84fg
         v+NP/6wEbSRPJaECIofdbxCIsPiPKEGnCxPvqWQ//bQCvMwLJgcXhfCrV5YeqR+z8k7I
         /Szg==
X-Gm-Message-State: AOJu0YyVBp5KrdrUYFaz3VShoGGyNbRxYJbyX4zHz31EaS1Nrh1N9w/m
	apuCzuTSblftYlfg3q8U2RjTtPkn32Wq1WYDZ4/uqX0U9RXHk35iprRyd38c9ATAi8rH4jaR1+t
	fX6BH3SXDAZ5k94vrHiPt0z4SlyuxFU+YkxJtMPiq1RNdKeyOlDIVd0uTeOu/MTLJKMXO
X-Gm-Gg: ASbGncuzYqRu2XIUZh9L28A8iJYPrR3l0QiQ05Qw8EwV8NHCVydmH6c6SFlRHLeyNxM
	OdpNXSNQLNtqo6bDLeObD+9yym4Kp9JfMWrSbNpg8KurUPwHe17zlpHVA6bkJyQ6BlP5IEPhuCL
	im4Sr/zP8OCtngj15Xh5M3cXZlsfQXh68uW+El3+gzDuyv9pEloVpM4BtCia3/YY56tr5oZLC8O
	QvFUay7DNfbs38dY//QuWrrlDkUG991xLWivw0YmiUtQypnQbDmIsLxWeOBvacN9UFySV/VD7oT
	J4czA2dZ/w4C0vCK/q4FANcLZoaKKYFcQOXoYEVKEbr+qe50u/XsCxIFWJ9MQcouEKsOM6j6G/P
	swH4pcRsD0Rz6UFqMtTzdZLdeBpKqegOeX5D6rtHEPkkQmSwjIzCQrvJGYLlEPuKluo1kwY4=
X-Received: by 2002:a05:622a:282:b0:4b6:299d:dfe4 with SMTP id d75a77b69052e-4ee588643b0mr179856031cf.32.1764053378321;
        Mon, 24 Nov 2025 22:49:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHm/Df/TMVkbw0+C52gzCmwzm6S2/Yi7LKlRQTQ1LKoSX7qQJ5OsrNdtob4J3N0FtyBo01Ycg==
X-Received: by 2002:a05:622a:282:b0:4b6:299d:dfe4 with SMTP id d75a77b69052e-4ee588643b0mr179855831cf.32.1764053377853;
        Mon, 24 Nov 2025 22:49:37 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:37 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Date: Tue, 25 Nov 2025 14:47:56 +0800
Message-Id: <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1x2Ccf0ydeJu73lVv1gVSTMm0TEpThKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXwgNglJgLWHON
 baIcVfVVMRZF2QehP09BMR1W4IPxpQcFa9+JvGOn0qpRStchQPj0sKiS/d9NBosfZQaBCzT1URS
 ONLRuHgx3um0U512ANDysiT056QRJfmNTAEJxgXJB4MsjhQVFceCjuXVKdZdfp77QYv1QPCQOjO
 rJKzV8moLIEtEtlnEOCejAhs7sJ9puZiR7J9HEnwv1C6KCmzfh5kSmLbpoc/WfUimTO8rPvScYY
 U16UXATYogHTBg+0aXf0Uvyr8xD9aJPdHYZf3uC+tu4XcTVMA81kmJOmozaNSkN2/xZS78o0t0o
 P9PeQp+6+J9oLgXnU/91/UUNA+MkBBVUj7JB71Hoa/uGhxX1eeIsJKPSyTWQH3nPTihCTvL3o1W
 HMM6DztfGZwOg/UBJEa6qZsAvzbUNw==
X-Proofpoint-ORIG-GUID: 1x2Ccf0ydeJu73lVv1gVSTMm0TEpThKT
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=69255183 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1


