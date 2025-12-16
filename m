Return-Path: <linux-arm-msm+bounces-85355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF739CC31BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 353E930A7A30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE394362133;
	Tue, 16 Dec 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKpNU2Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNetlMAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6179369964
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889532; cv=none; b=jFVtgpkXih7fF38PkKqUTN7qV1su54no0RhjKBxNYZDxBgrUuCqKYLEYMKWCfDiIPTOCjQBGXwwCBmb2N2foHcMtlMYoP1B9QzPfH3MczvSvqOyQ+yAxieRgQw32aEoUDPOre8Ui7SgmvxV7m1OTn+YE7uKD/fr5LcE0RYl11BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889532; c=relaxed/simple;
	bh=AxJppRgcYa8seS/5FsyKFOOD0QXwFKTptF3sj3pGcEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=beVQnK7gAMoVpHNYq0jsQq9UiAW5IcYZeGHqfR/YbcQg/0dps07e8/Of7UwuTwXskBavYoqiVmEvyWoBYDgmaRsOhjgAeRWNmNqhXZlzshyi01Bhg3XEubcfeNWy0OXgt63jZwP1YgcBZ4xJvg2GZKNdqXrnsWkIEXQo9JAacpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKpNU2Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNetlMAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGB8eYr3872257
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPioBKyHQGix4/YkwPml8E9/ulH+evd13A8ZjC482MI=; b=ZKpNU2GgQhVzPtRE
	VyJ0bs2Hopws9cMrlj2lCNHj4YzqYvE26SvEByfi7kqFoPuXV+y6/IFmgnboIUnB
	q/SFIEVLEr4ZeqcieS8iYy+LfNOb7lPKAWcVmW9/8Rdi+lfJugJC/UoeM2+94gPT
	7D5vDzuAdzMGxZflVXoRE74lYx3qu1ClcJR4rKRVCLkTkKfHcv2/Cvy2MmTygvp0
	Y0EGb0QigYvzCSFJVipH8YUMw6eNUa54LDkP1aoLUEq2gauwcav9H6g2Vpa/Bsr7
	Kxac1cJyhI9kMqal6QTURFRQDmIBGE4KemmLK/B4xbC9KY6R6CmOLCvEgda4r6ru
	eeqgtA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b369w8agd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so9583164b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889523; x=1766494323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPioBKyHQGix4/YkwPml8E9/ulH+evd13A8ZjC482MI=;
        b=BNetlMAjOXETgcVFMOUrvPA43ebJRY4tmIQFByqc8MKz/5Fx0YbL4A3Oc0+0NGhyQ1
         +HiKU/NHmNYQmRtNE4M4KMMsrz1g92In66C9h+Ywq4a3KpMLwpIND1aMOZGDDbnpifDh
         ssGzHCtjBzflCbkQcZQ/hAwpREa1UYjgn2pEAwhI7ZECK+Rw/CmKYCT8VIq7hfEiDzhs
         +TtQeaXrRb4gEdSx+c8F9wjGd2lLrUuMGBS2yV83R7LGiJ07mxWNdqVem+tLBW3wOdlU
         ocHKip0dh/l3ZbutrONmyAvUoREKr1eSs/+Sq4kcB/e1U3k2EkA+ahC91kckJ7R8vqZs
         P1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889523; x=1766494323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPioBKyHQGix4/YkwPml8E9/ulH+evd13A8ZjC482MI=;
        b=M3rT+oJoQSgZhAoDHthCx1aOozoi9iMuBhiVNQOiddNCGGjXdNWaOA/z8YDtDdQhuP
         Pl2r7xYKymOltViATLeO8nwT+wHGr70S9CZD9JvpydD7uieaEItwPJ74Le7F7aKyMNUs
         h5c+uH+/wOb6qhDDL32WZC4Q2qUgxDgRpI3gg7eioBdbg7XAT+Hfp+D6PiRcVSk1gU02
         7ff1CPHzgrP8y/oKbF/6giXI9fUx7S4xQS+ZkzA7RLPFV5hmYdYpwmqhiOVouLSHyKII
         af2F/lIFI9vaDGQs9lty901CeN+lzpHVOrm76SkqmkiC+XtcIBhylP8smc4xfmnfjtwU
         aq9g==
