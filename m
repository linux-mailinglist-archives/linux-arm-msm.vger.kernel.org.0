Return-Path: <linux-arm-msm+bounces-106279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOkKJfk6/GmUMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 09:10:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963A4E3E85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 09:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CC8130534CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 07:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E9A34E774;
	Thu,  7 May 2026 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCPoOWjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kje4w1hG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12BF34D901
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137710; cv=none; b=JOrKhgmKQSUsM7eARPIOA7+1sv3gG4tFXNs/GKnL5+4SGvlGTNmpJHjlNI6M1TtvorqO7rHEIeLWRAYIvB1qtLjnFhFrT2fhYvzhRVOg4zJKVzPbkZDlosyyoYJNGGmwQqtsZ183J1PwWwQcXUOe3tTR/+DyO7kW3SMDAsJPGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137710; c=relaxed/simple;
	bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxO2DcUlC3fBm4Je7tuRrwyAB2o7Kz3ciqvgalLvPOj7/opHgY5u3RMXcJ186KCq4JuS2EdujwypSO+h/59s+GTSefOmWH4b+Z7gDh6cwUAiKkNWgNqYUF8kwszZGSufkzWd9ZeLkNbdivqomUzBvAQfxVb7USISTqnsISyxpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCPoOWjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kje4w1hG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647444NY151066
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 07:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=; b=GCPoOWjBoxXq/hvr
	aVmio8Q8JrmhZt1pyiRm1DS2Zlx3pcIfVI7graWIXoCY23KYda0sCDqb41+/AmBU
	683Py2lNYEourrxKrSdW4c4UTmELN0emoF0AoxANBsgxt9Ar1YqZCSs1A9xiKHQ+
	hnvOBqzRHocS9GAUY980MuU1+8OM6tsy8XV4g0UFVxkmEEgZuU1fxDfD2cTnYEu+
	NhiPv8wAuYy1tA+fYMF8p6c9KdpFwOpju+bZtjokrqZI5zXiH/uKcaizcIMLipN6
	RTwJJIghDso29aUV30bH7nVrMmAy62OPY0Rblna9ZdRb2AgLtnDq68On7ksXj0y+
	KFCUBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrkwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:08:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e2592ea3bso4841491cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137707; x=1778742507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=kje4w1hGSvctEtMDrrmE3qneyuZ2r4zXM0zTIGDOKJNROz07ig8fI8P+rtTpYsLuGy
         zzdECd6qPPD7IwEtN/GqidhOb6HM4qBmPmfgRELUz4q6BCFmU4+aMNvl9yTnnQ8+nqv3
         viRjtGiQmQmpeOc9HX32zfxXZvU+1v0CjAbfCthdDYiEkt0oDJjbC9yVU7Q6zKYH1UUa
         be116xprypypOAqZsrLiLS10/lb+KvYobRpzyC269Kjds4CkzBo/rzRTwSEsD//UAf1i
         kVx0MoyLfH9iGBjkHWxf2UosuAO2N6Kx9yy07c9TEoKUdSiCJBamj4srGJETv01uc9W6
         AtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137707; x=1778742507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=DoPwJMCJh/3Dt8VuF54gm+6Ts3QTjXRTcXBZMCZaFz3p2lg5ONI94rpjfDRorlgKAF
         m7/+SbggF7WAnHC3mrJ+tQI6Gc5vHozA8LVgF4O1LPH/axCqWVvwDHrU+eEChJnH13IC
         gxkGuxudHgJVEKEFZ0kJZL0Ek1cWwW0yggum/FzxOWf1g9IBQYw+zcU9SUS1HNNYPNVI
         OFzvV3kWGbDx0//lJZKe05fnFjSHYFgVnJ7aWaTpnAGYStNTXLv5kdNjj+51WLYLNLDz
         WSqo/uxM/6KUtIBN9DgIWCDltRrdA4dyqm+uImI3yVOsipaqnZ6nX0WVeCsXqZFWgEU5
         JTqA==
X-Gm-Message-State: AOJu0YzXiuW9x9mVU06FrUEWzDiAhwGWB+QWiccSeWzWvHZU0a5DDvsC
	/gigTtD3Yjew2LQUL91q7jT60w6ykSimJEUIidJdN6a5HqbQZLf656IMXmJHEdbLZrAFSMj/8Sq
	Sqtn9AFhj4mNeWof/J6esDTEjm51QAsiadn/fGtL1Ug2tb29zcUW5jqYHIYdD8oETxJG7
