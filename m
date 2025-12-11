Return-Path: <linux-arm-msm+bounces-85059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C61CB6161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88DE9300096A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72C423EA83;
	Thu, 11 Dec 2025 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8SntY7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr+cli8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0B261B9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765460923; cv=none; b=ZpqIj+bCvf5SgX7v5ZKV0QTvLvVMyTqRMmCVQ00fyKy9PRCDES89AYMXcUBauUkQ3tlc6HmJv4FOM0d89vIvFD3byKnHw1HOMh1oZaTvQ0xAY9Z6UjTRjAHoNRajrEkbcx7b8dGqJpT2StOmH/3vlhCA7OGLpTxC2FSmM+8kYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765460923; c=relaxed/simple;
	bh=rf19gk/rLQQ5iQqCPKWKDA3p8b4IZSO0JWvh3M0wflc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GVUCMCIH/RtNlZwqAE6y2v28uoyYgRowT6vJjNProEFBnjgN1sogAhc0XC+xRZCy6aoFcpJNoNfaiJkVwF4Y0oqsPBw4iBu3HF+V0m9PA3g3ARRhJl6EkgJ2JieHubMt7Djr5MzWBm5wUco9Uyd/1Iq4kAzTp2Ma09iMa8EA1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8SntY7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr+cli8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXs6c1025174
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W41T2XTGFNTe7hNaJvANiSZvGfa8LES33g7
	aIDm/jUQ=; b=e8SntY7b49hKrgyW4iDfkAqeUpwpwryP/iEEJlNoVnXBNKRBla0
	39OP4D5mdKb3S9d2x0ugvs81/UohnOTv7wnl/kdF4/N2csqZHuHXz09tHUqXN0yU
	zyQnt1KsVb7fF94h9U/AofXC2vYG539mOeyECfkuNOPp2DSgraRzRZw9mu6b1mnP
	n97WKx2SPQNDJ2sPuD7oZA2cFj5Q4K35yJ1jj5VPovH53M1lygpEeruoC+F8cAFF
	fXgvh201z2uU7xCp7edkfVPvnujGft0MJ9b9X/lRQJonRphCV496iXFpPsv6TL5s
	W+uoBYqRmn4UJclSuBhlDBNuw81gkGw2I5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpahd4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:48:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so2821821cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765460920; x=1766065720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W41T2XTGFNTe7hNaJvANiSZvGfa8LES33g7aIDm/jUQ=;
        b=Rr+cli8GV7PgebQFzDxF/XT2Fl+mlFwsSzaGpLTFRMzVUGA6We971BijfywgARgpvQ
         p2Q9yMQGgbpE7ACqiJSRBPIM+3crFg+Zb1YXJBmoddbIf3S06ep1IlBbg/SohCcNeMAE
         1eCAtWrj2fCftA+LGcSm614ms2ssO386pySJMtYHWzG4YiS9xC+Z6Rnjkgwh7jaaG03J
         MK7mFvkpGlORSg12S2k3viZqiEvwmBKVK7Ul8w776pSlGfOCrDIAaHLejNQAAHaShKdJ
         907vRACHEyKpqoMjekuHDQNE33V/K/37r/TGjlH4b/LXxdzv/dLFiH0UtwQti0dHTcB2
         giSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460920; x=1766065720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W41T2XTGFNTe7hNaJvANiSZvGfa8LES33g7aIDm/jUQ=;
        b=GJ74SkzVzopIKiHJXAvhaTN7d+gaqY8OFCYrXz8SM/7au+G9ygfSV6/HVwaHIcvtaw
         EUNWYV0B3gTN+wWHadJ/5Wi09RlUkyl6/U3Z+/3q7D7A3CWvCffSUhyr3AvhbAFNP9sl
         iqM5dbpf2Vi/bINocQ4nEktFQEQT5cnjnnCH6DbpSZ8jBLcJ2y6VhQIfVHw8qLNIVqKc
         ITOrMvndcUVa4hELwk8kYXMtGYYPEb3/ssZPcYRVBnYPF0zPgcLsA7QEYU9e+L+n14Kc
         7S059/AqP2ACzYmzctvWZYtSlVETVd65GOFebwCcBkuge1SrfpKy8Ntv0nnGgdJdWukU
         YxDA==
X-Gm-Message-State: AOJu0YyB0JZITIHYcoipKQFAuM/dNc9IxBbfLK2ynq22CkD8yE4EId4H
	87IBz3VyTNpwUiJqSE0Yt7XJS2bsLQPZXfPBV3PquSTLIqvtQ7BP5h29DLVExWyqwrH94kkG1xh
	8lxujwCyjyevGybyEb8bmgH2TUtqSNqDvzged+iszO7yrVxKSLfF4BJSFogtomEdYGHuC
