Return-Path: <linux-arm-msm+bounces-57339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B515FAB08EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B88137A4900
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 03:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A6723A58B;
	Fri,  9 May 2025 03:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0G036S1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2B2397A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 03:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746762148; cv=none; b=D4Zihc+78s+QTmTK0twDol8xGjjmkJFWuIL2EfA+dQt/vqaew0xuwE43kFUHs8vufyBknPlxCACAtvOfpXj0A05ZfGlN5KlpuKUGjkq6H56KUtrcSpUmYqku/MnMC7cmwgiiQ+0gVzoImqD7X95y/QIka8Xs0PfHrm4OhSB9XPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746762148; c=relaxed/simple;
	bh=teynXbjo1NoamMkz/mK3yn4mJtFEC0NTXW1tybV/syA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jqgb1uev4Prw4Xs6bp0wQHx2eu7zjT5CvxFuCzTnTOHgxjsWBR+Y8Pa3kXkdx/TigUBl8K8rFE+lmu2T6y3crT5Yxl3SHLGKdRnA5eQJJ+wgi18j05l+4oXX6lOQwMCj0CSK3aki0K6d8Fq2nyqqLuOtGhJA3h6NEZ8unAX9Wwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0G036S1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548IYIXh021197
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 03:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mnm/1NNQHQzS+5KgXFHV89
	UXfzv01MUWVdbnyxFFSYY=; b=M0G036S151VJV7DPBHNUHwbxydGPniYEQPNpx3
	M2EuBpA8CX8HEO5IK0GDY5ny17YAe77IhHZMuUZwXEiV0js029CUl6Igl/y7pQqo
	huhHWJjjcF8ptbX5+QRb+7RyulzaswUYIzq6BhlGmEMs2WNwXmolWsKFdTrQk8jk
	BCfpsZb0/AEdwfP8rwru7sloHIwFGhxf+p5FQ9EnoFYpcYbalhvMqk2AGwUeUvD6
	MmG9PRjCspkEr5lpf6pV5PUcTNOPjFfNlm5Nczyrhf35lKPaLrUHJ0WxBwawK3vB
	aU7W6WqHKx5d88E4SMAUwv43J4ReL4mDTcnWPGL8Jj9sV/wg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj2pvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 03:42:25 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2d56a130518so987535fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 20:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746762144; x=1747366944;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnm/1NNQHQzS+5KgXFHV89UXfzv01MUWVdbnyxFFSYY=;
        b=ENfhoLZA1+iNWIeK2SIMJ7ZxhYKt/X0EuWVJ/Hqqh2QqUfe2YURuamZnZWR1m/t9l6
         Gre+SLp86CUmpWvcR8iDCyy9/099X2sNuY86feqbcUjfwOJ5BtDxHFG1MXi9xABipaYP
         etr38JJkYudnVSr5Fs7NbZFTjLFBOVr2an1sOKteL5btZ+8Uo6oX0+1NOMKEHFJhI0QD
         dzt40c/qsllPDwa0xleGFYxT1hQgXpCN7z4g0nY16qK5J0R/U8YjwvwlDwnTFC7eQ2ck
         mvv/76g6ijNCvXWNaLGppf7qUqFskvYd5hJg46ljwQF9j/dAuv+yAJP7vW6X4YvxQV1U
         RoBA==
X-Gm-Message-State: AOJu0YwS27FusWQNZj1nRwdY+3uZOmSH+JOb/QwEr+JZmAzOssGF02pY
	TYZdOvwVpteQmin336UJ/6mC5lwd+oxeCQiYH8WoU2S3hU3SP/gvPU7x5Ruz7K0PTL5MksDekF5
	FoOesf18XAba888UhQvbomOMxYpCAwh3JsrL5HZv722bUCgu5muOlrfRl5oz2ufm3vrnSz+JxFk
	M=
X-Gm-Gg: ASbGnct2gMqfOXiuHj16PWHTsuGSQlkyyIiasUwf4Vca84cxa4rmqxRvGUwtnj4PyPn
	Vz6BmaxADW1VGrsLS1v6r8eFFWXxFM1VohhirZlRWMPMHf3RDZpi9P+rkmKKn4Czl8MCh+eDpAc
	nTPFcU+0IvtUgOsmGYWJO6o+61XhEi8+kdegLcLTmt9OAqqcKSRje5P+OUP1WsWanBOErL90/3/
	RBaDrgeJYoTCpZXWk4FUxVR19bkvx+RErCh6jKSE+o+W0nls+mJKxBB5r3XKExxZpnHgaLl2gIb
	bUjjrkxGHgU6RGs+BbdEzlVAjvfZZCQhg6hkjMZAh8PFy46JKiTTHUJ5ago9h5FGGm+A/0ilin1
	F5BH1wTbhE9I=
