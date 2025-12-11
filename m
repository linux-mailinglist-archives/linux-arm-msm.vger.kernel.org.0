Return-Path: <linux-arm-msm+bounces-84993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE90CB50A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C296130088B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1F128C854;
	Thu, 11 Dec 2025 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kf1TF42W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPBQ5uJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40891230BF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440465; cv=none; b=Gt4zgDP/HtRULV7hYrLVnl8NBVDf83WezmnXeNJdm914/T2dcCaKg68/IHAkZV/rNmlpEat20JYFOgDLWPW8mXOYWQK4XIv97CDfE7L41U6Bf1fLes/65o3G2JYTQg3HNdZKfmNT/iPCXWXU3wOjJGNsQyxBDLwSPvTQNHfEj2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440465; c=relaxed/simple;
	bh=DzUkoaCRQrd8kzQjqI9+WRCwNjkdq7WIcS0d4IrkeJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hulUqk5AQpSwQkRN92GAkCBb8xJShBT811pPkcdoE8FWeYZAAOWSXTsZPjNDpSmifQzlphdMB8AyMvvwznbVZ+4CuxZNpfYWvx3hGvozfMdViy9cv++YE5Hh6mg9UEXmaWZZH7VL+JNBboKl/ubVCuw1BFdGJe4u4uAJA30C/GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kf1TF42W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPBQ5uJK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALT6YN216982
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VGTar1izj8fY00PeUl0xnU
	XG+q987NKaQmzFHHieSFE=; b=kf1TF42WLr8Pa1KsbYkA4xjNnisiXWMZIZ+7tW
	YPbp1aA4ziq/x8YxF8t56mafHuDIyvkmMuSgJvhPxeujkeR71UpIqH7tn0Si1YL/
	kn2HNrAG94BwBM+uCZSbZDnXVaCBWe9PGMUVQRZROsDmRCNiTCV9kdNfKmiThmGm
	JVqB7VuztaaklgqyFSEKhN3ERxi2VrVOjJ1HHljsMNI9XAKqZpeV78CEPVrjt9n2
	3/maJwKXodRPncmUaDimsyQKaPtbV32dh9gNcEN4ffRRboSoS4cyWLiN3RXkIdx+
	vNSJuFFkv4GH+3DkJwECsowwe9fW409ssm9z2s50+mpruvlg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr89hqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:07:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b952a966d7so1390558b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440462; x=1766045262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTar1izj8fY00PeUl0xnUXG+q987NKaQmzFHHieSFE=;
        b=KPBQ5uJKUYnkfsW4qhVzmdaq5rPgTFlXIsLdzxZ+3MkHpO/uNFlP1meEdZgCDb+Lu0
         pal+NA+PpoTNKiFc25lUbOct3aRPlztbHbGkZ/6FkybZEfwTYb4Nu0alpKZ1pSwvXCKZ
         sk0e0UW8LxhvsKzWVFbAsEvXiR0itimSs9N2fH/PhpvAIFmwDQZohLFJRc2zs4w9q1Wi
         oqLd4LR4uWd3rKLFjYzonFl0RxlKE9N8FN/kx+gJRuXM4BU+hwqkuY1y1XToJG69cdpW
         rFYGNTcODfFrN5XOYtzEKG0mvC6caY+eCdZ5TRjFJ93naJA8NIifAlDQQ7rF7SXy5O6a
         YAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440462; x=1766045262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGTar1izj8fY00PeUl0xnUXG+q987NKaQmzFHHieSFE=;
        b=TSaBN+vgeZ8pG0jAnxbjalcHsSfFLvDVIdFtWVrmL/DZ8pNxvDF/8h94MkhpwOomvb
         OPWqMVkyiKE2ie9isTQCeGb0I9WLprYtqTaCVoyL636/mJbVeUvKBCZ7QDT/AkTW1lbW
         72A/mGa7OGxKIBuVTFO69m7QAuBAvjI6vHJnkPfLjJRE38RkPlN/H6EihluYufcuA/um
         uK+psfX6hsoHUZCIcxFoIafYFQdYii0ANKMKwXgih6Lb6Csx7x+vqpwEE+Iuu2EP9r0c
         r0GYukYHhteJE21fT0vZ1mE2MKONZ1d0edneIDZoZDemU2rEB41hfAtMqFdyJWeLKQpV
         OwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjBUMERQ7pV9/Yw/ID790WQmQVCBLyiwxa7G5Nw3tovYmyk2EvD8owmhBr9HoGBWjaOfkcgg37PhsxE33d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi2Al8thNY7pC+gEDuiiVAQI//ZKASM8SNXci4R5/6bKPf0Wac
	oFkbv9CyWnfhXXvyedSSZhIvlQoDHq9SEKJ+WLkXaBykStWMXcw2HNCnEYayRw8MpiW2+AJYlSE
	/kEBAwGWChJd5ZIP0u1s7wz5fPqT3vh0V9LZDMkc/HNo538oUzvwhw5avvldnpRIF7+/N4XPeOa
	KQ
