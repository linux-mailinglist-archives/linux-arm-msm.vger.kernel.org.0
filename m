Return-Path: <linux-arm-msm+bounces-95387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHYKHfhuqGkkugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:42:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE642054F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172CD3068DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 17:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C033C3C17;
	Wed,  4 Mar 2026 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luKaWUWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O829FvDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7333C3C1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646073; cv=none; b=B81vGL0P/oBwkAB6DZ5FiRCceaV/spkuitTG9vrkqpVP+4NrBE8lrIKmr1v3JxTzb1OG3l8yEVPfYHfG3vILVCUlGFLG4MANL6y3uUkaDzwAK35EYKj5hQtGdDYc0CqQig1TnQtMeEjH1BZmIxgTOYJk3RngCJezPGv2Cb3tRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646073; c=relaxed/simple;
	bh=uUwW2grMvbuKbrp4lZXb+6CHyoUfsWs1k8/5kB5T9KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIuOzQJkApLRHnID5ndmXKfGro3CQvWtGuCexoiomAwWQVfS3JqbbdrYDBQzbyP0Ygw5N+fsd0eEBHya4ow03DGTUrkaJ8bJcwORI2YvLQxWLO4PTBDu23IUTBC4OIONf+H/U2plfI8Q3hBxnrFAGxHzP9crJtbGLRJLnR41axc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luKaWUWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O829FvDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHku02611998
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 17:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObmbS+0KfF6TnR3YkY2rdDy7IdpeKXphqea8ZIt6Bdw=; b=luKaWUWh7pfluL5u
	LKsTbMbXiyo0wriu9u1Hj929+X94bUst1cEZpZ21sjVgacwxK5Ty48VdUTmv4dkn
	hBh+bTwyShxnWeQ0Zm4zwFdfwSqPX+PCtKW7PIQL4Xbkt1ReOg0f0G8aDqzwaPfz
	gfmlhQbDtHF3QsTOgSg+U21MGB3fUXgTuT7GEdXxL1C+PzhmZbCMB5WPvDkuGCvC
	q3jsCI0IFo6bty5rUILuvYK9n9Iqs5Tmud1gxlwMPIXcE3s1xhIxvU9emBkbj2HJ
	TU4agJvWODRwogR7G32F/Qqwe7KE384XWl5/qLwyjW8ph2gokokqo1mLW66+y/3d
	On20AA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w8250-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 17:41:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35979a03106so4339387a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646071; x=1773250871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObmbS+0KfF6TnR3YkY2rdDy7IdpeKXphqea8ZIt6Bdw=;
        b=O829FvDayuDm4mUe9faec0uIETgReGgM57QRWNu57PF/YSYvuSP9NDu/FgpHYp7Yqx
         N0zaXqd1TAXYxq3ye+jqiW0k0g9v5CNAYfGZYS9Yf/3ic/rZidxg1GVfTBsGOJDq22kF
         shMmJV+qDQmL2NPyDWXuWkXo9dZJByEZr5pT7+Uec7FUZvzQvqbMSIYxcdPnFe2fwQkS
         pjybtIQJzOL4EpAdpmQb64zyDRkQOga6LMw9bdirpP42sCeHkigRZXTE0TXwm8tg9o6X
         izIp8Wtx7/93pNH3e52PeL86ppmmNBJv6R6vkY1cSlZcnwNEQzDRuM0KxhfPXMshaqqY
         +dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646071; x=1773250871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObmbS+0KfF6TnR3YkY2rdDy7IdpeKXphqea8ZIt6Bdw=;
        b=Re/xqckWHyjlJSqAY04e8uf6PF9jJPyodILEfVTabSosJwLkbjove2Qip96Vlf6c2V
         nkPPmY38LkNdcHUsQHq6uitWtq8Syj0eIOnTQc2QySwwPp9v9JZlyt8K/UrZBaXsYcAU
         CJrESikziaP5TEs/iL3V4XBpA85NxJiyF2darRr5NyzBEHlfIEcdkaEYOWoe4AaQjGPn
         0/Fv9xvpUA+6rf0wPUH4vqmqyx0wphvuYYpTxv/UPV4sVaj8il+XVj6wdR0NgnjjKA7D
         IRyxBwzJugADxCdJCQJcn0kFd5uvAky1ME/a888UOogzglGJB0/RR5ed7BYWboaSWaSM
         RyUA==
