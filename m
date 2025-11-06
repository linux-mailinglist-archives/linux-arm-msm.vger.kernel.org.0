Return-Path: <linux-arm-msm+bounces-80521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAFC393EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 07:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79FA73B6D39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 06:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBBF2E03EC;
	Thu,  6 Nov 2025 06:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ON/A/ePw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW19Ratd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C22DFA3A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762409647; cv=none; b=HVUYIGYKHwKye49rqxNi5q81Az2DXldH6MMqd9xTscaWt1gyGpIRF5JjE9PNi5V4lRvVeG0ghfT4oydBvV6zRxOTP/eHiE6PPMPkDeXcqPuHBKN416mbyTwxOmFIIolF0pz/wMoXvCjVjIVnUhaAPTAlReEaWANSkXQZDXC9nEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762409647; c=relaxed/simple;
	bh=5Eowp/bww9m+te35duy+Gu3+ggKypneeWBbKzwgmR3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0ETWTMhTje26XUlDyLiAOh71+7cbI8EIzXmObWsj/YA4FHV/zGguBR4+g6ZwSNlLkUTShs7bhDhADACvXdtBr72FGkJmM9aPPaFGlB/WpgosCs93P7qzz2D6kMzR+rsRcZcZ+zsnoTICvugC8ePq/vJu2IRB+EhWmiWDJDIwRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ON/A/ePw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW19Ratd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5N5ko82148405
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 06:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6f0QmtnZfh1
	cR6Ofnzn6CmW/kfWGJZlpWWAuS2d12t8=; b=ON/A/ePwcX2KNW8OyWlf/ctISBF
	8YbVlajt0/DMtybn006v+IF7NLVZP3ErKkw+H7mq4l7LEMWvdik5fxvfup9FtI10
	XOX+KotT/C6PA38QFsK80YMSZgW12Ju8TSswvS85G+K/QnKz9OV7OocPfoYXXXio
	AJeXVP6SysN6D2yKJo8HKIVRxBWml6K5bDat/QCyRmgiU+yX5uLlxnDQ+9JfAPsw
	zOMvs3qXIyJo3YhU5yDuu209dsevq15S0sNpLjLE2tDzI35hMnJhe0c2OXdJQ/uc
	Q+aozpDUpMQzb6LruJAZcT6/nF5/HKlF4SvyV81U9smK8R5Xbd32tfVUwZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8fxvs0pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:14:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29523ed27e0so8612275ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 22:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762409644; x=1763014444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f0QmtnZfh1cR6Ofnzn6CmW/kfWGJZlpWWAuS2d12t8=;
        b=AW19RatdpEPIl2ezyoxWragYwSpoMicIjrzocXMInaZN3By0bhs7OTVCLNiWiYY3KW
         QEQk6bdHjIOiLaS4yQy5y91OHVQPwfkO/K/9K1mZfwTB0YndTi62qkas3rLSOLnVPIWi
         SlPh400VKr5pNg5OG7oOTMz2+E//cwX6cnYhD4yvWfUdCbUw5Kt9k6uH1QaAaDliDRs1
         1NxE1cun3B1VzT09ocfY8GW0Egr3sT/CRhZPXvvsOBS0/2e/lBwRwt2iyz1Z4Ff5XoiC
         65NqnNK0DnE0lp1RePrWTwadS4kUfF+U6mWSelfc/byLsQaowgKpbiKWxhJmYODsXs7b
         h1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762409644; x=1763014444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f0QmtnZfh1cR6Ofnzn6CmW/kfWGJZlpWWAuS2d12t8=;
        b=Iz4cqELZyB4yz0FKOrcC/nuMpAaJoJMreui+cVYR7oAzwFlTf89KPhB/8QtGlmId0B
         rwBOVOkfwIFYv18B6gBsickzX63kF0Tv5qXf+SDbqEdVvKnkNsqeAyiDZcW2Dhq2jar5
         Jo50KpentKb1KRbIYM3KJHf0vub9ZK821iG+3/jj20duYvxursdIKVsvZeWaSKsXyYAM
         nSXhjGwXHnlWboB8GqbTIHuB+SaVqf2VfBK5j8DGX9O3Iljc2jmbeWlQgZsV8aeVzso6
         RA24DkxqxhWktdLxg/7S3m/5fYwJsMoN7nmOKyuoJOyOHS2Ekm8jvAl6DOEtvSDGUUPO
         0kwg==