X-Gm-Gg: AY/fxX6bYiPcefEOzFUCtTlGeWXIKoyGoDdI8XY5JKYUqKfiLdJKRWtT6KUCdilWqt8
	IZpXPAalkGHLj0+rE+tjz/5Y3PfVpVrd8p0dmeX8TEsjwnH9VBryqgGbtKLS+ad3FWGIE7RpVDC
	tlhFjM3HmCdtsBKITc1GL6LPtdfzoS5r115OB5VCz7Lzl95zqeZE8b3Sqq09iteA7VwBWvamiiu
	hSQ9zL0Je6qy8chtIY20rOHbAkPHT3zQWjm8/UlzijvLtWZ/KwZTg5KEjtVyvXmNeIcy9ogN6Bk
	5CFkks5DMc6kfIJg/G+tsTYnVp5fzQY3aOwyRPgN+9gzWXlYqNEsKdueZ/yyIsXx9OtLMWFeYkX
	N17M27qPpd/SWjqUwyvsmWmn0OoZU7RcL8Q==
X-Received: by 2002:a05:6a00:17a3:b0:7e8:43f5:bd0f with SMTP id d2e1a72fcca58-7f22f71609amr5676702b3a.36.1765440461613;
        Thu, 11 Dec 2025 00:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIseC4kxMi6GgqhPQpVCfbKl1ZmOrjAgsLnUg3i5shyad7AbU3UyI5CsdPGZTDkw+VryeapQ==
X-Received: by 2002:a05:6a00:17a3:b0:7e8:43f5:bd0f with SMTP id d2e1a72fcca58-7f22f71609amr5676679b3a.36.1765440461108;
        Thu, 11 Dec 2025 00:07:41 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:40 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Subject: [PATCH 00/11] char: qcom_csm_dp: Add data path driver for QDU100
 device
Date: Thu, 11 Dec 2025 13:37:32 +0530
Message-Id: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMV7OmkC/1WN4QqCMBRGX2Xc3w22K5vlq4SIm9e8QWbblEB89
 1YG0c8D33fOCpECU4RKrBBo4cj3MYM+CPBDO15IcpcZUKHRqLWMvLTNbeCmm1BiUXqFiKVtEfJ
 lCtTz86M71zvH2V3Jp7fjuwj0mHMn7bNfphL/EUqDpP7ksFDGHa2pFgv1tr0AAsBQQbMAAAA=
X-Change-ID: 20251211-siva_mhi_dp2-237c022276a2
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a7bce cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Tkdv6tb7jgSxGDo1kvcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX5oYJ4tZYiz2C
 wbYx7JFeVUroVOHNkpQSgiUPKJmygGbpxBRlHZLXCkXI/tBLdHtEJtaOiDA6Ea6jjMNES3CeJLC
 4UFCCWmleTqsS4gtJgOcoGhU8ijgT3zqppYLNmdP1SycaUyF4lfphoEshctZIGUnDwjMYkQMUOZ
 5bx19/tPPCl2V7YVoZ8LZSewuSUPkgvPZgYQ79nvjVkQqXQEI5NJk2pUqRDEkufTvEA6g8qLjJj
 eV3/+9RO2yX15MovCOJ/wT58TK9KrqREf9qDGZNOlWj50ifCNArDe1utoC6XkuS+VAczzwMWp/l
 D7brmfwwpSgaq8CEyHuPJ/jkP6L/5tmCJnv7Vw5mmFe+e3TqLhvF+kWnKN87PJjkgvBy7Q7C1we
 0Sgv51ZHTj2GH3IhZTK2Bxx+qxholg==
X-Proofpoint-ORIG-GUID: mkOGSYL3BuieTFsaEJaSqakkFDGkafpZ
X-Proofpoint-GUID: mkOGSYL3BuieTFsaEJaSqakkFDGkafpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110059

This series introduces a character device driver for the Qualcomm
Cell Site Modem (CSM) Data Path (DP) interface to support the
QDU100 5G distributed unit in cellular base station deployments

The driver enables high-performance communication between an x86
Layer 2 host and the Qualcomm Distributed Unit (QDU100) by
transmitting and receiving FAPI packets over PCIe using the Modem
Host Interface (MHI). The design targets low-latency, high-rate
data movement suitable for real-time 5G workloads.

