Return-Path: <linux-arm-msm+bounces-104855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFkvDlww8GltPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:58:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC4D47D3D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11FD5301F40A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 03:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20103331A44;
	Tue, 28 Apr 2026 03:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8+dzt+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hm2SdUMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8833433BBCD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348582; cv=none; b=EhtVxxqFnZ2jzrP4R9G3eyrVQ8uyxdlUaEmdm/hdWTQ6Ydzf8EBkkH29jfTZ4FMibfd0xXSGG/AeW4WjF7WBJEn/1qbWMYoYLM6KGf+3lA6xZn5+rcX/xbxfc/jONeOE+nLTXVPnG76LQno8BFbgvfO2R8175cZMH7ldOBBWxuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348582; c=relaxed/simple;
	bh=GBsVTS4l4F18YjaJ/58wFmxWqzuYLY1cBZgZWMYpxjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FefxnBVmoJH5RkXJungVp5AHCk98myZ+JQVzPuYnaaGBIEMg8DM+nmYWqLw1tat6Bl0wW1WjW9BQnMmaWlil+nadTVRnpf6p4dItFBsyrcdvDbMehRKNovoMp0Kh2gMMlg56wdXRJ/FmFE1iN9yn5BStTTQlDF7X2sgZCKpFuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8+dzt+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hm2SdUMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3YbV2112620
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=; b=I8+dzt+mUZA/OFcw
	Q+UdE+mg5qijzRIiGORe665Zf2gPQQPzusv91eHAoP+QWmxy3uc1vph5Cd+dvGyz
	B3TtHDihsHsU4d4m+gcJZzOmIs7f37k46HMXueusT7E7znnwnJ2C2IDhBsQJVcpL
	SIKsifnzFi6WNysU3E0sHXZZfT4qA9aFOJdhUEC7w6qaQI3EfoBOhd+Sy3m58bUz
	dLVgj5evrLytsG0zLRNFvqirEa8NRb0lQhiZmLLWZjePv5oYPgCybAFuAmw8yfpe
	r45zoHa/KmADNQTqvGCNintlQ+2ezlWavmPeGDYA1jxIRGZZSQQi5jdio0B9ymJb
	zWDV0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbhne3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:56:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso10594318a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348579; x=1777953379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=;
        b=hm2SdUMafWMjLa+L10VlpMBJxMqUveAPNr1+jAtuyidHmw/UydhBWrrcnB6ezqtZlj
         s/InLUk7BfRN5GlwP3npnn1ZUJBsEJ3MHyaYHkwkkMsyAItxGvbz4CJ8K56fbs7vxaoq
         0LYODQuqnZbEUgnUvAt3YfaVoFDl21ciZpgma5H5nKntauJs8MWYpYPvuuvMFrkLbytr
         8naqGF9EA8h01AI+eMrBVJ0AADjSl0Xr0HYjdgQtvIJBzwXkTmFvpFeSvum3siilGb8i
         bY2mWc/LK/OeAUQG9uElC6EPwcOTcXK4XNipmTjsCSGI3xI2vylPNO1ZS0dxS3dH+RiQ
         VYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348579; x=1777953379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=;
        b=Vux5qXjOxPbRPLawZ/4TRCFChTllFxlxClTUVmLLsdqdHso0cQHuh2rNh4GIKdbpeK
         0DKJMCosDs0LoxQXZ5GbVlYCv6P/nvuBuekvZ4levYwzaEoVEaKDtAwnb32y/Nle1V6X
         jTTt8PPyKGHQTJpLAE7GJn9xB+bNrubEWTx5b7Ib/dCBwiEacFyOkqHJpIRR1KJf5VSG
         LuFkBSRLiXYSlZQbLLA6dWSncSJBx3CHXByshnwDkbaztp3Xy/x+IJdNnLJpxzK5CXz0
         BlelWFr+9+k6Q1doYKY9lAwn0+op9eCAL5i223vn83Exq5OBZUUzwqgMqPSQhv5Kmi/R
         68Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+EU3ZgKFS+Qhvt+y9i/KKMyLkFy0OAV5JeYpKxh6lbcQB9mXj0DgLCVeNY+2byRvSecNJfxN/jR110C1HB@vger.kernel.org
