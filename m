Return-Path: <linux-arm-msm+bounces-73051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C0B52751
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E8CA7BC1EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6E7274B27;
	Thu, 11 Sep 2025 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ3JPY7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FC72727F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562108; cv=none; b=OSpF9hJ2hkNbEyl9L5XYhfw3MB376nKDee/bQ5fu8TvYQgtoPQ0X1CE+N1xIiIzOTMvmEJ1CMokm+n2tvs8M09oblxIvX/XJxb8slhhalWapdbSq0R09A01tkdI8oYSmrageTCb456n3E8kZrO322gpVl2XFlTirtuKTLNOrNgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562108; c=relaxed/simple;
	bh=RN0nKuxToKAQ9VOhyNYte58FvHuKeDhMEOShy3rUoJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXyAG2f/qupsvgfFxh7KhHB9L6CpOgW8Ip0WJZaUKbUeeM5+Edp+Po73IOFb3GOiDMu1rF27hEa54mg76iOUA5cb6MvG4G9ESpuFGkcBL/ARJumlo3q3Z+78ILEp+SXHgl9TIU5kqzTpoB1H2NAqUndAZtM7zwm6i55foC3tyXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ3JPY7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IYm5002343
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=; b=KZ3JPY7dAs5KGUTq
	HFUFea0XTIvJXWVY1Q7H74X0N+OosjBE4pxWKXcpJEMGJobLna+RmCS+VAAMe3Re
	fJxsMZmoXjDwkVeQorNjFAFklvxhRt6n5xzyqM2TUE1XieTmRnI1zT0RaUuntbhG
	iQoj5Q6AzwCRT0kjJUq9atRUqT+/R2UTWwoM0vFgFcpEZYOYgU+OUATZthZw6zps
	xDEaOu4LmRnGtPsYhC+IJ9gTX/iUqzqh0hjIdncQ6jj/1s0j1q4MryROkmM68SFW
	aaJKpoZAH/CkoRL9AefPCL9pSBnSvervqrh+GgbqTfMQQOXrXxBMJuNb7EWEALkH
	ar9Tiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8p5hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c928089fdso452217a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562103; x=1758166903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=;
        b=kVQwPFLXJj/1TlgxWd0yXquDAcs1iDvNilzDWNopI8MEPxWikYmaabqAdGRhAF8N0I
         RzlRtHhSN4CUIurjzVIpxgsQZOeiep02qgp5Nmd5ImiZLqFqiPQ9bu5nv8z8ullm7GSw
         eqyCnzFq20ufjuQSHRqbcehnpVfyQIh2xTmaUnqwvQGVaGv1NktoZiSGooowpyiLxMmQ
         Qli6jAHLB5oVR+6xVVjgsnFULEY0yQYAXtApPPE/3o6sVCFDLRxrM/oZ0GbzTOiffwpm
         MDtrFNEkd2PV9+xAHW+lBOoi9aoJftdMAPX+0NK7XpMRCJ74ywgD2J2KdDWUGg85qR0D
         Vi+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZwqVzFJ/Y0/Nz4ABCFczk01gnwnS4WWmNk2Re1ToasrZcA3SYJ7lP472MIpdcqKDZFhlqLRDJh2WKDDej@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ZU6Oybx74GAKeTgz0aflE8CQkdfcT18CWGzwbo2wPDjvnoYq
	0yxw7py50hBkrsYg4C/WNgWmGd5EYqOym1e/v/Zg5reXKKgrQ41h/L6+We5aPiJEZvQ6Y7KhAW8
	9yb98iat/3yWYuA0UD4KUjQNfXpk/nKWvSwndRLkcDvMlDgI2YFgdiWXu2zpnPIoDxUk=
X-Gm-Gg: ASbGncuIm8Cb70UwzieImZVLctKO2Tz1mVFZap2uohc1O996b3NQP0Hv4jTj8FW9F4G
	iym1i4TUYqjxC616t9qjSx6C2S6v38nKM4wtgdqCC/J8u9l1IsVlv31OSrv1s7cMGxPvgse27dT
	n5l+dGn1X7ABjnZcof4nIrdGfXmAzGt2HmmNwEz50JyLCV/+8SQd6AQN9fXA4nXmPn/+L73ihhb
	klxCHgjNhzhhAjEhpsCWgjAKIbSC+gIPZT3Ln6a/HiHS4BBDlmcoMW18mtp1kDr2aZpSuxxgp88
	wfrFp8z2BeGgTH7UIA6E4I+2XGyz2QYBy2g2cv2ElHhc9Lh4+GeZsncFgt8MfUHLOA26sZhU/up
	I0uhPSMg7q0joy5EnXUKzE6Q=
X-Received: by 2002:a17:903:138a:b0:24c:9e2d:9a13 with SMTP id d9443c01a7336-25170772b3amr227810385ad.27.1757562103024;
        Wed, 10 Sep 2025 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtd17Vhg+RzVHZGU8BB/FT8CYxosIKHklKDWfs0WsmhvNxis8G3SdePgjppVkj5JOpI57GYA==
X-Received: by 2002:a17:903:138a:b0:24c:9e2d:9a13 with SMTP id d9443c01a7336-25170772b3amr227810115ad.27.1757562102478;
        Wed, 10 Sep 2025 20:41:42 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:41 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:24 -0700
Subject: [PATCH v11 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-11-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX4CLRD9gMTvLt
 uvpjPJTp0ryQQbiO6uwki23JP1hm1YDP3/xF0DgABz/lvUeiGNyVDFTDHvX95Si8NIwTMUoyNmc
 OrWeude8CL8upJrp49Rv9IEQ9ACmlkNJbEQ8zShvxxyLB7JOpC3nbgB8q+8UUBXQvQHo/d5S1UB
 ra6HEfzUsnvjsevJDYxGnh8bUxO6jxQASvmSB5Btw2sFG14zPogsr2SZrXR0Cdrj8FkD1jeP8Tt
 OCKom78ZvhLgRDzyYHFg0S6quJblBA5ON1RPcMCs2ITdfjrCuGIVWQNDHMA4TsSKZlDpiZWjItL
 B/hnF84Um7LW45f+jO9zvxwKZ3+MRgl8OuF93xjP1ByVK4vQU7Wwyehw28xhoapkY142h+HSBG+
 hsGTrmLX
X-Proofpoint-ORIG-GUID: wyiE3ZWA7GBb0Sjb6R3GDp7yXWTUvMpP
X-Proofpoint-GUID: wyiE3ZWA7GBb0Sjb6R3GDp7yXWTUvMpP
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c244f8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

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
index bde449308736..589f8ea62bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20860,6 +20860,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1


