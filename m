Return-Path: <linux-arm-msm+bounces-118198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HJh5JFq5UGon4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:20:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D469738F74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:20:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=irvF8Mfa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bVBgYIOG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC07E312D7B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ED63DCD8B;
	Fri, 10 Jul 2026 09:05:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2448A3DB31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674302; cv=none; b=hOf9O9e+HyaOibpjoa70RlkwZX06FKbC5HJg+dvKp24KmtlwmBERVxkws9IKe1N7ccUjO7GwEJokolHl8RUySmy6NPoC3SQdj5n4cwPj30YaZghC7+kYfItCICjRC3pQZnEsyAz/NiTi5kVma9la2MsaY9cbk0lmA5sjt2AfDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674302; c=relaxed/simple;
	bh=QBbw+M6NM/7xN/mb/n4EhswLHY92P8G06BHphqlIqXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZAt4Bqi2WisJR5s4PppAb6YqGvHK8VR5LBRIPdwzvf2oTkTGlovy75mLDJtMreHYQAgA+p9uRqE1kSuroXfVbaski+kA6lmibT9p14Kd1N46bmRRszs2b6jevwX2UESJo6lorp1fNXq1PKK+LWwZVfBFY1Y0jZ9SZkBuvczubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irvF8Mfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVBgYIOG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dbXU040880
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=; b=irvF8MfaPyLrVmL6
	M+CIBFXO5yeirklARUCZDXTEV6g6ouCgEvsMrvecDmv2fuHYF87HhvhWG354WAcE
	ggjegVmBklfvX/KO1Dw80cTdXKCy3ITk1+COfVBsNv49dI8UnA5HvIaRMOayOat9
	9zXpJ9Ngj/aQVo/oUdU3Jy3mCsEMwxOIntmq//yI/qGYhN2d7MQ95PVxMa72caYH
	k8uC4wsfUOEtTsrvHf7WpNN4m+aRvTOVh26MXbdiRnuoIVkg2xjN34Sqj/jZOzSS
	gN88zk48iHQchDsngOTdLgn54H8Wy+CAaBLgdC7I9xKXKdApXeFcL+kJnvhkYDYS
	7ljBqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5kpuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so6774361cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674298; x=1784279098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=;
        b=bVBgYIOG321ZEjaVPvSyq62iCy7sc4GLVP6A1/3zUq7k8gVEFn01mKPVdpx2bwv5u3
         7wkuujmxc4hdarqnBm33lRI2U3YiIpqjPNbPhFOLL8mRO16kQ7QrpkensCsJcoYVU6Z7
         5Q/b6fauXiRgvs21bxKf0n+0l+QsXDOQk/dFJqlo2PDr0RQNIZt5o5nv+Bl/0PbgawmJ
         OkEQfnQ2vMNfgiHaI5DV2EaqV1qAZ8RQqcuDvFd4RDPP3oGjc3LnwArS9s4KImkZWr6S
         b/eGg6YCRAAFDGINdlqXzEtyOcURDk3C92dIqigVgUwqLHEP09ltqAvkd0zJ3KYFRWuZ
         9z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674298; x=1784279098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=;
        b=c6tBSiIArYgZn8KF6LIr83b/LoWZARaMXVm+p3D1sjVJJz+YM7E3WkLt/JAqgRSFBh
         rDQUtNytp7JhebnmkrWqqEorhBuhbueI4zZTifbfgybxOv17X4ZaOpqrWaRKtumqbMut
         wtJxu7y1zY6joxmpQMz+KF+GE7ZbkZ4QAHy5OzfmwxlcGFB2sdOf0DYDJ0/xYsKR/oKa
         d1Y0aQ2iwbdNx49HRU7OIIKiDH/RProIDzlugxQZVKr/virZF4SUY35ZofNCLu435nhx
         5JyIvE9w9wB4cI0L9EhNADbkY//SVncpIA34TN7ye7As99xjHc1EEXeLnic5K9aE3f/2
         h37Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro7ar8r4YZEAsGhgu1A7OkUn9EixZtz1CXV39C+4DVtEbeELnmBUfx2piB7X4YG5vco5z2+wF8yHRiRypNi@vger.kernel.org