X-Received: by 2002:a05:6870:2424:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2dba4539eeemr1301863fac.32.1746762144324;
        Thu, 08 May 2025 20:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2z/ccPjX7xVeb3Gs+VE0BigXfTN6YDg1rdY/7QL1Q+e7Hif44KSYlWeHm/Rn9mjg2R6TUvQ==
X-Received: by 2002:a05:6870:2424:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2dba4539eeemr1301854fac.32.1746762143844;
        Thu, 08 May 2025 20:42:23 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0619ee9sm455944fac.6.2025.05.08.20.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 20:42:23 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 08 May 2025 22:42:11 -0500
Subject: [PATCH v2] usb: dwc3: qcom: Use bulk clock API and devres
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-dwc3-clk-bulk-v2-1-bad3427e88d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJJ5HWgC/3WMyw6CMBQFf4XctSV9KdaV/2FYlLZII1BtpWpI/
 90rezeTzEnOrJBc9C7BqVohuuyTDzMK31VgBj1fHfEWHTjleyo5J/ZlBDHjjXQLQh2oVsxZqbs
 j4OceXe/fW+/Sog8+PUP8bPnMfuu/UmaEEdGYxijJhKD9OaRUPxY9mjBNNQLaUsoXCgNxSrEAA
 AA=
X-Change-ID: 20250422-dwc3-clk-bulk-960a91ed4ab8
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5711;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=teynXbjo1NoamMkz/mK3yn4mJtFEC0NTXW1tybV/syA=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoHXmeX6e59IWTXzyCaequW0oBZGH8BH3WxXVBn
 BGQudD41F2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaB15nhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWtrRAA1zBxybIzbMPR6uGtye4OcjT3/paWMzjuweplVkR
 LIPKFQkYEin+BkCFXPBaAZep9SUZkCmHka6xapTClnFoc3ZbD5CBxmqqZ79Anar/wKwYIWxaMYa
 YbrSafd5QWq/ln/xMSeUGwRikwq8o13acqrhRXKemLU3b2e/wv2D2lWvK40G7CGKbkjxHJqVEDJ
 El0/vwkyprHKfCgxaESOCh2VdxPFgdLQKDkHbv0NKHQeKEQ2Zt4lAcW0mpmrcCJnGWTfn3V9O/F
 UiwDOTNaj2h39ZY6jKzn3WuDqMFsNStrPqslVlzbIwgMfNig8GPCSeQ+KBugae0N74iz3+gioZ6
 ggi2AsGTDCg2qDVVTahgAjVaCy0Wdh2H2ZErxpgiSG+XW091qr7Eoing744Og9pzuSf1yBN9FDd
 PCVSjEmLPjDw7dIu6fOBqmecvUlW7q3im9xjkkdp4FTR+dd87fyZEQpmkYecLidSwgRD9XnY6Vj
 55oOV170Zs9KirgKscGEHx+tKmk9lv4mU8oKrrLTkQx0M2ytfV1ZXS98s0AtccvN2AG0Z+mdj6h
 38vANyILaQXe4+qHGQ2MSbwmfGXnT8jGyv8NTyoj22Bdgh6VALSKtOsrAu8ywvKujIeBZznulcp
 I72RQY8j+c66Bmhxp9pCt4ZpRyYszk30YdVSpdmY4uK0=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681d79a1 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rTIJE58-mywXzjlQImAA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDAzMyBTYWx0ZWRfX6aCmLzzDu0lf
 8cBqirOOgwPB9RaXKqGZM9Lp7IO8Qy7BEaDYOZugzVaEQypmTM/mOYbjoRF8bkv728WszlvA6ZA
 8cegSLf5jssrP/5HS9CRUGX+jWIruRgoT9tnZVobJsbOawfp/oYWIxATeEDkLA6nzI9eZb7c377
 SRVin+zsG7y3trTfb9giuX53lIgfRFCjEM6ZYPbRnD8nkHBlBf7UjLtbHQEaXPPMlPJ5WISpov0
 IZYvxmU4SThoTVN2KVX5Z2+3rwLFyVQQOebH5ZR6pNYJTXxUtChQ12w+bDB6UFtUojVa9ZCPGwu
 8BRh407KS6t4mOhSmH1gDOWzlan7EZB6pNpPnXvmc+RQ/jKTkZOI2YqENDHuHCBUpXFLIXrZnIK
 JtjNLcoudiG3rTSfiDTrnPfY3uIr5tjXT60XTAT+jj+MhpvQBWhC1xEqA3OQiP2gDu27sLOq
