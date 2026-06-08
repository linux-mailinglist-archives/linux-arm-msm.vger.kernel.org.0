Return-Path: <linux-arm-msm+bounces-111910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6haoB0zPJmqwkwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:18:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB8657127
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CnZntvAI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RwIIaRCK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111910-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111910-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5086E30A1B07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E5F3D0C18;
	Mon,  8 Jun 2026 14:07:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B553C555C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:07:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927655; cv=none; b=EL/Ct612GaKr3RVg/j4W30VrISZFtj42s7K8XNMwkZLO2kcYU8t/ZB4CecAQSB61E+8lNqQL/AfDYNRmJHu2JLmd1Np/7fB+n7Xg7/9EWvO2Ka+OswbQ5KAiosT0UoQWbDr9UzJ5RuPhQ/5Y3BNVQLK7xWXBZcllcuxKrtB7ESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927655; c=relaxed/simple;
	bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKDR3IW9LAf07XSyzmLUos7S7pz8kL9gyHTPTSH2Frr270vnEMvpw+i7aCuMaiJcbxGiNl0u+/ythmFZi73rCCjsRY5ywWQh4JgdKsTj5rUyY2GWDvsYPmSeBr0mtq/HPSWZyDgf9meeESxT877xnhE1mI1y1QcZ7F7WiTr8pHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnZntvAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwIIaRCK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRIu43789622
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=; b=CnZntvAIZQJCXCF1
	V+hFTzy9k2gmd1IQcKaptkh9SUwkVfMXIp7wRoWudquQkhvGuimw5O9kB1CCDrmb
	9wtJxrP8aex6lAEqk5vTKz1a2UeFBUbB6aoisGsqg60aH70uiXFaBCmwt1TfJN43
	bfjVtHV7XYHRv6m5aNQMo2uDQxaPpw641u82gfKlNNoZ2JhgNgUf2tdcWxo0luNO
	oX7l/TiALY30QSseazctqzbc2xi/m/jj+HmXCfCHiNqAhdcjc6GAElhalnjkvl3N
	onLTjCKsZI5w6cObXTo9WC44N/HP4ra3S7EEYzSMNq8ZL1BeVGAbsRUpuoWsy41Q
	DP6NyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8g50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:07:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so59627985ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927652; x=1781532452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=RwIIaRCKIXpIeFGIjwc8pirMPI50pr36f4044LwNMNTM9WtTDabNYnIO3jQlklLrJo
         O5gVimqpV6lADT15tYzct3ae2G+W9YcgyuwYAHUpYiif2yZsbil2i/urTGRgqS+aZ9kK
         E5TjzNIwsIyM5f7vOev+h4jtz5O4ZNXlHZkLuCcr0rsn/H/nonrO+GbEyizBDBj/SYgP
         ru5tUpnSAUaxoDKNvAn82sWmUA330Cv8i2b8Xxo+0v+OtQzoLjKhi1y97C4am1/2NePn
         rXXoofCexV8b7fP3LHQJWJ2flBsAjzMB+m7qa3TOfYBL+HhGhtxaZel3AW9b4SmuIGE7
         HbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927652; x=1781532452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVnbegHWge+cg9m9fLUSZVAjjHJqLbOX2/mgXuC3htE=;
        b=NQ+7IjGqVOv4Lc76X+uNimywSVXSTn5B9jo4fpRkI8/bYQHEkxdBRN6qARvW7Mf5rS
         GZlIq+xINQaf9UOBoOYedEIq5xkdYa6F5kyr0TK7QNIrQYNopwAjGY7a49DZM/rzx+z3
         CccYOooRsduHLx+At8bIIUN1rZ8AEATYLFpR5rlcCy1yCD3Xe41Xm+3eYLgrn1Sb6IBl
         TL3zuhBh8pPQsXLe390vDD6cGY6su4viv/iWsa4lD4Y/+UvAXYrfHih4AH+OW/ui9T/T
         Su38DUg8MTyAeJZbym/dQZWsO4OCVYNimow8893ZZPzww79CXECFEZXA1L6fBNsEjjm+
         Kn6w==
