Return-Path: <linux-arm-msm+bounces-110825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J0bQCVn3HmodawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 17:31:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1762FC84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 17:31:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fa6s6VUV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jDzAVf76;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0534E30AA745
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 15:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA8133F399;
	Tue,  2 Jun 2026 15:22:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FF3EDE79
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 15:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413743; cv=none; b=M6TMMjTOXpQtVekywx33ee9ImPTuBb2pym9WHe8ReaWk3PB3HsJp8KxVe/1pq6U25I+URD4HFtQh6o6R5nxsoE9l2wCRX2GfyWHMnnZnDTo1ftaXzejgDFhjbXDHAv+hImkPwMrzliiKIkR0iz/r6x2e9qowQlYVpiJGdn/KA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413743; c=relaxed/simple;
	bh=drZJ3ZgjFEHArF7GLWJVFaud3uQEkhUjrL574rDJUu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBBfhtffKreOZWpkvCoU5umW7r28Jm4GqWrRgqLabNPtHRTXsvaVaIyESKJEacJWviFfOvZvRpSJ/kFeJmwfdO7sp7t2xcb30up88weFhb+XhCNBcx4X61ThPZ458UX0iTrI8vqf+Hh//eX6845248BF4N/1yPQ9oGqn7UY/Vws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa6s6VUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDzAVf76; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652BviUx4012459
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 15:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5Co9A3aIvLKh8iqOJ6Aa43KQiBGm8s3d3/lC8D60dQ=; b=fa6s6VUVVZL/lsV+
	uv7GROZem/vzaoqVCdtTQHOE3AqIhIfM2N/KcQIV7K6scsasOI0OP8xO4zy/rs4n
	5ifvg7y3X047+yYmUCpohCtKxsL82NBwjInDcg3VAytayIqhnsN7+x8iypSrKIIl
	XKRBUYyXBlmiZIe6YK9IQq9Ad4+Pyb943RwFaX4X5l3r+8+fQ/9EBK0/7BiqBI9i
	n1S2uK3omqWBer8zS857AEj7z5LMKbkty80n8JNm4apcvAB0SVjKJgy/G7RAPPge
	56+PLHLtHojdygi55+pDmdIEzWiM8I1dgIZ2ntkBYA9sTrLLe+daSPWLp6zRyOoP
	g1hQpg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4jafh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:22:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85c530ddebso1005732a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413740; x=1781018540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5Co9A3aIvLKh8iqOJ6Aa43KQiBGm8s3d3/lC8D60dQ=;
        b=jDzAVf76hXJ81MFLUrZZ48saUYHH1dc/Zs3ykBAQEhyZJ+wKoTd5K5Duy3+u4D7JOF
         BPV2UmvES2WNLr7d7QT+t4RWw2IfwEz0K2X2opV4P6Vi7Ec9xTklw0VEnlqxMs8qu7ah
         VE4iHFZAheezc8o+R4IJMTMAcbaMt43tZTABAtouTjaMXCgHas3vDotMZE3w6gksMYA3
         k85adTMbDU2Y8K0x7e26V2+n43XDQOGhz+hg6PtC8iITSK0b68eNoE09dhCyJz2gLmqG
         qqvczv5jGfrndVLa0zLhAebsvg3HpyaDr8OUP3yFbnJ9t6A83NTSbT+s+z43sPKcngwh
         Iq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413740; x=1781018540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5Co9A3aIvLKh8iqOJ6Aa43KQiBGm8s3d3/lC8D60dQ=;
        b=VXgMJuhnnyirdLAhYcUo196VN+nwzmaIMCgmQ4FvlZUYZcWa0nMZUK3HproBVkQy/O
         nlVD7CSVKu7rEcezfXPCB8WG2CltlISJDUQCBX4pdJ7/qahZp8BtYr6PsnMQfuA9ZH4M
         uxT0e4G3I+CJkSD7FCDsXActantePfjXGJp5HOTYjtWdoEObUsBSTbUmX/h+HNg1fNOZ
         ++nodJCNOYnysAx64AZzKV9jjYPPkHbUdmZYRRtQprohR+okwXxTjZnd5q1atQ5gVHwV
         e9pw2Nixop7cZCLwPVV2kZ3TvadeI7e6XtVU9DhVC67ckGOga+vdKCH9PF5DujVPjgLu
         YoZg==
X-Forwarded-Encrypted: i=1; AFNElJ/jOJFRLCheo7bgaii+VHE1EkY6qsZyw5bZelIm6mZDCK7MCTdqcvBNrgN2vKhvsH+10ML5Wb7QBceEZk/f@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FNdDmUyqj1zoHC3W3unHcCAm6MceJl405CJuKMmZZ90zbFGv
	XQAOxvBQVjYw6aiUKHoZW+6auoSVlx5KON0z3kYkVSIW/1cu517vT2hUdZ2tgDbAFH4WEHGQwnQ
	S+zXFMvUL870B33mEc88tuPMmongHCRe3SD0JU29Ci5WaxdVant80O7WgtdyoAVS1y0YY
