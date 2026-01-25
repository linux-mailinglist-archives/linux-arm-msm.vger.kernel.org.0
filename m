Return-Path: <linux-arm-msm+bounces-90446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FsKOJ4ZdmnXLgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:24:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E880B0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896CF3049278
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4706131D387;
	Sun, 25 Jan 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt3lwj7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyCBHFl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177A932142F
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347241; cv=none; b=QvXkLExjWp1l7nMLrpsZrJ2xsIrea50T6ya1hve5Jg4rT8PloSZ/fVhwqeVyBwCquEwHHKoJvA3VtrbrvLc+U47xY2El4Yn92Mmt84fHIkY6Y/6bbpWOj0UUiztvGRdGtRCuwro9JQuSav/gIXS3/+7t8KfqD6B89SVwGThGGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347241; c=relaxed/simple;
	bh=HCJVqJ428XQDN87qXRqTrOdSLhLMNLY6esVTo6pN1fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=To1WtrHnJIOrf6s/TwLYvBlWI/mWW20XUDntZd1D1xxJVT5u0fV7yx2zjYmc9MC3z5RqqUQ+8dkhcy3DZQYqG3AFWdnbviMxncwoXeKUmWbtQllP9vedKH0zARio+9BSGQGbJYSY0EJSuBjtIfElzro8t4PVI4JbQByzcHf4rlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt3lwj7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyCBHFl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PAa43c3689408
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlGU9H3dfUbp4xV6iF65kZJx7Y/3oJU9X/2nLKTv4SI=; b=Qt3lwj7v5diFjcw2
	2bU/gVOutT6EBjWmM1h+4mUqvSm2X0LLqo8hhrnzPZceaCTFa5F4ljON2DFKgtBz
	acxZS4kWDoXj5Q6ebnCIv9XEtyUU6i8Y3V+eSiZvWUIReYt1G8vjRt0rYBLhgm0y
	/jI5Wqc8m4rmI/IcLIw0MUhsduhVFjLF9vmZ9mKzSRk+I3jlXbKMUp5V04rogvk0
	2JH+cA18/M/s8b0ljMXDsFAOe4AOpNl903QuZexs9PP7kbSVp1J2x8B/ctDbcVjQ
	LW2UvaSu89KKb5xYEsUYTo8BKjN5as/NunU5xfZNQktT3JXDSM7s27rqkRaclRC3
	2zkGQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f24yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c277fe676eso1094832985a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347236; x=1769952036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlGU9H3dfUbp4xV6iF65kZJx7Y/3oJU9X/2nLKTv4SI=;
        b=ZyCBHFl2pxsVUfgrApwfAc+Oh1B2hM4DvcfitfAAbp65Mum/R6zR895BHBE2K6bw77
         hT9MQNsZXR0Oe34Ylb5aR5WRd6v6w+2mqkqUTyigkUr2yagU8KHSPZLTpTHxn95liL7K
         Qa243V32CWMYM54yxnCRXuByiEgloSZe3uEB+3FADPZC+zB5siqW/um/s05O57GRxId/
         xcdzbTsMaXaloSQseRO0P+YmQCbM+xZuDMhFILRb5xJDwvoExXV+OQsaeKOp2+HVr9dI
         eMzLcp+xssAG+/ceXGyGSQ6N+1wp4G5/uQAHBfCo8sPJuzDZll6Nxm916iJw7hSs7zfx
         O4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347236; x=1769952036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qlGU9H3dfUbp4xV6iF65kZJx7Y/3oJU9X/2nLKTv4SI=;
        b=UVIikEhy5agMFFRTynTnVmJuUYl+iGLdo/Edzq/JlrqISa9thbCC2wXI6VzrJTjTWk
         j9lF41EGFoIOv5gE6jWBRv4gxqzkh70XkI6zewNRgY7pitDIS37ihNHci6XztiFKb87o
         IfuBZzAJSoNgYbZaCGnPY8pFTICKDXtN7XsZjurQtkEdOYoXOwW7gkZQAMNZDkv4lF63
         TwDm48PbelPixPTBQn5YabB6WgoeoA3QUO9fV/1Bmd4eIAgQB95CzYh2kzXvXAWsEg3C
         KhS0ppbyyDTvSZwjSw+cKf6DrPbNpKjjTqscJncmCqr36qCC+jGVKy/cLC1TuDfh0iAF
         Xiew==
X-Forwarded-Encrypted: i=1; AJvYcCUWVXYGOBDUQ+wIBb+yah5L9IIlL6DI3E4wyEgofTp8mXxAIJtT68kQYRBr6e4UGjxQEo1Y0mid4eADyZ6g@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWfM5xz5zGPI0Mhk56vLIDmdOWUVwP/7NpxZM7Siu4yhAgy1d
	JdhA01H2sLi3RnYfBl08YBK5ZtqEyNJbvVseqt2iTx204m8i/VK3Cy3/HGYYPN5jsEq+ESx5Fpl
	29xYBfUwl9KXIIdUYIyxF4tYjT2jyk2qAU1qg8WZFcFVm24JFbAyrSo6s64dnzqhGjDq6
