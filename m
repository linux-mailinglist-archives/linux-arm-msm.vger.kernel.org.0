Return-Path: <linux-arm-msm+bounces-89601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA383D3A3E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 733143025713
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ADF34FF59;
	Mon, 19 Jan 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGdKJD+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5ozdu5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60FB3382FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816769; cv=none; b=Ahm3mgd/5tmwtXkSQkPyhAy1UO1w2accf/LCiSnjoTqSCGy4rV7p20q9AS6jzWK/jIyVv/UdfI67A8oTCdXcUmE3Ft6O2tE8Mh3ilvzSNhTrd677jwjR1Atn9GliTrUBYnTY4oqkYEu4oYgEE6EfZhO19SDLkPgDR6/DRROaoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816769; c=relaxed/simple;
	bh=+YtUGgVsqKcXvbyEuEPo5co+TtAUwXQcP5xRrVWt7S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWF/In2ADBAqgNy9sEcoi0n1BwnYK2ZH+PpMXgPn0giFYXN16a4GxKAH7LCn8zaLuSWKrWnWey6d0hKiUwyu14fbd/vCbHAKJdiWLCnGjurN98aDYwq3RS3QxRa4rikLjK0H+iJEjlppVr0NCBrsMgZPYvo8zSzDDqPQVtB/b2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGdKJD+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5ozdu5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J914l51044553
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDgRAPVFrpu
	7ekbHshESSQHT7siYQ+vYCGI5eQFiuqE=; b=mGdKJD+TNiX5gvIPOAQg8BbW71Y
	LESwISoroEaHMUfbY7BLoS/VS90UcIgGMnTk7Y+7D6XhxUJfZe5HPXubTfuFz8Ol
	7CMRZ+dV8bkm2jrDR/QMTsY8Z4dNiOBFyuKpaARNfSRVQiiq11dfKnKgTTGx/04/
	u5toigGBn1yYpDzEnuQxwFyzae8/siIApHAqqULL8wgzd2R5pkB7xK3dzAHS084r
	6auG+EE7YxPHsEobKiwLZU9YrhZ8oHsrJvN+iU34DaXXrFrgd3WwqM64r4fq8yUq
	m9j9EBIIhxSGQz95YfgY3jCPfdFaNB79Bc4V/sfhlWCCMLAHUFIJ/5On6yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehnb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:59:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52af6855fso556957385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768816766; x=1769421566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDgRAPVFrpu7ekbHshESSQHT7siYQ+vYCGI5eQFiuqE=;
        b=O5ozdu5wJc8c9mzN7aAE9R9gXkP5OlnWJTcv10gAwSQyHlwbzon7Qau1s79Z1tVTyY
         nokAiCX8yzvJAovcwqHMz2lVyL9n1484F05tIqF9qyQQCqJp4wK2pSe84JGD3haPSRQx
         GP+bre/fTLAzskybiOi2hJQZTGDruvTbbGXDD/nd1GWHAn4J0IUbnYXinz2YI4ROwr0Z
         T/8XrdKBFqOU5D8QUDvfogh5yYSDvwnCWdJyqfjeCRsIOmN6XMfvaYK2EWbw4Vf6GKBR
         3ATOlPjlxnwwCAh/iXsm1VGBOSTphd7ST7W4S0+W+gP7/zFSAdxeWiwX7KwLTInn6A9r
         4CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816766; x=1769421566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDgRAPVFrpu7ekbHshESSQHT7siYQ+vYCGI5eQFiuqE=;
        b=Y2EAYFlwrYcU8jeVDphJOJ1IWk/+n5Eq2pW5zcKWXuxcz04pKNcZl8MFVjG57drVxZ
         /JEFcZ1P3CIAic9tPItKqtK7zFrE1C8ha75FBKgTBlWQvN1oFcTyic3mJIL6sCJpzIjF
         /pkze2s+AksJdpuoj9xdghl7KRAmT0S9cj05IzJ4tXAPEe/UnS3yejbOiQYcJVuEmzKc
         WzO/VqQ/jxgS3ft5pgcj35iFxm3KK68P274uTvL/O/Lv2KPLOp9OKZUic84MRtnDUw33
         IUvUV7Nx2Vufoy4VOH1EUcKYvs1c//IxfS11qHE0S706ta0fksvLET34pzZOnn145rx6
         T1aw==
X-Forwarded-Encrypted: i=1; AJvYcCV32CEx6RQVWzj3w+qY3nO5BlHcwDLr0fUdpck4ltSQjMOB4BE2jqGga5FTu5gR1idR6HAOPR2gekz+Spox@vger.kernel.org
X-Gm-Message-State: AOJu0YzurnHAHz0pjK7SEeApCVZtExoCXh7xFR2Xo6XTpgKAdf5PFJsD
	td7IpnVD1UcNIVp7gXH9DOza2I3rq6/5XeGThjIa4wVhia+2A/ngkMXgwT6lmEEi2gMffAC1ytV
	5wgYIA173XfrSTKwlqhqdWJksM9PEdI4gD8RZdc0c8VQ8QEBrHvnTuqglgECRD6UPMQTp
