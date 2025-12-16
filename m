Return-Path: <linux-arm-msm+bounces-85356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69582CC39C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAEBE300DE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B81137C107;
	Tue, 16 Dec 2025 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LraelETJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdWRJtTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A736404F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889533; cv=none; b=QV0avwYlF/G2m7cnoJoynCQ0Zm0j91bUwFqStNP/sdu2+cH1g/chW6o0kWyHIoB171XQ7UyPvzjr20mLW9IBuOyQ9vzAvCQMJfwg+hby5wpAUgQeJn9OWHQFv3aF8RpBrTUmNhYk7bsCmGcSIjJ1TKUSR80FO4MyqEWs9e4Budc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889533; c=relaxed/simple;
	bh=hImE7GQrCuzWz+LCETc8MWiZwVHo4qo/PyPQSktScRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNYUVd5Oo5ynrgmYxG+XuwePkcghibKLd+fbR4X39xrP395Um36Sk5imb+9gjWRoFx5qBw2CDjjf0VK+b9ivjh5XSCykRiuN0+W4u/b0h75b/xAtu5V+Q0JdQ2N4dFdPh4uyl2jvW0noQQFibXZIRyDaKvXveBc9tlhmAAVAqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LraelETJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdWRJtTo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGBOIi83391038
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jy1598yUJqUvu+a7XgM5cYaI53QGia/dl9hRsBk1Zhk=; b=LraelETJ8uHo7rm4
	z4g4tkiP9GsG63ZX40EEg9dp74yWZzTsQxlpy/Wdd7YKtnIxgiljEyrERjtMzRP2
	+N+8951XtOPmYmyZjuMjBRbcp/UWyEuoO68sKZRMevXlX0AmJ08zOvCEGcid957k
	JtTjS4jwxezJeRngiOiuhh9ln5c1/xzX7O2v9xWf/bNru/VGOKkTDAW3T8qwRFbP
	IRiTMUPLOFXV16Fo+eJoVLy/9IdLcSIoilf+H5fRaHzk72uG2FKRjX6cwAugdDP0
	txKVKow35q73dEoYkIVsaGggSG9hs+LRzMsGBWolR389bCIdWp3nwKTuSxhVX5XU
	iCFwow==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b36h389r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso5126113b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889528; x=1766494328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jy1598yUJqUvu+a7XgM5cYaI53QGia/dl9hRsBk1Zhk=;
        b=SdWRJtToHDKUJnxPXXehCof0yjpAwLxywQzxdghGgJ84FTEpt8OkvaerVd8ZeQMLZ/
         yrXons8Kevo9DSER7ZuKQCNPTryipxAO9e7gaoirbcy22kIYvf80sTqXYkSVV8yJ1OC3
         uEAQmoqyFDZkDCSMRlGJkeCHgwdiT9iAGhR3QArA3VTtSuM1BHwJ4cyAn+YEfoJLWenQ
         1D5M77ewz3kap1DPgnKeE2cFJfFEerAJzCZk8+c9tbbVFYHUAowlLUXSfINACPuPIX0J
         lkIn8WvGVW9yYT0SD2PouHLFnVnPRdmc0SnKy6YbrZkaeWHfKCuJxKevHheYqICkSYMS
         PMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889528; x=1766494328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jy1598yUJqUvu+a7XgM5cYaI53QGia/dl9hRsBk1Zhk=;
        b=tmPxiosc9Jl+bKO5FHNbh9vh96T2sUY+1KeWSGOLAkhbNBkJ+sG4JKZ6CnKdcH3Z+a
         CeZiyMJJ55pemTf1s502bIL/sadmNA7qBtooeJ5e2uKKeTpNomZFsShmRymhvhlQa+5+
         6sddBsi+7xSC8ClIkN/ccVMRSqC9Q4Xpd8XCN5DtyXMM4KxUlnQU28Z6vV3ddoTfma8j
         hg3jrvz1DEpyouFUJjyhSTX5xW6tOdlbrJ5FihLRcNCxCJ089vZ3pzv9pWHgveIgAGbP
         gl80Njfx0fy6mrBKZL0yqtGk9KkQ4/5F5draVcIaVZsIN44nnwLroOLABrxlYFCzsB9B
         Tsrw==
