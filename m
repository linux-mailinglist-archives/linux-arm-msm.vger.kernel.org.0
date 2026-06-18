Return-Path: <linux-arm-msm+bounces-113797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tH+dF2gpNGo6QQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4316A1E8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mqL8+OuO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OMF8Z7XC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113797-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113797-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FAA930066A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD9348C7F;
	Thu, 18 Jun 2026 17:21:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107C33CE88
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803312; cv=none; b=rPhUdBQIiessuHX/FqRaAI9ycYnN7dyWBfFF9lHt+34ooHkBgg3x5ChJb/YnTfXpcIkjPpp+2F/jk7nUQoIMrQBHSSzx0YPssbVpqhxtkQ0w+xX4Vlmx/NW0YTLjqVMARApbjYmhhazME+NSAOsWr3H8Xm2FhY8Gdt4HpWjpRa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803312; c=relaxed/simple;
	bh=FTCqftpSbxYvrY2G9vmS2EYbmaNyldbXsgyKnqJoXUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJhPhVGxvwCI5VQ5WKhLk/yeuiRhietR8SP3mGD2Oj3VUx6/Z4gaZEK3qWVz4Pquj4fPRPW/2ifDImjZBZPGLTHlmPx/pLGXeoN6VYedvMpVYeOz1RtfIB6SgvE0qTuKN9Sg8M61Ax2truATCjh27V96UTS/d+9orOduQvoFlRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqL8+OuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMF8Z7XC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGcL31952419
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnGyrsBkI9uqyPPjhmfWOv6BfmughC9D0NatDbqM2w0=; b=mqL8+OuO15NPZWx2
	69Js6De6sP1IkNdGWxmM7aNCrH4Ad7vYcrox4ShEEVvBXzuzfhOdmHE4ye7CxljF
	P9VSK86GQMRdqE8oBMItmeaaxkyHwscYZXsasIXDErJKWsnqCE5aH5Iz1pntv1/S
	82fkAhr80+Q8/f+omMn45nClvNam1grQqmKZ7TZT0sAxjfpHpZLJ7B14CyxVjl8V
	oaOuYRITofX/Yq3cc0TO9FXn0RmoqA7ekiEeU8FjnpACtNxD1wO7WOB/j6XoQA/3
	b/tdtMDYewuky3I2SZ3pJ3DVOEXgnakAAg0Z8vAHFhxmne5/4R6pxURFaAuarPqo
	8s5UCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtvegt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so1018288a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803308; x=1782408108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnGyrsBkI9uqyPPjhmfWOv6BfmughC9D0NatDbqM2w0=;
        b=OMF8Z7XCe8m4X7AW5JGO6qrVj8V4f+sVu5wkRZAdCgFsYUlJWr5MjmA/lQB2T4a9it
         KKpbG8+5diM6dPZ9vc2KGK0rbc3aUSF+2kGi+uIvCo5WC8GSNUEvXObWqZeGqCSr4Xj/
         US/xL3kAbjycInYjjAjKcpGwtajCjDFfDnWwsDZztWXb0OhSqmPdu2YlvCPASe1jkFWn
         s/2SOZ8cl62C+6S8rn4nj+Kqa9sRMplB7jlEtSqOFs/aOGGbol7g/P4/UyIduvUVc4jM
         0rQKczdi2iccfD56Zyf4MmxNKhKSQZvHg0LsJYGrC7cmSvpA9Y1Ep/Pqalj8d+uZRQTo
         IrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803308; x=1782408108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GnGyrsBkI9uqyPPjhmfWOv6BfmughC9D0NatDbqM2w0=;
        b=LVNseYLf4yRy5UgNbFXg+64kEF63x6UpKBRnuN1SVtJG6u7kI8m4pKbXeCE/3eEme3
         Xi9DWGn3HfFKe3SYrm5qZnuGiOA+EsSS5FX1CbqHccSjQW+w7dKNnVQ930p0Auh+ZMtk
         3LcbxiVPIveIqaPcKwyh8xxoKvJr+Hx75raePQ3U0htwKkZ7Ci50526wsgm0dj2v/l3S
         JQAg/gYwKi2DXmw+IOGh6eQPk83dmClPqSErocw5Py+9tkxQpErzM0DAhzcDakYQ3vwO
         4Ccv6hbhPIh1+8vGO8jdn44DvBSxJ+NSh2aC4CTE6ZRnjyxeDSaqkLvlExRHhYCc0hel
         V1Ig==
