Return-Path: <linux-arm-msm+bounces-60572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F258AD1BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74053A330C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 10:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEE5256C71;
	Mon,  9 Jun 2025 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzEaZCQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6932566F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466307; cv=none; b=uEJ+345ZEOmiLyjkLSbpNAE7vGttJAFB6uPdaUF8s3ZFC/1eAsQo3ldPgtCgFCQ+KeMDpAUVTrL0gyWg6lTxG6tv5x7lrInNNSJs2+2MXv9XgILvaleYBnLuTbOE/Cg3j8zXrTe8Hi2iAksBXxrk0n2ar4Zuviitm2kd2FlCW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466307; c=relaxed/simple;
	bh=s3BgbObr46Znv5BUzFNNNM+2F0k3oFKX2PcPm3YAn5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqpLxyw8s2dRISWbcCeJ3zA8kIht7Psxs+kE7ZtSHA6DU24G6gtOzZHysIBnri1BbeWnTqao//KIYXF1Q1WHJck6xeHG8pH3SI0uDmjp6mhRraLiuIwGx2Mdmw/Td7gsXlqXtEDAlIMIPy/DMkHGP3Ww/Zp+79EUMfpt4CG0dtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzEaZCQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559352RG020102
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 10:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=; b=OzEaZCQRh5beUg2l
	57uAEDGAK6nHLFQlooM13k0An8SFSSSGT7k8kkNIzAwc0Nv525iQDnxT38oGuY54
	BBw3J59ZmaivQR+F4t0OiTyDSWhAbVtkCZIRU0ssAN0eNYG4JBI/owGjBUhwhSe4
	cZlln4K+91q9uGj+B3GC01j/QzwV316vrqzUrV2O7FodsfvToHgYUQeBzkUTWsrU
	x3iN9YDBmVyS+Xceb3rZf4Z8VgT1JMYasVfEb0SfSS8o6i0p3yzml4U0/AFNZj44
	CnFYC7HokpxN8k5FdlxfXixckwQXNhb0OCm4biOJd9u6XN2qEJUMs6eHan6t+Qxz
	vTnFAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qcts5yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 10:51:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235089528a0so42467135ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 03:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466303; x=1750071103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7A6tRGMDv2qa8hQq+J0NjE48UHIfnawBC6GPkL/QNI=;
        b=UOCVHnbZCxRXPNGKD2AUlmmZ10kEq+VJZKgBKukjFfC89fvzq9/dQiI8bagxR/GctG
         fmcjLwbH7PPFxnHStz94WrJLchoZlyaPAgmKrRx7/QtkP53rIASBFa/M7j3TZJ2UuvM2
         4DPz0DAxs0437epa5ZVVlIYdSSLSPPsN/q5DpzUFDtu6+3CaUQBO/6ypD4TWWJtWTpww
         gVXFZSrGXPE5CafbR4xW/t/J2Q1mB724xhSiq2up1qFeRYN6Ax6uAnicC4lfXxGst9Sh
         20nIjqHzVbcBuRV6IH4Uz+dESwcZTLmKr871yHCqkR4zeQVxM1NyGYKbFM63BMGBKV2e
         WtEA==
X-Forwarded-Encrypted: i=1; AJvYcCWOBFtD/KT2gkNdP0+gSkjZ6Y6OWYZw2MPGmo4KMz3/4zyVHuAf/UvsK/XgjGI6IqCxJqBChDOogip/unPj@vger.kernel.org
X-Gm-Message-State: AOJu0YybCp+EZw4YSaWgsf5KLV2dnkROjZf9NUCVcmMWzltP5oiXATFS
	Ang44G3DiHVJqoTkr/pdkKNjUCFNT4SKEMHM7OJUMX9l2gOJTYqAlXobE/eSpwyl09dtPfshgQ+
	u5+3/5NEmXhyMvcFhawwCZinE6KmpczDDlkVvgW9i4QMy9tZUc4+gjQdumy/kYG4nnTJtIIyqMy
	84
