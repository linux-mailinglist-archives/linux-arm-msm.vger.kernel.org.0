Return-Path: <linux-arm-msm+bounces-116095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RmeeDpiyRmpYbwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:48:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C46FC4BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:48:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aEMosdck;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CIoiJZro;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116095-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116095-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4C531792D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6E7343884;
	Thu,  2 Jul 2026 18:33:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE2344D9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017183; cv=none; b=ABsLcmIbNxaXU1Y98P9qwJtZHv4NwMl+XjFGAn+3/4BwsBe0xx6ATWJneSVTiFg58wqwTQUAZd0QNQoSjhYjkz4RdhHd8xI8mti9z1rK38fuvxZVN/c8ft9M7rWYMwPUJboOHdyuA2/XhrPl+DfI9AIDhVQlkRnIi5bqu9I9iXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017183; c=relaxed/simple;
	bh=EQ0/anXpp36UbmkkrifciSQBhUA9XydafZ5XfsaRxZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/HU74X0GbPrGkOlGyz6nJWbRvvPbE91O6su50YgEe/nhFgpJqjWCAWUBw5m5ZE0HSB2C6t6uAhz4mKf8d45NeVlGGPbhifdgnUSUYv4D6M2MaL6m20mCzlMsKkQZ7M5s5f3mSGzCWzdAgmzpyHQfPqwd+w4EzBDl4yZUznS+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEMosdck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIoiJZro; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3VYW666061
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OYqP1NJ4fry9zsg9rVvuITerbxA/seh55L163RIddk=; b=aEMosdckLnlqjv1q
	nyUIzysN1jC7TZzplz41wESiNemRxA3vIYOteyE5UfGp1LR0I/hv3MhiVPl0OmJx
	3HtOUqFmFpBRFbLnhyYYA0lscK81b65yIB0hiRrOE1hqJ/O1/xcMopZJojhf/nRW
	K/Y7wXjILTDPyB2dIhRckFALcPIcC/yYeei4n/RrPL2O7DwccpoUSybBfD8c+aKd
	QB7GTxRSTPGuzDFfczDm8f7LJdL+bHJj1JAcYNCjOiZ/3ux25XIYbY3z1QFGKYWq
	DfxfbmtWJmOvPTGgL9YWaIkYrpQKWNQwOVCqOsI82n3D/LRhnbgAxhVlaopLJjT/
	a6htvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2qp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:32:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1909181a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017178; x=1783621978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OYqP1NJ4fry9zsg9rVvuITerbxA/seh55L163RIddk=;
        b=CIoiJZro+q9V3RMVI1zZpdcQWJT8ntL0kbPtZ+q29UBRwwHYLPcBOjsEZqBj+69GmB
         D00/BI/RrsbHO6ZS0gGGJIQXLnIvungZllXxuyw6wzzoMUdhLoWTAfeG++J2HvEnbWgF
         sLjGhkf8hEpM58MaUuqnUgZCrBrHYYYGM4xBec2q0gSxFRa1DazRJ/eIh1DaRKZ/EdEl
         siMNuAZM3erLCoOmr1RVRlNzk9xoH82iOmoiZrxfYruje9lhJikLpI4X7JCBAw+sW2QD
         yFD/1EU6WQEvqZ9/0jP5cd7fJuKJ3OGiFmksThdruhKY8v+dGiurcLbqmx1aPhBZOIYl
         /c4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017178; x=1783621978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0OYqP1NJ4fry9zsg9rVvuITerbxA/seh55L163RIddk=;
        b=TNNBH7gpX59rCCTtGgRmP54+/sXIeP0XLTdqyn8+mIA0HW9F4rFlvuQQHmY2gI5kc+
         di3/omWEgYPUDlZpr4YdTKMiZVVivY39mkvl8cvMHkdKh0OsoIIMZb70EwDwxlHxMKD8
         /sHGsAgw/5+jLQdDMDv8ygwNlUCOn5c8dzkidLBRV0BD1jX45Fl+ByJGojvmxCxLTvht
         VrFPdMj/nXnDQjpvz5rCjRQtufPBoKFaP3g5kx5NrV0unBlDqy0+aywMhN1TcLgKGFV7
         0+4MU00laSgqiRojXnn3QwjbpjMCtTqwNXlYsy0T+rft2rkGrGF0PcPaQ6HRZkoIF9bh
         LMlw==
X-Forwarded-Encrypted: i=1; AFNElJ+R3zLGcgUzQjuatLeuCH9PJZgwF9jvDhWMx28s9DwCSirBDPOmG3Y9o5ie72AleU0S6+wddru3uJCxTptH@vger.kernel.org
X-Gm-Message-State: AOJu0Yydto7jn0l2jEWolNh7Ngx+z5d5dchdNx2Ev9r4rYUqzQscY6dv
	SqJIsFPEl15rA+nOmaZR1i2FHUr6hY/DK+8FQ6HiXm1GxrVa/ZNmQ9shkPEMHEUaffiRrVHa2OZ
	VYm+HT5LHSb5O8uyRgKHgOYtj2l1JvvzvtjIvzNhEnSdKRxWiZ7DS7In+TZSX0XMiefH1
