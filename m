Return-Path: <linux-arm-msm+bounces-62131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F4AE59A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4181B66385
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 02:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929D238C2A;
	Tue, 24 Jun 2025 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrGSRHkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECEE231A51
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731256; cv=none; b=mlh3i+rURJAoNSuhWA+jSH2RmedggGantrS9KBs+GY0tWgJkUGedlOPIMjG94Nf2AOngs/xp790uzmmr8Hnd7KjqVHxe36HKhUPfNf/5cybUwcHXCKeQNxjXvGqR4QMhNdhpQUDssvLmwjzW2xohATFGs1OwMh9ZdbrnKXMFaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731256; c=relaxed/simple;
	bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0ntn+1cXdwsvwm4vV+tfyoCMXZqxokgfxEfkstolTd7AtYk/JTAvVV0oATD/RADdt/xp84OftuNovlZVpr7UmF7F7Us4NO7BVoYyhu0VHW8mglnRDyL4CfPjpbqEa1SjqtK3z9Ps1AjMHVPpodZZp+mvMPeFEX5MvifeKUQDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrGSRHkJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NDRnlP016970
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=; b=BrGSRHkJ+ZVhmIaU
	VvgViOfBXB/1beYYf7lneNmkHpG5f0ibRiCfjd85pqXZ0pJ/YdZ6W+4JMZ1PwHJW
	WhDCkkgWslGfbdaK1kEwOkxBXv9pkw7pFJMOtovb01PfvP1Sgl9H+cxBEvBT0mii
	b6HA6A8tj/OPe/8RtUWYJ3+pDT8wVPaOpbqP+5vAw2zaRn3EX0Ym4iyh6H4DcHlN
	kJSfT9IoGdkUyqmYXDbb0VgiNrijVqKfbV7Ec55FW+LFJg6fyEaYMr85t3rpRfzo
	+OsH7u/XvsyRbj+tHyo7t3SCgvMev6SD44czfjWYPcdwQdIx+6reLfsTCwD/kOCk
	6/0nkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttspwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:14:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so735867385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 19:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731252; x=1751336052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=;
        b=Xn5Ey8476AcMyro03xsN/0IrIttKSCpAI9aAGlmby2AOiQBaMynuDfJLDeTKSZIDB2
         b63OwngzBa+GCuFUySnzDJO3e580B7UVTegBqy8h9yphZZrw0QUpgSJGqm0Kjk+k8ABi
         AvNjoUXOLH8CHMl2ge8QLezc3m4SQLPRGP5EOAxsD9TGgsaa2p+Aghrti9ApY8VryWOT
         M3tx3Htcjb7GgkK7jMBlKhsC7CsBdKmPIFmRnVWfdQU1b2d3f2zpUV/2HebBbaSr6EBx
         Rk1g6ZozWWdnyOUS8YzKnfRZH2koRzbGVSFgEYw9iiWOvtcbYYw/7Ao9ZCChycEwPKTX
         8w4A==
X-Forwarded-Encrypted: i=1; AJvYcCX9gkQNIQycODfTDt+Gxfqh8IkXhkIcdQqJCfticqXM0A8DhDpQIkdacjL2LcH8MRahy7loQzCuo/VkiU4B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1LsNBZG00zr6H15x5KStNqz2WlSyGYdx6GyjqAMaVX4A2ZI6
	9/7TCxVd3JQgRfLym7FnVlK+plAHuGesdihcLsmTNWpMtZGkbYPWFfy+Y977jFbR5bXx67BWGlF
	tkpKyuOTqnh9Hl30vYkXSBB359uWA5xdWblVReKxkw/Dzce5wHERDpb80YFc7aNhsmLig
