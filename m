Return-Path: <linux-arm-msm+bounces-52696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 887EAA7426E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 03:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E811760DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 02:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFA520E318;
	Fri, 28 Mar 2025 02:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/bR59N+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92649DDAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130104; cv=none; b=l1mkRdM+AWG/znVagEVbpNYrboa6e5G90OQIrV3UytAs8uiW3tvrf2a3ERteIkZWCbPr4nPv1lD1N79RYKl4EJmr1FGd5MOMbckrczBkMvBi1JSWiFvKxabqcapQt+lFTd19HCgnZJwe4jiF1vnzKWsamnF2biV/n1dYmgJiNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130104; c=relaxed/simple;
	bh=2W8dHqpvSDeOePbXpuHESG/uas/10IJ4MD0GJvW1BM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGHN+B1zbmKVCHkXJAKCP+8LeOcgMCI7MXno0xPBt5e/IPWkYFRJgueMiCGVljRk/SwKnVzdk9JFFJiB3UGlN0a8s6fzrp1/EbegDmZAFUeZvPkpu9M2s/lZMiwFXuxfKCTMhUZvQWIARfkspXNoBOLXsTXrxQAecnCxvkr0IKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/bR59N+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RNU2tT022339
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3jfdOosGMEeOE6Hk8PNjDO
	DaD0RWq4EMjLn9sxnDjA0=; b=I/bR59N+i2svfPZfzOsS+vJgbDJTxI1uaZGXV2
	8MTY/bjgwQYghV+ujfKJVo1P4zcvRXQIWLUR8T5E+u9GqlTW6Av/lz9/NdaHRosa
	0Mb6TcOyNOGEzclIlzCs5sr9hhZYy7KPjJ0e2Eudrz0uAmXUME5+hhImcQXoqPi3
	+nP8A9mNJEEfGUwu2Wb/pB1V8siZX8TqaAzhRo8OvUcIlAeuoA795ojfmpU3Uhvh
	1lknfS75kEj9/kiCvSZna0Ew7P5RA5WrQywyYLf157nwbCrrV3aXiVc3AQmp2jSA
	B+EtXGrDZdORzVU5YdrySspBUAK1UcTu56a7UxXtpByeW+Ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9r8y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22403329f9eso29900885ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 19:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130099; x=1743734899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jfdOosGMEeOE6Hk8PNjDODaD0RWq4EMjLn9sxnDjA0=;
        b=Sa7ElT79tAsQNL0eGWzpYLm+PzD4u++otvZWX2uticzNzPugHeyqlY1OgsuOoKWd0o
         3FpZo/3pgxd8gHuuwm+Ne4xA3bDilcsaUzpy2zCrAIfwkw/iZXVNYxdsJpCRaeQ/CLQY
         zztmCgtghf2gozRdqAA0Hgvqhv+lY3k8B7h3LWLI6oKI7HfT+tSOoFVVDfOzz5lWaMEf
         dgt4T69H7FtUMrLiRt8vMFxvW9W5m6io4U1esjt97YXGiqh673anaMS5bc2d66dFoUsF
         4DrHm9EQk3BcksfN6Dv/gYsSbywWT7Ypux/7qZSRg7ogOITA/ckx+vKn88VXEKdsLzUt
         okng==
X-Gm-Message-State: AOJu0YxBef39Kq390mNRAf/qVlBqQY4BWbHX3plXI+dZTIW3j31Pk2g0
	KHSjwLHOVRhJ4LituXkUrF44UdPdb10EbePXIHKawAc37gnLqvxWnSi1n3RUejhx6SX9Ad6rKZ7
	Q6KhQNp0Gyl+7untUakBxu33BA476xvKYofEdfVsRjJuQnUhFuuD12J7s1UzG/JI=
X-Gm-Gg: ASbGncv9mdH8eXpFIi04sQ/C843BcRvq6yr9Bst5+9rOikga5oFrdvxVv2a4V9JgW7D
	bByf6+DOO2GLm5g8nUkJyzFMAFW9bbNhYBseEuN4uLllfKc9WO7M5m0DFoQAPBKftRdLozDNZGR
	fXFlQp7AenpEjIJl7ltBC9wye/8oMYLQzU2u9dx9KafPhdMn2mbCFKZKALYTuTqmnRue061mgF5
	5WrClERnLoZksyBt9NNLv0SVf4tjL30JPtlorLfk31/U3iEcqe5fs6mLg18u2Vf6D2D4wc99qw6
	CLcIvc/VxGA/wqmNsPuZlJGigCF77IAQOvCgl3wMpoWvV29WkaJDbxfRw2iLBaM9gQbiFthXbSM
	=
