Return-Path: <linux-arm-msm+bounces-88192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5CD078AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B47E3060A71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD6D2EC558;
	Fri,  9 Jan 2026 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHmMav5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z10n94BH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294E2EC571
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943296; cv=none; b=p7u6zgeUl9Vt0JusJnr4bhNQfZ5lKmTQVpaForRDEflk+CCT2X5TlTp63kbYkuFZakhuZ96tBrmL0kJassfl39ZGbpuLuZutJu4VowI5CxrGMD5L9JYFIIXmJmB59Kt/QU9i59pU+apDfBeH8BQT/xidMxgzrJeWNaoDVZ4EZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943296; c=relaxed/simple;
	bh=Q8+lBQYa1gwtIcmp/3kuabaN+M+86SlNF+xR/NMG0uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cs9CHRIh0N6Rx+TsyMCGNQZ31kC19365F9uwNI4gBjoYt0Gi4IaNaKxFH7aFrT8FTk8hkPnmw0ML6+KbCEKB1yqRv1T2WA0ety3cHOId2b2powon175QmTO1zAhqawHcc8etHJiGeLYVGPkoltIQikPSsS/5F8PYASMmB9OaWwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHmMav5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z10n94BH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MnKKj3625832
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guGTs/O1+KX/IddGJcB1UdQ/HB/cP55e3A+v7+B61bg=; b=jHmMav5RCAwEPaLR
	LBWihKxXHzXtkJml0VVjuou1ek7FVDiBvLhniT00D3tkuz3Ph9/7xLPiNO8ts8dL
	Q8snvDhPnkpZvdKJ8be8+Cx6G4GFn4fCAVxtmNS/fh9CArEZ0BLxB2oWHYzFpARr
	XvR+EBwTyH/2tAUKvtgTHknu4hL5DYSFj6NX1ow3Nsnep4ii1k1jNHUXPsFQgJ1M
	VNmdDsaOuBIc2LEtjCv+mnTvDtySvNW6weIfpvm8dhqZjvTaU1GKp4TlwXdvrhGs
	SDO5uBAIBZ5/MVbKAzLfb/bVj157jobWilfc6BiZSqLL79kjVLjf9KEwJxFYE/b8
	V5vsww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j1qj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:21:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba9c366057so7365281b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767943287; x=1768548087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guGTs/O1+KX/IddGJcB1UdQ/HB/cP55e3A+v7+B61bg=;
        b=Z10n94BHQkNOKgVoM3cGrO/aPeuNz1PrJombjW9f2rtt5QI9wfeIcfKuLccmhUfDxk
         0ExZ4KllmCRDJ3Brz0TOjfMhd7//fjLJmxbYC39SbkEWLuaf45zkRm0k6SHnZgNDYpY/
         /I0jXB9WXIFSuCKMH+sJBoyX9+/ugZYWXK4b9nPLT+aqHC4MTRi+BA26pT+R7ccYSISG
         cZK95HFNcWiYL0mohOZbfhchkVc5k/6Z3HG8Y7KYJetsue7Glb5e44otRQp3WrMVQKQx
         V1OfHEb55pa1oliPNclSONnAosljgrz6JlFmfYmQQfbksY0OE64NCa3aWgtlsTifFIWL
         Kf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943287; x=1768548087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=guGTs/O1+KX/IddGJcB1UdQ/HB/cP55e3A+v7+B61bg=;
        b=EwIjdCptqb7YX9fkVKujboSTtqHO1lq/8VEyaTTBbvA9G5H0AgmiZuZC3s2kgY/sM/
         x0a4+09Y+RkQCGjGUqW6Y0NJP3QphdwvLHZ2L0HYHARD7S51i9iXwLpiYgnU177iWdHV
         3Vgy8xeUePwA4jm1m0Y7QKPCA2qdXeMXq/lOvbqPw4QROvksW3Y4TdcxHYUV+HzQdch8
         DApJx8t4ABKrZKO+cd8FIJTcy5OdFPOLKeT7S4rulbn3SzsRp+Om8VbJgd09H2H57Ahe
         HdOrpf5rHks6RxgrCisZ9auvfxMrxgcdxvBmp+a3VjA+mXt4xJ2kmGw4PeU638tbGnpB
         6gyw==
X-Gm-Message-State: AOJu0YwPqMBivoTcDst5aDtH3iv331o87/dTDMqi2K7Pu7p/uL20Tf6p
	DysRKh0ejbb5GENycMe0MZSQB06bsoPcb74Uk5ZBZWQfXis3FfhxXH1ncZ3mC96odjF0tIy6BwP
	WQPIwi+mGBo401HsEgrhc37CUDi2npADjQNRQxXQBHVdP3vK2HTembXJuD2ow2PLdSb9K
