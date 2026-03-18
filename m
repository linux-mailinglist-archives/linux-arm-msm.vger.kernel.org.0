Return-Path: <linux-arm-msm+bounces-98353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C4DGUhlumklWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:41:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE92B83C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A88B2301F5D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B87938737F;
	Wed, 18 Mar 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCZVmgr5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeesUhjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD93845A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823221; cv=none; b=hB8xUlVkpDvma+QvFs8ucilttFiwN3UYoY5UCmVnGFdbN2RGqCu8XgXq3EHVY5HJ19+022qY5Hf/MSmgZ0Jn9DOFyZ60xCbayhHIm8oldQvKEJ7gXNSSn7ZjiTp5hvyuYnZiV+DZUzYmmh0b5Zcq4fWK2lgmpKzKK34btD2EcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823221; c=relaxed/simple;
	bh=gm6tDoWzjlGe4E5qZfKllZb9n636Raf72Fz9PM69fbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXwgvkO+tUDpXuAM1NNfu0etykDOzWv8Q0TZ41S4ZClaQ+57hsfh5f1+RWUUmxoVA24hhTU6W/RakC8QBpT9rr8KphWI8LZmZRan+bkeGXGdbt3khDSi7VCRnUfZIKez4jAw5xMlW5nkEztMTDtrZFBRYVm8NdV9Z1trt7rZzZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCZVmgr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeesUhjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3U3gV403175
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdeI3XpwqfrNzutHdUcddj/4yu2W4O4G5Fu1PQyqbh8=; b=BCZVmgr5Jldh2lZq
	rfGFeJNn/ftx002CsRvP1ziuSNkbhtvSY7OTDpr2YSTfYkQQMk27n1RqdOB7B019
	xqEkfjAEgbEkOAhxcDNQqDCibfRfrcjaD/fRiOj37RZmVoo9QAsLjzbzVznvIAxF
	6Rv2mBOHndcvlXPQ0ppNSaZKYowjUIrNS7rVBKd2xk9xRvd0GNK77G5+sT8IdUXw
	sqbEGJj9GP8dsmqPEesEink5KqxA/gXrwYCe2xNpcpKUrseiWP4y2BjkAssFMw+i
	YvKGI5D7S7SOqpfVwt5BstFTEtEhE9rTZaMeTw9isOLbVyv3bsbgU/Sj8BZvibSS
	W/cqVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dtuqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c709551ec08so29857237a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823218; x=1774428018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdeI3XpwqfrNzutHdUcddj/4yu2W4O4G5Fu1PQyqbh8=;
        b=EeesUhjJcFyn1xLgZq/mUK7VYFhQYwkEHU9Otw11YDZLeUDaYaxGIJNSvqFCv/n35A
         DTxNIQ91VGt7r7icxl/Gsx5R6ci1nznd0Qh5lKggiLK54NHMfh2y5Ls6gwRFGdcV0c7K
         LqD0RfRcT/9AHf/LV3yId4H2lvbi6X5eWDNtSvNQPgq9beB5K9hB6U+hVt7Steaqr4WR
         WPTBUZ7mZT5LtUwIH8d2+YncdFF1kTumLstiRC4cziyZp9Le+xtRpHWOiibiDURUJncN
         u8nJkwJnuO23jq/kR0WMLJzNdQIaF00EmOOrhvfD/EdV1KQU5QM5pvnJlMsyLeBQbu6B
         zzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823218; x=1774428018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdeI3XpwqfrNzutHdUcddj/4yu2W4O4G5Fu1PQyqbh8=;
        b=aCiayDfz9XOWXNfFYRQ95Z7FGWowlqOt5yrUycohmX5iRNaGgZZTDYD95LO6/ndLBg
         tXefu3ilgKVHD2jxP6OGnj9Z73mCnK/xCAPByGrbvDH2Q+I1KgFb4KWMCaR2+NNrO1cb
         H+QxpOtxhvCEzC52qThj3ZABFu+ty4Nk+K91DD75tDLIeUyt0Mf8xxYA23ENbpdDBx+5
         KMvcCpPx+cSwnFtaZZZfH61ftUdrdymi4OY552CPR9zVLH79mw+G2hX5Wxy9zLeby8ox
         q0qrdBqOB28QXzATX33QboaJkckL7Inxv0wYH+hJ08ZPYWbjV/7tGyeVzTXmTpNOdDwH
         huVw==