X-Gm-Gg: AfdE7clu5xKHBhTp7ZHCoKd82ciOgMaRPhKrzadDLVigTUDMBhCHayInGzjR/7hFOzy
	/uJ6hg1EEE+ruSFoI1+4GdIeygZTl+b9kjhgaHoHBA7NpSnhyM3TImviqIRROcoskLNwADxHs2t
	kQKNKTanBJkfu/5Y1FNLe0DyhplJKI0xsvImYscBYI0osX5W43/EJAejsrAbOk2ioagcFML3Ve3
	QJLG3p1ITbtQmcqtkLnIopxwIXra39g31N6616V5bvA3UTOvv9fUFZ4vp3fn9pz0mSMETidO4zU
	QVxjTTPr6mh8FgXobHlQ2h5gDPTK9vJkf+G/UfyuJWfCzC1sVOOTU6qSP362TkPkWKk3JmwZRYd
	qUokW3wR74AThjx8eLWOXGZ3hNOSt77GD2IMVQH7ADQ==
X-Received: by 2002:a05:6a20:6f93:b0:3bf:e2f1:1b18 with SMTP id adf61e73a8af0-3bff4302edemr7502488637.49.1783017178247;
        Thu, 02 Jul 2026 11:32:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f93:b0:3bf:e2f1:1b18 with SMTP id adf61e73a8af0-3bff4302edemr7502436637.49.1783017177605;
        Thu, 02 Jul 2026 11:32:57 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:32:57 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:23 +0530
Subject: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: r4MvjfWrbngkqOXC9hMPFuqUs6KC51lv
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46aedb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MT0SBaNxHzCOmR3iQeUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX4LrvK5WyIxIW
 OidqtjibIMYR82th9fMh6pHg9mp9do1SCQobrhGRqX8iHaBBRuo0Mwmqc4qFIcu37K0y8cSBsRT
 C5goHn99JN0EuCD66/9+YDs2OFcGVwu7VHlSCVINFXf0FHnD4ybT7lEf8TLMiAGCnbG0z+rTYxe
 WD+UH/CQ6pQiQlRjPEnJhXWlO7DhkRruhEAG06wH9n8V5k6G+tdBMbdJ5z6N5qwpKpOPUv5WOmb
 6YTHqAhoV4cAKyYpkgKGJbIaTi2q1N0sb7vyw7QuhxflSGExi2hHcrpRG0+ZQ6DW/M4zwsh1/5L
 cSKNmxD9B5s/rJmtx+eC1RBLjTAfSEuZ1uvM5c+vrGVFCBe5DRR4t7HbNdCHxomwq2bEPvv0muo
 hbeC6+SA/y1KozXioOES2qrf98TS1bIrR+WGW4KypLhwQDmAS23E3JGjW7CA4vA7UJUMglpmfXJ
 49jO/Byd4N7Ma6slu1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX2odvTueczrMQ
 a6iTPMbzEe6PAlZwTaV/Hnc/a74qQOy5x03eHIAIuEnNCfyJx2AkxHNvWU4uiugmajJ8ro9m53D
 eWxd2869sRK6eheh/S9RaTo1maCaRTI=
X-Proofpoint-GUID: r4MvjfWrbngkqOXC9hMPFuqUs6KC51lv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116095-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 490C46FC4BD

Some GCC branch clocks are required to be kept always-on due to the
hardware requirements. Drop the modelling of those always-on QCM2290 GCC
clocks and use the latest .clk_cbcr convention to keep them enabled from
probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 113 ++++++-----------------------------------
 1 file changed, 15 insertions(+), 98 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 6684cab63ae1160848631d1f8cd3c9cb691ff4ec..c6de8d368ec4c69d38f59a8efaed6d66ab14a5b8 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -1397,36 +1397,6 @@ static struct clk_branch gcc_cam_throttle_rt_clk = {
 	},
 };
 
