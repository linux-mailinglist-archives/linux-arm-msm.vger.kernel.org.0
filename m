Return-Path: <linux-arm-msm+bounces-110826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lguIB5H3HmppawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 17:32:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7862FCA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 17:32:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f5J0vsFV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AYXFIa7T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A073530C6756
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 15:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A2C3EDE46;
	Tue,  2 Jun 2026 15:22:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CA3EFFA5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 15:22:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413749; cv=none; b=VEo12KDhy4LmoM9PQ+O83eF19M+/uMAel0RyFvgXLqZ7E0YtGq9cf2R3PQm7uGfJ9Jg6/JaIPDVhW9WToSdW9Yp3bsa5wGNDSnQ8l6NoJCaR5ick/mUldzJzNVNHdoEy25EYLr4Ic+xXYHyu691xyOFeuGqDrTGp8zS7uKV1BJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413749; c=relaxed/simple;
	bh=+Xb/utRGbA76vMez2NMiVdI+b7uBrOEKhyFM8kS9ee0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxaUvF+bavNajM3xj6Rc8rCOv62B1sJOQkLv77XVg6FEv1GH5D8cIxHOysnpuOC+P/DCUDt5l95WDW1QFEjXJ/iUbSGSKI5I8NbAFBxm7GRqTZDhJf92Tk+Q1FX31yZ6S+eUVLEBHuAjsfeC/olweucmMIpZup00hJGtlbVtwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5J0vsFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYXFIa7T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CaWWi2767325
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 15:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhRPtdw0XTUqgVAR+NUCXa7KNyeb5Qt7pdv/jdZhIhM=; b=f5J0vsFV/Va/9/B9
	Rau7yFgAY/y9AJgYQAP102ItcfTsjTLroOG/XgKkClblC2RgveaFHEqhAUw4XWOJ
	pv46Tz7TcoIcgnVUYQUJ+iWgX/UfZipn9KjZ4V9NCrEOVgqDtbZBUTcyhv7XVexc
	/n0mXwy+I7d267lPFjhHD2HO1ijPswpLZq4fYuplCFlLFikyoYBtSVZfiG7aBl1b
	EwgWYw6D4n3RpUV/Z9pbtt+5UfjeAepnQdGip5N0gqWZHDk50WLFQH+3Oq2QlKA+
	VlrYs4Wiql46RsQs7Cd0KObxanA3o5aqto0ndrienvA+7yBLMDwSUDQqlcmucbV5
	H6xV4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus2630-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:22:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so25146845ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413747; x=1781018547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhRPtdw0XTUqgVAR+NUCXa7KNyeb5Qt7pdv/jdZhIhM=;
        b=AYXFIa7TBDEbfRzl1xi1C2FE1mLnTrEvAZpsevuVuhAzmre52CplusVTHPXCGKUnS0
         P/qnWQlZpGjxhHuZS1s+IobOlpu6k6mxjvXbTbKgkxGYxkbiddjg76svlb/A5noDtdtA
         q608LxonTAVhrc5xV35rvrni2eEsh+9B6XSFnijosKa5WS5BGD9eW1zMZpMX2Tsran+3
         BewBGkKuwGzIO4tQkQejO8WEaOdK9qggVo2GS23R/mCPlLAJNs5hJkT+o/ySRI+M6Q8C
         f2FzbWsBc7UTF6VMoV+dJF4WrYH060t3o1g38rM5yRb5y5ZnkioyGQUNSA8+V9GGYdWD
         atkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413747; x=1781018547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhRPtdw0XTUqgVAR+NUCXa7KNyeb5Qt7pdv/jdZhIhM=;
        b=e7Vsohg1UW/767sGPbwA76gfZw1k13OqYqmSWvG9QjWoVIBuabR284UuI19qebnYfD
         8wN709pUPv6NMmflnbnkIavSayQBr6ZDpyMbu9q9+QyzZJwSKhUQaHeFm1rt1banWG22
         YfG2prpE55F48U7mgNVU2zvjqLoS00uL9K2Q8Hxq+bPkg4hO4UPcnGL2Bsz8qVyg29Zx
         VVZnoRSrM5fixJKzVVKJwpwLfkcbF9n2bPdd63rnwE9p76qLhESiQhMWeZz15WgGIn8D
         BQc7HIwWrxuDplEYPscHhiMNbzYQ41YSIvqS05Fb+JDNAIHXiiL7Ir4sWGgYBEnaEgWU
         K9pg==
