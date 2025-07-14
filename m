Return-Path: <linux-arm-msm+bounces-64726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFFB033C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 02:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6A791699D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 00:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFF5189F56;
	Mon, 14 Jul 2025 00:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMNq/vDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077715B971
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454222; cv=none; b=BoKASoBzvAC5fhJaqVMD5v9rpj5C5fUNiV6g19uBOk/XtNoVuUIqRYXLvDZ79Ngi0ZGs8ksQwv9Yn7MFQ562haUl/iccL3QHI4ZaT9UiNHpgUnslEkBkgnrXjQJxPQOLyMSF0w/QTfv0GP4fvb2cZugNFE7/ZHMNLXJ43YeuVbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454222; c=relaxed/simple;
	bh=xCFrKMP9XQypsu7Jk3z3EICXaDv6vyWjX0I1vOZiM/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CCqeDXJlt3DDcyu6ULFR7ALWTJGuj1UAXwSUZNBFKg6HSFGittHkOQG1aSSFPcml5l6IETwgX/qRszMMGopCXOu+rGTCncdOSr/XZtLnPZVk2/Z7JgIHiNbAoPC22UhmwUfcDsc5+Mi87aHp7ym7+ky573yyNue2XPHdHNZavws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMNq/vDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DKWBdV003735
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pWrwIK2bJIVqiByY5nSCg3
	z8Cr6VzXERHeL/08asq8Q=; b=MMNq/vDRSKJANG+4ORxTWls+siSN06IhG6gP03
	aT6GIB/TidX0sZEyAedmqEpoTmDNeKiY12biz09yNHKmeQeMc1r5zOOOw+K+GZNm
	8qtR3hHEBZQVMA11BN4KiYmTCYfh41Tj4yeA3icGZ8ZhdsivbUlItI2BiP9l10su
	kzUj390jD3NuGnPt0UlcZv6+kMpg/eYHThsJcNZJw9o2bAffWG3/PpTbvsXgw1XZ
	NDfu2iqHErEVkZujwVJoPge3e7efJwtBni1OCipY4+ZbtPel65NvQQdaiPwGsaim
	+LI/D7XGqHdwyif6hnsvR5ndMRP1fPLkJZ16BIUS5Jyc17dg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37tsaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so6309213a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 17:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454218; x=1753059018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWrwIK2bJIVqiByY5nSCg3z8Cr6VzXERHeL/08asq8Q=;
        b=rY18pd9XNlmCtZaI3bpA/uXFgJOtL61hE9WMxpT6pwsRC1xxSztUjvVLXqRjk/YlRE
         tkRguHw256Th/QK2s+puLVvXebsqmoSoGyn/lG16wORq+FLagSLXC5KiUhL740gD3ydz
         H3e54M1wSEVXY1jWJsMnbJumPXkDfo6SWclNawhfkVNRs7Bm9SINxZTnM98IXXNkr3fI
         i0cgwV+ob8GKpeTM3JvPTYMS6ELgnHqgFGoK7nN/Kf489l/HxXr+b781+h24qvC/81B0
         SCiJ3fYVIBlqA/C76Q3rPNIYNtxecfk4SxnlHmdxVpHwTVzT7ZMSVG+xgLJmq8vV6lWY
         8YBw==
X-Forwarded-Encrypted: i=1; AJvYcCVHAdRUKJNlaSDCoePb7XL3jYtlW6t2dzywN1wzz9XAtfI7nMHuyGeOr+2kGrVfXAmu+Sa2mdbfvi3cuqun@vger.kernel.org
X-Gm-Message-State: AOJu0YzcjfV2K3kRiEvW3i95sU4gtuDEVHMaru5Q3y1pYSFkWT+Bfzug
	Gn5QBllHlgqed4mx1L57xq2Ru2cpCD1wNk3CwmpoGpFmHWZSLQ9oHA85q4Yxjy9qXHYqE/7xSbJ
	R7HNmTSlyhI64hrgwbFsyto7o/QLLxX7aL2JwI5CJoNhbXr9oZuXLkq28zJlx/EYXm7Q=