X-Gm-Gg: ASbGncuEo7ENCDfY2ABDnYjJzB6w1d9wCCTo3put2Z76qlPFAr/LivdRgtUM4yBIOs8
	mo6Xdr9m1V+CudTu+C/7RScv8rrNYSbnzanZYr3V6oSseiD7YnTUsS2/CUzjaaVlAsUxJqi4JI7
	yX3Q5NgnqMdOABvZ6+lgnEq/KJDilHi3Geh0+jnVCyssxldi6PlEVUOnelZddRypovECSBMq1rD
	Nm9W0djsQFBtukt9107I7vSuhGqu72z3y0/ASjgEZpDAgOYcrlNoXWjnaFvVopOJAGcosAJI1NX
	GTVuGAYGVpkI7+EajASF8CKqpnWAXkJwcY/+ko1oUIYMRYX4AumeNZoVCB4yAk0jJ2jwJ8lGUyM
	moofhVubbG8jffJFucSzHDgbMAfMiNmwJcBk=
X-Received: by 2002:a05:620a:4144:b0:7d3:b3e1:af51 with SMTP id af79cd13be357-7d3f99369e0mr1998467085a.29.1750731252354;
        Mon, 23 Jun 2025 19:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT/ySO9NQqMHT/LWZy4N2MmWqYkkmw6tiI4yElX8MxWZ75E2UpHJaJIjsjDu3cbO89+VOoCg==
X-Received: by 2002:a05:620a:4144:b0:7d3:b3e1:af51 with SMTP id af79cd13be357-7d3f99369e0mr1998465885a.29.1750731251969;
        Mon, 23 Jun 2025 19:14:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:56 +0300
Subject: [PATCH v3 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-5-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWgnmzxRFX3uMqrpeWnKCOEbYAqwAQm0shNR9N
 YZQHH4LNxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFoJ5gAKCRCLPIo+Aiko
 1fBVB/91ODQjaD57ly/5cNAYMElD9ll89OMq6NlKN0qrBbfuJ1bY2gy3jhxt9N4S5WyZRXMD/ML
 l9qXjPgucZH/DwUrA8oZeucUpf838fm3Ya5R/x0OeFLa3Tc0EGL5ApEeJmoShPuAebi9qaS+BuE
 lqxglI85n5Y3eVwKRPOkhCGNLgiSF1ZcXG9tPiW2ViY9j69ECG7Jrb/SJNOeQj54kXg4RN+XzUu
 yAUtaxRNLgETNHQS8NGTXaeBenNw91u5ZlyfemMtyHXlrgqDRB4xk4b8YkC8/+We1HguJLg0Nns
 qdNl29k53TzYzO0sHg1U1r/mxlQ5nS14SZmFXbaNSBikfI3c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a09f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GpPnMnrImHjYsJApwW0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eAdBTeijwkr6Z9srzMv8tpdzhdZ_QETT
X-Proofpoint-GUID: eAdBTeijwkr6Z9srzMv8tpdzhdZ_QETT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNiBTYWx0ZWRfX2TDnS6LH1aYy
 Pme8nYzaDv6cXRBNBv2V6GFqesryEGb1EB7sZkfE92IaqBEXaEqGfaMUnsnGTcgIehJz+6REp6E
 H5pTu02Fh0wrI/rM1sfZKzeRrXi6IisrB8SP0E3a11psiNz2ZUgH0xWNe2tQdO7lgEQHeAxhUly
 auXa/6syHdZc26+QyieLwx3WqwqR8TogLGuHQnlAjfCO+IxNe2VcWdTRGlXqY+av/pX3SgO7Z2F
 cKf80zkGr0MHLt/38t33z9pKT4UoR2gk+ieu3HYW3mo1CJimmMPziwcl30WC+u7XBI1ccQkGJQ6
 XTXwicZSoDJeGx4RBO+/Ml7mI1hLGXUBFG+C8MNqcPXrHwu4/PX/UJnmUwOd9vdfeKrLvAz4u+q
 hJqzGQvxFQO/0m+BIItuPMAb3jJPt0eUyPu9++WXsfxCu5s5lq5U1RhlKg1MTO7WOVaZwvjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240016

As reported by Johan, this platform also doesn't currently support
updating of the UEFI variables. In preparation to reworking match list
for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
variables.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
+	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },

-- 
2.39.5


