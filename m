Return-Path: <linux-arm-msm+bounces-85043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EACCB5BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2493F30010D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 12:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AB030BF63;
	Thu, 11 Dec 2025 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jt+M4plp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2Ai3Ik0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC430C347
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765454632; cv=none; b=HyFKIxKYrsqfpXYWTNEOWb+IhDOd3h4EI3j5bXyxKnkXkV5ug3iL5Z7+PB/in2DFT/BScEQgJQvf71RySD1dCl9igkPS4123eHgNkNfNiXxKw7wQV7aFGCqiTpGr5qVdt9zcusZz6GFStyp+urR4aV3IEqi5ImPhCA51cywsVNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765454632; c=relaxed/simple;
	bh=3Qfyj1CVAZVlbnhuGUNbDDhk6Hp1O6OSsAfi8HXmhpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r44tW161wHm9OOto58yOb9Pt8CEJloxu8m3Rn5BULnvIqUrVc0ayV1rZP6YThfYyLHdSs0cgBMS5sVELoKP0CU440HiDXBYBDbNUDNCXFZrPylnye2MU+gu/kedcFrauEsOBkYdIUeOEc9a1YaFtUUX9xkr7uQDT1OXfgMf9FZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jt+M4plp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2Ai3Ik0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXnrR1025040
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 12:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PXK3yWZKrq9rrT1XXywuoMHxSRm8iwEWtPs2wpTSIE=; b=jt+M4plp3wHagDZO
	sAtgvFwToIM8+C4FRSmQIpZZBJypAW3pSgPHQb8AahLoAHiFQIDSvJrcBPBfGNBO
	0s17xRwPMgSSHq0ZTUxQMbzgkQJJ1qu6ksWqeONq5ZMluFRJaLqA9TeSqJ2VOBAF
	Z931Gi8FGNGp4BCoCEedX6bZR2ar4EJzqAqyePEX6EDey/WBTHBSGz8xi1Vg1TrH
	v8JFKD8lJDhZvQeZT9UhHlS1A8aleF/geBloF+oObtIjW7WWRzRXt5IMXnePltmq
	BGPU8/R7ElTABTPzOZgnWEx6g0PC22YB0teZTyJyj2QE1SnCO8iFqIifV4NkhzrK
	bdMEKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpah1j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 12:03:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c261fb38so1900289a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765454630; x=1766059430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PXK3yWZKrq9rrT1XXywuoMHxSRm8iwEWtPs2wpTSIE=;
        b=f2Ai3Ik00Lny/mG2BeVTvIyp0cZebjTTWCxOwwllwQzTPKOdXb5MjUfTnXDiKkHgu0
         5ytBS71qPTvz+BVPT2yk9yE+GftRSy9/2asE4C1TZMKFdFSrdkKws0ou3O+3weaJTmM7
         2UYVDdpgJP3gWyU5f2j5Pmd+QlHGWi0mdTup4gW7OBa8rfbxteRFEmTeZcNgpm9mQLUb
         UixUrPmZy6+pb0pEFqzk4SnXcW2+UCMMl+0xKfvcov7/fYGlasc8yTwAOkzAQivtkHbk
         MD7TlkRgGXYG1MptvN+1rCzzK4RrEiEJgqufyZ3bLwwe8gVZW6gfCqMjGWY8l2bad6wD
         UVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765454630; x=1766059430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PXK3yWZKrq9rrT1XXywuoMHxSRm8iwEWtPs2wpTSIE=;
        b=mxUJnpjCcnDf+C8Vj+WogeoEyeB6leO7ZDHh4UO90zSG91AuHE15pCQdtGyz3XRsA8
         wi/hkhgU73vehVAGdckEoVkwbE9zzKJ4V5CxdswFNqUHxwftGEIWWvgEaI7RSP+pWVSb
         IapxO71+jdPujUbB2hlC2LkEy0h3o4BhDNyAjAx5kEhf8yGqYvMFZ5Sit8bRRVM75BMk
         +w9hlZnRYoDegOs1Y+Cd6jxIySKWdU8/bzG5Lk+G4Osyq7zZrCv+DPTF1W5CCOmTWRFQ
         1pEg/NuvOYQNedtC6COPuGfyY3x6r2CAkMN9dSPFoguLYNbgCcF9Chann25NGolJrtYU
         XEqA==