X-Gm-Gg: ASbGncvYlYVSPuGaFFm3EIHn84Ves6Kh4AdueygDXpkTADqa60x83LTlnfdll8Yi8Zc
	ROGjd/ilSxFOpIqxmYoTf1+Q3zKgqu1vLlVOIU1d37fSbjPJM2Fq1QV3ZLJc7C4U81xXzzUMi5+
	UZP81EoKPwixM8dHj+F4kKN0+qYZPebl1IpHpSmts6IoT+UWSvJv75ZuKUcKEHlBK44xPTn/AiF
	teY5Unm3Rt7fRkebbfX1O4mUtF+Iyl1Ggxw2A9l6g+VXNQse4X4sRfV479eZWnfymZNjmuYgcj+
	2wk23YP0TiRqNGPne2LLX2jgGrmSbKsoK5OfwkSbTIl9lXFZD1yuag53uaEVzY4Z2+/Lae+LjVV
	qVVTx+Om5rVAcm3hsRkG8iP4=
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr19115664a91.33.1752454218031;
        Sun, 13 Jul 2025 17:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiqh9VyrZ+33kO241/uitI3zflNwcZNstHs81S3cbdEDFUmUdNOR9eCdpHTpIVKVBac/125Q==
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr19115605a91.33.1752454217514;
        Sun, 13 Jul 2025 17:50:17 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:16 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v6 00/12] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Sun, 13 Jul 2025 17:49:12 -0700
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAlUdGgC/5XRTU7DMBAF4KtUXuPKHv+1rHoPxMJxxo0RiUmcB
 FCVuzONhLIApLCx/Eae7y18YwWHhIU9Hm5swDmVlDsK9uHAQuO7K/JUU2YgQEs6eB9yy0dEPpX
 UXddbKfw9jU2eRt5iy3P1wpWFYK3SwoBjZL0NGNPH2vP0TLlJZczD51o7y/v0vw2z5IJHIwCjk
 CikvfRTCqkLR1pn944Zvl16td8FcuHs0Ida1ErHn67aXAVur6vIdVEbJ5yCE9SXXMqxn/wrrbc
 brjdcw2kvrgm3XmpltfA2VH/gZsMN2L24IZw+BxWArER1/gVfluUL41bT4ksCAAA=
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX26kzQdvrBGeJ
 0HehPkToWAOmcIX8ON0Ag8cPE2UqIIXJ/AKcWXirrFfmtuMBo6Ee+Wq9EaVpKBeDEhorHwLEgIO
 Qk/IkOHIZA641/AVd6Oi+Dyib5w5jKA8WJFaxQLF5Ib9eZ7EL9Hz2dsK/Ot45XB2Kn330wQlnS+
 w0c6AWFbNguLGEMf3+aewuMZhH4CK+VFRXruKUwbNAXb83/afS8x/GuI8H+3q+CmxHq2yPqxvJO
 FH0TOo+F37OMb6yp5sA9wLdXxu6nsvWDeptH2XbgtEx3Vr6jMoT/XTHJYTi5F6F6iF0CJpfRRib
 bXvttDnlhQFuMpNvmPQaNJZTG/0QxPdIut9NqwFTKUCfXah69EgCRC0z44AzVWRG5nRS9upjjdJ
 FEe7ZK15RfN2B6cK2Os1DXQRR8l6HqFhHMeSxTVm0by75OJe8HNkggwAcqY9uupN2TyMNN57
X-Proofpoint-GUID: IinO0QZsyCUghl8WpwJn4GyR9Z7LzXKK
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874544b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=zvioinO-hFe9V8SQi8gA:9
 a=JRJJf7VBrBFPFrlW:21 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IinO0QZsyCUghl8WpwJn4GyR9Z7LzXKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

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
Amirreza Zarrabi (12):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      tee: increase TEE_MAX_ARG_SIZE to 4096
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: scm: remove unused arguments to the shm_brige
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               |  96 ++++
 MAINTAINERS                              |   7 +
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  62 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  11 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 183 ++++++
 drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 919 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 116 ++++
 drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 298 ++++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 315 +++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 691 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  10 +-
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4421 insertions(+), 32 deletions(-)
---
base-commit: 835244aba90de290b4b0b1fa92b6734f3ee7b3d9
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


