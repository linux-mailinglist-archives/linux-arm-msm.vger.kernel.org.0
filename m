Return-Path: <linux-arm-msm+bounces-107842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCzLMrECB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:25:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D654E60C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD66D30237DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6070747D95C;
	Fri, 15 May 2026 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DE1yCxuz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IysSYmDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECF45BD57
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844215; cv=none; b=HV/7BJWvaRohR+Onx21bn47IlL7ZoGaouGqHxn2xdNnY8z6dyJJvxH1JK4ybnyA8tHaI5/TXBhBxe/u71dQrlUiiGZ0MOczV/Y9u6+ZWrG9ZT1P0Gzt5WI3jbIVkaAHgDZtvdra0KrNvGd2Qrz48Tv6Uu677SNqYBGFbqyCXp9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844215; c=relaxed/simple;
	bh=j0MWzPvgoLPGw6n8S8L+DpK+l56gsLOdQ6ijqkKlcaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lF0O+N0uyx43CzSvHzNFezNNyjfGIsIQuaATUMX5OOyZF3rTdOKHwNwz+3tSIderLBAnhnL/uNbDW1k7Fq7gIItIQ19vPH4082AgSpxo8nBN8d8eoZC0gT6EiiAYuJ2oe5ZpDDJ3MnwE9S5EP4atCQEJfwce+h2wryFf0P/OnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DE1yCxuz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IysSYmDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5AO8f1848051
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLJq5uY1ZDp7/ijaCB204uGa/x909UxX1syJvDVWjDE=; b=DE1yCxuzCQlmubmL
	V3AtreGvA5kmrCbctl4ONQd4Hv99zpbZdPhqDHAHzE7wWUOXpo6Mk4x3OttiUnox
	dOwt2riXsdhnFEKCIagHez2OfQWmbWzzHfM4JcNrvhjuNu9szp26eTrzByqtecwT
	Q+gCN0J/xeGpUBEXBXewdbszX+6lo6iBf4VT7XS1V4ymn+lup6l8hgTgIne2zErL
	8Oe7BqUQB91wp8KWA26cHyp1q1BNG/pcOY21jZqo5wsXgaYP6mp87TkdekxS/lRL
	Z4WANSVf+DZlE4KgBOolQ+Cu25kV+eIWeZdOGEkLdfqjfT8JiY5tavhuh1XrP1v5
	rBqhSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2yvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:23:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so6128525a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844212; x=1779449012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLJq5uY1ZDp7/ijaCB204uGa/x909UxX1syJvDVWjDE=;
        b=IysSYmDxUblNc2KKGwCTFlFkyunuKJ/WEVo+DyYWwEYuU2weCZbLL9jQflbMllMD3r
         NDhkMGuK0dQoHyQJNXBAoJNPEFsmzXc28UfrLiZghXV969F3nFkvQiLJm6biMsiQSqS/
         KHRwGg7vVaxXMNEwJNTcQ83yjsuPknoLC/+nugEPWjedgOc8tHDaLvtfqZThx/zKiJyv
         9Qhb+F4hY9cP0EJVV+aTJq8Rk0PGBteGfw7ZgCHs28BWnATvcuoj0YlPKlwHXdRWCKIX
         w3K61dpvNvgTTydpjBgD3q1k8CBvEpVNTRSMlQt5KdhRzq97nSWFPB6ig7Zfjj9kjFMW
         F+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844212; x=1779449012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLJq5uY1ZDp7/ijaCB204uGa/x909UxX1syJvDVWjDE=;
        b=S7LPZnu/kK9L2rOIL3L17X/htYoldiGcSGiHzVeC7yuh3SclnxVAZdr/vFgrBvAshM
         LAza4RFe1sBCu+kP9i6XHVu9j7G7lOdpBZ28WtEWdECQARoEMhjlJc8r+fnAPkiiRNBJ
         sSmGJv3CKVJy3RBaYJPboaYWf0RRPuORR5uFFcr0+oLZ8tQbVk+QFJCbTfDM0L25Vu7x
         cN05KMe5qIXSjZc7j9Ig0rFPuJm1PWWIxmb3elrTXCXAaAOOKtzalpjU5H6TU2ucNlOa
         1TWFOm/ECrHDnVhRVOeFRvdKaix9G+R8v6fCYvryEK/HWMN1dGwazsPm4YuytcrUEFQQ
         1hww==
