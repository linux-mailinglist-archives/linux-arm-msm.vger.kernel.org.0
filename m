Return-Path: <linux-arm-msm+bounces-97505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMJYOIAQtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:26:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F4283E15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F050E33557DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9E9396B85;
	Fri, 13 Mar 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVLgfB0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/h423pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C74338C2AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408029; cv=none; b=hBbCydPMnEVUraq/7Amd9TwTH7PQIizhz8le4nZGjVbgGjAlSFKdjWms3Cmbm9e7/4kG8175G1OC0ZgerSAycAegXyHTEQX6ZOIPgKc6sOhByH6K67g4zKxB6lxdCsZSQ/cQGCWkSp9nXJfUvUcQQTJR3JTTgkl71bSMPrMLc2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408029; c=relaxed/simple;
	bh=wWAWxa+zvQUMOm9MC7nJeUbKuYl5szXsHWj4/y4OmFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmxK1IDLkyKVj6uFoPLhZn0v0ZmfTKUIcf/O5DRgc/+0Fzp2I+d/KneVqjBDEgEmkQl7vkZ5to2qR5N8342Ff7SX2HDXD+eojBWJikIbFzQZgKRDWIWSJTLPi4zj+WIqtMaVlarF9A/N+dBf+hNFGqV8MxaKAPeUXaqZHgrJ86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVLgfB0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/h423pr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vF8X481699
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78U34vjJm32V0mthUVg9KTTl0e12pM8pLb615+vj5PU=; b=NVLgfB0Ql0Ov2eIR
	TH1I4+IGiCTNTDjm3qtFsJ95ZNLjOassi8nrABjUSaXkvWKoYpv9jxBnfoo/rjaX
	v1CorF80A73hZ648GaHtVPEwPV6t3EG0w3AjZa1uaNCKiKG+Hw3owUQZIBAO2nF8
	PXgXgPS8gnPtCyEzwMnKOyT0iOwZo+30zzWMPq3X8XV8IrTPORyvq0AFSkE3eqKc
	4jhE9m0nswq4jjuuQ5BWQqVZ1PGVbr20KXDM8afTDTkTY0lWT73c0aiKLTEeWXVm
	uO7kfu6fj8onAha6oVCpzWzxLAMiVUCsOO4L6IBt73DsjDPPuVGZI0nex/tDd1Dc
	0dorkQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7ruhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a0686edbcso1180403b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408024; x=1774012824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78U34vjJm32V0mthUVg9KTTl0e12pM8pLb615+vj5PU=;
        b=f/h423prek+zuRZSE57mpRPLGjn4zf3aJ5+Y8X/NMD4kQXiUvG5xjqOVB7UuzRg49w
         tbtU0+H8XrFzhsS81kOSCfX4mHPtbvUDW+HJ8DdIf56E4rcGy8TSdAGOXkTIaksrAV/l
         rCbICnze6ajMdmp4l3PrMAPOscC9KwZrIfVR1m5lPyLf4F0i0InEucCR5GVCzsnz2hSk
         G0MDIsLvTP508scn4NzIhfGjTV9NnmkQcj7kAE9jkaPO8r5Azrbxqx4m72BK3Nis/sav
         OPquXlKKRwHgfTiAD3/vwl3gCaIhkQFaOrIFbYgkB6kcjOt7U64otX/vPqwp9+k6iE5K
         UGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408024; x=1774012824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=78U34vjJm32V0mthUVg9KTTl0e12pM8pLb615+vj5PU=;
        b=hpQkSglFqtKzr0kQJ3/nALeydjVXLBRu0ch3H+XiCZNYmp34ag515UR43nkmrHUcwk
         Cpg7FtjOuF2wmkCz1e699k0ZbIgakqMhDKvCEODpF9c0vmB2shvSa+rGkNBJrW53FvUP
         X98P3WgkLFoQXssjR0IXr0cEivzdHMfV9edAmNlu1pDtC6NMAgH6EthEFiqXnZf3/JRe
         6txLcZQ9ZIuclaU150KJjJibTEO+46aTEl0/XMSlAPYq1LhboqDdeDe6vM12qQtc7b22
         FVriWQVyFXJT+pQqSbKBZoosA+qcCbv3+Yw+bLXPMM+wDMbBXJHKwSrtFDxENvjpcovI
         q8VQ==
X-Gm-Message-State: AOJu0Yx6o80Bvx/nj6iX8YTVmaXz0RRYOQkx/ttqzw8vkKXXQGpI/GSe
	f3dxYKuWRHftQNXTTMjZDMEDEVe/Hg1FrspfE1q+0S9r/Jd1uhakXb5c71VLWLax+r1lTaxEApH
	szTWr63i8XsNf1++/NvJoOcR1RL2VjOE2cG4L0fgLpxugtOE1pAHBgCQ9Wy1Qp/6rusM9
