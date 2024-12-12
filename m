Return-Path: <linux-arm-msm+bounces-41703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5319EE43A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 11:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704B3283E2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 10:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33701211A30;
	Thu, 12 Dec 2024 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYcEND1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD61C211A1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999598; cv=none; b=DyJgcQsdCwxtLNGcghcE+bVq8y7+AUxyfTbdPGHfr345QGiWSkj3B0PqlZ11tgXdqfTWAnaYU4KGDGbEwW1k/JZbkp/IM/U/RmuQLh0gkkvqKlxfZ4JYN+xnconch6TLCFv++VZYZ+B4ZT/hXhT7WQqFbzOY6598XmXLpbKtJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999598; c=relaxed/simple;
	bh=qILE2MwnvWLTTp/FHW54YyhNKkXwUyxZSZEtY+vSDf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wd+zeBOrcmXK5/qxJEFx+Vs37Sz/YpGLRIPZ1hFLIh37KDL5gKpOlCKLMtHOuKbQeooez0HGpPSngMk5+xUDP+7cJWBb3hpMzyQHQbAoVj62tuY3vd+UFDdccwMk0ClpOXHpnQo6JYpkvPmIrBSakzcaAXQgFhk0ZvKwPtaRK70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYcEND1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7x10g015012
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DzLT8XtApn5HmF8cK1fM4LQEaxlwdnk14GwV5KnT9A=; b=gYcEND1qb8s6Qbeg
	idIfo7Y2QesDdo17Cnfe9RlN/nYlRGamCcHMM2J4g2sf7iCl69lxWgs8bpkgjY/K
	lPLCakima6ZIO8HVra05Xg3ZW8il68rvgUcSOw4oOS+HC9WA2aPScdYJzgr/h49u
	d42LTVomy5fjbjbQmqlh3MvfAPbwrbXAM5nRn1bm4pXho2zJHL6Q9OGRT0Q68kY3
	t1PbBKxNogEBmfTaxXNuz8Xqjh4ZyMkF+TcUxaAxSdsJPKSZorYvgVFl5cFJUZpH
	p6y46FS31IBAN+XgecYodsNy2Ql7ZNOGGzCNhXKrFosGas4xoVVIUDQA+a7XJIsG
	rVMqbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpktmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:33:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216311faa51so5326205ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 02:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999594; x=1734604394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DzLT8XtApn5HmF8cK1fM4LQEaxlwdnk14GwV5KnT9A=;
        b=JGn9RdYRt+H/j1kIp+rrgTOR4hESnqH4DH06tK2D6NAZavtQZB88oLhLC0vo0wnmbA
         R6hbHo94uNrb3Lzboakn62MeEEVyBdZSKOkpzNDFl1grym6ARjLVOoeNKZprN2ZLA4MK
         mjmvczk7xjbUVoSCf/o2nrEH6qwLI0GkbDUI1YZy1CyYCIn3Gp039UJPrDsImKKBGYS3
         0xQkD9uSbgHKo+0okYxOz0GnOLzgKVVOpILfpjWsRocKCblbNX+ltAxNwRsGiwaQcTOn
         Vi5xmuUbgiwUSx5y8K2vPzSmeaYVJ3/sLDpyWRN0i5jTw2YN1jQzVPT3kOpeRAkWgZy+
         TJvA==
X-Gm-Message-State: AOJu0YxOUvOylL/XielG4avTCm1R2DOURQu3kGdQFH+yICdY2u0wzXP7
	uxG5BZ4GMIZ5scM3pv6JjXludZzdnDbTMqJsk9MC/wmuZn0lHjKYMIeVWLIMIaCyGXy+Hl62klE
	2+So6FVY3YabjqqdhfMxnjUbxCPxMZ3Nm8AocLA94HzPEknFQSp1EEgYkXzrYVi7hpo9/7xD/
X-Gm-Gg: ASbGncvlUxt+YjhRnjBfmDD71KvTH+/cGnNxhR40H42tNt8sysIB2bdYXIy2jMDpIfs
	oGSX5/YeaqIQpmCauV+O4AP0AwVFRiLMDv8K0H49D1tFGJ4xQVQQ9gRKzrkojyrnnhDHtEkjHxn
	gi05DLbg86jX9s1MqG4Fw12H9fYpoTFBkk29mpe28QBJ+91v27HAnZA9jJZOtN6gE8oZAEUQZrW
	9m+jShY0BBKAKR8XLgk7hFtYpQ6tK5XaILtKhnr/4od51kkVwKHIIxtRDjxkRs77sZ2K55LfjPQ
	zLiH3Nu6NwW/8TWq
X-Received: by 2002:a17:902:ce8d:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-2178c830379mr36932245ad.7.1733999592699;
        Thu, 12 Dec 2024 02:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPuZmJVKvHCw+BNqGloDAUOaLcCy8jfzRck/CYjpB4SB+sb34PdsMiJMPNS5MD+Am5CTu0dw==
X-Received: by 2002:a17:902:ce8d:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-2178c830379mr36931845ad.7.1733999592320;
        Thu, 12 Dec 2024 02:33:12 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2178db5b42asm11102335ad.244.2024.12.12.02.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:33:11 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:02:18 +0530
Subject: [PATCH v2 4/4] PCI: dwc: Add support for new pci function op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-preset_v2-v2-4-210430fbcd8a@oss.qualcomm.com>
References: <20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com>
In-Reply-To: <20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733999565; l=1378;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QUbB/2D6eOehtGMpEcAKcKS9W+U5FvUncY+bTnczvqs=;
 b=dwQ9PTO2Bv5z/S/aCvfgxVoeCrgNK6mnv0Jy5dawXlny01Mm/B7PVNX3KXk2+UTwPUUkFBXwS
 9NUkkj79tS8Bl9pr9Pe8Qw45Ly8gvMVvTGFPIW60WcJ0AQPicvOMchv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Gp0btF6s9gSK1KaB5Y3HdZ4sF3MDRNY4
X-Proofpoint-ORIG-GUID: Gp0btF6s9gSK1KaB5Y3HdZ4sF3MDRNY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 mlxlogscore=910 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120073

From: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Add the support for stop_link() & start_link() function op.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 2cd0acbf9e18..5f017b7ab932 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -694,10 +694,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_host_start_link(struct pci_bus *bus)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_start_link(pci);
+}
+
+static void dw_pcie_host_stop_link(struct pci_bus *bus)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	dw_pcie_stop_link(pci);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.start_link = dw_pcie_host_start_link,
+	.stop_link = dw_pcie_host_stop_link,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)

-- 
2.34.1