X-Forwarded-Encrypted: i=1; AJvYcCXK/AEQLB1U9weAQT+JYoKqlfH0/gcAZH0Q9O+9IkxLoEZ3cx5lLEusXqp3n2rU3G4FPi0xGKVvSIRQTFPf@vger.kernel.org
X-Gm-Message-State: AOJu0YwDS/murPhjQAj1EGIWB2mSi2a9X1r2YbepMzapOJEqeVzMjZdM
	H7o2hGFfKE+hckvNvHxuAQoHRr6Quo5x7iv4m++luNzW6wJHMYcnQIE+Q5HUBW5hQji/aTkuvCK
	obm1En5jI4PsPGYcVhAAi95hixjaKfKRQEvbTtuEvdVntH2U5EWBwyMt3WHdNgAGm4boE
X-Gm-Gg: AY/fxX7yl//qq2dvk2iZxdmlDWdAJnLOkrSzzKgzuAFpASZbFDjp1euYenMhr8djGIu
	MFu/qfu9ro0qq/0h5orODYEI/fZYyTG2Q3OxL2QKTRe4uEVjnb3vYD6n6kfhu/3TMG1J6kUiRUR
	78nOc7NAebljldRmegAXB13rc3cR+/i/Du5hc+IGVazKohrM/wP4KXmdIqkM5QiwcMhYzlo7wjC
	5tbSe9HTcCGfXFE8YAIskf7Vrcej2f6nrddB4MPQsKQ0NFS0JHHGnjmmhpBnWt2vFUsUTbk2p+x
	MM99lA57LkAxkyJZs9Vrn9KhuHh4wW/XNBu9gO1izJgBsqoywmH3g2JT+8qyoRb9wXJg5AYqhWA
	MiY2wiVoBqIGIlMhmt2yhDr6LpYOb+B8DYP1zbv+BXA==
X-Received: by 2002:a05:6a00:6ca1:b0:7a2:6b48:5359 with SMTP id d2e1a72fcca58-7f6679368f6mr14489945b3a.24.1765889523107;
        Tue, 16 Dec 2025 04:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPl3d2KGIwILstUtASrOvLk2LZLE7T3dGcnoLQpDR2FH5CrqA1YrdJ4MrgZdloc/MaQQoM9A==
X-Received: by 2002:a05:6a00:6ca1:b0:7a2:6b48:5359 with SMTP id d2e1a72fcca58-7f6679368f6mr14489922b3a.24.1765889522561;
        Tue, 16 Dec 2025 04:52:02 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f5ab7d87e8sm13634362b3a.25.2025.12.16.04.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:52:02 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 18:21:43 +0530
Subject: [PATCH v2 1/5] PCI: qcom: Parse PERST# from all PCIe bridge nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-pci-pwrctrl-rework-v2-1-745a563b9be6@oss.qualcomm.com>
References: <20251216-pci-pwrctrl-rework-v2-0-745a563b9be6@oss.qualcomm.com>
In-Reply-To: <20251216-pci-pwrctrl-rework-v2-0-745a563b9be6@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Niklas Cassel <cassel@kernel.org>, Alex Elder <elder@riscstar.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7502;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=AxJppRgcYa8seS/5FsyKFOOD0QXwFKTptF3sj3pGcEs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpQVXoQKinTJXtBmgeKHf4UWzgeJqWHOAIYLFSR
 fFrXeGG9SuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaUFV6AAKCRBVnxHm/pHO
 9S0iCACSdGQz8geJOBd+d9udFswEfStON+sBAnT6wzMEECy6Kx+Rppz/rDrJPKnGd6WwR6Uc+YP
 WwUAdjI5aP24oqU5to62e1QRLJUZNLw09b00qEqoflK+erOs1c08/cVLB/pRRAAHktO+RBDsVTe
 1uTBLgY0SyATW4UlZSBcxQBUtTPdC12BslroOCVnfaRYyWeeZmHqYVNq/s6VcTrKI41tKScaH1T
 PMio5rP/1PWrHzOSXXXaYLjlFzcTBzUkfZkuyfU9BUbMtOcs4vqrojL95bRWLEdzMEZfNBHn2Cd
 W7Y31pKSo9KpFO2YPEhA/4NjEibNLtCrXxqFcxbcBfnxgTgS
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: QaoQM9RH1ZBCcaSYY04mJzHu_NsbJF-W
X-Proofpoint-ORIG-GUID: QaoQM9RH1ZBCcaSYY04mJzHu_NsbJF-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfXxNAXHdd//ajQ
 Z+RLR2+bHg5mg+2g+0F97iSFoLJMjLNz0E/qfBfreQsy7cRhnCV/VRejwobsHkpAn+/3EvLOmBs
 46THoqH8P4/yRwHtv1PSuXl9YLrnKHAorbM+kNh2MW4J44K+e1ok55z67S+2UCYb/Ui99BpWWEP
 zgZJAjohWCdt/yIAbeFjNChVT5jlXWhDm1E/GFmGdtelc2m2fylF7ymdA4e8L/PCWAcrhI22Bmf
 GYDaYYwUPCD0vgt0lFGpyxnymIuUoilkw50AMRWLuBlmj/1DzUj/00AAImsQKQAkGkYV3LbWbYU
 8eFgmU1XkszXG8pH2clMM+yiW+M7VSkPi1bKDWY/Ls+kFG7JUsmxU3jW3+T+eOOv/KFVdlXo4h6
 1T+LS7EkDjcd6BnfV6WHdY/E6M0Xwg==