X-Proofpoint-GUID: ft7F0JgOm0QB6Q48ejXUOTvrZYe5JdOG
X-Proofpoint-ORIG-GUID: ft7F0JgOm0QB6Q48ejXUOTvrZYe5JdOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090033

The Qualcomm DWC3 glue driver duplicates the logic of the bulk clock
API to acquire, prepare, and unprepare the controller's clocks. It also
manages the life cycle of these handled explicitly.

Transition to the bulk clock API and manage the resources using devres,
to clean up the code. The resource acquisition is moved above the
initial reset pulse, to handle resource issues before the state is
touched - other than this, this no functional change.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Actually call clk_bulk_prepare_enable()...
- Moved the resource acquisition above the initial reset pulse (but
  keeping the prepare in it's current place)
- Link to v1: https://lore.kernel.org/r/20250422-dwc3-clk-bulk-v1-1-37c7c941330f@oss.qualcomm.com
---
 drivers/usb/dwc3/dwc3-qcom.c | 90 ++++++++------------------------------------
 1 file changed, 15 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 20c00ba3bc3d29dfe1e11e38dedea0c94aaa6a81..7334de85ad10c7f680a794bd7818f1802b130440 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -73,7 +73,7 @@ struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
 	struct dwc3		dwc;
-	struct clk		**clks;
+	struct clk_bulk_data	*clks;
 	int			num_clocks;
 	struct reset_control	*resets;
 	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
@@ -431,9 +431,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
 	}
-
-	for (i = qcom->num_clocks - 1; i >= 0; i--)
-		clk_disable_unprepare(qcom->clks[i]);
+	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	ret = dwc3_qcom_interconnect_disable(qcom);
 	if (ret)
@@ -465,14 +463,9 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-	for (i = 0; i < qcom->num_clocks; i++) {
-		ret = clk_prepare_enable(qcom->clks[i]);
-		if (ret < 0) {
-			while (--i >= 0)
-				clk_disable_unprepare(qcom->clks[i]);
-			return ret;
-		}
-	}
+	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+	if (ret < 0)
+		return ret;
 
 	ret = dwc3_qcom_interconnect_enable(qcom);
 	if (ret)
@@ -648,62 +641,14 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 	return 0;
 }
 
-static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
-{
-	struct device		*dev = qcom->dev;
-	struct device_node	*np = dev->of_node;
-	int			i;
-
-	if (!np || !count)
-		return 0;
-
-	if (count < 0)
-		return count;
-
-	qcom->num_clocks = count;
-
-	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
-				  sizeof(struct clk *), GFP_KERNEL);
-	if (!qcom->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < qcom->num_clocks; i++) {
-		struct clk	*clk;
-		int		ret;
-
-		clk = of_clk_get(np, i);
-		if (IS_ERR(clk)) {
-			while (--i >= 0)
-				clk_put(qcom->clks[i]);
-			return PTR_ERR(clk);
-		}
-
-		ret = clk_prepare_enable(clk);
-		if (ret < 0) {
-			while (--i >= 0) {
-				clk_disable_unprepare(qcom->clks[i]);
-				clk_put(qcom->clks[i]);
-			}
-			clk_put(clk);
-
-			return ret;
-		}
-
-		qcom->clks[i] = clk;
-	}
-
-	return 0;
-}
-
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
-	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
 	struct resource		res;
 	struct resource		*r;
-	int			ret, i;
+	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
@@ -719,6 +664,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 				     "failed to get resets\n");
 	}
 
+	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	qcom->num_clocks = ret;
+
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
@@ -733,11 +683,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto reset_assert;
 	}
 
-	ret = dwc3_qcom_clk_init(qcom, of_clk_get_parent_count(np));
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to get clocks\n");
+	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+	if (ret < 0)
 		goto reset_assert;
-	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -806,10 +754,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
-	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-		clk_disable_unprepare(qcom->clks[i]);
-		clk_put(qcom->clks[i]);
-	}
+	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 reset_assert:
 	reset_control_assert(qcom->resets);
 
@@ -820,15 +765,10 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 {
 	struct dwc3 *dwc = platform_get_drvdata(pdev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	int i;
 
 	dwc3_core_remove(&qcom->dwc);
 
-	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-		clk_disable_unprepare(qcom->clks[i]);
-		clk_put(qcom->clks[i]);
-	}
-	qcom->num_clocks = 0;
+	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	dwc3_qcom_interconnect_exit(qcom);
 	reset_control_assert(qcom->resets);

---
base-commit: f48887a98b78880b7711aca311fbbbcaad6c4e3b
change-id: 20250422-dwc3-clk-bulk-960a91ed4ab8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