X-Gm-Gg: ATEYQzx0Ugz/hkbYvMPrh5g6bOloJFH9dqHgBaaZFjXUaGwe4OD9prVSzm28LvDFSb2
	mEzfqEVzMZDZ8OHzCdibqzPWycIVL4s8ueZ6guP437KFNJBNqOS3USw2u3a0SmSkLAPOG9XSaB8
	h+tft7tGrifnCme4oHEvOJC/wa2xCbNLfp+ZXLpG/WDT8OfCdE27wvt1B1YUO/cYz+twwxVOYTM
	rfVPivPPk/gHhMTibswRzV8hXpq7mq0lKEIbdj4kkxZ5613AUjx9EPAfFM0T+ne9hBvVYshwYaX
	G/nwClocVTgtxIZWO/uq6xPAUgr+ji+3QU6CHt6D+7iPZlRWXrbWEHnxMTRUZzo2hPtlk5yfnUJ
	ahH2b6orDBETs+avG8bp8ek5onKf4naucYFo5LkwRjjDVMtAQtSzlV0Mt
X-Received: by 2002:a05:6a00:368b:b0:829:9ea2:3e17 with SMTP id d2e1a72fcca58-82a19703e4fmr2544369b3a.9.1773408024066;
        Fri, 13 Mar 2026 06:20:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:368b:b0:829:9ea2:3e17 with SMTP id d2e1a72fcca58-82a19703e4fmr2544326b3a.9.1773408023414;
        Fri, 13 Mar 2026 06:20:23 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:23 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:49:37 +0530
Subject: [PATCH v3 3/7] media: iris: add iris vpu bus support and register
 it with iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kaanapali-iris-v3-3-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=4125;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=wWAWxa+zvQUMOm9MC7nJeUbKuYl5szXsHWj4/y4OmFE=;
 b=SqUxLVUKMivw1MUUvqwiRt9NY5AHMtKwGvn4xnwnuMUqvHBHdJ41Zo0Qsq4ulv48Pk/4VS7lp
 DFGja+GF+9aAQ5ru7BE3cxRxbhi56F34zFu5U0ozbzSgbSTFsEJA/l4
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: uxArlwotb__rM4n-o_-xNrpJVFRvJrIe
X-Proofpoint-GUID: uxArlwotb__rM4n-o_-xNrpJVFRvJrIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXxa2pXQ6uGXJl
 Sg7LctJL6AGIoq3mTf4x92Y+qVptW+Y6lWA1U9wXEY7kENtYYPFBZxrTDH8Y35dJPgKnd0hxrR9
 bMGZBeKD4649Dtvfr5vP1awlZDOk457aP3qV74Yp0voFVLkJbpXOT3cpWRUNfggrWGs7yYjVopA
 dfZzkpsusdwIrWWD2dqfZz2T5hsbCiTdxa4X2/yUQSG7NpMob/edLgmVJ7VYyN/q3RXVZVgls7J
 Ux1SEZtGZPHITqxgPOBPUAdrkBB0Tety819mFuaVNeV8IvCNgUZ3Fs5JcPtsz7a8HXrh3NwWbC+
 tAq3YSw/Bjtw+w+xPA/U3VpO7eA0j4ohGzcUZPIQmMYZbj+hg8wV/u6BiMMvrRRs5D4GY1LY2PZ
 1v5lE7KegMFOsUm2gIHDh/Eb2r0HPM/n1XqaqAEc5tXpPEr+3N59KrC1QyBtoVs6Y8udVMxljxN
 wPFB5iEmbkT2turFz9Q==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40f1b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rA3BtQNSaToOiFj8iVsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97505-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D3F4283E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add iris vpu bus support and hooks the new bus into the iommu_buses
list. Iris devices need their own bus so that they can run their own
dma_configure() logic.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/iommu.c                              |  4 +++
 drivers/media/platform/qcom/iris/Makefile          |  4 +++
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c    | 32 ++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                       | 13 +++++++++
 5 files changed, 59 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 35db5178095404fec87cd0f18e44ea97cf354e78..fd5fb7c10da22ab548d359ca1f44504acc3d646c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af07e52bf372a4b2f352463529c92c..6f4052b98491aeddc299669334d4c93e9a3420e4 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+
+ifdef CONFIG_VIDEO_QCOM_IRIS
+obj-y += iris_vpu_bus.o
+endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..2273243d1a80446233dd82dcd77444aa043ad064 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -204,6 +204,12 @@ struct icc_vote_data {
 	u32 fps;
 };
 
+struct iris_context_bank {
+	char *name;
+	u32 f_id;
+	u32 region_mask;
+};
+
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
 	IRIS_HW_POWER_DOMAIN,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 0000000000000000000000000000000000000000..9e9fdeb6e405aab26ecf5e57ca91fca6b8eda2c5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/of_device.h>
+
+#include "iris_platform_common.h"
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	struct iris_context_bank *cb = dev_get_drvdata(dev);
+
+	if (!cb)
+		return -ENODEV;
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, &cb->f_id);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 0000000000000000000000000000000000000000..422898cdf2f62eb7f4583d970a01c8776dd12164
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_VPU_BUS_H__
+#define __IRIS_VPU_BUS_H__
+
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+extern const struct bus_type iris_vpu_bus_type;
+#endif
+
+#endif /* __IRIS_VPU_BUS_H__ */

-- 
2.34.1


