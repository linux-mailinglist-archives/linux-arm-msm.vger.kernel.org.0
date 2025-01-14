Return-Path: <linux-arm-msm+bounces-44963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5CA1003F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBDA2164695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7EC2500D6;
	Tue, 14 Jan 2025 05:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKjypCHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E623A0EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831184; cv=none; b=ebE/+eipMzdmqvfj+NxgJHSb0j5pEQkHoqS7Sz6EjJmMJstALGhJjQIC3VaaNfWCL6KWPn0ru56zMcx0LTAwZ8I8fPSCRzwQ0JhckhKK1vx/Yi0gSxVVa8jbt2WAZeAwYYFHVuuWTdybLq4ggSaqY5gKOLO5YKRrKCo3HAYcz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831184; c=relaxed/simple;
	bh=muZkLA0Vp3J88ryGIQbBDqXzWQz+TbSF+4TbATR2OBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVRS81PNeyt8CXuG3CAPzAPQ6aPdKYkD+pwhx2BL4G8kYXVFddczO5EwkdgLRyiXCXzzUME6XZ02RcIfUsE3hRdWy0FUigOeY2LKOiKUthsl9Vl/LL4oVvztUvuDqdWfnhXZKD1L9dCfvL8L3C+lXk5mVn8Zz3pXqtrivM93PTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKjypCHV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E24LcO010277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as68kn4FM169poQZgZX9fA/DRIYJGHKIrl9TWXwhMPc=; b=mKjypCHVjn32jqx6
	Mp1XeCd0cwqfqL2Cwaub4Y7GU+Xn0ur11uR0ibLGWgcY/lQ/NqpeJHLTRuzF8Hbh
	gS+21hyoFjl7P52ubxuAIhE50zhCCbCoAuU/pqGx7eB4YkpV9eP8r371S4ppyQY6
	atKfyEdTnbG8aIjUkLKfRVkwPLdtX4Bebo0JHgfU6QI6S3S2rpwEjuJgmZ45zV0o
	EAyxPJLX/SyVsWZhm5weKF6LkwTrwGe9s0TxPM07QVlEhSE07EMJ2L9Qiuz0I/9w
	GcjmL0xg0dX2kHiA90EjqKIEn2FcxS1JJTQdkWu1T8eDdHh9hywNYIvXgqOsfbHi
	j5QRdA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445eterbmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:20 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f2e3b9c0b6so4141826eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831162; x=1737435962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=as68kn4FM169poQZgZX9fA/DRIYJGHKIrl9TWXwhMPc=;
        b=uv5tFf/s/oyQqlY14CWAyskd+bGnNU3BzjCTj4PZ1xpHwVbEAWx+c3J0aqolQJPWe4
         BZu8Ui34hUvVkzXFByKcN7qA7bWnsNIVlN77tUgo2TliZeJ7B3rw+20/wjxyfkEkRpWF
         hm8SQOHTO3tUp+8kRH4/tOQ+Rr+2RHLoUsMfsswocZUFrx0D+4KDfuyrtFNbysSGRVQ0
         Zqr7icnLOgJjNvgQHj+dQlxPk2I+EpcRLDOtvPN+VHn5Qwk65vaWVgObqS01hRbuq6yh
         yjKNGOW+ssLDYnx2XJUaNRaOt70W7PzaZgrWsI7HTmmYG6RHKORSwXQRImV+Qypj7Ur5
         GBZg==
X-Gm-Message-State: AOJu0Yz4D3zs/H+wceyVCaW5aroMI7J3SMk3cfDi4c3PNPmuA0PmcxWD
	V0tzVCJD+WMBsYklBRlZjYZQ7DJKbzJxG0cfn+Tj2T750j3T1V0VmHpSOm7lSIPLEGqq04cYo4J
	LqKcP1n6etSKK2J+eUT+91ezF7bi3N+Pp2oLRqWQ17TEmDVpdOYoywca/zpt0J9C6
