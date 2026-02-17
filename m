Return-Path: <linux-arm-msm+bounces-93174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM+TJr5nlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2B14C5A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1964C30A454F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931673590DC;
	Tue, 17 Feb 2026 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6OTdkIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhuTtNxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A9357A3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333260; cv=none; b=AV6bT8MkZWBkg2GHNxR74pj8FnXpFPjFy6y6YqojZ24YghNR2vhjbuwyzjsmHs3VvJbUz67N6LzmKsKY9O3ljwHw1TFrVGzHVAXFoQ/Vrz2n3A5iRf6fakeXwwIGmoVMEMKKoetSkZ5nuq31sIkdEKF/DdDJPQby5oLe1vyx0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333260; c=relaxed/simple;
	bh=WUGnTOWFqMXc2ozV9o4D93c5ZNEJhDsr5vmysU5SqCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKlGQuYAnkb2W44MxENl4CaklqPnERuiZbIUkNwWsmzRgziOtsujUtlDBo7yaKYdQxlgJdaSGfm/o07V/oPgAGP3Yjqimn6p4CeJmUBeWtvwizZoJ5EwaGxN/4tg4CK3cFhIq/eihaybEpbrmE3xV+EJfexaXHMFRhRsIoeMQVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6OTdkIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhuTtNxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAkMmK597031
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WjpGNItXzQU
	rVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=; b=i6OTdkIVdUAr5fyIK15NtDrtjBZ
	mD3ytSU1QomVm8kg4E/+8ZBAyIYJ157+jb3OJa7s8ySkdcPvirMHmUeDHrvVPAOe
	80viS1dr/GLiwbmLYfHL7tGCtdTFhAc4CDQAcTfQDt/wdvNhmMMGiiwp9uExT+HN
	G93DAlkM6FQIOngLSKPL79WhRYq6XMwHVrmGBCapIATtLHVvisxIjocYIIJCn5xs
	o28T+HXX4tep2Ia63N32SSdsl85v217hzeVTe/d6pCiwd5c6F/i4ji07vI8bH1RU
	UmfXfv6/JcwB1MJgKAb61nmrmmVJT37I+dHFLoCOeDH6z+g1WAUOP1/Ttyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361vy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4a241582so2278179185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333257; x=1771938057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=;
        b=fhuTtNxLjH9qz/VuqlYoNX8iorET+pXdqS/a0pV5yUDUW8oL5fSglknsi0BXyShI4U
         G7OC/Vy1BNSz2pZF6uyxLhKP2QtSabnY3N6MEGQh3n9q0lqrMVPHFLpErUqn+E4skplD
         dOCE/GY+fC8/Pt/8IR/rDxUR4QaCNmj+J+vVciwIO05pmN7umhWYLGjAAmT06ERxU177
         oHY7ENXAYtXG2NVIBzotjJCz1OpHnlUYxwkTVCQ6Mo4wB6elBDyZZ9/SnGSDNg5paprn
         kJ5o3TMtjLICFw+jfj1wu9sC1rhVCtAa/CddKH0YWt1vS9SOq8ZMG9OznfQv3DFt1rGf
         KneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333257; x=1771938057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=;
        b=q+YD+wJiED7lhbvGMHjZ28lpGh71Vv4vI0Xw6fCIgLL8hcru7WgEEDbqAlbat1pHyb
         AGjN4fKwhHd+heLa5ZDUZ/cvno4wsfzxTWOV4nlkchqdL+u/dyvvzkNTJcBJVj65Lh1E
         Fjy+JvhED5vOmxlBBJsjiy8Du4DyDnYCretGDet4aCuIQzRlV4nenEniZ19D/4o4pEo0
         Fc7ePip1w9oFbmocrpDJKpix8Vh/NRguPBisfpgxSFlZhP0coaWRlTS7lkWBqoE0QiVg
         4KlhzKxRwgN+g9oEf3g/juEX6G0dP5iWfODir72IUBriZSrrhCof1qyQpZqzLI2sTX4s
         KnqA==
