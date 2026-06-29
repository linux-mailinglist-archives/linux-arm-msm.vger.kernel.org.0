Return-Path: <linux-arm-msm+bounces-114822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2uwaLwv3QWoxxQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:39:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00F6D5E55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:39:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZB7YjByS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="GayV/mmz";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114822-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114822-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C92C2302AE1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94B237BE96;
	Mon, 29 Jun 2026 04:39:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A9337107
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:39:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707941; cv=none; b=apYsZqja9DIHJuuuzj4hMn5+Kb0McuGHOAXO/l6J3mBp0UyHmgrD11QCyIkc18Gv9pEHjQU/YZMI7sHUb6GW9LqLy8VtY8JMbnK1sAFKYBqMbGTO0Kep/v0jXST3aezX+n2j47zV49aLm0n8Pson+jhYLwyN7rvEUMrxh4yfK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707941; c=relaxed/simple;
	bh=+ez3JrkuclbbjVWyUf4iDkLjrdLAhjMTMNt+sjUGTes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kybEjxcp3lk9safea+1cT7qKPDjbqRgGPvNBH38QNzJOCLRSk7PLffVlAkkv3k5dd8b3ZCyEKSfxxavhR6+myxviQn5AwvOGAudVgwBe6KNw2CtVXZUp4KX83FU0xSQ+cqFifSOy+Fq3uh+x5ShnS0uWtlmAhORUVmq1nLH7FB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB7YjByS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GayV/mmz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHiS1771381
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bReAtnTBchEqrR+06ufyCmDI/8DlpoWcT5eoY16Nc0I=; b=ZB7YjByS33jefUt8
	7nocjRCcqM3BtoFZEdRyMLG9nRvrXUR/HYKG/1DVeDeFnYC64L5V/RrwDqYWPX+Z
	7lnHAXYqXbVf+ix6+Mdau51axBGlvbVmv39NjTb+eliMRlDg7IR57e2Bn7VHn7JZ
	dkY2sMeG0KKI0r6IqVdOXsTaQu2okiGPRF2TcD3P81yTKfbShbfO71U98XQyqg/v
	xrOgG4IZLsBCPFRG4RpniuV5GiCaqpePcva/GRHE/eUyaGIuSTiguGcxBlbQCjB9
	wEzS3C6iRRTYYBT7Oje/6Fr3BUxtPSaHbUONu+F52QNZF0vfmXJ4tJt4STa/Pyt4
	0QKenw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumdp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139f77afcb2so3424750c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707939; x=1783312739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bReAtnTBchEqrR+06ufyCmDI/8DlpoWcT5eoY16Nc0I=;
        b=GayV/mmzYMG2oC/WcrFt274FITksJvGGCRkiHvM+7h6Ffn0MaUSte27EWa246KiZoh
         kASFLPYhjEBhLXmjzEs/PAOsiYdRF0NsNwgO5A9X3+3ROolU8sjOBn3MEjT/sJ/S1Agk
         wZP8AllfuMDvTwPczmAyqsKh4Q+2A06J+f5FvtCLYMllHqrWkXtTe676IuFXiHsDOiAw
         I8NBGEi1RIlXRIa+Qa5hDHzBvkrzmmZUieVByBBtRE/A12mPhhnqwia5aQPAnsJPl7lk
         qcXdagbuNwvzp3PzV7V+dNecq5xFI8f8hVQ3hcqQsZjpzVvyfvIUG2XE4PnpmgG66w5X
         m+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707939; x=1783312739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bReAtnTBchEqrR+06ufyCmDI/8DlpoWcT5eoY16Nc0I=;
        b=f9rgzpbOMZWc3syvzo3f6fA8kStMBkqOH2+90zw2VfG0GjZYxp00eiupZTKwZOj2xZ
         lXb3ylLM1rtg9FMd+5JAfh6cXP2yrbB04V3usbcGaduCcFmCVAup1UHQUmj+osl/X4xZ
         XN0/OHHs9R45qBgIJ99D93E3cVghhDINLPFq/EJpClVN76PD6k5e+4KCMc6UJX7BVtOt
         qp2bezcC0cAr8rrVyJ8oZFmhY+YRjkzeKBqtVhCat8G6EIZsxckCMmzddaVW9g7lRMLx
         X1eBVoquTCA+XhZWt7LdfqKZHqcCbwk3Cv/khVWsbTPaFmDRO1G88lk5DAtNCLqlHSSA
         HlXA==
X-Gm-Message-State: AOJu0YzW8Q47ERMjz26+fKksxRHM9Xc+iJ6yENtA8p+rEhh+f/BLW3cP
	zI1dDH8iw+E7NWIHziL7o4GGEMDm5W/ecIi67aFPXtUO6w+EH/LmsMBWRTspEnhvnL7/7L5qRF9
	EwWlq6oSuvI1Rs55rQNH6+LDt+YIayACwJSzI+YJ0g6OSrEwGGHy6BrjXJyPWtzx1T5Q2UPvzO0
	ip
