Return-Path: <linux-arm-msm+bounces-44961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D4A1003A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D17F03A51C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91E52500B1;
	Tue, 14 Jan 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIJJlZsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF32451CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831182; cv=none; b=nQ6DUI/STGhBBg/6qnN3leyN8seh/wrWSm0owoQVjrJDXjGkvu1qvTKCj7AU6gh70IaDAQ10mU1+7JwsROtO/IquH4DxB1oyNpNeINxYbZvOT/jsPKjfGCngVTNfj9M5BwBY0qsVrw7k3L/zadFNXdOS2h+REiy1qRJiwXzGToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831182; c=relaxed/simple;
	bh=M8a05g5QhGIDQGcQr0ozZere4otNUOUy0SpBYsjJCpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m49tLH9IsX9g30eBuhAiMFbrkQvk0v7xPaIJbOgUCKpEoPYT5vvRUTyvJLw8hdhAMW7+PW83hr/PDBWTPwAPbLgwslrdEH8mwyNpZGkjhmxJQxPeGFHX7+9WcErnE0k6siIm3HWSHttgPTBspGAHKt+Zq3zUttWfOU2UuOH0qfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIJJlZsO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E27SD8027639
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbPNDUgAq9khxXzdnGO7xYrRsfNyJmja9qPh+54W2wg=; b=hIJJlZsOOlO5wOJI
	7/zNmwU7s/GoQ5NekgyVAVhx1utvGYpbBjJfbfAI2xnp4Md+o/JDJu9fTNjHNtle
	apbfydlCInZ/Z/8/tM9lad0rMqgWriU7cHB2lRJt6fStJ0dmwZ07a7DN6YjdASjg
	YyDYBg6jQMa2nqYcDGuuW4gHuU6566p5ndjcH9ezc/OGIPc3zVHZUF20M47hRbPl
	wr8gDkyPlVO4iNfkT/1Z1kVGFAbXXJ0V+Oet6/Kie6J2+LzaIj4HAq4R6qoOOkHq
	k7wtj6+NRj+YN9UH8sVAjmXhgdlnQpWgVgjaYOemNlBLgO5dN7EmR33IUWf8DX1i
	N0sJgg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445ev78bdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5f88020f6f9so3669739eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831162; x=1737435962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbPNDUgAq9khxXzdnGO7xYrRsfNyJmja9qPh+54W2wg=;
        b=ZWGyjAUpSvEjWlJqDnOfXfryU6aLGEXyX4AnojIRmfISOOwG4a/THm59ynTh6RGlrG
         wP3QZjpJIQV5YTDi8bptJ/qlHL2wjHBtFMWglP+ocYSJ+SV4POca7iLYJhtJJLVqItXB
         r9963rVvVQyUfBo/W+qDnjruCobZJaZnO+KYlb8VIPLwEo+GtcPlyGiEe3vT2UMrMOJg
         VATiExLlP9DjhpT1ZZudk0SqcpSwUGuUvT1r+PtYXlSGxBePxCZEFUU5NTfNiy9dVk6u
         K2MJZp0zpSerGFuXAF6vAz+j3ZIyynryL1FEOW1w0q/wt6haDXAuezyF+sc56h52Rjn+
         Fgwg==
X-Gm-Message-State: AOJu0YwSLU23amH95ctzyb/K8fmeE116KrzXm2IxxhH5hTFKkVtQy/pc
	maC96jQUOfnKImuZWZVUAmh7sNRqVJTJN0JTiAAYZ0MIL0KPsk88ggI0AsNccRSTlTXDk/W4QLY
	pZLWKQsbF7goY27DoHCvP4lAIM2QvY6wnxWpY/holeFn/SdZBl9Pnduo2oNnvTh3u+/Aex59A
X-Gm-Gg: ASbGncuRAsJ0J/Z6tDyDx0d5aCqhBimBNh+IM5hNrKRNggAjP7JvgQKnnYDNWRv+bet
	iCTul6CVkGh++Vq0xOqe4o4nL84NOx/1TmiCTu9hwOcWsD81uY5CZY3rAgMRXtx1ofXJ6xRrDM/
	0yQaDrv0Brbto6XgH30EmTI63+rbyxk2erdB88hJx70xAwegbr7ICFC75ulbGBCOkKkqD/eRuDn
	yTxubqnqx4h2TqPfEGV0JT7YrSswUN0n7iugR3owIpNVFd8ybz7iiAP7GAA/M+mbHX1PQ1/vo9v
	6i1+I02SqlB7p7bKkrtKEJGHztMArwm/CY9WCK9nYAeNV4w9STYnv4uF
X-Received: by 2002:a05:6820:210e:b0:5f6:8c7e:f59e with SMTP id 006d021491bc7-5f730989363mr16287571eaf.6.1736831162758;
        Mon, 13 Jan 2025 21:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnfKXoeeeA8NBKomAIGTBbHrl8rTKa1hnJ9t51uButBIKoClFHi11qMo2YLC0zEXH94GPIrw==
