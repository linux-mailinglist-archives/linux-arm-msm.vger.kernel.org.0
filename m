Return-Path: <linux-arm-msm+bounces-117158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OFrWKjykTGoQngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:01:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8648271839E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:01:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GErHyy6R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bVsTj2PI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117158-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117158-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2151430E3729
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CF83D75AD;
	Tue,  7 Jul 2026 06:55:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFF93D47AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:55:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407349; cv=none; b=YJJQTd2qC2XrN43j61EPmKXFZ6/B0LYfquma1i5k361I0qiCLy4FrWahYov79Eh1cSE6/shsugLf70mstuy70Q4akSIJpjipCiYD208J3JCghKD5gp/eq5QHOELIKIQ+H+PIggZJGmOeG6FwGcOmpsojXuW6CdLQAefXrLzvUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407349; c=relaxed/simple;
	bh=2NqJ0/R6ViBvasZZlfLYNyADPtAFKzU9qIQq6ndqDog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYc1yfSf+d2P6rvuXzg2bpkQGw1wORzV+Jmh0+vHWISyKXlFD9W6/TjKc7VoDCbp4hSw+ziaM0pEWHq+Pq4rQf/ummbh8wnlOzr0B/FbTC3ip/MjEDWBa6kQD3GtuCAEF8JVq2cCJSqLT/h1cjbwajG9Syau0ZHH70/2t0c2hgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GErHyy6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVsTj2PI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6676WId82964409
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSyfrpRIKSRAoUsq94n+yNFahxShqoblpfsaha6QZaA=; b=GErHyy6RQBJl+3Yq
	FBEZ446dYdXCSEFnF+QxfKoLlUH8ilLwwu+7G7lPazEaR3SnNDNx/y6SH8aYTJdf
	MCVzxWhtvvYzlKt9TAOh7Y+eaq+tvlZCYTx1xspmxzDp2NiEFJvBYYccc0K9N6Mo
	lFmIHaQ6Wilvd8iTxVfT3E2ylshbmkr1THcZY+4TOGzNm3gjE37TXJaqUqsZ0qWY
	WJUBtUg2Oej6GQY6euWKFdju56EiKeEqr2c6U9ATP7rivf+V75uRulIsnI+GBWWP
	OXgrEymYL3mybmm8lLe71Y7hz4Kt2deDtTesRf8T4CEr5rn+1LHUSNdxR2sR0vYv
	efhAlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a82vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:55:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384048e7e14so3843462a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407344; x=1784012144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSyfrpRIKSRAoUsq94n+yNFahxShqoblpfsaha6QZaA=;
        b=bVsTj2PIcHL5eX+rVep/DqSz6ctaeFHIstFtfo5VWaXFKT/oThARQ3ydLW/BaRd4Im
         ux1Y39w0yMVa7cpneG88BTcGh0NpteZxllHi4U+jB2zWOnLE3hJu2qJeLV97D2altWUL
         NNMEn3i1+mN6DCyjdWbg4OjSs4sCvhBdPsGTFJkSZNC15w3NhTXGInJtR6PyClrMmuqT
         b2RLRBTClZnxaAQ2aWznQGZsuDw+IMZPMvj6IszjErBBIWs9SyL+rV7G6upryIXbeGD7
         epNTu0xBuw6p5H4DAORKes8XR0mbu5VlTw6llH+iORz1/lARAm910YRq5k+fjMPALeGv
         8+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407344; x=1784012144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSyfrpRIKSRAoUsq94n+yNFahxShqoblpfsaha6QZaA=;
        b=QevJAz1XXvAQseg13yk1HzXd5QYLu272YE00Zq8jNLQOtEt7F8dSDj+pA5t3kncjyi
         BBjDdu1FqHrWSvgEdRgjiKiMw1Rwr6IBSb1cK+qSitvrD9lIbiABOCB8EZbZebryP7S1
         yYOOMT6qvHE8DowxDDeMGPKlN/uj3/oJfYAnLXcZUiNslf0SoNaEysaGnzbI+QLJQgBn
         jIM/Gskn+Z/RP9VFwFjlic7TSbl03unSb3lvohN+iOOv7qRaJCmrnypaJCus9YOzUR2M
         YxKlGTZlak4fMxCQXIhL/cNNePASOLv3csgsjrnrScYiAXhxFDlluRzEHgvXhFsQA7Op
         1cvA==
X-Gm-Message-State: AOJu0Ywka2VSgbKFlh2+PjSpxI2YzObtn6r2PbLLzAkfuc8bMlRhwOi7
	OIsrGT2qTWwuVZKlX3mdmtWs53h2vm+ENvPOairsGN10XyhhyczjkPxSdlOKb0KIlFugdPDYiN1
	2U7e4BYx7Gd0KYWaoKKTssrVHb1Y4qY0ovwYKP1UVgZdXj8Q6nfEyRklNZEbD5vDQ1fKT