X-Gm-Message-State: AOJu0Yyk7LYAYVK1GG6Ti/VkVdHUOUzERhyIsSbxaW2qpv5obeZSAFiM
	rn3+S9LOSO3exS4y+35YsBHVLtBZ0ZKDmsgbinmNie70Vz0uwBuyOQBu9kbUJAspaYGVnuZi141
	XdZ184wneJANp1Yqepp/2gvC0qoebvEAjquuNCnQMquR4+3stX/D2kq9lV1F45z/e3UJg
X-Gm-Gg: Acq92OGwI99XIfl6XJ7+H7pT6BuWBfO9Tn9NZiQZwyem8Sm8Ywj2cec8LbdCm0NGXyY
	adKB9wpaAFQklYrMvdVXSmpIJ8n3e8978XOpH4yosFTrpl01SmpWrnz63zQA1N4rVrYVy4qoYxy
	XpIx1jYsHx2zO+fJQJMLQRovepc5raDyu37heLvgTz+NDhfm+CBOeoCyXR8MICwgHMWsejSSekL
	uFulmYMgpW+Jyt0Yv7f+An61tA9BjH+VuseLrN3yy+WpfGsvDTtcIEuVZ5UfN/P027GkJ/WVVmK
	HvKDMEVE2UncE1DNF4+pHxe8W9OAAdAD2Rcn+xVCC7pUIlZpRTVWVkbaW+TxUZU5U4iPAQPZfAg
	tGaMYcXQ8ZzPU3Eui7TtPpdeRvr1leo33WWrhPxt4TW7JPInTlSdfFWPKf4WFaP0=
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98641975ad.13.1780927652178;
        Mon, 08 Jun 2026 07:07:32 -0700 (PDT)
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr98641525ad.13.1780927651705;
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:42 +0530
Subject: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1392;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ycUtZD94R1/n0vpzgxAkoxJpZE6mj/5H3w0pL5YNCW4=;
 b=1cRNlukU2nfxNsqQpCxEMOWi8oORFoQw1ad5ofMs+sOgQWnHyRAYleyfD6cQ6PgGOlOqRWLLR
 N9AZrqsh6gSBbtWxqnF2lIZigMvXTar0tQAvvLRUF+EXwNfg9WIwrMT
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: eml24W4yqLuDEyO7Ue9zro1GWYAf1TEW
X-Proofpoint-ORIG-GUID: eml24W4yqLuDEyO7Ue9zro1GWYAf1TEW
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26cca5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfXxO9ZAmuNndwP
 esd8hH7uvXicvBHInC3Re1zI38tItJT92HBmDntVyXfa+fXFRdYUskwSWt9jfrzuHY4aVvHcl4w
 lsNSt2LThffLGJW9QPdvyCyxlTqgPDPTVm85pFCe+MSrXexXb6oZTK+H9rxm2+lI9q5ibBHf4HN
 WbjNJSPB3tfN3kHwugCPid7ryxHFdb1wllTu98KIXMkIdBd97JU6H7vPmTHTWSjXGtmioIY3/10
 AQi+aNe2BI32gyupS76Yzetvh7m272gLGjvW9JwwgVmFKUehBw0p5yiVs6tQNT/BTvm63a8qBZ8
 /3q+BdDAqRsd7cvxA8njlamRZeR+rBS5f36LLKRZD0FEg/CqLOC5Aj3IAXgK7zF1l24OALAcFnw
 LDYzb5Sk3ebkSXILQ2N9KVkF6Mo/U3/tkZXk3zWkMjJRVQfxEPetzNShGo4M0Z5fbPWM3PGQAqp
 aNdO9vOGIPOJg4awuPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111910-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DBB8657127

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1


