Return-Path: <linux-arm-msm+bounces-70029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91354B2E8E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 01:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C0B1CC4499
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206A42EB863;
	Wed, 20 Aug 2025 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZHEP+4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F502EAD0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733164; cv=none; b=u8n8y2E0rv0UpNxc94QGIIodG9A4PaNiraRv2QT49wP8G6uuSpC0EFQ9Wswu3vFpU0l8GB5dxMnAh7vogm5B/zoyxTTGCwAN5P5O+KY+ZS0Csfyijw1Msf/yUHRg3O9jJQ9YlsZVBFKF5AT0oEzOoXysjPy7uSv/AU/o/PUqWAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733164; c=relaxed/simple;
	bh=qk0syZPjN26GV0OvM5j1GqyRmytI/+DM+x7GbfYpGks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLdvvHXstV3KTPpmVRYc7iF67g0anuggJ0TXJbwStiFYkfS+ysnhV2lnm6J6uUlgPZg/qtp/NvWXKq7xqiZ/unvag6ZPW6jUUk9mQD330b2Gz2fmc7KzzGS0JX+aeaXZprn9CKayDX/wK30E4Yuvur4/VbW/yWXBfPa44dMaG9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZHEP+4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KILUC5021262
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IT/Y57qPq4F4AgT5FsnG7qdoV203DyOX4ZKaC3Y1gA=; b=nZHEP+4WuQ1n9/To
	DnperLhDcVQg3zsU11f70y1SHGVIATCVcIhOCyRpo7FcKUH1ToXqbZx/8a7KahT+
	5/9xMkbcVTlpxkcoCI9lIO/+YCOeBSOxqIEpRdeE6ggo7RzBGErBI0holhwSDHfD
	4w5rnBz0240SZUygi1dwAtibNmWblnd6jB59p3cMvS5gdnw+CsvspD4EFdPRIpEX
	EevwSTSPvyeEr9937tKocXLJJbSDhhpwr3aW4eDOZBgM9ov2hDd4I4ojs7UB2l8+
	NkzoRtTXPToekumMtfJcBciHimg1YrbShp4BbadCO0ft4xPl6K0+XXrIhQfwZa9s
	UZwj+w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293cu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4716f9dad2so599132a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733160; x=1756337960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IT/Y57qPq4F4AgT5FsnG7qdoV203DyOX4ZKaC3Y1gA=;
        b=OD8F1dcPFQcTtugkhC7nIq2Tqf2nQBxX1tGrQb0VK/5HRr5/zJmmU1gxtQE1pgpY+j
         u4dM66ka8IDe09gia1CDAz88oZbzaFAsoqOKjesZSFxVYEagGbl+LLh3Uu292VH7919v
         KfsYf6dRSh/ffZZLpx2DQuGsXubhtG7I8a6qWhcsDH5Fqq2vR0mnWm6OB2v9dZLd10Bj
         Zfpwzm7Y8OjGIigHm8Y0AOG2lAYW6AzQIT9ClWrW3Y8jE5GWG90gamhT4jhVN78ZEq4d
         GglvuMTymtz0xnDktc9hCej3rLT6UopHyArnDEdXnj5hqzFCmjOWHvG1l0hYnKchyaP4
         7TrA==
X-Forwarded-Encrypted: i=1; AJvYcCV0R+9u5+t71kaaaLhQBlXwn1g5la590wObXmp4OBcbInp0Tifpd6mQarj00R3OPLlMAlvrX7T8f+1tq5+S@vger.kernel.org
X-Gm-Message-State: AOJu0Yye6pLg+xpRwBj+/aZAjyjpGPl2ecQjz5XBlm22VtuX8v8gKbHI
	Ns1cSyRtaGm2+6VkjF7bF+bgAcqKNZ6C2RZrY7xiE6Bg9WKF4/n2CNViDtzFDKmGenIJnRYx5YV
	Hzp82StPyMNpzYRE8ysmQ9Wp3qJ2WEjiVY7yWKjBnCb0cxjpKP9V6JE7/YpZoPMcFxCE=
X-Gm-Gg: ASbGncthSQJ5rJAiTV/87D/NL0gyEeqaabS64k6f+rPyNcPtkikRF0aTIXE6oqzFP7i
	KauiEJSfrDh9jSagCqM1mpNU4NPhB4iKKt5LX4HF5+R1R/sjNBrzBdss3RPayhK8r+82ybg0ZQC
	TdBXH7GjXPHrmwO4+KmmvxRWhEPPc0byYUM7Weqha5x+OUOHalavF3qCwBiBrXE3ijujDBaiMGG
	1gkAatRquPUZqUvQMUReB17Hih8dk84lcKmEyzW1ge1uPQCyPqsjK+FK38hhqlZw4nsO2Uk2e+G
	yJ6/SECXoTHZnBGlhTWoYJoUBa9ZVf0Y9RBzTuptgS8DlQYQs4QyQ/b7y4CnPeBfaZPKNBBLvSM
	U3UzRpDoZX3hljVYvxO5fzYw=
X-Received: by 2002:a05:6a20:5483:b0:240:1bdb:bed2 with SMTP id adf61e73a8af0-24330a03786mr380933637.32.1755733160300;
        Wed, 20 Aug 2025 16:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1pLKNzTWTbzCfpH9IHrJ+XiNqm6aCe9WthFIxWIMqQS6/C2skgzNs1xr86S69NG7mxyZlA==
X-Received: by 2002:a05:6a20:5483:b0:240:1bdb:bed2 with SMTP id adf61e73a8af0-24330a03786mr380900637.32.1755733159836;
        Wed, 20 Aug 2025 16:39:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:19 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:58 -0700