X-Received: by 2002:a05:6820:210e:b0:5f6:8c7e:f59e with SMTP id 006d021491bc7-5f730989363mr16287554eaf.6.1736831162451;
        Mon, 13 Jan 2025 21:06:02 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:06:01 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:42 -0800
Subject: [PATCH v3 09/12] usb: dwc3: core: Don't touch resets and clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-9-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=M8a05g5QhGIDQGcQr0ozZere4otNUOUy0SpBYsjJCpI=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVOsfUzZ+vsMvlEhHlwzfQcaWwEzB0h35m9
 R0ifsSqmjiJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXZ9RAA0iQqg0EmNJYeqqOjc0dfJ1H7b0UIC3sUd0vmjr4
 hAHB6O0u19HbWk3nE443PWV0bPSiDznlnH+L8kuLoo7CzouLyZjIu0tICAzB8V3iGU+KnfxpzXu
 1bC5DRQkKOYA/R+oDE+/dY37NUMq+ftw9umdwfjdGR4is5oTtvcoXbuN/Rrf4JEIUXhgtY68Kr9
 YLCDzYyCOrm5MKDLXWXcNDHg3Rk2vF5F4Ra6PmfrL+RLg/l0HvKL4SdSm7y9VFnNspfdiJIGyxw
 QLVzgNVif7flOHOzxgmA6gnrZoZKHxxkjxF6EdQCNP1yCoKMCI48EtX1zvhpkaeoyBKD+I4bjMN
 7Rn2rBrE29msQRpAnwuRC+GBt0pTPXEopaQT7B7SEJAL2NPYqUHyUE0p4nuGF/NBSS6IYmdEz0O
 lJI+IfPVQSLErZn2sM9HBAMl5GKcL+HMDtxeggHULotixy2mj2fYhAPLUpopCRhN9XFTnQvBzlw
 0NF22KdtnvPyO/GYtR1oWgYdgAnyYYegodpLiZUMdzq3+SjJP4IALcLyQAoC4/2w8/LKJOqVhvl
 3rjh9RYXOA1F3VGwyi2P9Z/hesplGvUFMR6PAjbI1HwzCCfz/NmHi/gpae5gDvBDr669vVxneyM
 J30LQrxIKUlzQXxto9hIwajsle3z8plZRYo7uwZj//Rg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: -6qq6xlUTpNGwR0CVxq5sPkTVHVya2vt
X-Proofpoint-GUID: -6qq6xlUTpNGwR0CVxq5sPkTVHVya2vt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140040

When the core is integrated with glue, it's expected that the glue IP
will require, and hence handle, the clocks and resets of the IP-block.

Allow the platform or glue layer to indicate if the core logic for
clocks and resets should be skipped to deal with this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 22 ++++++++++++----------
 drivers/usb/dwc3/glue.h |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 930d812a9fbb..c0b2398b8c18 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2130,7 +2130,7 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
 	return 0;
 }
 
-int dwc3_init(struct dwc3 *dwc, struct resource *res)
+int dwc3_init(struct dwc3 *dwc, struct resource *res, bool ignore_clocks_and_resets)
 {
 	struct device		*dev = dwc->dev;
 	struct resource		dwc_res;
@@ -2173,15 +2173,17 @@ int dwc3_init(struct dwc3 *dwc, struct resource *res)
 
 	dwc3_get_software_properties(dwc);
 
-	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
-	if (IS_ERR(dwc->reset)) {
-		ret = PTR_ERR(dwc->reset);
-		goto err_put_psy;
-	}
+	if (!ignore_clocks_and_resets) {
+		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
+		if (IS_ERR(dwc->reset)) {
+			ret = PTR_ERR(dwc->reset);
+			goto err_put_psy;
+		}
 
-	ret = dwc3_get_clocks(dwc);
-	if (ret)
-		goto err_put_psy;
+		ret = dwc3_get_clocks(dwc);
+		if (ret)
+			goto err_put_psy;
+	}
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
@@ -2311,7 +2313,7 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc->dev = &pdev->dev;
 
-	return dwc3_init(dwc, res);
+	return dwc3_init(dwc, res, false);
 }
 
 void dwc3_uninit(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index f6a513e43f53..ac87491bfdeb 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -9,7 +9,7 @@
 #include <linux/types.h>
 #include "core.h"
 
-int dwc3_init(struct dwc3 *dwc, struct resource *res);
+int dwc3_init(struct dwc3 *dwc, struct resource *res, bool ignore_clocks_and_resets);
 void dwc3_uninit(struct dwc3 *dwc);
 
 int dwc3_runtime_suspend(struct dwc3 *dwc);

-- 
2.45.2


