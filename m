Return-Path: <linux-arm-msm+bounces-85072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1CACB65A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 16:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34E6E3000979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE8329BDB0;
	Thu, 11 Dec 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrlTeU4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daCf2CVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7E7261C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765467344; cv=none; b=TETO/kjjcYb7S5e+WFmqSxTtU5qsHnFN3uJ1iw3PogyiF7BmE2hSVh2fidftpLS/txB5aABDaaH9Be49r/wy7iX5XrdrxfxUYIjzFOAwaJ/C9g5Wqr2f5DDqF4/mR22cuHKLIZR2JBwoQ+x7b63p9BWfPT63gfvzK+TG3WiFLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765467344; c=relaxed/simple;
	bh=Jj8Dnvw07hrNKzF8DKQuEZ+wTGUQRFcw8xlKTEQWLrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pS/I0CGVuc7seG3Wv+7cuoPw+sZXjxsKeJxue0mfkax5ribnVKTsx2sT5sRWtwOlicrzX3uea6b72t7kqIALCe3MhTAmxdr8Xy9oiwKgiqtuDHxRHj7C/yh3toNDFriKdsH9S7luT0L2CSfRy/rvVMEm/G1f8GprAwocUqZpJ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrlTeU4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daCf2CVX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPgCV971064
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 15:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6y8CKBi0wQ25Gh4vmpE2aE4J547dSs+WP57
	qW0lmvDw=; b=SrlTeU4KpGCMsLB77ZhvE2mSRuwsNYAtmTAN+3KK2b/+qDhYm3k
	oQ/H/W/1fpXW1cMlSyP8b6YNB6FaNOQ4WEetI8Lh20af77x2HMmB/GOI6+JNY/vU
	z5ZTEE4DpV0H+MB7Djme62q6/jtr+X+9OVuoYzZP/7dicak1R+IwN7/mfCb8eeNE
	25viXMFaD8kDlQY0YgCXH4AAXClIRO7iT6MG7aSn/xY5yz7FljDAkiVJXWL8bqfE
	qzdTg4wRI/24K4KMZl29BRszrOTXOgsNQimmPzl/ktdaYRBPFdMYPqTHj1PVUxXR
	8sCkqrUsZ3c/m96Ky7wdIlTOppUp+gjAgmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvt8vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 15:35:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1b8e28fdfso3199151cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765467341; x=1766072141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6y8CKBi0wQ25Gh4vmpE2aE4J547dSs+WP57qW0lmvDw=;
        b=daCf2CVXoHHxnh4PZOWaMvHmZKiwzfgpwn1IuqmGsszcAYoauZdKz/KYODB14VAViR
         RJ5WkDUtWwmqOdaVNaAW3qB5pY5bbekjsrSykKfC7/vwW3EVFEsOc2bYt630Y29jRf7w
         s3wk/w+pQO98vOWvdm4+MLlxvUoQMM9Ttn5Aaw35RJIlMoHiBWaHC/jYeQWO0TUNgqkB
         WLw8M1iY8hpQx5aNQS1MXO7xQJI3rqnbcu/SwwToRW8TFBuvvfLlf0O49+p/AZFJ+4Z1
         OvtFwo6R3GNk8qUPqnYJvFVPeqwJt/cNig/BYrzhrHtNCBFp5XqSjA2ER9fD7n2H31CQ
         fEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765467341; x=1766072141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y8CKBi0wQ25Gh4vmpE2aE4J547dSs+WP57qW0lmvDw=;
        b=deM41P7BnH7E30gy/zEVIMWjEmm/wZXs7MVeorc9XfV9ZO+SyKPMr8jZvVr4Yf3vf0
         RyoMfG2ST706+QsomzHHk9UEOqouVxwRbe7Jec4HtTqaanG6p/4obzmq/gZgeKar49MU
         YE9z2y4JePwqAcZf+RBfdl0GEUxrtCu+LTAo9S2hOnwiR0D1Umy/lksXUR2VSMYr5bD+
         hU0wBY0lShyon321D9r+P/ibattPFE3NrBXNpWzJiYZIsib28Y4AgfAeIX9qtJWQntvt
         bOlRY5BsSxl3GPAEqnfaFQw5X6FeY5OFqmWMuQ1EQRE3fyNrpMoXhEblYIwh+UEi3p87
         wY7A==
X-Gm-Message-State: AOJu0YyQwOQ6sqSpLuT7PKxHrmN103iTZHZrCjsLFuQOd5R5Y8ck65M9
	323adCgiMCSbT/zAitTpjwAj/blDrdM6j753ehAmape6KjMhg0WqKOYnHyChlyHb7zCNP1PLkid
	43k7OO5qh0w+yq212CAQtcHWHiM+y4itbVP2TgPwqouMMp19v9lnUrmFZuxjDBeb+WepD
