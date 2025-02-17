Return-Path: <linux-arm-msm+bounces-48142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CECEA37B73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 07:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C6597A2E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 06:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052941A0BFD;
	Mon, 17 Feb 2025 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSKAXbxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786A718F2C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739774071; cv=none; b=S3zAmmuspDQ7MscIrfDkPAveYk3vWai887HreFjxpUYdjy9myM9QfNHnJg93vGilMzY4/bNaPArvhjNps7YQbJdPNwU1zHBOtdpVRaVmMrepoyi+VAzrrXTSMVxXSyEzUFykfpdfllrjVVjqipqTFnLNaisGt2Jv81mhjYXBtQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739774071; c=relaxed/simple;
	bh=UOzsnW0yk1kCZhcOHUKzAXiM1zBrG/5KAYYsM43pKTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1GkpKc+qd0E63rP7KE81n51QqKFUt0rILhVQyRgXsAn/FARSy56jouJRYq7VdodTjgG/mx7fSGDuhmYnNsjJVWvgu3PqRWFckwqvHbpc4hYeXOAfsMkDzorHN3Gt6MNiDzMjxuHuilyPxPh1hcpazOdoR6DmQcqCcCAge5zaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSKAXbxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H037X3003819
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfJAtknnM5Ix1H9l/tiQteK3hWDYQBja8j0ciMMbYFw=; b=KSKAXbxIm4a6mDsk
	OJLRGFuMB+06LODX2+xrvDCLH7scwZEMQTDuz0wfRLxCPcY2QI8XiDl1nNDRSb0T
	bzxvI/YD9ojp8KhC7Cz4o6QOtfwKoOgv6qv0Rlu3tE6uGEHDXlScsZVxu46tRXNb
	rr2QHxm/HURXIEQcGxqRSDYcOo7C6/jxQ5+58/+mxVKTY3ACga+pEexjSZEF1tu5
	YsQbjVmyxzGVdqDUNw1MM3tbHUdyRSyAhoniJbOzjsU5lRbqKkYK8cf2iUEFQJbG
	nUAL4JU2dsox7nTTNEBKMmDjT3R8+S5c+MM4FmTpvkFC38tq2pHRzOtgk5ZIfSPD
	wEUAAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7s0pjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:34:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220d8aa893dso56883255ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 22:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774068; x=1740378868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfJAtknnM5Ix1H9l/tiQteK3hWDYQBja8j0ciMMbYFw=;
        b=ETEIi8sI6da7Ie1M6xV3QyJShQaEqdHoC2RBpwpadNUuYHkOLKWH0nqMdor+40E3Dx
         GazvMqIPG92vuCCYVTNqkdtuO703E7lMGU2y6MGj9xwR95OqcrCs3igY1y6Zxew4Zz1p
         KRNLAeR8XwYRhJpKWt8jMCC6gOXilGLyi8jb609CVodWRfwouPozK2rrpxkOHAfyN1Gc
         evgqUOI8rtJcnSF1FIlaPyJwrkDz6x9tDAwbNpjd5PjkQZEDVxzSTFvferBhuBdhDW07
         k1D0AX44yJ5+RkWYD5+u8SYVrHSAkhH2um38u/YulFJ7NthzVwJP7zPCVo84ZQYToXay
         NggQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvVZk+BpFXxtR9K8u3qXdfofi8A7xuo9g2qnoSznC3OXUncedSUsN3vVXfnAnZsZcn8vsT5oar8AfHDmp4@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZmljfq7GdRBuiNsubx6w4nedMDkCsCyEIN7amFqIolPg5TaL
	YrmgjfDlcnMIkdiIX5Qf38QxJAPc75xEOKP0CVgbu59KaoOE4aWJGcKRggGfDw7gV4nZ4VX0roE
	JlHs2Jtn6av2B2jHejfrLblYnbUO4txpeBMMRlud/FfxHKsWX/1LyIbuaYGZy7xRW
X-Gm-Gg: ASbGncvWSgsdYejhl9OTDwvudEaPsxTLvqmQI40MMCyTjhKWvAw5pfy7Mm+7dCPZ1mI
	Cw6QfHmYJtY75B5FMaDzp9871onykFol5QgevnN2efZ0nJfp/eca5HZvBpMC0N8rG5f0bcEAATk
	uoSTaasmcDOIjz3ux34MPFNCfWki/DoEGNsA0fNK5ZG4jbBZtx3zd0R8pQ0nO/Y5E5lk6GJeV/i
	gxlzYKdKctxU/LUVaO4qUPXNjS8Mb6DBJ814TXIZol2v9+qja+iXb7cW64N9j6Zch008fYlgN5n
	uUYZxFH5cdF6QjQQI63b/EJ3HHzOH2S+cVvAfz1v
X-Received: by 2002:a05:6a21:2d87:b0:1ee:43c3:9bfa with SMTP id adf61e73a8af0-1ee8cc16ab5mr16622899637.35.1739774068511;
        Sun, 16 Feb 2025 22:34:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ7gToBq7D4VtpV2EASi1+JDe5Y5Jkt/4aGWzWeA8pKMBeCH8FZhkAAVk6ksqeb0q+oCvNuA==
X-Received: by 2002:a05:6a21:2d87:b0:1ee:43c3:9bfa with SMTP id adf61e73a8af0-1ee8cc16ab5mr16622835637.35.1739774067507;
        Sun, 16 Feb 2025 22:34:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73263b79287sm3771800b3a.29.2025.02.16.22.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:34:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 12:04:09 +0530
Subject: [PATCH 2/8] PCI/bwctrl: Add support to scale bandwidth before &
 after link re-training
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mhi_bw_up-v1-2-9bad1e42bdb1@oss.qualcomm.com>
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
In-Reply-To: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739774050; l=3068;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UOzsnW0yk1kCZhcOHUKzAXiM1zBrG/5KAYYsM43pKTM=;
 b=xi2H5j+IGrnLH2KW01vOyRK0v1mmhX6st6biV7Tank1/vHMoUUt8rpVtOT60WK8uXuBhj8yK3
 8x2ATQZIgedBNLlXYuqyCQVT/znFmyy+9q/E+GmWNi3TPK/ehbPnrMA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ywJ-4szzEs_hKGp0lDs3hN59_ep3Z0Iv
X-Proofpoint-ORIG-GUID: ywJ-4szzEs_hKGp0lDs3hN59_ep3Z0Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170056

If the driver wants to move to higher data rate/speed than the current data
rate then the controller driver may need to change certain votes so that
link may come up at requested data rate/speed like QCOM PCIe controllers
need to change their RPMh (Resource Power Manager-hardened) state. Once
link retraining is done controller drivers needs to adjust their votes
based on the final data rate.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train.

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
 include/linux/pci.h       |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 0a5e7efbce2c..e3faa4d1f935 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_root = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
 	u16 target_speed;
 	int ret;
@@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * The controller driver may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (is_root && host->ops->pre_scale_bus_bw) {
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
 
+	if (is_root && host->ops->post_scale_bus_bw)
+		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 47b31ad724fa..58f1de626c37 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -804,6 +804,8 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	int (*pre_scale_bus_bw)(struct pci_bus *bus, int target_speed);
+	void (*post_scale_bus_bw)(struct pci_bus *bus, int current_speed);
 };
 
 /*

-- 
2.34.1


