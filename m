Return-Path: <linux-arm-msm+bounces-90800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGtBCLXUeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:07:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFE9653A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77B7B30A5230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F81530FF25;
	Tue, 27 Jan 2026 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4ZaHGzF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKzytPxY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F5935CBA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526239; cv=none; b=keun/qpMHXnMa2t6/U6GScn1J/sd1M/dXLk+F/XD6LLrYuGgDnl4rZ+Y9GmDRAaKC//RZFSpF0ugF0HShNaSu3o6aMW7nrjVM26eUNVPT3sVTIQXxUUW4+vaQfvq/ID2yOADPHEp0fcHI4UkWiguT5QPD5TV9/kcCnmor2lb+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526239; c=relaxed/simple;
	bh=cErvy2X29YX0SBL7/izgAbUgElLX0b5KefxRI571VzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IL3K1EEJQF+1UBVt7+BH+qHz327JBZ4++z8kh9SGZl4kZxvYv9Lr4fR0x34th57eb2i0z+agImweigib6xhzzRgq5rddjNgvmWVAyaBsoZImw0yHEJM9xPCeL64CmDD39weCMoobLcSu/fV3/i+Ma9OhVGlLw/rHmOZnJRgZMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4ZaHGzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKzytPxY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZdtG1065833
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Me5YZt2B/5PhJwf+VqjVZCafYInw2eIkiYvZNQdqKYQ=; b=d4ZaHGzF3GNjWgCc
	lQ2FaYavOiZ+kuSvCRCqxprRKzMpk1r25/KyvFmlcwdGCkvKVXdCdvOjKcYsrchr
	vjGtOhXIyKrXUE9mmmA5VSCcdfjYHwBgPcF75mOGAhc9KBg8B7axAi2unG+A5zxA
	Jyy5kdA2AVeYrLVp51nLcs0NKUIjFLEs+3K4K5AyF9tZZk4L0T6nVkbo0aoVkSlL
	1AtBnBcG0cRql+fuxnMGNTOJCCxjo4Nzim/PKbKAzvGkoYJEVYLR7ivdpp7tIno8
	JvOdlAxXEN8/tbjd7kJCXDfkD8h5NIwRUvywSPGtOBw4l7n6xnNCIDpjUwnRMXdu
	md3itw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x0315-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:03:56 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45e76684274so3424245b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526235; x=1770131035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me5YZt2B/5PhJwf+VqjVZCafYInw2eIkiYvZNQdqKYQ=;
        b=YKzytPxYk0gpWV4hl8Y5y1rZBTaf8DKIhrwhOcl2DuwcuSn169jjRRe/ZaJrHADrCx
         3Jd+dgCNWz2HfhCuoojTxlqWaxHDuy2mPX9aM5zyTsfV9C/pj13cOsRved1L6XoWTiGf
         GydN+UQwaZgTApdcDgrC7BDdDbQmCZlr24KGo/T22gcpFjmMMZAV80f161NOhIHs4XqW
         g44GcDbcSUwwOv0A+Rk1J4WkXBkitP74bk3gKKj381easEc2+FT5q5wuQr8mz6VkW7DP
         OkCI84Z1mbMR9ZA6yhnOKi5oT1qHFJiUaU+itsV1EZluR+MBrqfMITZQpcmwUqmxFrbI
         yV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526235; x=1770131035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Me5YZt2B/5PhJwf+VqjVZCafYInw2eIkiYvZNQdqKYQ=;
        b=IIwTToan7mRiImpaS7gzm7MNBTwlOf35PCQ+yGnw7fxGL337+qI/MbeU/hIm22ytEE
         DumCv3CuVRn5awtNVKRfOyAAPuEq0Hpp6RE/qxN7t4GIYOR1qrqxQMzQTHXa475ewrR8
         pQlNUCdWUvIyrBitrjKJvkpHkgOLEn9pl5oDdDhJNocJfT1hktV3fkBaBGmfT7zYG47Y
         QE5bTXAMlEcCo4g9YEgCEW/EooElH4J7MFGIoffel5fC6xmjJJLVqHNgqfJNJ5EGkyaq
         6B0XuWHDF8AO8WaT6teFio949e7Q3Q/RgYbRD9mJwSk6Du0MhkftoOtmYqB96X4BM1WU
         t4Lw==
X-Gm-Message-State: AOJu0Yx8Udo3ZHN6qhwq7JrUDf0bKBxK86JN4yTBu6mPxw+oOParuv73
	L6BWfCBMDVy67XDsC3JtmmOYsXYTFRWQREtNQY3ejSCWA0bYoZ1ST7LwGgKAbD8jD2LoraAXTj0
	v+T5AqhlGlEQXvTJgy2fRsKL8wIaczpJa7YWJjJza1rAv0RkDikBTcjPJHIAj8i6GJcE6