X-Forwarded-Encrypted: i=1; AJvYcCUTe3k5JndEmZ3EHsVV1iin9DbBz+yQ0Y11xBGakcOFthpIRKWwdv3gGtnWKDGCYpQyv6+jKBUNhpPdd6or@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdCK3iOf9CEh0c/0JQKe4uveg/wuXXWP9jnH9887iU0XjlnlF
	0xJFF3ol30yIvfJY+v/XxHjukmPNMtVeEMyDQDYWxJCN+sLsS2JlceCt0Ewde8Yq5hov9oWxGyM
	eCC+pWOke96OQoR74t0ASqnGWXVN73olPY7/H73+QuhLuoDhIQIao61UNMZe5B4wdaw12
X-Gm-Gg: AZuq6aINCRXrq9Pm2mzmcDLOATzjNjkgre66c3pwwSd9mfxeOGvAIBSppZy7jLoiXDq
	D37IAYXtQQtEg8vq5U8Mx+/NaFV42suLiCJ/5x8Vv1D5N3+S7M0wMhqEm1zEjD45rYOVGlFp/qi
	ncTwXMfFUte3u2tPofJbJa5vqhS36KttMyf3BzOYBYRg1Z8G+kscopOmG6IWApmEYYjSf49qamR
	4RPSqldeseiDOY14q0EbrQ1g9854aqyEKigfo4c03N+9f8YSiSkibAU7Ljpp7JPhfkT6lXShcAL
	7/psxllJmJOMnKANCajGZrJA2gxQUWrmVmrLxCDcbtoqkRSOZp6itgbomA3mdVIUBTciJeOodjn
	3+BKyqPodKBxEsX8aFoUE2NBmntqESOYtKrYqPQ==
X-Received: by 2002:a05:620a:1a9c:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cb408d6adbmr1603929585a.42.1771333257238;
        Tue, 17 Feb 2026 05:00:57 -0800 (PST)
X-Received: by 2002:a05:620a:1a9c:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cb408d6adbmr1603910185a.42.1771333255688;
        Tue, 17 Feb 2026 05:00:55 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm35009268f8f.26.2026.02.17.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:00:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] clk: qcom: De-acronymize Glymur SoC name