X-Received: by 2002:a17:903:3c6b:b0:224:1935:fb7e with SMTP id d9443c01a7336-228048794c9mr113038425ad.24.1743130098523;
        Thu, 27 Mar 2025 19:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESOuIIqoTW0KqpcfXXxsgieA9bXWKQuGbr8OumEyQC5gHEHSTgIO0Qt72Mqa7jh1NwHW9vAQ==
X-Received: by 2002:a17:903:3c6b:b0:224:1935:fb7e with SMTP id d9443c01a7336-228048794c9mr113037835ad.24.1743130097906;
        Thu, 27 Mar 2025 19:48:17 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v3 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Thu, 27 Mar 2025 19:47:22 -0700
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALoN5mcC/5WNyw6CQAxFf4XM2pp58Iiu/A/jAocCNYGRmQE1h
 H+3kLhwp5um96Y9ZxYBPWEQx2QWHicK5HoOZpcI25Z9g0AVZ6GlThUPGKzrICLCGKhvti0EeFB
 s3Rihww7c9QYm1zbPTSozXQhm3T3W9Nw85wvnlkJ0/rVpJ7W2/xomBRLqTGqspUKp8tMwkqXe7
 vldrI5Jf7h89TtXM1cfCixtJSuT1t/cZVnec9kLATQBAAA=
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
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: vc5H4pGG0kg6893RzuS09XXLaFNVX7h8
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e60df4 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=CT4NIRYFaVtSUlOmZkwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vc5H4pGG0kg6893RzuS09XXLaFNVX7h8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

This patch series introduces a Trusted Execution Environment (TEE)
driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
and services to run securely. It uses an object-based interface, where
each service is an object with sets of operations. Clients can invoke
these operations on objects, which can generate results, including other
objects. For example, an object can load a TA and return another object
that represents the loaded TA, allowing access to its services.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

Note: This patch series focuses on QTEE objects and userspace services.

Linux already provides a TEE subsystem, which is described in [1]. The
tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
can be used by userspace to talk to a TEE backend driver. We extend the
Linux TEE subsystem to understand object parameters and an ioctl call so
client can invoke objects in QTEE:

  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

The details of QTEE Transport Message to communicate with QTEE is
available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
needed to build the above.

This series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA.

Tested platforms: sm8650-mtp

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v3:
- Export shm_bridge create/delete APIs.
- Enable support for QTEE memory objects.
- Update the memory management code to use the TEE subsystem for all
  allocations using the pool.
- Move all driver states into the driver's main service struct.
- Add more documentations.
- Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com

Changes in v2:
- Clean up commit messages and comments.
- Use better names such as ubuf instead of membuf or QCOMTEE prefix
  instead of QCOM_TEE, or names that are more consistent with other
  TEE-backend drivers such as qcomtee_context_data instead of
  qcom_tee_context.
- Drop the DTS patch and instantiate the device from the scm driver.
- Use a single structure for all driver's internal states.
- Drop srcu primitives and use the existing mutex for synchronization
  between the supplicant and QTEE.
- Directly use tee_context to track the lifetime of qcomtee_context_data.
- Add close_context() to be called when the user closes the tee_context.
- Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com

Changes in v1:
- It is a complete rewrite to utilize the TEE subsystem.
- Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com

---
Amirreza Zarrabi (11):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: scm: remove unused arguments to the shm_brige
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               | 150 ++++++
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  10 +
 drivers/tee/qcomtee/Makefile             |  11 +
 drivers/tee/qcomtee/async.c              | 160 ++++++
 drivers/tee/qcomtee/call.c               | 759 +++++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 810 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
 drivers/tee/qcomtee/primordial_obj.c     | 116 +++++
 drivers/tee/qcomtee/qcom_scm.c           |  38 ++
 drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
 drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
 drivers/tee/qcomtee/release.c            |  48 ++
 drivers/tee/qcomtee/shm.c                | 146 ++++++
 drivers/tee/qcomtee/user_obj.c           | 710 +++++++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 159 +++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  31 +-
 include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  15 +-
 include/linux/tee_drv.h                  |  52 ++
 include/uapi/linux/tee.h                 |  54 ++-
 28 files changed, 4434 insertions(+), 32 deletions(-)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


