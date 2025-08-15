Return-Path: <linux-arm-msm+bounces-69363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E7B28084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A99608581
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 13:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BBD303CAA;
	Fri, 15 Aug 2025 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1ksNejU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB930277B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755263915; cv=none; b=C/C2WvrbutTPBWQ6K1zeNjLvtj5b81VLbSQ3NUlOd7vui0XMZ4kf4/Sem7prRQP3F2b9/zDvWHnq7lN9RqqQ10YtrnB7txM9mbo21U3HACHEYG5Goh4oBj652Jp6bL5Ts1McAeDbkwuy22eYxgeDq7IryIV9VC/2y/I18eMg9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755263915; c=relaxed/simple;
	bh=VoTULuM+qkKhtoH0VvVKv4xTl4Eg+ARh+llu8sbZdVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+VVPR27y1rgdLo9uMeGlRc5ut86bRVAXSPDWvlkdGELnv409nYXyM7ZdAdnsbXG0oyo9BipiSrtaoPiUfqR5Fwq5UM/nl3dCV+oU+2BX6bEl95DWRVHAZjczifKaYh+/eHKxBSZEju0ZSz4AzK7BhH9RRYPAilDUeSLNSA35Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1ksNejU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9m4QE005945
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQ39sVnBu3AnUGDBD9Y+etDVOR4WonIweoaJdoEd/3o=; b=B1ksNejU1/oTR2bI
	IyTfE8LLxAO8brGS6HftzkFm+AcA6HK1lhqW2ds10RpuyV5kyJSYtPM6KTSVRAMn
	fqaWW83itbGukW7+hPxAzSjr5sFt1lS9vkMd3w6I3wfjs6BfI9lMDBbAmOq3MQrc
	LWjH9biFw5rNdx2uH4GyUKuGjvc7yCHyLz3Oq8BH8ajwBpj+izI4XL1rKPiXlZ11
	XxbjWQCRNQ2/AbFzpA2Q0tFa+I4PjbNyKCsyHBLRtwKYnzvGoiic7uAL9MYyXbvC
	R/PWYNv+LazIN/xNFn1bHrKKRvo7ovA+JvpZ6TUUtfkY8V0je3GZ7yJM3RJ+jO3X
	IpuOMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk1fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e8e74cdso1537185b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 06:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263912; x=1755868712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ39sVnBu3AnUGDBD9Y+etDVOR4WonIweoaJdoEd/3o=;
        b=Qr5nwtTTRuQcp256RKp04w+jbI1xtDXQRbCYJk7QVi4cJeeLiAg6+5HosvrWIGelfM
         y0iW+/kDM3TzpdDcOixgYrvB9oVZCie/MFqzhB+FpCMDpkK5Sgip90bwb4b1D3SAySGv
         D9SfpybfunSI5IYJtjL9TyD4Wtbro5E9IIZH3hA4deQCMD++/q7x7c5nNfjX8rwmFW2Z
         /ovLMDNqZIqX+HlBiiY4qBJKAVM+OEj0X+QwT83R8o1Lh8WiDij9jDJf1FwR35hHjNkW
         bm8g07VxLWsbGvKl1R7Y5mp0HNQEXCwNyiTOiV3GKhPEgq01HXJl60eN3O8YwQDaZQFo
         FREQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMGm+rEl8QaCF16NWdGkRUGmz+bYuUN/3e2aThv9tEbNUnIZCyz1EOnIhXt56T4PVpB9+YbiLc5AdDHN6R@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwuk2o00b4LfaRdLHQfzWh1HHOjBhsfMOvMROTe3WvlEENkFYm
	totWx8GIROPHDGISfxOeSMvdSY4NIw8RTB3Rgd5LvCvLUZ2cF7Tzi2SpiHxtR2MFgJ5mmHIrgKp
	nSbtQHaN2G5GUxp+G/UHy7PaBGb6F5oC/xkQWhx35scQhzdvt9ErXQCgs6DUywR20JjaeJUCTft
	DTyVA=
