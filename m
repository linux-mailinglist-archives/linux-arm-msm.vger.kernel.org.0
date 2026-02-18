Return-Path: <linux-arm-msm+bounces-93306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ep8C+b1lWkMXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:24:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CA15840E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 135C23020037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21113446A0;
	Wed, 18 Feb 2026 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ielVIQLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyd+XFvt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0EA2F744C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435477; cv=none; b=WR0RegQ5fhQSJCzNKN3lubNWKczoWBVeqTJXWlUNuv981yk/cAOz3N4mG7VdeXOkKQFnHGtFT/KQn/90peDqDCDjVgRb0oumADF0sJfQ4XeozQE0wMQ/Hfzko0mCgQR8AYlhqVqxRAli8XQnMFJZ7OOSw0p6YzngFUudyFRcL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435477; c=relaxed/simple;
	bh=L0VSGnbMcS5idMq8mU8nZkCNut2AlL8ZGoszJiLBsOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j83iLHjatRi5RXrKy8bX8QmbkGX/CCTGuepRB6NQACFaEpx4D07XJDyAe7ApTIsAJmKr4AIERanRH0P3t3crWOQaimd2SipPWqS9ALJ/Z3regdP4ZHrQHFNCQiiwbOy71ZmJNL/ASPf08EjgvI3trPJV0puYv/qwLuutoEltwLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ielVIQLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyd+XFvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IDVwKK1046665
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVDLLiMLvUBUbLGtgSV7smUPMaHbagFZ9gdAkhI4Enc=; b=ielVIQLrjLBemkhs
	j1lGH0AeLHOGgoEYnWedLipGILrULcWWlBS3zrHmielB87i8Ode5zWnXiEEJ7/IJ
	gGRGo2/uREoXu2qE/xcRkX9pxtFlBLENIJ6DG9u06ASFFFLYvtkuY37iZsNKJ+u7
	P+4vM4YYhDfJzsHSfakEeqq5ilVH6WS752b0b0KpwH2k6dz0r+OTBrapOCn+XGhH
	RthrGB3MENXVdcLSkw0mdfXdv2qN6Rcav7qkB9n3cYSh7a+3ccXBU+BcxMAiiirK
	rAyZKYcO9/uqOe9QOcbjiX8kio7n7A/RtEHsEUG9jlAhrPgf6w+fyPTd3AG7qNNr
	s+QJWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cded00p5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so7507785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435475; x=1772040275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVDLLiMLvUBUbLGtgSV7smUPMaHbagFZ9gdAkhI4Enc=;
        b=fyd+XFvthj0tnIa/m7OtmVlD1M0na3QZIAaGjFhGaKbzFY7Izb7x061QEhzucbVKCC
         zXIhRw3mOBqhOSV0lxfRDfT4oVLLcyUPLCP1/it7HR7LZBNyiiRbnyVf/h15rc8lqc6E
         FJ9AEfH0As5dyQrczVLCUaDk2GADZ+o5DD0Gt+DMd+UJP9ondgQJww0b4DltCBmzuRHD
         tINeFGOEaSBj/VHJe/UGHNawFGM/h4VQ62uFqBFRMgtz4aD+eqX4lL7mmaqDc9UNAxE1
         u6oRa0TdP9q5GyLZgvT4Q5FuhbHxIdfyaUNblq70ptDzJhFLrshIif4h9oqh88WQPa1+
         JKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435475; x=1772040275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVDLLiMLvUBUbLGtgSV7smUPMaHbagFZ9gdAkhI4Enc=;
        b=sKfsQA56Z9l9Sx+z3G03qCiQASs2746T2yV18V4euw8aHmz4j/KZrfSUUP/hP+r08P
         h5yEubLMDKYBAtRMpULavTedbMmE5WsPk7aryJkB+cE/M/Zo0iS3HvZLYUqHnZJfN5fX
         A3Y99xh6hsLXfr8hkkRzTvfIADWLE6u+WY2IHGmx1rnUULknJAJnZRV5aVQtoFnJPZRc
         Vy2/r8DUfEXmN2krBFu2WXDHALENJFowQBpLOof/uWwi5iQlfKEnuLMCjUa2UdXIKouA
         47MLbAU0IREq7ZGjE0rgmn2JQW18hPzcEclg4peYPTbdMem1YomYnnBT12L6Zi7hC+Fq
         nKgg==
X-Gm-Message-State: AOJu0Yz0H1OIFcYtAOFTMiEHu8SkyehcKLeF0slBPTBQXhsQmc+seHQ1
	jh37gG/pxVvIlPKULpCCkzf/+HO2ovym1FgB+0yX3XIUnmB4sCwaBV+zdbKZrVzjAYAkm4JNxJV
	5DeY1cOv7RdZkOgXrrSZhD3c5+OsSX8X8h71yiCXkDqLrnNWaW0H9k23425mAKislFzF5