X-Gm-Gg: AZuq6aJ8qh2wq4UHX8VFnzYoTu7diJa+z36Fejwi7kBl4OlEMtGrpSYXCFNqpddA4QZ
	MnvH8jYHFnUfA86m5sqVIwHaX8job+k/K7sKmNmUKNQFstU+DqgpJkmyReJKMmWr5g1KYdmWiyG
	Kzrd5St6Ds0O3/0odeGwskV+/1OIL2Qlsz4PEk/JM2eTrbmtpRpYuHjCDMxquyiynzj2/WzxoaN
	/S9KC4O1Ko/dt6KvJ+ouVGwj6Own0yc6qyrn/8osy/SqbFM1GzUFpjqK/ftrcFgWcAVSorvGJyv
	vhbeOIkYKBlPkZYkCyV74j65Wiewj6bjvoRGsuADuBymQmaiSFWOONDb2z6WlDywzG2twqVDh4l
	IRpt+dDvbTC0l7y1Y/w==
X-Received: by 2002:a05:6808:bd4:b0:45c:7306:5058 with SMTP id 5614622812f47-45efc5984a4mr1092784b6e.16.1769526235541;
        Tue, 27 Jan 2026 07:03:55 -0800 (PST)
X-Received: by 2002:a05:6808:bd4:b0:45c:7306:5058 with SMTP id 5614622812f47-45efc5984a4mr1092728b6e.16.1769526234625;
        Tue, 27 Jan 2026 07:03:54 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm36895097f8f.8.2026.01.27.07.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:03:53 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:03:22 +0200
Subject: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7ihQGVEgIb/b5bMkITEcOLrwp7gnenamaRBmqqw6zUo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNPOJlbyfVA2HZ0i7NLsLnDhg43NGCrgOgUya
 EReERmTYyOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjTzgAKCRAbX0TJAJUV
 VsDyEACRujLDJS0Qm0QujdoKldpAKavpeIQTOpE+GyTEMuGjOuvGBC+QmGp09z0inPCadWyJQbA
 MeX6HjwrGht+z36LIPLLJSLyCLmzL6XUGhrBX/DTS1tNqeLm7eBhhDOKrSm3dK8/OcYckHwOZ3Y
 Fdo0B4qL8cxqmlBDnRj1BPlmkGy+QXQVVHUAq+1eJM3UkI+SS6YPfJx1N7ELK1T7GMcSQzruYGv
 tuB7QFI8RCh9QZ2Flwc9oJRvP9Nl629iRuSOovcZ93zPhouG8Bv247xbJB9eMR20yuGyshO2KDZ
 eBftFJ8jIIAUk3p0vZgmimmCGw4qYHdCU83zQG2w2nyinBqTe2xXMeiSuqziiRgUCiG5OYYxyxQ
 L9139c4YGcgROsJGexLYsZXoFnCOvrf7Fzij4j0Y/nwmwokORG+7JUguR2eKnqp/rDo4I51Shkd
 qYli96tjCCTj/iwbEN58Li34R5AcqlbEXQJud2Cl1qqmuvsKMAVWCq38j559iGnkHz99E3zfjw5
 MSj+njqAhcqpcFMSeg9fHr0B6vZ3mPbCNjw/60X/WAqX3UELGZVSSz7AOuC7gfilQbkjTnCQrTv
 EGvjaMWxjpj3jVpX5m7K+ahEq9pQfV9JMoGIHd/bhgN0179p8c9gv40QKM11PZcMn3hpflA5b+p
 KqNAHTwXJuhSqxw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: j68HZVrK_SHMHrWyh4vbSp8ZIVYmbyfZ
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978d3dc cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hmjhjfVocwMNySy1NqwA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: j68HZVrK_SHMHrWyh4vbSp8ZIVYmbyfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX3NbnhiCsiTBI
 yjIJCx7a580Nn78NWcvukwHMihHfU4JoE6oKudpLVDkp1AAtg7Jb4E+iIUjuAfbHGxGrMLSidBk
 KsQCldRedm/SjlEFAR6umrym8NFpOObxORUd6BtnEPxgOLsO3Z83x+KAdVL/2OYii9jkercBc9C
 YWpJHkIRCs3ivcmKYncTL5+LuvUI8GEjY+nS+yXg/U9MVfrlxJyP5d+mMS6Nu7YaT9z3ofvoqM+
 SA+Nup7Wkimpo5iQIiUqQRM5bTf0lBRozKhUB5YWtw1BmIrEfivRhHSwbKCirM7gpOULJgj4EWT
 n++r+QcVqF/J2PotThAyeoJULFa9N6gsw5PrUvobGxOELYKolmP9anJq+K8w3T1IeIc/JJBEg7M
 /rSEtmLF3PXAbqIATM71vi2r7a5O8nvR+4Vq19hGuy8l99HnKYqecX/0mkyG/N9q+Drlx1kweNW
 o+ksNr6wRU8gGpRn6XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90800-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DAFE9653A
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..cf46a6585174 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1048,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1


