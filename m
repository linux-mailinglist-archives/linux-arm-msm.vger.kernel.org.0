Return-Path: <linux-arm-msm+bounces-69724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B54B2BEE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AFE05231DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8CA322A00;
	Tue, 19 Aug 2025 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgRXPRg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69306322550
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599279; cv=none; b=k698Q4aoLEjoNqxx9XVee7knvNMBqjhR5fOAsLyqGFd3XjINT7K4GSwipjCGEPOaErUPF7AxexIqi+ifoBSPbkWJlCHE/VFvfftvlnIU50c5534CJy1uMTW9LcH0jli4e7fN0G2+zBpH4cHHnWZ9loAnMVOMseU9U1WiR38DVHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599279; c=relaxed/simple;
	bh=aeb1HeIqyluMB5Tc3xSFFSxmbMvpqRevsC6opdMzqIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSWohj+5T7oDORAEHOXvDD9lNl+fxbfKu8Crfcqrry3ASUByMR9oacaMrwfRwx+xWDXqrHRQgpgr2ImexL39RnqdkTlF8qr5f18X4E0jrqGKn3ftbooAZwgd1nxs1W6+g8RV4Q9KSYPAcucyPMiwaYGa1sU3XRxGDZ502hlifqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgRXPRg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90WUG027823
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+qsoxEYY18mT+CkjNKfZowUvZ+FdImgNxba8OIq4rg=; b=CgRXPRg6ua8etHru
	KaOK84emkqdNBHG72yoi+fz74E2bkKu36T3AQY5W1RxGrW1FT/VtHUxpDgnydBoE
	DSerWDaTUCjvfAgdGONcCXKcXnfq5JbhYlQFXF5v7oTfsziXGlpwR3NVo3iR1sqB
	9UvCI3MFBJQ4eGW8mmoZLnLRJDn5CclMEyds+Xf7wR1/Xj/2/SrOkTE1aDeq03Tv
	Z0STm9KdzXHUyJKQmbdZBSysf4VSd9vYwPv/uJyH8AY2/aYqsRW8YDxCj09fDOs9
	Hupwea6omyOfG0AlpVjZmp7yeZhSfsV5kOLT9zeYDTcDT2b3RkbRMkfWj2Hs50/P
	Chvmzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtgcar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:27:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326789e09so10192341a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599277; x=1756204077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+qsoxEYY18mT+CkjNKfZowUvZ+FdImgNxba8OIq4rg=;
        b=B3EhfqEkUL+BLdnxxLGNTeibKtA+e/V4QFh1h5iZMzLnyRVBfs6MTQ+c6TY9ayN91v
         44hQBLeCUHLpcqupFBz+QbFxW4O/1nmktvkI69mcpNvboSks5oAL2qWyLT+w0hGcBjjW
         K6XadgY63XNkJ5jP3VaMSqM5kEgJeWmSxFEbgghQnmcg7k8OAEhmXmPtrbSt1yVLcZLt
         OpiNyvxvjWurlnZ3RvnQ75zxb71QWHLMSP39FvYnvuSn9NY/fM9C+hUnWa/yGubGUEXE
         SApY0aGkuNr7g07Zrd1TvYnaIQIbMPVL0T7lRA1lZM0/wTX4ZxDkvC5ODye7LockILNf
         jZSA==
X-Forwarded-Encrypted: i=1; AJvYcCVTtcQHjFZKHzaKNVhKhnwt6lbYc9ePNlDHWfciQHiaBv2+Sq8wsXbnwxqukMUvUohSkHEoZoV99kSzl648@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFvEouKZco/16fUucrxrQ8kca/3ckn4Qon49lZrfieIN24Jal
	R3vkBMDicp33LyaO+lInC/pNjzVd1Xt+HjPoEQsc2vf2zddaEfbLkfIT3zgoadZxRofsuXcalps
	G4UsQLh57whwoFlOb1vv52aDFKexOa/5Gwi1DkGfVs0uT6BSq1zs6UGxyOInbw728FR3K
