Return-Path: <linux-arm-msm+bounces-53931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCECA85239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 05:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6AC47A95EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 03:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECD927CB20;
	Fri, 11 Apr 2025 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgqcpvLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27027CCDA
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343432; cv=none; b=Hd+wxU2oxAFO6CsEyciQF3B/vG3ZSHdfKOBuVrpqlTb+or4yx7WFodOfdbFywVhJbS49NNaSxT2L9ySta2BoQp+c5dwrG2J3gZgU6SZZWweRc3GnmhJPzo3whpHsHPuMjU2cG+EYToOGHLHHvLpEUhng5YaKAux/oJjN7iJXwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343432; c=relaxed/simple;
	bh=RSuxk/dHzfMuHqU3U1cL04m7MqJ/Ml8N36LwtwzR9Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpcWcpTKIDdnZDdsBXnjqaDB2bQSes9G0wg7We22tK5aOFLP1Q72vTpM7rj5+JdoHQuF+6Rakjpu73Ys24rdlPOlHLYvsrlIU7UxX7LK+OzIBL2rVzGYRbt6RKOrK+X72NL6RKudzTLi/RFUqXpYrONtsjFiOktWOIGDyyiEYsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgqcpvLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFuo4E000333
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JckVC7d5iC7VbTaEcWk7JXOw9O2E+TUPpabbS6XiWDk=; b=CgqcpvLZVJbpDU1+
	+Bhgqu/15PuwojDTusH3MJle/XMyPvIBMnIHh8tZRT/Eb1lgslizxYxsZAgiXjVv
	DqApkrlysv24jpzcAdwM+450aDqTPfBtTpkTZOedjE3fMLkThq8cBnP5soMMvoGP
	dKV9qeNOoiQrOeWo6p2Bdx8ONiv15XoA7Gs8bLF3RfschVM46XV9pVBFzYVxqCgE
	7tp11kg8nc8whCaMgu1J0EWcCiD4taDS5u8gBo6BLpquX2rJz5OR6IMqvTAxyyxO
	Got5gCvk4rHRVxzRiURggZGsHQZpwPD3S/qtSnr47ksDNWBUh500NDWGuvsqgXFz
	dCv/Qw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkrvpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 03:50:28 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2c83a8ab786so1326467fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343428; x=1744948228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JckVC7d5iC7VbTaEcWk7JXOw9O2E+TUPpabbS6XiWDk=;
        b=VlOocdpc26fzNE61pMTjalN9HWO9dXcDHZk4qJrnTKDiiSSkJ7tLZxqGRh4hyysc+a
         2ILmGse1lpzDNLd0QEXIzzE0PLsilURtSuxMuGQLZWVk2rlErFioBVDvnBlhilTlyPyq
         iWK1LVxV6s+HfOlx8/p1cVHE1rLRHr7llmktnqqwiWsI/hNT7v0tst0csXMP9obECHw5
         Wjp/ats6JF8rpFlU/xlV4ronJ6jsOE58fkIiKNKrVW4lJ8nvbQJ9MzszvaPcJGLpqhGR
         TJM8HmgoBgC2PQc0WOWa0IcYTjGuFWStjnm+mxVm9e2lC8IIwXn/OE+lEvx/j5U95YHe
         VQMQ==
X-Gm-Message-State: AOJu0YxZiHy4CBlhB5D3XHLDqGJ20dgYHtf7FspSZmd8ZHAZKM+gSpV5
	fhTYQHAOPACsbl0YQIjzQqyTKc7mAnE6E4buQm5FicSFkdkXha/jqA0KaDkp2+yRxCIFVl0KKQF
	RNoXlCuU2FKNttj/kxTyIQ7gEpeQZX6pdkk6b5bxHao5dhs/xV8WW1cav55dp8/wB
X-Gm-Gg: ASbGncsXKpkUSCu60No4AKGnapQCp9Y2Kkgw8IuN1Hps+FAxZXTKflvgO/28rXGrBpD
	TrmFAc+DCFWeQLSXFRPDhPMUopm4cTvzlA+OKU5kQufzL/pxEZE/LcrdI8nJzk9ql2noM6mo5Rl
	WK9s5y5OLN2HcCLE0yBGDnKDjPW1tR0QOI8bGkeejH+8RRb1giS+VVhYn43/EMq09C613Q9wzJj
	W2ANGMyfGG6D1azkXKuRotqTVbRGg6RmEQ27e0pwU+QA1b6otJcaAFoap/IWMLZW/utYcq6cMTj
	6skGNw1zicahE7AUZddJLVY1jF/egkrBJLu8iM9BYWYNLBCKq4+1z9XYAzBHB5hhKdQsxC/SyaF
	oo6c23TELjws=
