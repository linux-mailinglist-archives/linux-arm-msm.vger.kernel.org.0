Return-Path: <linux-arm-msm+bounces-76239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1ABC2261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 401A24E3CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C542E88B6;
	Tue,  7 Oct 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhPEHR/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD22E0410
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855760; cv=none; b=SbEYOovNJYCEo28jbiWqAOuItQLFwmkz6i2YztQATQAkiOeJJanuE0bh7CfI7rSWDsEKUrCP4v5Fn6K0yX0f1lH4BWXWc2BixSZIIdiHZ4yCfQp/nXIN5GYYSpjyDf+o71Ueiv40mCD6RedWDGBat4Xv/+Rw9NR4rlFho+6/oK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855760; c=relaxed/simple;
	bh=ORACqGs0noVFjkqRIzC7mgkhXoMvVcz9xFF8BLGfL4k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjBN+QjrV/LYSjj43aT8jd+AwCpu26OmBBgwtKn6B2uQLiqwFtb4DiunMNw2Z7O9MYFlj2rC2Y0ID5ZLX3OKTPqMLS/SvdMEPvwEXEnMc2vqo2TcBibGJs0U+R9WT8mgX9Jd64UHoQetoAPZWbcU0hwNFON2vVA9l99cKzcuqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhPEHR/e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET6Ug000458
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3SsHbrRlk80DtQuFub/knm
	jcStfwYscfjlXoW0LXl4Y=; b=YhPEHR/eZWjAqdlHzZX80N8CU3LYt8w/qDDmOq
	y7+veEl4xOSQcSt/XOStjB7GqAJDc/FPwT1Zfzgrn/ef9FjSVdvSUj2zlN9eF9Wt
	AYn5cY0llFiPJjUCHjV46Gv/47uCfNrsHNf/kadenwP3nd4nm7kqjq33I9WRUMpL
	RsCkl9OfLPmQUSstdP+HYumV65MEklPFncDRMwOUFkaSEaU5HghsJqcPPQOzQkvi
	qWeGWi8ZFRqo6pxgrIvQGYmrSSFzsH/iwIc1XKI1s62clRPKchqxU/8Yuy8DTBdR
	QG5IylgGjc88i9TpzBvBaeJ7qbbGlt2ieNNi+663QkGEbREA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgr0hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-286a252bfbfso128843045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855756; x=1760460556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SsHbrRlk80DtQuFub/knmjcStfwYscfjlXoW0LXl4Y=;
        b=ID8d7wQl5jkhCkNXi5TdlfwNgWLP/uOS13kxTW3uGccnB2tn8ou7hkUf1B3ANDOZMw
         KTG+2t0jn9o5wWh3YT/B5KlhwcJW85J+CmB/9Sy37arJSr7RXLq7bSxfS61J0gL9O33a
         ZNWaNrmQ2gtgBxTeeTZyuxtAyogBpGkkGYamldsUaf5qBmIiZKxaR55dR1NNiJTajhph
         D1XvmYGp9kKl0bgDU8LG3CNoa8tEnHbksExwEYCLdT6wSC1GMV808KYnrt/BHVL9u69R
         JxrGw2OF613JfydtNxkh9c+0QkJfRKx/q60UtVmdHsqH9cR1z+LUAJs3HVLmdJBXkc5N
         1dHQ==
X-Gm-Message-State: AOJu0Yw4Q2MtIxgEkXiYEgOLnRo4XrmgQpnWeGRJ2REqp706z9qCLgzj
	K+Tk2jZE+LRiLQpNpckcVPIhVbtxbs7ajW+YKwfaixKfriO2q3I0eTt9/PFhEGxdqLXB5w8MKHB
	NEwzywO0IBepfBzjqOSzjmqb2BZvT0/dfMT7ecc9wSXR7ScxPpBnwddSXc0bjdN6hawmU
X-Gm-Gg: ASbGnctXatnYjKhhYYb0eY9TgY25+QVdgp9UvVBnFBDVfEvkJs/z6p7HStMbaXW7o9W
	+tyD49Bp7WoH47WNbZ8PnUKgZqJT5yV/G7R6fo6JeCgRLAa+vfFSPjRnp311lTh3FMybNR+fQ5S
	EUfhpM2CQAZR26UuZa1qAYJsbCUx/i+J3hdd0d7IFxEQUbsYZRHKFInCBblLYou5Z/SPciePhkg
	G8xdOyZp7/mfwXsXi3jx06aE589Vh/di0H4rxykzRLJeCDWoqleJPSfyft3OXg1rbe01HC7PrNM
	Fk22l0iv33FiSA+jC9rCO4tOxIufxJ1yigme5/WmI8amdvCcdkqYn2e2Z+HZXYiZAfSbcvqA
