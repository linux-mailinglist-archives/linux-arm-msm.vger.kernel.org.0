Return-Path: <linux-arm-msm+bounces-54289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173AA8912C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 03:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B626B3A8D96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9020205AB6;
	Tue, 15 Apr 2025 01:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AV6oAwhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4652066D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744680125; cv=none; b=S4fjidC9+yTzaIr0FnUgOLUYYlaSq7rwP28Kcq/tmak57/3edS5cK2zcb5WFKxOs1f6FSutlx94uMQTWldklSdyKjZYbtiLFSIVkH7h7yjgKKsApR1XI9mwHBg45o0wFfn+qSryT/BWKJutvQTJfAWb1XjDLBPZ39wv+ZbL+cCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744680125; c=relaxed/simple;
	bh=QRDCi8fa98QdM0s7BUua2ql+G87colRiQfhXndES9dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ2x48BdkhLwX0M1ea5sGyqAZ10bzQoxDl64MQGltMM1LSS+tsXqmPLgyIvNY2s+Cxi/hVz9aRfradQ2AOR/UVtbi4pP8/Uv5WyYpfJR3A1Qs5WX+i83Ur/e96S8pOgiFxynFi37NWP/lHKG+EswjJtDqwpirBVTq8y5WDCR+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AV6oAwhL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15L1W020388
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ULIXRqyHbD/TQGRiIQ2N2qUGSlDhE4RmRxQY+pArMA=; b=AV6oAwhL8LhnwmbF
	E5NewjM1zj3IKj0kMLf91Urx68CW0NhzLR82lOAW4BRv83Ui0DXBY/T8W1g5DIdv
	iHnQPL2Cq1tvtLRHh2z/gGXI0MvUc7OQM2I3Y6Gp51g8MYR9es0c5r63w7g8VezR
	snbzM5Ab2iyIkZ0jY6peZBfjV6XZ+TW0KNSTB33zVMb9OYCpnEmqzw1yhGxZ0atO
	+NGC8zKK7onkiiw9MUYDCnoTYrWsXNpCgUndVreY/eSK+gl3PRrYtHsYfB3tfJ8G
	4HSr/X400fRn2gir0NqmY0jhyUoJJLmyGlMF4iAtelRRnRBvhUO5AWSRYf5h4jcP
	h7JMkA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj967v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:02 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72b846873b2so4343920a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 18:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744680122; x=1745284922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ULIXRqyHbD/TQGRiIQ2N2qUGSlDhE4RmRxQY+pArMA=;
        b=Y+SymUtCCV+6YuGkLB5ctCmHfOFpAidioh3K+1s+biaDsGVlVh5saeHlY4l6yrd6TY
         zgKX4C57MUhSnLjA5HrrOrppCkuN0DxiijAV8o05RiuNiI234gIl7A+5SBAj/jglxCkp
         vjHtJE4YRMFM7xNDKtyXlSxgeZv9vO0eyh+QbWbyj6m9l3EIpMN4V2aD0EO51Y1W7o/a
         68A4+M8oE9VrC6cJz6aG69JwTsD/6I0aHW+YYsWHEkTreSMeGlNlS6vG8iyoEFYdomCe
         qm96c6LznjUKDUJQrQ+PM5JtCHguys+1OlUcgiJZp9SFp4GKlvHudAgTD73ceg8sEiVr
         Ladw==
X-Gm-Message-State: AOJu0YyezjUaDtw00OESLOgvlcXU0I0lfh+nXTEBmJ4B4ZHCBJbTPPIf
	V7su+c6ajAoy/0eZqgGAmO/x5IfWy95SYz1tl9Y84j08mLUmJXG569g3Sgo3Hc5lywvft1VZjwm
	qwADAY1oP/mEOZF5eQjTzf5lRQgAV4af8ZIZeCbMwzZwCfIR1jCK0v4SF/LAuzoXS