X-Gm-Gg: AY/fxX4bUaUPwBAVwKK0hdJVI8a2KjCxHMsjqA27jyu+pZp2YAmXjiLMwRffGpatn10
	DTKrYx9QCiQkyxuYj7tsWfyVq/znymglVSrR3Zq16ZwfoHBdDOFNcLS+H53EiZciNMOMkbIS0bf
	n09Mlu/HMQLmwLbSUhZXUiSFIvghJtqfPmpbaci2tGGJv+zTCm2NWa0PtYnfyEiQZ/l89QqARgq
	5QzFuc+jGCCH7OAWFTEGT3oEzX2DXaVftMnyPlXPCDfVXetx52EVMMq0/ClNFgBXByYTWus1HTe
	6uEOxdLWQo8NlDhKbnJ5L2Z4weY1UBKnY933Fmj0SyMbvvPhvPM7I9Q98TC62mu9RY61jKZz6h5
	TKuvTO07/H7PJY8wtxwE63IpJ9Gme5yu1E2XAitk9rIVOsBXFQGaRov8VeyXm+KIdFH7NGPDW7A
	aw
X-Received: by 2002:ac8:7d55:0:b0:4ee:222b:660a with SMTP id d75a77b69052e-4f1b1ae552bmr83972861cf.76.1765467340591;
        Thu, 11 Dec 2025 07:35:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2mj16xRxgy8PDBOrzAmeAA2nbv25/fqYa2cwEcsz/g/ZOHEERMQ/ZBFPUOi6WJbT3s8xOnw==
X-Received: by 2002:ac8:7d55:0:b0:4ee:222b:660a with SMTP id d75a77b69052e-4f1b1ae552bmr83972441cf.76.1765467340126;
        Thu, 11 Dec 2025 07:35:40 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:85ae:5e15:f198:7755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8a841sm6644305f8f.30.2025.12.11.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:35:39 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
Date: Thu, 11 Dec 2025 16:35:36 +0100
Message-Id: <20251211153536.1880258-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEyNCBTYWx0ZWRfXwggQYz6/pBpS
 mBInHxoX54UtJwNr/P6INQE2UR/J7TallFBdIRMibfRmZvnICi26/tGMWNCoaovVZwVJ4Y/4yZQ
 itHIU7ocqcKjwHlHx/pXrLln98EF3rpuFQZZPc4X0U2+PPSIy9QrxQxkZYAvZO/Ika1+MCW+lke
 X1X2KHY0YBFnQmJ6Nh2DcrxOUKIUWZcrF3m4y02lIUeVqnTJLQYYqQ49N+lNmvGm+Aoby2LXHy2
 HWwHVwZqmJIihm7w1Jn2wukVVx4FvdtYoX4N1+g0qX/0Lk0Vl6St2E28rkG9WLFOMKqz7Zdm8Dn
 8tG9uF3tqwSMpfYYv/1kFKa0L6FXzEkcLSyb5d7E+MEkCvx5/OT/omeIhWJJFMKgew9+QdU4tql
 aVLsklBvMiJi6+MVn9a3m1uSfOlMIw==
X-Proofpoint-GUID: vPQHHUvIGrEagaONrEDiI3wIhnecS9EU
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693ae4cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=A460xltCzdekeuk-sJYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: vPQHHUvIGrEagaONrEDiI3wIhnecS9EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110124

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

Attach the QPHY instance as driver data before enabling runtime PM to
prevent NULL pointer dereference in runtime PM callbacks.

Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 v3: The phy-core expects parent's runtime-pm to be setup before creating
     the phy, so move back runtime-pm to its initial location and
     relocate dev_set_drvdata() instead.

 v2: Move runtime-pm enabling after dev_set_drvdata
     use devm_pm_runtime_enable() to fix unbalanced enabling on removal
     reword commit message

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b5514a32ff8f..6386d834b0e4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1093,29 +1093,27 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 		or->hsdisc_trim.override = true;
 	}
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	dev_set_drvdata(dev, qphy);
+
 	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
 	 */
+	pm_runtime_set_active(dev);
 	pm_runtime_forbid(dev);
+	devm_pm_runtime_enable(dev);
 
 	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
 		dev_err(dev, "failed to create phy, %d\n", ret);
-		pm_runtime_disable(dev);
 		return ret;
 	}
 	qphy->phy = generic_phy;
 
-	dev_set_drvdata(dev, qphy);
 	phy_set_drvdata(generic_phy, qphy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
-- 
2.34.1