X-Gm-Gg: ASbGncsIQgX0V3zQDPAvaMhM3rW0P1KLNE6z6raoVfXQ2idwct9Ge/+1JCPuGS10sPl
	/O7DaLv1P4eTGqMUR3y54YTHNKbm9XvgmKQN/I5EnQA5WwQra8xvTp+GUIp+wwam5Pkg+mfr9ul
	j8QXogXBb+j130x+tDP/jH8KXpmwt/qayVz0Rbwg1ZFDCQZsS6KCvHvS0yNDwICMBdziTaafTXC
	t9pj5X9QckF5eQmk3eZnTzfmqrj1TNlY5abkM5qBwLEqWoL409vIr5Tgf+HaNhPhp6ls+aGqSAj
	UXdg6jJlmJ+JebNbuCpEQM0tjFXhq8dysaBIrJ+pOPruhqAE4OAwOGOE
X-Received: by 2002:a05:6820:1b0b:b0:5eb:b282:5916 with SMTP id 006d021491bc7-5f73096edf3mr14815240eaf.7.1736831161685;
        Mon, 13 Jan 2025 21:06:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2pGHr+Y6KnrlSZ/bxvWiXcqyB7KLMUB+V5CE73EoXohy/aAF95TpGOEhWbjfnYVpc4s8DXA==
X-Received: by 2002:a05:6820:1b0b:b0:5eb:b282:5916 with SMTP id 006d021491bc7-5f73096edf3mr14815230eaf.7.1736831161336;
        Mon, 13 Jan 2025 21:06:01 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:06:00 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:41 -0800
Subject: [PATCH v3 08/12] usb: dwc3: core: Expose core driver as library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-8-d1722075df7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9690;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=muZkLA0Vp3J88ryGIQbBDqXzWQz+TbSF+4TbATR2OBQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVGwwI0V5UJxSj2BP+zu6gur5o8TxPyydFi
 /3PL7jKKpeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXQ6RAAxUC3LcXfHDnYSdkkTO+DkRdEyFhcdZdT6GFcg+V
 Kx/xU7LFChS8Ac9hsBIGvDs0MH1TtHLoMiwCNS4317lURk4rb58mbb+ga41GbU0hKjB+EXfIsgd
 z6zLPam55l3dBhre9r3tGl0ziGpf4ZB+apFeS3uPk94z4L05FYTntw1NLG75Ap61uHz4vGpAnyi
 WBLqUOx5rSV1J1x3LNp1eg/3J876COoP+ciNna94CC91TGDR7KmFgQNkq3qgOwN3mGtuyAN8gzf
 N6Ae1lw/Q8n0H35zSYgc831+rtlu+GXrZSwTqhphmGpA9Ls3V9DLVQKRw7dGEhK2jPO2T/72DXB
 tTCZJu77ZVXzPTzHuihH8hIs//fsoRXIynGta++FmgjGcMHvqwyW+XrKSQjJtL7ALhjQkm50kGq
 X+YTznsMaPDp9LDWEQpalB4DfguayDqLkCcFBpdKB7cwl4M3HFHynLW3heNOyL7QaB5hLkMGSIh
 0U68CaqA3t97rJuukExFgG4WmzLSBZIYAfvy2xDEjZBRqthcXsL9fGCz9juYnPL89ANvezLbl2d
 wni0FWrOxWrB9xQfoILjkVPptWDrQVGFK6kszO8DI/PxE3LzbIe/E/p5C+UiD5zJMz9jWi0GiRe
 RL2whAjMcyJUhF6iB++ZuInE33s2qvyKKLKxb2KcZIB0=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: W-V_hnDmSS7_kSjGaDxjyAD_mBlxmJa3
X-Proofpoint-GUID: W-V_hnDmSS7_kSjGaDxjyAD_mBlxmJa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=995 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140040

The DWC3 IP block is handled by three distinct device drivers: XHCI,
DWC3 core and a platform specific (optional) DWC3 glue driver.

This has resulted in, at least in the case of the Qualcomm glue, the
presence of a number of layering violations, where the glue code either
can't handle, or has to work around, the fact that core might not probe
deterministically.

An example of this is that the suspend path should operate slightly
different depending on the device operating in host or peripheral mode,
and the only way to determine the operating state is to peek into the
core's drvdata.

