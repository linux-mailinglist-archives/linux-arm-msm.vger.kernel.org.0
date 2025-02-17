Return-Path: <linux-arm-msm+bounces-48140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A7A37B78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 07:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9431A16F7F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 06:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4788A194096;
	Mon, 17 Feb 2025 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwzWUHRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C018FDDF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774060; cv=none; b=OphLjc5oH1rgNpS0qClKa3kZbJkCOwBbO4Aqap14BU3LlzTc0xhbzvBepBeEMHFa+gHeDqENZMBwAMCU2/Ve/s+IRUOWqUt0/6r6ya2yFgHl7N8bumKjZIjkif6EtS3EiN1MsNRsRdfS5YIOzVlWIxbDSPCY3tMacXxUrWpUtr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774060; c=relaxed/simple;
	bh=30TEJAABnUpwa1kh8H5tuBGWqBc57PSEMyTn4o46Oe8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aF02ZHl5csyJw17umhXnsE3c0w4MZCq+jvGCVCxXZeFiqZxSZxl/I//lPKHuDXIgRg9NFcSydF0CIXMMfcolhw4hIbK2YqdTIi6A4Bt61SYsjT3tt5Nzcpz/ugF0CDq+Z/Qzx9fTCZZ8uv0yMoiX0+i9jUqDmifZNWYaC6DgkVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwzWUHRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03VdP019060
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iQXoj8H5b3looSrGKhddD/
	8Lrybt4a5ABYSR1D4Re5s=; b=FwzWUHRI6EyRImOKj+nGoAp8kj49VXCHa604rW
	Gh9LJ7xKrLtbgz+R/mgxm+uC54lbriqnET3Z7DEwMvlc61KJiEXwYKv4pM7XvsKd
	OapR+Wx2ya2te819xvoAkK9/yN1vrSbCZftLCiwu5elm3S321vVv6yibjzUk0+dd
	/vLhSZPtN3+U/ZOnyT0RcGJM9DR1DBv7oIha91ILQd4BiEHaxt0TaGWNSGX/cEqK
	9NrtYHhIgusfPrhfp4eYJFfqSqi8dU6fsGiddPlWbbwd2e1MrhVGpEWGic6kcyNA
	nUwIkDxdynDiXkQAYuWzs+bj209rBi8bqBojNjJz13IMt0Jg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7srpj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc1e7efe00so6951640a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 22:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774056; x=1740378856;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQXoj8H5b3looSrGKhddD/8Lrybt4a5ABYSR1D4Re5s=;
        b=Pf0GgulWKxfeZVlzjKiBZHzVAzs2EKzG08rmmKnYE7N6CIJZjZuzi6wsoWfpNWN+0N
         WKx+44xWH1qTqeEe3RI/UCvZYrokTlTvHU7rakK232a6XYzoY2K3v+2Vv6v7/R+a81Gy
         KbUK7e98tP3r/1N5wPaYAebpsZQ8y57pRICNkhJeWeTg8MbcVBUeYhUIKVE+/Xz7yK/S
         gGZ5RJ/Z8bZMzdezzg6OdTntK2r6J6J0COZhalHAnaDdqtB2rJZzeILnHz/Oh8GumyYg
         Dp6DQMSSdRLQuEv2wWzc7wJswoyJmTz2T6SdjP8DvUnSxGNN4BUk9NRGdXSCpzsWY7rW
         xSwA==
X-Forwarded-Encrypted: i=1; AJvYcCV1u4U0Xz9YY7Lty5ZrvsrqCRk+Zw6MHljLXKQw2afiMSnfAVwU+qojKpBfre1JPp4M+gp8hAp6e4oj0k//@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBn3qh7GqUNrFzjXIphBl3fRdoKUycHJoQNMukAM81hyTm+4o
	nHwIZDZN1itxGZD074qTHVzPN/JyBGOKrHnhnJFvZoQyVwKXysTvv9P58w4TH7AcLKRvqOi+9pE
	RSGzKOhoLWARw742Uj5gYmXxXNZ5hA6hBGsuuNDvw8vm6XpDFAOiGo4GFhmtlk/J1
