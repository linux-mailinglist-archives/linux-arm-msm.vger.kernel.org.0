Return-Path: <linux-arm-msm+bounces-88109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF4D04971
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12C073242CEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B527413FEE;
	Thu,  8 Jan 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMrYvJyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCt2+MCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B186347
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887394; cv=none; b=gHc9Fzk0P8DbRmW1LlufhlnQQ78mrxz2pNF6bMcKzPQExncK1ECOAT4Pvgk6CFW6mSRnCufFDmgwFsvA0fbwmrjOAJ1kQFA+4nGwczhTcJBNIVxEoLKSaX6VtP4/6W43rjM09W5tu+RYLxiVtZMDMQlXDUsM/h5DWmXNlD930TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887394; c=relaxed/simple;
	bh=OScWgkj3OF5hKeNYUJhY6wCPrlYgV9lgXSw11iUwSGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z/9Lb2OL4N5CnkQt9W25gLqjobDwjkU3dlaUBr/J75Bl27G66bMFHGgt9e16cuHpSEQgVq90TkDkmgQQDTL2GPb3CUkb6EJOVGoCu2tnRZ/CGgSkAWUVYcttBIm5V3fQvzei99qPbsVi+Q2Vuimmw9SBQhxpO2wP6cRnHCMtRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMrYvJyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCt2+MCX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088rX2W4050660
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 15:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mPi7WwVh7AM
	5zAHZZAKTaUekPHDp3ifg72DuYVsGH08=; b=DMrYvJyVe8kGgiLqFrHgod6PANI
	P3vXyoSiARKwuOVYiDNw/+eLIxhH11PxvyiaeAp9hl68s0+Ot+PR0qyOrRv1zyOy
	qyI3Biy9HLVXxAgvYPlGmTpbk6/TCzDeBJbPSed5nFiskvICUEZdTthB2NoJXLx+
	33boMivxw7q5ezJC91iu0N9YpGsLZktQwV0t7aJvzsUx1D3E2HQU+XkIJ5QFfHP7
	U5AdtsXTfjSqZpd3uEGIIIPsa5cAzGF19wS5vGLJZebQ9LwI73fh0aEcblOnVHJB
	+JjU+p9QNB5dAyh7Axn1Uy+UwRxkVVXW7XBpKCMHTjf7V7EeMmDm2pnFI7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8jk64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 15:49:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso956420085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767887391; x=1768492191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPi7WwVh7AM5zAHZZAKTaUekPHDp3ifg72DuYVsGH08=;
        b=NCt2+MCXgOdtKfqtMHY0Ymldv2j+0jjY4chjKgBDAj+BklVqmWSr3/rZGw4aZXNb4d
         sbosY+JV5XooVBPTldSB7TI1Gb/H9aN0nNoZvbT9K6z5OgZMW8pNLMG6bAgKN/+dj+2M
         D02zCy7QNV6Bv8ps5F1yyjWf1xRe446Lh2eHqgWUdDaKWkVMOGPbBM8rLcBhyUfW+gef
         cGTylo+xDjRzzD9KjA/vm+ldIaFbg0TpUT5x0LfPblNvzJW3+MKUqgtSTyYYkkyZfYiP
         V9d68iuAscvL/5RIwyfRzePx/ruoYUhIGVcKTY5uZE19uWOA10ligm06FQo4WYzor6Mg
         VYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887391; x=1768492191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPi7WwVh7AM5zAHZZAKTaUekPHDp3ifg72DuYVsGH08=;
        b=iSd6nmJgmKKpTeH8NkMVdrEHVQXN+l4rWYmMCo/jr8JVuihJiJd7wFy3wXn9shdN3B
         aVIHYhniDnyHsNRWjcxwI2IkONr+jQ2LVgD/BEf8sYz2kyg9HxU9Kb+2P19BLuPmJumX
         4P9c07I1ynoQQBNeGmRBCyoB8wmspROrGh86covMSCxxefZ1btENRRd8TeervljmmK6R
         MPpmQSvQxngA1FmAQR7v57gBfz7lEkeJXxW6w1Kod9oy98KtBAo3fSoPD8AQb6+aK61Z
         rA/XWDXsk9coEXgofAtm4mZgJeSTCZkyARjNNG0oa8KGqWZRg9WYXBm2sDNh9QcfEEms
         rT6A==
