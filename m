Return-Path: <linux-arm-msm+bounces-85359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8874CC3CC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51B6F3007743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3381F3845A9;
	Tue, 16 Dec 2025 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsLSz0nx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXI0Se36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17B382D55
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889547; cv=none; b=jIK+lZm+pv4WWQEbwqlCKdotx4H2ZdYRMXfsj8wqO3gGFmTYxcGZXlyDkpuMTkl5Mc3ho3Gnl8zm+TWiq1vM2Ei6T5C4E8sWN3knUvfzy6hpG5iTqw/qFzKs+oKmdlp5GNannqibzL9sb3brYzE5hMRHuE41zJwQ1lD0lT5u4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889547; c=relaxed/simple;
	bh=4RZqS9C5omgsMD+6meE6/yDTZg9+e38zvxvu7kBnSY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4Azc6htMj2gPj89ywzv2OES72nhyPBSi2eN1ODBNxPKSvuAhs6ybXfr87ihu7bj+98dYD4lA6NsOwxYUtMjLGcCuJ20sCk62NUSczYzMCR9iSFPbLxCuIH4ahcclVUMLnHg9xlrqGBus385BktUdMUHuHA8xWhdG+e0FJp9SBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsLSz0nx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXI0Se36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9bgD72516351
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2gpMHf9kn3YsZ6lMZhd5fnKWGfnj5wMtwuzg4GBEGD8=; b=IsLSz0nxHPWWcOHn
	Gt8EWBJgOJxBSZA91uBsq6mneCxj1NOOIzqFCYsnWEXc/QPrWcs+hi9jYL/uVvmd
	79GMgviTYdiuelNpUzfE3o0vZYQiv0bf7jtEfC2xvGOoff//QqM9cp+0JcJKEe2x
	ZrY0oZO/Uu2lABy4dVdK3HeB3UA/GRlQLwglrhBXn3lHTAaj6n2niuoQX+FIPAgg
	9JyKEzu6xJG73/dHIWsHpfvVGJvbldBGwUusVXU6HKxdwwaRyRiwipU5N1bQhC18
	dgOLHIoCaUc0J005tHtYMxKZpCnJPJLJXf9PoaX2Ii9WA4MRhGWayuG2yTabA1MT
	RIEFbQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34y80qag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d5564057d0so12778814b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889544; x=1766494344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gpMHf9kn3YsZ6lMZhd5fnKWGfnj5wMtwuzg4GBEGD8=;
        b=ZXI0Se36h6YycNZt5s2NjyDDNCAcvZlgcndEHmkEBxkn1oVMCVb9/Jqe72F5wn0KMz
         xfCR9i+CEXgJonSyZ6Rz2dr7wDRfk0PWko0/f99f1IpXRiXtNp8rbHZ0h8kLpuuuPzrr
         L3DM01UetPQWr4XvMU3dN2e3HyzM2cTeNyzD19Z6uimhRjnufykkQ60NP3cwZzFVqPvS
         0KqgisTuv140k0MAu+8XtniniBpYR7iJ5UMU4ZeOwoS1waMcuG80/oFrx/yka1DcdHX2
         SqIsGooFrbHcNnqiXu5XsaOLHn2Z6AkPh6d6XtInGd0iUrFbhMHVIxYBgBS8+uh9IULn
         V/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889544; x=1766494344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2gpMHf9kn3YsZ6lMZhd5fnKWGfnj5wMtwuzg4GBEGD8=;
        b=eNQxn4had7bw/1KDaRmJmUxrPXo/5j1A7WYz9P4WixmZBx2rby/QAxUfP2Nh185Lla
         4E9pu57qJ+gk26MoDBs7KcTmMKfCczo5ZBKPU/vQAepJPeUbfVGTOFQbXwczrQ4L6IRb
         y54Snc8EpCl/RHFd/mkf7cRT2MqPWPs+T/mIjYagLyVv3n0T2n5uvd+vgCrWzs2YDmAT
         1qh/tZJ5zCb8DszHRA9UFIsCB5w2d8oR5uSEpZ3VTTPbWw88Rq6UBVK07zngtG1PzbBr
         yM8l2C7A4xFKSVQa04af+uD9viF/z3Ex0UG0wmzR9stE6eabJIR06YqmfhZo7zauX7xa
         pRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh/fQ+3+6MiX8iMdGxmAPZLBMmVqvfVNnPIYfX2vB6er5ydACpCYFa+mF1NPqNjssYWf/qhEzBP6TVjuvN@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+k81E+3bbhzJoNx2en1ZUQLmKbNGD6S1m9+YRkh/llLqHLJS
	N9COd3IxJBgLaqNAtWxCTy0cyxdNWib28CYJH+fDBih6UytnjEnegbncm0CGmOXr5OBmODvAuD6
	Onb/ACORVFYSDIpvTrgl990vKJKNrsQKgag2tbUSQz9ZM1z8YfN8QeK0aRP5V/4/nDGr8
