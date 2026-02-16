Return-Path: <linux-arm-msm+bounces-92920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOl7Iuv5kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:05:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F8142A54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CAB1302FAAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803E52797AC;
	Mon, 16 Feb 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmxjZIKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIgrxJb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744842FE593
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239869; cv=none; b=d84nYPl6EIhGzoWB4YFC4BpWHnmuazDMSsi8hDOGIGsFI00nFHEHxGaPaR1fwXyg62jMLiRyjkm/KwLkBoW7pfgYnqBcY/0FqCrWMRgkVDkL7H/VGtxYMSRAqLRliUskX5fFIDEP6e1h8jvb4SPX8tA1d10L+KYMaSiwkRofTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239869; c=relaxed/simple;
	bh=PuKi//RWjSJoYL/Th2Gud7CekjaZAZonzL+Z2LBjfj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fz7bdBNYq4v0R2752+1D42QoJh8W5h/Ttmn+BIHmI6yMqKoX3e5WIcI+wVz0Wn2B6g/a+dKkQojfdjOi+bAOprnC2deEgh5Jkv6NNg8Au01Xdp/V5tILvwmCOAVgfJn4eTA9oH0x0sBnBSzNn6Uib5MwMwjDE4aSlIo/ylh67bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmxjZIKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIgrxJb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0UGEP2498419
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+4UOtGqik+Q
	vwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=; b=cmxjZIKmo5SdpDShUOOsFDSR6fr
	TUYz2J13IMDwq3zI7dsLgcYWmcmym3kTYr4CvzAIC4xXQd0zhlJG6h/YZeMJE0El
	DvkLNSf3I9TpEyL81oz/TdNtZh5q1nBOanEy1YZ+QCpueYkf42gv4s30q/Z14JNV
	/XKMVFgAwdSZwdhwARVG4UetRhbTYTeiJSzmSJFTodBEFGm9OSFaKoPtfT7PLyPM
	/+cA1o9zVKYr1SPObSwHcAIdj0kAW/fiCeb1iOagBeTvowndnviMyuUpmaFs3wnB
	vPR+HOY/9v9cTH+cBzGH27Y2YUOAmta7mzdXKYanzXpnFJcZpEDJnnFsUgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4buy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:04:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so1896926385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239866; x=1771844666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=;
        b=MIgrxJb1q+Xj/kYVxyfdL4TrlC/YE6yc7NP7/GMGIJSUbb6b1MFeHCIQU3I9eOH6+v
         lfpxUo4pRPTbussGwc3E3s+eREd89jSR1DqGWoKWn7D4E6uhB1v+cLC1v8WXNRVNFKWp
         xmYw5VlTIL9kwhxvy/040RmoP//w4rexlszA/0Kv2bcY9+ymCHdXcIBiz4MjF0cypFDZ
         oIjzsc3InV/r+N8FcbR7SuepHI0+gyVjeQLNoaH2YCZKYEWWz/bP8dEubVn7+WG3kA8n
         szPsY0hqXbDUXBndUH8oBxRFjHYzoxUPRaw8gPOmAb1i5o+Ra0u8SAQsCEtQj5GH+mxo
         XOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239866; x=1771844666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=;
        b=EH3C7xtKyLJgIcK2tbhuYA2gF6zslzQsAgRWbECZWxnBzxqJgIHo2oHC+FNoLbhrO9
         9jAGYpOwtMffBOjF9r9yftpKdJ1HpRKrN0/+HkhCdLNHWOwgdo4noti9KrJdD7vqRa5u
         wXNmxwsG5Qsb0f48ISgtwXaCW7KoJK/ROUTgBREMHXGs4GL49fkFfQRAZwiNaAnouNg8
         lRFGZnVaexsb+WBqABrSbJe7YQmn7Gp19k2XNVj/CJFyWLWydeRGlMNlzoKg5IUGADAV
         EAoni3sWnyN9c7BYzp2Cobf2qlVYutysQWXPC8jI6ncejSa2BHqSZUt36IF46VagSuXV
         /Fog==
X-Forwarded-Encrypted: i=1; AJvYcCWBiBxF5DtO4A+iG8ldk/j7Nb8CBf872UABzQjY96MUPoT9Xc0Us4xrNLezG3y9pb7yUdo5A1mzJ8Z8FpZp@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgXjc0VxCxVaDHI6phzbqkQe1OsTdl9yw6nyarJHHrrWJw+JN
	B1oUXmfLZiNoQRMnNRv5jF47Sk9uTwBMPun+kIj+PUIDtmGOlpXeQsIHkv70q6myyeJuucikzwE
	uvKiL6NLH7vV2x/Lj1wsAbxl1+I4Zsy25+LpkPaACggILcLxrSDvJxSOEV31f9txBWKIu
X-Gm-Gg: AZuq6aKmVVKZqgjw+85G5QP9/gicERU1C46Gw0iQMGLpU7FYgK0aO4SBVK2jdrtqsyM
	epsSptjyT98NGUwGhLOU5q7rb+8AJ5lVYHbpQEyPEs3K71Y4EH8rGxHr5bHFrG82Q0sZ6lHdMS6
	xwyqdeXkenXWYASkr6XgvU4K47vmw/90XXIPE1gkewGiVK9YTAvfGrtg+BvZ8hRDbjJCVHIJrf7
	0d6i+b2BlCWzsgvUtZOzYmSxqRsMzEG1zK4tjI89Qodeaxc+wCi9M216aMClFNIs74W0SemmuYQ
	yr2cads+MtN/1lvpSaFLiRl3+QQU2/4z5GIC9LTnLNPYrPs5QJhc4mxfOATs9EEhYlCsaPl7YpP
	Ih/257VEKZfhS7a93APq4RRfw/4EM1gGVg/G/Ng==