X-Forwarded-Encrypted: i=1; AFNElJ9HzfKXRLfQv8n3bQqGdb8l0m24wDi0BTHLUh5LdVGeQjRUpig2a8ikI8iWcz8qaS+ruq7Om/msF3uhK8M3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0L+vOvgZJeY2FYTNWr4KKf7QR28bF+hQ4ufCsWx9SNofDqjl
	Uq3jjyV7qYEN1i34Q3GLtGkgn+mFZ1Yd3qQ7IyWbRLqf18KMShPHF/l7yAdYXA4DRCEg0/1POQD
	18bfV6G2pdVdWoWpUmpN+EgPIiD8mcEdzOR82lSO4oP6lKZMI7tdSs39AjH5oS7IeMRFv
X-Gm-Gg: AfdE7cnfooZpgzRbuhuyGr9hHyAs+FRkhSjVgpVx/NMtU2GlhEgcJ3n43aWbDvB0w61
	jsdSAhIl8MMbN3kaHa43AyGEHsWHd7pPmLDvm+KRzvk7wQGAIoXoX2bJQ5heTJuRq090+GJMmoC
	3Z5LaN/OhNOr4e46dr1NV2rF8j18j/Gngk9wHhdUTiaclpc7Ln6WGf3gSUWb7dNdAPxcyXKnpGj
	+HjybDXpfEVCltsdXxusmybaif3PEePA89n9L9sEFnUo06f8IaK51roblaqRCAHUsBoBS0cjjPu
	5s2uIo6z8pKUvbwV+gjyNg696U3MYSKcHamQdoZZK3OVBrz+kspsaSBbENXOcmDhhdkqpsZD4lj
	TgUsOx/+XyFbgH51PSBRZsuMee2ToR5hm+Ww=
X-Received: by 2002:a17:90b:564f:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-37d15154135mr466227a91.0.1781803307594;
        Thu, 18 Jun 2026 10:21:47 -0700 (PDT)
X-Received: by 2002:a17:90b:564f:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-37d15154135mr466179a91.0.1781803307029;
        Thu, 18 Jun 2026 10:21:47 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:46 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:19 +0530
