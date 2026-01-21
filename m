Return-Path: <linux-arm-msm+bounces-90038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPjgORbwcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:26:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A2159270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42FEE74A06E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5102E7F11;
	Wed, 21 Jan 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOfFH6ZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQ80iZsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9748BD51
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005727; cv=none; b=C7N0ODFcl/3Hnse2KhOA9RdRHyMwuAcrTDsWXLs0paDkrtQEbRV5pjmwrx5u4wlypP2fAHU8sPOZlk6VOM/khCINYg3CjRWioJKERJjNK7UrTlROepUL3Jgo4w3eJL0ZRfC+z7GhIQRlVkKKw5KCMJOBi63jxLanZXowN/zpcDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005727; c=relaxed/simple;
	bh=3AWTqw/ake1VJ5xqoJL7D8RpKRwm9wbQQpL2fl8/04w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kf3r3NMLgdOXebG3DpJoS2QSF5/FjOP2MbFsrlTl36SkVqh1TJBs3DSzbANK6MnvS5tqKnl3i9cGcqjrrsfen66cuVmo3NVWLTOtarc7cf8DrdmjKLJN4fIjbOVGt2znpnrsIfZiRQwlk+q+LU2W/VFAjTm6dL/Ftu8LyFtbDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOfFH6ZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQ80iZsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAnROh3319613
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fSPVEtsA0CJ
	0Je7MYOTxXGPQ+fxkp+tsaduAD/jG3ac=; b=eOfFH6ZMQhsfuHehZbcSg28oywv
	ueUQOq6e7zSABmUe+XNQMT/TUQD1aOlDFeGMYmsFRqObIuZANT5bOopj8uaQhdGD
	YJHpTs7DSWB8bS5di0ldf3e10/25fRqUixtVhdKbJbNTFyK3GgoMifym4jBnNhpU
	BnDeR5JhVAsoArjS/9h9j4OB5FyOBX+mmkbP2ksIZjt5JofJmJlDU+ZcUZpHBLfz
	eILytHws9vm4G2EjOwRZJKJKi+wXFxwYu1V6NwJjpc+JQLAlPHNYo6amMsJ1/lSG
	xAN7WHVol6n9C8G8FID7FyFp+DsyVtoj5XXJTsYyPIpeJgIDWVlLmtexpRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btwcjgmv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a5bc8c43so1491970385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005723; x=1769610523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSPVEtsA0CJ0Je7MYOTxXGPQ+fxkp+tsaduAD/jG3ac=;
        b=QQ80iZsmLDk80B+00Gwqt31F/z7zvwlAVeAzO24NTkSlU84DIHGiUhdfodCNRRiMt4
         Tsop8OtmlARLf2PXPhYLlbniI92HU8hrtpnwJw41yY0+uhHbZIw8yBVRyufBdiInSYVn
         f5+rGlLm2MC1nytTmnOXYxGMQYOFomrRoORxXZWziljVKfEJ/7EMxThZAQbqmSabyo6i
         buAFjasQ+pWu7+p/CJHsJDIzTUse3Zrxl+n4O/OjnRbCddU0Cj8dxbbf1dDTmVpqN2oC
         pcglFy1t9FVhM9DdGn3qQ0tf+jB4Vt9oLHjw7LzWJEszv4sw0P05ug86fIstAEH8+n50
         2kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005723; x=1769610523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSPVEtsA0CJ0Je7MYOTxXGPQ+fxkp+tsaduAD/jG3ac=;
        b=rYlQGy//jvaMM/zi/uq9DpgP8DadEwDD7T5zy4++VqHZ9eTRbxCNrf1jCBmRCWV5vl
         ZcDTw2WTO4ZSd/GOiyG8PycxNBGcslMkKmPAptoPEXBup60lJZhBjxLet3pJeUXWYTMM
         y59zNWnjF62JAI9DgrtOtwjV/kNtFKZSt9mtnLstJ5Obev7fUnCq3kfwUBHTwcLSu+RD
         6bCFB+XjcV3+BeKww1Itf+8EZlbkRjo//ae9KxJEwuJuEXZlfsy2Q47TdIDypP2tm9HY
         3tFIN4SCIQUy43FQTrKPF284rWbTTXCbGalN25rktHNPyvffJYdLAXaGbd6KtDKn5FjJ
         fr1A==
X-Gm-Message-State: AOJu0YwX2DQ366MBYPmVMcphgW/XOlNBpv/De2xTtgxTKRp2RY26RUne
	7anY7Spix8QqbFEU7MglUsY84F/d1lJtY3bgYOW/XoKWwAkEKpieF0kTgBV+Hn6B1yi6Ga/+3PZ
	h4Jhp4hIFVsUjsPQ3NGNz8gfeze4Sgxe2BWInZjZ7wSF3CMSNuP+UutR1HaNkGvA5Wfvl