X-Gm-Gg: AY/fxX6ZiBtbcH/RNS4iHRl+JgACdECnJymv1O/PrW8CLzkZRmhs+SzGs+zMe04oEgi
	fr4AyrqYNNPHYm90SywOuK3Km6grn2Se9eeB3kh2VaT9KeRa8b7GEiyZZizUyqFfhwFCfrtebGR
	Ou24nSLcqQwKATnoRNWWYvyFbs2y2ZnyVeWIxwR46Adc5JJLUFZbVKLhLRyj6TAtYC2euqsmJ16
	KFKqzf+7mN22uMxIwTutJYkI8NWqXKSkwjcCwyBYVdB9PDchkVQ9+JEgZGIkRR4FjxTQmrngH7Q
	kvaiwDlqJWudaTNWunrrJiYW1uHHedWOxNuPCQXZjt/RkgKtqlVlODUYKWWm4SjMCvbS4GwvgDw
	LoCEJN2qgP1oQ0/YxFLrjREnnOk+mkkPJ/ou7xJGmLJxW
X-Received: by 2002:a05:6a00:ad89:b0:81e:b93a:ab17 with SMTP id d2e1a72fcca58-81eb949ef05mr109785b3a.15.1767943287506;
        Thu, 08 Jan 2026 23:21:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHHO/gTWbofCIbVPKFC0FzAlp9Te+YLm5t90cM0UJujZ0kZxgVI4P5Y2KLOWpErfRjlJU2oQ==
X-Received: by 2002:a05:6a00:ad89:b0:81e:b93a:ab17 with SMTP id d2e1a72fcca58-81eb949ef05mr109775b3a.15.1767943287110;
        Thu, 08 Jan 2026 23:21:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c85bfsm9510369b3a.30.2026.01.08.23.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:21:26 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 12:51:08 +0530
Subject: [PATCH 3/5] PCI: qcom: Keep PERST# GPIO state as-is during probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-link_retain-v1-3-7e6782230f4b@oss.qualcomm.com>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
In-Reply-To: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767943270; l=1606;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Q8+lBQYa1gwtIcmp/3kuabaN+M+86SlNF+xR/NMG0uk=;
 b=7YI5V7nEUujpXnOmp3l/fb1YAPFx6zBRbuPbaO3yNRw0oukGrQ0a1Ora1XFfVbDewrYHatld6
 n+neRReQcqNAII0gT6zmA6BhgsYMZkhIeu6GLIB2gaqU+psBqT8DuE6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MCBTYWx0ZWRfXwjTxa6mb7N3W
 SR0DCV75vOPsTC8hyrth+tsyxWgu6Tb9qIQYN63LnXuSHgF92oA4wrg9yxA3xUSC5LQiqN6HEgf
 0gCaa0xO298DvfKT6whzbVNZS4t9jmWRsZy2CxaAixYrn1gAi+59FOCUKITmwRtcCLU9csBRP2S
 Mg5o5VMLT1ZYJrETKcdHEfE8dFGepCmT6FldsvVJt0xU9cvRSktrymGYL+XLpSfUNrKE6G0fOj5
 xlXerztzvJaflh8d3uumV+BTseyHJ9cejyDfSwAdPDvCidioUQV+BZH7WKF9mKwst6yoeN/dn6z
 t3zCPUXbTVz8b1H8Cu4uI0kXA5O2px1o+93PmgV8dZy+zouMP8/dznIh5VtnycnhUJFNjr2n/6Z
 p/OhivVuJco0nOI4rsooVHcHhYPxqFtlIOq60EhZMlTWbYSlY84MvNp/lEJZjWBBlVG++CJmOve
 rckVJ4gQJ0W8FRLP2sg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960ac78 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: UW9KN-DTge7Gf4bJjFQS9wQzux_KgN8d
X-Proofpoint-ORIG-GUID: UW9KN-DTge7Gf4bJjFQS9wQzux_KgN8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090050

The PERST# signal is used to reset PCIe devices. Currently, the driver
requests the GPIO with GPIOD_OUT_HIGH, which forces the line high
during probe. This can unintentionally assert reset early, breaking
link retention or causing unexpected device behavior.

Change the request to use GPIOD_ASIS so the driver preserves the
existing state configured by the bootloader or firmware. This allows
platforms that manage PERST# externally to maintain proper reset
sequencing.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7b92e7a1c0d9364a9cefe1450818f9cbfc7fd3ac..9342f9c75f1c3017b55614069a7aa821a6fb8da7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1711,7 +1711,7 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
 	int ret;
 
 	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
-				      "reset", GPIOD_OUT_HIGH, "PERST#");
+				      "reset", GPIOD_ASIS, "PERST#");
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 
@@ -1772,7 +1772,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
+	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_ASIS);
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 

-- 
2.34.1


