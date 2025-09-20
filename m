Return-Path: <linux-arm-msm+bounces-74293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1FB8CF34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286A27E1E71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A3724166C;
	Sat, 20 Sep 2025 19:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W573NwvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808752AD31
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397308; cv=none; b=kKQ9VtpWqiVJfAX8HhhIjK+xWLv7HwcFkehXeq5oxJ6PdKyLvst22REEZ+QAB2s8JICJOL+QlL48h97rsVd0lasU/z4BQ+XsPJV3Jb5rRB4w7NbEGN24VIBa9iPwlZNRnFTuBZs1D6R5E0RrJCuefZnqxPMK4I4mtttO+G9nGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397308; c=relaxed/simple;
	bh=K2OyxdO7ubcOPTwnuaRk/c9sNPk7E+gpfFWfYmyPSeE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C3pT32OiV2FgOY4/Yk3POGlU0XNS7U0BY/z60ZjlItouQImQT3st4jiWF22G6IYXJxr5OASwPHbuKpAeY6cMsnCzt+rM0I8+rnr6lxrnLjrK1W30hSky5XNHGdp8tVypdNfYQPZEcE4OOKj3lS6tRldT0FrQjmcbjFD7qwWC5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W573NwvO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJEqFp016427
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fT06xmtnl6rWFVbfZrdV6V
	rMvIkSRrsGT4Wh5dam0ls=; b=W573NwvOrOFVDcb0FRVhxB8Ud3ZUb7iFZwtKAD
	BZI7b4pjywkrAe9mAMVfm48vALrzemRydiQry66WDLidsQbG01yn+NBYCpWs51Zc
	mbKa13Gqizz//Xm55tK62rpF0xUfmwyDQX9WIrO/mtbtLqTHjnxp90tf7EmQbzYO
	T3GcnZidQKJn2UF/zpdttzoM3Do3V2LYS49tz5sYlYW+rBy/wD/JGanlKk6jtxG6
	Gzy+EPAra7LbnlG20khWvuL7o37e7SmonCBkbLaQegIFkEP8VD0R8DmYFTILGbUN
	ovx9iUJTRPLkQTZIP5IJpbd5d450cu2Sl7NwHWSJnUdHCOBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg316au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f2a990c55so92953b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397305; x=1759002105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fT06xmtnl6rWFVbfZrdV6VrMvIkSRrsGT4Wh5dam0ls=;
        b=lp27e/Zde0V5SXLZfMYY4s2ROUl2rXzRS8ZTlMWsmXVapmcIvVYfbf5JxBnjlQlu4J
         0/wvVzpd1K8BlSmZGcJz/uFzLah7nM/t5wlVqzuU2uPdzairLagR4wFykH0/AEC3dkEG
         Vj8NB4G6MRGk/1LETrODMUhkaSQGeaYOYN62ZMmMY/lfa0CHNiVtyw5XqkkLNcam0Vel
         lpG4mSAkbLbYkHhQTYFwKtguwJNt3ftozvdM6H1HfD1CWL4cpZo9yCvwsk1F/BbJzAlq
         1qPYvElVSD3ynQC/mVAVqYqS2aUH91ubiyxl/ntI3Gm2MciwFSoPqld1EPyGSuCm+MPe
         511Q==
X-Gm-Message-State: AOJu0YwGG9fq0q9yWUu84VykPpyxFUqLhiLceWusc0RrE/jnPw1lDZGm
	KvY7/zrZVJajM0O+mP92CDDdR2eIawk+Qook16qL4kGUXsjoEktdsRtYlgJVo958ZUdxI53JwAD
	1K4TeXi0Tt1o4oCK3J1lzKwmlj3ITDr1qtLFxXKfeT0C2ZPqO4Ai/P7P5krO1m1qxCXCJ
X-Gm-Gg: ASbGncteNWUKyMrFAsSmjpmltWrMnwB7EuYX+6HY0KrAd1oMWBNDEpTWdL9Kwe52XrF
	EZc3z5j62+4SHjQOY+eG8GHD7RgaSzF5EBEnK7OHQwInITI6KTTi8wYEZkXfdIMbHbvNGDezMSj
	695tuZxBkpOTN3yqQWnac20i8hGtiIN15cVnPbwVHGpIcH4R1CeFF63SvT0LG0OuuG68ravTIdP
	Pj1/3DTxCilBnMV3IaiquTkgy8JpWziGX/Ww+hZQMYJK38BPj2r24xSvsn+5Tl8WordRqMWjG7b
	BYMIKRg3LhxUSsYWgtX4pO+xc6C3Z8bH9R3Y+eJww/NNL163bZn8kGVFHtYy1EuWb6U=
X-Received: by 2002:aa7:8892:0:b0:771:fa65:ae6e with SMTP id d2e1a72fcca58-77e4e9b283fmr9779083b3a.17.1758397304469;
        Sat, 20 Sep 2025 12:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVBpwzcISySMoRxxhSW3bqAQjfkkmpHz+UKOp5LWSOH0BtJkY9TttWmnrSMnElGO3I9VQqkw==
X-Received: by 2002:aa7:8892:0:b0:771:fa65:ae6e with SMTP id d2e1a72fcca58-77e4e9b283fmr9779059b3a.17.1758397303977;
        Sat, 20 Sep 2025 12:41:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 00/12] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Sun, 21 Sep 2025 01:10:58 +0530