X-Forwarded-Encrypted: i=1; AJvYcCXL2DaR34d9nQr9SVYjt+ccvayEmkr8E/YN7uvAeGXQSXoD4MNb0g3wYXeRqqK8IGBWrgJ8QrQ7h5P5fi9Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4vuEjMX3tKyVdaE47H23+CA+V3wbFSV0X58ce/atsM6RWRxHk
	LHuV8IkxuXdQNj8eBXlJjVhM4QGb7h4u+g1X2oPASQm0o7TQalJtrlUszZadtweiDvN0RLBM73X
	LowgWSIJqahV+hO31NeFPN40PQhTH/77UOe6m3TAs+w9+X6cBQ2nlrr0jNxfaASLZg65e
X-Gm-Gg: AY/fxX5P22tmgBmJOzuWxBWwIAltCPmKZO+zkEGf1emrY+Slj3bvII7upMZoAWSAfxq
	oC6L9mKYV3nbmQXMkyfsHTRsbjFYOSKDWX4/SRhysKD7SSIj4qtLkz+E7fAVMXvPfBx0gCw9TaY
	orxh3ZhFNJOGSVI3rbBKwBde9wwM2hjOTjsbpJLbxxz6pMOlZZoPeRgnyBTpYfk7/pjr3DRVKBr
	MsHEWh6aNaIg2fH3qUSuj8EPa+gEVZuE9L2GDmjDL+hBt02/S644O02746L4ALi+GelUuVxr/3r
	ZRkU2g1slwSIiV5AvqqmjLDRc8sp8WYw8TDzqMf94FNWra8AiVQgqvJLMi8MKnJ4aHrDSyS8aXa
	bEoD1WpOg+E3jaihW3gqoPHut9AP5NalCsk1Tm8bhyQ==
X-Received: by 2002:a05:6a20:939f:b0:35e:4017:3f32 with SMTP id adf61e73a8af0-369afa0f149mr12539047637.38.1765889528334;
        Tue, 16 Dec 2025 04:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjzD7R4uaZ9Cp8BC5PKe+O45asaEaN2RWQgZGhm1UDQOaN2oNuTVDcVsFmdwaYr/60winWHA==
X-Received: by 2002:a05:6a20:939f:b0:35e:4017:3f32 with SMTP id adf61e73a8af0-369afa0f149mr12539021637.38.1765889527748;
        Tue, 16 Dec 2025 04:52:07 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f5ab7d87e8sm13634362b3a.25.2025.12.16.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:52:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 18:21:44 +0530
Subject: [PATCH v2 2/5] PCI/pwrctrl: Add 'struct
 pci_pwrctrl::power_{on/off}' callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-pci-pwrctrl-rework-v2-2-745a563b9be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6339;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=hImE7GQrCuzWz+LCETc8MWiZwVHo4qo/PyPQSktScRQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpQVXoI2KPJRcOdMTIipPr6Ud1/OJHbwdy8AEwn
 Nrm5E+vwmmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaUFV6AAKCRBVnxHm/pHO
 9XVsB/9YvZIzl+Mywl3tkwyVsxgkXlZ9ldkwCpfjg+sz0vqfzO5ed+Cs6GDQIu//5Hw3WQcPsZD
 J/8Ef4P8D7KSwduDxa7aVa+8z+iLWcTsbqZjFbz+2nbSCZUqCbkybLtWt72nk9bBLFOJ54y4W2g
 rFINTSID4Dk9sFaDSyBwKHoP4ZIbsRlSaLItUCICHGGpwur1d/88YH2orCf4K9VIETbVa8TCcYv
 ZBMJti2YogCB9erkpZXJDi/Dco5bYpDoWpm7zTmuWmBHomp40SacXsAyyOJOB/DKAsaQRmtTxdS
 fiGqx7ZHW3nT+KpiHGi8Q8rgwUqY2ev0qaVTa3zujXF82nix
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfXzZVfql3kVr8a
 5XNU8JIwwLcBRRCgARmJi6IQpfWIfrbjfP6OWSMDBzB/KNUgrKmJRjKwr70kdPc8oYu99t8hNbk
 L4/sQbRuea6dCegRCDUCaw9t7DEfHsfUswHl1oRMejw7T+mkNVk6u75iHcx+nbbGitcqcDDFaX+
 oN5OY4Iy/qYpLxmAkQu9lX5k3azfl9dWmx4lSa4vFVuyLmcry0E6RV2ZqJbQzj2SvN8UfJGTGLX
 WxkHxAwL4Y1a1POn7kA+z0DVXD7uydg74GICxu5kYvO5GI41jiqyzHzhdelYbZ+Pq0Zzat6IuQn
 gPl3BngaUyBuLojmplxiS4T6DnQnee0eFPgZOFZwkRHTO2vvvtQ1Mqyp53vdFcaEeQNgOvKkcr5
 eSKZrHJMEX7Qa/ry76x6md+nkHc4dw==
