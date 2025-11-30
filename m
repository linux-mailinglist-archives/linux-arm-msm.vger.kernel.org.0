Return-Path: <linux-arm-msm+bounces-83900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C45CC9505A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 15:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058AA3A3451
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 14:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F5F27AC59;
	Sun, 30 Nov 2025 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBvt+qqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAoHtA+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A3233D9C
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764513678; cv=none; b=haxvZbtfNucFMuA1k7XnzDDdVPwtEn7USeX+wdoTf1Xt+UK5F5uREW3j+GQVnuEcurTDKqxgODq3Bkw6k1Bk9lbBRwHLRavTeeI4pW9d3SPfJ/vTQAtVcRfx4c3ZsV6mzc3q3RVi4TqIEyRQchg+djPPcKYOzO/LWs9m+dJ99xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764513678; c=relaxed/simple;
	bh=J+hafaL2yIMA+OCC2yuTD74ZJk0OMzIt4uYNAhK8iFk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pUuAOj3ljgmKSCscdaAQxC9VdZT3qNKyylV8SRj9uRkop8UWIiuqduLoZqy/KY/E2kSg2LOg1PHkD+mG3io/9FJWyIk3o+wxBhUnXvQnCpkORtWZaNuYKrdToRMxJiV2jz0pZi+yqiIVkmadSdNB9Y1ODES0l61641H1nQHDW9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBvt+qqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAoHtA+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUDq0OH1979545
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O972evu9tLujMLwJHPEDY9
	0SejJvENvtdIFrd371ZqU=; b=OBvt+qqT9xbFN77CchTuD9UH2WEIiD2sCKa0bl
	lZlIUUGFYOYNOoGPc2jV0iVg0a213dR4g0wJMhhPFQpZ6GQEQ66X6LETGzDzGVqp
	EjsGRy5BECNFtoX4FclRuvNosq18Jua0uZyvOvChG/yop2VIEv6G4wBWL+OAeAEG
	MWPSidj7/1dW62EUHqYavd8ufYRPulhRRNxIQCe+Dd8At6dSGsXK7eqPAFIZAfVh
	HV8IKLZOBvhlleRaj9UddgvEJroqKmbJG7nCwo5nSphwsEE5oT250kG9pehYAVy+
	u1DBtof7SZnTdNFq2vlUG3OdEX/TzZZlDRpnpzlFG4H8i4og==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqp6pjhpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so4856340b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764513671; x=1765118471; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O972evu9tLujMLwJHPEDY90SejJvENvtdIFrd371ZqU=;
        b=FAoHtA+kTDQGEBvk+oh+a7T528/m1RFrzn1fRdX9DDIkXoFF1HmJJQKlbpyUCihyF0
         09rK8XwSxUXpIKFDqmxsQ1LBHvRSNaV/Y4DLNpPatQ4kn9ghNkb7MdnOU3GFkCsfxbih
         4K9iRpFCR0TXuXcou811Y9VDMhrjVoyiAgQ24sGkpTUJFEO2zmZuK35VN4kATyCqdGK1
         CMR1AREIE5l2dYl0yqDgj3FCf2zcRREMI50cET4fCin8G6fNyiN3JwTnJNv9SLMY3lyx
         /STS5VEw123pwMpknQ4IISRdauTOzTHC9YFk2lYiBj2jps0sOgOVjlegNMJiEtU6sbVh
         bUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764513671; x=1765118471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O972evu9tLujMLwJHPEDY90SejJvENvtdIFrd371ZqU=;
        b=Q0v2SdsGwd8OdB6fKnWVyZk1bSqutDYT3TrMmxOJCPDRLhSyLAgKtThovAUiC9yMEt
         hLFI87AbfKkmN24F06hJTv2+ba3BHThPebc+1WHS+Uo7+eBPM2mI/oN4Nlo58aI3r/dc
         /gF5Y9VPQqTPlQDL7zRPTJAxuivnctZx398fkZhaV9aMFZkAMT9qRYHVUPeqeB874sEV
         46X52tTvyFQMGRayVPTeNSYhrlKB+NsvgZVXLXlGIsnsgv2QBlZPNpDsXt4HhTGU8CV1
         2Cxmy/nyLvmTrBSgbYIwo8LuiqhFpzUOOdjkTyabH8FF/fR1ojY7ziJn31Q1SR5V/8+P
         jHCw==