X-Gm-Gg: AfdE7cm5jIcTVMGa5TPWIfS5rZeWTrpUpjPSLbHs6oua/dRUYzTrivLCLcZceiBVvVy
	FulPPW9HKjF7DJyT4ZjMBw9P8tpQkUb01E7lSulxS2MNczf4cF9nC67TNppJSBe4xtdmVtWAKr3
	5OIVeU0HXl6/8z4R31A6APh85hKQhKXlJg+89Fh5WMNIUpH3Bu3ICp06VOEN1pZx4B8Wld78o81
	Ma/Hi20ORzqPt2etXAZW4jrMAz94cF+XCpKbPXvQxoMz8qyeAyHrc7+il3wwb1Bme8R9vm83fWX
	gyPIbJ5f3hwC4POp4Y7gJKBx6Ntzpn3gJ+tuHr45es32CofXRJrLm8CfnfHQlKFwjA0xDMu9x38
	tp4NHuORffHOuj3QEGFF3IWZbPhg1n8zWjCtK2x9lvb2EjBnoP6EPSBO5u66UoEwYPJX9vte+G4
	zWorNr6LrnAfe0LGHqzwyktTmQT1hAcYG1Mqppsoa9eqWgig==
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-3875854e02amr3885257a91.33.1783407343779;
        Mon, 06 Jul 2026 23:55:43 -0700 (PDT)
X-Received: by 2002:a17:90a:fc50:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-3875854e02amr3885220a91.33.1783407343237;
        Mon, 06 Jul 2026 23:55:43 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:25:24 +0530
Subject: [PATCH 2/2] clk: qcom: ipq9650: Add clocks for the REFGEN block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-2-e070624d03d2@oss.qualcomm.com>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: vJY2tD0qItFWwiPXDyQiO73c2YX4kYdt
X-Proofpoint-ORIG-GUID: vJY2tD0qItFWwiPXDyQiO73c2YX4kYdt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX5UmJf2ZQSV0P
 K5NIC+qfgNFPYKMPCmVcToZAcrbPYRl32PP0HkVsSXVH9sTsU9F9nbplkD48rJMZWYceSXOvoan
 RuWXS31dzmDWDjm7UoNaTh1R3FR/cnE=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4ca2f0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=01XzkSfSECFqZOLAfFMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXzBIkC4uF9ijv
 xFPBmlhb66zBmd+8rlyzGw7PzoOY1Q+UwcgIVkENq53/zrnPoMiyNFAvkOu0FjZv+WdJ2rscM6A
 bdkIj3T9QzZXSpAK1irxNHIbfcaLQ3vFf+QEW0XbzAqLLLxIzw0Z80AJC5q3lIJ2D9TKJ78c6wt
 WaehQ5m7PuFi7GGHMTRqT3X+oY82NyaFYUEGEw1Ok25NM3gnvyeIC+mGpqsLxditp9z7Y8bEvqS
 A9id9V7BOIuDtXCMp/Im8jbtXPhk0Cc5PPGCwH1pq405p6uOp2+M6lQ50CWcFj43TU+COarEWiM
 h7LvAsqmwPkoxB5hRyDQFKt70YpkOCv13XYZsCxt+jjJonH1nR2A5djqOXTm6BAWPdgTqj0NMYn
 uqnm6aO/qImPlt5lVCEKNKEFie++8o+dw9+lbHuQvwvUYSRnRnIBjnwsRjlY3JiFicQVYXriNrf
 GqkPJHy5inDRDJ4duFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8648271839E

Add the clocks required to enable the REFGEN block which provides the
reference current to the PHYs in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq9650.c | 89 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9650.c b/drivers/clk/qcom/gcc-ipq9650.c
index c556c2bbfd96..e65a52fdfa91 100644
--- a/drivers/clk/qcom/gcc-ipq9650.c
+++ b/drivers/clk/qcom/gcc-ipq9650.c
@@ -3022,6 +3022,90 @@ static struct clk_branch gcc_usb1_sleep_clk = {
 	},
 };
 
+static struct clk_rcg2 gcc_refgen_core_clk_src = {
+	.cmd_rcgr = 0x23004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_refgen_core_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_refgen_cmn_uphy_core_clk = {
+	.halt_reg = 0x2300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_cmn_uphy_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_pcie_core_clk = {
+	.halt_reg = 0x23020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x23020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_pcie_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_pcie_hclk = {
+	.halt_reg = 0x23024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x23024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_pcie_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_cmn_uphy_hclk = {
+	.halt_reg = 0x23010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x23010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_cmn_uphy_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_regmap *gcc_ipq9650_clocks[] = {
 	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
 	[GCC_ADSS_PWM_CLK_SRC] = &gcc_adss_pwm_clk_src.clkr,
@@ -3179,6 +3263,11 @@ static struct clk_regmap *gcc_ipq9650_clocks[] = {
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_OUT_MAIN] = &gpll2_out_main.clkr,
 	[GPLL4] = &gpll4.clkr,
+	[GCC_REFGEN_CORE_CLK_SRC] = &gcc_refgen_core_clk_src.clkr,
+	[GCC_REFGEN_PCIE_CORE_CLK] = &gcc_refgen_pcie_core_clk.clkr,
+	[GCC_REFGEN_PCIE_HCLK] = &gcc_refgen_pcie_hclk.clkr,
+	[GCC_REFGEN_CMN_UPHY_HCLK] = &gcc_refgen_cmn_uphy_hclk.clkr,
+	[GCC_REFGEN_CMN_UPHY_CORE_CLK] = &gcc_refgen_cmn_uphy_core_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq9650_resets[] = {

-- 
2.34.1