X-Gm-Gg: AY/fxX5UNpUBCQjBmg7ar3O9rPdonJrgw8F1SFwSNJ7btVCZ8Hs7+zu6weSjjhUp0XU
	tL7rA8mKY/My+jEMe+HcYlqZJNjk8wFW78f+IkrBid6ViZoTycoVf1Do2HcCwWLxqlDq/DcL4RP
	QxZ8UhFdC6dsmB8kilM+EpyeRIgueiGy3M8j6iAd1Ttg7t6V1DHL6n5dYs2xzRhoYOOK95simdw
	VxkcJaIksmIWOz2hMqC8ophH19kSfhC4BWvoc2fyLF2g2SnRJlHro1RzLFgESv9AP3zSIhGh+KN
	6DLLk05kXt7nphIvx/n1jp21xoRD4fL2WS+KLDzdavn6iQJyHtj+Mhu4IH2BC27fBagy6FIFYgg
	inm0Vess5d3GWnTENswQcXs5NpA==
X-Received: by 2002:a05:620a:7088:b0:8c5:3881:da84 with SMTP id af79cd13be357-8c6a67bf470mr1473707985a.73.1768816766212;
        Mon, 19 Jan 2026 01:59:26 -0800 (PST)
X-Received: by 2002:a05:620a:7088:b0:8c5:3881:da84 with SMTP id af79cd13be357-8c6a67bf470mr1473706785a.73.1768816765812;
        Mon, 19 Jan 2026 01:59:25 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm242530635e9.1.2026.01.19.01.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:59:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for CQ7790S
Date: Mon, 19 Jan 2026 10:59:10 +0100
Message-ID: <20260119095907.172080-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260119095907.172080-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+YtUGgVsqKcXvbyEuEPo5co+TtAUwXQcP5xRrVWt7S0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbgBvVhQQpl8O/Yd3FdwWFsCx32cfpmLLcg3CT
 cE8vVcA/zWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW4AbwAKCRDBN2bmhouD
 1yiGEACFCbHjppWysdJZdU8NGenQyP4pTWjm4PGbVaORm3bL6jC2WYVcGaS4ji9FcWyqMqMtTC5
 AsOPSZpYxFZCPEAsRvPvJxDlmjdqZphNR4Hp9R51v7mj5WKRIob1LX4WhgZ+7Cdn7VWfh4Ve8Lj
 9bo8TUUEMrfFy3BM6Zs2BmiMLCpZa9k4TZZQVnb6DcwLGLBWrJCQy9v+socBNQYdeihz2g2yKj3
 0aCH+XoAoXm6sda7jVNgtE0qN2Hcp8gZG0Mggf0Rzdt7fFZLF1NJ0yuAP+0LSBaa+d36zFOp9Fi
 bEo+ZCHjiiQ5VUW92yMq+D8URP1AxF8QH3WQtWUk81ijNy1zyEZmgHwJqTPnqZ+DKJmCghMv06d
 6I4lrBlpM2/hTZRTkVL/w33nEWZkjpb8ZULB07K7V1LyBoVfp1dAorggi2Nmh5Da6T7CxOILILZ
 kyE4rK3CtxWJ6vHxn9t1JlA5px/WXv46MzyqTw+VLwHRdAa9taPjTvpX9T6BnkCEJYoojqhV/YG
 fHauFUhm+BaOPdi8BLNW+Aevr5D407yUZ6JWLdGCob3QxwTdDso4ZhEF2wgjqmQBWGk6RHHDQlX
 aV2dXXUv0nhJF6NPmeyaQQSsOcbKFZkVTpSBaC0v/sU38iXRl7GTkL/T7P8LlSl3MqEwA8Ka9sS 7fEwBbHUgWfPSsw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4MSBTYWx0ZWRfX2uUGE+w3SjfC
 SS1JQzhrMHgGBI+tLFDRBVC/Cc7MxMkGaaS3o0GiRtpycgh6P95yPIs49rxAk0B36qMFZNr/V65
 fiBoLMMp7hgSNFsUbiNmhT0F22XGLtM4tMTYS7hLmQ/UNIPQeVkxhE6yXRXRayUXrRag6XWa5yo
 rT/wSKWpFumTsOnkY4sNA6RPdsoK78hKaweAn9thvoG6co8O57g6ivTjpmIaGDjABaVwDnnM5bm
 pM6mZmtRnqQHmbxnPu9pl6FxJzfGI8hwwsh5Fn5nyXGaLCH94hUpZuhvBy/6GqR4YgGgRvJlLvf
 ARLOqHmZylFvSaIKidWKUOZgOtR+fSv7Zx9GRIbXaK4pK1ZJuwssjhfuXBv6cyVTwXz2Bpt4/f7
 DGyOpjp9OQq8ECBzby8rjvvhU+KPSrNSjZTy1f1DqjnapDaEZJ3dEadWRh0TAp3/Wdv9C3SePee
 DsyhDliS4Kh15KISQXg==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e007f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=n2oYzaAKK71w7557y9QA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: L7Rp_jX3zkWfbTfUmYGSk78rgSNoo7rk
X-Proofpoint-GUID: L7Rp_jX3zkWfbTfUmYGSk78rgSNoo7rk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190081

Recognize the CQ7790S SoC (Eliza SoC IoT variant).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>

 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 003a2304d535..9a5738d24c62 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -522,6 +522,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(CQ7790S) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.51.0


