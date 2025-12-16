Return-Path: <linux-arm-msm+bounces-85358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CED37CC3CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C84E030674FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123A2382D35;
	Tue, 16 Dec 2025 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUvr9Lhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMiEuLCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE2382599
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889541; cv=none; b=qPM6AkahB16Vpg0nL9ZCIb5p2B+tKGqHKnqvm2cfChUa8/IcAxE7qC0QG2nLxKTxPDvr77hn8RpwYm82HpSy+oM6h9yGD3hIctqM6ZFwrMjiBC+zzCWb5uCGUhM21TVed64VISTvzMEzUGdnTYqdyHa28ay2CumQwyNs/0/nRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889541; c=relaxed/simple;
	bh=tJ3oGSmbF0uqKIwPRkbZG//2gq/sUu33RqRKbMsLjEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9CxRueWI5u2v7F0FTeQwV07yWtrQoHYgAp+BcO8UYgGSnPmg0U2AN9hGp7YZg2lBUf3mnW5oxke3DNb2orm5OmsgTrW8IKSYVrKga3tawxhv6oo6s4XAri+dWPElyM7aNi6ZNgkXOtbaxoxSooeefP+m6bJNQgS/kiziDGFQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUvr9Lhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMiEuLCX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9ZprU3349298
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9RCd35HO7B795ZOFtTVgJAEk6vZrWP6EDm6tO69gdI=; b=YUvr9Lhb8HL2/Qbn
	BaL28BkxTMgPHz7LIjCIXeuYr0q0XT9tMTETSUlF3qrlFwjh3BpkPs/XsxJee89G
	YUUMBtsqQJgFYvn/YATc0O+Yvmf5N/f3DKG/eb9h61ak27BC84Sy5oUNTCg9xqo0
	n+tPMUDFUitHVk8OZi40a4hvtXXIVVgzblUU1x97XYA8a2uafBsgUnKSMgjDizkb
	IesbeGDBLVX2/T4ZSQJP6OV1YMTvJv+02pNlltqSCQywFsRCGE1ABBqvwzj9u8Gx
	J83dBimO4E4FzOuiQvZ5bfHS8OgZgWENX7LAMMr19kRgKTdP8ZBwon/GMNbPQrhu
	tfj7GQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34xd0qeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba92341f38so5293968b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889539; x=1766494339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9RCd35HO7B795ZOFtTVgJAEk6vZrWP6EDm6tO69gdI=;
        b=UMiEuLCXeXaH/1bG2yCnO/rpgvkDyfQPcFsIU7n7FxDNL1LxUcue51Sglz2c1Ngy+Q
         GFre1IBOReZTCLjCXTyI77aIrLfyR8mByPDg1dP6bDjtUg4pK3VpDogBffZEVWUfMsJ+
         HFQD4nFeKBXrFr/zvVvRdmA0CH+C6qsm/+/ISuW7+gFFztEFErkiL1bokKpNrptktPxK
         jvn+0b6HYzCxd3kDINyOMAq6VKZU5yl2gI4gMUIFv8z56INrIHAzeQ+huZEFAhEOj4y2
         PCcKZwQbpt04onMDsrxIx6EHvtHZ2+H+5EbIjS1BJ2WyN87/o6h2ZXbl4rUzdYDtVLT3
         Q6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889539; x=1766494339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M9RCd35HO7B795ZOFtTVgJAEk6vZrWP6EDm6tO69gdI=;
        b=ga3F966o6Elha2+Io4XHtU6E5bsvhruqm6/PG7/JlgEIjd86OyjjwJhzzsXsuOarem
         +aGl/LyRK3ba5k/+9A66D94Z0Mq4K8+zJBHZAun91zjXR4djS81Jef2DixJpViNtgUsA
         AdNuZ9F/a0IMC3pojh2b3SN5w0/q5WeDDHIgt+w29N8je/waqrOfTMcQTSanJiYMRuh1
         Fxi8CNNyPLvr3A4Px+3MB6s6guNEXDZEqrorj3d3ZSMrwTcX/Kr5ixCk0QQXBJfgxiVv
         Gqws5QsDRvNeOQyMrdsYpVJCuxwS9C154FtYgIDR9+7HbEti8NOR/KGwEG/m9JjS7hqG
         avsA==