X-Gm-Gg: AZuq6aK08OGFulQj2uZK0GgMqfCk3ONyhad5LTJTuZ7JffaIugWKr0TugJ/Of7SPQUc
	ejm+1uI5HJ+zMRW4nvhxyoN4Nyk+7r8hQt15TqnTjoYP7UyeUAya4EMrsBHUybVTm8XhLYtHg++
	IdHYpRXBmjFxIiCPQh8vplXeRaKkKr0kxWw0GhImEPNVm4Eg0lRyOh9sK2c/PujL37CxxqBUVeO
	kAwQ3OHvtizza/CgAY5M2yKyHm4FTKFPpCpNmfp5zbY1wzp4ullzk9nJpSMkleA9llNF+iKZNuq
	8Y62inu83M4U21VZFXZezDr4BRyDGvErHun1rEnmPoy3ybamP+o+bGMGpFYVOOcUD+27Yipvoqt
	4B2Cisv6gBTZ+TX7JVYPaIwr7cgjp1GO5dPMESNVoFQ6w4OTwZ584LGkVLn8nP+XFgSGeo3rY1e
	AmrNlQ
X-Received: by 2002:a05:620a:7082:b0:8c5:38ff:d4e1 with SMTP id af79cd13be357-8c6a66f68bbmr2278758185a.23.1769005723176;
        Wed, 21 Jan 2026 06:28:43 -0800 (PST)
X-Received: by 2002:a05:620a:7082:b0:8c5:38ff:d4e1 with SMTP id af79cd13be357-8c6a66f68bbmr2278753685a.23.1769005722500;
        Wed, 21 Jan 2026 06:28:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 4/6] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
Date: Wed, 21 Jan 2026 15:28:25 +0100
Message-Id: <20260121142827.2583-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GZw9foXiM8qII6bV2iWmajWZn4FQH8B4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfXy/DI4wVBjzMP
 6ydgXMMfgdskw8jxzU2Y6u+vhQJlNndHgKal7LyJ1Qs4gDcyLxxeK2oQ34WgDFtfIaAD8WfFWPG
 fkbCnJ2pxgS8aa67Y2j9/VTnXKs6ky0sIm9TOzC1aCURqkTawiwcnUcZVhg+x/O6HqP+MzISq+l
 Eh6rGQyHq5CFZpLaq9QNYOAn7QIlbyxJ+0apmIsxnrwUBXPdh4phqT978u8XW17aZrFi4Nw6FCB
 8GuA8bzVdjlO/zcdml4DSpW9V/hSNccuGdw5whLXdXNzvZT7ZqhlS24htSp5EyCdoFSP27NC5jw
 Pd3Y/jYq8BN/GbfbXw2j57pzQYSbeO/B9jOuHwqlRuel+3aDs4kEDdJHnBNuwBpgd83avLueOO9
 J6LcBCnRPTHXQ8wd6PfZjbDdV7rvG5ARtFxV4sZ6IHDN9tChvg3HoevhPrze0/odyqIuh6NvOMI
 QkJcuggfWa8dQOXoNzQ==
X-Proofpoint-ORIG-GUID: GZw9foXiM8qII6bV2iWmajWZn4FQH8B4
X-Authority-Analysis: v=2.4 cv=JpD8bc4C c=1 sm=1 tr=0 ts=6970e29c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QCvEx_dtP_Vb2dzgXhUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210122
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90038-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82A2159270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
        `if (!qmp->phy->init_count) {`

This can also happen if user re-enables runtime-pm via the sysfs
attribute before qmp phy is initialized.

Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
variable that can be used to avoid relying on the possibly uninitialized
phy pointer.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490c..258e0e966a02 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -541,6 +541,7 @@ struct qmp_usb {
 	struct regulator_bulk_data *vregs;
 
 	enum phy_mode mode;
+	bool phy_initialized;
 
 	struct phy *phy;
 
@@ -895,6 +896,7 @@ static int qmp_usb_legacy_power_off(struct phy *phy)
 
 static int qmp_usb_legacy_enable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	ret = qmp_usb_legacy_init(phy);
@@ -904,14 +906,19 @@ static int qmp_usb_legacy_enable(struct phy *phy)
 	ret = qmp_usb_legacy_power_on(phy);
 	if (ret)
 		qmp_usb_legacy_exit(phy);
+	else
+		qmp->phy_initialized = true;
 
 	return ret;
 }
 
 static int qmp_usb_legacy_disable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->phy_initialized = false;
+
 	ret = qmp_usb_legacy_power_off(phy);
 	if (ret)
 		return ret;
@@ -988,7 +995,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -1009,7 +1016,7 @@ static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
-- 
2.34.1


