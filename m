Return-Path: <linux-arm-msm+bounces-88112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2356D0496E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88E4B325232F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539DB5695;
	Thu,  8 Jan 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO9sew6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7HSXfMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9792BB13
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887401; cv=none; b=WKS2uO4L67QYeCvJa6qO36kTxcUQ7pSXxP7O9Z3JzCwvPPT9QBMqskG3mJpAfVFOr84SjQ5fU/BesX7OKojQHXGxS+xN43cGgpO8PxqSF76E+gEoNmqez+CbK/RhT/5bfhcwUX/glzhHm+rbindiixSDX157UuVfKf+vPEzs4Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887401; c=relaxed/simple;
	bh=wgtqtNbOQ3L4Ft9Ij4OSw61++5pf1V/FrZA8leMP5aU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UI6g++VreNExWME4QTSl+YSCgbYPJ7Zq0YXaEvEoLx6D4QdDzopE7T3tYr7WOWqU3DxGajSfL+yWDhfe+G0CTD97IieKX+PVRKSfqwkcQ48JLvGvVgMT0RJ8FVBHWxxuHnog91ROxq0VlqSCBz6XhKPSMTotoN8OcGv/CEwv3gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO9sew6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7HSXfMw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608AhvP83701055
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 15:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGj3MkqcxtU
	TDSrI4Rmkz74Y1sawdJtCFGQ8AyJsOnU=; b=SO9sew6Og8MhLbIG+QADVvNDIdo
	LJxIAofT9zNhV78i4OW7Rfl8fC1ZDV2us4OmMOAEDSFc6fkNKbsb6OwBfG/j7Eyv
	DHbhZrgIetn/b/9SL7VVF8x7/FymgXUTgk40TAL9ErYb5cXvduT60ySlTclrlgG8
	6gOmZu4AnCJSdYPEb+cRtkIKv3GtqXHY4HAij4Q3WdSDH+11fExjq7JJr9zZxl+H
	4xXIl/9+7ZV5DLWPVj4VDoMa4ypsAU/hheTOOH31aSPFll5Q7Yo6LoCzwO2Ctmn2
	DtSbrDAC6N0p63bfbGPtot5EZihN17xjamfiphcnE2+ZxOfM010Sf9D85BA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39rw1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 15:49:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so880583785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 07:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767887398; x=1768492198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGj3MkqcxtUTDSrI4Rmkz74Y1sawdJtCFGQ8AyJsOnU=;
        b=R7HSXfMwnmEd35s8SmS9Ul5hFEICIAZ6tux/8bupuYxmPYG691PI+jgLeg9unnfW6Y
         HcQdmsBC8JhPOFKb6QgXOJsdZD/Uqpudw+cf42vAJRvuzTdkdjcVXN03SzI8VnTb+G7Q
         x4duE76ZY7HI+DrHoBpT93d583nu8qN0JbQf8jfqxXfnYbBdl7GDplJEYTNU2MCR5VOk
         pgpQwTr1c7JoyfgOwU2SSSkvXCTzPfbc3j57DYoQXFVyGy4lQAwwgecd3SujRIrRFVhd
         LEXHwD7iCZahW632i59jOVnmtv3AX+88Oq56t8yoAFAlWTpJOvuhi7pk2JK/QPgxsMc5
         bD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887398; x=1768492198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IGj3MkqcxtUTDSrI4Rmkz74Y1sawdJtCFGQ8AyJsOnU=;
        b=duiP+CywYn6aKtAKy2A42WpB1AuwnUA6zGBgIp1r3okwKBL4PJBbeJlfPIo1/qqEG6
         udXUM+POhc1PTd4NpqYMRMsd1hdnwgvWJPtOd8oe4bRxbKUfjCFqjHPTxbNKn9k7beS2
         8+H2Xcz/VXft7a0Y/7ck5HHMOKDGAljvAu18Kd0PW0PP1+QZ3tNpNQ9bMjKSHTU98XR/
         aO2AY03AgtAvCde78RMwfTAPMOa87OPpHhw5InF+KyJl4E1PjYSrZKZBg/2bX6Gx5/Q+
         zWtSw7WSLHjpWwGSKOZLRZOF7dhD0pOVoG7/hho6a6nQjJUsmMyJp4pfx7x3jQ/dRGMC
         pvXA==
X-Gm-Message-State: AOJu0YxblKTjt73rRP4sAVF/f/Xr5PenAurUI+B9C07uez6e2WbcfSFX
	G6F+F0yL0FaoYmqCdESM69pZvPciLFecbCvvwcRHaWLHN/wR7W58ZEPhJOAn/CzBvEsKL3+1ocz
	uA2SVb40LYf5Tl8cUcEciVm5I8ANjoqtJyAhe9JbuYi6HWDTJ3lQMXF4C4Y9/KBqB7HiR
