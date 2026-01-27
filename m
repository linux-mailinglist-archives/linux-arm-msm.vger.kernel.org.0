Return-Path: <linux-arm-msm+bounces-90764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFL/BhmveGlasAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:27:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BC94531
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F90C3097775
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CBC34DB67;
	Tue, 27 Jan 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERYD639x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYJ/i3Sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B7334D910
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516594; cv=none; b=E45TpA/IptwskTo6cC761ev8BQAF8r8aPFIUqdZr31qjrPKNBLvqFlqC/IMvPFi7h3VZuxvzr06I2eoGSUdtVYHbcmIRWSts0fYILgo3Jpqg98RsmNWdQiLqQsgk8rrKUdVqeVG/yjvQ7AEoAZt8uDosrXlGdcSSQ891E2cxnHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516594; c=relaxed/simple;
	bh=d0mivciHY9AxCx6/jQ9UUdYzV7StCQnyxCBFMqtokCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJUM8q9aM+BfQzUoB5ZVTBIlI5rwq1/SrP/ODjq2weffT+62rSjU3WIgRUVjTfcWnHWJ6Lb5wUxS5EIPw88D80QZRtGsBf9inVX2lf6WPAIdINKmLJCDNkC4JR72eVBNuKkiEjc7XEE/Zokpr80MJNGyzjeHEaiJUuUnRmtYDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERYD639x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYJ/i3Sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7QGNo658432
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XXLH2/gt1UFb03g8YATYc4EauWQ9zsYRjVX1F1y4ss=; b=ERYD639x8juQXj9Q
	DfN2Q7wXk0Bv3gZuvNvqh/k3BfLi6eLboyWlxRSDmrYO7xpWoxeSZZRYrOJfwmCI
	d3beY/DOvRjs89X5qZoXNeX5qUfrGl490bkW+L0/HShRiKMr79kU7YnGgwk8hcr6
	izs32exdnhn7RbS08r1S5LKgAAry0r+87xJ557Y0X032xq3mqRnsBFK5frroi16f
	24Kuy1+fjmcOHrx7EWXikExAJLAWhEZaWuDugAtS3SRjO3WQVp1xlxl1bI/ruu4Q
	AOroJmTHo9SAdkQ2QruQjeX9WAgWbbg4j7OMvdghA2m6sjIXf1x/ciObMZRSJwAt
	rqYL9Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9111-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:23:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f55092e3fdso11871224137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516590; x=1770121390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XXLH2/gt1UFb03g8YATYc4EauWQ9zsYRjVX1F1y4ss=;
        b=QYJ/i3SbbNh6d3hlrSm3BQDwOsAKQJb62FPLrBLgg6WpCbUHMvmGm/pPcZ/L28AAsM
         AdYr0UUsN9M/NDFTd1VKcJNt57gElnk3aTeHP83oDkbA27vdysAlr5ciiBF2HOFw661B
         kjCswpDO3Y0HbQHTbcKg1GijXOzBNn5ur+xCMZRphpUoEhqVVDBBJj3D6df9Jf1h+WbL
         Ju6uv9B6qlWNKccstFIxyYTH0oAPz1j7j0ispYnoknX9dRQ9EWVJtWC3m3hyCe048rYn
         8GocGBw9Cny6sWXGmEgMDPE1jByuldT3pdpuphQXZTG8I2DtLk5NZ6+yTXcvVvYfBYpQ
         vztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516590; x=1770121390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XXLH2/gt1UFb03g8YATYc4EauWQ9zsYRjVX1F1y4ss=;
        b=vyagqU7jdM9i+pvByBIggeD/a3akG+tpLloWJEl1TzqNR9M6KNDCvkUDttipHTTrvb
         9SynAWUECj04g2TFetW9KSv4L476DUWZoOlCZvC0wgBu8B8iQKLzdrB/nLmwOqZ1Am3A
         QU9GGrSoenjYpVBymPcVkObmuWcbxPElw0jLrVYzdwDRfTbZ2MZ0kOxKiF363id/gTk1
         jK1ONqb1GqXWuMYD1+HiPomW5tkW6lQPRlgQxHBfRX0gsW9OutWBcSsAQtWqztYqr7pV
         kfFA0anTeViykD/FE5eFFPwNlht9tg+JWocdObUR/4EtsvA0YJz/s4R6DPpeRKOyLj/q
         LOGw==