Message-Id: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEoDz2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0NL3eyy3PiigqL85PiCxGLdFFOLtFTjJAtLk6QkJaCegqLUtMwKsHn
 RsbW1AAFePm1fAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=6066;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=K2OyxdO7ubcOPTwnuaRk/c9sNPk7E+gpfFWfYmyPSeE=;
 b=oTq0EA+J851yqjgWugcghVLyhbBc/9uMo0h6d2YorWDNXrLOeSkR/DeNihp/ezF1AbN9OTjVv
 Dz5n0K6ZRk1C1ZEky0HI+DBUl0qIt5yXeMOB+8aS0YvbFiiIHokHR56
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX8UYmwsBTv5w5
 ROwlrgNJV2/T/QvL6SDSZYtxwM+XaR0PSQdV9hjdFSCFt+kO0i3fJ9kaG/De3o5gvqVyMcPrfJh
 cvOt13B0aa0ozKD2BTdLDypRcnCMLAR3NK+aBQe2iIkpNzaC/RRW1go9y69AVLcWSP2yL9mSY5Q
 s3wG/eczOeLckfwtW/B11+KWeKxA2OfcuoEXVWvUGMid7coF1PKFCo8luWxKweXNJZmRr1bwa9L
 x1gJpnyIzodmi+ZaiFlVlbWW/gHRSUorvCP1XxBSqxWimZiEjVbnG7f7r8lKIaaJaViEFGEQjEy
 fh+yZVZV0acNL5rugj5bTQgSZksmQhECNFVHMA/DuLg0go7BR4wfWr/bO/gMnSNO/BrrlGgCHZL
 B4QQQKQ2
X-Proofpoint-GUID: wANDSio1KdS4Wfi_94Cb3_IU6j-nEPgX
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68cf0379 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VEXWNMxOzYjbEOQZ4E8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wANDSio1KdS4Wfi_94Cb3_IU6j-nEPgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
related to Secure PAS remoteproc enablement when Linux is running at EL2.

[1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa

Below, is the summary of the discussion.

Qualcomm is working to enable remote processors on the SA8775p SoC with
a Linux host running at EL2. In doing so, it has encountered several
challenges related to how the remoteproc framework is handled when Linux
runs at EL1.

One of the main challenges arises from differences in how IOMMU
translation is currently managed on SoCs running the Qualcomm EL2
hypervisor (QHEE), where IOMMU translation for any device is entirely
owned by the hypervisor. Additionally, the firmware for remote
processors does not contain a resource table, which would typically
include the necessary IOMMU configuration settings.

Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
Authentication Service (PAS) from TrustZone (TZ) firmware to securely
authenticate and reset remote processors via a single SMC call,
_auth_and_reset_. This call is first trapped by QHEE, which then invokes
TZ for authentication. Once authentication is complete, the call returns
to QHEE, which sets up the IOMMU translation scheme for the remote
processors and subsequently brings them out of reset. The design of the
Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
is not permitted to configure IOMMU translation for remote processors,
and only a single-stage translation is configured.

To make the remote processor bring-up (PAS) sequence
hypervisor-independent, the auth_and_reset SMC call is now handled
entirely by TZ. However, the issue of IOMMU configuration remains
unresolved, for example a scenario, when KVM host at EL2 has no
knowledge of the remote processors’ IOMMU settings.  This is being
addressed by overlaying the IOMMU properties when the SoC runs a Linux
host at EL2. SMC call is being provided from the TrustZone firmware to
retrieve the resource table for a given subsystem.

There are also remote processors such as those for video, camera, and
graphics that do not use the remoteproc framework to manage their
lifecycle. Instead, they rely on the Qualcomm PAS service to
authenticate their firmware. These processors also need to be brought
out of reset when Linux is running at EL2. The client drivers for these
processors use the MDT loader function to load and authenticate
firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
to retrieve the resource table, create a shared memory bridge
(shmbridge), and map the resources before bringing the processors out of
reset.

This series has dependency on below series for creating SHMbridge over
carveout memory. It seems to be merged on linux-next and pushed for 6.18.

https://lore.kernel.org/lkml/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/

It is based on next-20250919 where above series is already merged
and tested on SA8775p which is now called Lemans IOT platform and
does not addresses DMA problem discussed at [1] which is future
scope of the series.

Changes in v3: https://lore.kernel.org/lkml/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/
 - Dropped video subsystem enablement for now, could add it in future
   or on a separate series.
 - Addressed most of the suggestion from Stephen and Bryan like some
   remoteproc code checking resource table presence or right error
   code propagation above the layer.
 - Added leman-el2 overlay file.
 - Added missed iommus binding which was missed last series.
 - Separated qcom_mdt_pas_load() patch and its usage.
 - Patch numbering got changed compared to last version

Changes in v2: https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
 - A lot has changed from the V1 and a fresh look would be preferred.
 - Removed approach where device tree contain devmem resources in
   remoteproc node.
 - SHMbridge need to created for both carveout and metadata memory
   shared to TZ in a new way.
 - Now, resource table would be given by SMC call which need to mapped
   along with carveout before triggering _auth_and_reset_.
 - IOMMU properties need to be added to firmware devices tree node when Linux
   control IOMMU.

---
Mukesh Ojha (12):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context initialization and destroy helper
      soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
      remoteproc: pas: Use PAS context awareness in smc and mdt functions
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
      firmware: qcom_scm: Add shmbridge support to pas_init/release function
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
      arm64: dts: qcom: Add EL2 overlay for Lemans

 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |   7 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  28 ++
 drivers/firmware/qcom/qcom_scm.c                   | 414 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 187 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      |  19 +-
 include/linux/firmware/qcom/qcom_scm.h             |  36 +-
 include/linux/soc/qcom/mdt_loader.h                |  15 +-
 9 files changed, 607 insertions(+), 103 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250919-kvm_rproc_pas-d58fe3b894bb

Best regards,
-- 
-Mukesh Ojha