X-Forwarded-Encrypted: i=1; AJvYcCUVWX7FTXzQXhAMzP0fv6k0twYUVLQDeqCuXKmUUJyJxbu58plD5vfYdg0fe7HQZSHDmdmsqbFaf29/F6fP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0n3Sn6naeTb3c+E5V0VqR/gpau3/8W5kYf2Vtk8t8hC/0pCSq
	8UnLWqVoRxkArti12UxXTzkhtZs4coaLSNoAhL3+7Jnnkek+zEHvmjPtfSL7+IHHnTM1QeP4dtz
	dEFq62ktH6zkk0MJowJs2HZfrkf/rX4ef61PghflcY3X39fTmCJVDiC677EKgW/spp4Z5
X-Gm-Gg: AY/fxX6I8c354JVuKMmBSTS2D7lzqLVMdsQrRYYXArxN+oSc4Dlfk7LMOgw8A/5cLml
	HR4hxYls4BWx32VFFTi0uR9XBJr5oyqi+COUAlodB5AZKXyIJlF5GfAOYabHlyBvV3I/k3oJuEM
	+d2tCwTG2UcMnfTqquSezZBID2IcMJ4rYIuQ+Ix+gHG8JhiaZVBnrd0NmCr66x9qmmZiFXwW+8E
	r6ox35jMxKyaU88zN92fIddJW/gyVtcY9JncNmDomK7lVBAqNlvXC9ZvIXshQTfV94AahKysQuf
	2NCV3Iyqy2MuGGGTdijp873hYPv5L+J9GM8W8a0qe2VKnLAvouPTj3JKXyPlP3t6CGFNddACJsj
	tlYZXo1rGzxmtf0ZT+ulfg7/9+yDt9X/gJCguzPv84w==
X-Received: by 2002:a05:6a00:429b:b0:7e8:43f5:bd55 with SMTP id d2e1a72fcca58-7f669c8ba28mr11528950b3a.65.1765889538576;
        Tue, 16 Dec 2025 04:52:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW+M8UF2OnxF2QQLMe2t94UUedPRIEiBdPAnCYqd00GJ7WaY9ekheOQ3SyQO+OsYryx/7XvA==
X-Received: by 2002:a05:6a00:429b:b0:7e8:43f5:bd55 with SMTP id d2e1a72fcca58-7f669c8ba28mr11528933b3a.65.1765889538081;
        Tue, 16 Dec 2025 04:52:18 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f5ab7d87e8sm13634362b3a.25.2025.12.16.04.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:52:17 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 18:21:46 +0530