X-Gm-Gg: ASbGnctev41mxyzqVIq+29IsKlMgly8IWAHLwSdV41xam8PjJpHTE8Gr4kOkk/CV8il
	hTra5MuB8fHtgy7SU4ohUhO851XOZZddXoWwLTsgqKeg/aubkuNDo/zPIUJ+d9nfW69G/2U3IIB
	V7YqiWBLRy2fx9GuN6ciLz24nFcKfeya8DbdzidV1qmp/BJY4bAJGR8ix+GAxKdEiVJ7tQeNy11
	8d37oW2BDbBn7ZGZH9bx0FWL8Q9zGdtHH6iT5SSs5fYRW9R4yfHfFvaCy9193h9sVac/Mm5dmDR
	hepE30Pf68yTdsJdH9PXOb4E49zXPmDmAi85o1yjntcLl58bfj7t3ZHYlA==
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id d9443c01a7336-236020d715dmr193522595ad.16.1749466303521;
        Mon, 09 Jun 2025 03:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLzOtRKOSJqf7NTxp/jA1tIZZWcn7SzcOC28q5ajezBWgKmY9lqYSDR8i0Dk7f/REuQx1ZA==
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id d9443c01a7336-236020d715dmr193522275ad.16.1749466303160;
        Mon, 09 Jun 2025 03:51:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:22 +0530
Subject: [PATCH v4 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-1-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1335;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s3BgbObr46Znv5BUzFNNNM+2F0k3oFKX2PcPm3YAn5I=;
 b=ZfB1rQO8asuRz4N6P4tN0plpJ2JrMF1tt5D4/AjjMGr84OpeBvswukdYc5xJoV20WCuxq+p/5
 w/L+uUEC7JdCs9uZ6zUtriA3WQtBD1w122UYq7IZ4ufsrkQ8qgVr/cL
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: n3OpK39ZDCWF6tWkPF1_-z_LpWECx8Gj
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846bcc0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3phiJa3m8EW-4BHYHVwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX03Ey/JC0K6lG
 u5inZ5Vqq5SPdqiViO/yqmYjavB4Igf6y9T5/VKEEl3kVDzPXJBq4XJb0XtzA0zP02wj7EfINUk
 WT17ccNKtGoIf+m4vaJ/RuDFDNUbTx6jCX2KEbTR3DXEAflkgPRTQ5fiL3duLRtMeyPJtcsz/gO
 YrPnD0fxH5XRN84B2KjSy3k2ef0n2RdUCW5S4mg1gzGdpy6YKpPKxCbCLBnde4/gUTLJVR2r0At
 Uj1QtiK2iAA8XlZt7QP5iGiS1hgZMTM9Z1fCKp8IB8Fa6NJElGhDo6byOX0KzY9jPIdpMtmROBB
 PoGvUmb6wEB98fXREzveqOnB4ExdBQ9K6A3rpKordD2J7K7LxcnePMXZwmFMxGd2IXJpBQmFjRN
 pJDmT6b9jBMBIQA+S1ryY9LIePJvaIwh0cFSZld8jOynAC4aoM6HhAnNzURgUKpsKzqZNYMM
X-Proofpoint-ORIG-GUID: n3OpK39ZDCWF6tWkPF1_-z_LpWECx8Gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_pwrctrl_notify() will be called when new devices
are added and as part of it update the link bus speed.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 6bdbfed584d6d79ce28ba9e384a596b065ca69a4..4c1d3832c43503a7e434a3fe5e0bf15a148434dc 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -10,16 +10,21 @@
 #include <linux/pci-pwrctrl.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "../pci.h"
 
 static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
 	struct device *dev = data;
+	struct pci_bus *bus = to_pci_dev(dev)->bus;
 
 	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
 		return NOTIFY_DONE;
 
+	if (bus->self)
+		pcie_update_link_speed(bus);
+
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		/*

-- 
2.34.1