X-Forwarded-Encrypted: i=1; AFNElJ8QqkHppEG2JM7mD/Glmld/pjt/EXPlcHu4dFvudbeKQScRlb1oGDea+Baf0Vn0EZHbKZrYggc7h6emuxX3@vger.kernel.org
X-Gm-Message-State: AOJu0YxCW/7TJRdam2+vVWa+OgyVuZZOTH0s6BDU6Yk54zD+WvKsg6/B
	fINcOIw4uLgtE425d1fxG11PdJl+zY7+cEG6F1NJ0Nla0j391iAnVT+js5Uy0PKkz0dG8ezFuIW
	brfHtIcUg3Llf2hWOAVpqMGJIXt5bzqr4rPaTMzQHPd1oovo3PJSgxrsW0EZotOmgMs5A
X-Gm-Gg: Acq92OFpFo/153/mxjBlzjhPQwBvKAequnouTU6txxbPwlSRMyQQFXlvPa632qAvvhB
	Dwl06lteFj4nnnz+bB7ir6CqpmVAybHk2xjvF7OwNzxJmV5c3XTgFgaR/dxZHRBgyO4A3IpUMPC
	2VliqWcD578GXmZcweXwsZxtS+ZEsGM2ps+lw/8kIGu98JVqamqz8RtKtYn1g/oOtgoVfmbE5q4
	wBdJrBt5xjjVwdvVa+tLeTGOt2Ujdc2EM5EP5Kbz+u3zTdNLgGjNUioHnZ6wdLOwaI4TmG/uQcp
	AomQd06cfpvZ+aiZja+/A5Fq4DyNUpTTZep2t0xyO3LoWvVJrRXs+UlOfYbVP4E6mQhV++ouqIu
	h1Di9ITXxup+vDEitqX9FyUGWlcRbICssN4/TYTq5GR+UWkl1katDB7o=
X-Received: by 2002:a17:90b:1f8c:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-369518b2048mr3565606a91.6.1778844211645;
        Fri, 15 May 2026 04:23:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8c:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-369518b2048mr3565574a91.6.1778844211141;
        Fri, 15 May 2026 04:23:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:16 +0530
Subject: [PATCH v6 01/14] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-1-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=5399;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=3STlk6tvEix+1H4qQRvpao3EQf0zCnIXrlwAJ17Tn1k=;
 b=i0pFyI/Xy2g3DshYTpkqE43Hm9w2B0URHMhKQCpyXlASJB5XLVb03c9Wv48D4C7dl75y83XIj
 YrGBuu+ZQt4B80BO6lFqEekM9fhjrybhqCUEmyv7XrCUx/ih/YU3Hbh
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070234 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6cGehGV22KE80QuxIsQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXya8P6lkqATw7
 j+96IWJnlQcyhJnQw+HY4thzXJXx5syuC9E5qieDbRQN3goDkF10Hwtkk3AI7VOUg1yYOYuNRA2
 RQJW9VSKBxIm/nxhEX3fIey22T+TylIkUvvZ4NxY6o0rDTwj9tfDG9veqyid+iuPJKCTzOVEnd4
 X5MUwE6luycL15ASuRuSzYLgDieONl162FI4g9kKPQlrzwQ9TixGZbMufrsqwcm0tA/9rcdLe+R
 Udi/Gpoj3C+uI1xM63XYtHdgJwMHhVKHb/oI1pJp2ZMALerQ9e1iorv0HnlD3qaahUmpvDDL9qS
 2x8DpZWuSZZSTVlGnGApmubI1lFhozAzMMQUEYdn/tXdb6mf8SglJembCjXCTmXXwOKywI2zkX1
 NdjHasec5px4G7WY6GS/9NruFHCNKWv05eoWX+3HVVf+8gZ1BathtmFCGkR4SmTZNN5iL8mu3E1
 HNFms+WRyfpzii9b8/g==
X-Proofpoint-ORIG-GUID: niChrd2Ms9jXGk4sL6KN0AFdxm4kL0jz
X-Proofpoint-GUID: niChrd2Ms9jXGk4sL6KN0AFdxm4kL0jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115
X-Rspamd-Queue-Id: 6D4D654E60C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107842-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 MAINTAINERS                                     |  1 +
 drivers/media/platform/qcom/iris/Kconfig        |  4 ++
 drivers/media/platform/qcom/iris/Makefile       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 ++++++++++
 5 files changed, 92 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63389fea5d15..c53d94d7b153 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22017,6 +22017,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
+F:	include/linux/iris_vpu_bus.h
 
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index af78a1775937..76c9fcd253df 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_IRIS_VPU_BUS
+        bool
+
 config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
@@ -5,6 +8,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER
         select QCOM_SCM
+        select QCOM_IRIS_VPU_BUS
         select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..6deadd531c8e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -30,3 +30,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..e3327b227332
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = (const u32 *)dev_get_platdata(dev);
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
+static void iris_vpu_bus_release_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_vpu_bus_release_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->platform_data = (void *)iommu_fid;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(iris_vpu_bus_create_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..62af9ee7e288
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
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *iris_vpu_bus_create_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