The Qualcomm glue driver is expected to make updates in the qscratch
register region (the "glue" region) during role switch events, but with
the glue and core split using the driver model, there is no reasonable
way to introduce listeners for mode changes.

Split the dwc3 core platform_driver callbacks and their implementation
and export the implementation, to make it possible to deterministically
instantiate the dwc3 core as part of the dwc3 glue drivers and to
allow flattening of the DeviceTree representation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 149 ++++++++++++++++++++++++++++++------------------
 drivers/usb/dwc3/glue.h |  22 +++++++
 2 files changed, 117 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c22b8678e02e..930d812a9fbb 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -36,6 +36,7 @@
 
 #include "core.h"
 #include "gadget.h"
+#include "glue.h"
 #include "io.h"
 
 #include "debug.h"
@@ -2129,27 +2130,14 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
 	return 0;
 }
 
-static int dwc3_probe(struct platform_device *pdev)
+int dwc3_init(struct dwc3 *dwc, struct resource *res)
 {
-	struct device		*dev = &pdev->dev;
-	struct resource		*res, dwc_res;
+	struct device		*dev = dwc->dev;
+	struct resource		dwc_res;
 	unsigned int		hw_mode;
 	void __iomem		*regs;
-	struct dwc3		*dwc;
 	int			ret;
 
-	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
-	if (!dwc)
-		return -ENOMEM;
-
-	dwc->dev = dev;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "missing memory resource\n");
-		return -ENODEV;
-	}
-
 	dwc->xhci_resources[0].start = res->start;
 	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
 					DWC3_XHCI_REGS_END;
@@ -2209,7 +2197,7 @@ static int dwc3_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	platform_set_drvdata(pdev, dwc);
+	dev_set_drvdata(dev, dwc);
 	dwc3_cache_hwparams(dwc);
 
 	if (!dwc->sysdev_is_parent &&
@@ -2304,12 +2292,31 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_init);
 
-static void dwc3_remove(struct platform_device *pdev)
+static int dwc3_probe(struct platform_device *pdev)
 {
-	struct dwc3	*dwc = platform_get_drvdata(pdev);
+	struct resource *res;
+	struct dwc3 *dwc;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc = devm_kzalloc(&pdev->dev, sizeof(*dwc), GFP_KERNEL);
+	if (!dwc)
+		return -ENOMEM;
 
-	pm_runtime_get_sync(&pdev->dev);
+	dwc->dev = &pdev->dev;
+
+	return dwc3_init(dwc, res);
+}
+
+void dwc3_uninit(struct dwc3 *dwc)
+{
+	pm_runtime_get_sync(dwc->dev);
 
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
@@ -2317,22 +2324,28 @@ static void dwc3_remove(struct platform_device *pdev)
 	dwc3_core_exit(dwc);
 	dwc3_ulpi_exit(dwc);
 
-	pm_runtime_allow(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_allow(dwc->dev);
+	pm_runtime_disable(dwc->dev);
+	pm_runtime_dont_use_autosuspend(dwc->dev);
+	pm_runtime_put_noidle(dwc->dev);
 	/*
 	 * HACK: Clear the driver data, which is currently accessed by parent
 	 * glue drivers, before allowing the parent to suspend.
 	 */
-	platform_set_drvdata(pdev, NULL);
-	pm_runtime_set_suspended(&pdev->dev);
+	dev_set_drvdata(dwc->dev, NULL);
+	pm_runtime_set_suspended(dwc->dev);
 
 	dwc3_free_event_buffers(dwc);
 
 	if (dwc->usb_psy)
 		power_supply_put(dwc->usb_psy);
 }
+EXPORT_SYMBOL_GPL(dwc3_uninit);
+
+static void dwc3_remove(struct platform_device *pdev)
+{
+	dwc3_uninit(platform_get_drvdata(pdev));
+}
 
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
@@ -2521,9 +2534,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
 	return 0;
 }
 