Subject: [PATCH v2 4/5] PCI/pwrctrl: Add APIs to power on/off the pwrctrl
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-pci-pwrctrl-rework-v2-4-745a563b9be6@oss.qualcomm.com>
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
        Chen-Yu Tsai <wenst@chromium.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6123;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=tJ3oGSmbF0uqKIwPRkbZG//2gq/sUu33RqRKbMsLjEo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpQVXoJshYDHbsyksxVQhRBCuW4SoUJYUyBpS6P
 Gj/UPdchMOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaUFV6AAKCRBVnxHm/pHO
 9Un7CACIz8vUMEsmPwq2dAYw/IqptY36Bc+4vC1uj12ujaHijC5HIsoTEJ+/QbyjDV1CxGcLy7N
 WeEOc5uEuKh8tR3Uxs3Yu9JWC9wlICZWLyLrFcU2eHjgR8SugTnajWk56xCuDsQwpw7oYPjBIOo
 in+lSOWmVB9EC8j+YlCpNUe4vBDNco/ruQpPNZZLaLWgt2MxdT4Cmt+bBtUsRf99DLJjUfWJvqy
 Pt47beVYC9dxX4YUIstC6jzu/DvvL2i9Emq4PWo5WEoskr2m/vs50QVHOR2m/fjq7x1hDSr+DBC
 TUYtNLUFWAL7Vz089OCFUb05cTumGn3BEw/GNaeCfxne4+iP
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfX2vtS21fgblUf
 RQziKWSHBHJFnrVMA66iXQ1KHh1plSS4KwJZI0FdNM8mWl1VNFiGX9VPUROWC5DzRuBJfTd/YiG
 rWNRYrP84H+ir+OovBGuLXveUbRBgS0SiAu82N7PsCAPcJylw/EAcaSpIo27Sk17F9CA7b8HqZj
 vIGMjw13iWfdpyFSBjyt1D8UqyLjWrIOlVoIuMHbA3uNIg58uUAGj7lCbS2Kb8JemDKTrfsM6PV
 QkdVxwmft2OpZOBwwKpb0PYE2D2K5t2QIknGNTIOyiRZE5PeOnkCf2evtglC31UJriRmHWBM3tO
 WPbYHWbVHqAqW4ZNi5MYSVRCJBwklOHhhXLiwfee+za1pSPRBuSsOsbPYwePOUzFkxV2ZgDpH3n
 gzXFdZ+Kfzz0fn6hhEYKRYr/RSJ3GQ==
X-Proofpoint-GUID: kW79sLC6dIJTq6sdLeht-d5ZyLxgwVAO
X-Proofpoint-ORIG-GUID: kW79sLC6dIJTq6sdLeht-d5ZyLxgwVAO
X-Authority-Analysis: v=2.4 cv=T7mBjvKQ c=1 sm=1 tr=0 ts=69415603 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wnJ2AIBC+6MZbTdryK78rQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=KKAkSRfTAAAA:8
 a=RyQsIt2LcgCPV6mEHuQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109

To fix PCIe bridge resource allocation issues when powering PCIe
switches with the pwrctrl driver, introduce APIs to explicitly power
on and off all related devices simultaneously.

Previously, the individual pwrctrl drivers powered on/off the PCIe devices
autonomously, without any control from the controller drivers. But to
enforce ordering w.r.t powering on the devices, these APIs will power
on/off all the devices at the same time.

The pci_pwrctrl_power_on_devices() API recursively scans the PCI child
nodes, makes sure that pwrctrl drivers are bind to devices, and calls their
power_on() callbacks.

Similarly, pci_pwrctrl_power_off_devices() API powers off devices
recursively via their power_off() callbacks.

These APIs are expected to be called during the controller probe and
suspend/resume time to power on/off the devices. But before calling these
APIs, the pwrctrl devices should've been created beforehand using the
pci_pwrctrl_{create/destroy}_devices() APIs.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/core.c  | 121 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-pwrctrl.h |   4 ++
 2 files changed, 125 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 6eca54e0d540..ebe1740b7c1c 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -65,6 +65,7 @@ void pci_pwrctrl_init(struct pci_pwrctrl *pwrctrl, struct device *dev)
 {
 	pwrctrl->dev = dev;
 	INIT_WORK(&pwrctrl->work, rescan_work_func);
+	dev_set_drvdata(dev, pwrctrl);
 }
 EXPORT_SYMBOL_GPL(pci_pwrctrl_init);
 
@@ -152,6 +153,126 @@ int devm_pci_pwrctrl_device_set_ready(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_pci_pwrctrl_device_set_ready);
 