X-Received: by 2002:a05:6871:50c7:b0:29e:5297:a2a7 with SMTP id 586e51a60fabf-2d0d5ef2c0cmr675829fac.30.1744343428214;
        Thu, 10 Apr 2025 20:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTEJqA//s2MSMQfQAqTLDtmK7DVSU2dp4MjfLg6qT58X3b36bH8Wo7QjGpbBgWsGTxZGlmLQ==
X-Received: by 2002:a05:6871:50c7:b0:29e:5297:a2a7 with SMTP id 586e51a60fabf-2d0d5ef2c0cmr675811fac.30.1744343427808;
        Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969589basm958677fac.19.2025.04.10.20.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:50:27 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:50:16 -0500
Subject: [PATCH v6 5/6] usb: dwc3: qcom: Don't rely on drvdata during probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dwc3-refactor-v6-5-dc0d1b336135@oss.qualcomm.com>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSuxk/dHzfMuHqU3U1cL04m7MqJ/Ml8N36LwtwzR9Og=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn+JF9qiL5G7nhdRn0u6cP1Jl7oF5pjHpLTc1Ut
 b2tAJuY2GuJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/iRfRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV3FQ/+PsV3vdTXi8T+b41VDzzOy0p8rFRKUvPN8x480LO
 tjt/YfilpIndvUZagukl92ZMdTlH9Kil18eJGuyK9uwsjG9kZ7SOsvd9eMg7qSlKekj3kDkMA9J
 236qsQIWH9YqOT0DXaswHJiVqNl96TyfZw6l1EtZYQl8CSCOyqiZtXLEI49rYwocaOwjCEjmGgt
 LX3HLOpuWhlwu1l2bPhg1G0JRTxlJzGc+gelHYuT1DdGMJDOROz2i+yDYjU1X7q70Vi7xgxSIrw
 gpUd77j28R4eB2agSO7id2ewsMhwB+6NhN9STZ9U+5rfXrFG+MkGbaqsztdqH850lXRrmh2sjj2
 cce3/RWdT+x3/dizxxk8QQr824dF9sYa2jiwjtf9Ct6k6QKgbG1ew6a2tf4xWXIdnJdaASK8h+x
 3TIoFgMuJVlrp+6LrjSbn+x0WruBO5ZJRbpVEiwD9IygAj14UHyIg9mwojCeWO7J2XlYrPt4+/W
 a0zDeHNz1FKRqQXUHzvzUef8MjxvELWYxAs3MdTOLah+Camprkc/uCPVEMAEvipdTZXMcl4qbce
 s55datCM/lYZDPUII3EDpA1CYIierVskd+8vhr7tTyLptjEbJUCqGOicqWRLM7bJzbT/L/u73Bu
 zWpE9yod4VOu7okl9xigZmH4smAQQBjp72u+PZQY4vxY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: bTE9entJZgBWEElk-Y2wR0oyMLbQ7RsG
X-Proofpoint-ORIG-GUID: bTE9entJZgBWEElk-Y2wR0oyMLbQ7RsG
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f89185 cx=c_pps a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=0UB9HjPGtwcCTtCM8zIA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110026

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 79f3600f25c41a5ed770f164a03c7dc424b01440..9d04c2457433bd6bcd96c445f59d7f2a3c6fdf24 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -547,9 +547,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 	return ret;
 }
 
-static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
+static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
+				    struct platform_device *pdev,
+				    int port_index, bool is_multiport)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const char *irq_name;
 	int irq;
 	int ret;
@@ -634,9 +635,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	return DWC3_QCOM_MAX_PORTS;
 }
 
-static int dwc3_qcom_setup_irq(struct platform_device *pdev)
+static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	bool is_multiport;
 	int ret;
 	int i;
@@ -645,7 +645,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 	is_multiport = (qcom->num_ports > 1);
 
 	for (i = 0; i < qcom->num_ports; i++) {
-		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
+		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
 		if (ret)
 			return ret;
 	}
@@ -700,9 +700,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
 {
-	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	int			ret;
@@ -778,7 +777,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	ret = dwc3_qcom_setup_irq(pdev);
+	ret = dwc3_qcom_setup_irq(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
@@ -793,7 +792,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(pdev);
+	ret = dwc3_qcom_of_register_core(qcom, pdev);
 	if (ret) {
 		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto clk_disable;

-- 
2.49.0


