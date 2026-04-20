Return-Path: <linux-arm-msm+bounces-103814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JVfCHhW5mktvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:38:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557342FBF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AF8A30775CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8D42DF719;
	Mon, 20 Apr 2026 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVBb+t9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYRO+0b+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3734FF78
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702630; cv=none; b=H5tC1fRXNdljICXbhiB6GZfen8Ez9GZn+UNiQx3QhHDDpT8oEh8yWgZheWKKaFE+LQXfet5ZLpCHhwWTt50swofjz2Q/GmTAprJzBsFB0cjSfabA9z0G7md+Bs8J70ESx4kWu9p99xXHbx6EcE5ZMzW6No3yqI23XgM3oWLZFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702630; c=relaxed/simple;
	bh=gt6Nb3naTJFNtraTGwDLi4SVqjUxxdEnDLsbiv/OeNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSjA22d+uPgC0wbVF50R4Abg/zGRQWuOHyoTAdzs/ISEK2NQPpeMTek6rNzO2XXYWu2U/u19wdVFNlcn5AI0lSFel0gX03mlbEqZ/FzUANDkDgYqHHb+5Ho1rFy9rCCNnZGo42lrrElJRQcImNpi1UWSL3DgugSpSoD8ZfT3XNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVBb+t9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYRO+0b+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAtJS91598115
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=; b=IVBb+t9dBz4eELcN
	iJuAMEHUAr6bnx3Kc0uy37PtEX5XHk10eeeRS0viDxn3pxwRDwTLXR7y5/hNWEg2
	vhA+F/2J8ByusHP8VB89sP/+DJTitgq93dPB+mNhfTDBJNzvmGrXHlmURrCU7KYx
	ouuqL1KvMq96RzE7LRBXRWF5WLH86JfOvE3PptzquQrDkBm9eV9SiMD/Qlbfz/nP
	ac1o61hfZC9oNCXaAShnsphvv7rpSO0KiGhAgaDunebksayfc2SAbrfaL0TeFPFq
	tybsYhhji2m3mhXkVzs5FWz36i1hGwjPY5pC29xqV5nERjl6ItQtRcEAbbDZDCne
	rxNwXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnjbp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso1101978a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702628; x=1777307428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=;
        b=ZYRO+0b+Ikn2Q5SzYY+q4twy+QMX69vDy4GFa+ZPG5DNKsLHO8erC/Hl8mnkU14ddh
         kNgVukFD1GTj7ckZmCZKqqmbkuoErfxF2mS+tUqpDASEdDB1XtVy5TeoqqMjwHWFtEJI
         S/RXB7a4QXECpN1Yp01zUXeMku9m9T+50XQqb/bedronh09C9oUY9MXXMVSzzH/W3Wnl
         ag8YOyewhVfxkMfZ/zIeXAyPRFcvZCp9zQVnwwIxLIBxVsFYSMirX8mo09TBoEY7Pc4E
         FlO9Ft0K2fOWv+pNH56eBzDIqCMxH/nnVyO94P4s/CUBEExqFVCotHOrO3eEgqsOHYRk
         jQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702628; x=1777307428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=;
        b=A6Nc3qgx0Jm03VSpUHePWU4HOr+zl1o+dzNLS7+KMJVxsiFYWATV6LE/GtfQb1csZ3
         HAKqOwzZIjtrsKTtQQ8RPl4fiuB7OabhhE/QSHPBHksV+GWMXGktsp7vKQ7PAbnL8UFZ
         63Onxnjj/k4lBEh3J5rPIIMJfUCLp+9L88lFkWvA2XnwEktY7gjTX/XnqCcwqKr56B5G
         /OPOY0UzEuJRsi/rQDcNqb0lqQaIl28jzPJ3lxtP17r3LizYZ396VQEK8hhUOQ0HGnQ0
         CgGs/3uUKeDLlZlc2LJi0FEZ0vA2Km7Aeqvpye/TqUxg7LQ6QDS1eTPY/Ygf85H6P2MQ
         GHWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Hkq0owrGzPUM7G0RinO/NRhJHNlq0lTd7cKTOmy4VG1V87AgjAfZleh59R7pvaHIXetXVMMwu9W2Hay0V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjv3VTJ6HFumaGpevoUX+QC4ttC6WPtEyPaahb1OHBVPPp22Cb
	SmyzCnEziQp8LVaLjN6oOryTPKqmEzS3doR677RwNiulV7Az3ZsgzSR0Lu6X09kGsHoqCWN2w7P
	gOWHsXG5m4vZ6yP222AJRqf2+78Dtl5S9oHZgiBbJ1BGjVHhDnjhHC/hVsR+KyrmRhqukXNPZxo
	Lh
