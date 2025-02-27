Return-Path: <linux-arm-msm+bounces-49574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD322A46FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 01:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D24E188BA65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30DEC2FA;
	Thu, 27 Feb 2025 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfG5v+Cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A5270056
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615111; cv=none; b=Xfx/Ssog03bf51FnhYC+sxOKTXJpCVV6mXwZZAkw9QQ+CoT5D3Lp7ZTHmQ+n5x687WQtjvuZnW/Fl+Lz/hNXHGnxaC+FES4fxYhkN+72i1djlgnSRzXtEm2ck2K8owigPoB0A+WtbhFEtipl4PslZDQnh0c8aY1LMDdNkRi2iek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615111; c=relaxed/simple;
	bh=v5yn+bhHBu//Ow0hAxvyivOHTOOWpQp2PV96cqCYGsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNZa7Ho/0VLob/AsrFjobAFZXE5iRczJ9qBvfdfVZcMe11dfRlwZvfZBKFVJQiOowaIQQBCxfx5SGkCOyUWifB1j961gTmMqYObuYCtcPPt39mRgA64kF2v4gWQ94mlINlSEZZ/b7uqol9BBl/TSFKnZmsGyxrs4SZmq89v4ZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfG5v+Cg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGHUJp022654
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlPFkI0B3ALEVSDWu6XgyTnyndVVhXt1q/ICd8SW0Jk=; b=MfG5v+CgC9dPXdkw
	wjBxoWJsbPahis6yG9puIsk0fK/Ztxi0D+oO97PNqpXPg3kfbSVo54CfdHEBIU5F
	ih3N5huvZwF356H4wPxoqzQc81X4RzBpRFQDTDd2xfhYc1fRY4788+1M3VSbWr8A
	png5I1Wo/4nwz/fpake+JDexVUbL1uYtLQut8+cGL4IpqhZtsh2IyRFq+CGvKQHK
	0nw1cGWO6xyNOA/UuTtBqn7yCeax4WV6TvykLQe0d6tpRjmS5106bMSxwUR3VrEx
	tcozQov8zqiwA9qKY3Qfvsu+6lyik5VjvBNax8tRH6H+XWXJR+HHrudmPDyvPApa
	rh1UnQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4526bj13ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:11:48 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3f3fbe10235so396081b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 16:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615108; x=1741219908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlPFkI0B3ALEVSDWu6XgyTnyndVVhXt1q/ICd8SW0Jk=;
        b=LAnx3DaNJNZOUc6HQE5cSfGNce0V+iODo5RCVuBWnaNhI7d4AcrQpeVyZShNmkzUSl
         Xrobxf4TWiByemWYkqwQlT+r/C36xYxbU1ikeoMKmVqhbDLolqepbc7QKzGQpkEca/ST
         JXTkI4d/8tKui9aov5eXzL4eLrZbAuv04MhnWmHMJKds0qqhRKdk6AQPGcUfTjYfojee
         0pkbx9i0uI3DAL71O2rKrCMBpbDZs01M8EavN0onMfppBHtT755WD23LFPU+TTMb1AwR
         4X+E1jRaJUKI+6z3+Q9wjMR0l/Vr1XXQXzBS7i2xNhPGehXOPYcqMiXVXRppjhMDkmEw
         c/uQ==
X-Gm-Message-State: AOJu0YxOLh90LnlZxkvpmCDK6vupZeeuVf8Z4AKRcwRjNMMfd3gwb2uj
	69dcduGLeOPBci+IpaF/t07SE5/SsGa6SoEGdT8d1KHAHNgjxGGNZwExYzDCUT5/GWS63V9yqRt
	B8NXjs0uu6c1sVIq45oXpq5PMB9d42rlNMadXOUOtyARXLkAf1pibtXash+5QgOQo
X-Gm-Gg: ASbGnct25RITQ+Gcaqjal4t1pRbXBCWFyIVFAFNsLjymh0v2/BZlILA8cA9ZG/PrC5k
	MQO+jM9nFp/Yho7EmGOyD+wWy6MDr8QHmFZYOduWsNVEcEhcU7Q0sUc9WKj6CpQ3/aE+qig05y+
	cuZIyNJcIhKgrwf3ksYaDjrdrUCKI+yzXcqT7cMthfracqi0UyYPp6XDBaPwlWG/LFWnWIHlbUw
	O3A7QjKGE4SQZn+xvy/DznS3J+eCv8lmVNoafMh1IBtNijjwIX2XKyt9DOOqNiL5nTSlkkNhP2Z
	N9YuNZDOzV2WfNAJNzWfU9t4JRsvIBNGiu66RReP9icGmsXmTjUzCSr3HPs5mvIXoC+5DxhpD5c
	KfHLNUzoZiA+pHBM=
