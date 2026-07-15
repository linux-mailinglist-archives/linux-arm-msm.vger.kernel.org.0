Return-Path: <linux-arm-msm+bounces-119153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tfV7HfIoV2qtGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D775B0F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:30:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P9rqqRJK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TVne5EaX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 578C6308080F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD9B315D3E;
	Wed, 15 Jul 2026 06:23:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA530AAA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:23:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096600; cv=none; b=eWPZzeAykZUv+JmSzNYA+DcNsi6E7r2Xuunu1KyGWrbCxz4NzkLmHlpIES6hlzgZK4xDLtzWNUsZ8HjMzq//QbGPyKHw0bxOlNjMFFz9bBFHwhdtmheFto/lOS0CSrWATACwCtEwLwM20tMVv24DyWQ3i2RzYIEiRhUN8InrT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096600; c=relaxed/simple;
	bh=80rMppBxr7aVVbSmG1tEhmzZwzZslaQo+qJjlFgRLIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CvP5Ue1tSdNacR+gPcuQ+Q5ilgvD5l09I8XUAy/yT2B8QeBW6sLX+Odm0ySZQd5EqWwmi25xA2mTxQxR/ZuoR+kPJ2kfL6hxHLMMFCe2HM9e6DwqIsPrNi4wAxEYCNYnmg1pCTyM4PH71KZuh/MaQAwBmqo0qRDCzkNrHP5yMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9rqqRJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVne5EaX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l7SH2503722
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/ZSNMh2ztTjVKC+XxY4aH
	3WK0u8X/7pWi5GQJgqrlE=; b=P9rqqRJKToLWxVmMKGBDQSvcJ5Vq0K7saw9SpD
	Pfy38m9OxD8Z85BZfmziTfvNDAzjcj/+yTrIsofpiLG2InCWRGK4pEqcJiWXPM5T
	8KMc3mvXMNTjkWgrc78VAUusEFQmedaYEzkYDf+FPwyg3BSVjdGG8ZyW3J7/2QRO
	Vi0UaFXosITk2pvsLLojiNb6ad7WhTOF4GvLPkSiqp6sxhJ2PYfysa7ogiIvybys
	xra4oH1oqNjhjomZ7ecuhk96/Cq2EsEKbU9p7r5pI9KVGVJVPXWNjiTm7pMtgPZk
	X/gYzScnWEmEobFJ22tnt4kSdG6pOQZsGLRlGnUT8DE6A5xA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk31cvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:23:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so62733325ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784096595; x=1784701395; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/ZSNMh2ztTjVKC+XxY4aH3WK0u8X/7pWi5GQJgqrlE=;
        b=TVne5EaXckWgNeQEqDhBLECHocH1mL5raWP/fonRu408fkCqhtHrktZZQvx9w8E9Nz
         O2EjCcJBwMAxM+H2aInhAJ7dzKq9mbJHerVSNOF4VHcOpfnzuue0PU0g+9xjsw//9g0j
         /snIoCTRw7KFCwhe0CzQCwlnbdEOwqHIjDKq+fMPKdQeBW7QTe4fceiBafsccGspLmt5
         ikDT4CMJKEvwVpK19p1jVMOH6qeTWPZNuGWp3xzizCBl/+6QDeC/QvXt7+R8Mr/ukbKQ
         QGOMeJRAv2vyx+v8JLVXfLiIMQZrkddYddVW9UZqQ0H+uHPMzx+Ztn3eSGPqm+D/1VBY
         ba7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096595; x=1784701395;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g/ZSNMh2ztTjVKC+XxY4aH3WK0u8X/7pWi5GQJgqrlE=;
        b=WM3YTydgLJnYGwnGIgXfTzsHFCSJgkznJDtUT+ly3hBLGmcUO77RBAopTdYFHSN1cQ
         aMX+csMGIQ5htDEkm00Bltv98z4sgZ9QwasCR5TzulIUNsIlohhxYRHuC0XqwY3p5hJG
         whBooVjnsLn4882FgANgzXFJA4t5f3p9YQYNryHhd5w65eo2R23r8HKh3yUNiPRQGqe2
         fRW7TQqGQCAqxmyEn8oyqxQHcVk3iXUPPJZFHpxVc1VxmA3LWMcJDIAkRQrrkC11Dl/n
         SYR4Pa7KBpMTeZrR1TAmY+6AMjSg66krG9MuHiFuf5r3sjoEb0XP6bcaNuQZImbDsY9q
         iwlg==
X-Gm-Message-State: AOJu0Yx9KiEQjf4rtNWtODMksSVgqxIu4ohC533QhxOVo0kQ9K6IRk3A
	TLijfkgKXyC3rKhNRZjZnKUf3nfrWAQQMiOufAFhG4F+YyhBvSWtPnPtnGx013S+xON1/ZBC3PD
	1YOsSHcZg3fYBvqR8088uQOjugPrFs5kAO9L5tqRZrVFfKPuiy/yDtKpTET8oVCFI+RXL
X-Gm-Gg: AfdE7ck4BhCDx44VA/X/bIv30J2kWWbdnX+UcO0RsxQp8h4gKu1nYCESY5cLSXAqT4u
	Ai0FkL+yrHZkUK4uroKarN9kzJJ09gLq+VgdhIkS5g7RVWw43IEqrqS636S4wt/WkMFzZO7nZLF
	ks17Wc1tQO/PTFrlTxhGUL02Vv/jWWZnleVoLgOQGQ2SceVzMwy3FEsEQJvjboyURvgo93RXKFK
	Xu+zm3Y3q+TVTE+llo5okC9SsA7GXFxnmEVInfrhDSrJHNXI9H63O+2wHx2o6s/08JTbkop5qbC
	QvvcV/29REzNTnXbdN9yvNLQvUPLcdWPeGApDTwLzWnI92uiOUMvCUF4VefBVh9tTK1N4lHFHCl
	q3B9s46I7xHreAXmwwEC/ctS5dkl1bKpmkLr6YcV9Hj/k/FJPktDT8woqYg==
