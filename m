Return-Path: <linux-arm-msm+bounces-82017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E8C62572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1D1E6356829
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F493101DA;
	Mon, 17 Nov 2025 04:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZMetDG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4BnnjHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9A30E84A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355094; cv=none; b=tlo3+42J+3yO53sUyMX33iAqmJzibWkvmtyOrfxTH5pwwYy/Or87f9T2KP0wYQRtc0aZjEzq/8yliL0Ta0gDwXu44WVTJu0x+DV/L8ZxuEh7twoVAwbNP6Xb5+pS7eGC29ldYQCuyZdPn1Af36XolHJlzMAjM6D5HmQB+92OZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355094; c=relaxed/simple;
	bh=6LiL6O9pmh1TDVCMMcSETYaW45ry55jUKKlUCjgKlCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYoeqAHc/E51NXV+uFwC4sNxeHADh7lcPxtMwcXyzyN5e6GqqM1hBEHYmRVwvxlCZBsrJq6crdLHTTP6gsAWpPrl+2IotYrh++Q2/vsJbX3rsQDxRDXCPVBHsYBC7B1sk9v6vMLrgIpCrQMz3Khfud+GfDFLgjDj+inV1cPuHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZMetDG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4BnnjHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oBR12792283
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/t0XhTBSP2CWQyz1ssI2DDF99cMQpWQowuhrW++TRA=; b=eZMetDG4TEH63seA
	7GLYI9eBGfOA4q4GsHI7WJ4L76IKTrYRvPlTBNzz8D3EqUPBDC7Vu9qnlzFgotb3
	HATqA3y8OdBNtKHmM6C2dHuZsgyT9ALYdexWwloCIeb8xxejOxn2HXK9QK7IJBZX
	U2Fc7ahDs69EP20EFZXZ82Ocz0082TRye7BWvteyXnKm61SVc2FlvpqzJt49IwZC
	AR34YLMiZAoI0oiO+0zlOWJEZbB1RXQ75r7JPne6+5C+EcONQfLARlITNTGCyWxG
	IshuivSpsw72Uh5gEd1JTBXYd0PrzeXLdGsF1vtlzmQVuRjMOtxZxGu6dI4hiRbH
	AhHb/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bg82p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297df52c960so105641315ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355091; x=1763959891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/t0XhTBSP2CWQyz1ssI2DDF99cMQpWQowuhrW++TRA=;
        b=g4BnnjHWzVGsnARUvZJSKhFVeed6DM3fAAhTSSC+SJk18L2hinXbrigNxFuXDCUAYG
         6/GL7273HH6S0Z7mTv6G/9pf8SZSJsTjP5Q7sPgFxd7Ph0KfDQfApnLMPTTOIEmsQKsr
         NzDzm+UpDCOZmJPMbpRL6ErQBf4KuZECSn8mMgwTPuRgswo/SIEFnuys0BZnRLWb8pxa
         1iRotzBs6TAi6aHaEnuttUQU+Ef5UsI4T5s7r5PxCDV9rZSa+ijFB4DVQF9Wcxr3XoMT
         u6XgeoV6JI3mL1pmH9MZ7vlENTnRsNt58P247Y0j1MoW6U3ggaN7ZG+Xh6ORCoZNYHN/
         dNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355091; x=1763959891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/t0XhTBSP2CWQyz1ssI2DDF99cMQpWQowuhrW++TRA=;
        b=haIE1MmQ13aLh0cvVBE1dT16juo+QoJOauK8Tur1rumXXyr7MNCF4UA9/XNUMFeu+p
         1vN1frwlL3PsFoeJp8hJZtH4DiFiIOG08/Jf9iaKG4OcvZBJerIjMUbbCCVPN/ch7Ha5
         QyN+Nf8I8enAkezRYbuDzEDlAJhbs5Je9ZmW1i+RQ4M8jJ2TOLVCWzCklA8TKJJN19OK
         eNViXmNbcU03IZPhZrB9JJINJIIoL72XNYtLvMlYnfFdmNc9Sf5QTNxoWbEu7xiQquHM
         uymFxcOVZ0h3XW5VPaNuzLVKZlaJL0WgM2ed7l0jTq2uTn1J+HmcdXtOsahREzcQF27x
         NEHw==
X-Gm-Message-State: AOJu0Yxs1cqVMno3wSY7FSJBzR780PtP0rZJw8n7oIyUQvN+fMl1I0sW
	hKv3J1bE4V+4Y/ysl1DQsCZbBEPhjZjPxvpWZqwcT0gp6+OKPg5YfoduLy1qeEEFh1Lh4nUbUUH
	roFxr5M4OMsJ7dt5fTs7l+5QgWmSc4b8K/vMd/ATWOHMSBfQgUpCWHhZ+mmgNX4AgJa2T
