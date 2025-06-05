Return-Path: <linux-arm-msm+bounces-60318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39635ACF108
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88E4F188D638
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 13:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9FD25DCFF;
	Thu,  5 Jun 2025 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1wbxHOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8225D8E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131000; cv=none; b=UjZH7NUZNQpLd+wb2zqQYcDj7SlKpEv1QXXOqRWpKfBbXYym/X+dgKnwynXaWVAJYQ0Njd4Ek9/57WtHW6M23Y3OtsizhUDQbkzLmnGs0EkLCxEX9qu+Zcma8aMCMjJQLs8ebdMCe/DIAZfSPVBXxa97jEDnH/ZClYTHRH4Cu+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131000; c=relaxed/simple;
	bh=4LG9aen+UKEmXElW3km0tU+Gv6VrtGDS/2bhhYgau/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvkjrjnQP4ccR2m3Onu1dwZyOR26JjfV9aXuRtQZl5EneVOc7SNq+HLY6ryOT6FE6Iks1r9G5S+vtYNHTfYzgTNmGIEsR79VmFMpSt9HjrJXDgDXTjxQE4xud3Sggm0kRMkzGAwEb4H7Zb0wwhInBMfddztYr1ZM7J+X5GMFqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1wbxHOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555A0bc2012737
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 13:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcVfgrO/ZjVFn++fwRV+p0fV27JSng2FzXTeHDTEDz4=; b=L1wbxHOWeQ0yxPfj
	l2QfZ6Qrw5hivc4zXPDGHaqWT/n0J2vfd4i5DumDok40cH3fSQW5+SNE7+EOdpTm
	NExqpXjeWQ2im7zZcfYTEQCtg+gKXRElLosEk7y/u/nWyEGJQeIW5kMVI3R/2ATL
	R9q/BrHNfDkX0q3y19zwTNXTocGCITPILoNkSJUMeIYJ1aDCGd8FReTfZOHfamTU
	1AOQTl0ZIwIXDC9I/lCJX6gkeGr/lISrzqwLGy4w1pjRU9Y8qbgE5WpGBky5tzse
	m0DeVvgxjukXnSdj5sLM1fmoVCuxJqDcg1NgoXfG2BRiV1Q418MJLrlWPkV0cRFC
	mpvwHw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be855r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 13:43:17 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-60b90c2e011so777039eaf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 06:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130996; x=1749735796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcVfgrO/ZjVFn++fwRV+p0fV27JSng2FzXTeHDTEDz4=;
        b=J7t9/UgbaVwIkmlwyRa7qONF0UH3De5eiVWofqg0kRe6gGmhkoDMbZkt6lTxeTFltu
         8ztIdPIUk2Il+Zs+bxGEubeSYFZcynuqeA/H9mL9jxy4juVRQnOdH9V++Iz7C4IpsTbb
         XJPvCCp6lobYrBns/wNiCL7sw8dxcubDEAMTEaHVrAWNb6Z5nbdCMZqf2BP2h0niIvS1
         AQhlbrXoll16Ahp/GOf1yb7K53owBbN5TrBY4S7JfFzmthED28uPYgnmWQP3QTFnN9Fz
         8ZJ5j7FVjJptGxhJ+jmZl55jN80cpzAIVhTexqFtG2XmSp2h83/AlOs506D86+CuuE7a
         8DEg==
X-Gm-Message-State: AOJu0YzbC21LfFoayZY3Xa1IfSBLZEh/XqBcwET1OLmAXF23LOOwEIL5
	xq6ZRBOMb/WGEv60WONwjdopnBGB56hsztW906KcnIMLn+yHZHxXwOn+ApV9i2YAKWoyFpvyOys
	gO4CYHOTWsa8WoU7DKUEWuHxLC175ZY8cmQNSYCF5yjn5Zz1MwQWJr+qA9oB0jaGVkK9b
X-Gm-Gg: ASbGncstzUVefT9y9cH1lcN2UwIve2nBm7C3rO80cidXaK3MUjgDSyPPw5WhTSiOJMT
	KcOuGAn+meOE0z9eQIL/r0DxYi+jvIVQ7FTjPjhxoYALKNkw6LXBVQJ70+HW6n/GiJizhfzTPWz
	Etn1FbSAaLplanc06cRdUm8AgJPAu8oeHdnOm9ae3aNWTkd+lPqMBfSbIqylUuXCv7uCEHsGPGR
	T2wyVExkqR10VwYBRZv1RNKpETDHarfnFTml9vokka56qig0+AHrA4D5oE15o4qJak/3V0inKOy
	nq+keWdcQb2yq+FW1MMx67iIhpT2D0MJvQbXQpSw0Cp85xOHbghJCSTQMmzD6K7C8q8ZJaQjhHk
	JqchELefesP8=
