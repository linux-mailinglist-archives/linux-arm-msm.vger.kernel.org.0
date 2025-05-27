Return-Path: <linux-arm-msm+bounces-59481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51BFAC48E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 09:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F13ED3BD994
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 06:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2051FF1D1;
	Tue, 27 May 2025 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGUYS1ma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5AB213E61
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329059; cv=none; b=hGChhAWZ/dyZb3zMmfqGyODWbMevGU1ybLaA9c3KkeoH9VqTyTSn1Ex1Js0Pbb2MQE4lz2r/61QJZ0WCF/wg9zotFwH1gORRMbb+eRsa+qQZjZI2t7seFc7N4m/Q4ITE/pCI/RmdfexCXrVrze/+hUhhx5JzCAkbdtJF9vnu/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329059; c=relaxed/simple;
	bh=alYcFVrilYxQEpqmSFlskvHe5qmrItaRn3frkZSRWk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSTxtbsqXl2mv6cfSaqKGkDP8M669EUKFr8RP1wHX2PeKvLSA3AQLF/elIjVAJyRAi1RTdfC/eyD7eUmpu3rFMNEqgScsp2OszXza8AlQMjkFF/Ah2h40x67qRSXXfAbHgSZAMStTL9PcJtT1j6TPrIASlRINiUGkXaPqRcS/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGUYS1ma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QNEGiS003000
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDW2lLJjVVFwgwPCZKo49aI6NM0IvCEjQ6HwcjeAopg=; b=oGUYS1maWn4Fkpeg
	wt1ereETu9Y2GodTAKm3Wjmi48R47J54W88sbKhnxcDqnRHv3ljn5lydw/A2v2CY
	/UzW3DWFHQOgjdjcpZFzWrDxaCdAhGej9lEaIS1nmWvO5SI55NFEUvZ+VQXPpJHW
	0lklA4f22/fQuVcHxJlvQ4CZDptISozn1nGQrlQMsJ3BpYoVf2Yqb5jUw2UpNOcn
	hY5v4zvsDrySvBTrr4WtPtctLDL4ayLRWO812IvQl3idbuQch4vQycahbvUgbWpO
	5wAFRW1iwBFM+e7U3SqJbChOZ0Z8TPaMKZshuypvZxHNqa1JlPy3ffDlhoSl07/f
	cUnz+A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmyuje30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso4259725b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 23:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329056; x=1748933856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDW2lLJjVVFwgwPCZKo49aI6NM0IvCEjQ6HwcjeAopg=;
        b=nkpQik8dLiLtCVrkLk7nGPpY4+iPkiXyrlgR5u4H5OHMwFUdLEGg/5ObNTFJVak1Ar
         RRuMn9idRJhZmuVQdWHov/DzQQNuZYnR57kFFbkL2yLx9mSaHvS8Ux8E46g6XCDmNruP
         76KvSj8RpHUZ9dRf5otnlPzyCY50enx73/zumWCErClnqX94d/2iz2GWtF5feMx7dxRT
         es+zYmLtZ0f0WuL+JEyXIOn94vFYBjByLe0Kcng1NWWdo+UohcRfQHONBkfzRUvqORYS
         MQyXBsUhlJBJV1LxQFRO7Rtz/clLLwVMSiwuM3/3B9lxqGAnum4aMXNjVGB7JcfeUZJb
         f6dw==
X-Forwarded-Encrypted: i=1; AJvYcCULVtYSORxvaKWi/N9PxWtoZsVo4yUmrpX+DM91ixrELdqjR1gmguEpVx3Ay5T5mecSpa9RFCfpzIE8n/FK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZAkRuOJLDG2LtBxkIinE8SMgHwatBuNlijE9JeVWlz82Pncf2
	zw62ee2+Vr4fdPrsDt+sHafi4YW2kLTCIjF5ReLDJtDNLfNFkY9UYmGBUeSruNZftG1sceapVqH
	z+agpE4hNVRJ/7P11np8vLnOYHRPojG4nb/zsVgDQq+I6SBMbP40tcX26U7U+BtFOUUw=
X-Gm-Gg: ASbGncsCw2bbOfGZqj+E/1KgNSLsjD6j8Gno1AWT6XFldWQ/ANbaHEmxxKxqZWEp2Jd
	Othqy1WvU8GlLm9KnjTUb6/xVB3+E1QU0ThZiJAlKE1WwClgI+drF9jNpu/87XkqJ9bdyADkJCp
	WPbFo62R42A0XKNe2M3tttuMOc1U89NSyR9UuSGHKle14y9OUth+sghEjvwocHxRFHY3QHBa94Z
	8jvjm4Ee7NzhGGQvHUidIy0dcZ2hGVDyE0dmKJ0dsogwiJ3H4djXctjGX35CYm7YadzhhnEcBCw
	RDQTt4yhN6EZZkS2i/U1mcc/Fl3jCqf4oCpmadjN+uWir7tAbj6BCP7p0BfswWOEAFlQ/qc=
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr18678983b3a.3.1748329055775;
        Mon, 26 May 2025 23:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatwnSlnB4ysD1+0cl+0KDFq1qTpPuz2/PIHrgjsZTiQ1dLavAZ2MsgRFbjk4IiymG+qhS2g==
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr18678947b3a.3.1748329055325;
        Mon, 26 May 2025 23:57:35 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:57 -0700
