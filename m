Return-Path: <linux-arm-msm+bounces-61215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA4AD8963
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 12:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FF35176BD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 10:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBE72C15A6;
	Fri, 13 Jun 2025 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxztKpoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255720DD4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810172; cv=none; b=kJgoDfMs29Cqig0zLUsEKUr75hwnQVOMk8k421TYiPBFNYshJT2yiKwA+1+wVZbwZg4gssp5iUhovIgP4SnUfQS0VoYMFZsS7sMS5PEFICwu5ZjlfGQli7bu1vdypJ5rcZWxGCB1d0NtTLIz2dfQWpzHG4WU/8ZEHvYNsMcptMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810172; c=relaxed/simple;
	bh=/ko4VAc7Kurm9pz6j3wyhtvEDMT9yyBb22sJ1k4+hc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BIolTZweMRDXA23uenAjpArIc+VmVWolF0jF1ny2lEIxbmkp189eRefoqNuEGw2qzzsSSmgiIHZfoSBHG/1gKG2OAapTyiCcolKYSstrv+hmntwtNe3w7uJJi9FocLSkW9ybGQzh1cPAqXDfVgk3guRXJMVRZLxad41kVsSf34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxztKpoe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CJqXML002515
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=msZooW9TzMJG9WPzjMfynLiq2c/zkP7Sde1
	TD8zgASw=; b=jxztKpoeUn2d7iIhanyVXCNkqDIQBdzpbpOufVSNevt1iKlaQf1
	AzfiRGjtEmVYn6aUUNMr5cCW/kshemcW/Z8DY/nOA5jVwXZPJRuHXh5V6rgyfS9P
	nvZYksQDd3OqG+Tn4fuhlK+a3z/3db9jUONx8H1NBHQfqtiu+F1CL2DkvbDLQDh8
	lYzlo0d/z3lPEbatOWdhiekyYKtLNwmGhk9uIln6gD6Jj7VNgjJH0v1iO1+s/ChH
	6y1jDJya6WGCaK6zAklHX7kqc1xQIdzcrOAJNRbFDoJz9rvF+wFnNm7UbZZXG2Ic
	sNd5Aq5kUzXEDq/T9196HxIcxpKh3t2qfLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpmr9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 10:22:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097fd7b32so467357985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 03:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810169; x=1750414969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msZooW9TzMJG9WPzjMfynLiq2c/zkP7Sde1TD8zgASw=;
        b=KbsfAR6SlzYVpJgsfoyKoSOZ5qphhyRQNwiIZONDfaWhwn0Dv7HoZ9AdToW6+StfcF
         PjML08S0SCAdBf+ZGiLQmBa+sh3t0bi3W9fC934I4IchzdJTQWTXMQ1nrktINh6y3GCl
         cY/vBmBi55CkoKKCA6qM1bVqzJUZxk52aoWDcE247sme8dhEgAiDQ+QrmjZqp5TYL8r3
         lGitDFzRZMy7dkyTwjA/iT7o3Tz0JdlWDoOAKohb3HntamMwcpK6rvSNnZMeKdau9HnH
         9FylWI9Gmx1tapsTW2gygIYV17QkjHQUbNnc3rLPYTVZRkLLlV1HInCMGHs2s8CRrE6u
         P5TQ==
X-Gm-Message-State: AOJu0YykUp2jZHjfBSAMAgBqbjEJdjggRuDfQurTgu2T4FgwKU/VKcR+
	IB2Nm+wvRPVwCS27T0H5QhKr9xTD4HPIT7BaCINt+Lr228pXcmZn9PkXPONvypjuyTiG/f9NOPS
	f+FaNBBWbr05lZJVrOo1ws1M4uWSrGQtvK9ruYmh0SWH10w1rEg7K6PQROm1h51Z7W7AS
X-Gm-Gg: ASbGncuwGZbDC1L17ugs9JaH5r/aB8+mzpMsOrKm/zO38sfKAJNayM88CFMKbCXfS2v
	wID6zDXu2agRQXABpURuhsjFmeRXB01MDffIlo8Wn1xi+nWopRCf860ELIozxuaPH9+DqncgT0e
	G9mhZ0vZWszzRICDS6+fvV5m0rcteTzLj2gHk2qFawHfgESamQmA4fNDxUHrVmv/hOWq6JCVxPS
	avpfayFAx9J6XN+FuqIX9uDnMcjdNm/RwHOXT2o6gZa0zWPEoqpfiaTcu9TUXPd/QJtd3HWL6Zj
	s+XAHFwAJkl+LAcVUTbKW83oy3ZVoRSHsPfF/B5xYC5H2Bib9d1nkNYWgQ==
X-Received: by 2002:ad4:5c48:0:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6fb3e5fb201mr35148626d6.20.1749810168628;
        Fri, 13 Jun 2025 03:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2q2JVvnbS5iPOysAEEnqmdOpxYa+UWuG3YVGBZzT3xI8naze6tKauWBsDr+WbLoFQM5TEvA==
X-Received: by 2002:ad4:5c48:0:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6fb3e5fb201mr35148126d6.20.1749810168186;
        Fri, 13 Jun 2025 03:22:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:6c94:78f6:53eb:105a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e169d90sm48764415e9.32.2025.06.13.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:22:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
Date: Fri, 13 Jun 2025 12:22:45 +0200
Message-Id: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oxQU4sU-nsyLCHM3URCZvsS4defDQPo3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA3NSBTYWx0ZWRfX0FMerx9pP8mD
 9O7ZXQpl6v0O47E9oyj7bll6CVeWxy6ay5Ec9OqjKjQUm4/7fhxM55f4FYw8nJiZRMI0Wp7kjri
 RazG1n6HrTaKKVzJiX2t8cErv8fUf3pWFZfoEtlRdPEvhjf/rArejgJ1bqSruJYiu9zQV7taqVt
 rXJGcFZNNGISIYbcz7X6hFULviD+WHbX/sOH4YGTga3mmtd2yo3kAk2yaDfl8pys4mwiEGL3yLp
 SKuVMZv8QTOPfchSqfH1le2s/iNtGwpqdZxjKKt83Bdg6JS58F83ZoRYGVCZfZcncqg3wwULDIc
 dycgxtwbSy477JeCMZ920ze376JCXyMYwyiojqVW0MHcfVU5GT2wwi0+oCxd/sE1/Ww6S8IPJXH
 ZJ4p3nKkftvjlIcRWz1VkM6HM58nZfBGNFw00PZGUsAE/HvL76cYZJVXyhPUi/BCuaTeS620
X-Proofpoint-ORIG-GUID: oxQU4sU-nsyLCHM3URCZvsS4defDQPo3
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684bfbf9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=jrCoHfwh-vQAHiHKchkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130075

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 9a6703365e61..6684cab63ae1 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -2720,6 +2720,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.34.1


