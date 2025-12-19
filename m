Return-Path: <linux-arm-msm+bounces-85799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA2CCF103
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B22300FE1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 08:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E194267B02;
	Fri, 19 Dec 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R028n9fi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuA6Vyq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB272E7622
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134607; cv=none; b=qBPRqyfVEdRgmlikA7jdt3Eo/LHOx2RFUSp4HN9TytMKXjQBOtWsZP/JYY3u1EkFHYh85LZ2hxDWple3ijhdjD63/H9MrkMAPnrY2MSdAhl2ImLxgZvIUWoDzaR6YR8ESWjPHppbgocfISDZeI5OBvXwnquIfvFaRKSsgD4VgFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134607; c=relaxed/simple;
	bh=ZU8CACC7fVjxFPW5oeHogxuQxDeTcqQuXcwJki5+5bU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CZjzxDgPXiKwXZTijAupoyztPK0HrJPju/3Wm3bxRVYtLdyF8aHa8U223vb+WO3XJOpZWbsu+u9R+AJ8pgt28BgCWnIAojsfmMN+wc85bXT0p7sTp27cRncFBS94AZN+Mfs3y3zCzlOrVXfg4x3pWOoevq12iq1PUuRiWI2e0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R028n9fi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuA6Vyq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cJGh3700758
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c9AdeRnv0azf+nXk5FraFWHiFxXfCZ/osx4
	6avNqI0k=; b=R028n9fi9q+AJeWk+akkv2whBJXqAiYnXWZdBikNVQPdI+TGFdl
	zpKUIpQKHrodSQ5dibcQ4K4UVrBLISCLB3ut70iwI0/ZHxLhwhp6UxJQgtqagMK1
	7Mo+Ksag2rNQU61LzPAEiC5wepxzYxJedQvELdUjnPHNdoTOBerLOkfGhgRDH4aI
	qX53ZMX0iJWGhSDva9omTlYCugIBE/ZKn12HEfTZV7n5rvXQ2N4zwS1NorksVC3j
	gvh5BwBMGulf29twe/CxBbXUNETMeWBpXTLJBSUTKaG8146Mj3TgO/C1QW2mugdh
	EzZBrZ2sH9KuM4RGHFCoxgCUboi+2NVjmzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ehxdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:56:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so34757311cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766134603; x=1766739403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9AdeRnv0azf+nXk5FraFWHiFxXfCZ/osx46avNqI0k=;
        b=JuA6Vyq2IVUvtCoBb0aqo3v+QiKYS+M+So3wngr0zsHK7f6auBxYRnqI72YzXayA6D
         Ufg/Qdicih227explVBANAuROjbTe3d+tmccO4DbHMxPwhr1z4O97mj5OlqfRv1DSbpR
         vM8S7elSlmDlwnveQlQOoy9eaDbsh/KTnFYn+5xuNKeDUF1s8KVNbfZlX8AcsUKtUE49
         O2uO5Exgijln27egmH2n2kzukv0CsyRfYrCIZrL4DZu/A8x1VZJofbXCYyZ2AfXLTt82
         hezyn+BldCa+zGGppjySuQ08H1qNNo5KK5EAVS7tQxaSj2SxNRNgKuo/mgxekPCSabZd
         70Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766134603; x=1766739403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9AdeRnv0azf+nXk5FraFWHiFxXfCZ/osx46avNqI0k=;
        b=teJdehh2c6qwNGFYP8tZsNTegtvVY+m+fgU3XXQZlOMIvu5jaCQa87k+ozS4rAu9xR
         RD+Y0A4ilWRT2lC6o+6ikPhJDiB0Rjb3F2IxboKDwQ71AB1X/egb5LGDaJBC8mEsXBq/
         veBgTu7JInGULCJBHhRDWXDCjRFTccbcdWV20kZtNHDA7ZZRm/i3g/JGOeb6OQgZBsim
         dFTBTqt/XI78sCnRMh5+NACRhtydG54vdp8hen2uctKCdorX+HOJ6b5aIoFmjLGBIskO
         kvhX0997H4tZCpHFDvxDMpI5oXWbDqaHDIQk3g6WHWm2pXwKkgWQGU/Hp90uGF9pJbDV
         tW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSx087FoVC+BwD+z1EzHw1L+t2OooLymGc8+1Y40LOrNOfPlj6lR5YIcZcybsKk7GliycnWBGv6cDnjO8J@vger.kernel.org