X-Gm-Gg: AY/fxX6xPPRUAyFeYqtsJ4bkVNYLN32/q7zLFI4akjpVtMJA8e3IE9GkWoFen3rZMZF
	Wt5rcJtztV2MKdP+7B2U8jvtt5sBmbj+Tjrci9jvIHhWUFaCCSBwiSBjt8jNYwTtWSc6cocjzLv
	ZNWVN/ZtY36BOtGVJLFp4jVYiB3hQZDYlPvyfdLYBerpnB/haH6xw/H8n70HexuExmkU4BYPdwg
	XwF+7LasdnY6+C2BAoY9UVfm3fThzjwQB9g9g9pJcJKeOb76cQQ4/cOGh1I0BfL7ypGNYG1Jit5
	cCFXyvERarxOmFoo2qvrYtlGatRlktLOPHV7wXxJSewPSs8OXmB7E86BRbL6hYkj6ihFqA6enp7
	3Rgfu5ukd9UiTN/2fVyJjvV/y4uJ9jnDczB0uaRCIqw==
X-Received: by 2002:a05:6a00:138e:b0:7f7:612e:461e with SMTP id d2e1a72fcca58-7f7612e46e6mr12318129b3a.57.1765889543479;
        Tue, 16 Dec 2025 04:52:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJU7gwo5fGnKCS3PuUWKoDT3aiGbjLTaLkWJF6hxZ6AQlFNOvCz8g7NH9FrkvzDdVucqhcWQ==
X-Received: by 2002:a05:6a00:138e:b0:7f7:612e:461e with SMTP id d2e1a72fcca58-7f7612e46e6mr12318108b3a.57.1765889543027;
        Tue, 16 Dec 2025 04:52:23 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f5ab7d87e8sm13634362b3a.25.2025.12.16.04.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:52:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 18:21:47 +0530
Subject: [PATCH v2 5/5] PCI/pwrctrl: Switch to the new pwrctrl APIs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-pci-pwrctrl-rework-v2-5-745a563b9be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9481;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=4RZqS9C5omgsMD+6meE6/yDTZg9+e38zvxvu7kBnSY8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpQVXom9V2sD9uL0evNrzSmHVYO68vB9b5L+b1r
 OIr2xTo2ZKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaUFV6AAKCRBVnxHm/pHO
 9WR8CACV9ioXJL2gvQG9MY5qC3NCLI2ENXaj++tsd52Z/IGkmJerU9KaiwLKp1LHrV4MayX53XE
 aFjZKYSYHyg09D8/CWaHEYr64fjWcwH0zvqWy2aQQNYFGfRrJlFsW187ArNI1FyUYpF1gwI7jbw
 ygiLuqoj7smnXwq1+AOyEadAtlWInOoPaAVduxky3xWMyn2GRW6UAfMz0yvHHsYE5QNIGyNAjSD
 i2IVi/3+8muE7lyrjcqiyPqzuOSMwmdb6IprF1waRlzxQ0v0QxbZ1BZ+1lJjZ479MgdhAhk/5H6
 H4yZ6B27H0M7fnWersSQjpQgrdynB6RCna3BrYQG92DUehzl
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Authority-Analysis: v=2.4 cv=LrCfC3dc c=1 sm=1 tr=0 ts=69415608 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wnJ2AIBC+6MZbTdryK78rQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8
 a=Via3SN_SAYv5dIAeqUIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: hehRtpxIKLu65fslralhBpJsUJgKoBj0
X-Proofpoint-GUID: hehRtpxIKLu65fslralhBpJsUJgKoBj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfXyu6fF77HmDb8
 dMC6e7LX2vhLrksTeUsgANPIUpLffum9AdccwDOU/48fr6GftlON+zVwD/gSoNpr1NcfQFA2Qgu
 VNOb0RXTUBhI0YYxBbB9ieZZuX+R88oHReY4KPwXPQ2p11/a4huFFw33V+i1W4yL97FJDKrxcBN
 bFr0h2mfSiuA9oXqLWtfJlwuJ/0wW/RLWCUaFdQ0hcap60Yr/jzzOWa8LZHLdDxZoH7a4O8Y5yI
 Z8Qc4s6oU+o3DWACjdWG+w5+Bbakoy4Gjnb0HvrMhNo6CHgAuJPQdzbEewJ/31J4+71ZpH/MQfb
 4bGJzyKekF/n3zpBKf7Y6cYThzM028Hv0rJbLwbfKMRYGK7+Nl1i/Vehwc/rwafB29KRwTOkLNp
 8y46tjFtHiJ30l9g6ubkFovWy1KajQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109

