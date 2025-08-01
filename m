Return-Path: <linux-arm-msm+bounces-67337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26778B18080
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0821A83FF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF9B239E95;
	Fri,  1 Aug 2025 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WERKOMoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791B238C29
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754045995; cv=none; b=j/hoJcxO0/aslwlWMEvyll/O8pEhaBAo4r9DwVUouf21bZEIjBlaL7AbjjnwuDnNubYBfC4IGS+F0viyu82FH+9ra1Hqdj7MCVlycgUybp8dJLH9gjRk8IkJYUzCmXKSu0go15xpzQDV9dUBaMw0k5xyjgAYmlnUkWzTPgjptnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754045995; c=relaxed/simple;
	bh=/4HcNsYuPuKqKa0GMfjXIWddRLLdPlG956ypUck+HYA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NJrPHamtC3umE/6wph/Bs01EQZkwQtLSS0GaD+jp02sy0aZxzzCMR1qiJR/W7kx8lIUQsPesFQ+n/zxBelC+KUQ3pYrI8R8lHb1FcShbYmx3ClshUmmxgwv/CYhHU5AXCmzlZkMgKObn4k5gEJjXtkS5JZa8PHLLWmqs3idpKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WERKOMoG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57196DLE020327
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 10:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zTFFAeIFTLiRy/i60mIiB2
	RbpJFjzSiBU0ApmUpYKnQ=; b=WERKOMoG00NbFz9aKmnIpQzad8au6L6g6DMvC9
	4O+f2W/xA50biPAgtzWOT5hVv838s15YjdJH7xPmSpUOiS6/rLrTAFuR1KaiBjxi
	urgdY6IUTYsqofYdzpjaLO8G5yk2JZGtqzWIMtsFnRDB6RFP9v9SyEXNn66SENyx
	eyOrj9wFK8TNyrSypFEMAtg6qjAksDi4dGHkqapiuahJdJbdEsqYD49i5q71bTh9
	YEmGPwaDshASsA8Sth90ZwvLlHj1nWobPRaCCgzlArllndJgSBrX4ZECCYFRTkp7
	p6DLUEodTJCxf+OUOvx0WYXpcDjj4EXksUuhQTcItb1a9Pkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aufgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:59:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31ed9a17f22so2553911a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 03:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754045992; x=1754650792;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTFFAeIFTLiRy/i60mIiB2RbpJFjzSiBU0ApmUpYKnQ=;
        b=NY5w7QwtcYARGPSmXedVkqQZp3g4DiGfE7vPIgnnH9GU+gWms9ZArvHmR4cmEJveYj
         sdplpJ7H5YGLYgNj+Kh3Pq8xgZAA/hBjX6cYX0izVcNNyftzx6dNa8r2GdB4zr3HY3NY
         K4iH1woIxhXi/Htl1tTcwYRfytryRnWnWScJBGB1PA9tACVSJtIrWhmj9dTQPDToBGzc
         8rs2aeaUtlDhxRzD/2jjiYL02hxOOQ8LDrMa8SA9h0jRUV0x3lhs80rg6jM/ScxYgWWi
         oKNdIzUhlbPV+pYxyKSn9GYWdttZcZI4fTVba19hURGIYxJP/q0SSTb9lNN9HUHPHe04
         8s0Q==
X-Gm-Message-State: AOJu0YzD2AEgyt+PdmcLqaZHK4rkV+BUV7AY/JKe1bBz2qIfFH2x+rqw
	aqY+4u3A4rNAOMJnrzkShkC6+xNyZoiWoqjwp941ombiOI0cr8HxNx4owikVLh2XMIqYIulrUXT
	QbGeUJokhtCjoCKe6dMs6mGB9qS2w19kOFNt1qrwZVIb2L0urygZxD+ZrWME7iVQ5WYrZ
X-Gm-Gg: ASbGncsmCMBmF9C1qCInbZXVw0Xq+KmJb0Ssbc3sqHNEszDcGfH5FF4ThH6xzL6VRWr
	pVObdK+wAaWsmPcuTYOF/K9PpRqV0707opUbNdKSg5gXOXR9KtpxsT0KrTIEhTN+8G0nkppy2Vn
	FMa8QXyYJVG0mWI+1AaDa36B9KQ2FPPCQJJNv+MkYutYwMdrZgiCbLT8R0ZxKCIJJyOW7E0gr9h
	b0/vwE7Ox21o7aZ9Qk7woWNmtbgDLlc+ukxGSwcYJHUvGm7ASfe30QMeTT/NIrnGlPIsYbQOWhc
	SU010wjSmxcBbF+whQ2GXiqw7ghF3dAQzsNAoV3MiL2HHnqEhRx5RPoq8Q4Tfhro99CCHNDzstw
	=
X-Received: by 2002:a17:90b:4b83:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-320fbc0cbe3mr3394423a91.20.1754045991727;
        Fri, 01 Aug 2025 03:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6bONo1H4JD3Nq/jZ9zCujvL2MwG8Nx+GThjxrvIdSlYPJkARGgDxuNMI80MhgDVXQ2524lA==
X-Received: by 2002:a17:90b:4b83:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-320fbc0cbe3mr3394360a91.20.1754045991123;
        Fri, 01 Aug 2025 03:59:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0b4aesm7154395a91.26.2025.08.01.03.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 03:59:50 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/3] PCI: Add support for PCIe WAKE# interrupt