X-Gm-Message-State: AOJu0YwLGaeTwGTzDApezl1FpqfqxZ3MghzG0J3pv23LM0pYWs+AiqQT
	dpk3CswobIAZ9INA/HZJ+bDjbsylK2a5OcED4M30YX0AtkDKgLKCY8BRT28rSZ6S2DB+kViTnyj
	XTaVclYH1jivxgl8AWuwzbzfzpwxPoabSJ/WruxNOS/N0luz2/GlydvuDFMzQnOT+MEI1
X-Gm-Gg: AfdE7ckyD0LycXwykV3rurHryVcY8z1FmkRwDHoFLwO8sOTcHimvmnk90tQihV/MKLC
	/BWbERe2r451w5q+0usPRhOakwRIgGdOYpudzbvCopQINpklHs8sPvrsw9aZEzkAFi8bfFiRXDq
	gXJiV1Jqg7F1U+JXIkrMx3DLtsjr1fjHEtDFR0GhGOo0bNKnI2taauZ7yL2zJL0V8CfNlLzCTUK
	ZsE+/iwM+ynGyW2faMbvB1Hm1jYqyWU4idUo/oqwhvhjRbls8d4n8EYAOtAYaHFxRR8xC2IqRTP
	Xm86xw22GPYlB0yxlDGxqR6Y5zUKaFYRtv+qDqq6EM1b+HIdQObkVLprcSSahnshDCnjjSgbfxY
	E87jqCLws9/lUAnVjRWO9epKNUz4A1FhTKy/n3ZANYOerpEB8IcLr9W9Q7m+WZKvfYm7//CtKd3
	mOYf05OqraQgBVAcaekp1JJaOs7dQYAy7x5bTnQ56NPNdqr3UGf9GhSxoME+M9HQ==
X-Received: by 2002:ac8:7d85:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-51c8b438a5cmr111756891cf.78.1783674298045;
        Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
X-Received: by 2002:ac8:7d85:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-51c8b438a5cmr111756501cf.78.1783674297528;
        Fri, 10 Jul 2026 02:04:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:48 +0200
Subject: [PATCH v4 2/7] media: qcom: camss: Add camss-params helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-2-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a50b5bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ELVW7ba-Z2avb-AJsJIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfXw65oA+F0jCH6
 P28IEJMaapH5e45sCGm8tcci4ir0lJqE47cek77L/JmZUylGgtZ8605MXE67ddTXoEO05sOXiBc
 /Vr+WYGaQYiYu0oBaJx3afUBhebPkHE=
X-Proofpoint-ORIG-GUID: jfVOFTQrG3H690Od1Gb-TBTfwHdvOpFX
X-Proofpoint-GUID: jfVOFTQrG3H690Od1Gb-TBTfwHdvOpFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfXxU9lTwMNS662
 /EIscj/1XcnAcqrUHq5RC1Rx52EbLsJPfV51db5C+05dP+Ro9+McUJXX3uwlaxbeeMeMAlS6mjD
 0ge9/8CWMa+wYIrxvrzXoO9bDZI9Ab22x46KVBfkXM7XEW6kv4ZPjfHhexlkeUdZ88BTp3Prov6
 v1SUm6+hC5/ad1m7ltmxqRhRxvd4RTdmOOmE0MXobtZHx23QnkoBHX5L+/3ubp7/Gb2L71zvWOk
 4P0jb6Zh2qglqPfakr9Uy6gENk1lOLFpxwkokIqGgmm8kJ+kHAKw3MmcC+Q0Lizm3ZQa6Tc9Dbg
 DBr+N/B8msHfMeCgn7EkkDISmlx5OVNBCXH5Tb1MoDvi3PkAgrs7WL+MrYaI7sHsIMeJf72LP59
 sUmCzQFBljnRXIPO8w1n3snQlkQuolF1VDZp0NHLlEMAzq/WYMFNeTjOfDFF/jOsOAFp848TtXy
 bOoyu+lY/2HHi1OHzcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118198-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D469738F74

