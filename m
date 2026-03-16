Return-Path: <linux-arm-msm+bounces-97923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAQvNrjkt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:08:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1972987B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 964583003499
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7604D276038;
	Mon, 16 Mar 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTiUKfT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7i0LxY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9A26ED3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659315; cv=none; b=ksSS4sJkK4KtG0X5RVERm5lxCwG5s6ROAtGCKKfkLY8wkRoHQsF5crjELrwe4CfDwZCcH8gmZFB3mAdLr3Pc4yu+yfmjyyi0hKjhIy1IC/k3KzJm2dxDCJlmcj/6fnfPFqc6u9kE6MvlWY9p0jRMRzhAYRPOwE+Y7ZJfE+l7oiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659315; c=relaxed/simple;
	bh=5z9G36iGlG864HrYcLSh3Ez+Ivcm6CAWx83vQSgXOtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ItKH3BiY7jzSGs60UsrXcYWqqPB8I3GfVqxNpK3n38URHqgHO/WvqcVpnXJ8/VWrDr/nzJTff1P1E26VLpgWBFuQkZoI9lYqWPdckJ2w82fE89mTBfPDxfhXhR/y1gt9H7/Gdtz5cY3Hw1IhLYfE7f2hwJmP8t46Gb7rliMcvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTiUKfT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7i0LxY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eYh2128495
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oXqsxQLD4Ub2Q5AUDVebom
	b6fFMyxal9uPvsIKprlMM=; b=RTiUKfT94BAOeKrNTYUUs6cYqXTH7tt3ANuiip
	nSOKB/BkZhtscuQbG+NJxgN+n9BIp2uRNrEFPDyUaw6hZqEm3OV5RsZB9nvVJ8cB
	1DqwrlqkznFNuLoI9Pu2F3p6GNVv6ksCJLBn8jTLkmhniri98A29SQ6Ekc4xvOPU
	XwAfiwN/MEB11jyhEG6Srmm1qunJi2aOyGhbjUDgVa9jDEMtECd20uyJZs0UV8Bf
	YF3iUTpRqdHodF/jhBiqdL+RB9uO11JFLFEsqMHKAilGH8SE0wFD/IFHPL8zGXLh
	s+4La30cVWkkj6AB/4s3bqVYwCi7Du6e1oBR9hpfpxCcFOyg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00anewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:08:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec784479cso270348645ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659312; x=1774264112; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXqsxQLD4Ub2Q5AUDVebomb6fFMyxal9uPvsIKprlMM=;
        b=a7i0LxY68iq6cT+2AZSiTMR5R0XFB6IwcSbqc340zF5QnPWwL+T6xhbZVU/qNZfkd4
         a8pwh+js00GwXUNpmJGdomxk2w5JC4Pf0d6llrXUT3M9HNwhVSTPalC76Qf5t65Gf4Ex
         4lZzQxfYwmeryE7NrDh7WWHD0uM5QxpBfa9rsXh379HIwow5PnyaS3UrSghAQpot3p6c
         rjhdsBB04jrV5BsZ1A52WJTUAbYjoSIfCLQ8k7LLNRWZSYS/BztuwisHsTQoABbUSUzk
         dpK/UicOh+9emqeCV1tTuR7OQmUuat9nOoKkeE2sykWgRsdjuxP4Vl7V7Oox3ucWwLN2
         jcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659312; x=1774264112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXqsxQLD4Ub2Q5AUDVebomb6fFMyxal9uPvsIKprlMM=;
        b=SzpgpuHNsc92y8LiJfzT1Zc/AeCDFuyqj/05cvEh1CxGAEFPqtWuXahgL6CtKM1JTb
         nVJySStULcZXcs5out/m4wFj0+mO2WvkCPZSsMPYG8AENJxQooZiZ65aaQNb5X6eOSsp
         Th3BhFNGWg5+09FP1aJKBjZbTvxsNqOeZQEIsprGIY1XVqnz50Y5xspoKcQRAZO+dCte
         CFK6FLsXZF48iSir9MC1pfOS1iuH8uYp6eurrGM5hALJOfs01mkJvPRQgwWLUkvO225Q
         eD9Tc/gEThJvAVfjo4jO79mqC3zajRPlAQUIHT023NRKZEIriLc8ft49cmH7JH6aADWr
         GOcA==
