Return-Path: <linux-arm-msm+bounces-71489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD59B3F407
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25E33BD355
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1F52E5B02;
	Tue,  2 Sep 2025 04:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx4vpK2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101532E613C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788993; cv=none; b=HLOX2bWDgD/TCvCG+SDVe5GuWtD0eiTLfEsyjGHTBytUr8Lk0PNNBVa5dRwI6dRDg2/ObATLxlO3lvYWCRH/ar/LhxMXKQy3cS6DLpOeHn9VF7wqn4a3xmXrIasZV4Og4NZZu80dzOhyV793BP7xKR2j8ZmYfnx2CmIsdPE/Z/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788993; c=relaxed/simple;
	bh=696U7/FWwaaFIGlzeZRWykn9zjUkr8pce7ma6fekJEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9liDWJF7JB4nqSG2t2TWrVv8oNzrbF9+/AE8HjhXvgw9aPqWrmHG9GR3w0/9iB+xX/r9Hvd1t/43bW35KZKQ8DWkJgp66HBDaMriuM1XQok5+mvpXKeaqXBB7esVxDPdEGG7INLDMoTej+gK8/xT91OiORHUWcsBuA5cBmIeCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx4vpK2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RlL1021618
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4C5VhC/4pFCnYsmQJ5EmNbV8HXu0TRSksgnPURzlR3I=; b=Tx4vpK2WBWhiCtNY
	sm8/FoCB0SlXn37FORfYCgOjeQemeJ+LUOOETXQnEpU3iT1gg48+xYQYmiqqEDjH
	YlLvUrEakatZJT2NVCkbY8cC1x0OY4F28Xd89XznVUJb6yGUmoebgKRG9OMfZASS
	cVB+1BG8wKyNAk8rId4bZlpUCSiZ0jW0y2HCxJgJ9tJ1cQt1nh5nlA/6noek+//f
	3lr9VfvgN2Ogih1uKI0Y40B0KWdbBNOm6OTbb+JmIJnk+7IdDbq4f7ICQkKJiXV4
	7hOBQeX0qItaRIg7VEu2hEnVwuUVNMUcXIz1lrWg3kACSeXjqt3ZCYTboFHAW90v
	G5CdVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp6pcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:56:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-248981c02cfso54470405ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788989; x=1757393789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C5VhC/4pFCnYsmQJ5EmNbV8HXu0TRSksgnPURzlR3I=;
        b=kFsAcaxARWQkfpXGj2cml4uodSqfBCEDq9qLam35S1KoyThNW+uNSJWsxYC5zwbOW9
         4YW2Ol7wUVLnOLyGhZbYMf0TDDwWCJL2aZolEo20DrvWWRyRbo64WVaskrNQCIBRahCc
         6fJ6Wq4LG+AwmeFYT40w2ASmvtjx7RudmAk2+xmLse97QSODfc9VHjwLxNa0wWuRFNn5
         7M3ZHAaqcbT3SrFpkouE8M0haV49wUWhr0yQd6e7UKgZQDNJpDV26j64d37znjy8MJMf
         W7RAjkDTd9zPtLEQJh13NdcrkhHh3wa5p1cFqVLDgWRmP9rrJ7z66upJgA60wplnnTlh
         z8hg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFp9+Wle/ShipOdkCHt+6gXDxXNh+N9Sq8RLjfYV0ga8RmbOjzWbjmOlo1bq8h9NCCWh4BNgEluuxjM3X@vger.kernel.org
X-Gm-Message-State: AOJu0YzDEuBT33VxFFvsyc6XqAxAtVfB+QR85dGuPxTuqrIivh5yeK8P
	4Sipw5lBsiS9QGGgOgW76VNyFtVtStLtCvPNb2VrqZF0UWE+9N/KOyflbXQ4kEbp417srqIunLf
	6mERiT5CYsSYIu7MBt7mHSh41wy9dmLzinJyJqK0bixv3kqb0MW441ydu7h8lXCFgNAY=
X-Gm-Gg: ASbGncuThy7F6bycbpwNQacC1/TMm2BTimpzogbXy1/MC6Q91Snve7YoR9C2vTuyWBO
	JW/TJwc75ZykwCK1G2kP3N2TFd68O13noS/UficH6cI2uc1kkICGqsocnmR60MF1xwS1zrZJzzU
	Lrb9uOeLO9e7K3ODjrbGQTKnTsKDXGwe+lk8Rj7pmc5hNvGR8PhtCTc2b5izlXu64+fdw2P7W5N
	AXBUPBUEqDUb1Inhe1ydEnfAhEl2FgjJAM7J3OiUsSIfr9PoLkvbWhf1EPlnIhgE5QaUIeccQ0i
	0oJi9UAL1zKX9px3hbQgIIBZxTSjYCZJrGuMErjE1wnpNrYZao+XehIeezX+oiYCtszCC66Q8uh
	N0SyY4NCWZ5gnCS5lqw3NiJQ=
X-Received: by 2002:a17:902:d502:b0:246:fdf7:2c71 with SMTP id d9443c01a7336-24944af12e2mr132951205ad.47.1756788988611;
        Mon, 01 Sep 2025 21:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7F0eEjJmAaiuShpIkxQfExITaVHfEaEVCThMdzzbDlLzUzKrz3dCFXLdIOBLWZwLgt+OxrA==
X-Received: by 2002:a17:902:d502:b0:246:fdf7:2c71 with SMTP id d9443c01a7336-24944af12e2mr132950855ad.47.1756788988089;
        Mon, 01 Sep 2025 21:56:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:58 -0700
Subject: [PATCH v9 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-11-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Proofpoint-GUID: wfNkd-9psI58yLLmKoWdleQ17NI8xEdZ
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b678fe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: wfNkd-9psI58yLLmKoWdleQ17NI8xEdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX7zFz2Lv0fQVF
 An1w90CEaDg+OGB8JAW3+gLZx16VGI4HEKDOG8/fKdY16bF8B2i8RK6Vl7d5d7T+iaPsCNHDzx3
 j6SMb07/vLTwQCYjekY3yNwtibKwQNOOOYZX8N+VdWX/gtpEajc5YOfd/KCH07Hnn8vxSo7fA/E
 TbjTbPmpKSlo10e0wYrXvRMI7NoelVKsgrzfEmYhAzOMsOOPuFkTZDsqFaKy1D5IL7bP97kTNyx
 qw3KFMNjJAV86jHKeMiOy4b7lytb+Ob8zJtC/zONsH9eNDLEfAfe40jLBcq+HlYn/xx6eS5dM2X
 p8RJVA6gGtOn1EyiFkzpZKgA9etkbqdmVMRMt2KO468EWUNMeRs2NJ+glHiAZ9MxLoMBNZGSU6U
 mQYXKQOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

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
index 5086db700aeb..bac9436f65c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20984,6 +20984,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1


