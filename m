Return-Path: <linux-arm-msm+bounces-79864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE8C24B87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAD5D348464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31426346FB3;
	Fri, 31 Oct 2025 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3Fkzy15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTGGtahD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55453346FA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909149; cv=none; b=rcJLx28H6/ll+TQwBG8qHhf4phud85hcynMK/fK5EeUbYhsKAozM7FT40EhC5Om/PMysdo4v1HJyOqkCr3hGPTwk597Qw1kE1KQ0gOuAltFyD63M/0TdKfVurrD28JPkIwSnzVHWcqfq+e6k+LAKxhnfTjJXzNSONhDVU5UIfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909149; c=relaxed/simple;
	bh=Cpg3+E+77cgaN8CmBzJQTZxMkFdRoEwVVkKgFdeA8+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8Quie52qQQNXJRVfLNaEsUpoJ5s6KQe9UGqz3+nrmGXxcCaoDe0FZLO2HNjN5ZP9pgSgEFJP93xmzZdPpeVk3dZFaC0UqAY9F3Y//iIoYhSbm+ehraKwqh3rmqONy3XlF3I1bAWhZUAV+iMnUDo+jI4j+cbdjzQuraGh77Zs2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3Fkzy15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTGGtahD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VA3pdU2558875
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlcIk8VGLe34WMvbqxhiaOvLED3wY6vnyW7vFGcSUZs=; b=l3Fkzy15ESuU4uR7
	Cgfs8CSukRFuCmycic/BfGA1Srr9AIIvLYW+vabob1MrZTOSdEkhS0ZsaYbltDJP
	8p5+TUo79WNasulbvmoBYhETNE0KINz/q85DqRGvCKQt3QpF2OYvKT/iZ+72SFPC
	7kbzALVNonYZRmXmPSKZSkrfDKvAsTnx/5m/p9OhkkmA26JGEW2ZGGEV2y5an0oh
	YxF++wS7AzXjwUJrPN0LTfkD0dRI1LytLInF0FCDUUSVMKGl1mllkS6O+tn+srvm
	lZKj5EgYB5wBzHpXMxBG74GBndeMSQXBTrVm1OZR68SZWJuvo8AtM7V/HibBkyui
	c2ourw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4u1gr5up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b522037281bso1446049a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909145; x=1762513945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlcIk8VGLe34WMvbqxhiaOvLED3wY6vnyW7vFGcSUZs=;
        b=BTGGtahDVgJ+MZ38Ygy+YMRCIDGSylZVblonq/9c5vJuv7TAI2UkAVB2zOU69rwqMz
         NaCJN4ol/yOQr2B7ruZhZ/ofHYUEsgDFJf6g8J5LswZhf3KToKOMZg91YBpYYbOYoCwJ
         YVTP7vk3xU3lIzhodn2xz6r4eGg9zvNIHk11ZMoMh0EXqQ4LkUq6LV6mzWPQgLx8RKg2
         HGGnkj37/sc54EPy68T0CY9VDW2nTdSDfU7K4M1xj5ORqVCT6khEQNyS/1V6GSaSXgv9
         n+l8yPD/7Rquwti/WfbDeXFqBaoy4h+5pm7gVKZbvwXEWnU/VeX7OyPFsfqksVxlJmTG
         gv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909145; x=1762513945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlcIk8VGLe34WMvbqxhiaOvLED3wY6vnyW7vFGcSUZs=;
        b=oeKhsu3mZYFFxD0wZ03sPa8TOWho5RxuOWhCSWbNYYRhhBX4YTLgLL/q52zMf4P/nJ
         3I+Hcl8vx1rwsvldH2Kc2l7uzbhKSn9q82twNEjIvIBE0O6CaG2BD4oYUh8xMswXqQRT
         Cyfo9K2RJcUI82cQarZpMCDKzwz8JzVaq2MOpM7EDLSePrK6pgaqskdrTU6oa0sR9ACC
         LbRSPcStV/r2OrdBFyaMRXS6dX5UWvLFeYnWkMf+dIUOx5N6NLAMtRMQFmlBWUGYCaWa
         6zWoDYbeSqjufAE9ZSHau5wC+fs2kVtbWxBFUH158S8saGeBx/QfsuC1zyOzUA+xXmLW
         AXww==