X-Received: by 2002:a05:620a:46a8:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cb4ac7d40bmr980230085a.29.1771239865778;
        Mon, 16 Feb 2026 03:04:25 -0800 (PST)
X-Received: by 2002:a05:620a:46a8:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cb4ac7d40bmr980227885a.29.1771239865393;
        Mon, 16 Feb 2026 03:04:25 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL pointer
Date: Mon, 16 Feb 2026 12:04:16 +0100
Message-ID: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PuKi//RWjSJoYL/Th2Gud7CekjaZAZonzL+Z2LBjfj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmvJCfKJ0aoPYfKrLswzpxol6BGDAX4YsmZO
 Bl4p9IrvUyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rwAKCRDBN2bmhouD
 15cAEACRnZMiu1htoX9cxB1Vwj+aBvwUSP7uhENSAuxz8GHr6mSXXOdQgpL68JJbK6ezXC2Bw3Q
 eNAW2+4p4Hb8KznZpMYdQMLp9ojUjnYWOiPwGhn4aY9Ql+a5pgyy829zOmRFLRmvzgZGVpV/85s
 RpKdcLEPNMQqJKWtxG60h2QehNJ/G98WeKyYv6wLxdLiDtPOzLIkGcMzGHzZq2Mo0vDGY7zLfvq
 NLM36XwkuC72+xoSD+ZXu2ThHwNlQPnd0Y2LgQxeVJjQifxGpWl57sjCjDJELia4kONzGcD12Un
 0kOGlJ+M2IBJud1IZsh8tvXCbrW5xgUSw4TaUtcoh2aQEuZvYngOp1zz9scq7neibqfkjB9v6dq
 4AHVDf+JMyxSu8M82ni+fqzZhe/sfQFxHgeVDU2bmRq+mGG0gjUDbTHJLopusUvR+D+MzZBS0yr
 rmgRl2wv5GmV2+rI/c9Uy5PCC2Ru+3ulCJlgUXP1n3potgdWQaq4lDJpsdH+BXbRAX6hN1rROwq
 ZBewIiYOb5xvlrCU1fxeNxus8gtpAGFQK5fS+686iQFzKeccogPVZql9U6nDmvMpP3FMwY3PSlD
 vbdyXChRug25nxLQLErXNk0wwmsFJd2Tn/Myi3k39XKAXm5ylBjNQR3YhFP2AAZJoLD3ikvaX1F vpaEdpXC8IZvJGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7DxGt5CRy9ymRzRMpoyEyNivMYMDohZV
X-Proofpoint-ORIG-GUID: 7DxGt5CRy9ymRzRMpoyEyNivMYMDohZV
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992f9ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=RGc8Xe-UuCxs7xLLDosA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfXxE7VyrZ4htgK
 8oMNxVjJVaahfyYeXCr9gbzzHn/RoYTNBAFpQtqCxZYSd0JfJSXUQ8LLJI+WpNfBk51kk53XatC
 3sq5khjfzZ4istBDqDcIP9fuGiVcGGZ2MBDAgR9xbPgXoGhXBS9bRjnq7WG8Xi+y/DLH0uMWf9U
 gKuNGl8UoBmft0lWeFcH1Dw8wSU/ibRABtjzoX3KqU2km1ieQPPLQb0vws3U4OhVSWwZf66cN7U
 GsuiNPJPsbP/AJkHw2160g//0x3uECWjrzyw+EEwBNgj/Al5VWbE1V/YWzxMle0XEVE4ml6YX5I
 Avc5TB/hYPZa/RjKx9yTwK5RSXr0sAm6GYsyHC5RxYgT9gmne+0U/2qHIQ52P8AqBXZ46g6oDlP
 gsgehiEuy5qrUEQrg1I64uJHq7Or0YfflyuaM2Z/sYc/a2I9hpnsfgozRPuqpfs5LwM48oq5Id/
 Zu0y9UAbCM/gT/o10Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-92920-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E19F8142A54
X-Rspamd-Action: no action

Pointers should not use explicit '0' comparison, so just use standard
evaluation as non-NULL:

  phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 14feb77789b3..c342479a3798 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1679,7 +1679,7 @@ static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np
 	if (ret)
 		return ret;
 
-	if (qmp->dp_serdes != 0) {
+	if (qmp->dp_serdes) {
 		ret = phy_dp_clks_register(qmp, np);
 		if (ret)
 			return ret;
@@ -1833,7 +1833,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	if (offs->dp_serdes != 0) {
+	if (offs->dp_serdes) {
 		qmp->dp_serdes = base + offs->dp_serdes;
 		qmp->dp_tx = base + offs->dp_txa;
 		qmp->dp_tx2 = base + offs->dp_txb;
@@ -1982,7 +1982,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
-	if (qmp->dp_serdes != 0) {
+	if (qmp->dp_serdes) {
 		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
 		if (IS_ERR(qmp->dp_phy)) {
 			ret = PTR_ERR(qmp->dp_phy);
-- 
2.51.0