X-Authority-Analysis: v=2.4 cv=MP5tWcZl c=1 sm=1 tr=0 ts=694155f4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wnJ2AIBC+6MZbTdryK78rQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=xvucdaCnflZx_vE3ezEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109

Devicetree schema allows the PERST# GPIO to be present in all PCIe bridge
nodes, not just in Root Port node. But the current logic parses PERST# only
from the Root Port nodes. Though it is not causing any issue on the current
platforms, the upcoming platforms will have PERST# in PCIe switch
downstream ports also. So this requires parsing all the PCIe bridge nodes
for the PERST# GPIO.

Hence, rework the parsing logic to extend to all PCIe bridge nodes starting
from the Root Port node. If the 'reset-gpios' property is found for a PCI
bridge node, the GPIO descriptor will be stored in qcom_pcie_perst::desc
and added to the qcom_pcie_port::perst list.

It should be noted that if more than one bridge node has the same GPIO for
PERST# (shared PERST#), the driver will error out. This is due to the
limitation in the GPIOLIB subsystem that allows only exclusive (non-shared)
access to GPIOs from consumers. But this is soon going to get fixed. Once
that happens, it will get incorporated in this driver.

So for now, PERST# sharing is not supported.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 102 +++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7b92e7a1c0d9..73032449d289 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -267,10 +267,15 @@ struct qcom_pcie_cfg {
 	bool no_l0s;
 };
 