X-Gm-Gg: ASbGnctBpuNtpWfLoQ537qwcGa3c9dUFV9OQLJTIy9OP/RNCOwbz9wjxMNApB+mVnrW
	wjE1zpyY0r7gOt/ZuVrMiMg8t5JLaGhCRvnrYaCG6/iKTes2BH7LpTdeTFZtjojuWQeTPF4MPgh
	/mTzMCrcjbqq/oqxaiOy1N6EpTnhydDZzy0a3NnKhP5dd1BbivVqgUuBFagRck8xJjfbB9rRX3k
	NFfU0doNdS19dLSWzPI4JbaPUubxughzHvRD8PsZJuDhvE56cr0H7QrnxHwkEEwEQAzrhldyVMF
	EH9wOzH/xT0swDjnbrjfj3p8W29Qo9nb4TuFwuCjsXX8qKCIS+1la5SA1Y1OS8Y0p9bjI17Hq68
	1+nv0r4yvfHtd5innuRYb0g==
X-Received: by 2002:a17:90b:224d:b0:323:7e80:23e3 with SMTP id 98e67ed59e1d1-32476ab8382mr2941636a91.36.1755599276658;
        Tue, 19 Aug 2025 03:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXJDwBsD8GSfAUtZj4btl83QcxNgu3y5FrH+g2NMjl/MsNUZaffIO4c6+IrNg1Dkk3M4rs9w==
X-Received: by 2002:a17:90b:224d:b0:323:7e80:23e3 with SMTP id 98e67ed59e1d1-32476ab8382mr2941594a91.36.1755599276086;
        Tue, 19 Aug 2025 03:27:56 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3eef8fsm2499643a91.18.2025.08.19.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:27:55 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 03:27:45 -0700
Subject: [PATCH v2 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-itnoc-v2-3-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755599271; l=1698;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=aeb1HeIqyluMB5Tc3xSFFSxmbMvpqRevsC6opdMzqIE=;
 b=7Xr7Ler6KXi3Pi0R7YwkGnLWV3b2IUBIUyPeg9SgySlabcH0jxo4isQ1KyhuLimOBIhhRYOFf
 DFE+AHOldXoAV6KvsAzhjEoB2OXbdZ80vGWw7qdS4ZLpis0fHUGAfTQ
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: HACeu4-Zk2i-qN3PUIvruG5KG-NlcXpb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX80ppdvnuTAKI
 c2bU0b0q6dvR07R/RDxoP/jo5K3icwvrbcA2Zz8gUaWxGmiUBDpv7GxZ9XnPyCf90ieSLhd/nc/
 7/Q1P+urL/5QDcNlHCSDgtNg4mwChjzEvfVM3IOC4gXOvbL1h2q7g9NbZDaeH1sgzECqQnYYl0D
 X3l6p0Vp/y3cZ6uDkjXQ/5g/uK90RwxTHfRU2KcJ98M5JM9RXrO1aOLcoB818MMVfvfWxwOYyMt
 jHHdcZ85hB8Fe9RiFB+JFWx19lNu2uV0X49pgdVJax0+eExZZwJSjZoFOpSifv4dCqb8eMtP3fv
 ZE6KYR0spM0SSvX76FspmHCR2YE/UTU8NyvASZdvV94XZim3qDxabpm0efSaB91Yx04VWEM306C
 BZf8Gd6Z
X-Proofpoint-GUID: HACeu4-Zk2i-qN3PUIvruG5KG-NlcXpb
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a451ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qearADheJa7ujHrKWl4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

This patch adds runtime power management support for platform-based
CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
resume callbacks to manage the APB clock (`pclk`) during device runtime
transitions.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 407595e893096d8011dfcefd74cca742d9b96695..d57de1ee8b1e378c76cd90faae2c45fcf4069741 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -300,6 +300,28 @@ static void itnoc_remove(struct platform_device *pdev)
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
+
+	return clk_prepare_enable(drvdata->pclk);
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
@@ -313,6 +335,7 @@ static struct platform_driver itnoc_driver = {
 		.name = "coresight-itnoc",
 		.of_match_table = itnoc_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &itnoc_dev_pm_ops,
 	},
 };
 

-- 
2.34.1