X-Gm-Message-State: AOJu0Yy4Ia4eDPuyHqpZriotKGy11pDoT+AH2oZoqlnrpiD9924cFiJo
	IcNKu4bE/qmu1zMn5Rcex8b+WFiGHauFRFK4zFR+dUkZJ2u1OU/A3YYWx1M7bgYwcy6Kc7nTDCf
	UCSyAuMUJQVCwISqNABJZTpl5pbweXNfMloxHnfhbypLyoNE7XJi/+MQ1JeEoLLQHNj14
X-Gm-Gg: AY/fxX5p8jBf9HCqJNP7mU6cOtrFiJo40ukifNfVddaVEBHkaugTfQkx910DyPzLvau
	ScuKJ8oZRb+MIAZe00ClXf1pm3rZrlTe2bIDWZ2DOGvnKYEmHwnhwz06EmQTDhzU5DEZmPHE9cp
	942/h8bEvi97vrZO9b0seRrijV3pFWjmTRk+iOVZGXmaqyVyHxToy0YAexoSTQrGruxvA0GnGDk
	1e6BHcM5b0Jsc1c6FHN0W1h1JvH/k1sai0mrYX9FbB4l7Ot84urhvc4f4UWTQWfE2aR2hW2wJCO
	nAMb1Ifp28Q5QsNOEVBE0gQEfWziB1M7FGhBbUFqHBsZcMi3rbiAcNmRib/sGYFG0tALiLa/z/K
	OgV4xFo7n03HlDstNd+r2k90/vOSmGzveGnXCTf8exzI/AeH7kkrYhKB60bz3RBrB
X-Received: by 2002:a05:7022:78f:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-11f296b569cmr4947160c88.26.1765454629606;
        Thu, 11 Dec 2025 04:03:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYQCJ62GMHwexp07IY/vzn26ib3jEDLoc6zwD2Xvd7TC+VXK4/n5oXUgZTat2nbQWutBfQFg==
X-Received: by 2002:a05:7022:78f:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-11f296b569cmr4947139c88.26.1765454629041;
        Thu, 11 Dec 2025 04:03:49 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffae2sm5924073c88.9.2025.12.11.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:03:48 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 04:03:44 -0800
Subject: [PATCH v10 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-add-support-for-camss-on-kaanapali-v10-2-39e8874dcd27@oss.qualcomm.com>
References: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
In-Reply-To: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: b0PPa91r8m-Hk9ewZqy5krKPf6pVAw8S
X-Proofpoint-GUID: b0PPa91r8m-Hk9ewZqy5krKPf6pVAw8S
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693ab326 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA5MiBTYWx0ZWRfX9+PVq0XuUx6v
 m5SreDyj2LO+ETjhwp8oPYAS07fji2AHiUJOwRTr79TL13ql3Qg+l4NE4HdXTrKKlvaVpBSw99a
 POnCPf76QZ4M5dhISIAcU214PERtou7/Gn6o7R0dmY8RFmD6z6lA1aS+tuZcRwUoXaomtEHFLWJ
 ozdkTrJ3/+ITHQPwWdbPslaRjSDhcq3XcHPaRNv6EXzN5u4cmcYEXeKF44IlOmqtBRECX+hcunA
 DQXmcx4g/b4RR8wmh6gAEnbczsDGCHW3gET6oD9sIgXzXqBm6OgX+vTZMvF4ESTHJSY5zI3XfLE
 v6iCyg+0vC4SC9G4Ozagm/UVh9VCHEapyf4OUbCzI/K8QswEArA5sx65Uw5Xi0WN0Fy2CGtc4MU
 b0IgsJfZBFwqZhhDZ0DKxT8CdDy6ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110092

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..6388897c5fad 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "cam_hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 901f84efaf7d..876cd2a64cbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -90,6 +90,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


