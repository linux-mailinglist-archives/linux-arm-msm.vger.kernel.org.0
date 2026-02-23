Return-Path: <linux-arm-msm+bounces-93773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNIzNyOnnGksJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:14:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4413917C242
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B23D31AA126
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5436136A03E;
	Mon, 23 Feb 2026 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pY7bv8Ly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQZWNtlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870436AB47
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873773; cv=none; b=u0RW503gmNqBd/hXu2IAQnzIxRlgyylArViA6S6YgEF5rwloQ9RWH1OhWxzzTa7NnUoemwpB0+yKlwUSi0gGrnv7CVQfDZnFmA7uTgRk756FFojUNj22qzyly66R4B8xPKTDxRaX0r/k+QOLBbZCB3NAZJlM3ExYumLi6Ot5OiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873773; c=relaxed/simple;
	bh=Zq6CFw1VSCQehea9a6rhVdMON7B8W0MmxMsOW3uKtjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQHaFBN6zeCepV0TS8TwcBZ8W0S4wWPaQXVCgmDUrKXOpa/1581gboAbD7yCPq6gGOEpeSVyH8ZnN2QT4hSPIP786Nk4fE+OzlpCDqXuew4JI6mezYYemv8q1KMXHfNZlk1uf5bt5MlWxJMTi+18O2X7CFZ0+xnu193CPKjEuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pY7bv8Ly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQZWNtlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2lA33151910
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Clm+7k+qHiGBFSKNSFyBJAE1bBx37+hOGzIhiR9y8j8=; b=pY7bv8LyTytdTBwx
	FdDz8F8YAh21njbNhRKTOgB6ASxCA5j+1P+5Hd7dROPVgXLegJv7Y4OZ4Y75jTbb
	691M3GLS52UkNTPuNK+tUSt/OKn6RK5YhR5tttqrXS7/2YX2/ALYN1GNDIX14Gtp
	8y7wyRBGxNHBt6kh3siFZC7okCWsmbAwfQperSk6+9HOwOinOewBnSjq0AWzPHTk
	B2nbzYjoGlicQRzCFR309S838vxt/jYNyIMa799i1USDELzpQ0+wjR4gw5K6IR11
	8yB4K12mYKvRwhlmp1eM0wE939875N4A4S9fjicTdaReX86Oix7iJbCfjgBqAIpx
	/ASXPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89bwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:09:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8c273332cso438414465ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873770; x=1772478570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Clm+7k+qHiGBFSKNSFyBJAE1bBx37+hOGzIhiR9y8j8=;
        b=dQZWNtlNeBG1HAFiRGyA1Zu3NqjqggnEpojM2uMuUapEP3wDLHgHEn6s80AvjnqhaZ
         kiwSnfu9Lgbi4cBQkCr89Mzup5PdonVp9tG4rTlI91CM5C2OZPg1EvkcKFhnOtNSzwQ8
         mcUVEGwwq3ns3JdzNC1WlTZRDHCxEneT2IQeGZ1T+EcOZJCnAXyARhvNly+kZAWpEiJl
         g2uaqAoZ5oARPnd+lfsWywqL4BPzjbfgvM6NRygTloubspqhEKIJJ4LNTbJrQbHoPiAg
         Jjs3bwD0QqZUy676J8d37NNfNOBILrnJ0njI6ztwV2k5/LrZjsR9+g9ZkmRIMvnY5BL7
         kDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873770; x=1772478570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Clm+7k+qHiGBFSKNSFyBJAE1bBx37+hOGzIhiR9y8j8=;
        b=amWcNqxbI2rEIiSgE94ymCSu263vj+pSzaQ7YcctdyJG7qxcVf8GBr9aZ9b0gzBsOt
         psl72g2fzvwZlhLPw+0d+mI/VZ2vgR20KvO+QUVfjJ2pKWzCC8cPd7+pux0jVA3XwEbI
         bQBhVK+FjErabouxQXebBnEbjea9IRWq5GSvk6xuVy9WtEYaoYPABv9Gp/AhsH/pvYAc
         fE+PzZFNcCx3d5j2GoSaQjkhnyMx2fYM2ojKQ+2ieeGcnpfkohjj4T7BNpQcf1aNt/Ci
         fSrjtnI8YNosmw9JADC9AD4VWL8hkGLKe4w72eW1LU0//JGrSb2gKj2p5DvuaHysCuaj
         9D2g==