X-Gm-Gg: AeBDieuXiVL3EqcqqCKbPGxHubMNHjOz6eTkm3UE7d4tEbItmJG1MTIx4uVCjji9/oF
	4K8+xGYS7sae9+Aabsqd1ew0ZGLRu0o9jA3MnGat4yo7jF73Go1GLQ9kgmgW/zySOqNwyglZMTE
	thRPr8+ZfFYfSc/czETFehTnuB+ASCE4I/UWGzgKfdPHyQzIhDWdxDqSwgfrUZMfe3zw79BBnAQ
	i9+I+L8nqoTjcCzP7aNw9J7PhWi3rhOn96GeV0qAGY4aMHTJZMP2ANOe7dIbnaHIrVbt1LKL4kJ
	cc7Q5xeBOlI3Alxl8MfiVZHMZWFxGG1w1yV2wgWzdwrIDjFQOSdtKQ0W1pxITn5K6lJz+y5shUu
	s0fbANzcNaX1AO9ccpgZPwe2BqeNi8T/oheuUlyuM+wRhckxRV0s1ybyzELhdaeM=
X-Received: by 2002:a05:6a00:2341:b0:82f:2d48:f8f4 with SMTP id d2e1a72fcca58-82f8c825655mr15172490b3a.13.1776702628065;
        Mon, 20 Apr 2026 09:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2341:b0:82f:2d48:f8f4 with SMTP id d2e1a72fcca58-82f8c825655mr15172444b3a.13.1776702627534;
        Mon, 20 Apr 2026 09:30:27 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:26 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:00 +0530
Subject: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: sVqhrKEP-agykohoMp0QnVWSWw60OWGU
X-Proofpoint-GUID: sVqhrKEP-agykohoMp0QnVWSWw60OWGU
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e654a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0acwFryUwAlR3FHL9NYA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXydft4oQ/h6F1
 YL6uI449nyycIm62tjHmIieJQAuGGnBAjRq+r8EiPKjVB/eOu+KlXalXHZWraYoxdkxMf/OEycb
 9oMhZOS9YnotI9r8Hmh3thuaxF9D02WUwrthlPbDteaUHXA/IclTxYINq1y43s/KYIe2Ub6IseO
 x4c0ylqvNgAB1gO5NphV9IJRjz1hG2I32Btjxqowl1R3PnZx89avNlyk7021lIcrV4EqyX1ME4r
 b7R43JFUo9ISrW0SZoccAhhNFRTfIMm7GfEyctI0Tjp2pufjzqGZ0Z3XaBP0mzwBtwzywccWyJl
 8xi/8ulyiZVamPwpxotkDdD9DS5iNjWLsiK+FL1rYLzj2GEe8Se4YSBZIPRKJdepJUMfgna1sa3
 z1BVcuHZIXGYYJ3Bs3PWV3TkcwBrrzwoL7FpXPJ6CsPvPjFi4urUUWPSzRprJHvtnQLVEDUROx7
 amKKTHDUz/SRKWAAF+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103814-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0557342FBF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some PLLs are already configured as part of CRM(CESTA Resource
manager) initialization. Add support to skip PLL reconfiguration
for such PLLs that are already configured.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config)
 {
-	u32 lval = config->l;
+	u32 lval = config->l, regval;
 
 	/*
 	 * If the bootloader left the PLL enabled it's likely that there are
@@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
+	/* Return early if PLL is already configured */
+	regmap_read(regmap, PLL_L_VAL(pll), &regval);
+	regval &= LUCID_EVO_PLL_L_VAL_MASK;
+	if (regval)
+		return;
+
 	if (config->cal_l)
 		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
 	else

-- 
2.34.1