X-Gm-Gg: AY/fxX7jGDj6Pz50xdtvaAPyncgC94V2CmhckdwuvMlyUtR5lCrrKIPENO7/D5obF2D
	AIE/KNbtwXhYXA0Kp4p7n4CMYwf2JF+g6jmcm7SREY8iteDCm0eVYEmCyJRcTresKBGjH0TZ2Cm
	23zKLlweI+FTXHs5lwDGFoEPihLJ/VOa/gvz4TlppXM6HrCrXM+S0gIdv92W6+ZZwSI6TR6KXkB
	qecnWQZSYJN4IOIQgATnsb1hFxSS2lUt9TNQ5cD7EFdJfj5RduFs2KDyHdB9uMo+DaLTvB15oCn
	p5MDMMgeFvGAdNy1LJVe1V+A/A9btSnrQqFJizyNTKJ9pb8TRfi3jjq6a8hqSEEz9fKmxbI64cl
	snY0ciRrUyUiaY+y4ANtkgzJM03YVIfnKplS7u4RG1XQ10K35a1PEoR6+hfH7EFu3pyhCQdH7P0
	l7
X-Received: by 2002:a05:622a:198b:b0:4ed:6ab0:bd26 with SMTP id d75a77b69052e-4f1b1b0bf93mr90695281cf.46.1765460920017;
        Thu, 11 Dec 2025 05:48:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3akSGmsW1LBDRrh/N5LqDOP69625/Xmcd+aBEDUOiijYg7EjK1IAcpqgUjpkEdoXKEFOYKw==
X-Received: by 2002:a05:622a:198b:b0:4ed:6ab0:bd26 with SMTP id d75a77b69052e-4f1b1b0bf93mr90694721cf.46.1765460919503;
        Thu, 11 Dec 2025 05:48:39 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:85ae:5e15:f198:7755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f0385asm13251475e9.18.2025.12.11.05.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:48:38 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
Date: Thu, 11 Dec 2025 14:48:36 +0100
Message-Id: <20251211134836.1777897-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i8zPw8eKyIi846F2FlZWE88LohOkcKhF
X-Proofpoint-GUID: i8zPw8eKyIi846F2FlZWE88LohOkcKhF
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693acbb8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=A460xltCzdekeuk-sJYA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwOCBTYWx0ZWRfX1qgh28ECOdQa
 rhrLHOAomQP5F+hOJTZ+fokrKPV8+Vm3q6oTdgLWElB9/sPOehjxCfoNpm9gKQW4oxZjCUapVYU
 aAc6GLW5VQayYdZz4xhCfBODrjiOxiE3pFUD2DXVKMH7AMaw0o0HHuGdyUc5Zl81it2C9VSgwMV
 aNTwX0Y/Cav764J1mQt2/ceWcdh5l8c3tHI8E+GwzGI4o4iORwcG1bZ6Shih0LodsyO2tK+rFPx
 1I3L9Cg4iHYTRU9gM4faV4dYUoSxLDVw7CDGSt+ia6YEy44NnaQqZ6qNUl4hStMLHk3zG2T1PIB
 neCI9/FTuWxLJcO8J24WRS5WmwBkSS5ysfXdojgHLh2UbLv/9zeHYuxg2dcFALeVutZE198tEwE
 /5GyOZtdu/XgA7W7YnKK+vyERvDM3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110108

Enabling runtime PM before attaching the QPHY instance as driver data
can lead to a NULL pointer dereference in runtime PM callbacks that
expect valid driver data. There is a small window where the suspend
callback may run after PM runtime enabling and before runtime forbid.
This causes a sporadic crash during boot:

```
Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
[...]
CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
Workqueue: pm pm_runtime_work
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
lr : pm_generic_runtime_suspend+0x2c/0x44
[...]
```

Enable PM runtime only after attaching the QPHY instance as driver data to
avoid a NULL pointer dereference in PM runtime callbacks.

Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 v2: Move runtime-pm enabling after dev_set_drvdata
     use devm_pm_runtime_enable() to fix unbalanced enabling on removal
     reword commit message

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b5514a32ff8f..c496acbad0bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1093,19 +1093,10 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		or->hsdisc_trim.override = true;
 	}
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
-
 	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create phy, %d\n", ret);
-		pm_runtime_disable(dev);
 		return ret;
 	}
 	qphy->phy = generic_phy;
@@ -1113,9 +1104,15 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, qphy);
 	phy_set_drvdata(generic_phy, qphy);
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
+	devm_pm_runtime_enable(dev);
+
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
-- 
2.34.1