X-Forwarded-Encrypted: i=1; AJvYcCXySPWmg+V/gR5f9hnG+oIFGYXrbdtVZY+gIb/CRr40S23d73+v8lGhHG/3CgBlVYy9jh0Elvc5yVJ/PdRQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7C7fu02peSwXbIblZzP2etkvAaAnSJf0A5g9AmDA+QLA7jaZ
	3yczEP2wyz6Exf7iIGaDOCxg9ZSXoKbB46ftSbrz2qYfW4UrTSRdY/Qr0PilBmk4lAfmt6Du2OT
	hqu/gU51DsXz/DY75JwqaiGzYTK6ksyhRretibyMq1EcEwrdkRNI6yBmiTRaRjkrDCcgL
X-Gm-Gg: ATEYQzzP/DG/DNGh/53ZVlCngNEUIi2kxH0PQO/nnvYFYNI10IowwzThVivjNfKHWLK
	hLgQBhAUW3vU8tNJfUd2rYLWvBmac/gAmzQwHQUhI423CqrsaY6oJazcGetSEC5Lulmk/1kP9KS
	FZzs6MSucCaZXE+W+tUIn6ve5pWxcGvhGBM7/ov3cTAfNahUtIsE5XyWpFMtdHXiAonE2aZFuv5
	HrHALIPg1F9A80eWilueguZd2lD6IO6OIxWQewe7EEVZ6u6qtK9fKxF9TNB0n/g0eYcyiTUrW7g
	qchT4CKxYv/DDLD4qskEQrpOq++FFHfJZUjP8NsYZGLXee614KRSA2LUsG8kGU9z1KWFxW0Yljy
	FoCaykCAarvWZWXb7c6dDIw3Xw21nO0PV90hkoH5tKhEN+RGPhRqa
X-Received: by 2002:a05:6a21:6e97:b0:394:a0f8:f7d0 with SMTP id adf61e73a8af0-3982df066c1mr2888716637.26.1772646071041;
        Wed, 04 Mar 2026 09:41:11 -0800 (PST)
X-Received: by 2002:a05:6a21:6e97:b0:394:a0f8:f7d0 with SMTP id adf61e73a8af0-3982df066c1mr2888691637.26.1772646070595;
        Wed, 04 Mar 2026 09:41:10 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:10 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:51 +0530
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-1-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3CsfBBW3Nvv42aI7QNvLoGo34QUyo00d
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a86eb7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RxPbs3uwKBDMNohP2qgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXz8pOFA5IG7Nd
 dBxxg8jdvC0ZDeRF7pmGAcA+0dM7ynF20uig7hQHRA0bP7FqFzy7P7/napndXrzuPSFHsXbFZmz
 zZgcxWTlUIJXyYJXShXQFcviPlRQTIXeIG6a2gDb59HTUWyueAnsX2yit0yJiVs9u/Wh+iraoof
 tEYXn8p5jVVZt6sdAYQaQ+5OmVvNAEYJd78SSydMmcQEs6UcvnY1mUiUUhaNQ/rf1yeHWuYTx+i
 wT53rTuLSIZ8QsBIwm3aXuasaXjOLfl8o67uEbgbb/kwXlou0YBv0OIGccIOBBHZn0Ujz3KZUBj
 9APE2ByrYtV0V2WROTqqvxGx+5O6Lzie4kCLWzYqFlSPM+Yv7usItjXhKfHu4rKUOWmaga0zC96
 RxVmiztwdnFlLPiGLquvrRIlrmvLgEYgYhTBt9m3i+z+BXNtMjZs5e9O5f26xzSlarfMeKsh55P
 YKrJbCdhGWq/N6Lw07Q==
X-Proofpoint-ORIG-GUID: 3CsfBBW3Nvv42aI7QNvLoGo34QUyo00d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
X-Rspamd-Queue-Id: 1CE642054F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95387-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

X1P42100 video clock controller has most clocks same as SM8650,
but it also has few additional clocks and resets. Extend the
SM8650 video clock controller bindings to include these additional
clocks and resets for X1P42100 platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 include/dt-bindings/clock/qcom,sm8650-videocc.h                  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -67,6 +68,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
index 4e3c2d87280fb9a37cbc52330e31b0710ab63144..ba2d231e9dc8718bdcc07f994577cf68413dc273 100644
--- a/include/dt-bindings/clock/qcom,sm8650-videocc.h
+++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -16,8 +16,14 @@
 #define VIDEO_CC_MVS1_SHIFT_CLK					14
 #define VIDEO_CC_MVS1C_SHIFT_CLK				15
 #define VIDEO_CC_XO_CLK_SRC					16
+/* X1P42100 introduces below new clocks compared to SM8650 */
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
 
 /* VIDEO_CC resets */
 #define VIDEO_CC_XO_CLK_ARES					7
+/* X1P42100 introduces below new reset compared to SM8650 */
+#define VIDEO_CC_MVS0_BSE_BCR					8
 
 #endif

-- 
2.34.1