X-Gm-Message-State: AOJu0YwKN00mHFNZ9K2IAkB7Ezg8j4dCXiZhiPgkt+3eBI7WtnAUPCGJ
	DFSV3OIpQPyYniJ8pgBFiztz1pWj1kiRLGwXYMQAbjRuJIAr+YuBxrnoyxAxlSkeIFwPq3QNYc8
	uIEAV7InWEB+luy/3XZJ3jFlnpKHiP3uf/X+uMzU6o2US/+Vg7GN26YKc2e/cZWlUJ2OvxA0Lq6
	Z4
X-Gm-Gg: AY/fxX6w7ERNtKqMp9SF+8k3/72VgckauqrfDsXX1YxLeq+nnZi0RTaPUxlBJi8unnV
	1npozi4pwpM64b02owJXQFuEDNIyBDVly2pj/RjXhlXqD1gOBimbaM6eUEBZoZVte+q84pt6whh
	zkVBLV/dmOI9V97EGEdZHJKt4vjp+icvdYJJPBGxHwKVY3Z01t8RLCggvDjPNac1/dF05y9fFLv
	iCriuY78i7cGfPGY3hdyfY2IvsIFq/54lBm4KWRoxZDBi5YJsfxg5Cvh1mc29wtO8CTYILBj3h7
	WUspU1U1uGfE1Sag3WauHCzRIaHbG+QHn9anebzjIG8B/pi42otWb/juqH0zhhpY0q5gPkTWyTx
	bL3qdvJK81xbZOnIaLBVR5WEJgpy3AlMjonypVtM0g9jkR+PtptQsB2RrWQdIANTBlw4mHP+/nR
	wy
X-Received: by 2002:a05:620a:2913:b0:8b2:dd0a:8809 with SMTP id af79cd13be357-8c38941c43bmr879265085a.89.1767887391219;
        Thu, 08 Jan 2026 07:49:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAdN3T+Sbb/38vlBbCDWm9CfEHNb4Jcrs2t956eMgt4WlO+9SKo9opCYN8eDXooskXa3h3OA==
X-Received: by 2002:a05:620a:2913:b0:8b2:dd0a:8809 with SMTP id af79cd13be357-8c38941c43bmr879260885a.89.1767887390751;
        Thu, 08 Jan 2026 07:49:50 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm8078121a12.17.2026.01.08.07.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:49:50 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/4] phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
Date: Thu,  8 Jan 2026 16:49:41 +0100
Message-Id: <20260108154944.211886-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695fd220 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5mf3qxWjPPP6ByPHwqUvpxx40_Lf5D_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNSBTYWx0ZWRfX72mP8mr8VPG9
 051ESf0Yf1FXaWKtq/rXsuoAMlE5Cv240U5dckzhsW+uSDRsd8mum23os3KS97mZkxNCjdZ/0sN
 rx5fy0mNpEqEe+bx/N3dHiK4Ds3AtywnC0izpH7PAKw/KPop9HwP+X347vzrB4YjOAK5aOREeRM
 KynCil2yygTloGxqaRBoJ++tdJnkC6gBnLz2+aUWgoZy38EPBKZqzQualA3SmF3TvraQGQQ94kN
 ZTMgYcqtCJoGRUidnOn5cfrTN61AjzIhNtmFfxoVRdlxohCifYSuNiqGoQECLFFT6bL2EXyiL2d
 1YiIw7wisWVvRh4q6Bqj+IdtErSu2/dMNyp8R5/INyHx8A1kIlr79FGklcRsv+JZ/Yg/IjFyiw7
 tv5tFmjwQfnIp1/ab+4PmVgkfJAC1Vg4At0mZxX0zoFQvoVO2HR42ZnaVFmOP5MFG3F/WcCPYha
 CrRptT1lpvswKD0jcVg==
X-Proofpoint-GUID: 5mf3qxWjPPP6ByPHwqUvpxx40_Lf5D_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080115

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d02..cea0e9f7413d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4175,15 +4175,15 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = qmp_combo_register_clocks(qmp, usb_np, dp_np);
 	if (ret)
-- 
2.34.1