Adopt the recently introduced pwrctrl APIs to create, power on, destroy,
and power off pwrctrl devices. In qcom_pcie_host_init(), call
pci_pwrctrl_create_devices() to create devices, then
pci_pwrctrl_power_on_devices() to power them on, both after controller
resource initialization. Once successful, deassert PERST# for all devices.

In qcom_pcie_host_deinit(), call pci_pwrctrl_power_off_devices() after
asserting PERST#. Note that pci_pwrctrl_destroy_devices() is not called
here, as deinit is only invoked during system suspend where device
destruction is unnecessary. If the driver becomes removable in future,
pci_pwrctrl_destroy_devices() should be called in the remove() handler.

At last, remove the old pwrctrl framework code from the PCI core, as the
new APIs are now the sole consumer of pwrctrl functionality. And also do
not power on the pwrctrl drivers during probe() as this is now handled by
the APIs.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c   | 22 ++++++++++--
 drivers/pci/probe.c                      | 59 --------------------------------
 drivers/pci/pwrctrl/core.c               | 15 --------
 drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  5 ---
 drivers/pci/pwrctrl/slot.c               |  2 --
 drivers/pci/remove.c                     | 20 -----------
 6 files changed, 20 insertions(+), 103 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 73032449d289..7c0c66480f12 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -24,6 +24,7 @@
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
+#include <linux/pci-pwrctrl.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -1318,10 +1319,18 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		goto err_deinit;
 
+	ret = pci_pwrctrl_create_devices(pci->dev);
+	if (ret)
+		goto err_disable_phy;
+
+	ret = pci_pwrctrl_power_on_devices(pci->dev);
+	if (ret)
+		goto err_pwrctrl_destroy;
+
 	if (pcie->cfg->ops->post_init) {
 		ret = pcie->cfg->ops->post_init(pcie);
 		if (ret)
-			goto err_disable_phy;
+			goto err_pwrctrl_power_off;
 	}
 
 	qcom_ep_reset_deassert(pcie);
@@ -1336,6 +1345,10 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 err_assert_reset:
 	qcom_ep_reset_assert(pcie);
+err_pwrctrl_power_off:
+	pci_pwrctrl_power_off_devices(pci->dev);
+err_pwrctrl_destroy:
+	pci_pwrctrl_destroy_devices(pci->dev);
 err_disable_phy:
 	qcom_pcie_phy_power_off(pcie);
 err_deinit:
@@ -1350,6 +1363,11 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
 
 	qcom_ep_reset_assert(pcie);
+	/*
+	 * No need to destroy pwrctrl devices as this function only gets called
+	 * during system suspend as of now.
+	 */
+	pci_pwrctrl_power_off_devices(pci->dev);
 	qcom_pcie_phy_power_off(pcie);
 	pcie->cfg->ops->deinit(pcie);
 }
@@ -2027,7 +2045,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
-		dev_err(dev, "cannot initialize host\n");
+		dev_err_probe(dev, ret, "cannot initialize host\n");
 		goto err_phy_exit;
 	}
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 41183aed8f5d..6e7252404b58 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2563,56 +2563,6 @@ bool pci_bus_read_dev_vendor_id(struct pci_bus *bus, int devfn, u32 *l,
 }
 EXPORT_SYMBOL(pci_bus_read_dev_vendor_id);
 
-#if IS_ENABLED(CONFIG_PCI_PWRCTRL)
-static struct platform_device *pci_pwrctrl_create_device(struct pci_bus *bus, int devfn)
-{
-	struct pci_host_bridge *host = pci_find_host_bridge(bus);
-	struct platform_device *pdev;
-	struct device_node *np;
-
-	np = of_pci_find_child_device(dev_of_node(&bus->dev), devfn);
-	if (!np)
-		return NULL;
-
-	pdev = of_find_device_by_node(np);
-	if (pdev) {
-		put_device(&pdev->dev);
-		goto err_put_of_node;
-	}
-
-	/*
-	 * First check whether the pwrctrl device really needs to be created or
-	 * not. This is decided based on at least one of the power supplies
-	 * being defined in the devicetree node of the device.
-	 */
-	if (!of_pci_supply_present(np)) {
-		pr_debug("PCI/pwrctrl: Skipping OF node: %s\n", np->name);
-		goto err_put_of_node;
-	}
-
-	/* Now create the pwrctrl device */
-	pdev = of_platform_device_create(np, NULL, &host->dev);
-	if (!pdev) {
-		pr_err("PCI/pwrctrl: Failed to create pwrctrl device for node: %s\n", np->name);
-		goto err_put_of_node;
-	}
-
-	of_node_put(np);
-
-	return pdev;
-
-err_put_of_node:
-	of_node_put(np);
-
-	return NULL;
-}
-#else
-static struct platform_device *pci_pwrctrl_create_device(struct pci_bus *bus, int devfn)
-{
-	return NULL;
-}
-#endif
-
 /*
  * Read the config data for a PCI device, sanity-check it,
  * and fill in the dev structure.
@@ -2622,15 +2572,6 @@ static struct pci_dev *pci_scan_device(struct pci_bus *bus, int devfn)
 	struct pci_dev *dev;
 	u32 l;
 
-	/*
-	 * Create pwrctrl device (if required) for the PCI device to handle the
-	 * power state. If the pwrctrl device is created, then skip scanning
-	 * further as the pwrctrl core will rescan the bus after powering on
-	 * the device.
-	 */
-	if (pci_pwrctrl_create_device(bus, devfn))
-		return NULL;
-
 	if (!pci_bus_read_dev_vendor_id(bus, devfn, &l, 60*1000))
 		return NULL;
 
diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index ebe1740b7c1c..4e2c41bc4ffe 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -45,16 +45,6 @@ static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 	return NOTIFY_DONE;
 }
 
-static void rescan_work_func(struct work_struct *work)
-{
-	struct pci_pwrctrl *pwrctrl = container_of(work,
-						   struct pci_pwrctrl, work);
-
-	pci_lock_rescan_remove();
-	pci_rescan_bus(to_pci_host_bridge(pwrctrl->dev->parent)->bus);
-	pci_unlock_rescan_remove();
-}
-
 /**
  * pci_pwrctrl_init() - Initialize the PCI power control context struct
  *
@@ -64,7 +54,6 @@ static void rescan_work_func(struct work_struct *work)
 void pci_pwrctrl_init(struct pci_pwrctrl *pwrctrl, struct device *dev)
 {
 	pwrctrl->dev = dev;
-	INIT_WORK(&pwrctrl->work, rescan_work_func);
 	dev_set_drvdata(dev, pwrctrl);
 }
 EXPORT_SYMBOL_GPL(pci_pwrctrl_init);
@@ -95,8 +84,6 @@ int pci_pwrctrl_device_set_ready(struct pci_pwrctrl *pwrctrl)
 	if (ret)
 		return ret;
 
-	schedule_work(&pwrctrl->work);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pci_pwrctrl_device_set_ready);
@@ -109,8 +96,6 @@ EXPORT_SYMBOL_GPL(pci_pwrctrl_device_set_ready);
  */
 void pci_pwrctrl_device_unset_ready(struct pci_pwrctrl *pwrctrl)
 {
-	cancel_work_sync(&pwrctrl->work);
-
 	/*
 	 * We don't have to delete the link here. Typically, this function
 	 * is only called when the power control device is being detached. If
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
index 0fb9038a1d18..7697a8a5cdde 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
@@ -101,11 +101,6 @@ static int pci_pwrctrl_pwrseq_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(data->pwrseq),
 				     "Failed to get the power sequencer\n");
 
-	ret = pci_pwrctrl_pwrseq_power_on(&data->ctx);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to power-on the device\n");
-
 	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_pwrseq_power_off,
 				       data);
 	if (ret)
diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 14701f65f1f2..888300aeefec 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -79,8 +79,6 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(slot->clk),
 				     "Failed to enable slot clock\n");
 
-	pci_pwrctrl_slot_power_on(&slot->ctx);
-
 	slot->ctx.power_on = pci_pwrctrl_slot_power_on;
 	slot->ctx.power_off = pci_pwrctrl_slot_power_off;
 
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index 417a9ea59117..e9d519993853 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -17,25 +17,6 @@ static void pci_free_resources(struct pci_dev *dev)
 	}
 }
 
-static void pci_pwrctrl_unregister(struct device *dev)
-{
-	struct device_node *np;
-	struct platform_device *pdev;
-
-	np = dev_of_node(dev);
-	if (!np)
-		return;
-
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return;
-
-	of_device_unregister(pdev);
-	put_device(&pdev->dev);
-
-	of_node_clear_flag(np, OF_POPULATED);
-}
-
 static void pci_stop_dev(struct pci_dev *dev)
 {
 	pci_pme_active(dev, false);
@@ -73,7 +54,6 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	pci_ide_destroy(dev);
 	pcie_aspm_exit_link_state(dev);
 	pci_bridge_d3_update(dev);
-	pci_pwrctrl_unregister(&dev->dev);
 	pci_free_resources(dev);
 	put_device(&dev->dev);
 }

-- 
2.48.1