X-Received: by 2002:a17:902:fda8:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cef1370d34mr50133745ad.43.1784096595410;
        Tue, 14 Jul 2026 23:23:15 -0700 (PDT)
X-Received: by 2002:a17:902:fda8:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cef1370d34mr50133575ad.43.1784096594994;
        Tue, 14 Jul 2026 23:23:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c20616sm127945975ad.34.2026.07.14.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:23:14 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 23:23:13 -0700
Subject: [PATCH] clk: qcom: gcc: Set FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON
 for PCIe pipe clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFAnV2oC/2WNQQ6CMBBFr0JmbUmLWMWV9zDElDpIjaXagUZDe
 ndbXLqZ5CXvv1mA0BskOBYLeAyGjBsTiE0BelDjDZm5JoaKV5LvecMs2osbGdd13/Atl7qTkOS
 nx96819C5/THN3R31lNfZGAxNzn/WT0Fk7y8aBBOsU6ms651s8HByROVrVg/trC3TgTbG+AWWi
 rb2tQAAAA==
X-Change-ID: 20260709-mem_on-0c4f90306cb6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784096594; l=4719;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=80rMppBxr7aVVbSmG1tEhmzZwzZslaQo+qJjlFgRLIQ=;
 b=lwvHAVWpFZNleTYEwBZPeo8+HkfjBkDkboPGZC3KelhDFg+pCsG6aN1bz/Ww8wIYtgA2haHXd
 voAXStQU45xDBo8Kd2CEQsrOgGjDhM48JQaBc++j+e71BC+qzkPfB2J
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a572754 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Zdl20m3D5pEWJIyXYvkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Mq7r0fsgbzyWNWXtUqB-xcU--C0R0iAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1OSBTYWx0ZWRfXz8AQevHPnb/n
 VrQ+V9XkhcV5pmaBoPpn+eNxpdnctLpNwLc2H9K6POMuKkBoIJZMCT5c+1t6fBfqjKmXrTtspJ6
 5z9pvGdLLHbLVQ125yJssjGCUNUZdX6mZprEVazmLai1daE/ShM9EvvtRFUPzy1wvhkojiLCU4o
 TrbvBcMXdLwwVqaYqdqDGHMYcF/Mv1FzQ2EdpJ/8sZk7ktlNNRb/9ztQeZvyyIAcsdk2G3AZbAS
 D4xU9NBECN4+hhEfr01evQq3qMJEESrBXkwHMf+8IIJ6gKbXQ2cjfWFyrSzT1BclW7fUFtiYMaL
 dl7YyUXZORVhkrbluZbFAZJAIA2suDta0shn7UL4yfAiFL75/zpef75f5It3m5RzhXEOuyqgLxV
 cJObTIngs2FPC7KlbXLmveq9Rus37G1BjCdQIrL0TAj1kYeohprIQOGEIo3BPY8dLT8QNg75b4n
 db5mtc3aqts6wJB44BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1OSBTYWx0ZWRfX1dxY7DiDCZfL
 PVV9hZrR2kMyWc7JZ0ioAX4qaSVmJFI4lslT4q+LMqn7uKRx1/okgVWcUHGNuTnRbWMvkhMn9FN
 rAOwNv6iv3i/1yhTkdt7NhHoxJoRc/U=
X-Proofpoint-GUID: Mq7r0fsgbzyWNWXtUqB-xcU--C0R0iAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119153-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE3D775B0F9

Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
clocks so that the inbound data path works correctly.

Without this, the PCIe link can come up but the endpoint can not access
host memory, with the host sometimes seeing a completion timeout
reported by the EP, even though the host can still read the EP's config
space.

This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
platforms.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c    | 11 +++++++++++
 drivers/clk/qcom/gcc-kaanapali.c |  3 +++
 drivers/clk/qcom/gcc-nord.c      | 13 +++++++++++++
 drivers/clk/qcom/gcc-qdu1000.c   |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 6925c6865089..1e33160e03fb 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8530,6 +8530,17 @@ static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
 {
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_3a_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_3a_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_3b_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_3b_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_4_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_4_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_5_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_5_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_6_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_6_pipe_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_glymur_driver_data = {
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 842c1a70c691..4bde2dcfc4fb 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3482,6 +3482,9 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 {
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_0_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_0_pipe_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 7c7c2171ac96..66889e9159ec 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1849,9 +1849,22 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
+static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_a_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_a_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_b_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_b_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_c_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_c_pipe_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_d_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_d_pipe_clk, true);
+}
+
 static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+	.clk_regs_configure = clk_nord_regs_configure,
 };
 
 static const struct qcom_cc_desc gcc_nord_desc = {
diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..18ed351f2a16 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2669,6 +2669,9 @@ static int gcc_qdu1000_probe(struct platform_device *pdev)
 	/* Update FORCE_MEM_CORE_ON for gcc_pcie_0_mstr_axi_clk */
 	regmap_update_bits(regmap, 0x9d024, BIT(14), BIT(14));
 
+	qcom_branch_set_force_mem_core(regmap, gcc_pcie_0_pipe_clk, true);
+	qcom_branch_set_force_periph_on(regmap, gcc_pcie_0_pipe_clk, true);
+
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));
 	if (ret)

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-mem_on-0c4f90306cb6

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