X-Gm-Message-State: AOJu0YzTTk2IDMognWGEuGZvQI3v0H4XuezfS9nDDA5kv22Xarh8mRXY
	E1tIPUIsSvU8aajRUe2NBnz7ZEvTjcAqzhDCfyjWh2DKwwYkq2pjv15a/t5WwdA1RLxruX7svf3
	s/Dn69aedYw575gNs7fpOhpXQFpYO+6GxB+fHPh+9oPiniDZgmlj6eYqgcAAr5o37CdxB
X-Gm-Gg: ASbGnctx2c2wXK0jyFIPiRygXFQKYZtxLTE5vJhQrh6JzXihKHn3nwredPuuaMCramV
	+qR9pQ1UCUJET5LLn4vf2+xjxoQ1AGFImJaD9momPgudCm3Th4dqOC5ndOsSSLzSZdl+8sHfwFY
	+XOZ3VazYRhYn5LXlOANrQZHVYvUNUqxIXVu79SoahQ1840eNn+fXoc5rmO+cyrOJSKgJtte6ko
	O8vlLaZilZF3FJhnSIhiuWw8P2N66a+4TKh0m5dclxrgGtFG2t35rh36dKTU00nzNeUijZLHHYC
	ZXNJx0LzMX5jBN4nr+fRqvFBcdai7EGVcYWCn8uv9qmW7HnaJXIO48p0POqfe6ozK6IIB4pxYSI
	tDG1Or5eeY3KmzyQCiUwTm9gtGM09k+vX3jRpEZT0DGwrEQ==
X-Received: by 2002:a05:6a00:1488:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7c58e705ea8mr37182886b3a.30.1764513671181;
        Sun, 30 Nov 2025 06:41:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0XzraT8mWcrU03+lOGDrsV9mLO2S7OIoHB7UVsGnYP7DTUgzGp+uVWvDV37ikrSdT3jl4mQ==
X-Received: by 2002:a05:6a00:1488:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7c58e705ea8mr37182860b3a.30.1764513670678;
        Sun, 30 Nov 2025 06:41:10 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d54b003177sm5240065b3a.14.2025.11.30.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 06:41:10 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v10 0/3] SCM: Support latest version of waitq-aware
 firmware
Date: Sun, 30 Nov 2025 20:11:01 +0530
Message-Id: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH1XLGkC/3XOUW6EIBSF4a1MeC7mAiLap9lH0xhAHG+i0gGlb
 SbuvWiTpont4yHhu/+DRBfQRfJ8eZDgEkb0cx4Mni7EDnq+OYpdfiAcuATOFZ3WccH2XeNyb6O
 dqDQ9yLIGowwj+ddbcD1+HOTLa9598BNdhuD04VifXCiYEqBKXglV3HAp7ivads33RrTDdV842
 8L6aQcHjIsPn0diqnb2O6bk8hSTKgrUGl1bLXXVgbj6GDOvx4xNh7g3pfqHYQz4makz0ynmnDK
 NMBX/h2l+MVycmSYzADX0lsumK7s/mG3bvgB/MNJ8hQEAAA==
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764513668; l=5390;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=J+hafaL2yIMA+OCC2yuTD74ZJk0OMzIt4uYNAhK8iFk=;
 b=lSpNGkf8luj3GKTx6eFxxsj9OOpzYGvwqgEtZ2GFec+fK/NqklrxSkoicoeRTe4OcrocGhuE9
 gpP2VWcpGwpDOW30xW8WEdB9Vykq95MG7SGXaiQbmtfi/Xz/pBn4CFH
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: WgA3EvWlGeDgicKrN0ngtEKnl_55AQw0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEyNiBTYWx0ZWRfX3ssBzWznhn2I
 tBVk0rVNvnztviHtgCFJ9Nk2Ikw6GDnJUB/GAcDblUjvbySuHCXqPph+0XxifzEkmH8Gv8oTe81
 s19/feqJcjpigbyFdzQmeVVxXjBZQXGZ0ZACizr1/Q4Hmt9TUrIH+edJfUFL/oAPjQ5Xd/L8xyg
 BW1muOqaWH/qUgnZEzt21lnCws5z67kkxXFJb2rdzMMH9Annn4VtkdMK1mjd9VqkFtLRdeN3aHh
 6vxGvKHkcZ0rfeNRQjOfQdlnUcnPM3qIV8b+lk9p7SlXRCS7nYaPXYJfUs1/FTaq3StcJcVCs+c
 yVKdYVEEWYA8KYltf3b9HSYsffqSdzucDahxUgA0RvrL+FcnDEaqgPQhlwiB3AZ9uqAteJMXIbw
 aui6Pe5n2P4YhwAtFlFBihEnDm+FHw==
