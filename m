Return-Path: <linux-arm-msm+bounces-51277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209EDA5F2AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A1F17CBE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070DD2676FC;
	Thu, 13 Mar 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7zcjwyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ABA266F1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866060; cv=none; b=m8CQSF1vKtqCWL/tR+GisQ8lTW/vFIC/m3Q4wQl8vCyd8+qFr6F4dEsZkLNE1D+2/RVTOOIcMGDLFshsEnzqWW+eWe+G1LS7ogcaM+HHQ/ssMoEbsgjou1cMGIks+5T+0xu6Yybh1wRQa4/U/4Dv3QXxSxhtBN9kCsATjKXTZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866060; c=relaxed/simple;
	bh=QF3t9Npqd6WDL13WAUYjPdc5+X7unsf6GqmoGDJ96Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnZaRq2NQFu3FWImQR4gM8TnC2QAPINVAjpGmsN43lz55Zp+k7l+EmMRhmqkThHUEj66q8bF8Tj1ddxrSJBFMse4kwiiGPgAtn0a/LPt5ALZ8rhM2cEaJUpfUgeN50WjzD3+PqxRj2owcf+VCXpJp9tU5SjTbFyq5fiTPFGwXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7zcjwyd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DAj70v030521
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GoHPsMjXm5WsDmWxnM0h27fytbmRrNNVtygHs2kjM4=; b=D7zcjwyd3nxjbkyD
	L8F5kMF6t5s4kPxVP+XefOlrFWqJVP91MKFJkhPTbX8xBSM9TXE4CQcrUe9tZ7Oo
	ombXmms9Y5wIkIlEJTa9nKMR+WUcPZIFm4Ajv5dDlRZ6w2fzz7wZkjDDlU3q8R1Y
	NsUTNAH0Q8vto8cgamYPDPfFXVpq6q9l/MNtGjQBzh/u1dHG2YpfKUdgxvdWjTvz
	Ytfwan9UYXjHB4JjLU6+EqFPO9NXNZzRU/hHnixiT4C650QHefjl9TPB/EqT3I4b
	DkQYbsuk/rvjAhYT+nFHm3711xSSonYRh9q8rswo66NgpvenpaqXV+1EiRCQJW4U
	z/r+cA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qnq50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:40:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso1645660a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 04:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866056; x=1742470856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GoHPsMjXm5WsDmWxnM0h27fytbmRrNNVtygHs2kjM4=;
        b=Vk8pZHUJ4W+imh7cKng7ru51QlavqO5AnxnmF3TQfv9QHr3spzz04Jh9R+VRtcETeP
         Tr4F9eSyhw/kkZj5wdlh649qflGo3gm/y7pyZvnQF8eMYXrglxoa6XWM4WJN/6aqPOMt
         WQbmrMir8tiii+3djG/wzNBXM0JPwrwo3/Uybj6svrdzlRliAEEl5kLEB40vZkYFafRA
         eNpyRJg6xImGHvutWgfgwpJNzxRmlw22PSeTzee9J14eJS3clRICJUpSaMs9x3OOceos
         Vom1rbLXReIlhnHK/mjj95qU8vN8gw2VY5fM24LKL3Ymy7yyzVwZlkhaZuNrqVpEyg3B
         TMAg==
X-Forwarded-Encrypted: i=1; AJvYcCV4DXdE8kSa2h3PcIxJxbAuGOo4rz7wCLDSvw2ASeoUMfzMI4UCZdxz8+y69tw9CdcWm8d9ef9YF+aWxckc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2gMDByHAptXw11lotm5pUxEOHtMqpUJ/9x5Fytom/74rP15a
	yAE2c46R5+tS1fwUqG/qex6jw+NLsqYTilz+mfuP2vQIMcf07T6I/wHwDlwNPlyXZZXn7urZ6q/
	J7j5lo4ptiwnvXxKVRihwB4u90++0c7FW2gS8Ay/D2zSm1735NFOd7QYnLQEtCLpU
X-Gm-Gg: ASbGncucK4HtcddrqY8AfjlNF8hxoB9ki38RPwMb9BZiSb5BC4ur02eT3TneNJCnwEo
	bzlYXH8j1zMzmZuW2Rr1ywklwWPKdW2gJGlFAwDx64TNskPVOes1rQIjabqRADNjoMUHdQc10Sq
	SV3PBXAJvtKvrCKgDbbW7DT25+w6S+rRgJt7eoNhF5ebNCq+ZEGrxKFpTHs8jWkA32wt8BVXquj
	4+fZx6esUx2F+o//KeTlHHc1RyGKne0XyGnroZnBtNyM7AxM4k645r3ceyk43jfJoPjiQVgRhps
	Ljf5C8ekYs9X7rpM5k6zmK11drvtTzKS61H0aK+G66/WQysWSTU=
X-Received: by 2002:a05:6a21:6e01:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-1f5787332c4mr25422493637.29.1741866056555;
        Thu, 13 Mar 2025 04:40:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVPPVaqt3ccoP6Qi6iR+F3/+FepdazbfVoBgBB08wJlm086Lrkra8NnpQV4ECmwIxgzuhyRQ==
X-Received: by 2002:a05:6a21:6e01:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-1f5787332c4mr25422454637.29.1741866056162;
        Thu, 13 Mar 2025 04:40:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:40:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:09 +0530
Subject: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth before
 & after link re-training
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
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
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=3703;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QF3t9Npqd6WDL13WAUYjPdc5+X7unsf6GqmoGDJ96Z4=;
 b=r9fy/TEQIugEusXyzLXabUGKObbPiDQA2y0cW3J/suds1DrMZVbsdRhS6C69uzJ4DGZnytm19
 VjGnvA/1AohDqYs2XNcrykXd1/23Tf2WTarVjm71yVNjL4/h/JZY91N
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 3i2aKNzj7IoCJL4XYNKJW11oykwjSlY6
X-Proofpoint-GUID: 3i2aKNzj7IoCJL4XYNKJW11oykwjSlY6
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d2c449 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p-QNkzJndyCg75AdzNkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092

If the driver wants to move to higher data rate/speed than the current data
rate then the controller driver may need to change certain votes so that
link may come up at requested data rate/speed like QCOM PCIe controllers
need to change their RPMh (Resource Power Manager-hardened) state. Once
link retraining is done controller drivers needs to adjust their votes
based on the final data rate.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
 include/linux/pci.h       | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 0a5e7efbce2c..b1d660359553 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootport = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
 	u16 target_speed;
 	int ret;
@@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The controller driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_rootport && host->ops->pre_scale_bus_bw) {
+		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
+		if (ret)
+			return ret;
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (is_rootport && host->ops->post_scale_bus_bw)
+		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 47b31ad724fa..9ae199c1e698 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -804,6 +804,19 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	/*
+	 * Callback to the drivers to update ICC bw votes, clock frequencies etc for
+	 * the link re-train to come up in targeted speed. These are called by a single
+	 * client endpoint driver, so there is no need for explicit locking mechanisms.
+	 */
+	int (*pre_scale_bus_bw)(struct pci_bus *bus, int target_speed);
+	/*
+	 * Callback to the drivers to adjust ICC bw votes, clock frequencies etc
+	 * to the updated speed after link re-train. These are called by a
+	 * single client endpoint driver, so there is no need for explicit
+	 * locking mechanisms.
+	 */
+	void (*post_scale_bus_bw)(struct pci_bus *bus, int current_speed);
 };
 
 /*

-- 
2.34.1