X-Forwarded-Encrypted: i=1; AJvYcCXJq9QQIZDJh5bk7UvphXIjN0qvjn6OWy4Jp+9IgKiwZANWMjPICTerl5QhvWDOljteytXCH+P3y0xl/e3u@vger.kernel.org
X-Gm-Message-State: AOJu0YwnQh1TbTsOFFs7VGWr4hWjXPDEk5GwytnWQPyH+FkwbseSzodT
	NxzY83C+y9x3K3H6f6tSGav1VMRsKjh6qCj/WHtdCaqjoD+atn+apfEFh49OQupvqjRn3sxKGzI
	lkD8+ptQqSMGKqsujWmx280S4TcZXJWa/wrrJtiMRlQmwzzT6DVc8JGekLLMpEOplNfLI
X-Gm-Gg: ASbGncvtVlCq0VPmu53FO4thXyYMtTxW2haYrTAnhMtTDg26Po5ccJphnnOrZq/Jhf0
	6kT7cTKcOWQvElbdk1tiNdAHafNTfJ6tH/bjTvz/bgeJyXSv12tbhVTEE624u42E4bzE+hIIMKS
	JrG1Xh0V/havCt87LwFc/H7FlavNkB3jfbX0cnARd8FWQ2D6U0iW97lPHkdNKFoLsY53X5tGrWm
	vwZum7rEJxL0izcEzMg0dfREDHfINCzKwrYKoPuDd8HMbpfq0XVLLD7oi+dq9kuDqmeEZ/cX7yj
	AL5mseLsY8lPHvGQooEYzTFRrweVyyHHz61FprpvezS4Hh+EegCrcf1ojUvmd0ky2GAjTbqIy4Z
	kQJ2n7fP5RV90SBAa
X-Received: by 2002:a17:902:ea0e:b0:27e:eabd:4b41 with SMTP id d9443c01a7336-2962ad11330mr76435695ad.7.1762409644082;
        Wed, 05 Nov 2025 22:14:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGau024seW1k+6gAt1RgfaQE2/cFqOhIHoNflQP4yhKsBt34XSgC8/NMQQqGMjUdn+s4cLbug==
X-Received: by 2002:a17:902:ea0e:b0:27e:eabd:4b41 with SMTP id d9443c01a7336-2962ad11330mr76435285ad.7.1762409643591;
        Wed, 05 Nov 2025 22:14:03 -0800 (PST)
Received: from work.. ([120.60.59.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c73382sm15036305ad.69.2025.11.05.22.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 22:14:03 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 3/3] PCI: dwc: Skip PME_Turn_Off and L2/L3 transition if no device is available
Date: Thu,  6 Nov 2025 11:43:26 +0530
Message-ID: <20251106061326.8241-4-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0OCBTYWx0ZWRfX33GCYchXHFDG
 1r2DIBLKtz4zoV+6j/Gc1ctnCg1KRnJaanKWX44D3Vye9tb3iCtvFwAFo14qZPiSySZ27UGutP7
 /H997iTNpOMg5fr3BsvxDTvXfQdLrGdrOhVRl3fWnFIX5YfZiimJpmSBI2q9Dr+vGmFNn1eXVL6
 AIQ8KTN4eAbtY7uD3YhDIwSYyNvW4eSNLeZD6x30N2kMPnSCeZlS9Cm1MZXfVrvRNv/+3Zm83Vv
 f0PjMlOLvDB7vC8rrvbpFvyva+mvxJul3KpGxNVcnBzwQbR7waWU/XABpYlJnMw7pSrNRQYQ7r5
 OgWSC6svAQILHmgROiORGjUXEHv6Hbh6DU8hYfOPj4vdVVK6K/HI7NudhwcybfofBToJlpkpdjs
 FhJMnD0s9GQCy+hH/G7Q4Pkwo6kBMQ==
X-Proofpoint-ORIG-GUID: _lMUBSGNI37mwp9qiN0iXnhZg-Wzo5kD
X-Authority-Analysis: v=2.4 cv=OZSVzxTY c=1 sm=1 tr=0 ts=690c3cad cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=tomDxdmRQcfPzRosr6lsLA==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JlmoTVlqZe2UTokRIjkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _lMUBSGNI37mwp9qiN0iXnhZg-Wzo5kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060048

If there is no device available under the Root Ports, there is no point in
sending PME_Turn_Off and waiting for L2/L3 transition, it will result in a
timeout.

Hence, skip those steps if no device is available during suspend. The
resume flow remains unchanged.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c..b6b8139e91e3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 
 static struct pci_ops dw_pcie_ops;
@@ -1129,6 +1130,9 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	u32 val;
 	int ret;
 
+	if (!pci_root_ports_have_device(pci->pp.bridge->bus))
+		goto stop_link;
+
 	/*
 	 * If L1SS is supported, then do not put the link into L2 as some
 	 * devices such as NVMe expect low resume latency.
@@ -1162,6 +1166,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	 */
 	udelay(1);
 
+stop_link:
 	dw_pcie_stop_link(pci);
 	if (pci->pp.ops->deinit)
 		pci->pp.ops->deinit(&pci->pp);
-- 
2.48.1