+static int __pci_pwrctrl_power_on_device(struct device *dev)
+{
+	struct pci_pwrctrl *pwrctrl = dev_get_drvdata(dev);
+
+	if (!pwrctrl)
+		return 0;
+
+	return pwrctrl->power_on(pwrctrl);
+}
+
+/*
+ * Power on the devices in a depth first manner. Before powering on the device,
+ * make sure its driver is bound.
+ */
+static int pci_pwrctrl_power_on_device(struct device_node *np)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = pci_pwrctrl_power_on_device(child);
+		if (ret)
+			return ret;
+	}
+
+	pdev = of_find_device_by_node(np);
+	if (pdev) {
+		if (!device_is_bound(&pdev->dev)) {
+			dev_dbg(&pdev->dev, "driver is not bound\n");
+			ret = -EPROBE_DEFER;
+		} else {
+			ret = __pci_pwrctrl_power_on_device(&pdev->dev);
+		}
+		put_device(&pdev->dev);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * pci_pwrctrl_power_on_devices - Power on the pwrctrl devices
+ *
+ * @parent: Parent PCI device for which the pwrctrl devices need to be powered
+ * on.
+ *
+ * This function recursively traverses all pwrctrl devices for the child nodes
+ * of the specified PCI parent device, and powers them on in a depth first
+ * manner.
+ *
+ * Returns: 0 on success, negative error number on error.
+ */
+int pci_pwrctrl_power_on_devices(struct device *parent)
+{
+	struct device_node *np = parent->of_node;
+	int ret;
+
+	for_each_available_child_of_node_scoped(np, child) {
+		ret = pci_pwrctrl_power_on_device(child);
+		if (ret) {
+			pci_pwrctrl_power_off_devices(parent);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_pwrctrl_power_on_devices);
+
+static void __pci_pwrctrl_power_off_device(struct device *dev)
+{
+	struct pci_pwrctrl *pwrctrl = dev_get_drvdata(dev);
+
+	if (!pwrctrl)
+		return;
+
+	return pwrctrl->power_off(pwrctrl);
+}
+
+static int pci_pwrctrl_power_off_device(struct device_node *np)
+{
+	struct platform_device *pdev;
+
+	for_each_available_child_of_node_scoped(np, child)
+		pci_pwrctrl_power_off_device(child);
+
+	pdev = of_find_device_by_node(np);
+	if (pdev) {
+		if (device_is_bound(&pdev->dev))
+			__pci_pwrctrl_power_off_device(&pdev->dev);
+
+		put_device(&pdev->dev);
+	}
+
+	return 0;
+}
+
+/**
+ * pci_pwrctrl_power_off_devices - Power off the pwrctrl devices
+ *
+ * @parent: Parent PCI device for which the pwrctrl devices need to be powered
+ * off.
+ *
+ * This function recursively traverses all pwrctrl devices for the child nodes
+ * of the specified PCI parent device, and powers them off in a depth first
+ * manner.
+ *
+ * Returns: 0 on success, negative error number on error.
+ */
+void pci_pwrctrl_power_off_devices(struct device *parent)
+{
+	struct device_node *np = parent->of_node;
+
+	for_each_available_child_of_node_scoped(np, child)
+		pci_pwrctrl_power_off_device(child);
+}
+EXPORT_SYMBOL_GPL(pci_pwrctrl_power_off_devices);
+
 static int pci_pwrctrl_create_device(struct device_node *np, struct device *parent)
 {
 	struct platform_device *pdev;
diff --git a/include/linux/pci-pwrctrl.h b/include/linux/pci-pwrctrl.h
index 5590ffec0bea..1b77769eebbe 100644
--- a/include/linux/pci-pwrctrl.h
+++ b/include/linux/pci-pwrctrl.h
@@ -57,8 +57,12 @@ int devm_pci_pwrctrl_device_set_ready(struct device *dev,
 #if IS_ENABLED(CONFIG_PCI_PWRCTRL)
 int pci_pwrctrl_create_devices(struct device *parent);
 void pci_pwrctrl_destroy_devices(struct device *parent);
+int pci_pwrctrl_power_on_devices(struct device *parent);
+void pci_pwrctrl_power_off_devices(struct device *parent);
 #else
 static inline int pci_pwrctrl_create_devices(struct device *parent) { return 0; }
 static void pci_pwrctrl_destroy_devices(struct device *parent) { }
+static inline int pci_pwrctrl_power_on_devices(struct device *parent) { return 0; }
+static void pci_pwrctrl_power_off_devices(struct device *parent) { }
 #endif
 #endif /* __PCI_PWRCTRL_H__ */

-- 
2.48.1