X-Forwarded-Encrypted: i=1; AJvYcCXrGjc/5ZjwPu9WyXwYCUkmgkFYLCKN2SWqhPoS0dx3bqPZ93tQ2UH5rr/Ie8PqoqO9OifUKJzb19JBu8wR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28uzGrh8dvRWI9gcPRocmcb81Bj9WCq8LjuvgJI2cXhl/hQWd
	DmsC9PX0+JTgfJLPqjNS/RSEEY3/7DKXHmTXThEzpQhK6Ereda3sUYDydUPq792c462LKAtGlLK
	kzFl/yT1DPOf3Z1uKRN8hhDffVkyf9DuCdxwrOfm8GsdkXTqEDnSPlXJyOWDBFFO2DqdXevvXgU
	eF
X-Gm-Gg: ATEYQzyVHRFuGPifzGh6a05iGxeGuF1ntgxGmEN+TQ7EGhOr5mHXkrF6ykyRW/yti42
	NpV2eczQUrnPSt0Q8ZWdMDWB2/1rHAqIqAql38XTOp1gkVSPHGdtuX97hYZNXNvEZiFeQ3XLcxE
	DkjD7Br+Gw8Z2KXWzKPLpujq/lVJX+ngLPsWgido856EpC9NA0yY6+OnRhKWDj0adV1In5yDgL0
	ctq7X7v/PG28ufG6DldopNsPTSAbQumUtSnq6d+TUixa7/c/AWtQJFQ6RNsmeeAYaxTNVMmgTrx
	X0GYuQLk5N3ik/vL685ibQgiFNASnAI86pW/Dfp86cnw/jwHS/lqWafHpegJM/OtN0MakolK1yM
	cygzf9rgUrvYYDli+wSL++6FxT29OZyiSPThuiwtUQ0P1O5n88q0e
X-Received: by 2002:a17:902:e74a:b0:2ae:cefd:18d6 with SMTP id d9443c01a7336-2aecefd216bmr128510145ad.2.1773659312011;
        Mon, 16 Mar 2026 04:08:32 -0700 (PDT)
X-Received: by 2002:a17:902:e74a:b0:2ae:cefd:18d6 with SMTP id d9443c01a7336-2aecefd216bmr128509855ad.2.1773659311598;
        Mon, 16 Mar 2026 04:08:31 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed6cfsm134447115ad.59.2026.03.16.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:08:31 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:38:21 +0530
Subject: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKTkt2kC/x3MOw6DMAwA0Ksgz1gC0jD0KqiDk5hiFZISQz9C3
 L1Rx7e8A5SzsMK1OiDzS1RSLGjrCvxE8c4ooRi6pusb0/Y40ZIId3W4bg79/ECa3/RVTBGdDxe
 2o7HWMJThmXmUz38fbuf5AziVEnxtAAAA
X-Change-ID: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: hXKIwy-OTvp_hAIcb5_S_bb3IsNB7Nh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NSBTYWx0ZWRfX89UeNZyIGbdu
 R1axNP5cQbE1YZ6nXi0vz7b2iMHNw9NKIspSA6J41yvJnEuf/+SrZnfX5ZeO2J/9ZpPJas+kNSt
 jP2MWJnrN8o46gwV/rVKJpvWhCQvBeNdBlK9Tk9d4p2uM7IlAO15D3Zy5TEQfC3h4m27iA3xtWm
 dd33TFQMuvykkTmDBIq4eOYyWozXns6X+yfRAabFoREI9/PNoW93MsACYx6IwvWpsIzFKmWkF5v
 5smNv6RxMdGIAt46BBm8fI7XloTH943EXUwR1id9tCp4Qt2IUr8UWSi0+EJ7HmF+DsC3mn/a8Ju
 mVynIyzVAEcDd9L5hVM/dAOP62jeLVx4+QtvyS01XPZd7lqCPxbS1mKuyGy7I+rcU48f3tgwpZf
 eZrYAcK0NCIzOOR2mUtzoz8DNxUpMgw0fz7m0YIUyy0NP32253DOp0cnS67l1MQU62kCYntIc36
 BQGAZJPj4riRRcH1CGQ==
X-Proofpoint-ORIG-GUID: hXKIwy-OTvp_hAIcb5_S_bb3IsNB7Nh-
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7e4b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4CI3Usps31ucNWVHWDoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97923-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC1972987B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Keep GCC USB QTB clock always ON which is required for SMMU
invalidation on X1E80100 platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
 
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52224, 0x0);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