X-Gm-Gg: AZuq6aIQbvRcqCz0FrVt6KvNDnOwofq3HXq4ynxRDHrmMIZLDcRj1oiEOi50HynUm9p
	P4VjpDFzvCJ6wpvz5PyLAuAIQLiH26yUjhDVwHByawCykSMRCbhhAZve4T7Grqb3FP5YsAaYvWb
	5b77STEpyfo7j0jbHXi3U0UDAiJIVJqi1/R0u41iKv5dec1H7qdOAc2sOnIhSfQ9CBdUystShmN
	oUvRh8hG2olrh+Qtk/0T8J+ZbSCXI5vrroN/DEAS4Moi501yxZBmaYFU9RtvX6b8Q3tebkkTzRv
	ftAzCAG7/sdyXQvNIv+kHdgO2dN2Gg0SwcREts0QzaM+CnJqosdFzXXc2gJDaw87glqR42jblX6
	XMQcVYuqPCkc7RG0D15TIGEi3e9cWRa1OgjfxdiX36RiB4vIKTW6hDJs41PCR1OuJ1cVKu0P/rP
	/SbdIQlT/fvKzP03aV2kuGy2g=
X-Received: by 2002:a05:620a:319e:b0:8b2:4a1b:b80a with SMTP id af79cd13be357-8c6f95c6dd8mr174359285a.25.1769347236022;
        Sun, 25 Jan 2026 05:20:36 -0800 (PST)
X-Received: by 2002:a05:620a:319e:b0:8b2:4a1b:b80a with SMTP id af79cd13be357-8c6f95c6dd8mr174354285a.25.1769347235435;
        Sun, 25 Jan 2026 05:20:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:23 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sm8350: add Venus device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-6-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HCJVqJ428XQDN87qXRqTrOdSLhLMNLY6esVTo6pN1fY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aZxJSaAxnnxMNe3rfyCgkw9eBmy5s3bVfz7yl6v+f+d
 Lpa+byhk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATmfOd/Z+uErPs6itvdea7
 LP3RcXHPdXdVFdHvz6KZy2cU3T+ykjPzWYK/5C6rbb0rU+eZrHuz2nKlmt5B/yTTl5ON96zaLlm
 nlRcgyxHIkmVibtl9tV5pU2zs84IjO1O3/np0/tjkF22sX9qbPTkzNRx9oq1EDnM85RZO1bhqz/
 NpunlGV03m+p48D4e1vOrJ0y7d1usMz51vPLvmVhLHFDWfRa7xW1btz63yNMvx13h/4+CLgsKkQ
 1/Vk3nc76/XPSt7XVpPpuyDZcSmZScUHCN5Ht1cUFwlkBge2a4VVqW/L2l6jOWvlT0uU7MPnHO7
 L3t72YaUrqXOTdk2IYbrjl1x9b2XczRSZMMVRZHnHTEnAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=697618a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OyNfseFvsq6WzarXZFIA:9 a=RMe4X1btV4NIqd4N:21
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0b-HFHmHrH2r9pM0sOPHngD00O_F75Vj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX/20RRYScYd0a
 5LOzULB6XDVhey0NIQq5eaWPq2yxxrTQMEJevCETBiJlow9qZdLw1dzqzbmONqmyyOLyd0WhBKd
 tPFdiT5r231S2FFuS0/4RalMrU4P41lMFaqrtNJyvLvmwOTBzLAyTUdDY3tUwl2T01FoiDBy25m
 AVi+l9prpVob+s9VaGPfviolNzO5eAIPdBVi/lNVYYYjMYYTX4MfbP8hp3yxLVPsyba5gnarAIC
 62B+nl4B4vcXFUjtSp5/eRS88RTlvzk/vb7kZmkzZ75RYgUIhJUTZVZhRuaDakVESgT+Lc4UlqF
 M8gyIJ5kQSqqHKV8ZBlVgk3wotxofmIMPpw0Bu6UU3kdnXK8/CSLKEyNMhcimNdzWwElr1603h3
 Ansa59uRrbjD6xbjl3k4PFifOw7L+UrBgq3GhxqrG/UCsklmlEx/B+obw2vOtQhj7oFTEWXwhYi
 89M0tA+GVMoX0iCCbhQ==
X-Proofpoint-ORIG-GUID: 0b-HFHmHrH2r9pM0sOPHngD00O_F75Vj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-90446-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ae00000:email,abf0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 541E880B0B
X-Rspamd-Action: no action

Add Venus and video clock controller devices, describing the Iris2 core
present on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 72 ++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..2d8787266011 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2745,6 +2745,78 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sm8350-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3


