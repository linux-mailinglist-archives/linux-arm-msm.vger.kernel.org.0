Return-Path: <linux-arm-msm+bounces-70019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24676B2E8D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 01:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14382A23139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C642E1C7A;
	Wed, 20 Aug 2025 23:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+yXiGde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1F2E174C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733147; cv=none; b=BjQmTWp+0SVe1vvL15N6HUpLX94GftCuFkzBh/0hTK9xIqjDeKacWqJBn9x6PjBvG1PmmlmzVDcMQ6hJv+Z6bNYOvjsEvKKPuUeLyaVs6wKKVidz2+gHX+fMBzL4Bdm5VtkCKWsYtII7fJQYK5yNsppO6hZbK6KGHLXwFlvJ2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733147; c=relaxed/simple;
	bh=3dxvW/aRhyD+Wyr2hXazmmmQ81sQxylI9G1aGGAAKRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xp2+eK4YJulzF/kyCaw/I/6G8Wx5kAUYs1cd/gxwJK2v5QrsBjvJ8Wf41nsrgLOQTs64l1hUkNtjSZ3ZKdmPTdCU3w9XNuXo/EmEzc93ryjPqou2TtBCTuuNViMXu/AUXXKF3kIKljXjV5mN7ZLv/vqLIsb+AN6i+0D2p3Wceqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+yXiGde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFD0uY021551
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gemXNO0z4CkeTgFG8BGrS+
	8RodbEXB92Jsq8NkLUlSE=; b=E+yXiGdevbt99Sz0272ECkUq1WkaPn4ETRhuJj
	LDjOc5DY8hzKLkaEfz+bFnxHueRBpxQG0fNmJQ41+s1dIUEw1TMJnfFASlO8csBZ
	0TOo+DjPFFb43uDJzHyMpsZ/2VmWK2D3e71fo19W2PUcuGfvUrVEGP2Aly1Fw1xg
	Kk78Wey/Mo5OOZvQMZclVeT223zVq4kKelcT5kNA6rPDDQoQIN0tqKXjbwir4XW6
	Z2MiTdtkJ0Or2+yH4W5698wnNsQdfrqOgcsK+KCZqOVYizAuowd6w6RK6cUOt0AG
	x10hMF/6U0rdCqN/7mJmjvwBhNc9RhDd1L/L9IrtGMDc5uNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdh7jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324e318d628so449213a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733143; x=1756337943;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gemXNO0z4CkeTgFG8BGrS+8RodbEXB92Jsq8NkLUlSE=;
        b=fsKRSBE6Y5Xny1YdgFMypulG91jV/nLkhLbNOx0WWVEzq/C6Yla4cHA8jLbkUZzt/w
         b9gF/urA0aH+GEa1UY4qGPg5/4PZmeFWCTrUrKB/EYS9RarsJ73NKiMig2Zry8ox+WeM
         7qO3xIiXA28NPgyhcVZlG06z52L5EQVWLKSYdNT+f++tTl5KSwtW4D7OoI8YnrHo/k7i
         QVpw5P9NrQmMpFVLthXKM6nAlKZLS8fbfp79j4Bzsgx0So8JR/Nff0tx76QbPE5TZtWI
         NQ9m3/oxpVUp/35HMNvSL7tDmZ2DSehVwi3AvmzalG1eMGXZIpmxcFJFx3OjaGWuoaAw
         zSuw==
X-Forwarded-Encrypted: i=1; AJvYcCWcI+fdViPxHMbyn41F0L41vUAm2uPHfzjMeiGnRDSJhGVQMT3yhSa9nOJcE9TrN8q5Fg4djj0uxB5BlobI@vger.kernel.org
X-Gm-Message-State: AOJu0YyFtzVUT5EjEhe6leG0+dJxfdm97phT0gSn0qgyAKieuy2yPN33
	IMdNl9Fdj5HsjnnSDVCwpVSWy5BYsLPraeycXIJ8cuHnbwriGS5neKgMIuQwZtX09ZA4vFpiVgL
	cj66ZfhQ/obVCOa5qkHFLJpqp+7gFtL4ZCGsJ9YLC+Rd8oWPcVn7ajsW3Tx4rIKtsL0o=
X-Gm-Gg: ASbGnctEeOvadvKPnlWC9k9QFPLTJObZSIDArIljB21Fs5cFnvaGYpOxNdPUxwEcEnQ
	C9ez+XBYVf4v4gokHWxXkRXvjLY4dQeHEmUS/Gzq51K1rv3w6CGsMYei2K4dhEwxIN+JZVdbhBf
	yLvllb5xDXevm15E0u+JLp6fIwuQMNnTZ7pi5vAEiPrqYCyTHu8VqSc6wCBl9lqHQw5tba8iQ9c
	zT+a5tXosKFeaoxAH2fiIE8J+Sy3G1HPu/kNTqvAqhstPRfmhsErlgKkVeL8nLuVTHJQJRu2rrj
	wzS/FYijntKgAghfoloIGHhz02ZHdfNJY9v06wtzz5/jRJ6z59RHyNTdWTSqJBhTRJ4+g3XhKVC
	5ojpJYrYx7g5gGYMYZ6eNKPE=
X-Received: by 2002:a05:6a20:2450:b0:243:78a:828c with SMTP id adf61e73a8af0-24330aaf0fcmr367772637.51.1755733143234;
        Wed, 20 Aug 2025 16:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7+jW3v0PtTNRQzvMVn3dQjkZvbfV7Gl7WqqWLbMH3Vq7w6tv2b7ZkG2mYUj+cnarOf01nTQ==
