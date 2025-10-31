Return-Path: <linux-arm-msm+bounces-79865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B41C24BB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73ED34F4248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A06D3446B0;
	Fri, 31 Oct 2025 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ST58v/25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvBqTS1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A5346FC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909152; cv=none; b=UpzBuNgYrgKHvblGh8fBSdCRywtewuOpafyIVmcNh8h9n+oTRjQ79gefXrbgAgEvWGumrDfI5maBOS+9hSPIMNvSYxXYMk35J0eu1V8iyuRqIVU78hoYyrzSw+db7LJBHO5YHExmSUK5QVh/H6CoXkSJG2v9MhC2ptywAvPOfDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909152; c=relaxed/simple;
	bh=/rHGDiZUdOdrl9DYepaOQeGv1VtjtTYXi/+ZkT8cb+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvHbHwfnLrttysbGtZWnoxeQNS3xpaogq22WCo81D11DiMeIlxnQQoBKPmZr3mebNeodVO7IBVa+irxSsThrC+OJ6rMEWuc2lckxKtjZgn6GXRe7gW914Kj5Cygyph/8BEKcLnbB6VlBYNnRfcHn65cTFJ5vkExZOYQicOS+BRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST58v/25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvBqTS1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9sOjd102638
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUun8ttkoQTOkHeDhGd/NSYDbZVcwe4JABD7MBbYCrY=; b=ST58v/25oX5eH+Mn
	tUypL1GZUOsYAKlZu0fVev3CwND6mMnDYOJ9tCeH0Y/Y5DB36PPgobmAPQ7ZRC00
	LqLQK9EWsowwhPmFP+4mUuCxCq1l05rWavuhbK2WVPW5edLM07iqibISllyVbg+P
	HM6hnjqjdx9qX4uktkBvgwH261Sxeiv3q/mOJOf6bRiLNoWTN6lPrhW+8Z7fpdvD
	I6MSRYTLbfio6X0ZtddinQYpZDrxwjgYFIgMLKddnNYQGlcVrCLt/tv8v7aJml68
	14ciKwC6W+Abwx+B8MqmCgUEg8KAOskIdah4aGF83iU0NisBKI282tuSn7IIFDCO
	9G7k4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdjxv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-792722e4ebeso2241917b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909150; x=1762513950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUun8ttkoQTOkHeDhGd/NSYDbZVcwe4JABD7MBbYCrY=;
        b=SvBqTS1JLYcuAkLr5/K9Jix9PDSHHmfKUKDwgxUs7OycpAzKZK63XdBcYY3XG74U6F
         UqEzpC+Xlz6wqMS6ksqD7vEAO/LvAnDeGIRAVfzK8U4TvWEmag/7yGIUGCKPqXlSDN3p
         Ju6Ay6wK+01f3Bi1oSqJqoGmtp4Y9WERz1PuQk+D8fYxLhg8rVSqu/HYwvo6GSuynadj
         q2u/0zpvyQUu5Nphbux5b2/ukHcc0i2ErddMszPBO0Ur227l4TZqjvEYMviWSANy4cNZ
         F+ax9o4HR5CJ6xGI/0jWga3DPNgxLFj6DQkkc/W3VzjOh6B+YofUIn00+MaDc4ZtaCbo
         rBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909150; x=1762513950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUun8ttkoQTOkHeDhGd/NSYDbZVcwe4JABD7MBbYCrY=;
        b=IorgmURAk2XpMIq1DCGycem0QnnmIU/5KQ9JT3XY84Q+4byTlJjuh+hP1o0FNZwd4k
         Q7T4zX74hdE5/luSTx85Fldk6PeU7m2kjpHo7xfjVkQ0R0knEqmXcY3ZMG1IWnGSkMQQ
         Fsrdqzhk+WGCH/lcteWm6oH+wwGfrlDsW1vcGwatwTs7nKyjUtPpZAl/V2KIt4SBP0rH
         JGQ9dbsL4tkIeFZdhgDD6syfXxVuu8sKnJ0f4GsaT+OuM6iVaZwuAO+OZPxVTmDWYN1b
         YtpnP9zVY05kAhscSaf50ZL5H8Plivh6mMVBaBB5FQbVa+lAFsAvrOZrm3ZZFudpIJCu
         EbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS3ACDeMiJGH5T4ynN0cm1ksxD/+H2XzV8p+DrIsswh/yTRMqCsBhlmcyRaIXOQRq5wFHVNBkLDVrjL4N9@vger.kernel.org
X-Gm-Message-State: AOJu0YxsN0NXOZeksfnogknrIybaLOhwFyxbZ26B9NF29TSSEj09wrvG
	JIL4ydjzr8GYRCp01p6x22Dk8KudOQ8TNsIiQxMlwFrshnjxjAT3NT30czMQQZ4xdd4hXeBBbgE
	fSJy0WGPdq1SRf8CK7xd0YWKkZV/wGul2IgJt+2b7UZj7rHBTQtJUnfsZi+iaotIaJZt8
