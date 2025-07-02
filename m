Return-Path: <linux-arm-msm+bounces-63453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD8CAF624C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4604E789D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946372F7CF5;
	Wed,  2 Jul 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGFPDAUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83612F7D08
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483003; cv=none; b=rZQMwee/GY/GoZBHGIa7zvVNl7JAAykF9+Ol6NXVd4yDoc/3BD77pHDbwMrodmO306hwuQUgOA2hKG4wSkL8tM8L7MiFcl61u9WbW5B6CQcSEp9g3/ua/EIC9Mr6kyoXXpHYwPo9Cy2GxrVfK4Pld3EZZIaE+m5mx3IODVurla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483003; c=relaxed/simple;
	bh=taEgHDlgnw61OXY2U9hajcavznBIHc9fEPARmYpPTps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcgbjTfp6JmjVt77ZivWtuyJlMC2NhWzZtSz/s3D8wKg2xMH3Mm0Q2wT9y4cSRjmpl0ufkUW8Y9em5hLFVH1hyMHdZtCknkQOM0Iiy5gHxOsoiCj1pswynguUdkCj5An5uHkUIuvMrztBk2UZwB3xDk7GBfZfodVvL/95TEmYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGFPDAUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562GcAqS000337
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0TPHHqeWwaf
	gD/wy+wdMm0T79M28epZeyV5c9zSAGPU=; b=DGFPDAUkATM87XY2Yq3x5my5uIz
	f4K+AcXgcRJ1yoSbXVqIVDS6/fsCaZdouz17qePb9/LLxRa7uBpY8FkJ6pqGEonX
	QYYtLMMpDguSAtnkovnkzzOA8HEIoz5zQV/4kt3Huo3Eewo1O2fxD/Nzb4hxcAVc
	P0v4Qd1V+FcGmacJgcaiLueNlUNQsZrPYQ+DW0HXIo2HyOzMlDTmCeP/m6qWqlQV
	qqvKhQA9Wl7t6yoYkzI8guX7ajnrX5Emc6BwhiaL8Fv/Hz94lJ8i7qvonA3jm//J
	1ZqtPFipfkjiACvatRLm/TO6C6X/LhB5v5oJAN2DmXHtXcAJwoAHTLBgX+Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmdnjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b321087b1cdso5996110a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482999; x=1752087799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TPHHqeWwafgD/wy+wdMm0T79M28epZeyV5c9zSAGPU=;
        b=JgGbe1FKfpbsBQtPuU/9PS2U9IzpMb+kE+D/KbNJgEVdv/JwklYrStl3QAxbL3V91C
         pa9M9cAyzlYyNrSgCFydVGc2RQTztvFhbql7BX07BPNGqwTecELDhviXNkCgrN13wjCg
         lwdD3anXY3ymbxBc71GjsJlfahym+IcEmSCrd5wKhrQmlyp3X/1mIduAu3k3LtRCsGfZ
         g+UitzfEPEx9qHkBYosIhVGuDulm3SXlowWuQhg8phY6z280pModRhi8KgVzvjR5b9Z3
         y11PdHmk8wway2sTRuTO2yfBZz835tZqRtr5a/0FzDzcFYxlwAwUHnWNzbu7OewiO1ny
         /2vg==
X-Gm-Message-State: AOJu0YyhlZybJ8/8SEmPNS3rI93NlafJoSULLYdpI0ZBpQv8sg5Jjh1y
	g6ILtNIpkXS5G8xiPYH2mMWsqcLhJo+OJoQ+XNB7nEYt2mv66jv0MYa3lvl7vtUdAAwGvjBho0m
	xqwqzyFoOPYtRSVKNkJQW7DXeOBOPAkxV1sAgQtLLqSuBq2hqQ1c6QO9wOJS2gjpII9Z4
X-Gm-Gg: ASbGncsozrXcsR4WBInzwSVdJYve1UVh/xELZC15uYeDWwtEaPn88M5LVwB4XRSLCow
	Iuo2Koj5jgoN6M9gvuK67XyOIt0pIarELHCj5xX5NnSiHWUFTir7c808cefiTyPE5X389hKgkUP
	Qm7IFfSwbPNiE8knRJZzUn3U+K36ncTjUIrvtUZRuJglw1CX+ACAwG1dLKMN8s6qdlzSX8gngZy
	47rBG1l4yESgID2AfAnNyY0pTlhd/FJhgpsuZ6DwwE4dnaVa88IVNAgvZ1kmFDQci5KM2dMN8qJ
	AJxeMhC2T53CuyO1R1G0D6d6ay9iJczhpQ==
X-Received: by 2002:a05:6a21:69c:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-2240c69846dmr1191565637.35.1751482999076;
        Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4IHEqp34Hp57IuuMOJPLXbvbMWusNlgvmZerZp2Ng3NfEcRfq/4k3OMVpkzVtLypMw8T8EA==
X-Received: by 2002:a05:6a21:69c:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-2240c69846dmr1191531637.35.1751482998643;
        Wed, 02 Jul 2025 12:03:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cffccsm15581393b3a.130.2025.07.02.12.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:18 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 1/9] tests/msm/msm_mapping: Fix memory leak
Date: Wed,  2 Jul 2025 12:02:41 -0700
Message-ID: <20250702190249.376313-2-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68658278 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YG-Ktf8kLO1V0yi116gA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Zdu9jNDITyal5Zrf_Wa5c-jFEy5z65MP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX3AFRMrhbmpdA
 //Ygpn3ULq2uoohmTVmo62pLxegqx344P9396k/JDzA9vPxlKVOA8fIrcvQN15hv67pOclKksCA
 +lFZtHE8h8YJ4QNExOxDBh81fXrgxcgezq8JAT8eJZlSr5VYJfzZI03UWs1BHYRhjfhzqaAGdbQ
 t4L7C1rFAs9uHCDEWF/wMEkl6nB65PPi9ubJJ55mFJfqagMZtKw+VIKRrbjxyMPPoA0WDDPR5T0
 9r8isflSCU5JdxN58G7e/HdWR8dWQmKIXFV4V7ep/yScoMdtrn2qSIl4CUs8NBS3g2NLXKZYIPk
 WMPJfyHWrUtQSViiUvmAVesu4Q6jvTGD995D7b9aeyEy1gvedVav+AQtRBfbPfmqfN/8oljcc3I
 3iY78Yjnd7D20EWJmRwWRyeNCfyFh2xmFWm6EamB4f7DkGXeqsvLLewJemCwMDxglXw0lFH+
X-Proofpoint-GUID: Zdu9jNDITyal5Zrf_Wa5c-jFEy5z65MP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156

We shouldn't leak the devcore.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index ac20ca91d613..1749a670e70d 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -215,6 +215,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
+
+	free(devcore);
 }
 
 /*
-- 
2.50.0