X-Gm-Gg: AeBDiesKXhABqYmGDYwD4wOr0RPJXdLC5zQbCSkD058UUJWxh0CaTgohs8WLvVtLx8z
	4egf/jCJck6ZO9la2wlvDzPqS1c2wfER6sF1/bdd+AM2QJv7V3+gdxMCuABwfpdKlALrrulVxPH
	3/Otze7lwEX3mHKiBqRnvBzjKNg0Yvvmmuu3tbepgURFg5u7OQNRH1hfXpzYXX176nhOze6VFjf
	PpwPkqxb+8A4lzSjXHGDqxjmy03I7wEtKR6Qo4sIj55P8CgOdihM+4488TfJc0DUZ2toU7kXwVb
	nAthyu3dAzUb66kfDNRqj0sx554jsea6077mppjCwvSmA2V+IFNcxCpUKNdBc2011RiiuUvYsyD
	FpleSAB7b2cQAU6WFkcUcwc1AE4oz6U+fOhbYTddnAyh0Oh2KYiGsfI4DN+7t9DMb60xuBebgqt
	9hVGgPmn6/6Ft+8DZwWiZGjtQIInHL+AsXmcJtnzkrQ1TwoA1cf4E50A0B
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96643201cf.5.1778137707197;
        Thu, 07 May 2026 00:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96642751cf.5.1778137706707;
        Thu, 07 May 2026 00:08:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:10 +0300
Subject: [PATCH 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus on
 SM6115
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-2-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/Dpg+89AtTAZ+p0GTGj3HsNhLOa2vbwG25Q6X
 SbBwZrQ8QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1cA8B/0TI9p7676sBpqMniKHxUYJrhvkKisA/Y1KN3RiYa89rIH9n8ocbnKFF995SWrgsv7oYYR
 CKTyEIuUYztgNIhfMdg5PGgGqCwCSHoHMpf/AKIUUsfXH5N6YvjSA69XHCSC6YaJMbVojaSl5fZ
 QfIkcZOcozsvmFnQ9BJtbZflv9N9TJt7qsj5ZtJ/UB6ek3hkQBxkWzpgWUU42DZWUG2dxe2AXSo
 HC1MMcmZb+b9tVh36raU/pKpzvhZsZWYv2Qyf6jYVnCySYl2i/iJi5dNQk+62T7P2SrV4EHyuOe
 zIS2NKukgyTeQmnOo7XQBABMqTtqVjzWQj61xam8WuhioCO0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc3a6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Qhf5OHDhvhXNivbLZvoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GDN59Yyt9FYRVNBHJbA9_bykHYkg8PB4
X-Proofpoint-ORIG-GUID: GDN59Yyt9FYRVNBHJbA9_bykHYkg8PB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX9Qn7DNzE3L+O
 CNknjVwyaaGySR2nDco00JZ1M+wEBNNWhrWDDnhH7iNep/Itay5Zc3MIciRAfCI2CxYMK6cfRyd
 2r5BSdClbkT7FmdPTX3gIdmqCcyBOuybnCvAsUCeoeYzV5RiQLrhzb3u7iS+7NUQ5F0Tsc/6+MO
 oVz6JqOERGvAuAYjturhDwUBGIAHWE/8FB/dJ1/oRI/STA5WVItCyVyomfTMTmEQNMnlzVZFFWh
 pasYWIxgNKYmAcUOqb94E/R9hGWybwuhOw5ekgkXLOeu2PUEQuMBwyAYzGhLpxA744N7HTpG6kC
 GCRkov3b6IslLRxBDeLjD2I04UGJuImy+qqvzTXG+uLDcxoBgxAwSUFW7eZeIWnyRRjFVAixAHj
 v4bHOcLfLBeaETl8IjxKo/zO6ozHWDyypAv0PgxCbud4CC4wzo7Q1ONv3RCPVQjddyVXV+LJkhk
 W+G2KPWjEMhGv4+mbwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068
X-Rspamd-Queue-Id: 0963A4E3E85
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-106279-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
one found on the QCM2290. Define new platform-specific compatible, while
using QCM2290 as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..5c5933082f82 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -18,7 +18,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qcm2290-venus
+    oneOf:
+      - items:
+        - const: qcom,sm6115-venus
+        - const: qcom,qcm2290-venus
+      - const: qcom,sm6115-venus
 
   power-domains:
     maxItems: 3

-- 
2.47.3