X-Gm-Gg: AY/fxX4KJPEmJG/t6r3JdgZLLN3fYBRQN+GUUo82ybsTbJBcUFspkg5slPC/I3+gOqI
	5vyoyoGZHhOBUwsdCjW8vs4q3uSJjsjNDk3vbptJhGPdwHgmi3qMHxPiQafBnzmdxxz4iQ6/EK9
	an9OJWbI/myE/RC1rtdCKPCu8rYIIHqaxCg7Fe/ZoVqfsFfw92rBkgrJaTL7h6fkD7lenHTt/EP
	iTUfqsc/GlUq9T0St7wmUsn6L74FjWjsztVpmTHMQhf8rv/Urg5+JPtXTySXanVZa9Zr3N2FzVM
	N/Vxq42NyQ3f0xWgDTJnKKi6gkIQzkG/c9HhNe0j9RzdHrkZ6tjts9iSdtenuxVewSy01ZanUOh
	S6nL9aB5KS+miy34QTErmTESEQVhIrtyFCc1DFBLWhbjMUaKQmH9AnF4ntq0Q1LwYjHk7tNdUe8
	3U
X-Received: by 2002:a05:620a:2956:b0:891:bde8:56d7 with SMTP id af79cd13be357-8c3893ef6f4mr841581485a.50.1767887397746;
        Thu, 08 Jan 2026 07:49:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGrnZlCZbSHuOUp0nEKepu+rDoc37rvgIvRoqlQRZ6aVrhcMpOrYO/3cR9UbLcfZc15+hHoA==
X-Received: by 2002:a05:620a:2956:b0:891:bde8:56d7 with SMTP id af79cd13be357-8c3893ef6f4mr841577785a.50.1767887397307;
        Thu, 08 Jan 2026 07:49:57 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm8078121a12.17.2026.01.08.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:49:56 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 4/4] phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
Date: Thu,  8 Jan 2026 16:49:44 +0100
Message-Id: <20260108154944.211886-5-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZWz13_bhS9faGp1MBr96JbWw-dUEx1Jc
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=695fd226 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GnikDSHSz1V4xWV9RsQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExNSBTYWx0ZWRfX75q0Ia2Dx7R8
 eUddosOBcBCfJ/vt7+u6HDuQGYWFEcDL40ev7VFreQBdhTDKNe5gQBAaMqYUCDD21KU39o78NHu
 n583Su/Tlup4M6arlsAcPK4ugq+qU0LbxnVNCyUxdgO/Me7lIMNHocY+GE1WFmcTjnk8D3J3pGu
 Q8+t4nT9as7NXh5vIcrO1W/0BBRXwQtMkSqcjgnStHzciJfNuhJjSCeMRL2lP2G2/1hzkJALas4
 kdfRVGnWTYWduk8fy8ZS+X5slkMzdn10Lq9tyLk+a7DJYPDKyCsrZYiqRi29AM6Vk4qQgOUAJaH
 KhcNWmAlWFZFRRDrsqRUzZlnxCJWWyzLkPYV2AN2V1o+FDo1G+oPKo7ck2/wmgaoT03VyOHsW8h
 m2xCOQYESuy7Tk6OXiRG5Kyk7iDhie+Nbs1xpShVHHhTfp74AT/x6oU4Prk1qDZ4igO2PFwOJYj
 td2vp6UIzlV8lv+ljsQ==
X-Proofpoint-ORIG-GUID: ZWz13_bhS9faGp1MBr96JbWw-dUEx1Jc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080115

Enabling runtime PM before attaching the hsphy instance as driver data
can lead to a NULL pointer dereference in runtime PM callbacks that
expect valid driver data. There is a small window where the suspend
callback may run after PM runtime enabling and before runtime forbid.

Attach the hsphy instance as driver data before enabling runtime PM to
prevent NULL pointer dereference in runtime PM callbacks.

Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
short window where an unnecessary runtime suspend can occur.

Use the devres-managed version to ensure PM runtime is symmetrically
disabled during driver removal for proper cleanup.

Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e..d1288a6c202e 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -599,13 +599,17 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	dev_set_drvdata(dev, hsphy);
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
 
 	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
 	if (IS_ERR(generic_phy)) {
@@ -615,15 +619,12 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	}
 	hsphy->phy = generic_phy;
 
-	dev_set_drvdata(dev, hsphy);
 	phy_set_drvdata(generic_phy, hsphy);
 	qcom_snps_hsphy_read_override_param_seq(dev);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
-	else
-		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
-- 
2.34.1