X-Received: by 2002:a17:902:ce0e:b0:275:6baa:d9 with SMTP id d9443c01a7336-290272e38b6mr5347515ad.40.1759855755538;
        Tue, 07 Oct 2025 09:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7Cwbjhk9Ln1a/sV6MFv28g8oouuSH+rzC3RmgYPdyZOA+8Ox7HF5JQoYQkIi8mUXs7Kz7ng==
X-Received: by 2002:a17:902:ce0e:b0:275:6baa:d9 with SMTP id d9443c01a7336-290272e38b6mr5347105ad.40.1759855754854;
        Tue, 07 Oct 2025 09:49:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 00/12] Peripheral Image Loader support for Qualcomm SoCs
 running Linux host at EL2
Date: Tue, 07 Oct 2025 22:18:45 +0530
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG1E5WgC/z2MWwqAIBAAryL7nWCi9LhKhEhttUQWa0gQ3T3po
 89hmLkhIhNGaMUNjIki7SGDKQQMiw8zShozg1balkpVck2b44P3IRkX8Drlbywa9NY3VT16yP3
 BONH1vbv+eV7Qlr5WawAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855750; l=6187;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ORACqGs0noVFjkqRIzC7mgkhXoMvVcz9xFF8BLGfL4k=;
 b=FJqyngBWGKTeiZeXciyek46l96eCRS9NYAMZ38KvI8TMJG6MvVWs2QREhJ9UaJOTJ8MVnSYTK
 zPgA8mw6Q4CD4+y3/wwQsfKHno/fCxtZ3hGllPfip4+Omdg9mKvE/i1
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX85UQoCEjXE2Z
 ni5DK5r94gqtFAuK3sSM1nZyS4gec1UonDbc3HNlTMatsqmk8Ox1Oil7VmgfVTs/c1MjHTRePCc
 75dSQ7lEpCT3k1JXOINJD87lTL7O9I4MVzjtEmrhuFIH835JppKydWifJnmzRc43FEfIFdGTnAt
 H9Azl+qgWp9eDIIi6q3TyJoMCOp+6b3WchqWurvkxg9G4lpmrQzVygOtIp/KQed9WC0p+4pbUIa
 4U5oWc/9SE+s9yo9v5kQ+w0wNHHG3OW2ovDAcv4URFiPaJJjKrG6uK+Ed4GvJ5wxBsrFyTwylAk
 rJAUCc+yG3onchraj7STpUaX8uq6To0WZSXdor1o55ygsmk+zNceqm7nbOL0njrepJsYORQcx86
 cdnFzL8R4IdjNArnXlxhTBXw2DXVfQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e5448d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=49n8dk0KqV-O-Ing9ysA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7GIXrZcrQlb-S0gULdqCTYRsIg2GOOvg
X-Proofpoint-ORIG-GUID: 7GIXrZcrQlb-S0gULdqCTYRsIg2GOOvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

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

It is based on next-20251007 and tested on SA8775p which is now called
 Lemans IOT platform and does not addresses DMA problem discussed at
[1] which is future scope of the series.

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
Mukesh Ojha (12):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context initialization and destroy helper
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      remoteproc: pas: Replace metadata context with PAS context structure
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
      arm64: dts: qcom: Add EL2 overlay for Lemans

 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 arch/arm64/boot/dts/qcom/Makefile                  |   7 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |  41 ++
 drivers/firmware/qcom/qcom_scm.c                   | 415 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 187 ++++++++--
 drivers/soc/qcom/mdt_loader.c                      |  32 +-
 include/linux/firmware/qcom/qcom_scm.h             |  36 +-
 include/linux/soc/qcom/mdt_loader.h                |  16 +-
 9 files changed, 635 insertions(+), 103 deletions(-)
---
base-commit: 68842969e138d9ad3e3aa2bbd65d514df1581b5c
change-id: 20251007-kvm_rprocv4_next-20251007-5e4ea5a978da

Best regards,
-- 
-Mukesh Ojha