X-Gm-Gg: AfdE7ckjlTdbGpLhJGNvHAK8jdLKj5rzcC0HScVKswZ3vqIcNmmsP2C/N95CAzQ1ftw
	LKhFIX4eKpLrtGZN5qqZ+ZX9pl451i4pNI8DZ5/I93KtQOoU6q0EeYGq58tkryzNL1bCiuXc3sK
	6hwxuZqLONjOWNwLye/qFE0phctS8AkI5cXzj0r4TVUbySoxbSpw0edyt9gbbED8UNIhCmSpHdu
	KBRs856pySXLtphEaWZ9rJzT1tBm1PrF7lmb6xmViYuRgjwcw2dMZDfxjhN4rpn8Dcpafpc2s8y
	BaL04Zv5Pv3sZpUdHCX2rQyoAWwq75Q7slNCQj8hJCZULWghcGXa+ZSprWo55Mhm4s6zr2h+3pY
	1rGUHtRZoJA3mCR8ouOQGKzY5oVFoc/cii8EfJWVDa/OtcrKXzVaKUnYdrNHcaxPCFCvDnsCt9i
	9hV2tNGkv/JiwFOd6swCvPIl/wFd8BOjk1DO92r8Si
X-Received: by 2002:a05:701b:230d:b0:13a:34c0:d776 with SMTP id a92af1059eb24-13a34c0dba9mr281959c88.45.1782707938720;
        Sun, 28 Jun 2026 21:38:58 -0700 (PDT)
X-Received: by 2002:a05:701b:230d:b0:13a:34c0:d776 with SMTP id a92af1059eb24-13a34c0dba9mr281938c88.45.1782707938227;
        Sun, 28 Jun 2026 21:38:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:43 +0530
Subject: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ULnR7W-V48FlUPdUZtx0GyWxjsWFNCFU
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41f6e3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QNGU6pO-sn4YUdBRpTkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: ULnR7W-V48FlUPdUZtx0GyWxjsWFNCFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXwjKZF6la+CmL
 8I+E31vQuvW7qvxZuVAJPQ9kU4NeVQ2T7z5jvlsHW9B1/W6cQV65PG24n3LcUNNA5KAw6Rml6YK
 MwzA/XDTsvpweDRGsQrtE6yfYntvHNX0OjBM7h0oVHxz7tPN+D6v3mjE4E9xc2Nl1hW/MgiHKRX
 4DRYNvNjUeQ1L7r0ZjbX+cjz5lXdc3AXwpf+bOYTSZEqtVSrCyNNKbFOkaaWn4IP2wzNP27LRoy
 +Xi/Drbi+XKsxw2zMzT1paSRu3lydnyi+eP2ayF8Pul9ZDkIWiUGdtzXeDIkL66sHJFerakLfMi
 fT+u5dYiAfM6SaN7/NC8h4bcarqMCWhLA07IFn+pGeXWSVQSo852hetzLAWszIyZmFWnGwkKl/N
 Alj+Zsxoy5I4AuImRkztn9b3PWBBwDtHRcBBM566ZRuE3MNUdf0udUetElCEEbwezN9vqUNS1Hp
 sag4F8+TeMa44IyhlpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXwxCb2FWTbzAJ
 fqspa9fbMoy+8IbzIa6zjIXqPS7b2d07jvGisYQ+jQVkmKwUBIjPADWgyzET+O7QHSQySx+5ZVa
 LQsXN5FJVj3XQTSOSmRptDOLH8fd4GE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114822-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C00F6D5E55

The Application Processor Subsystem on the IPQ5210 platform sources
its clock from the Huayra PLL. Add the configuration data necessary
to set it up.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq-pll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index 3a8987fe7008..569ac76c75dc 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,6 +79,18 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+static const struct alpha_pll_config ipq5210_pll_config = {
+	.l = 0x22,
+	.config_ctl_val = 0x4001075b,
+	.config_ctl_hi_val = 0x6,
+	.early_output_mask = BIT(3),
+	.aux2_output_mask = BIT(2),
+	.aux_output_mask = BIT(1),
+	.main_output_mask = BIT(0),
+	.test_ctl_val = 0x0,
+	.test_ctl_hi_val = 0x400003,
+};
+
 /* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
@@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data = {
 	.pll_config = &ipq5018_pll_config,
 };
 
+static struct apss_pll_data ipq5210_pll_data = {
+	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
+	.pll = &ipq_pll_huayra,
+	.pll_config = &ipq5210_pll_config,
+};
+
 static const struct apss_pll_data ipq5332_pll_data = {
 	.pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
 	.pll = &ipq_pll_stromer_plus,
@@ -207,6 +225,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id apss_ipq_pll_match_table[] = {
 	{ .compatible = "qcom,ipq5018-a53pll", .data = &ipq5018_pll_data },
+	{ .compatible = "qcom,ipq5210-a53pll", .data = &ipq5210_pll_data },
 	{ .compatible = "qcom,ipq5332-a53pll", .data = &ipq5332_pll_data },
 	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
 	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },

-- 
2.34.1