-static struct clk_branch gcc_camera_ahb_clk = {
-	.halt_reg = 0x17008,
-	.halt_check = BRANCH_HALT_DELAY,
-	.hwcg_reg = 0x17008,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x17008,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_camera_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_camera_xo_clk = {
-	.halt_reg = 0x17028,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x17028,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_camera_xo_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_camss_axi_clk = {
 	.halt_reg = 0x58044,
 	.halt_check = BRANCH_HALT,
@@ -1825,22 +1795,6 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_disp_ahb_clk = {
-	.halt_reg = 0x1700c,
-	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x1700c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x1700c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_disp_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
 	.reg = 0x17058,
 	.shift = 0,
@@ -1899,20 +1853,6 @@ static struct clk_branch gcc_disp_throttle_core_clk = {
 	},
 };
 
-static struct clk_branch gcc_disp_xo_clk = {
-	.halt_reg = 0x1702c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x1702c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_disp_xo_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x4d000,
 	.halt_check = BRANCH_HALT,
@@ -1964,22 +1904,6 @@ static struct clk_branch gcc_gp3_clk = {
 	},
 };
 
-static struct clk_branch gcc_gpu_cfg_ahb_clk = {
-	.halt_reg = 0x36004,
-	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x36004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x36004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_gpu_cfg_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gpu_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -2439,22 +2363,6 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	},
 };
 
-static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
-	.halt_reg = 0x2b06c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x2b06c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x79004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_sys_noc_cpuss_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_sys_noc_usb3_prim_axi_clk = {
 	.halt_reg = 0x1a080,
 	.halt_check = BRANCH_HALT,
@@ -2775,8 +2683,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAM_THROTTLE_NRT_CLK] = &gcc_cam_throttle_nrt_clk.clkr,
 	[GCC_CAM_THROTTLE_RT_CLK] = &gcc_cam_throttle_rt_clk.clkr,
-	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
-	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
 	[GCC_CAMSS_AXI_CLK] = &gcc_camss_axi_clk.clkr,
 	[GCC_CAMSS_AXI_CLK_SRC] = &gcc_camss_axi_clk_src.clkr,
 	[GCC_CAMSS_CAMNOC_ATB_CLK] = &gcc_camss_camnoc_atb_clk.clkr,
@@ -2817,19 +2723,16 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_CAMSS_TOP_AHB_CLK] = &gcc_camss_top_ahb_clk.clkr,
 	[GCC_CAMSS_TOP_AHB_CLK_SRC] = &gcc_camss_top_ahb_clk_src.clkr,
 	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
-	[GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
 	[GCC_DISP_GPLL0_CLK_SRC] = &gcc_disp_gpll0_clk_src.clkr,
 	[GCC_DISP_GPLL0_DIV_CLK_SRC] = &gcc_disp_gpll0_div_clk_src.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
 	[GCC_DISP_THROTTLE_CORE_CLK] = &gcc_disp_throttle_core_clk.clkr,
-	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
 	[GCC_GP2_CLK_SRC] = &gcc_gp2_clk_src.clkr,
 	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
 	[GCC_GP3_CLK_SRC] = &gcc_gp3_clk_src.clkr,
-	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
 	[GCC_GPU_GPLL0_CLK_SRC] = &gcc_gpu_gpll0_clk_src.clkr,
 	[GCC_GPU_GPLL0_DIV_CLK_SRC] = &gcc_gpu_gpll0_div_clk_src.clkr,
 	[GCC_GPU_IREF_CLK] = &gcc_gpu_iref_clk.clkr,
@@ -2870,7 +2773,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] = {
 	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
 	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
 	[GCC_SDCC2_APPS_CLK_SRC] = &gcc_sdcc2_apps_clk_src.clkr,
-	[GCC_SYS_NOC_CPUSS_AHB_CLK] = &gcc_sys_noc_cpuss_ahb_clk.clkr,
 	[GCC_SYS_NOC_USB3_PRIM_AXI_CLK] = &gcc_sys_noc_usb3_prim_axi_clk.clkr,
 	[GCC_USB30_PRIM_MASTER_CLK] = &gcc_usb30_prim_master_clk.clkr,
 	[GCC_USB30_PRIM_MASTER_CLK_SRC] = &gcc_usb30_prim_master_clk_src.clkr,
@@ -2943,6 +2845,15 @@ static struct gdsc *gcc_qcm2290_gdscs[] = {
 	[HLOS1_VOTE_MM_SNOC_MMU_TBU_NRT_GDSC] = &hlos1_vote_mm_snoc_mmu_tbu_nrt_gdsc,
 };
 
+static const u32 gcc_qcm2290_critical_cbcrs[] = {
+	0x17008, /* GCC_CAMERA_AHB_CLK */
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x1700c, /* GCC_DISP_AHB_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+	0x36004, /* GCC_GPU_CFG_AHB_CLK */
+	0x79004, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
 	DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
@@ -2960,6 +2871,11 @@ static const struct regmap_config gcc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gcc_qcm2290_driver_data = {
+	.clk_cbcrs = gcc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gcc_qcm2290_desc = {
 	.config = &gcc_qcm2290_regmap_config,
 	.clks = gcc_qcm2290_clocks,
@@ -2968,6 +2884,7 @@ static const struct qcom_cc_desc gcc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcm2290_resets),
 	.gdscs = gcc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcm2290_gdscs),
+	.driver_data = &gcc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gcc_qcm2290_match_table[] = {

-- 
2.34.1