+struct qcom_pcie_perst {
+	struct list_head list;
+	struct gpio_desc *desc;
+};
+
 struct qcom_pcie_port {
 	struct list_head list;
-	struct gpio_desc *reset;
 	struct phy *phy;
+	struct list_head perst;
 };
 
 struct qcom_pcie {
@@ -291,11 +296,14 @@ struct qcom_pcie {
 
 static void qcom_perst_assert(struct qcom_pcie *pcie, bool assert)
 {
+	struct qcom_pcie_perst *perst;
 	struct qcom_pcie_port *port;
 	int val = assert ? 1 : 0;
 
-	list_for_each_entry(port, &pcie->ports, list)
-		gpiod_set_value_cansleep(port->reset, val);
+	list_for_each_entry(port, &pcie->ports, list) {
+		list_for_each_entry(perst, &port->perst, list)
+			gpiod_set_value_cansleep(perst->desc, val);
+	}
 
 	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
 }
@@ -1702,18 +1710,58 @@ static const struct pci_ecam_ops pci_qcom_ecam_ops = {
 	}
 };
 
-static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node)
+/* Parse PERST# from all nodes in depth first manner starting from @np */
+static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
+				 struct qcom_pcie_port *port,
+				 struct device_node *np)
 {
 	struct device *dev = pcie->pci->dev;
-	struct qcom_pcie_port *port;
+	struct qcom_pcie_perst *perst;
 	struct gpio_desc *reset;
-	struct phy *phy;
 	int ret;
 
-	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
-				      "reset", GPIOD_OUT_HIGH, "PERST#");
-	if (IS_ERR(reset))
+	if (!of_find_property(np, "reset-gpios", NULL))
+		goto parse_child_node;
+
+	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(np), "reset",
+				      GPIOD_OUT_HIGH, "PERST#");
+	if (IS_ERR(reset)) {
+		/*
+		 * FIXME: GPIOLIB currently supports exclusive GPIO access only.
+		 * Non exclusive access is broken. But shared PERST# requires
+		 * non-exclusive access. So once GPIOLIB properly supports it,
+		 * implement it here.
+		 */
+		if (PTR_ERR(reset) == -EBUSY)
+			dev_err(dev, "Shared PERST# is not supported\n");
+
 		return PTR_ERR(reset);
+	}
+
+	perst = devm_kzalloc(dev, sizeof(*perst), GFP_KERNEL);
+	if (!perst)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&perst->list);
+	perst->desc = reset;
+	list_add_tail(&perst->list, &port->perst);
+
+parse_child_node:
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = qcom_pcie_parse_perst(pcie, port, child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node)
+{
+	struct device *dev = pcie->pci->dev;
+	struct qcom_pcie_port *port;
+	struct phy *phy;
+	int ret;
 
 	phy = devm_of_phy_get(dev, node, NULL);
 	if (IS_ERR(phy))
@@ -1727,7 +1775,12 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 	if (ret)
 		return ret;
 
-	port->reset = reset;
+	INIT_LIST_HEAD(&port->perst);
+
+	ret = qcom_pcie_parse_perst(pcie, port, node);
+	if (ret)
+		return ret;
+
 	port->phy = phy;
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
@@ -1737,9 +1790,10 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 
 static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 {
+	struct qcom_pcie_perst *perst, *tmp_perst;
+	struct qcom_pcie_port *port, *tmp_port;
 	struct device *dev = pcie->pci->dev;
-	struct qcom_pcie_port *port, *tmp;
-	int ret = -ENOENT;
+	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		if (!of_node_is_type(of_port, "pci"))
@@ -1752,7 +1806,9 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	return ret;
 
 err_port_del:
-	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+	list_for_each_entry_safe(port, tmp_port, &pcie->ports, list) {
+		list_for_each_entry_safe(perst, tmp_perst, &port->perst, list)
+			list_del(&perst->list);
 		phy_exit(port->phy);
 		list_del(&port->list);
 	}
@@ -1763,6 +1819,7 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 {
 	struct device *dev = pcie->pci->dev;
+	struct qcom_pcie_perst *perst;
 	struct qcom_pcie_port *port;
 	struct gpio_desc *reset;
 	struct phy *phy;
@@ -1784,19 +1841,28 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (!port)
 		return -ENOMEM;
 
-	port->reset = reset;
+	perst = devm_kzalloc(dev, sizeof(*perst), GFP_KERNEL);
+	if (!perst)
+		return -ENOMEM;
+
 	port->phy = phy;
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
 
+	perst->desc = reset;
+	INIT_LIST_HEAD(&port->perst);
+	INIT_LIST_HEAD(&perst->list);
+	list_add_tail(&perst->list, &port->perst);
+
 	return 0;
 }
 
 static int qcom_pcie_probe(struct platform_device *pdev)
 {
+	struct qcom_pcie_perst *perst, *tmp_perst;
+	struct qcom_pcie_port *port, *tmp_port;
 	const struct qcom_pcie_cfg *pcie_cfg;
 	unsigned long max_freq = ULONG_MAX;
-	struct qcom_pcie_port *port, *tmp;
 	struct device *dev = &pdev->dev;
 	struct dev_pm_opp *opp;
 	struct qcom_pcie *pcie;
@@ -1937,7 +2003,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	ret = qcom_pcie_parse_ports(pcie);
 	if (ret) {
-		if (ret != -ENOENT) {
+		if (ret != -ENODEV) {
 			dev_err_probe(pci->dev, ret,
 				      "Failed to parse Root Port: %d\n", ret);
 			goto err_pm_runtime_put;
@@ -1996,7 +2062,9 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 err_host_deinit:
 	dw_pcie_host_deinit(pp);
 err_phy_exit:
-	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
+	list_for_each_entry_safe(port, tmp_port, &pcie->ports, list) {
+		list_for_each_entry_safe(perst, tmp_perst, &port->perst, list)
+			list_del(&perst->list);
 		phy_exit(port->phy);
 		list_del(&port->list);
 	}

-- 
2.48.1