Date: Tue, 17 Feb 2026 14:00:49 +0100
Message-ID: <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WUGnTOWFqMXc2ozV9o4D93c5ZNEJhDsr5vmysU5SqCk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGaAiXpz7WktQLUwWYvIUyE59iv0LD3W7dKxp
 YDI22efk5WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRmgAAKCRDBN2bmhouD
 1xWMEACTAZVnlvVrpvV1Cyemf5etYCW/iMUTFUrpoaRIztfj6SEsw7nx6BCl9w98y3fYZLuEpMF
 W9XWtcH3MZDG/IcIE6dbLKyPFeQL+/H0rmDbqtKv8RFvv6CxcgNV/fLD/JtMFHAQ6viMwhCRYff
 9TItV9IUEARQNNzM9dQP0KNN5eCYOZZu0qzqC6HImqiNSq/Oz0HKSdefdBGm5KM6C2Ap5c2TO0u
 5py+nXMECW5tt1eEvFKS2pU5i7N7qrez3BYLTogceCin+md64VpaZZ4IFYCNc9qt/rW3Pb7HRzG
 W2F/itMPE4FG0u69O4uwduWgA8ii09jSIzLfkrX8T8EcCIh0kXFah8o9iyciXJVuacnFxdv/FNI
 36qrCN0/cs4cPAbxWSovyHf/3YhDemlrrD1rgwI3up+gn2BefEhOvDtPLvJV0s8bHLJqJnbxvO6
 rQT7NmZMBKhthUwGx4a4C29sHlccbQj3Ai8NyjSE6r9/uBLJCD3dyXZVVAH+jCWGD7cxjWEkqdf
 bLeDKrSrM/i+pT6CrbrR9pWuMOQXUoEeBpG9+i1lqfjaOLXlnvP6vUpXkhWanUDlBYk7cMswFow
 7w3/kKAYYOHaUixIfcSQYBCIoYVRWBRZf7JX9eRqDY4jSlg2fpsuB3F7LARFJfnptFE+nuh3oX+ yXOq9aGASkweumA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX0o92Foao4FfP
 Gy4AYwXrknyDxwN03BukxZPMnvrwzqAKVbGbYKV1rK4P2lNH7sARj+RieytCqe/QWC0kxgMas6r
 wWKZae8+7GFxVKZ42jEUk617QmxC0oeejcxMpMSrZanvIiKAEgO1MiI1yEh1UC6agOBkr7TB66J
 qGkupYvXBpsMaQENsIgl20c9x1Vv7AGczZBhW4GIDmRGtahnuhUaZ8ZFYqY3Cnsyh1PuOg+t70C
 a1nl8nS/jWYZArRlNmvy/I0glLTNKeHkxXtwb7rSB+E/NY/Y6m/bIIzcLZ//D6k9RZGn7TCy+Ig
 JRSzcc5mP3dxwmDd16mN5zXrhi6djqdmq4ULkdf0uMycxMdCLtOd/k59qHeDFofzzZsBQUU3GkT
 PrnbV9rRY9B6/9ObUoitS7hQ7xwq2ZzdMyr5Tbd6/j7TPaiLnQTkD5yTYs7pud8aM6JtCYFS06L
 uTj94JsAaK7CpLzY9xg==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=6994668a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aiRL1Prnfr7jdu2lDmUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0hj5Y1bClsonvr415g8Jg8Tumi1wKEqo
X-Proofpoint-ORIG-GUID: 0hj5Y1bClsonvr415g8Jg8Tumi1wKEqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10A2B14C5A7
X-Rspamd-Action: no action

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         | 12 ++++++------
 drivers/clk/qcom/dispcc-glymur.c |  2 +-
 drivers/clk/qcom/gcc-glymur.c    |  2 +-
 drivers/clk/qcom/tcsrcc-glymur.c |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb74..7c50d0965d8d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -20,30 +20,30 @@ menuconfig COMMON_CLK_QCOM
 if COMMON_CLK_QCOM
 
 config CLK_GLYMUR_DISPCC
-	tristate "GLYMUR Display Clock Controller"
+	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
 	help
 	  Support for the display clock controllers on Qualcomm
-	  Technologies, Inc. GLYMUR devices.
+	  Technologies, Inc. Glymur devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
 config CLK_GLYMUR_GCC
-	tristate "GLYMUR Global Clock Controller"
+	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the global clock controller on GLYMUR devices.
+	  Support for the global clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
 config CLK_GLYMUR_TCSRCC
-	tristate "GLYMUR TCSR Clock Controller"
+	tristate "Glymur TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the TCSR clock controller on GLYMUR devices.
+	  Support for the TCSR clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
 config CLK_KAANAPALI_CAMCC
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 5203fa6383f6..c1facd4e80f2 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1978,5 +1978,5 @@ static struct platform_driver disp_cc_glymur_driver = {
 
 module_platform_driver(disp_cc_glymur_driver);
 
-MODULE_DESCRIPTION("QTI DISPCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI DISPCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed..19f4b3cbcdc0 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8611,5 +8611,5 @@ static void __exit gcc_glymur_exit(void)
 }
 module_exit(gcc_glymur_exit);
 
-MODULE_DESCRIPTION("QTI GCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI GCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 215bc2ac548d..9d9621a61072 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -309,5 +309,5 @@ static void __exit tcsr_cc_glymur_exit(void)
 }
 module_exit(tcsr_cc_glymur_exit);
 
-MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI TCSRCC Glymur Driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0