Add V4L2 ISP parameter buffer validation helpers for CAMSS ISP drivers.
Provides buffer size validation and per-block type validation for the
extensible V4L2 ISP parameters buffer format.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile       |  1 +
 drivers/media/platform/qcom/camss/camss-params.c | 67 ++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-params.h | 62 ++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 0d133ddc08be088678994820c0ac64e761884611..5678621efb6780b67a043ec8a2e914cce02d9b98 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,5 +28,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-pipeline.o \
+		camss-params.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-params.c b/drivers/media/platform/qcom/camss/camss-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..ebb75a191d37551b4616a048ed39408f219d7daa
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-params.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-params.c
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-isp.h>
+
+#include "camss-params.h"
+
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv)
+{
+	const struct v4l2_isp_params_buffer *buf;
+	unsigned int remaining;
+	unsigned int offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(dev, vb,
+					v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD));
+	if (ret)
+		return ret;
+
+	buf = vb2_plane_vaddr(vb, 0);
+
+	ret = v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_handlers);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "params: version=%u data_size=%u\n", buf->version, buf->data_size);
+
+	remaining = buf->data_size;
+
+	while (remaining >= sizeof(struct v4l2_isp_params_block_header)) {
+		const union camss_isp_params_block *block =
+			(const union camss_isp_params_block *)&buf->data[offset];
+		u16 type  = block->header.type;
+		u32 bsize = block->header.size;
+
+		if (type < num_handlers && handlers[type])
+			handlers[type](priv, block);
+		else
+			dev_dbg(dev, "params: no handler for block type %u\n", type);
+
+		offset += bsize;
+		remaining -= bsize;
+	}
+
+	dev_dbg(dev, "params: buffer parsed successfully\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(camss_isp_params_apply);
+
+MODULE_DESCRIPTION("CAMSS ISP parameter buffer parser");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-params.h b/drivers/media/platform/qcom/camss/camss-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..058e3f158b42d39512301d412a983fb2f34dab21
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-params.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-params.h
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Wraps the upstream v4l2_isp_params_validate_buffer() validation and adds
+ * a dispatch layer: after validation each block is forwarded to a
+ * driver-supplied handler.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_PARAMS_H
+#define CAMSS_PARAMS_H
+
+#include <linux/types.h>
+#include <media/v4l2-isp.h>
+#include <uapi/linux/camss-config.h>
+
+#define CAMSS_ISP_PARAMS_FMT_INIT \
+	{ .fourcc = V4L2_META_FMT_QCOM_ISP_PARAMS, .depth = 8, .align = 0, .num_planes = 1 }
+
+#define CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY   (1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+
+struct device;
+struct vb2_buffer;
+struct camss_isp_fmt;
+
+union camss_isp_params_block {
+	struct v4l2_isp_params_block_header header;
+	struct camss_params_wb_gain         wb_gain;
+	struct camss_params_chroma_enhan   chroma_enhan;
+	struct camss_params_color_correct  color_correct;
+};
+
+typedef void (*camss_isp_params_handler_fn)(void *priv, const union camss_isp_params_block *block);
+
+/**
+ * camss_isp_params_apply - validate and dispatch a params buffer
+ *
+ * @dev:          device for error logging
+ * @vb:           the vb2 buffer (used for size validation)
+ * @type_info:    per-block-type validation info, indexed by block type
+ * @handlers:     per-block-type handlers, indexed by block type
+ * @num_handlers: number of entries in @type_info and @handlers
+ * @priv:         opaque pointer forwarded to each handler
+ *
+ * Calls v4l2_isp_params_validate_buffer_size(), then
+ * v4l2_isp_params_validate_buffer(), then walks the validated block stream
+ * dispatching each block to its handler.
+ *
+ * Returns 0 on success, negative errno on validation failure.
+ */
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv);
+
+#endif /* CAMSS_PARAMS_H */

-- 
2.34.1