X-Proofpoint-GUID: CAb_itHvGJ_WxlPws58bOu85MUrRJLtf
X-Authority-Analysis: v=2.4 cv=QeRrf8bv c=1 sm=1 tr=0 ts=694155f9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=wnJ2AIBC+6MZbTdryK78rQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8
 a=awzhGNnQlOWheNBC8EkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: CAb_itHvGJ_WxlPws58bOu85MUrRJLtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109

To allow the pwrctrl core to control the power on/off sequences of the
pwrctrl drivers, add the 'struct pci_pwrctrl::power_{on/off}' callbacks and
populate them in the respective pwrctrl drivers.

The pwrctrl drivers still power on the resources on their own now. So there
is no functional change.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c | 27 +++++++++++++++---
 drivers/pci/pwrctrl/slot.c               | 48 ++++++++++++++++++++++----------
 include/linux/pci-pwrctrl.h              |  4 +++
 3 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
index 4e664e7b8dd2..0fb9038a1d18 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
@@ -52,11 +52,27 @@ static const struct pci_pwrctrl_pwrseq_pdata pci_pwrctrl_pwrseq_qcom_wcn_pdata =
 	.validate_device = pci_pwrctrl_pwrseq_qcm_wcn_validate_device,
 };
 
+static int pci_pwrctrl_pwrseq_power_on(struct pci_pwrctrl *ctx)
+{
+	struct pci_pwrctrl_pwrseq_data *data = container_of(ctx, struct pci_pwrctrl_pwrseq_data,
+							    ctx);
+
+	return pwrseq_power_on(data->pwrseq);
+}
+
+static void pci_pwrctrl_pwrseq_power_off(struct pci_pwrctrl *ctx)
+{
+	struct pci_pwrctrl_pwrseq_data *data = container_of(ctx, struct pci_pwrctrl_pwrseq_data,
+							    ctx);
+
+	pwrseq_power_off(data->pwrseq);
+}
+
 static void devm_pci_pwrctrl_pwrseq_power_off(void *data)
 {
-	struct pwrseq_desc *pwrseq = data;
+	struct pci_pwrctrl_pwrseq_data *pwrseq_data = data;
 
-	pwrseq_power_off(pwrseq);
+	pci_pwrctrl_pwrseq_power_off(&pwrseq_data->ctx);
 }
 
 static int pci_pwrctrl_pwrseq_probe(struct platform_device *pdev)
@@ -85,16 +101,19 @@ static int pci_pwrctrl_pwrseq_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(data->pwrseq),
 				     "Failed to get the power sequencer\n");
 
-	ret = pwrseq_power_on(data->pwrseq);
+	ret = pci_pwrctrl_pwrseq_power_on(&data->ctx);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to power-on the device\n");
 
 	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_pwrseq_power_off,
-				       data->pwrseq);
+				       data);
 	if (ret)
 		return ret;
 