X-Gm-Message-State: AOJu0YyWA85bWPE4LAsC4q/Twl/R2lkXnxCStSHLG9hfEp3KokubBxQX
	hmdVRDrepKQBP2J4bQ58KtopnRlHP0voiMA3Usn1Pd+HAFXZ+myKUHUmUonCMCz2WSCmgbqzM5Z
	ylbKFyhNGkPgPT/njm0Hp5ZJ84KGMmA4Xbi5gnVVSAKK83FTPEksDkMM2v/hwUmMYTxKc
X-Gm-Gg: AeBDiesV13EKhCpd9mF20yihR3ADtFXswcm8k5RCP3mJ8dK9LfS9pZHNU/Wj4+dNfzr
	GbY0GPaha0A5rBmehwAs9Ub4BFByQzDkgjcAl/05hAnfemCZLzlG6xGC6HrROIc1/8UkwpQfd66
	iIOgQa8y7W/Ex7cv3hkDXCyM12iPw3j+0+AwXAQgKglcbKNxypa6t1qzjasoRkY6qG1MTQKLSTd
	+hJqQHPaxEnfVFvLITPuL9g7ER9IWotC0FXyPVD07EdY73w8qGzCPMripv5lChHF4+sLzPKubzK
	qD1Zpbe/UwMZlH0On2a54o1qv0JwEwz9cypXwD9UqW0K/+pDvlpla9D8WlY3wXUsiytVpErPGwo
	+/RmSPoHNzV/VFL+HGx0FAO6He3+oCnHdYAwkr1OSzJC/3++xM3C1V94fEqZk10mAig==
X-Received: by 2002:a17:90b:56ce:b0:35f:bf23:bd78 with SMTP id 98e67ed59e1d1-3649200cf1amr1423518a91.16.1777348579159;
        Mon, 27 Apr 2026 20:56:19 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:35f:bf23:bd78 with SMTP id 98e67ed59e1d1-3649200cf1amr1423485a91.16.1777348578663;
        Mon, 27 Apr 2026 20:56:18 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:18 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:09 +0530
Subject: [PATCH v3 03/12] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-3-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=4228;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=cziP+P95lYoSiLg+5MW5xEwescL6vgvBBGLLAvVvoEY=;
 b=bi9dRaFIrDbQfuqXmL+MFazz4osr3HdG1aIehLgn/X1+wUWJ9VgQZej3uqWelBzjJUuiqdOPD
 sVBIXrgUGn9AkOPJvfaTFhWSfp7j1c9usI9diJ76QnGnbEwsUpL7PWl
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: HjJiBRfgNQey8FPWm1v5ejg-ujxx0K-K
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f02fe3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rZQGDrx4aKZhb0zF23kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: HjJiBRfgNQey8FPWm1v5ejg-ujxx0K-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX2WtLdQgkbAHw
 JRMCeSfcKyd+m1fb8XwC7u0wXnwMUVS8PS8l295M9GHLvdsa42929jiAZ2vStt7rOggRWmx01H6
 kO67CZ3a1MpCsIeUIIiAHo5+kPdr64Et4G6PzPaC+EuMakwPcof6f7afK8606OQg0emJxtap8tC
 r6W8tt55jQgXU53i+JV/AwCR/ukWDF2rcOvI8UTNg4Sdrsm8Aw9bO8vzWqSXjO+FifzApm7vWq5
 wqDATnd1cQnListBjUraygYJC+G6NsV7NdF2p9rEcmvZAoJ9QHpptQDqbGZTgtls/PWWN9dtFzZ
 zxcEzf2QJO6Zeczbiy62noBhB8ANzJQO7vzL7674wCn6eUE4OJsYGaxZnK/lvZ5SAu0Jhxy8vLj
 Zar4CNLu5VDKG1fp8UlziHh7jC11lGGCJdLzNguZ5jIDO6rHcxFhnWcF1UAUTHQa+bFIOHXwUUN
 m51icmV36G891gIvGIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033
X-Rspamd-Queue-Id: 3DC4D47D3D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104855-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
assosiated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile       |  4 ++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 +++++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..6f4052b98491 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+
+ifdef CONFIG_VIDEO_QCOM_IRIS
+obj-y += iris_vpu_bus.o
+endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..15ba4d9c563e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = dev_get_drvdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void release_iris_vpu_bus_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = release_iris_vpu_bus_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", name);
+	dev_set_drvdata(dev, (void *)iommu_fid);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	int ret;
+
+	ret = bus_register(&iris_vpu_bus_type);
+	if (ret) {
+		pr_err("iris-vpu-bus registration failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..750e878e489f
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return NULL;
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


