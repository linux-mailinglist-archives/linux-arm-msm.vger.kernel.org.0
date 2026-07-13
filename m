Return-Path: <linux-arm-msm+bounces-118763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LVQkJRDXVGqefgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:16:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C074AD44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fy/3QSY8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hNjkinzv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F12B3015C31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8939F40B39C;
	Mon, 13 Jul 2026 12:16:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614C038E118
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944962; cv=none; b=A8+LVU4lCY/d9qJwflyUXq1AXyY8u9lxyyfUNvAhZrBQMYlPam5bKsvIQCHaFoJtvvGBzaZDbfqutbkaD9WpKZBsI0LHbtdCcgNHJZckImZh64RM/MZmZIURPTt9b4Ev7vPczLrhvxLjvn0/JXIpdVWJujeU+oV6M+3wk+1UPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944962; c=relaxed/simple;
	bh=qs6ppqp0UOUiNfmIFg/KcxO7swqckHjrNOVvOglkL5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OPngnsYQ7qg6keo2LWNAdlBs74xL6Fnj5w2zBCOCzmG+fN+9glt0L15HwUcz+durhBsGGw69CH0WuWNcqhHVFuASmTZACiJiN4x5/uux8fU2jiToyRm71evIq+gdKkVYAIcLCRtV0PYBWS5kBdQii+UW9d2Rd5PF+JhTpodbtho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy/3QSY8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNjkinzv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDjF61398804
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=42z1nSf/EWm
	6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=; b=fy/3QSY8y3JOVan+88LMAMVKCsy
	DMSsrh/+NiAytIIjJAQQB/QsLvk5vnrHJPfkhBA3WG4745145JSoZz96Yh2bbXwz
	PyrqLqblPFYMU71oFgc/WjnsCWlmTzOVKL3n6XKjskD6Tdq2p6y+T2RA3Ubb8wEc
	OJnb2c04KuNbaOrv/C8tNiuk6W/20iwW37Xkm5aVrf7HhD11Y3A3CupbSZGe6CXV
	cEDGMAZ/lgPmDS/LfKe2kSBmRqTe+8kxh6NQkXDuVYiEsAdl5EzY4mVmsKuM2G7R
	SWKBDPk899HG9Q8euu4p4PelsEcRrZhEeHVvMdiSblPWF/uib7c1eWMG3eA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4rg0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e095fd889so1120436a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944951; x=1784549751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=hNjkinzvHe6FDU6qLjiAGr3pQVm6k4ZL6RsD56jyCm0oOP7WMBaOaLeSl9acidC2rh
         adrjb2DmEHDGrO8TGnfZlLyre0ftGZY0D9rWtSqxrIJofE3habb2C6dNMTp48LvVW51T
         TcgXwksGw0GCI5+lEaFgdP2MkdRpmtSXxXiHTs+NXOFoW3k5tPgT4GdTLByzx8AP1rGc
         /hcDjp8YLLV8nv23Myy0wyG0pxvTOL7TLPv2nIVftVwFF3Fo7pkhysYPb32OC9zq2cY5
         2WFqPqMNChxwgIHRBpcHjfvpl6/KtFEyGDddsNixgCWJZRv5ZAwJgJqIwUV3NqEoTZ8i
         aJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944951; x=1784549751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=adsKEjG2amB779zHQ5W5Hc7n1blB7R8B33Y5Z1X7IAsX4ZhoaskzLBBs6Z5S6gNFY/
         83oEpQ+6bSzsg+HX/g/eBSouV0ZmrIQBvYKf1yX/F/saLJEW93jboqvq3/Ljo8nfSCbb
         CE1qwl+wMLcD4SunKYlD+fgSpLwXnn805Fs9gMLUoHCptUP2Z8TrLJ/xm73FgLKCHf8o
         joNIgAz4uLv94LizWO/sJ+JpvretpC5gvU1DtrPqKMKK6Gt9gdREHs+9xhxP1FBecLfZ
         MLElPrd43cAjama//9auFX0QWt1/kS7Q7GeBVUUpS1npGwsuBrmOq2ucM7h+ZmB7kbI3
         qQ4w==
X-Gm-Message-State: AOJu0YyJ22D1EQuuZXO2XeuMSnc939cUVYQrhfkmBCcjoWzVeFj6unGU
	4UKeyujOG7MPyf6Cwul9bM65VEEIO8GsfDPJykrS0/7WxuVe3VBsHDsjNIfVewvghV6DQezh7ik
	ITeGqSF4LMP1nFwTnoQsjalkkqedSWTR+VRByEIxRm5YUMgRAt+RG+Wk9CbIjCPP6C3C+