Subject: [PATCH v8 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-11-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: tsAL8ZkuzCkaIQdaUccHxw8LbgpH_kAk
X-Proofpoint-ORIG-GUID: tsAL8ZkuzCkaIQdaUccHxw8LbgpH_kAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+sv6BxIRElim
 G2isVfZM8jsqr+I8JaxCdVf4SgsGYc/25IhPAqB+OAytLC0LsXyniY9T4ROpFndviODKr7y+3xO
 DSGZ0Ucladqafq2okjeiFX5w12JBmSUmvAqCue+7u6TgcSOl9XjBPvejHquuta9x0ef92ahKFVm
 AoI8nofjXLeBbmpdPA+dsRVv+pxfQIM7pmFWWEFEPRkWVTnkwBiClXUrJfHX7KeWzvCfqiGVZh0
 5vg6+WUgd6z03s4IHHjIwZ0cHXl97Pg9FcCqSdZAI954v0KMUiM4QU270eQzODmRxXWGdhgJl/i
 OqDTtkg4cL1ezvU/TSbaDgw8MXW+5PxbPAvprgI3Ji8jfjqLtbLtduEELTKuC2fQr+axGA2E950
 ejd8Q9ElZdpaq3uupz4n+xqLz+CCqg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a65ca9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add documentation for the Qualcomm TEE driver.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 Documentation/tee/index.rst |  1 +
 Documentation/tee/qtee.rst  | 96 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 3 files changed, 98 insertions(+)

diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index 4be6e69d7837..62afb7ee9b52 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -11,6 +11,7 @@ TEE Subsystem
    op-tee
    amd-tee
    ts-tee
+   qtee
 
 .. only::  subproject and html
 
diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
new file mode 100644
index 000000000000..2fa2c1bf6384
--- /dev/null
+++ b/Documentation/tee/qtee.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+QTEE (Qualcomm Trusted Execution Environment)
+=============================================
+
+The QTEE driver handles communication with Qualcomm TEE [1].
+
+The lowest level of communication with QTEE builds on the ARM SMC Calling
+Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
+Manager (SCM) [3] used internally by the driver.
+
+In a QTEE-based system, services are represented as objects with a series of
+operations that can be called to produce results, including other objects.
+
+When an object is hosted within QTEE, executing its operations is referred
+to as "direct invocation". QTEE can also invoke objects hosted in the non-secure
+world using a method known as "callback request".
+
+The SCM provides two functions to support direct invocation and callback requests:
+
+- QCOM_SCM_SMCINVOKE_INVOKE: Used for direct invocation. It can return either
+  a result or initiate a callback request.
+- QCOM_SCM_SMCINVOKE_CB_RSP: Used to submit a response to a callback request
+  triggered by a previous direct invocation.
+
+The QTEE Transport Message [4] is stacked on top of the SCM driver functions.
+
+A message consists of two buffers shared with QTEE: inbound and outbound
+buffers. The inbound buffer is used for direct invocation, and the outbound
+buffer is used to make callback requests. This picture shows the contents of
+a QTEE transport message::
+
+                                      +---------------------+
+                                      |                     v
+    +-----------------+-------+-------+------+--------------------------+
+    | qcomtee_msg_    |object | buffer       |                          |
+    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
+    +-----------------+-------+--------------+--------------------------+
+    <---- header -----><---- arguments ------><- in/out buffer payload ->
+
+                                      +-----------+
+                                      |           v
+    +-----------------+-------+-------+------+----------------------+
+    | qcomtee_msg_    |object | buffer       |                      |
+    |  callback       |  id   | offset, size |                      | (outbound buffer)
+    +-----------------+-------+--------------+----------------------+
+
+Each buffer is started with a header and array of arguments.
+
+QTEE Transport Message supports four types of arguments:
+
+- Input Object (IO) is an object parameter to the current invocation
+  or callback request.
+- Output Object (OO) is an object parameter from the current invocation
+  or callback request.
+- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
+  to store parameter to the current invocation or callback request.
+- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
+  to store parameter from the current invocation or callback request.
+
+Picture of the relationship between the different components in the QTEE
+architecture::
+
+         User space               Kernel                     Secure world
+         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
+   +--------+   +----------+                                +--------------+
+   | Client |   |callback  |                                | Trusted      |
+   +--------+   |server    |                                | Application  |
+      /\        +----------+                                +--------------+
+      ||  +----------+ /\                                          /\
+      ||  |callback  | ||                                          ||
+      ||  |server    | ||                                          \/
+      ||  +----------+ ||                                   +--------------+
+      ||       /\      ||                                   | TEE Internal |
+      ||       ||      ||                                   | API          |
+      \/       \/      \/   +--------+--------+             +--------------+
+   +---------------------+  | TEE    | QTEE   |             | QTEE         |
+   |   libqcomtee [5]    |  | subsys | driver |             | Trusted OS   |
+   +-------+-------------+--+----+-------+----+-------------+--------------+
+   |      Generic TEE API        |       |   QTEE MSG                      |
+   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
+   +-----------------------------+       +---------------------------------+
+
+References
+==========
+
+[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
+
+[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
+
+[3] drivers/firmware/qcom/qcom_scm.c
+
+[4] drivers/tee/qcomtee/qcomtee_msg.h
+
+[5] https://github.com/quic/quic-teec
diff --git a/MAINTAINERS b/MAINTAINERS
index 7bed4117d655..fc5d403b75f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20959,6 +20959,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1