-static int dwc3_runtime_suspend(struct device *dev)
+int dwc3_runtime_suspend(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	if (dwc3_runtime_checks(dwc))
@@ -2535,10 +2547,10 @@ static int dwc3_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
 
-static int dwc3_runtime_resume(struct device *dev)
+int dwc3_runtime_resume(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
@@ -2559,15 +2571,14 @@ static int dwc3_runtime_resume(struct device *dev)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_resume);
 
-static int dwc3_runtime_idle(struct device *dev)
+int dwc3_runtime_idle(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
-
 	switch (dwc->current_dr_role) {
 	case DWC3_GCTL_PRTCAP_DEVICE:
 		if (dwc3_runtime_checks(dwc))
@@ -2579,50 +2590,65 @@ static int dwc3_runtime_idle(struct device *dev)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_autosuspend(dev);
+	pm_runtime_mark_last_busy(dwc->dev);
+	pm_runtime_autosuspend(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_idle);
+
+static int dwc3_plat_runtime_suspend(struct device *dev)
+{
+	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_runtime_resume(struct device *dev)
+{
+	return dwc3_runtime_resume(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
 #endif /* CONFIG_PM */
 
 #ifdef CONFIG_PM_SLEEP
-static int dwc3_suspend(struct device *dev)
+int dwc3_suspend(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
-	pinctrl_pm_select_sleep_state(dev);
+	pinctrl_pm_select_sleep_state(dwc->dev);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_suspend);
 
-static int dwc3_resume(struct device *dev)
+int dwc3_resume(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	int		ret = 0;
 
-	pinctrl_pm_select_default_state(dev);
+	pinctrl_pm_select_default_state(dwc->dev);
 
-	pm_runtime_disable(dev);
-	pm_runtime_set_active(dev);
+	pm_runtime_disable(dwc->dev);
+	pm_runtime_set_active(dwc->dev);
 
 	ret = dwc3_resume_common(dwc, PMSG_RESUME);
 	if (ret)
-		pm_runtime_set_suspended(dev);
+		pm_runtime_set_suspended(dwc->dev);
 
-	pm_runtime_enable(dev);
+	pm_runtime_enable(dwc->dev);
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_resume);
 
-static void dwc3_complete(struct device *dev)
+void dwc3_complete(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	u32		reg;
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
@@ -2632,21 +2658,36 @@ static void dwc3_complete(struct device *dev)
 		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_complete);
+
+static int dwc3_plat_suspend(struct device *dev)
+{
+	return dwc3_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_resume(struct device *dev)
+{
+	return dwc3_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_plat_complete(struct device *dev)
+{
+	dwc3_complete(dev_get_drvdata(dev));
+}
 #else
-#define dwc3_complete NULL
+#define dwc3_plat_complete NULL
 #endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops dwc3_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
-	.complete = dwc3_complete,
-
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)
+	.complete = dwc3_plat_complete,
 	/*
 	 * Runtime suspend halts the controller on disconnection. It relies on
 	 * platforms with custom connection notification to start the controller
 	 * again.
 	 */
-	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
-			dwc3_runtime_idle)
+	SET_RUNTIME_PM_OPS(dwc3_plat_runtime_suspend, dwc3_plat_runtime_resume,
+			   dwc3_plat_runtime_idle)
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
new file mode 100644
index 000000000000..f6a513e43f53
--- /dev/null
+++ b/drivers/usb/dwc3/glue.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * glue.h - DesignWare USB3 DRD glue header
+ */
+
+#ifndef __DRIVERS_USB_DWC3_GLUE_H
+#define __DRIVERS_USB_DWC3_GLUE_H
+
+#include <linux/types.h>
+#include "core.h"
+
+int dwc3_init(struct dwc3 *dwc, struct resource *res);
+void dwc3_uninit(struct dwc3 *dwc);
+
+int dwc3_runtime_suspend(struct dwc3 *dwc);
+int dwc3_runtime_resume(struct dwc3 *dwc);
+int dwc3_runtime_idle(struct dwc3 *dwc);
+int dwc3_suspend(struct dwc3 *dwc);
+int dwc3_resume(struct dwc3 *dwc);
+void dwc3_complete(struct dwc3 *dwc);
+
+#endif

-- 
2.45.2