X-Received: by 2002:a05:6808:2e89:b0:3f4:2274:3cbb with SMTP id 5614622812f47-3f425a5a56emr13979039b6e.3.1740615107592;
        Wed, 26 Feb 2025 16:11:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL2t4FGGrQjljep7TKU7DTFoONhZJEsF1ah8OSYthDsvY14ziiGnhUONMiB9WvVlu0MgeL6g==
X-Received: by 2002:a05:6808:2e89:b0:3f4:2274:3cbb with SMTP id 5614622812f47-3f425a5a56emr13979019b6e.3.1740615107173;
        Wed, 26 Feb 2025 16:11:47 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f5507c40c6sm33988b6e.45.2025.02.26.16.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:11:46 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 16:17:49 -0800
Subject: [PATCH v4 2/7] usb: dwc3: core: Expose core driver as library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-dwc3-refactor-v4-2-4415e7111e49@oss.qualcomm.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
In-Reply-To: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10272;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=v5yn+bhHBu//Ow0hAxvyivOHTOOWpQp2PV96cqCYGsA=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnv684S1zYwFNkAlUL/4EXdtAR6X3NQsMvP9LV+
 WtVDmKKdbqJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ7+vOBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXOIA/7BlPbDcKGeURaPP/1Vjzl9x2qqos6oHCIXhquB62
 zvK1EINXTUjQ3OdOvS2v+JVwJhBcUjdd0izTpwZKWzZB7hf9yyYTUjXlBwYuV/RFgcJKy8zqZt2
 pz9nQgCSp00Td8agz/URaDiLMSrTTcOVmcJfePfiwHi9pJg6tHMchREchw/aZ/A2b2SxsMjCtg7
 /AWZGABUyJCHS4fIrjolx/18aLyzPbz8cB1y5WjRXpzwaRKGkY5xOJOXZGT/k/QGmhJy17veFdn
 80jzKI26Vo1cTja/pBgAW4PL6D6F1ggh/QW6t1n13ECzMOSOaoXUQ2tq6QJvN6lyboOFFVLl35g
 5Bewey9OUgplOiUdRpOCuZ687vNfj1UrGAf5TCfFzUazUpPhquHuoO2ol5R+YGfWk0MeOu4caax
 9jaQRkVnokHOwphWmlvmzmsxAH1ma3oAFKGFA7cyTWBkuD4uxJMhJSyYlQIDRD5LTvB9E6wr1z8
 vCDx/pEVp9b3Cyd+gi8gD+5viPt4sfNzL3QofgG2KQYcP7uVJmjQwddgPyQCIIiFjdx5gtuK58r
 JNJR6qOIWbx8rXsZizbxl5gpgCzP1pA3j7lqj6PLRbGdH/ld6XsFuZpVpfksrxPsmhAqYrvFccZ
 Vljd5513QVadguGZ8F9pO4oXTrA5+F3OUm6fVqJE9/Ro=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: -nwsZkwc8NFS-eWSymR_-UMFd2qXhZxs
X-Proofpoint-GUID: -nwsZkwc8NFS-eWSymR_-UMFd2qXhZxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270000

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
 drivers/usb/dwc3/core.c | 155 +++++++++++++++++++++++++++++++-----------------
 drivers/usb/dwc3/glue.h |  32 ++++++++++
 2 files changed, 133 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..d9f0a6782d36 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -36,6 +36,7 @@
 
 #include "core.h"
 #include "gadget.h"
+#include "glue.h"
 #include "io.h"
 
 #include "debug.h"
@@ -2137,27 +2138,16 @@ static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
 	return usb_psy;
 }
 