X-Gm-Gg: ASbGncsaQR/mm131pI6cCZNZydo15epjflNB2LNh/wdhx01C4f3eOGuNJ6oFs+uHn68
	qxAvegVMKJRxavsrcgB9amDav7BRl+R5ipvozfmPV71v4zKTgBbgkQl4bhtqCqaTd7B7Fb+kGnl
	ZA7jzJYVpY1FXuOGBrsTTNMvjGesj1nGotIpzk17BpmEkV2MPeMUk0+U609P8eUWI5rNvkuMAR9
	mPyeuB9S1Rg3TE4cxhJ/4OS+X3YGxQWUiFbosLLi0ASbbCuXgJhHRMQzVIQOfDpz9hObaZmeecI
	8OUTWcUz911yw9jFs3MZ5MoSdRV63RYpKypFz2lJD8XfsO3dhHKfvjCLrX42EbJHh9LcsG+lq1w
	r5smJAiavDWls41dEqQAa+g==
X-Received: by 2002:a05:6a20:72a3:b0:240:1dc:490d with SMTP id adf61e73a8af0-240d2ff81cbmr2983355637.33.1755263911783;
        Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwO4qMRcWknkv/xc7pVetHC86gYOaCiXH6wSiHoLp7Gi12ttJB5qBzekm/5OTOZq+axFjvmA==
X-Received: by 2002:a05:6a20:72a3:b0:240:1dc:490d with SMTP id adf61e73a8af0-240d2ff81cbmr2983316637.33.1755263911339;
        Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:31 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:18:14 -0700
Subject: [PATCH 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
In-Reply-To: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=1712;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=VoTULuM+qkKhtoH0VvVKv4xTl4Eg+ARh+llu8sbZdVU=;
 b=MHmjSyMQH6lM1Al6lYIb9qEiX3Qzsc1kPylcTrr93fPHLt1T9KqS817xd/cNgObqMEKfE9h8q
 xkchO8pLcdeCb6jAMpw0wM3goJapo5eM5bZbfxP4fvBMDdKDJIcLZvH
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f33a8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=txXwn6EqYov8MDno8JkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX9p7gqByWBUjV
 8dB75Hks+GqdyTvUrgVsT9RvbGEsyw+HD9n1yEpbutTbj8DGdPxOoUipn5o1ymDlEaOPvDAwc0o
 7wjHCvdnFsMaNsV9JqRirFUWjSbTWAtECDMb4isTw2fduI/6sE6AaG1nI28GBblEVu+i3WIHFsm
 7BVnCrf3pZeXn2iJ1TkO9Cmsn3XPYtM11IT1cWeYKYkh7tSsG69WkLYdXzbK16JqASo/F5DDeL+
 VJ+jc6h5DbpN39iRX4Uz7B2s9N4zmvyTGSUcaiuCXB9Tc4fKnWzSuICzWC84ECb2nkiSBDYbolS
 olFoaW3eePJAsc61Hk+Kv7FCwWRrXe2Ho2DaLUxod5qwb1ACVwWiIjpjQwFSDoPRs4wIW4NLrqp
 VJOs21Gc
X-Proofpoint-GUID: 9kMvJyM59rBDKsCbQ6yP0GGAD4fsbjfN
X-Proofpoint-ORIG-GUID: 9kMvJyM59rBDKsCbQ6yP0GGAD4fsbjfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

This patch adds runtime power management support for platform-based
CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
resume callbacks to manage the APB clock (`pclk`) during device runtime
transitions.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index aa6f48d838c00d71eff22c18e34e00b93755fd82..f12a1698824bc678545319a3f482fd27e67a7352 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -270,6 +270,31 @@ static void itnoc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+#ifdef CONFIG_PM
+static int itnoc_runtime_suspend(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int itnoc_runtime_resume(struct device *dev)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+
+	return ret;
+}
+#endif
+
+static const struct dev_pm_ops itnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+};
+
 static const struct of_device_id itnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
 	{}
@@ -282,6 +307,7 @@ static struct platform_driver itnoc_driver = {
 	.driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


