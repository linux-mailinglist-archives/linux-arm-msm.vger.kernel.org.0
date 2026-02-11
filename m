Return-Path: <linux-arm-msm+bounces-92613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XVsoL97IjGk4tAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:22:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7A126D59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B612B30166EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 18:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8989A346E6D;
	Wed, 11 Feb 2026 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o28xQ5zJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvZD6i4E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D40342539
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834140; cv=none; b=IX5YxlW0vzA8bxsAT9WWdV68pMGScwvDZj0CuruQkylCNbcqBwFIWyr2QZYmN218oRqfERxTg+NzS2vrOOTi1cVSBXSoV4DC1dNEEWrg5CNqtHjiYyov+I+d17vpDbc6MV5gftPUkFaOqLIxZduztEmJnSfefKc/RdFq/33ts5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834140; c=relaxed/simple;
	bh=jWM31g6lNle0yzrLIbqPRb8Vd8t6ZavnbM741oDRnJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ds1L7hX4azujBjWBlPvpX3/Zk8vvwBDC/nQxBlsFHYnLiqfEEDbng/1W0moGQg7TqrNAx/T/EfjFj/wle5Hyqu2JI6PZUwHOkcZiyjcq9cf27mfGkShBEvKoZ0wNG11Z0TTfWikH3fTUJVFvIB7lJsZt7yH2ao9Gxq1pFlPMnu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o28xQ5zJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvZD6i4E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BHKRbR169621
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 18:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hyMgmDuoLee0i09BUrbQao
	vhMTJNH4r9obEscx0eIEQ=; b=o28xQ5zJaYfmckUpWTvnyVd+RqgziTqe+CcA/H
	qy+Y04ig5wNSs38Bgw3PcSbQAj0IQxxRkg/YtUOkTG/ELkdz/SJ/nEo9ya6/evDG
	HcyVlaOlRiVZ8WN1WErDMoQcJMU/HMmx0O6AiEAuceoTU0YZv5fWe4wzPKrOWWLr
	WkXhjvtPyBfm1fFXEErHue4Rd8Y9qupT7y20J5DNvLTM5qOMLP2oVG9NHarj9JzY
	eSY42/+za5rZ0Kz9CdVRVWZy/KxJ7b9uL6kByIThfQ/WZdIsBUgETm7TPAZiz1y1
	d7wD5UJNElLHGHrCmRgx7imqOt+zaHk6qA1cx4ZQnw1X6l1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8f87b89s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 18:22:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso22775015ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770834137; x=1771438937; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyMgmDuoLee0i09BUrbQaovhMTJNH4r9obEscx0eIEQ=;
        b=QvZD6i4EBD+cdVue3t597b3arYYHzxA2KwXGy20T9Yc/HPGorekddGUD7tbA/J8jET
         ljUHMMxZ5GEGg6tCCxNBj8elbgsK+j9Gf9qr0CbvhvRq20wzhoS9G0cYkJzILq2vq6Ms
         rnpOcyMUS9FHUQ1mtB5OErtLfKMHnoda/KSEv+iVl3g3IblzLwDfd03Vhfe7v+Lc0GIY
         I8IyuE2N0JdgeL3IwxX56JjgVy1C/QC9ShJEdgkNMw3+qh8oUKb9E7aUkWX/0jCX2Xvh
         x/0BaLwNj+TVgpYagK9mdJeqKP2VFR2mxvpu/XbOoyJYfzVuPdA2h9MKFFrV/csAq53y
         xxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770834137; x=1771438937;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyMgmDuoLee0i09BUrbQaovhMTJNH4r9obEscx0eIEQ=;
        b=LaXmNk47L9OjVzH9oXOb0+zHVrsNM2s3EsT+S7bgAXI6iLdCL573EPnUxXVOmtqJXU
         Z4Zpl/025cU6rt8M2qRQtbl1OkUW0VIxAUH+fHSwpr68NjN+PIk75hf3X6kanChexdu2
         nfONBd1cfmha8wn6U3dTcb+qLmgUPpwDG4qhHKHJPkDaKG2Xl81P/yUJcdnluhSaBMS/
         x5kX9gd7ZgmumNhyLa3Qa8xXgHJkfdMpU45Vhb9ovq0o3HgF5RObM8ZkWE9mbXvkrAZW
         QFpT+MsZCYdb+JS26F8lUW1pMt7AE/P/w5fW588Fn9sV03fXnrrB3msS2PhTW+YqDldS
         2GwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrlzVL7p708efKXwDFBDcCndKj549zS1IFApcTm6fdSC3rrXky3BnlS/9n6REeGtIbb+6JpOhO89w9C4TE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UF+Ft0eXdJCE6o5bXPed6pqUZrQVfbHZKDN3g9lrAq2sr2Zn
	8DWHWjqsqHq/3JavCVLxVBPPRHerELPAReOSP28bVo+XOPVQtwqw/fB7NGw6ME7Ka66EHQzKIRw
	MPOmeVD4QNq8eIAMILmMD4U63SV5Jykpzn9FnpavwwsJkJJf0291DFu3Fqs4djFsmfwXX
