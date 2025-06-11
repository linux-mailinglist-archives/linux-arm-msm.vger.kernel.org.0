Return-Path: <linux-arm-msm+bounces-60896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435EAD490E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 04:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B458A3A52EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 02:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3FD226CEB;
	Wed, 11 Jun 2025 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c71lYeF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFC22540B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610723; cv=none; b=ZKv3OHxbTSyRP1bP56pfX9OP00ozxffrLH5fy8yZ9xR5exmDgz8oG1WDN+gDJ/9mLItXsakyCpHykvBB/C2dHZRYlClUT7FSslEnUa82+K2EaJNBmhU2zt1+4HuQpfc+X0CEmY+pFfBit15DvTSGUe38jIb3rp/BetgqZ0xiyF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610723; c=relaxed/simple;
	bh=Tq84tO28/ihL3VCn+xRUdAhQjrUgd8j1sFdAu9HULA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnDo3gs9tGsNVaC+eDF5Ji6YkieX6EXkNZH0rDJF9WmQPD9b1Td9odDmf9RDEIO62qOQaJWpUpV8bCPRc8Ay45UPNK9yawvPZNBw+RnsrLfD1PBzGPsmTEaSRC/Z3NtXgB+js0k4lK742DZWrvjVp6pijrLPXC0m0LkWQgAlvOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c71lYeF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ0nR012185
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0HKw6uRkuFduO3sES05/apr/xAyNFuACuh7Zmwxopw=; b=c71lYeF3zzxZGG+m
	llQz5GYISxBd76fMKQ2q3ps1PMXC14rFFDOUZ080DnKmjRagXuOtbiD+9cgmOsVE
	+Ry+ivVBKQvY42z4pwjFOrw2Cwe1cRErmGb3j9UmYnSrjOfzHAalHxLqIPFtpIB8
	4YKZljG7E4PW5NjGHARYLW5Xn1te0yRvLlvm+DNO35fA9zj9MpZkizrDAJ/ttYmJ
	BwDyYT3RlXDWJZlWWZCQFSFiwW57P7cjHCgx0annB62Cu+Xs8Y3irkLFqlF2q083
	mxhQwb+XgakTuYCGIEKwgLVZmSSgD3Li5oyf1owQI93I/1DeIF+IF/1sj4mBCqaS
	NCNxJA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxupxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2e4a20bbd1aso359201fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610720; x=1750215520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0HKw6uRkuFduO3sES05/apr/xAyNFuACuh7Zmwxopw=;
        b=VKg37nEESkrj6HekbUeg387fcr+EVXyPTeTlImSynIMXKFt6S5Suq8wPF0ZDk5fcUV
         7p7R1Lfr+m0Itq1s5sKjvn7YXlu0bzv7+qKSNAG847QJ85KOb83y41gmYk+mjNZbl+nm
         5zO+eGbX9VXrNDfBtPWpTd4YpPQjma9BIlIBOwCJpEurbAQ229QeF9KuOFovs1PIfebD
         a4OP6p3h4ys+Oi6nEN9HBYjtTeNIfZLOEEoHqavNb9gRcUOd1qBCOFOl+7frwgNsPuHK
         IN672vHsOoE8QXJlohnS9OC9w/CPiJ++DbBXPwCqxsTiomzYivAN9TBZDClcEp/4XUFH
         KMig==
X-Gm-Message-State: AOJu0YwTJ5RFaGL1fghKgl/P+5EFvXUx2JRXAZf/Vnwnws8JjEl+puMY
	y7YjvMIUeElf4dh8Z64JoL3NpPzl3AVxdc8DPa2DpAGFCm4ccYqyYH9hHwzyLFnGNHtxDANEmYC
	gUycjh3vehd2pkz5P0Q1wA7hRJjapzgz8wr3Cd0/9NJplRcfLdZ3H6QyQBd5UxrEZBmkw
X-Gm-Gg: ASbGncvJ5GdXCevyv3cpw1+LSD+AuuYlZzJ4zDg/dOjqki5SJStfGsmKMergLsxLHr+
	eC56yRtxBm89Ccryku9CCqpMHVY1vM0x9pNq+KVtb22r0PXlE1EhN8jwEfvVADzghDhnhdOIuFH
	HcQ1jU4/o01J+l6c3ERKAKgSOFfa4B7cwxZIyEyG3kPIo4tRul0VWUFdyTg4cbQc8cXdQLrKqyK
	1JUf+VomEMJaWtzCvUOD03uo8U08yoIWIJlnEOZYGfd1AI+hcPzJVMInRX+6+jRfw0Aw4Kl/Crh
	JTyjXlwP/4MrsFjIVu2pPsC3OOlUFQLMm2xP3V8rm57Bt1ZIjJzvVnsQr4u50MvWLVRJBfYKhcz
	1TujKdFUoIbYC+akleN2Qyg==