X-Received: by 2002:a05:6820:1e0e:b0:60b:ecbc:dc50 with SMTP id 006d021491bc7-60f0c7ca167mr5018553eaf.3.1749130996181;
        Thu, 05 Jun 2025 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiiD9ljtJHB+ylVXFa9d85uIWbOmYp4glyZzk87k6EP3VaYO5FO8iTw08AMLXnnbkDXIS4mw==
X-Received: by 2002:a05:6820:1e0e:b0:60b:ecbc:dc50 with SMTP id 006d021491bc7-60f0c7ca167mr5018490eaf.3.1749130995829;
        Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1eb719f8sm2691359eaf.28.2025.06.05.06.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 08:43:02 -0500
Subject: [PATCH 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=4LG9aen+UKEmXElW3km0tU+Gv6VrtGDS/2bhhYgau/w=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoQZ7w13CxlnKFE71dbh50VU7TRshQ8GfmTkbWM
 5ghTkTTwfeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEGe8BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWWlRAAiiZ+YPVc+u6389ZQF+/SQaMdPA44r7qRphoqmeL
 Kr1J8fvRPkMhJAFXLAGAdn0Lw1maOO8M5lXHMdEzD9DFxsukVx1Quq91S4Nh2f4M6uEkF+IOuyb
 ktzh8xnX8gMPayxP13Jp/mhuvb4/3EVAQyIa2hgTmnSXBfn3wtDOYm3NZ5scdNW4IHNowil18tp
 LhcvRuM3lex4kfrJQf7dNvJVhgRrxyV976tHW3FVBlmDIyqYjzYLO54GDUNwbLsnDAtd+zA/fc2
 2piYgJdcnjl6/mKiirTlOewOyVJdxWjDluQlePD6eKdg6CRNT6ax3MQHJf8smaJkx5CeTOvORWZ
 swowr8PTnyWU86uummkAtKjOGdPW0rb9MFOejYwJ4D8wWaBFPJqaUkeA4zWK4jFP84N71UW15LM
 E4Rk6+SqvY/LrUL0LYpkk0eDsYckxEYz4t1rw5Qa0RWIADvn1uUqa1VmaT2LNkf97fZDfikSk0H
 7hmZ1Km9Yr3QvUp4PdUxCd0eHNfo6KAfHQ/CmaXLerqNimO2/+XFbehH/+9+XaUb39HLaawHieu
 eKFYkGEGBTtSFVAp6gFUFy490GtIIKRdZay0gaSg0FnI3rPuL9ac/wwgyJZvvTUiAzcsR2hQ7Eg
 T5QBNWOZOkUNGfxKvpc/0ymUID3iE2JFO/lm8sZ9245I=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68419ef5 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=f2cNVZAXkzJHwsNSZUYA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: t5L4XRdR_ld9LYiIlcD6znncL9IAeGkv
X-Proofpoint-ORIG-GUID: t5L4XRdR_ld9LYiIlcD6znncL9IAeGkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDExNyBTYWx0ZWRfX6RnH2r1tgozA
 /YM6QZyR4P2FakmktY6vUfS3wD6StHe8gcN3SKD6clNX+bFMPzCLj91XdNcphDVsbZ4MAWOw3a1
 8q+GXteQPa54BrV3DmwKr486bDuHOJClCz4nPSOhfiMrLi99NXqfN6aK9mgQsvHZl5JpujyaxdK
 RqCZs+6a+TBCMvr36GSaoW16PrJerUh9dPyHRMMR5rCxHdhl2N5jkLjFEkyESnpFFqb7B9Fd6Wf
 hnYc1iDUNT+weS0+qwjZ1TIwBO+OUDqP5AS/aKwpv5UhFnxW1qqVmOFVDmHNTvjmKWs9LEx6ukW
 zG34IzyQuTpsZERwy9bQyTlt4Tz1e+VslEwNz4lrvlkv0WKcZ3l/EHVzyK/W+OhbLdV/8oAU/61
 yOs9c/sRG7c8Op4muYZ4K1rBG7s62Yv83Jc7eLU4+Sm9wX8AnlZ+RUEHEjgW15s52gKmKvQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050117

Rather than relying/assuming that the tools generating the firmware
places the program headers immediately following the ELF header, use
e_phoff as intended to find the program headers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index dd3875dd7ef68d1f135efd8efdf5634f27aadd5e..01fea4c510717197a67a529cfa467c6a9a3ab55d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -111,7 +111,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -166,7 +166,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 		return ERR_PTR(-EINVAL);
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
@@ -249,7 +249,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -304,7 +304,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		/*
@@ -349,7 +349,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];

-- 
2.49.0