Subject: [PATCH v5 12/12] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-12-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfXxEYi2iVgwH9R
 Dy4e5fJcSHNVi/5yDNpxkWhFXNWpC96x/Zvb0V3FF9PcPquKZfSmkCOJECpw/zquyrBKXJ7p9Yj
 HfwWmiWXwYnCgtbZ6FG5sGFxobTY+pWo7ws0n/OzxAHNHmbNNp+AmwmOtlEdxK9BeIeve6f/Pih
 x5U/iQJZzqXL4sWiBi50yr2ev/gAsEAJe8Kwa0I0J03ndiq0Wyzr6Gppod4ZCXuYsfRzj+CIqeU
 PBCJS/TSN6bWfK4SZ/W4/0uOlpLaups/GDATXVCAMoXGxXjo3hXjsZbJxRAujUZKmEH4LqwggNG
 IkO5KShfCkNTM/89rHG70+VTtbtarhmTeNxl52/sjaO9CUtEQK2ObViTxA/WB1m02DU4tunPXdv
 CNXqi4Ewg2VWyGbwdy1So4Wn515Tz8WiRoVUotdIZIzTJLIi/771SiDVzFcUOtjPS9MMTbgj
X-Authority-Analysis: v=2.4 cv=MsdS63ae c=1 sm=1 tr=0 ts=68356260 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=4VYrYejmMApVX9KxlZkA:9 a=QEXdDO2ut3YA:10 a=M0EVDjxxv-UA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 9QsnuZPSvpsqdNB9UQmF993XOAyiUPV2
X-Proofpoint-ORIG-GUID: 9QsnuZPSvpsqdNB9UQmF993XOAyiUPV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

Add documentation for the Qualcomm TEE driver.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 Documentation/tee/index.rst |   1 +
 Documentation/tee/qtee.rst  | 150 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 3 files changed, 152 insertions(+)

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
index 000000000000..8ae4da17c3a7
--- /dev/null
+++ b/Documentation/tee/qtee.rst
@@ -0,0 +1,150 @@
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
+Manager (SCM) [3] used internally by the driver [4].
+
+In a QTEE-based system, services are represented as objects with a series of
+operations that can be called to produce results, including other objects.
+
+When an object is hosted within QTEE, executing its operations is referred
+to as direct invocation. QTEE can invoke objects hosted in the kernel or
+userspace using a method known as callback requests.
+
+The SCM provides two functions for direct invocation and callback request:
+
+- QCOM_SCM_SMCINVOKE_INVOKE for direct invocation. It can return either
+  a result or a callback request.
+- QCOM_SCM_SMCINVOKE_CB_RSP submits a response for a previous callback request.
+
+The QTEE Transport Message [5] is stacked on top of the SCM driver functions.
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
+The QTEE driver provides the qcomtee_object, which represents an object within
+both QTEE and the kernel. To access any service in QTEE, a client needs to
+invoke an instance of this object. Any structure intended to represent a service
+for export to QTEE should include an instance of qcomtee_object::
+
+	struct driver_service {
+		struct qcomtee_object object;
+		...
+	};
+
+	#define to_driver_service_object(o) container_of((o), struct driver_service, object)
+
+	static int driver_service_dispatch(struct qcomtee_object *object, u32 op,
+					   struct qcomtee_arg *args)
+	{
+		struct driver_service *so = to_driver_service_object(object);
+
+		switch(op) {
+		case OBJECT_OP1:
+			...
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	static void driver_service_object_release(struct si_object *object)
+	{
+		struct driver_service *so = to_driver_service_object(object);
+		kfree(so);
+	}
+
+	struct si_object_operations driver_service_ops = {
+		.release = driver_service_object_release;
+		.dispatch = driver_service_dispatch;
+	};
+
+	void service_init(void)
+	{
+		struct driver_service *so = kzalloc(sizeof(*so), GFP_KERNEL);
+
+		/* Initialize so->object as a callback object. */
+		qcomtee_object_user_init(&so->object, QCOMTEE_OBJECT_TYPE_CB_OBJECT,
+					 &driver_service_ops, "driver_service_object");
+
+		/* Invoke a QTEE object and pass/register 'so->object' with QTEE. */
+		...
+	}
+	module_init(service_init);
+
+The QTEE driver utilizes qcomtee_object to encapsulate userspace objects. When
+a callback request is made, it translates into calling the dispatch operation.
+For userspace objects, this is converted into requests accessible to callback
+servers and available through generic TEE API IOCTLs.
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
+      \/       /\      ||                                   | TEE Internal |
+   +-------+   ||      ||                                   | API          |
+   | TEE   |   ||      ||   +--------+--------+             +--------------+
+   | Client|   ||      ||   | TEE    | QTEE   |             | QTEE         |
+   | API   |   \/      \/   | subsys | driver |             | Trusted OS   |
+   +-------+----------------+----+-------+----+-------------+--------------+
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
+[4] drivers/tee/qcomtee/qcom_scm.c
+
+[5] drivers/tee/qcomtee/qcomtee_msg.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 99fe1ae22ae0..42823d33cc03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20515,6 +20515,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 F:	include/linux/firmware/qcom/qcom_tee.h
 

-- 
2.34.1