X-Received: by 2002:a05:6870:d0d:b0:2d5:97d0:c03c with SMTP id 586e51a60fabf-2ea9675aa8dmr1180347fac.18.1749610719973;
        Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBud1AVwyFvOwAw4uK84W6FyfbeOV8nniRVWU9hjKilfxs2wJ95EuOAcCOsyWx63mo0uOdUg==
X-Received: by 2002:a05:6870:d0d:b0:2d5:97d0:c03c with SMTP id 586e51a60fabf-2ea9675aa8dmr1180339fac.18.1749610719648;
        Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:29 -0500
Subject: [PATCH v2 2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-2-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tq84tO28/ihL3VCn+xRUdAhQjrUgd8j1sFdAu9HULA8=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDc4wVmjoJsFrBJ245i0TjD3UoQWw+0wMjrm
 3hxu2fVQP+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVCSA//e0sVwVAchDT3X4CcbVrsKKgPUvslkgFpwmOx7yN
 xMsnQmBsofbHlFBmLq0t4TGoaojZ4ngWL3HnMMOH6+dgETJ2aZ4vBtu64ejcvBcoVmhLBaMtan2
 ONHmIw10bDj+AVQvOls+sSY4EYcHIXBkr1/9pFFteLBQ2bKB7eeStBQ10eDyASzVRZtAFGfRSva
 AklEM/xbpHPIGh9CirHxnJ47lzeJusITmllIvSn7Oh+BgyQYuEsjIJAAioy7DCyKt4c8SSxk+0W
 JcQuu/bgEs6PnUdR+Yb7PDsJxFlDdFF6YXsyiMkrrJX/N1qEarQubfD96UI4oiAMV+8hUDYgFfY
 lsYVIX0WP/9WILXLwo7fr8ZaHxzZPoI5wmVeB1kPSqN+/Kc2qV8KN02XSroXXJRgZc9vcHiF9bt
 VcFVLu9KTMQLdVutQAGf2AYkXniXOfvRyoLo8+XM98IeWyMcZ+Z6+ZlzU/mKKj3h2Q9Qlj1uGdJ
 ensj+BgKMcwgVAIZHtlDNiR6tpfb0vX755XsPaO/O9vDCZR04bX68Ar4EGoae0iQLVke9mQDcJq
 VZb4oPrUlXK2wWBv2ZcvzHwpthCa9bMJpE4MPGv2czvIpF7TrLsPZFAp1SMrGoR4cUTa7xMgM00
 2PW/g9yxHQKIdr4b31cHNFMQxI/ajIzgPINDRhKrIQUw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: ia6rQsKg0JZ1zqQx3NCmqM0Kc9BlnT6y
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6848f0e0 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKqZDcqvNeJUIbkoXhUA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: ia6rQsKg0JZ1zqQx3NCmqM0Kc9BlnT6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfXyifNINsSriP0
 QTgHEYhJJ65vLBvAnHXn+F/s30P/r8ObJa1cD0nX9MWNK2tH4jpExCmeqaor0XAH5UShv6yMpDy
 TTbcidc9TVMUvwknW/+Oe1HF+ztsFriyRYSWYaL+EzU4StC4K+WRegUsPfOWAirHhj2OjlcHYZt
 hItl8lb34/RcSuw86mQk68ZAjfMugIvFvWyabsvo4BZPSAlFGu1AETdvNe4l6myXw96OnAvbFSg
 AhtYmgFncEww2GbkmLo/WefKtamYcSk+5Gd5WE6hLSrOfc7KXyF/3BvRj29PTEPqqZiTNihjYL8
 DW3f72uSzkZJ/W0ef+0YWGk8cp4u73hdohgNfeXqwZoh8DOjwlsoee3ZbAIvl9Z0MSZ9BcRfsRk
 a49+7q0yuNiBCF5j2eq09+F1gWVEERRu3c69RbqIONYaPcr2dRk+vFTQeOlFd9xM59u35Fqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

The function checks if a program header refers to a PT_LOAD segment,
that isn't a hash segment (which should be PT_LOAD in the first place),
andwith non-zero size. That's not the definition of "valid", but rather
if it's "loadable".

Rename the function to reflect what it does.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c9731b6f2afacf4acafe555dd36ca0657444a6..52f0c8bb7c5ee9f043009a274f147128f0778151 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -49,7 +49,7 @@ static bool mdt_header_valid(const struct firmware *fw)
 	return true;
 }
 
-static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
+static bool mdt_phdr_loadable(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
 		return false;
@@ -122,7 +122,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_paddr < min_addr)
@@ -260,7 +260,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
@@ -360,7 +360,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
@@ -387,7 +387,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		offset = phdr->p_paddr - mem_reloc;

-- 
2.49.0