X-Gm-Message-State: AOJu0YwG82NGhiAtThxnj/e4VHwbMMc25C1FpXPH9DnU6Wq/fjJmcGGh
	uxJFx2cX/fiAovtDpMBZgCuwEU/vCA5PxrdTxMYU3bXVNdlg028vARcTnbS3QE3XesF2apomDNm
	z7gvneHp3ztL4c5SjWIKNSNTQ8J6OVNHWJI6ghj5F1SWPX6WfNlENolYeZU/3wRgv/tCV
X-Gm-Gg: AY/fxX664sNGsjqk+pfXUWi1WcLBoFtJUBv5e+wsnQVqmP8a0iIOKIuX3dMSlkaMxUh
	S9iWuleZlkSWsKQ/Qsoj0eIv0Li5pZ33utdjdRuAS0OSEfGddcoOa6rhmKcAshQIas93WrbOTuw
	iyacLyumiE9muSgtCNtfx/b14iOMg+EuSa8lJhEiuJweIUNm1+sBKaEzoPdcd74r1Ii1tJv0bIQ
	TsXYOXiX+Z8upiQxYvLWMq04YMSOTi768ZOx2Jdx811sSCzC6Cvy4r9n6oqoHv8rTkJDgF03eSv
	M9vyEizxD7XdQfb8N36ABNbYKrI8SPsHXx8YQP/D3jX1qmjIdgXkfrVans1DPscPj0lGHMJpcf7
	uS6t7tHDRqbMqTS70/woH0MGntSp9e6L+sX6Q2D65Imx6BlLCPuMekOsjF4xEWDb0hYUQP/4i8P
	QT
X-Received: by 2002:ac8:5f8e:0:b0:4ec:f23c:3b94 with SMTP id d75a77b69052e-4f4abd2bd0dmr29615641cf.36.1766134603484;
        Fri, 19 Dec 2025 00:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAIQVSo7Ca0U+qERUvIccMCLQAhZTbWeyO0t8y9iCJ8NjXaWEUHtMfJy6uLIe+d2YD7OQ+Lw==
X-Received: by 2002:ac8:5f8e:0:b0:4ec:f23c:3b94 with SMTP id d75a77b69052e-4f4abd2bd0dmr29615491cf.36.1766134603041;
        Fri, 19 Dec 2025 00:56:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:20ef:32c1:1968:bfa0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193522cdsm32983145e9.4.2025.12.19.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:56:42 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        andersson@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4] phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
Date: Fri, 19 Dec 2025 09:56:40 +0100
Message-Id: <20251219085640.114473-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s5OQ8tDR56TDnabG2fGR9pXTZIoSe98g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3MyBTYWx0ZWRfX7UgAMsPny94y
 o0aNkfgHsu6qtCUi/zv+iiQ3HR03HHmmsSSAM1Mtq+Sca6RCblL1iz1RWwFYXID38pP1nHaMy0x
 Majyg6brrhbMvUlSul5Db50x2Zp+sTp4nTyQhjn7sNe5xKGx65KHjMIBTdtiCNvMay165USQyPh
 mbw/ut4n1UJWUCH8+4/ZAtuMDX4Eu42zye32yY75uAXYPowd1rvWE0bFmEC29WXY2Ih/AyHrmOC
 pv0m3IYAzcgvx6HiBaWvum5qiAo/J2hLKB7Do+8rESxvgGaw9voUyRvBxuhH3UKdRLo3E8cjcbW
 0Bf6TQLurLkwK29RO1XDlu1ePmeHEVXgr+cOsV1eddinB/0u2UmmyRWfvmE5BxgF7+kKFsepLoj
 WgTBtdjQv/hEcuX+wHFgEVhirfO/YiD2Op43R2QV/HwQoInHNFKq7VaThjDJT6YVKAU9kiDQe/F
 5r9dGkt7W/1k4/CZHMA==
X-Proofpoint-ORIG-GUID: s5OQ8tDR56TDnabG2fGR9pXTZIoSe98g
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6945134c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=5BFLCExQjc_4t40VwNQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190073

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 v4: Error handling for devm_pm_runtime_enable

 v3: The phy-core expects parent's runtime-pm to be setup before creating
     the phy, so move back runtime-pm to its initial location and
     relocate dev_set_drvdata() instead.

 v2: Move runtime-pm enabling after dev_set_drvdata
     use devm_pm_runtime_enable() to fix unbalanced enabling on removal
     reword commit message

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index b5514a32ff8f..eb93015be841 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -1093,29 +1093,29 @@ static int qusb2_phy_probe(struct platform_device *pdev)
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
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
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