X-Gm-Gg: ASbGnctlJ87jerqAKTPfI2uvn2xAtJd8Na4EAjqWYOMK9a00XjQuVNQZrZwoaD9pfCX
	Q5DEWx1FHfj/vTtM0XxulS4uS/NSFJtGW9EKyl6BD6yo47iC8M+/sTJwdkaITPXDWYv/wgcCT9h
	bBmBibBaCPCEgRVClfdqB6rqZml4Y1rCLjenJ8qgbIa7bZOOFlTzmOkCtRq09EpQ7IiwscfbDKM
	Kj3nVGQ3m1yak15hAORgpIneDWXtTnaTL0+MsCDSe4OYTVNwWpPjKPiGvsUf38pmIInwL7Z6Bus
	8/s2D4yDFT01BgXq2xy0+HP2AxWZGkWS00//fVvAcOfubVvj0+o3jnx0c9V5SC/CWuufT3zOMnM
	LxPH99uImMfVHfvdY+Juw/OyP2yjlKQ4XfrNbLpExC65hDddz4kIY8eLxH0M5o8cZ8S697g+Whc
	5EWnVtwmabhOmzaFl0++0m6QU/Y0iVi1uyvQ6yZmnIJ3TU
X-Received: by 2002:a17:903:244a:b0:298:5fde:5a93 with SMTP id d9443c01a7336-2986a742102mr132328405ad.32.1763355091377;
        Sun, 16 Nov 2025 20:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrnjuexQ81a3xhdbX4V8/pUbZ/YwpRemYRGJqgBec2rDk5xlKWBz9pC06HIgSv4NW1dWkXSA==
X-Received: by 2002:a17:903:244a:b0:298:5fde:5a93 with SMTP id d9443c01a7336-2986a742102mr132328285ad.32.1763355090959;
        Sun, 16 Nov 2025 20:51:30 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:30 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:22 +0530
Subject: [PATCH 03/10] soc: qcom: pd-mapper: Use __cleanup() for
 device_node pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-3-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1304;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6LiL6O9pmh1TDVCMMcSETYaW45ry55jUKKlUCjgKlCc=;
 b=YEtiF3Si5pUu9vA/91BifEESH5Orppm4o9h/yq6K6VjzkCOgx4l3WPgIDEz/NfShrYbV6ahAJ
 sA50Lh11LIvDkfKmT+dJQfOM3JCk/Ej7OT8dpDnD4nOhJ1/sZyIbE4t
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: LgrCOerH6JpSsDx4LMXS0UrKlhZ30Zyp
X-Proofpoint-ORIG-GUID: LgrCOerH6JpSsDx4LMXS0UrKlhZ30Zyp
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691aa9d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y-us636oAhZ8r33jyDgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfXzZfgWrBdPm0l
 c4kXgnkJ2k8CUEAWDfKHHqIPioFZ79HEByaWgMRUQska5389Uadjc4KT4puom6XYc6o6xuVPc3+
 gnP+ZA1++2L4Dtu0ehx2RlZOMaNwrQWsSXmtzBd8kJLjNdjyJetCnzNhBEMISx0QmGw94ylJXz2
 H40/vXdg2TSO+3VFyE5+zbXksWh8KD0YQP7pIJ7ky5dDDfM0xN98TN7zgxK1RPqYGiGutiTCKHo
 +80DTX2nWPxX1LgtyEfGPdZHhKhYfHNZD/XCQGlTV6jbA1ogtuojmYqvCgR3gGqXz+4htjHPist
 tmy/EC8UP7W1I/s4S+6UJKANGsxHvOFU0hnPYiNvzyTwIMcdb3rSuyUFwkws7UePR4ctppllYvR
 I0Lat2OGAjhmBE95kl+66Lh7A2rZnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2bc2559a1395929e5cd74d9a7a764..5713029d6527c84e8ba410cebb67bc268c6b3721 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -612,10 +612,10 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
 
 static struct qcom_pdm_data *qcom_pdm_start(void)
 {
+	struct device_node *root __free(device_node) = NULL;
 	const struct qcom_pdm_domain_data * const *domains;
 	const struct of_device_id *match;
 	struct qcom_pdm_data *data;
-	struct device_node *root;
 	int ret, i;
 
 	root = of_find_node_by_path("/");
@@ -623,7 +623,6 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 		return ERR_PTR(-ENODEV);
 
 	match = of_match_node(qcom_pdm_domains, root);
-	of_node_put(root);
 	if (!match) {
 		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
 		return ERR_PTR(-ENODEV);

-- 
2.34.1