X-Forwarded-Encrypted: i=1; AJvYcCVUmMb+Vg9/pyuJPn/dxSV3AKH5Ae4b1u+SRe/2HqcuYamTMQPMNIEY3xuep2hlGl71ytibtowMAv2MPlYH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aR3h6UgI5zew16PH8IJ1iWmDM3WBkWOviPg+kIJIm9tfamUy
	2QqIaAheG2PVAPLmS8E8CkCqzLkkd+J0OnXeXoupG3rDhGhw3t9BKdZsGeAb59O9Awsv0y/iGnD
	Odo8OoXqrzWQMZbu4C7Cq1TxWs4Lnprx8yzdf1z5ZTGPvJ+HWLpO7+3TEwZyNbbmqssxc
X-Gm-Gg: AZuq6aIxoy5TSQj47mUk6LZpxza/NsDs8SiKYL+8W8VxCLGcOb8lW3MdThwz5Lpy7zE
	Z11TcpEm+wwvHSYu+YVxxm4ckAo+TafbQL6E1r0mLz1xI8CXlohjdega3ORclDprJO9xb87XL+S
	8HUNv36uIX11I5aIipwssUiERTLE0Vgi20aEfohdSVBnhH23r1ncc39XXPU2HqU4u/XJSUB80GF
	x2PydQygGdwkfiuhMdndKu4/JjxKe3D52dQOutnMzh2HzcOAg+9WqH4QWaJ3EM7oxyWE846Uy8z
	cs3ThnSJMumUO0GHGKMNB3S+fItvHsjG/36wR4U75dp2M3QC+8rVYdUpdwMyWXiKI0exZS5H0zT
	3HDtgQNJSO5og5fnTm7ZoB6chfdQyREK3cvZ1Fa/Q2lPCMfAgCOZwfi8SkBmPUZ6NfHNTuDggsy
	Em3vVfGxKPnYSqc/DUZ29sdaA=
X-Received: by 2002:a05:6102:a47:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f7237dff87mr699938137.13.1769516589964;
        Tue, 27 Jan 2026 04:23:09 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f7237dff87mr699920137.13.1769516589478;
        Tue, 27 Jan 2026 04:23:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:23:02 +0200
Subject: [PATCH v3 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d0mivciHY9AxCx6/jQ9UUdYzV7StCQnyxCBFMqtokCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpeK4mQ4BC+9XHFrK2cB3Pmp/vlistwOWiV0NB7
 Ki02qFZMnKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXiuJgAKCRCLPIo+Aiko
 1TF8B/wMn7ddnz9WuVh3rs4q+ecLjjo9VGghK73huibFP3NkTX2uKUEr2YUj/bXGcPA7CAgMpfP
 MBB1gOi4D9tk8jlMXhLq21JCcJo7bZOmTBUHjWr6tMZvvl3i5Tpkfs6Oqti0aoISvA07k0g0lmg
 JCEfBWm6zb3Ed3Y/3sOCqKV4A4Msw19qBRtZPJibNv2+iPDakBYXJ/NZUKWq3ZLTYEOEj2rFqZ4
 6R6NX5ZTV1tL/4U1enxPFgP7+4Gu64xDJ+dfBcvRTadIo/5gK4iakzXxE1jhjW1he17MHmS/KCZ
 hc/RP+QSMLBhPzDGtYWV7xwGzPeq32CEq2mha7iN/1axrtpN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: s5KeXC3j1Gt0aXEvsN0gDSzwZzE9hnWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfXxntHjKGfuJDj
 6kWZbkjCK3cVD2fFTIimM5rsDTFyIqJMa+wn/nEBeFhHPNWleMslX9fK2akZwAObxHCCbNTUido
 314QZ8t/2Lgt4G2adLzzLby6jMfkf0eR6bNtTTaiPOuttn6L2GlaV7OAg+BnYY0chLed2fqX3if
 Ar6a1OWZ9EH423yBZB2s+6NfhfoJtRH7C+EjnmzbqqHeDJbtfBUF1IIRFhVblShKTw5VbmV+VsF
 OA0P6ymjAiFHYXVFVU8OeIyhA5ELELjfIZuZ07YljHTUEElQWypIuJ7M1qow4H/RcgJ5EfD2Dpv
 hMeHNrGs1kNhoVGO0K6ZMwAtJk6nt8zMadtCkWTZ9JLrbDCS5hdwQqnRI6Lf6cCNm/O3hlmcP7a
 PlWwoGhVRX7b/QIPIqxEka8y3I8DsJz46UHYGYHjxTRGId87qvGTs+/dIdc9Nu5GMoJO5n4IgJX
 t1ywEgBj/ZRJDARtmag==
X-Proofpoint-GUID: s5KeXC3j1Gt0aXEvsN0gDSzwZzE9hnWO
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978ae2e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270101
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90764-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D0BC94531
X-Rspamd-Action: no action

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