X-Proofpoint-GUID: WgA3EvWlGeDgicKrN0ngtEKnl_55AQw0
X-Authority-Analysis: v=2.4 cv=KIpXzVFo c=1 sm=1 tr=0 ts=692c578b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XOwmYTm7vgc_1ZyUsUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300126

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

Thanks to Unnathi for bringing the path to this level of maturity.
P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

---
Changes in v10:
- Keeping Reviewed-by from Bartosz
By Mukesh
-firmware: qcom_scm: Add API to get waitqueue IRQ info
 - minor update to commit text.
 - qcom_scm_fill_irq_fwspec_params(): changed name of input parameter
   from virq to hwirq.
 - qcom_scm_get_waitq_irq – declared variables in reverse xmas.
 - qcom_scm_get_waitq_irq - return irq_create_fwspec_mapping directly
   instead of storing return value for return.
firmware: qcom_scm: Support multiple waitq contexts
 - remove error prints form qcom_scm_query_waitq_count.
 - Use `ret < 0` instead of `ret <= 0` to set waitq count as 1.
- Link to v9: https://lore.kernel.org/r/20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com

Changes in v9:
By Bart
- Updated commit text for wait_for_completion_state(..., TASK_IDLE).
- Changed variable name of waitq to waitq_comps, to align to its usage.
Others changes
- Move the scm call to get the waitq_count after the clock and memory related
  init in qcom_scm_probe.
- Link to v8: https://lore.kernel.org/r/20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com

Changes in v8:
- Replace "of_node_to_fwnode" with "of_fwnode_handle to align
  with current kernel version.
- Add NULL check for parent_irq_node in function qcom_scm_get_waitq_irq.
- Change declaration of qcom_scm_get_waitq_irq and pass qcom_scm pointer.
- Set the scm->wq_cnt to one, in case where waitqueue is not
  supported by firmware and continue to probe the qcom_scm driver.
- Link to v7: https://lore.kernel.org/all/20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com/

Changes in v7:
- Assume failing scm call to mean WAITQ_GET_INFO is not supported on target
  as qcom_scm_is_call_available() is handled in Qualcomm firmware's TZ (EL3),
  which doesn’t implement WAITQ_GET_INFO, and therefore always returns 0.
- Link to v6: https://lore.kernel.org/r/20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com

Changes in v6:
- Added R-b tag from Bartosz for first patch.
- Check if QCOM_SCM_WAITQ_GET_INFO is available before making scm call,
instead of assuming failing scm call to mean WAITQ_GET_INFO is not
supported on target.
- Add a new patch to check for waitq idle state in wait_for_wq_completion().
- Link to v5: https://lore.kernel.org/all/20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com/

Changes in v5:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Modified qcom_scm_query_waitq_count to take struct qcom_scm as
argument; scm is anyway stored to global struct __scm after
smp_store_and_release().
- Tested on SM8650 which has multi-waitq support and SM8550, which
doesn't. No error logs are seen.
-Link to v4: https://lore.kernel.org/all/cover.1730742637.git.quic_uchalich@quicinc.com/

Changes in v4:
- Moving back to redefining GIC_IRQ_TYPE_SPI and GIC_IRQ_TYPE_ESPI macros
in qcom_scm as seeing compilation issues in linux/irq.h when including
arm-gic header. Will send a fixes patch and move to dt-bindings in next patchset.
- Fixed a few compilation errors.
- Link to v3: https://lore.kernel.org/all/cover.1730735881.git.quic_uchalich@quicinc.com/

Changes in v3:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Prettified qcom_scm_fill_irq_fwspec_params()
- Moved waitq initialization before smp_store_release()
- There is no Gunyah hypercall API that can be used to fetch IRQ information hence
introducing new SCM call.
- Link to v2: https://lore.kernel.org/all/cover.1724968351.git.quic_uchalich@quicinc.com/

Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.
- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

---
Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()

 drivers/firmware/qcom/qcom_scm.c | 126 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 108 insertions(+), 19 deletions(-)
---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