X-Gm-Gg: AZuq6aJ1frmrbWue1eeMrPESoS+frNsb7of9B1xYstzGENMeZ3ttyMihAVtNiaeqtSA
	VjJ5mlYgaBDLwiQQ96Vqq1sq3hqBhIrfapS5PHrnICt1eyiiS2Ll9dngvua3Hl4aYf3rnB2I7Lo
	nqmQfC8JQl0MIgU9C0du7NW5YKR4DWDL6Mtwp5BIizbT2imVH0rUX3XPn3MI4lMIOWX0xCldNfd
	yrKfJAyof94m38s258xZaPqcyBYMSasFc3DT6a5Llp+9tvU9fC9H3LI4CEm5hZGjRD7OnKqRomY
	f9Oezsx7DtZQwrxVmwihswZBxe6cgSKOMsGM8TdmAjJOOQB4s9vq1Btdi9sV1mgAXr+F7cdYdtj
	Qhq/c4jugjYfIkkHB0nSovVis+9XEgRYdy7Qqke3IjLP9cw==
X-Received: by 2002:a05:620a:318c:b0:8cb:3870:5c1d with SMTP id af79cd13be357-8cb74032920mr287330285a.27.1771435474910;
        Wed, 18 Feb 2026 09:24:34 -0800 (PST)
X-Received: by 2002:a05:620a:318c:b0:8cb:3870:5c1d with SMTP id af79cd13be357-8cb74032920mr287326285a.27.1771435474259;
        Wed, 18 Feb 2026 09:24:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm44181368f8f.32.2026.02.18.09.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:24:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:24:24 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: msm8998: Drop redundant VSYNC pin
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-qcom-dts-redundant-pins-v1-2-2799b8a4184e@oss.qualcomm.com>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L0VSGnbMcS5idMq8mU8nZkCNut2AlL8ZGoszJiLBsOw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfXJFvy59hJkSdjhI/x8j3LMr/OHgwrFJeguX
 HKH9YIoGSmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZX1yQAKCRDBN2bmhouD
 12EwD/9K3rKQ6ru5uCuRUiPCMKpANuf8JWwW1egHua7Dt2Ef6L+zLa1ZXFtONGygeGnFg1OYNCR
 2endQ2hplwe61T+t37MBc2NvfQzZciDGTIX9Xm6LYcMB9W2udQcSaVOT/eNdi3vDcMvJtEesuI6
 j2gMd10riXCO2T4NO7dlD46shJ2lwrnw5E7uDB4CqIRsjVGvs7eLbQewZ/C858mXwqFO6Uzuzwq
 ZKUVDwo7lTCTuHIQjjyL1aXV78vd9MiI6pPMWJH2cfwaD6SPBP/UVA0z69SR0SEfQ2JZKcXeMP3
 yWXfdHBcR9PRLuLqkjqTFYQWZE0Jk5bB9JnJ9JqIYfFp6vdYfH3xu9RHuPjh1pqp8VbV5PwKzmP
 zxbwYxZk49rNlMuurlaIn635+41tRrfgc5TdF5dOZO0xuIjmBxMqvms/2hRBiof0lVM+r/6TtJM
 exzlRcaJg2Mb7AujEjP+dMjnvA6xQZNaA8QxSSVaABIEfFoyeldI6x8PNNh5yqLMcwZpVg2mWzR
 udPraoFUjN1WikLEb5Lmwl7Ri0IaVdbyKjXmU3JfWBX6bE4tTeJR/gbvLZKFGPdPbUASOHz78F0
 S85RA/xrmnxqsgaDvGmtbsePakGm4AzSjDzelkRDXrAiLTdq38tJk/sqAuS90Sm1heSJv+b5pEK
 AT5VicaE/n8PREQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ZHLJaN9vMvdvq6xvUA0dVbtImfqnBb1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfX9FfDswwVNOAU
 H8n1xehpG1S5/Nc9vOncP3ODr+6KfkaclRkMr+lX3IuSU+RCSebfWpRxncVdOplY8tJ0e1UXRnC
 I5zpBWy1TyHhmd10dvn28Gx6DorrP/yRsLgkBH/2TSNoapZchgGeCjLBONY2sXWU0AflYsdxa0p
 fUyBm6/FRBhG4cI09dvXFrarX+LDbHNzaXxfNdJKBwtRYy2eLkeUHY6fEp4VrLlHZVZu0KR44VS
 Mr0dUoXJtdC8EnHKNBgwpaw3RirbudHl5sJACktRrGiA7VIXi8yHfp6txpMmmB+aCACC9T+XEG/
 U+6Ng3IW4qRjWMTtXD4xCsrXIj0FcPMRld9BI8jBBs8xxXkDcfdybAe5M71zN4AiH5ldDvA5hWl
 nH5/BFo3pZdFs07SbF2wTpCEWXIWmcbVN6d6087+mVwYRPwb3r9msSfe5Wq1BZYDcgTX/L8puXh
 KUSS8Ut6BlI4tPnuaVA==
X-Authority-Analysis: v=2.4 cv=b/q/I9Gx c=1 sm=1 tr=0 ts=6995f5d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=8yVsgoJE3aPY5vqtA_wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ZHLJaN9vMvdvq6xvUA0dVbtImfqnBb1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93306-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 903CA15840E
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
index 0cac06f25a77..30222f6608da 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
@@ -543,14 +543,7 @@ mdss_dsi_suspend_state: mdss-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	mdss_te_active_state: mdss-te-active-state {
-		pins = "gpio10";
-		function = "mdp_vsync_a";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	mdss_te_suspend_state: mdss-te-suspend-state {
+	mdss_te_state: mdss-te-state {
 		pins = "gpio10";
 		function = "mdp_vsync_a";
 		drive-strength = <2>;

-- 
2.51.0