Subject: [PATCH 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a34292c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EEPwnKkhLRp6EazAhvcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX87IxCwril5hC
 HuF4JX4K8dkVIJJF9QfguUSGG0i3Adri4Ato8cp0IbmvZ6ckHOdTdyvPdTclGbibOrmU9yTyxNy
 0IRt/8yrKt2QW6YTQj43KNw2KiqsfblpXT6rBFLevOn0TGUeUvTNYuY7QXSg4Wkv7CLC/p8BvKA
 TiHivUcjtBVAGTzI+jXX5rarV6pn1r10n+uNIhAlVEoKn2KnIbnBhN4kPG2MD33Agq53uKiyngB
 7IhAAKACmDonefq59BrioQCiwAhfoLSHTGklclhhCPcz4eIeduYTlXPcL/7fB21cTPExTNo53lJ
 wemc0SSZpfMLOk0ClVsu4By7BILfw/Iad46MzstZuUecmdpO/cG8839cIX+JfRujqjsdRYuSfP/
 jPjCQ+3bGM2owtZaQOw3GDHM+VQtselU8h0aR3xRkpgsbdiUnuRZ9C6/9faGnOW1us7NiQgVRQY
 RBlqDg79fgpLLjVQA9g==
X-Proofpoint-ORIG-GUID: vWuj17ND17f8Hd6HMzsh-kZFDU6e4zJ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfXxmZqm7Vf82Bt
 rugyHpEbdGmcjUo0MRGujikGeJ6VyorAr4hvFwhqJAp7ePaXwRW5N0dxRLvKryBbfHQUBJeNV2L
 Q3CVj7+xcd2ZZSekBlZHtbB+vQJTLwQ=
X-Proofpoint-GUID: vWuj17ND17f8Hd6HMzsh-kZFDU6e4zJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E4316A1E8C

Add support for the global clock controller (GCC) on the Qualcomm Maili
SoC by extending the Hawi global clock controller since Maili is identical
to Hawi and has few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-hawi.c | 200 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 6dd07c772c29bfeab37f620a3c97ace4aebb9acb..22597defa8280568af074e2bf3847dbba93e8dce 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -1115,6 +1115,31 @@ static struct clk_rcg2 gcc_qupv3_wrap4_s4_clk_src = {
 	.clkr.hw.init = &gcc_qupv3_wrap4_s4_clk_src_init,
 };
 
+static const struct freq_tbl ftbl_gcc_qupv3_wrap5_qspi_ref_clk_src[] = {
+	F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
+	F(196078431, P_GCC_GPLL0_OUT_EVEN, 1, 100, 153),
+	F(300000000, P_GCC_GPLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap5_qspi_ref_clk_src_init = {
+	.name = "gcc_qupv3_wrap5_qspi_ref_clk_src",
+	.parent_data = gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap5_qspi_ref_clk_src = {
+	.cmd_rcgr = 0xad024,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap5_qspi_ref_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap5_qspi_ref_clk_src_init,
+};
+
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(400000, P_BI_TCXO, 12, 1, 4),
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
@@ -1282,6 +1307,21 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	},
 };
 
+static struct clk_regmap_div gcc_qupv3_wrap5_s0_clk_src = {
+	.reg = 0xad018,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap5_s0_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_qupv3_wrap5_qspi_ref_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.cmd_rcgr = 0x3904c,
 	.mnd_width = 0,
@@ -2740,6 +2780,68 @@ static struct clk_branch gcc_qupv3_wrap4_s4_clk = {
 	},
 };
 
+static struct clk_branch gcc_qupv3_wrap5_core_2x_clk = {
+	.halt_reg = 0x236bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap5_core_clk = {
+	.halt_reg = 0x236a8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap5_qspi_ref_clk = {
+	.halt_reg = 0xad01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_qspi_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap5_qspi_ref_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap5_s0_clk = {
+	.halt_reg = 0xad004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(17),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap5_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qupv3_wrap_1_m_axi_clk = {
 	.halt_reg = 0x23140,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2860,6 +2962,36 @@ static struct clk_branch gcc_qupv3_wrap_4_s_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_qupv3_wrap_5_m_ahb_clk = {
+	.halt_reg = 0x236a0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x236a0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_5_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_5_s_ahb_clk = {
+	.halt_reg = 0x236a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x236a4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_5_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_sdcc2_ahb_clk = {
 	.halt_reg = 0x14014,
 	.halt_check = BRANCH_HALT,
@@ -3485,6 +3617,11 @@ static struct clk_regmap *gcc_hawi_clocks[] = {
 	[GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb3_prim_phy_pipe_clk_src.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_AXI0C_CLK] = &gcc_video_axi0c_clk.clkr,
+	/*
+	 * Maili-only clocks: NULL here to size the array to the highest Maili
+	 * clock index.
+	 */
+	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,
 };
 
 static struct gdsc *gcc_hawi_gdscs[] = {
@@ -3588,6 +3725,34 @@ static const struct clk_rcg_dfs_data gcc_hawi_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s4_clk_src),
 };
 
+static const struct clk_rcg_dfs_data gcc_maili_dfs_clocks[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_qspi_ref_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_qspi_ref_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap5_qspi_ref_clk_src),
+};
+
 static const struct regmap_config gcc_hawi_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3622,14 +3787,49 @@ static const struct qcom_cc_desc gcc_hawi_desc = {
 	.driver_data = &gcc_hawi_driver_data,
 };
 
+static const struct qcom_cc_driver_data gcc_maili_driver_data = {
+	.clk_cbcrs = gcc_hawi_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_hawi_critical_cbcrs),
+	.dfs_rcgs = gcc_maili_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_maili_dfs_clocks),
+	.clk_regs_configure = clk_hawi_regs_configure,
+};
+
+static const struct qcom_cc_desc gcc_maili_desc = {
+	.config = &gcc_hawi_regmap_config,
+	.clks = gcc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
+	.resets = gcc_hawi_resets,
+	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
+	.gdscs = gcc_hawi_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
+	.use_rpm = true,
+	.driver_data = &gcc_maili_driver_data,
+};
+
 static const struct of_device_id gcc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-gcc" },
+	{ .compatible = "qcom,maili-gcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gcc_hawi_match_table);
 
 static int gcc_hawi_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,maili-gcc")) {
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_CORE_2X_CLK] = &gcc_qupv3_wrap5_core_2x_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_CORE_CLK] = &gcc_qupv3_wrap5_core_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_QSPI_REF_CLK] = &gcc_qupv3_wrap5_qspi_ref_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC] =
+			&gcc_qupv3_wrap5_qspi_ref_clk_src.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_S0_CLK] = &gcc_qupv3_wrap5_s0_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_S0_CLK_SRC] = &gcc_qupv3_wrap5_s0_clk_src.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP_5_M_AHB_CLK] = &gcc_qupv3_wrap_5_m_ahb_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP_5_S_AHB_CLK] = &gcc_qupv3_wrap_5_s_ahb_clk.clkr;
+
+		return qcom_cc_probe(pdev, &gcc_maili_desc);
+	}
+
 	return qcom_cc_probe(pdev, &gcc_hawi_desc);
 }
 

-- 
2.34.1