Date: Fri, 01 Aug 2025 16:29:41 +0530
Message-Id: <20250801-wake_irq_support-v4-0-6b6639013a1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2ejGgC/3XOwW7CMAwG4FdBOS8ocdOGcOI9EEImcUfEIG3Sh
 k2o774AByatXCz9lvz9vrFE0VNi68WNRco++XApQX0smD3i5ZO4dyUzEFCLCgy/4on2Pvb7NHZ
 diAPXRmto7co6pVg56yK1/vtBbnfPHKkfizy8lkefhhB/HrVZ3rfPBiXk/4YsueAOCKBVKKh1m
 5DSsh/xy4bzeVkGu5sZ/jhy5tMMxRHNAckZXGmUb5zq5TSinnGq4ugD1o2zRhisZ5xpmn4BPQm
 ZClwBAAA=
X-Change-ID: 20250329-wake_irq_support-79772fc8cd44
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754045985; l=4504;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/4HcNsYuPuKqKa0GMfjXIWddRLLdPlG956ypUck+HYA=;
 b=+IKXpiXeiPS33FaFgO8OgLiygKkSZTU3k5pDppPOhq2n37xvJjg2voFkqfd06SghIU2IKSmMJ
 7RtYtHKFAGyBRBeX76k1dIIoOWwrZLa7HJcxzWKuhM3qVym6ACEewFp
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: wZ-JwUBQOPtGGe7-8Eo7A-91Vu-3HUvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4MSBTYWx0ZWRfX2ZYecIhJb50c
 VPi+SzQuEG/1vDEyJpDs3TvWyqrvmvNiiT0xXzIkYpoq1Srk5HHWnowZUZmVbKY+dUqLqz32Mxb
 qiwh4cb2yoR9M0ArB+YdUKx9+gB8WA2f7GRWtGQvTDsI63awmIntZ+ikKaD8yATFsjQkl/IYccE
 hgAjMgB3G1tcD20SopAUdudvHpqvzNpC3vpzgihxxM3v/yjjYHW1DvajUEQe46X8Qbh1mTR2pmw
 pETSNSiQjDWPJVXxJMuu6De6ivqvfzjlsqM0sV4u66fuqYUlP0aCdOGDHUXJW/ZUb9MhRUXPLGy
 7LweOxAJZbcVYVNBQJ1pqBcJIiWwqhAU/pysOl+h1LQjWNF0NAxvCwpuTPYkhCKebgWDwWSl2vR
 hpTR1Go7wtLMat5W/8DZ4YG7S7+Dfz1MA1mw2EUhXlXKVGYAMJXT8vrnqpUBZ6LpwKxWQ5YS
X-Proofpoint-GUID: wZ-JwUBQOPtGGe7-8Eo7A-91Vu-3HUvv
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688c9e29 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8 a=CDPgDjw5ZRyPGz7T9_kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=844 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010081

PCIe WAKE# interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add WAKE# support[1], [2]. Those series tried to add support for legacy
interrupts along with WAKE#. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ.

According to the PCIe specification 6, sec 5.3.3.2, there are two defined
wakeup mechanisms: Beacon and WAKE# for the Link wakeup mechanisms to
provide a means of signaling the platform to re-establish power and
reference clocks to the components within its domain. Adding WAKE#
support in PCI framework.

According to the PCIe specification, multiple WAKE# signals can exist in a
system. In configurations involving a PCIe switch, each downstream port
(DSP) of the switch may be connected to a separate WAKE# line, allowing
each endpoint to signal WAKE# independently. To support this, the WAKE#
should be described in the device tree node of the upstream bridge to which
the endpoint is connected. For example, in a switch-based topology, the
WAKE# GPIO can be defined in the DSP of the switch. In a direct connection
scenario, the WAKE# can be defined in the root port. If all endpoints share
a single WAKE# line, the GPIO should be defined in the root port.

During endpoint probe, the driver searches for the WAKE# in its immediate
upstream bridge. If not found, it continues walking up the hierarchy until
it either finds a WAKE# or reaches the root port. Once found, the driver
registers the wake IRQ in shared mode, as the WAKE# may be shared among
multiple endpoints.

When the IRQ is asserted, the wake handler triggers a pm_runtime_resume().
The PM framework ensures that the parent device is resumed before the
child i.e controller driver which can bring back link to D0.

WAKE# is added in dts schema and merged based on this patch.
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v4:
- Move wake from portdrv to core framework to endpoint (Bjorn).
- Added support for multiple WAKE# case (Bjorn). But traverse from
  endpoint upstream port to root port till you get WAKE#. And use
  IRQF_SHARED flag for requesting interrupts.
- Link to v3: https://lore.kernel.org/r/20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com

Changes in v3:
- Update the commit messages, function names etc as suggested by Mani.
- return wake_irq if returns error (Neil).
- Link to v2: https://lore.kernel.org/r/20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com

Changes in v2:
- Move the wake irq teardown after pcie_port_device_remove
  and move of_pci_setup_wake_irq before pcie_link_rcec (Lukas)
- teardown wake irq in shutdown also.
- Link to v1: https://lore.kernel.org/r/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: sc7280: Add wake GPIO
      PM: sleep: wakeirq: Add support for custom IRQ flags in dedicated wake IRQ setup
      PCI: Add support for PCIe WAKE# interrupt

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   |  1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       |  1 +
 drivers/base/power/wakeirq.c                   | 43 +++++++++++++++--
 drivers/pci/of.c                               | 66 ++++++++++++++++++++++++++
 drivers/pci/pci-driver.c                       | 10 ++++
 drivers/pci/pci.h                              | 10 ++++
 drivers/pci/probe.c                            |  2 +
 drivers/pci/remove.c                           |  1 +
 include/linux/pci.h                            |  2 +
 include/linux/pm_wakeirq.h                     |  6 +++
 11 files changed, 138 insertions(+), 5 deletions(-)
---
base-commit: 5f10a4bfd256d0ff64ef13baf7af7b1adf00740c
change-id: 20250329-wake_irq_support-79772fc8cd44

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