X-Forwarded-Encrypted: i=1; AJvYcCVH/txVK76shpKlhKW/oSkewcRXIevnNt+KE2SH9MV2HQ7Law4QGE2yPm2Re4dOBsVPCHg/0G2uvBdgUQyi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywts8tj2TgnlenZZ2QmKWf4VNZI0oSnPuQoFNu0KInRoZ9oPAFm
	+Jsha9dZvMR+MZBCVaFUaX6Qm/G2QHbjgdDzpZGJn5KxpGgik1j8BxuR1ajXHNWzjRvBFn5+v+u
	lL8x1Zt/M6F/srHctCvs0TVXTkIwqZOc2kfnl+TZr84QQUyH0Zg8Plnhu8ZQIffsxHqBt
X-Gm-Gg: ATEYQzyKp1qOs6oa2IHm21D8oKrWq1Qc551Melds8gjAl18P4FIcWqL1SFyY2jbnHWl
	9WCbUwxHWNoDUfdsozI2In6P+yp6et+7ocyaLOYCRvSImjjz+MeiFQeNTH9TIUZLd489VJuNSJg
	vTRT6L4JcP6GnmxTS6XKqQzcgCDWZOTo5n9msyfEwlFXyxq6io6UMaTh8fWsUbXViAHAN3Ko0Ae
	9IT1wucy6kYlG9OaMUsx4OkVLzvsZ6JKlCpP00qPx1YFQP94YecpJ30SbCSUr9kRdd+ltBW5nMz
	50t+oIMss3gFzTcbjGa5q8M0hq+xx+MshPFenH9d7kCyf72wx/ltclH7WO/SXMaGsCs0GLna44G
	A3AY6oS3ihOZPo8UPn0HK079qelkIBJ0wUX3nIeJFRhdE4GJz49MDiQ==
X-Received: by 2002:a17:902:ef48:b0:2a9:4c2:e47 with SMTP id d9443c01a7336-2ad7458617fmr91702805ad.56.1771873769445;
        Mon, 23 Feb 2026 11:09:29 -0800 (PST)
X-Received: by 2002:a17:902:ef48:b0:2a9:4c2:e47 with SMTP id d9443c01a7336-2ad7458617fmr91702545ad.56.1771873768877;
        Mon, 23 Feb 2026 11:09:28 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:09:28 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:55 +0530
Subject: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=8196;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Zq6CFw1VSCQehea9a6rhVdMON7B8W0MmxMsOW3uKtjQ=;
 b=rXPbVMVVUoLnQhK6G4B08gOscy7gxC3JRP2zb2W8d74yPv902ZtG45ZW6lWshlXckS4YvBWtR
 LzYqLzgQ+iIAwp100NKsDuMgQ4wgN58wj+seVZlEx1YacUgesqDzglm
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX9AibpG7JyKf8
 fhGvFE4xgwguVDjfPX1cBl6MU3T6Kp8BzOKrfGqPB0uVOEf/N8Qtc4SdSrpOjFM7jIFaUsXOzsl
 bXUlpmjlVRD2i6Gtu4jnnEDWhF7ox+u0wyWZzeOVme6UN7fg0gsnjq/CBrkzb+gLtbFTZds+4L5
 3hg1HB2YVT4xu04tVy4IVcDHPMUS366fpZEaA5K3BbhVNdslS9bgGci2XBqv+uOn9LnDjawAZEQ
 PTKxQQYbg28+vTi2GbJD2NHKdWbwHW0YFjOvht6YqLMye82Jj1P5bLWIPwbQ6i1JwT0baqg67Sr
 j/J0J2aRpLF9o+6iaVNnLAo47TeYyYl4gwLlKxnBxA8MB88BC36fJL65/JoZ8Dlk1F98eZ+J987
 b/L6Q+ZvTvoFnnFymb/HM3+aEBAFh+pHvbJQDTdO7n4Jm2wiS7SzBbClGspL9mkgbHwwwanS0iQ
 9iD8SmhUo7nSKSnqiww==
X-Proofpoint-GUID: Gh6M6HHEoLxy2A_iBjP7HMGNYF2ts0B9
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699ca5ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WUJy9f6djnNETMKr9A4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Gh6M6HHEoLxy2A_iBjP7HMGNYF2ts0B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93773-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4413917C242
X-Rspamd-Action: no action

Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
integrated in the DRM accel subsystem.