X-Forwarded-Encrypted: i=1; AJvYcCVnr2qhJhb8GHIIu9/XQYjx6Qfb7hppfkEYG1njiiYGzub2E7rb3/yK4IgiKBJPrUOJ6CXRpyE5DJol55uw@vger.kernel.org
X-Gm-Message-State: AOJu0YyIeqR5ajGqY491Txc9XwEH+AQxDLn2hPE76VrdzjVtbeCILxR+
	03lwcsKqbcpGJx4DNwnTV2cC3s9WskPVsMwOcQvnVuT+4YAToXA4fwReYDRyZUQQPNceoQVksuJ
	eW4nqsAqbwIjpn6KvDTc/QWgQa9leGY07+Jy/NjtgO/RIlZ6YfsOV0OsngCHMQukx/pZM
X-Gm-Gg: ASbGncvN9xtWUIEi4Ia8SfmCwcnrL9XritfLfXoNB3xbYkhjw99Vmz2TZXz63mWjDEd
	HRWPXz62wpIPMrU6jtTylSF1yeRmWjXwVJF3g1SHN5OKr9xMjj/QCm/SPXuff4oWrNjhIrouR62
	KJZUUuHXCpcVIv4M2DFKarLOOgtUeCWsIO/v2v4Vp/tJBqFkiGcfe/mJ51KrhWF8XpS+dq/gMV7
	FbYPI6EUOXgHp/8P6HPxlrCMWxjXwWLL09Icxe/3IbvD9tWUaCbseEyrP4OntMr2bqkuY4gWeSK
	mVXkdWteD1Wy1dMe7hJkzVk6Ul+DwD9ObbpmS8TB6G86t80va4OJaWaoG5Buw6BpFq27eez6Qen
	P8LeijyiGKqs2KY+CGqzBRzCkIHrD8rTLZA==
X-Received: by 2002:a17:90a:dfc8:b0:33b:bf8d:616f with SMTP id 98e67ed59e1d1-34083055a66mr4429860a91.20.1761909145265;
        Fri, 31 Oct 2025 04:12:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2ST7ootNOsSdE4YhU21tYljL3YrKuXc3saWzAqhR06PAK+Ghh+MoVC+hiJ9vhboqoewtliw==
X-Received: by 2002:a17:90a:dfc8:b0:33b:bf8d:616f with SMTP id 98e67ed59e1d1-34083055a66mr4429812a91.20.1761909144819;
        Fri, 31 Oct 2025 04:12:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7793fsm1887363b3a.25.2025.10.31.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:12:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 16:42:01 +0530
Subject: [PATCH v8 4/7] PCI: dwc: Implement .assert_perst() hook
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-tc9563-v8-4-3eba55300061@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761909120; l=1221;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Cpg3+E+77cgaN8CmBzJQTZxMkFdRoEwVVkKgFdeA8+8=;
 b=A2apmLQWjrpCddCAoBMYspOGbY1QIo0TDIIU1w1angVGKY6uhitwrodwrhHFadFXP76rvNBG9
 lF0Z9T/66d/CNKEsVM2Flb0Jry7Ll4C5n6750sqoZXiAgJw3h21j3OJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=6904999a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dSOQ3hK3KXaY1HoqDbQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: J-QOfgHiV7OkaxzcZdRlzxmEo5WcRqL-
X-Proofpoint-GUID: J-QOfgHiV7OkaxzcZdRlzxmEo5WcRqL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMSBTYWx0ZWRfX+NKUsqA4pvW1
 9II6Izo9hS5LZw2ICCcH9kCHNDy5LOrqBbeFXEex00KhtG4Cy5qmWgbgMYE22+MLdCS24PFCkut
 1qv5/QlplrTv/PK0EeQ5uYfgLyJJhVmmGLT4CRRHtgCn2C67Ulrl+EuKkl9Uii4Qi8KQbP4r/kl
 RGqVs/PbJK5EcQ1kO756dXpufsO72OIqbduPvcUjM9pIQ2wFNg/bRtS+eNGnj9rxOIiZMoAcVbl
 ktT8M9e7+ck7l2kdYoyqnsQb/XgMHKlnQFbWVzIdd80y8V1LdNb8zQUhSzHBvBXWhHEWkv+iS8/
 XeuB04SuCmC8CoJW2UvxY+2ledwksHTn2wZC92wz0rL6hgwcSERQL2QyZB408560Z9pcS8fCZOj
 rX/9QFs73ap9y49X8tzeIWiD3rVtSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310101

Implement assert_perst() function op for dwc drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c4812e2fd96047a49944574df1e6f..b56dd1d51fa4f03931942dc9da649bef8859f192 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -842,10 +842,19 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_op_assert_perst(struct pci_bus *bus, bool assert)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_assert_perst(pci, assert);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.assert_perst = dw_pcie_op_assert_perst,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)

-- 
2.34.1


