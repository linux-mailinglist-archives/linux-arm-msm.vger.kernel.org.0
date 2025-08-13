Return-Path: <linux-arm-msm+bounces-68860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB9B23D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 02:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 140E67A7D7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 00:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B282040B6;
	Wed, 13 Aug 2025 00:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZqlctAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356CB1FF1A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045439; cv=none; b=oVbANwJr29rv+p15sG1F4vAOUNYIstWoRo4tn8wGXxL4ifLnvzytWNKAbofJ6JpQPh4BHByK6Kul5oOlhievjDpBqDj12sbJ3rm+Om7ufKZ/7JjHTO4uEbbXpfwrEwioGtb0TtIX9nRzJqLAJKLB77stwbOjCdNKZ5B9HBS+x5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045439; c=relaxed/simple;
	bh=8Vle92yZY9xDtV8ytKjL5d+JCb2sWNmHvm13yHE47Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlWnNq7twLfMr+yL6Z5rdN/V9xK3okHwDEGmsZkSHcehO17wDwkyPajwaUVPpLSYcE7u7pAPLWUwJtt5vZm2STEaNAF+ZUN56CLJOheLebrnIF4JVgMR5REiL98PTrpXT4JUQN2aOZxQRQb4JcYnUDfPTdlLguJ0EJ5/ePObtR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZqlctAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKwJ0g029526
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9mIUmeVItJmyNwVFThGc/lr2aPxFoGHJijUqp9TSw4=; b=AZqlctAOyc6uApD2
	2Dvft7OJAvLN3DqMZTOexglXu5CtJjX210i9h3xdeCad6ICLWA6QU4V4Bm9rpiEe
	/5yM/6PV+QHBRNNRwaa6rlc7rg8h/RV2c3Tkmu/QdDDDy17NqfPOjRcQVJsa/2B8
	/JH69lCW929T9eWFx/yE9EajcfMrdD4VpbTt54yVflauE/1YmFvixpLWGMDQw7tM
	/M6/bdZdfjuTVyiPV4wrddxhZx7DYlyeBD3NPF5G4xIDICO6s0aosqz+ccRr8UyY
	8SkXPe3gFwQ6OGBpMkZ4kmL9plzYUcIxPQY7w04XZM+qUez5dEg+vUx3y4gSknEZ
	xI17zA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g9w7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-240607653f4so52931245ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 17:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045436; x=1755650236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9mIUmeVItJmyNwVFThGc/lr2aPxFoGHJijUqp9TSw4=;
        b=aSsIizLWilvie3dIrELig5Xq+mJRkXzasihnx5fd3zN8Inb64J8jXn1OPaZjoFyByH
         +zE6LF34tFGO59fAzM8ao/NQM7A5F1nelXNgpduOWJy5OURy9M8v1Nm//irgmu+E+NRa
         kba+gJM+yjmMjoQwcDwbGmVdZMC6nppr8uIE167fMN4zcraa7CkZ55dUSDdLz29R6O3V
         KhM5w+YrtTUFxob95DQQftIqdo0jYxoy5hHlfsQikjiivVLTzfQ4O5b51Ck8aZMM7CAB
         aeRXTJYgASrXVlHcvhBVQGubDbseONdplmwx+YDmq/JSlAAM2+KDccM02zjmIGOde2ni
         /pTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH7xEFVHMWNnRNVyk3I9wpsnNbDzgxkuYz+jbjPFShZJvLabUQQcR3U8BAiIUZ5+v7aO7KNVLm90AJ1/hh@vger.kernel.org
X-Gm-Message-State: AOJu0YypB3HOBzRfruoMtI+UeNfVjdK2oROp65gWhBXoT3W3dFjB9bV3
	bEUjDPuTHQ6XriBCT0STmM/5m7GOqdB3h6S26+TVq8ReTnBt4j79AgpoYtKx53m8schK14rcEPz
	HLftwlwlcxwq6jjmd077Og02mxjhaQfB7b3SBMnwZPY4sZQLr9Ocei3tcD4nTVopL/08=
X-Gm-Gg: ASbGncuHbMsEQjrzMh1OIr1hCMa4lQm4LycSve78U7SY05J7f438Y0le2MTizvexuoU
	gB8z2nAA9x8s5aeC+7OH96nD7ycbzy5TJuZI1P11dXZ5NrZlDeQZ2KMzrjO2Rn6JLSrXXEQ41+O
	in+PRv8Tj8dO/XS+YvHBu0QcjqTOGX/K6vEpvTm2vKK5bWWY3ypLUj15Rpr2B9l3XtQAqftZr+d
	sjCGK2K/sLVj//qvD54a396P60f5xYaoCvDX5fyvyHNy8CRHNsW+/OC5CBgc8bEJFLaOqdtHei/
	IPzFGrOlL/CWPepTYE+ZpowPfKt3kJKmCUQ27apSbTuwqM2wggEHnCmRtAh6QlsIw7FoB4/G+G9
	Xv7OUz7V2PHv1eo7joR3tfU8=
X-Received: by 2002:a17:903:2406:b0:240:49bf:6332 with SMTP id d9443c01a7336-2430d218afamr18366235ad.47.1755045436353;
        Tue, 12 Aug 2025 17:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFZ8I3i9S0gbmT7ZeBnhrBjqJHd1AmbumO63/UoIlLeoWED+/XTZ7ApkX0E4vEWA225OAgzQ==
X-Received: by 2002:a17:903:2406:b0:240:49bf:6332 with SMTP id d9443c01a7336-2430d218afamr18365875ad.47.1755045435828;
        Tue, 12 Aug 2025 17:37:15 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:15 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:40 -0700
Subject: [PATCH v7 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-11-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689bde3d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX0Yb+23TOwowu
 z94CGlMd+49oCd+JVNcguVfg0NKJk2IwmXCHs7PMosekePytdG//aHPZwd9z60w8OjVoFFiSsEp
 2dHvdNF/pLn9Xe3KN7pv44wVjv4P8ljWFWLih7TTpaGA3zDp+ZoVvhynRhc+7T3wk4P0zvNe0dj
 sXvgZmztmM+xE/Th/Pm8McRG+5m1aHJuM42ybOdDH6uJbt0GL6cNoetI+jNb1USe6np/rGPfKOF
 pU+DVyuK+eBA8LNwRyqqDQxy2+ja8S8Sgwa2/oF6OnACdwOIega9vXETwaZvqjZXQA4mVEFwQHo
 1mL/UrHPQ9aijovGf198iNv7he0lBDe0EVwhhadrh/DwrEa8iMWYMAIOFhbOq8DuePGui63dvSL
 qVAE963N
X-Proofpoint-GUID: u2jrrpbbM9JBu9jHbeHhi0VQX5t2E90J
X-Proofpoint-ORIG-GUID: u2jrrpbbM9JBu9jHbeHhi0VQX5t2E90J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

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
index d19a49d60b41..0b476b794f8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20882,6 +20882,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1