-static int dwc3_probe(struct platform_device *pdev)
+int dwc3_core_probe(const struct dwc3_probe_data *data)
 {
-	struct device		*dev = &pdev->dev;
-	struct resource		*res, dwc_res;
+	struct dwc3		*dwc = data->dwc;
+	struct device		*dev = dwc->dev;
+	struct resource		dwc_res;
 	unsigned int		hw_mode;
 	void __iomem		*regs;
-	struct dwc3		*dwc;
+	struct resource		*res = data->res;
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
@@ -2221,7 +2211,7 @@ static int dwc3_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	platform_set_drvdata(pdev, dwc);
+	dev_set_drvdata(dev, dwc);
 	dwc3_cache_hwparams(dwc);
 
 	if (!dwc->sysdev_is_parent &&
@@ -2316,12 +2306,35 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_core_probe);
 
-static void dwc3_remove(struct platform_device *pdev)
+static int dwc3_probe(struct platform_device *pdev)
 {
-	struct dwc3	*dwc = platform_get_drvdata(pdev);
+	struct dwc3_probe_data probe_data;
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
+	probe_data.dwc = dwc;
+	probe_data.res = res;
+
+	return dwc3_core_probe(&probe_data);
+}
+
+void dwc3_core_remove(struct dwc3 *dwc)
+{
+	pm_runtime_get_sync(dwc->dev);
 
 	dwc3_core_exit_mode(dwc);
 	dwc3_debugfs_exit(dwc);
@@ -2329,22 +2342,28 @@ static void dwc3_remove(struct platform_device *pdev)
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
+EXPORT_SYMBOL_GPL(dwc3_core_remove);
+
+static void dwc3_remove(struct platform_device *pdev)
+{
+	dwc3_core_remove(platform_get_drvdata(pdev));
+}
 
 #ifdef CONFIG_PM
 static int dwc3_core_init_for_resume(struct dwc3 *dwc)
@@ -2533,9 +2552,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
 	return 0;
 }
 
-static int dwc3_runtime_suspend(struct device *dev)
+int dwc3_runtime_suspend(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	if (dwc3_runtime_checks(dwc))
@@ -2547,10 +2565,10 @@ static int dwc3_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
 
-static int dwc3_runtime_resume(struct device *dev)
+int dwc3_runtime_resume(struct dwc3 *dwc)
 {
-	struct dwc3     *dwc = dev_get_drvdata(dev);
 	int		ret;
 
 	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
@@ -2571,15 +2589,14 @@ static int dwc3_runtime_resume(struct device *dev)
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
@@ -2591,53 +2608,68 @@ static int dwc3_runtime_idle(struct device *dev)
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
+int dwc3_pm_suspend(struct dwc3 *dwc)
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
+EXPORT_SYMBOL_GPL(dwc3_pm_suspend);
 
-static int dwc3_resume(struct device *dev)
+int dwc3_pm_resume(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	int		ret = 0;
 
-	pinctrl_pm_select_default_state(dev);
+	pinctrl_pm_select_default_state(dwc->dev);
 
-	pm_runtime_disable(dev);
-	ret = pm_runtime_set_active(dev);
+	pm_runtime_disable(dwc->dev);
+	ret = pm_runtime_set_active(dwc->dev);
 	if (ret)
 		goto out;
 
 	ret = dwc3_resume_common(dwc, PMSG_RESUME);
 	if (ret)
-		pm_runtime_set_suspended(dev);
+		pm_runtime_set_suspended(dwc->dev);
 
 out:
-	pm_runtime_enable(dev);
+	pm_runtime_enable(dwc->dev);
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_pm_resume);
 
-static void dwc3_complete(struct device *dev)
+void dwc3_pm_complete(struct dwc3 *dwc)
 {
-	struct dwc3	*dwc = dev_get_drvdata(dev);
 	u32		reg;
 
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
@@ -2647,21 +2679,36 @@ static void dwc3_complete(struct device *dev)
 		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_pm_complete);
+
+static int dwc3_plat_suspend(struct device *dev)
+{
+	return dwc3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int dwc3_plat_resume(struct device *dev)
+{
+	return dwc3_pm_resume(dev_get_drvdata(dev));
+}
+
+static void dwc3_plat_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
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
index 000000000000..e73cfc466012
--- /dev/null
+++ b/drivers/usb/dwc3/glue.h
@@ -0,0 +1,32 @@
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
+/**
+ * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
+ * @dwc: Reference to dwc3 context structure
+ * @res: resource for the DWC3 core mmio region
+ */
+struct dwc3_probe_data {
+	struct dwc3 *dwc;
+	struct resource *res;
+};
+
+int dwc3_core_probe(const struct dwc3_probe_data *data);
+void dwc3_core_remove(struct dwc3 *dwc);
+
+int dwc3_runtime_suspend(struct dwc3 *dwc);
+int dwc3_runtime_resume(struct dwc3 *dwc);
+int dwc3_runtime_idle(struct dwc3 *dwc);
+int dwc3_pm_suspend(struct dwc3 *dwc);
+int dwc3_pm_resume(struct dwc3 *dwc);
+void dwc3_pm_complete(struct dwc3 *dwc);
+
+#endif

-- 
2.45.2


