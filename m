Return-Path: <linux-arm-msm+bounces-76968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E155FBD2722
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC6474F0475
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298A62FA0D3;
	Mon, 13 Oct 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFWBKVds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0E2FE06E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349845; cv=none; b=mPuZxQyyHQ6t6WkL2dgSTUlZUnNvLW1tbQnsWwOljAjQQbfXaJlpOONZtn6Lmk29KKUW2jRTQ2LEgwesIGzgxXTkKG36HTd8pdeOfx3mOnfAWLVftKBdOYY94YQN/SvHWqCfxqFICwhd0PN2HnLfp+CS2YMr9vaU3fOsu6L1wQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349845; c=relaxed/simple;
	bh=Ei6PA3g3q24dAZqaUBEWojlEHM4dcLFS6hLuwlUwwCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AQ7Q+rC//mNrA0Di1E2Bz+86fLUTV4z8ziGT7wM1NDI/OHzeK/U2sZQ5mxaBRQQ+/WVwmVPjN+dl9eGCqIoxfewKMwX0IlyDMRNFaH657ozRmJ1maaRjKutRkams04UuIbaLamAgg/djNpg/s0EJqzvjGxhNJ0LLDegiDhDvUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFWBKVds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nLBo011084
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6YRXS6ipBhlQ+K37juxhKB
	f4e2ks9vU8ljk4kcnPxL0=; b=aFWBKVdsoqJq4UrOEy3hoF3tURiGy1mGl6BOR1
	w0sNguk0nNjCD1eqALVxsMqrQeYNc2mKDKKVHxRGKxtM4Pt0YW0wclICCyY8l9TB
	cs0CcMiOjMqSGar60PtQDXBY2keV/7wbZ1CyFSJMwHnCvyqTiresdQf5Td38dgM3
	PJqXyIXpHN9O6pJMErRyOLkIJNGnbEd4eyiYN+cS3+KLK7xzATFIqt9DFXixBDCQ
	EaDPdH4bid8Sc1qLw+ctxuVYJNsEo5NH3ceKzOwqDJTKT5WtQ0/bg4zDD3bKFtKN
	zDaguK/VBd+fJyUYFTSCPeZEmUp71GoylmZeHlZBdG0sJ6ug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bv464-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:04:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117fbda6eso6646434b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349824; x=1760954624;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YRXS6ipBhlQ+K37juxhKBf4e2ks9vU8ljk4kcnPxL0=;
        b=XMePyqpygxx08CYRW9MpDdLxH13JfOigSm7CcNT6bDTUa2fvT1cAk8BNfWqkBa3mz0
         G5udlmTIorczqNUhmhx3aGaXax6qypwayx8a6xaEAoPGHTH42hk69dMbxiIPwWXg8z0i
         vjzR2T1DOIe4hHpgYw4HfjaA+f7Uf9cJ4uhwYLmtWv03CLIwKGRgQAK9Y9hTMyXwH2+A
         rSljDvAcCB/iFksXvJ6YXB/4d2YTAbVZIbfl90VBwkYVGgC+v/owbku5L2n5MAAQcA7e
         gGIs8yJvxJje/RWDLHC5DQ26S2RbGISCmNwmZI3q2QApSWoF7fU3byVKYn4b+jGTd4nL
         ZW7g==
X-Gm-Message-State: AOJu0YwJK79Rginrr128Qck3KEi/N6qbQ9fZCq/+RO3DJHv3hhuG/NJt
	l7LYq2qwdmSYN5usQDl4IqK7OUf28zRnZj6ap0oK+fhavgwf1u/d5U0TrJNaPilS3o2KQpOCyID
	FZW6e/N854N2eNGh/0QW8bTATdH0d6K1GrHkmbRBg9iql9bjcxY4/WyLFsyW2l09HlNMn
X-Gm-Gg: ASbGnctnXmIcZ/aLyMztmVaKSzEk5CZi+SMEVl3f6S8TVuw02aMBRkNlUXJgG+uIgJ9
	bWuvdgZ3s+4zjGmJcRvpLMxv7fDqgy0rOIcKCil7h65q+g5W1J96S6Bc5lpNbaHf12RWqoXksLp
	ZpAXXosmfOFF7oJZBl+QXPVTa1tEyj7YYA+UuOLzm8tRU36wEqNw7hoQnuhTL9c2XL3bH/djRdh
	EnGsy99udr/wMuJqkzi2LPrA3L0d5015LVuye4gvN/EWf8CFUm7F5WeQ7pJOf9qUp6dmVuAURTa
	UurJzOEY9LuDQ6QMxjKWacRCIhsrWYukSD+/65ujFR+Gh1IOnXOf3g97BLk+iGtkoT4=