The new docs introduce QDA as a DRM/accel-based implementation of
Hexagon DSP offload that is intended as a modern alternative to the
legacy FastRPC driver in drivers/misc. The text describes the driver
motivation, high-level architecture and interaction with IOMMU context
banks, GEM-based buffer management and the RPMsg transport.

The user-space facing section documents the main QDA IOCTLs used to
establish DSP sessions, manage GEM buffer objects and invoke remote
procedures using the FastRPC protocol, along with a typical lifecycle
example for applications.

Finally, the driver is wired into the Compute Accelerators
documentation index under Documentation/accel, and a brief debugging
section shows how to enable dynamic debug for the QDA implementation.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/accel/index.rst     |   1 +
 Documentation/accel/qda/index.rst |  14 +++++
 Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..5901ea7f784c 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,4 +10,5 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   qda/index
    rocket/index
diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
new file mode 100644
index 000000000000..bce188f21117
--- /dev/null
+++ b/Documentation/accel/qda/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==============================
+ accel/qda Qualcomm DSP Driver
+==============================
+
+The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
+Signal Processors) within the DRM accelerator framework. It serves as a modern
+replacement for the legacy FastRPC driver, offering improved resource management
+and standard subsystem integration.
+
+.. toctree::
+
+   qda
diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
new file mode 100644
index 000000000000..742159841b95
--- /dev/null
+++ b/Documentation/accel/qda/qda.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==================================
+Qualcomm Hexagon DSP (QDA) Driver
+==================================
+
+Introduction
+============
+
+The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
+accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
+interface for user-space applications to offload computational tasks ranging
+from audio processing and sensor offload to computer vision and AI
+inference to the Hexagon DSPs found on Qualcomm SoCs.
+
+This driver is designed to align with the Linux kernel's modern **Compute
+Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
+alternative to the legacy FastRPC driver in `drivers/misc/`, offering
+improved resource management and better integration with standard kernel
+subsystems.
+
+Motivation
+==========
+
+The existing FastRPC implementation in the kernel utilizes a custom character
+device and lacks integration with modern kernel memory management frameworks.
+The QDA driver addresses these limitations by:
+
+1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
+    management, job submission, and synchronization.
+2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
+    including DMA-BUF import/export capabilities.
+3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
+    isolation between different DSP user sessions.
+
+Key Features
+============
+
+*   **Standard Accelerator Interface**: Exposes a standard character device
+    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
+*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
+    GDSP) via a single driver architecture.
+*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
+    (FastRPC) protocol for communication between the application processor
+    and DSP.
+*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
+    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
+*   **Modular Design**: Clean separation between the core DRM logic, the memory
+    manager, and the RPMsg-based transport layer.
+
+Architecture
+============
+
+The QDA driver is composed of several modular components:
+
+1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
+    and bridges the driver with the DRM accelerator subsystem.
+2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
+    layer that handles IOMMU context banks. It supports pluggable backends
+    (such as DMA-coherent) to adapt to different SoC memory architectures.
+3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
+
+    * **`qda_gem`**: Core GEM object management, including allocation, mmap
+      operations, and buffer lifecycle management.
+    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
+      enabling seamless buffer sharing with other kernel subsystems.
+
+4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
+    to handle low-level message passing with the DSP firmware.
+5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
+    enumerate and manage the specific compute context banks defined in the
+    device tree.
+6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
+    marshalling arguments and handling remote invocations.
+
+User-Space API
+==============
+
+The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
+to be familiar to existing FastRPC users while adhering to DRM standards.
+
+*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
+    and capabilities.
+*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
+    domain.
+*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.
+*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
+    execution unit).
+*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
+*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
+*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
+    DSP's virtual address space.
+
+Usage Example
+=============
+
+A typical lifecycle for a user-space application:
+
+1.  **Discovery**: Open `/dev/accel/accel*` and check
+    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
+    compute workloads).
+2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
+    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
+3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
+    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
+4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
+    functions on the DSP.
+5.  **Cleanup**: Close file descriptors to automatically release resources and
+    detach the session.
+
+Internal Implementation
+=======================
+
+Memory Management
+-----------------
+The driver's memory manager creates virtual "IOMMU devices" that map to
+hardware context banks. This allows the driver to manage multiple isolated
+address spaces. The implementation currently uses a **DMA-coherent backend**
+to ensure data consistency between the CPU and DSP without manual cache
+maintenance in most cases.
+
+Debugging
+=========
+The driver includes extensive dynamic debug support. Enable it via the
+kernel's dynamic debug control:
+
+.. code-block:: bash
+
+    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control

-- 
2.34.1