X-Forwarded-Encrypted: i=1; AFNElJ9DyMw9DhGJGBpbB3mXQcXykR5bbT7Y/yZV9FIdvjjBy9fqZNWJWMRJ20pBwuY1WwSzWDqFTqp/WOts1wBT@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVniagdmyOJihTckUmQPlkYUOy3FboBubWYqrnbs/UGwq+hzD
	4S1iRyEyE9NFrK6ujFTxGjI3z6EXqvPFFnky0R4PweUAoO84ZKYjehKi4f9wcEQQmffy2DWyo0Z
	6TNaecHsyWA+l6alzhy2BQwHfKMqod4g/qUWYQRl122kz9LQ8GdFq0w1UJrT5jD5lmKLV
X-Gm-Gg: Acq92OHSrMcUng/oUgInTq/nH+5Q6IRk/v9mIp5FaMUJluGqS/HxxLLikQLeskbx8V3
	MHgv2ZuqyuUCM0FxfNLlvUXG0kvkQn/M8GmqQ0JyDDOq15U/HDfpHXwP7e9Rh28vb8+029l+R0x
	jYEy6E0O2y1IQr5C4injMsVsIiQiLyFmaV8g/wG2o70dqmXuKSYGNT/ZMFhd5YwDZOJEAuyHixC
	1eAMuH9r8vFMiuYTge8N92qdQBgUIjunh4YtxaNfQxEwoDtaV8uW+HQ7W9smqZ/XPwWf9yUmlXK
	brMcnl1fcp7Da8bRO6WSxCB2OYfFxIc4Jq2pPP/41SlxRCQPn+d6jZgfvCD3rrGEBXgs/bmqmO4
	MWwpU0Snh/17cmq3R98LFaNhSW0P7YFynuOqk8+DDfqUGpKc0cGhDiKqz
X-Received: by 2002:a17:903:2351:b0:2c0:aa5d:756f with SMTP id d9443c01a7336-2c10cc58081mr37108045ad.8.1780413746460;
        Tue, 02 Jun 2026 08:22:26 -0700 (PDT)
X-Received: by 2002:a17:903:2351:b0:2c0:aa5d:756f with SMTP id d9443c01a7336-2c10cc58081mr37107665ad.8.1780413745979;
        Tue, 02 Jun 2026 08:22:25 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:52 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N clock
 output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Z8Pq1cvZO9LSkSHZpVxu6uG1qIx89Axd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX//01uPpheVVx
 bVYOv1CPwXMP3PZmhVyV+oiXsXwYIy5HkJrnh79Qo3wDqtPjM8fAf4OVuX3O5o3nHzwm95p9zzE
 BxeMTMHr40Hx2M7LM1jLnxlo74K+cXAIiGH63vjfydMzJcKF9OlC3wTCTp6kVnN8tVXkat72rZG
 aX0wcMhdwtB8MyMkvvQU76q1ZBZO1/ReE14vbA4C5IOAKbVqONrlF8dq3VkYQUeyMJh2N30prz7
 gWbHjnfKuTrMeLb2huf8gaCG9e2T5THt5J9/5UZM+SONac6r9ud9/dru3ts9Kibal/bhTWagrgz
 fWzyMfk6QTC4Qm5qW3nJwPHtAPyE6DTh0TheS1+I4h1pZ0QT3kJmtXnrXK3IKDbVaJLO+aIB0+q
 +t6vnqOvnTf1TtWSvPAUvjBptOGDtL19wBwdLCZJWq2cxb8mBuKvN29l0XxZk4Qp5nTIjvcYP+I
 19xJloGhNBaetJMmblQ==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1ef533 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FGXTwBWI_TPF8Oz6hcgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Z8Pq1cvZO9LSkSHZpVxu6uG1qIx89Axd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020148
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
	TAGGED_FROM(0.00)[bounces-110826-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 7DF7862FCA3

Add pinctrl states for the GP M/N divider clock output pin across
multiple Qualcomm SoCs:

  wire it to the GP M/N clock controller node via pinctrl-0.
- kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
- lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
- monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae41fa370ab2c892bd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
 				function = "edp_hot";
 			};
 
+			gp_mn_active: gp_mn_active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_data0: mi2s0-data0-state {
 				pins = "gpio98";
 				function = "mi2s0_data0";
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3acb22ef228bee340212b8b2c300957..19f8cf4e15482947f6049188050c370340afaead 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6022,6 +6022,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp_mn_active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio114", "gpio115", "gpio116", "gpio117";
 				function = "hs0_mi2s";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941bdba04f99b988fd7bf5afd926b31d..ebe5889daa5300efa7857314e9170d7d2fc33ef7 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -6433,6 +6433,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp_mn_active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1