X-Gm-Gg: Acq92OEXg1gigzvDvk4zB0PZFriiBgPAWjWLP/FwnLsS2x6Ad4GGCpGaXSnc9UQAu/k
	+g77+dwSyIZz9fNBzIvoygi7/25NB0yVwKMeQoUIIP/kSQUP9NLHZe5r4RhK7symhTJNG55LuHF
	Oz9VhOhtK/jlSW4SapfqSVTSRkB3nGKooljtJYflJtTJ7fIjaa/5y3iqIgxXIXAiHaS6CaRl9ls
	+Z0u+U90Mkuz9GpAOWcREPNoGhdaOewj5xqayLYkpzIdetwL04DwJz9ca4teZdVxw6dOJpsDVUh
	cNMje8QZfdpxwPjICm+5MtAcSMstdfCH+4tHCioEtcst6WjygbH2T5kb3u+dBxgQdd8gS0vGSr+
	m39YwctswOcaNLvUcBjXABUeYpuf5vDYNRDqVfFMrai7nTRDTzAlYb4pZ
X-Received: by 2002:a17:902:cec4:b0:2c0:fa4e:91f5 with SMTP id d9443c01a7336-2c0fa4e936emr71096615ad.15.1780413740370;
        Tue, 02 Jun 2026 08:22:20 -0700 (PDT)
X-Received: by 2002:a17:902:cec4:b0:2c0:fa4e:91f5 with SMTP id d9443c01a7336-2c0fa4e936emr71096195ad.15.1780413739767;
        Tue, 02 Jun 2026 08:22:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:51 +0530
Subject: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX3NAqSnjTGPvb
 z6NujhrvCZt6f6H8JiezdMAz70MurEq9mEvWajUwYv7rtyW9C0lC5hFC4bNJhBWUFThDCe/DiKq
 kRVP4n2wupgo/VuqXeXimT4PSwV4NiAXa2BLmFBT8YYVeJvLqPwq0BbunVdLy+0AR1fDikMghtY
 mTLZBFVoapuZLOyzhhn1GuYZo/Txs7B+k5zYQh8CVznlkXdaFOsJYkrRkgxP9Sl+NrglauVZaFF
 cO40G+lDPS7f/+zSEylYwcjOXvYgZBqMI9uUpXl7z7OoSSbjeoPKR8R0qiJzYWqKJ50anvxHOtd
 9QEmBLeHbi10wMWYk0eFlXpr9tA+cy4LhV+JCWRGS4b62DecR6eVUatwpQuGV00pOBULaXj3UNg
 nwPUqiZZV5f5oauDP9dkZAM26zIx/C7XlupuRtE90+iRaAfG1XNkpx4u3Vy1X7OjC4Qzuvz579L
 /uetvqAZ8NTT/pMMgZA==
X-Proofpoint-GUID: wW5m3101tlgBc3LtEMwbAYzGN48X-o-Z
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1ef52d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BWecY5n4_7i4tiiDEVoA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: wW5m3101tlgBc3LtEMwbAYzGN48X-o-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110825-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 7CD1762FC84

Add the gp_mn pin mux function to the TLMM pin controllers for the
QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
divider clock output on a dedicated GPIO pin, allowing the clock signal
to be routed externally.

- QCS8300: gpio32
- SA8775P: gpio35
- SC7280:  gpio60

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 9 ++++++++-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 drivers/pinctrl/qcom/pinctrl-sc7280.c  | 8 +++++++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 852cd36df6d5fc6d0aece7d57f8f59fe48c0cfee..1430abd9258989bdbd8a12249196bbf4e9bbbde3 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -429,6 +429,7 @@ enum qcs8300_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -656,6 +657,10 @@ static const char *const gcc_gp5_groups[] = {
 	"gpio76", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio32",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio106", "gpio107", "gpio108", "gpio109",
 };
@@ -960,6 +965,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1067,7 +1073,8 @@ static const struct msm_pingroup qcs8300_groups[] = {
 	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
 			tgu_ch3, _, _, _, _, _, _),
 	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
-	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, gp_mn, _, _, _, _,
+			_, _),
 	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index e9a510d3583f5c392acb833be4ce67c6b421cd48..2c29743cca7a259b5a41e73de347c536d373a01e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -486,6 +486,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -834,6 +835,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1236,6 +1241,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1367,7 +1373,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1