X-Received: by 2002:a05:6a20:244a:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-32da8541ca1mr30984327637.58.1760349823609;
        Mon, 13 Oct 2025 03:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Q/kwFAiD6RAhZvidKQboO72b1UY1lEUg3fF/y94ZV8hYjl/I3O0Fs0UJ38flG6eycX3aPg==
X-Received: by 2002:a05:6a20:244a:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-32da8541ca1mr30984277637.58.1760349822883;
        Mon, 13 Oct 2025 03:03:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:03:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 00/13] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Mon, 13 Oct 2025 15:33:04 +0530
Message-Id: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFjO7GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3eyy3PiigqL85DJT3RQjk2RDEwPzRPNkSyWgjoKi1LTMCrBp0bG
 1tQAqw7H9XQAAAA==
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=7074;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Ei6PA3g3q24dAZqaUBEWojlEHM4dcLFS6hLuwlUwwCQ=;
 b=Tl05bXSaLKxi5KNZBKmaY3oKMPMH9HbUCk9Hj2ABC8Z1+O57VnPEH2mqqlZ25YKUMX8YoG1Ew
 RLadSbdSG36DNgNO8er68Mt1SdhHVIKjWiqTfPPHvAlzR995yikF4pG
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 7hHGqA-FQxAhgEjRZvsvsl1pL3y36o7D
X-Proofpoint-ORIG-GUID: 7hHGqA-FQxAhgEjRZvsvsl1pL3y36o7D
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ecce91 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ub6GwUUsmU9i4wFGv5wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0DrUZ/wNGgiR
 g/T3DZQqDMqjqsuBWfKUT599dUCv9SQmjZWJDgZHEyd3WT7XyEAUOGROMND8YgbRr4kLMggaI6S
 ancL0kFZ5qLiC3ukyQI/07HCSY5Z7Z/GztsmFOg2KJ6fYyzyioLXziQ6x0gE+Muik/oaAm5T9LB
 uoz0/kTqU+OjKCADs+avkywlWdm/OkOhmjxUEwDDHAqVhmH4s9DlgJjarMtB2+eYlPSmvJcfdWf
 G93pISLCNm9VeE0U4DK54ng3xdRwCx6VidAYhG0YEWCWcQCf6eusxuoH6YSOVpSpxtaC1SU/xoI
 F+7wlAYe/2H9VcA45Zc+2UoCRBX1sHFbnR6WNB7OB3xIxiIBku7y04mdP8vCW0d6kH5FO0TyNIs
 WGRrjvxX1rzDFGSXC+6yL2JTr9RWzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

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

It is based on next-20251010 and tested on SA8775p which is now called
Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

Note that there is a regression on booting KVM on Qualcomm SoCs after
commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE").
A fix has been purposed here
https://lore.kernel.org/lkml/20251010174707.1684200-1-mukesh.ojha@oss.qualcomm.com/

Changes in v5: https://lore.kernel.org/lkml/20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com/
 - Replaced minitems with maxitems.
 - Addressed comments made by Bryan, Mani and Konrad.
 - Fixed some of highlighted issues in v4.
 - Added a new patch which removes qcom_mdt_pas_init() from exported
   symbol list.
 - Slight change in  v4's 5/12, so that it does use qcom_mdt_pas_load()
   directly while it should use in the commit where it gets introduced.
   Hence, reordered the patches a bit like v4 5/12 comes early before
   4/12.

Changes in v4: https://lore.kernel.org/lkml/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
 - Fixed kernel robot warning/errors.
 - Reworded some of the commit log, code comment as per suggestion from Bryan.
 - Added support of gpdsp0 and gpdsp1 and disabled iris node.
 - Add R-b tag to some of the reviewed patches.
 - Rename struct qcom_scm_pas_cxt to qcom_scm_pas_context.

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
Mukesh Ojha (13):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context initialization helper function
      remoteproc: pas: Replace metadata context with PAS context structure
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
      arm64: dts: qcom: Add EL2 overlay for Lemans

 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 +++
 drivers/firmware/qcom/qcom_scm.c                   | 394 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++++--
 drivers/soc/qcom/mdt_loader.c                      |  42 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  35 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 9 files changed, 598 insertions(+), 113 deletions(-)
---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251013-kvm_rprocv5-d24c1407a7c9

Best regards,
-- 
-Mukesh Ojha