X-Received: by 2002:a05:6a20:2450:b0:243:78a:828c with SMTP id adf61e73a8af0-24330aaf0fcmr367745637.51.1755733142744;
        Wed, 20 Aug 2025 16:39:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:02 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v8 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Wed, 20 Aug 2025 16:38:47 -0700
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhcpmgC/5XRwW7DIAwG4FepOI8KDMFpT32PaQdCnJZpCUtIs
 k1V3n1upSmHrVJ2QRjh77fkq8g0RMriuLuKgeaYY+q4KJ92Ilx8dyYZa64FKLCaD9mH1MqRSE4
 5duf7LWf5EcdLmkbZUitT9SqNg+CcsaoAFGy9D9TEz3vO8wvXl5jHNHzdY2d9e/1vwqylkk2hg
 BqlSWl36qcYYhf23C5uGTP8uPxruwvswgHJh1rVxja/XbO6BnCra9jFxhao0EAJ9SnlvO8n/8b
 t7YrbFbdQbsUt485ra5xV3oXqAV6seAFuK14wzsshA6ArVR0e4G7FUZutuLtNfsCmwtrqYNwDH
 Fe81Jt3iYwHQq89oi2V+QNfluUbo1InUQUDAAA=
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a65c98 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hlSAHII3iifkWu_GNqkA:9
 a=VFtEx4kt1Eq4HBBz:21 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BLsHGidZbEi8ARnWKU9fQteiWHXmVlt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXxeqrh1nc8RYN
 BbnU7v3rzOSrWHTCnlAwVBZYvkS+BREmkYiW8CLyzmEVp0RN2C0Uy3PCyzfII0eN8eGcACfB6xH
 qi6K03Woth/+MQEDw1nSa7Al9yb4ubzWlDe9B80sQAARxx8ELLc2RoXWnSdOmJ4iWpzV2TXDLfK
 h7VYTKdlA8N0qSL37N6rV8iUx8jt646mMLyShFE8D3jX5UDUUQ4MLGxj/CXowTBgyujWEIhSn9I
 PtgAaMx64GNV2gHkUEYi4scSz6lz8+koo31/aW7FFjR8RlhZ/i6OVYrrMFs863tgS6Lj5ka23Tf
 MrtwkL7DvN6/IbOrrPs8JvITrFOploBTn7Dv5kmvXtV0hP/iJBLQhFTTYo+fcfO1VNtu9jZXJav
 zgjMKiinam2RaKwDGh8LvKc3+vpwRA==
X-Proofpoint-ORIG-GUID: BLsHGidZbEi8ARnWKU9fQteiWHXmVlt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

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
available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
needed to build the above.

More comprehensive tests are availabe at
https://github.com/qualcomm/minkipc.

root@qcom-armv8a:~# qtee_supplicant &
root@qcom-armv8a:~# qtee_supplicant: process entry PPID = 378
Total listener services to start = 4
Opening CRequestTABuffer_open
Path /data/
register_service ::Opening CRegisterTABufCBO_UID
Calling TAbufCBO Register
QTEE_SUPPLICANT RUNNING
 
root@qcom-armv8a:~# smcinvoke_client -c /data 1
Run callback obj test...
Load /data/tzecotestapp.mbn, size 52192, buf 0x1e44ba0.
System Time: 2024-02-27 17:26:31
PASSED - Callback tests with Buffer inputs.
PASSED - Callback tests with Remote and Callback object inputs.
PASSED - Callback tests with Memory Object inputs.
TEST PASSED!
root@qcom-armv8a:~#
root@qcom-armv8a:~# smcinvoke_client -m /data 1
Run memory obj test...
Load /data/tzecotestapp.mbn, size 52192, buf 0x26cafba0.
System Time: 2024-02-27 17:26:39
PASSED - Single Memory Object access Test.
PASSED - Two Memory Object access Test.
TEST PASSED!

This series has been tested for QTEE object invocations, including
loading a TA, requesting services from the TA, memory sharing, and
handling callback requests to a supplicant.

Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v8:
- Check if arguments to qcom_scm_qtee_invoke_smc() and
  qcom_scm_qtee_callback_response() are NULL.
- Add CPU_BIG_ENDIAN as a dependency to Kconfig.
- Fixed kernel bot errors.
- Link to v7:
  https://lore.kernel.org/r/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com

Changes in v7:
- Updated copyrights.
- Updated Acked-by: tags.
- Fixed kernel bot errors.
- Link to v6:
  https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com

Changes in v6:
- Relocate QTEE version into the driver's main service structure.
- Simplfies qcomtee_objref_to_arg() and qcomtee_objref_from_arg().
- Enhanced the return logic of qcomtee_object_do_invoke_internal().
- Improve comments and remove redundant checks.
- Improve helpers in qcomtee_msh.h to use GENMASK() and FIELD_GET().
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v5:
  https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com

Changes in v5:
- Remove references to kernel services and public APIs.
- Support auto detection for failing devices (e.g., RB1, RB4).
- Add helpers for obtaining client environment and service objects.
- Query the QTEE version and print it.
- Move remaining static variables, including the object table, to struct
  qcomtee.
- Update TEE_MAX_ARG_SIZE to 4096.
- Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
- Reorganize code by removing release.c and qcom_scm.c.
- Add more error messages and improve comments.
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com

Changes in v4:
- Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
- Rename object to id in struct tee_ioctl_object_invoke_arg.
- Replace spinlock with mutex for qtee_objects_idr.
- Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
- More code cleanup following the comments.
- Cleanup documentations.
- Update MAINTAINERS file.
- Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com

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
      tee: increase TEE_MAX_ARG_SIZE to 4096
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               |  96 ++++
 MAINTAINERS                              |   7 +
 drivers/firmware/qcom/qcom_scm.c         | 134 +++++
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  12 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 182 ++++++
 drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 914 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 116 ++++
 drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4427 insertions(+), 28 deletions(-)
---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