X-Gm-Gg: ASbGncvNKcQhiedVpeGT+H759tsGgLPo9NrHwI3Dd+29HnZ269FuvjgStlNyAU3A2o4
	IlpvXz80a2+3+N2xE5GO+rmtdX3Ndr7K4HRuIvCwZmcIl9IjwDdiXMWRX4VXivOIisX0zMiH33o
	+PYUESAzNBPy1ovw7/jl97boHWtMDTT+/nO/lga6z+xWllZA6qAgb5K0JyEwP6ktriO81L/05rR
	UyXQYiEdmSA6GwpEivC1m9Sgl6xIQyAvkyER2Eoe/B4ptoAfPzfgMl/covrYVEpodzPWsc4ncxy
	OjG3ATDvxkh72EBV2H/V+WRvsDT+Hm4Gj+oFvz2b
X-Received: by 2002:a05:6a20:734c:b0:1ee:7ea6:8e0c with SMTP id adf61e73a8af0-1ee8cac55c9mr18266074637.8.1739774056596;
        Sun, 16 Feb 2025 22:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1648r3e9k3f7j/0JUKAhKP4VZHlpB+D2ION+yxkiLqbGo7Uymf7YvEB+nmMyv3aO5xRKwhA==
X-Received: by 2002:a05:6a20:734c:b0:1ee:7ea6:8e0c with SMTP id adf61e73a8af0-1ee8cac55c9mr18266034637.8.1739774056186;
        Sun, 16 Feb 2025 22:34:16 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:15 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/8] bus: mhi: host: Add support for mhi bus bw
Date: Mon, 17 Feb 2025 12:04:07 +0530
Message-Id: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/YsmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3dyMzPik8vjSAt00Y0NjA7NEUzNjwyQloPqCotS0zAqwWdGxtbU
 AtPwk3FsAAAA=
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_jjohnson@quicinc.com, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=4167;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=30TEJAABnUpwa1kh8H5tuBGWqBc57PSEMyTn4o46Oe8=;
 b=vG+PKK75gdfNitdrSzZxvdfDkylUvvuDHb5LhND5dvYUjy4b7le09Q4AB1LGAes3zdqMUKfKk
 TVbD5AtySEcDUbKMf/G6dkUnLGx09o2ZlvM5F6/WQFsMiBJXAPG03rI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: UmahSCshasyB_2TfF01SZbttatsJqVX3
X-Proofpoint-ORIG-GUID: UmahSCshasyB_2TfF01SZbttatsJqVX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056

As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power
consumption. MHI bandwidth scaling is advertised in devices that contain
the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host in the form
of an event. After the host performs the bandwidth switch, it sends an
acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver, it is responsibility of the controller driver to do actual bw
scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

If the driver want to move higher data rate/speed then the current data
rate/speed then the controller driver may need to change certain votes
so that link may come up in requested data rate/speed like QCOM PCIe
controllers need to change their RPMh (Resource Power Manager-hardened)
state. And also once link retraining is done controller drivers needs
to adjust their votes based on the final data rate/speed.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (6):
      PCI: update current bus speed as part of pci_bus_add_devices()
      PCI/bwctrl: Add support to scale bandwidth before & after link re-training
      PCI: dwc: Implement .pre_scale_bus_bw() & .post_scale_bus_bw hook
      PCI: dwc: qcom: Update ICC & OPP votes based upon the requested speed
      bus: mhi: host: Add support for Bandwidth scale
      PCI: Make pcie_link_speed variable public & export pci_set_target_speed()

Miaoqing Pan (1):
      wifi: ath11k: add support for MHI bandwidth scaling

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h                          |  18 ++++
 drivers/bus/mhi/host/init.c                       |  93 ++++++++++++++++++-
 drivers/bus/mhi/host/internal.h                   |   7 +-
 drivers/bus/mhi/host/main.c                       | 102 ++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c                         |  10 ++-
 drivers/net/wireless/ath/ath11k/mhi.c             |  41 +++++++++
 drivers/pci/bus.c                                 |   3 +
 drivers/pci/controller/dwc/pcie-designware-host.c |  21 +++++
 drivers/pci/controller/dwc/pcie-designware.h      |   2 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 105 ++++++++++++++++------
 drivers/pci/pci.h                                 |   1 -
 drivers/pci/pcie/bwctrl.c                         |  16 ++++
 include/linux/mhi.h                               |  13 +++
 include/linux/pci.h                               |   3 +
 14 files changed, 402 insertions(+), 33 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-mhi_bw_up-f31306a5631b

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