X-Gm-Gg: ASbGnctO/MZtCyP3qcudQ4DSjw28YeLGaGiWlyT4DeNa2YfL6CeZV7hD+ksRlDSke7x
	VS3TJBxkYTBtyJ8X2HNbOOSEegUg7Fg+rSCWhulXgGXgl1jIkgvBf49DFw3go8XhZZFjDkA8LU1
	n5sIhi9vL7jRU8AKSymW6UnrsByY/RoHFN+xhZKOxiyDBZydHDrhFqL5lelymyd89KKnF7m0c1B
	/MGn1qER6NVzZPgd7nzxrQwAd7ZeckfntVYQjJlRMH4Y8TejnNtPHP8gA9mwvUWhjIDliwlgmiS
	W6+KKtn8YYY26uGouLSuALaVeAQy80JvLDyr9f54wg8ExG5bsdJVcbWzRvth0Rd3VLtTRnpw3D2
	gWnIZcMLNUmKO0xXxqgN8nWyblpedQ5zC7A==
X-Received: by 2002:a05:6a21:6da7:b0:344:97a7:8c62 with SMTP id adf61e73a8af0-348cb08f3c9mr4485379637.23.1761909150038;
        Fri, 31 Oct 2025 04:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTcz2eZ3B0V8wEazc5KEbLKkxIWKgiiOEp0tZ7ZxRptwHbThKDQlcx3aEinQTqWNiwdcZvrg==
X-Received: by 2002:a05:6a21:6da7:b0:344:97a7:8c62 with SMTP id adf61e73a8af0-348cb08f3c9mr4485327637.23.1761909149547;
        Fri, 31 Oct 2025 04:12:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7793fsm1887363b3a.25.2025.10.31.04.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:12:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 16:42:02 +0530
Subject: [PATCH v8 5/7] PCI: qcom: Add support for assert_perst()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-tc9563-v8-5-3eba55300061@oss.qualcomm.com>
References: <20251031-tc9563-v8-0-3eba55300061@oss.qualcomm.com>
In-Reply-To: <20251031-tc9563-v8-0-3eba55300061@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761909120; l=1479;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/rHGDiZUdOdrl9DYepaOQeGv1VtjtTYXi/+ZkT8cb+s=;
 b=IVF5DRupFn6r14/z9fGTp84BhyIy1Hl9FJ3EWg7OBJZnfOL0e8jWTHPMb+mBCov5dy8UuYoz/
 l2lTVLFzBEjBM+jJWXeLRG5+esykCOJwy6N82STTktTPOEz8boJ2HC6
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMSBTYWx0ZWRfX0OlXASwPFgaR
 CMjIs8ICte0OnSZgsl/X6x/hXBoHJRx2udtXstc3WJ7EfzpP1p5EvpOXFxAqU8f+vNgl/48ikB1
 yVyubUj4ek7KWLKqzfbr/IM7hOdo7BxrhDR9LJ4XoOf/uCodFTJnlsjWlq8dOuiyOYOfSsIV4n3
 uHMuKK9mpwKp6tdcfhqdIQubRbh/r/28vvcKD/D6eAdDO0ZPsxuU2Kf5mO7y6V/Egs36xgjrJFS
 m4nIPxStO/9IEJ9k/AA+wPZ+mMHrM2KG/LV0x1h5UFDSOaFWVOcx73SJZazaASdTj9WECZ64npx
 tYhTcSHbLz0ArLb7wDPT72YseozJkzFVEYir6vUH29VlTyU4DKKDuk2tuK19wOWx4jmZ0p72ue1
 OeqLCnFYmht3iMOxKj32uml9GR+b5w==
X-Proofpoint-GUID: C_bONxxhDXXoHZi7VSVwDjP8l87Xd4bs
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904999e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j2XxTBISUlk66HYKGUMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: C_bONxxhDXXoHZi7VSVwDjP8l87Xd4bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310101

Add support for assert_perst() for switches like TC9563, which require
configuration before the PCIe link is established. Such devices use
this function op to assert the PERST# before configuring the device
and once the configuration is done they de-assert the PERST#.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 805edbbfe7eba496bc99ca82051dee43d240f359..cdc605b44e19e17319c39933f22d0b7710c5e9ef 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -696,6 +696,18 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_assert_perst(struct dw_pcie *pci, bool assert)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	if (assert)
+		qcom_ep_reset_assert(pcie);
+	else
+		qcom_ep_reset_deassert(pcie);
+
+	return 0;
+}
+
 static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
 {
 	u32 val;
@@ -1516,6 +1528,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.assert_perst = qcom_pcie_assert_perst,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