+	data->ctx.power_on = pci_pwrctrl_pwrseq_power_on;
+	data->ctx.power_off = pci_pwrctrl_pwrseq_power_off;
+
 	pci_pwrctrl_init(&data->ctx, dev);
 
 	ret = devm_pci_pwrctrl_device_set_ready(dev, &data->ctx);
diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 3320494b62d8..14701f65f1f2 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -17,13 +17,36 @@ struct pci_pwrctrl_slot_data {
 	struct pci_pwrctrl ctx;
 	struct regulator_bulk_data *supplies;
 	int num_supplies;
+	struct clk *clk;
 };
 
-static void devm_pci_pwrctrl_slot_power_off(void *data)
+static int pci_pwrctrl_slot_power_on(struct pci_pwrctrl *ctx)
 {
-	struct pci_pwrctrl_slot_data *slot = data;
+	struct pci_pwrctrl_slot_data *slot = container_of(ctx, struct pci_pwrctrl_slot_data, ctx);
+	int ret;
+
+	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
+	if (ret < 0) {
+		dev_err(slot->ctx.dev, "Failed to enable slot regulators\n");
+		return ret;
+	}
+
+	return clk_prepare_enable(slot->clk);
+}
+
+static void pci_pwrctrl_slot_power_off(struct pci_pwrctrl *ctx)
+{
+	struct pci_pwrctrl_slot_data *slot = container_of(ctx, struct pci_pwrctrl_slot_data, ctx);
 
 	regulator_bulk_disable(slot->num_supplies, slot->supplies);
+	clk_disable_unprepare(slot->clk);
+}
+
+static void devm_pci_pwrctrl_slot_release(void *data)
+{
+	struct pci_pwrctrl_slot_data *slot = data;
+
+	pci_pwrctrl_slot_power_off(&slot->ctx);
 	regulator_bulk_free(slot->num_supplies, slot->supplies);
 }
 
@@ -31,7 +54,6 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 {
 	struct pci_pwrctrl_slot_data *slot;
 	struct device *dev = &pdev->dev;
-	struct clk *clk;
 	int ret;
 
 	slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
@@ -46,23 +68,21 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 	}
 
 	slot->num_supplies = ret;
-	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
-		regulator_bulk_free(slot->num_supplies, slot->supplies);
-		return ret;
-	}
 
-	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_release,
 				       slot);
 	if (ret)
 		return ret;
 
-	clk = devm_clk_get_optional_enabled(dev, NULL);
-	if (IS_ERR(clk)) {
-		return dev_err_probe(dev, PTR_ERR(clk),
+	slot->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(slot->clk))
+		return dev_err_probe(dev, PTR_ERR(slot->clk),
 				     "Failed to enable slot clock\n");
-	}
+
+	pci_pwrctrl_slot_power_on(&slot->ctx);
+
+	slot->ctx.power_on = pci_pwrctrl_slot_power_on;
+	slot->ctx.power_off = pci_pwrctrl_slot_power_off;
 
 	pci_pwrctrl_init(&slot->ctx, dev);
 
diff --git a/include/linux/pci-pwrctrl.h b/include/linux/pci-pwrctrl.h
index 4aefc7901cd1..bd0ee9998125 100644
--- a/include/linux/pci-pwrctrl.h
+++ b/include/linux/pci-pwrctrl.h
@@ -31,6 +31,8 @@ struct device_link;
 /**
  * struct pci_pwrctrl - PCI device power control context.
  * @dev: Address of the power controlling device.
+ * @power_on: Callback to power on the power controlling device.
+ * @power_off: Callback to power off the power controlling device.
  *
  * An object of this type must be allocated by the PCI power control device and
  * passed to the pwrctrl subsystem to trigger a bus rescan and setup a device
@@ -38,6 +40,8 @@ struct device_link;
  */
 struct pci_pwrctrl {
 	struct device *dev;
+	int (*power_on)(struct pci_pwrctrl *pwrctrl);
+	void (*power_off)(struct pci_pwrctrl *pwrctrl);
 
 	/* private: internal use only */
 	struct notifier_block nb;

-- 
2.48.1