Key features
------------
 - Provide a character-based interface to userspace and register as
   an MHI client.
 - Implement zero-copy using shared rings and memory pools to avoid
   data copies between user and kernel space, reducing latency and
   increasing throughput.
 - Expose ioctls for memory pool management and packet transmission.
 - Support two DMA channels (control and data) with system
   configuration ensuring correct channel assignment.
 - Add SR-IOV support so QDU100 can present multiple virtual PCIe
   functions to the host, scaling to up to 12 devices with up to 4
   virtual functions per device.

Userspace API(dp-lib)
-------------
The character device exposes ioctls to:
 - create and manage memory pools and shared rings
 - enqueue and dequeue packet buffers for TX/RX
 - configure control vs data channel usage
dp-lib: https://github.com/qualcomm/dp-lib

MHI
-------
Add support to read MHI capabilities. Initial post of MHI
capabilities is referenced here:
https://lore.kernel.org/all/202508181647.7mZJVOr6-lkp@intel.com/

Add data path channels and event rings for QDU100 VFs. Disable
IRQ moderation for hardware channels to improve latency.

IP_HW1: Control configuration procedures over the L1 FAPI P5
interface include initialization, termination, restart, reset,
and error notification. These procedures transition the PHY
layer through IDLE, CONFIGURED, and RUNNING states.

IP_HW2: Data path configuration procedures control DL and UL
frame structures and transfer subframe data between L2/L3
software and PHY. Supported procedures include subframe message
transmission, SFN/SF synchronization, and various transport
channel operations.

Add support for queuing multiple DMA buffers. Optimize MHI
clients by allowing them to queue multiple DMA buffers for a
given transfer without ringing the channel doorbell for every
queue. This avoids unnecessary link access. Introduce the
exported API mhi_queue_n_dma to pass an array of MHI buffers and
MHI flags.

Add support for mhi_poll API. New hardware channel clients use
mhi_poll() to manage their own completion events instead of
relying on the MHI core driver for notifications. Also support
both DL and UL channels in mhi_poll.

Add overflow disable flag for QDU100 hardware channels. When the
client transfers a large packet, the host may set overflow
events if the packet size exceeds the transfer ring element
size. This flag disables overflow events.

Add MHI callback support for channel error notifications. This
allows the client driver to take further action if there is any
issue on the device side.

Introduce a new API to retrieve the length of a transfer ring.
This API allows clients to query the ring length.

Read the MHI capability for MAX TRB length if supported by the
device. Use this information to send MHI data with a higher TRB
length as allowed by the device.

Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Change depends on:
https://lore.kernel.org/all/20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com/

---
Sivareddy Surasani (1):
      char: qcom_csm_dp: Add data path driver for QDU100 device

Vivek Pernamitta (10):
      bus: mhi: host: Add support to read MHI capabilities
      bus: mhi: pci_generic: Add Data plane channels for QDU100 VF's
      bus: mhi: host: Add support for queuing multiple DMA buffers
      Revert "bus: mhi: host: Remove mhi_poll() API"
      bus: mhi: host: Add support for both DL and Ul chan for poll
      bus: mhi: host: pci: Add overflow disable flag for QDU100 H/W channels
      bus: mhi: host: core: Add overflow disable flag
      bus: mhi: MHI CB support for Channel error notification
      bus: mhi: host: Get total descriptor count
      drivers: bus: mhi: host: Add support for MHI MAX TRB capability

 Documentation/misc-devices/qcom_csm_dp.rst     |  138 +++
 drivers/bus/mhi/common.h                       |   26 +-
 drivers/bus/mhi/host/init.c                    |   56 ++
 drivers/bus/mhi/host/internal.h                |    9 +
 drivers/bus/mhi/host/main.c                    |  270 +++++-
 drivers/bus/mhi/host/pci_generic.c             |   59 ++
 drivers/char/Kconfig                           |    2 +
 drivers/char/Makefile                          |    1 +
 drivers/char/qcom_csm_dp/Kconfig               |    9 +
 drivers/char/qcom_csm_dp/Makefile              |    5 +
 drivers/char/qcom_csm_dp/qcom_csm_dp.h         |  173 ++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_cdev.c    |  941 +++++++++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_core.c    |  571 +++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_debugfs.c |  993 ++++++++++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mem.c     | 1078 ++++++++++++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mem.h     |  292 +++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.c     |  651 ++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.h     |   81 ++
 include/linux/mhi.h                            |   42 +
 include/uapi/linux/qcom_csm_dp_ioctl.h         |  306 +++++++
 20 files changed, 5674 insertions(+), 29 deletions(-)
---
base-commit: e3b1905d4f5cc4eb39fa7b9fac6b6db3ab1a89e2
change-id: 20251211-siva_mhi_dp2-237c022276a2
prerequisite-change-id: 20251211-siva_eth-ef9b2305b865:v6

Best regards,
--  
Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>