X-Gm-Gg: AZuq6aKPclaZoH2tzt+l050utjzYG2+hi2IhJZvNU4nu9EYXuLo4dcMaWiWaHveO2Kv
	IzFfXImZK/otXuGpAvC9e9yNI7A0ehPle0pW0zf7JsrLlTmsSP/F04AtAIGZE8m4v4MCmMuwbp6
	eOm3kI1z2N3yYl8GoYqag9vYp6LUU+dBAJraUNt0fJ/FiynUAdFBbEIJo/x9ocV2K3YF+ypznJa
	g84c/EZAM60Bfz1esHa+Q356JVmPGG7ys2elwTS9KGbTyu1kWDC/6pvhgY3smI6z7EPoo1d7M2n
	XcNRR29YbMaRFUZh0+RVZoAEkcpf4HEzFN7I479r3I8tvdtGjtjyLKVk4jWdA9Yu/yGXVlP2/7H
	y1v95DwRpKSWkRm2lEcviYOhtbQPJPvs+U1RgZIYzjjRNOg==
X-Received: by 2002:a17:903:17cc:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2ab3986ea83mr179245ad.12.1770834137333;
        Wed, 11 Feb 2026 10:22:17 -0800 (PST)
X-Received: by 2002:a17:903:17cc:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2ab3986ea83mr178955ad.12.1770834136863;
        Wed, 11 Feb 2026 10:22:16 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2996665bsm41114895ad.54.2026.02.11.10.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:22:16 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 23:52:06 +0530
Subject: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM3IjGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ND3YzE3PzE+NK04vjknGwLXctEc0tzg7Q0S4PkJCWgpoKi1LTMCrC
 B0bG1tQChWmntYAAAAA==
X-Change-ID: 20260211-hamoa_ufs_clk8-9a7970ff90cb
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KpNAGGWN c=1 sm=1 tr=0 ts=698cc8da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=A9ZGKesYFCFhwj1snpEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE0MiBTYWx0ZWRfX+8egKDDSfRe/
 zl0QXeTtmaNnYPvuS5mFJUGE721naaDACnSEIfB8/8abqhdwSHXrY/1BGrTI4ua6AcZXZqsjbAf
 iSSV/JmPZmEs++OwC2m0IVTBGhkvzodX8Am2eEE1e9i2GHdfIXfT6ytn9vyorNH545KITTsd5Kt
 GMAQtqEYW3P+ObuxOMkIZg8LHxwMK+UJ8s00CAsbJXFNl91LRbH/2C6M/2Ot+Hr/G5EplxMglhY
 Ayf9o1aRCPNI/NvwsxbUF4DgafL/pBum/qcXYcQteV8Xa0XWjdPHPkTQ6ASTAZ2N1T7pvCpcIeb
 p3tEwsETuOR4hGbzrR07nHl8Pc3i9/uTBQtBF8X7Eh2j3uD+NfPf7VR7vHm/6/M2QLpUqY9XDjY
 AKMDN/06wg2tnO71WygvNuJJj0F3MXerwS6TAYD+7OmbMzE1N7D0y0cacAcuQMEw/4SHiqeGxf+
 cz5Zi/DLPOBuU9s7F+A==
X-Proofpoint-GUID: 2LUe-TtBelAuT97g8jgwxtKwV0w7AdMM
X-Proofpoint-ORIG-GUID: 2LUe-TtBelAuT97g8jgwxtKwV0w7AdMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92613-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32E7A126D59
X-Rspamd-Action: no action

The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
Update the divider value to generate the correct output frequency.

Fixes: 874bc7be1e08 ("clk: qcom: rpmh: Add support for X1E80100 rpmh clocks")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..6e88f0a8d9b4c014928b095882b7150cabda6895 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -378,6 +378,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1, "clka4", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a1, "clka8", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2, "clka3", 2);
 DEFINE_CLK_RPMH_VRM(clk4, _a2, "clka4", 2);
@@ -840,8 +841,8 @@ static struct clk_hw *x1e80100_rpmh_clocks[] = {
 	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_ao.hw,
 	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2.hw,

---
base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
change-id: 20260211-hamoa_ufs_clk8-9a7970ff90cb

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