X-Gm-Message-State: AOJu0YwTT7StZiwBknjL8mHkZFdnQkte0wUPoesxPuhrrJIB7nFjeGPV
	V3P9yeith/QFRhr9W94++CL7jSLK6puad+OeE1VzqqDl9y3hJQ0bUbnm6+80jqLxVjugX8BlGDp
	7BOzEeFCqqLXByifuxjW3JpLBmLvWfWdhvUaQlWriCRBKLAuEHy2QVtE0WKvbYzT3xj/0DI7IIS
	sy
X-Gm-Gg: ATEYQzxY5P5F8oOiKYWdrRoiVX6q7e2nMG+LAKLQchuFHC3pke5Gd56k40lkRPJPRlD
	qbk0ip99Fpb5wUFpTgLs4mSqv8s1bbjphEWEzvMUwsTg0W5RkpfgRMS85AGR8khtkhAEtZzYZPx
	szpvN4A85TZkoP675i+IJXCoUExwcVsFJOQ23ZVikuyym9rh+x3Aly6N09zZlEtQJBcsLhhtUB8
	Kh3Qy9iZEUeivKypWkTJ08gmcIjQmDrxigqszHvI7+E4Pcn+hmFmRlyZELvuVuCaCVGgedDyK4R
	p7oq8e+2Tq9oPRH+hUJ6Jv27xuDWOaxA1YdABrmvlWhF44WyOMNgxwPD1QsA1rHNRjj+Yv+vPbq
	vLnS2jDQ0zy1aoVbSYELCwpiA8maL2TeezpNXfDW6CJYUnYNmdaVdSHfv8yoL5tgbQxKX14Y+iH
	XiMEgKlqiDJlEyLjxwWKIWF0lrYCbnqGMB/vrtm07pNQ4BMh6tUhHSzPFA
X-Received: by 2002:a05:6a20:e687:b0:39b:8545:f0c with SMTP id adf61e73a8af0-39b99de9c3bmr2468661637.26.1773823217682;
        Wed, 18 Mar 2026 01:40:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:e687:b0:39b:8545:f0c with SMTP id adf61e73a8af0-39b99de9c3bmr2468637637.26.1773823217290;
        Wed, 18 Mar 2026 01:40:17 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:46 +0530
Subject: [PATCH v2 4/6] dt-bindings: firmware: qcom,scm: Document ipq5210
 SCM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-4-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=926;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gm6tDoWzjlGe4E5qZfKllZb9n636Raf72Fz9PM69fbE=;
 b=RRlXgQpcv7YVGSfbgDM4go8AH2F8+29JVWxmuAXvxGFoNF2ar3qMRMF2qppYl3vtGJzwuuG0H
 lfwR6l9DWc2C//NZQGb8sc8VMYcsJUH8bw52Ugv51P6vEny1RHn/9+w
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MyBTYWx0ZWRfX+RhBlipH8GD7
 J3ZQr4jCWTmjOkwoFLSX0x41F60zSKl1HvPP67cZ3lcjiHa2ZwP4zQswgAPw0kWUclckx6vUacf
 mdf/VktsEXZBY+u9HaNkNmFw48DpYlElAmZ92jAbmXjX4p5QWEBHYMNaRlLEcgnnaNLD8v8bNwT
 ZRKKhjrH6uOLQWt038yFP8cT1mSCTU2/2DbaB+ywIl7hrEK5ju1Oi2Q55b1crVeN3K1l63Sg9nz
 zBG1VAqU2PthnK2MT2REoq0Ad/nCdazikkD16tuenTJVz7gtvrj494Zc7v7YLkyW9nzogdZuyeu
 U2w0H+J9Yp2FRIE4xI5aPX33NUGG7eMIVh219KSFLH6FVRemk2ewKfCFhdgoJU2mZ9rGMQeuDQy
 Uk2FoJR1TKuiyFVZ9JiwUuPS1MZi6Vj979iMrfBKcvARJC32HEkowGWhol4pf4kMAtAPcvc+VP8
 Ngbm9QnZaSb8pPhiS7Q==
X-Proofpoint-GUID: PFnDuuqdpBSsNtF2rqYEg2hR1X5RsrO_
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba64f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ND75c01xaBhBG1K22twA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: PFnDuuqdpBSsNtF2rqYEg2hR1X5RsrO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98353-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62CE92B83C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the scm compatible for ipq5210 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index d66459f1d84e4d99c7f72415d08bfdaf1d701948..6d9b71a9b9b3fefd1951b963f34942243aa48ccb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,scm-glymur
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
+          - qcom,scm-ipq5210
           - qcom,scm-ipq5332
           - qcom,scm-ipq5424
           - qcom,scm-ipq6018

-- 
2.34.1