X-Gm-Gg: ASbGncv2uwMNbvPTVra8VMWunA+DlY9gJlx77KLA2QTtVxf3WhbXtvjjHMv2p6PKOxb
	CSiD/tizvinKOVpI9eoCBWu8NM4owRh+Rr6U+NR/3dLgoOMi5LCjZ/b8zNUcfdvfrhrFSEdXZH7
	6kadJE5a0XiBDEkXivpD8a9pvTSJM242cXdD9UjMRF3Z/11vCxlmf67pq4Tr3iF/RZ9saZQUpnR
	rFzPyBqwUa+6V5K6uJCkUqneqiznOHtzes1uo+Bjd01U7O2tjYHyrP23WaUNyyLlTka0UmlhUUQ
	ULAkTh6cmiQv84+oU0//Q5rSYikYG9A+xUHHGmk80dTyzSZ7aFbtUbsfAamC7DqZ4biobOImd8W
	xFyK2y650yk0=
X-Received: by 2002:a05:6830:3983:b0:727:3b06:112 with SMTP id 46e09a7af769-72e86333d66mr8432581a34.14.1744680121760;
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKyq/JJ4XB/niEL2I2IT01SbdVjsgNXx9opVbaH/ofnEdKGTQh52MiXugmOfT7yWKsazPSVg==
X-Received: by 2002:a05:6830:3983:b0:727:3b06:112 with SMTP id 46e09a7af769-72e86333d66mr8432563a34.14.1744680121477;
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968e090esm2652538fac.6.2025.04.14.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:22:01 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 20:21:54 -0500
Subject: [PATCH v7 5/6] usb: dwc3: qcom: Don't rely on drvdata during probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-dwc3-refactor-v7-5-f015b358722d@oss.qualcomm.com>
References: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
In-Reply-To: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=QRDCi8fa98QdM0s7BUua2ql+G87colRiQfhXndES9dg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn/bSzs8OlOQ6WGukci1vVUPKNOwhwamS5k/LgY
 Fbeav+9St2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/20sxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcU33g/8DPnT4Rrq0IRaDlLbE+ZGniYUMFtdEw1mt91ReRQ
 hMozN5dl5B42XkfeSnMIo+7CmKv+0zfvYDfz2IqGcJhpUXJNVpRAXkJTlMxg5ZrRyW+Z0PF6ClM
 p6t4dCi8vR1deU1OnzUMTE+5tyxQ0yBYNVAmmv6h1flgPjmO20peZTuah7ikmWEcl34Ghr4QfUb
 j89rBXfEoi/xRUlx9XDCLmyILSIOu9yYVbcf0XriqEnXlPGiPNmZJQptdxb97163ziU7LdExhEe
 nT7/WLQOXcxWUiwYRr0prnwBSLXybs4dBgNanpiC9ZjeApgsXII6k84eCHf3Lmd+kFlgq9FOh5B
 yIJroe8w9uen2W8KpcpKVZ1/7y5ruXFETkIvImt/Nf0wT4IRqjyr5Tji/nhFFQKrQV7lCW57T+1
 3GBeNG3uvOhxMyd7fYvdqKRsclklpf1lei7L/1tqb9j6zHo8gJyHHr2QQCgdSjfX+5uJCVRR5yO
 IWDmuPPgJnlPrREKw6b0CAVxmBQRys/QsDuYlx+bUMyuUtZE1F2d5WvKC5Az6Eel/+YJM/EByHx
 wIJJ5ZAlXdlsYAIlxkPyz/RML9nDMtuznN8UyNF/obnYPdm9d22S2Iq95kcn6Va4u8jt+RB1NvZ
 LmRRxZavCJEqP2Z3dt16fbEky+d0NaEkdCinqUtaeauI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: oVlCSU755Iy519yN60ENdKjqTxlNk8tC
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fdb4ba cx=c_pps a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jIQo8A4GAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0UB9HjPGtwcCTtCM8zIA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oVlCSU755Iy519yN60ENdKjqTxlNk8tC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150005

With the upcoming transition to a model where DWC3 core and glue operate
on a single struct device the drvdata datatype will change to be owned
by the core.

The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
glue context around before the core is allocated.

Remove this problem, and clean up the code, by passing the dwc3_qcom
struct around during probe, instead of acquiring it from the drvdata.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
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