X-Gm-Gg: AfdE7cn5IM/TEfhUcIS+JVy9ReBUYA/HrRe6wLmTTBxPFafKoKpJ/wkddWm4/cmJBfm
	/ZjEBSFQS1G5amwhC73iryuKgcuM671k9Yxdt5rXvFRxtCZV1n0Sl0ke0ZjmL6ZsLSQKcta7f/4
	zTs31Y6TePpJPfZF9hzNKbkxTDgcSWCTszEq6/TKM7IkzxIjF5sX8o9Ac2Lnpz9BlSI/Y1aaPya
	NAXEh79tHxwKdj3zCyCjpuK3DXYUg3wm4ikDZquSdIFWcYcHYqsHjT8aGxpkEaIzSTK3Vs6H2zL
	yT0Sy5ydZHZNcxcI63s6JyYnPPj1KWIyzrUiMBz40i5/zEK3l932RfkQi0Mpfsf+zyvEcvQoYP/
	jiR/MxeWPmfyzLc13hHUeVNm5Mcj/28j879YBxyeE
X-Received: by 2002:a17:90b:2d4e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38dc74cf95bmr9012411a91.13.1783944951259;
        Mon, 13 Jul 2026 05:15:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38dc74cf95bmr9012311a91.13.1783944949430;
        Mon, 13 Jul 2026 05:15:49 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:49 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
Date: Mon, 13 Jul 2026 17:45:18 +0530
Message-Id: <20260713121518.2724474-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54d6f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a4EVYJI0Z6-OStE7xvQA:9 a=O8hF6Hzn-FEA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXwXp1ogPevo59
 jY5Bsk51b5bij2ciLDteh2gEOjU6n6zP/LgUSihZbiIn9LqSmWYKu4Ay5jAU4n91+6UmAZa1sNe
 devda+fDmvQqnkBCQjBsu/rkvJxNf1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX90U132pUoCRy
 vUsXXKonJ4Av45vZkN5nV+LAC0chWaUTUYY6QplAGhU/ZtX2JP7mgxqecZZOQwDK3U7gE0eTKdG
 WL28+B02QWsxQDI7ACE527zc3n6a6KPJEBl9J8ApZl2Y1Dpfu8wF5pGYY/JZrOr9Fg1SopS92uJ
 cW6eiQjsHCGLkwA0tjLwZQH/cKNgNTqxZ2T4VR/mdClulM4Novotpv4X7uYxQneccBK/TMvblX/
 gCs4/UXSooHthP0oJRTaRre3j23iECXSNsoe4t1yWJK7hPeQQ2Nu9UYngXLCqggnOwr6P7CfnH6
 TtKgo9AJCrRFEqC2Fa/A3uGT9HFQZLNYWgzDDp/865lSIkxUF8iHzcXUVdwgGpjwm3PxvckfdkY
 K/snvajwsUHK7NNRDrwjD9sW1jQBU6w3WTQ4X0Ps1pA06Wo4u4D9MUxn/HUf10L8kDip30ZsCRY
 OJ7ZcWGoJewuAx6yrlA==
X-Proofpoint-ORIG-GUID: PtiW-30I4n66e1mYb0xEVTrJMSduVVMK
X-Proofpoint-GUID: PtiW-30I4n66e1mYb0xEVTrJMSduVVMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118763-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 391C074AD44

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 72b8ffd97860..cb4934cd6f75 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -148,6 +148,33 @@ static const struct lpi_pingroup milos_groups[] = {
 	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
 };
 
+static const struct lpi_pingroup eliza_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, wsa_swr_clk, i2s2_clk, _, _),
+	LPI_PINGROUP(11, 11, wsa_swr_data, i2s2_ws, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 11, swr_tx_data, ext_mclk1_d, _, _),
+	/* gpio15 - gpio18 do not really exist */
+	LPI_PINGROUP(15, 11, _, _, _, _),
+	LPI_PINGROUP(16, 11, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, dmic4_clk, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
+};
+
 static const struct lpi_function milos_functions[] = {
 	LPI_FUNCTION(gpio),
 	LPI_FUNCTION(dmic1_clk),
@@ -196,8 +223,21 @@ static const struct lpi_pinctrl_variant_data milos_lpi_data = {
 	.nfunctions = ARRAY_SIZE(milos_functions),
 };
 
+static const struct lpi_pinctrl_variant_data eliza_lpi_data = {
+	.pins = milos_lpi_pins,
+	.npins = ARRAY_SIZE(milos_lpi_pins),
+	.groups = eliza_groups,
+	.ngroups = ARRAY_SIZE(eliza_groups),
+	.functions = milos_functions,
+	.nfunctions = ARRAY_SIZE(milos_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
+		.compatible = "qcom,eliza-lpass-lpi-pinctrl",
+		.data = &eliza_lpi_data,
+	}, {
 		.compatible = "qcom,milos-lpass-lpi-pinctrl",
 		.data = &milos_lpi_data,
 	},
-- 
2.34.1


