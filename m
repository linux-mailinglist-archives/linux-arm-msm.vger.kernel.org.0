Return-Path: <linux-arm-msm+bounces-116872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VTX1DFy3S2ptZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:10:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EF711C31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:10:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KZ16cK3i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zd4KHnku;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1627830A0D55
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB7731AAA3;
	Mon,  6 Jul 2026 13:53:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB99305682
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:53:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346006; cv=none; b=Ci0S2YZA3p0pQWaFt2PafLeFcCFWQqjzuu7JLoH5VlvlFn3Hs1JxW4cysXWM8qwBezzpxcNqjcJKCG3fXXTmEVKgLQorwg6MQdUUMEVzBhIT9Ay7lF9mGdnGFFfSVePccjwiwpwOl8QCd3dbkZKTknOLph/7wxqHu8b8iC1pfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346006; c=relaxed/simple;
	bh=3AjHvDgnnTcsszFhHhPfPjFQmzqnsj2J02PCxcOc6Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZhLB2uukwm3m17SO7/q43RsdbT6Eun00J3++BK8FyToExJCeoj0jOqMEAMsOfoa8lzigZmMyJi29ZwYbbixYK/R3rMYpDK8gEZKil/MFESJJOFTZfCqzybPPKrjSa4mUq/qlwvGQVy6lVSP/Y9s8H41vupqMOLrkD8IVrIzu24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ16cK3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zd4KHnku; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJlu361440
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NY/1ptN8ormR8uOFUxx1N1opjkl+PTSTOmsJSFl/rg=; b=KZ16cK3ilHN/bSpk
	Z4jB9kKYvs6MPHl3AmO2iHczlxE9Hf0+WJOAhd0C9mWxkig6yB3OMdQv0jgUFvSj
	QCp1k+xdQpqRdmvSULWwti/KqM0ejWEjfYNvdfTecjcgWOcn1InPmcdz+EweoRp6
	VRzNB+5gqfDm0pkMN/RCEyxi5oxkeBOEUG1yzkWidfY6OmVIYWhshuJxau0VONGU
	krUm1HAKfPKbwmtqICaJ+7xii1jQk1aAtxbSZnB2DwJLLtitU93p37kBp/QKdh+7
	dET0TeKCrBpt3Z9qhQkSg+BUZ3zePZ00svvEcQF6a1yUUjh3g3mgHs1NwEiVAHii
	Qqj9XA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51c2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:53:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be0693d194so1217314e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346003; x=1783950803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NY/1ptN8ormR8uOFUxx1N1opjkl+PTSTOmsJSFl/rg=;
        b=Zd4KHnku8gUMolNHc8xRiq7jgwmfoQ6uty5PAs/hYhajPtuxdF0T68iyL4Bo8CDZKN
         UO88TJSbucX0O6dxKDEC/vU6F5BCV3ZaZsLQyp++63kpFjJP+rHHW/sOyzZyxukOIbG8
         vqMwG8jwNs1s0wQtvNHPNdYilHTqWzMK/DeB+GZhRmi3ypQxOwdInYUcDIOi7z7GehkF
         3SDPfXDjTFG4xjMeaYhnRfjyN35T5N7yopjum9GG5PED8zoSmB7nXgME5+MtIVYg+PfA
         ucewHdFuvT+RRc2RDB+VQWsh4u9N4UBss44pNjG025zSWRKkq2d7CPpHIfyI+9TVNG+L
         LEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346003; x=1783950803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8NY/1ptN8ormR8uOFUxx1N1opjkl+PTSTOmsJSFl/rg=;
        b=gu0J40CEzu41gpW8Y0O89tJQFHJKfGX7zfC8jdW0Z/mP7aV+QkQ9B48+zNofx3mETL
         wLwV4OQDmM6PTaOkzAJlI+TR/AVxehSSS7Zn8m6FYvVnRoE6Y1ZaV/rC2jzIX6yLMIb9
         5M1LEjt2dJO3MiZRQ8btE2PB04/QCz49GiCdYF29aZy84A+5ovMZrrROYtO0HfDxWTQY
         19SgEuqUzobKSklA2h0tlnQqAC5UJgunhvsxIIqapVovwJOc6QqT1lk7MGpTMFjQrMqD
         cZ44Y+VMZPK2lWgxLQpPKreG6QqpQRmH/VwgnWQD8rgJk8Y1jL/Us6UDPRb3IHKBUnNN
         JohA==
X-Gm-Message-State: AOJu0Ywa7NocDNklxeM0XyMrC8sGygJF8RGtwerCZukpKyvdvQPuXiWO
	Qb/rd9XRit9/KunO1JpBjy7vbrc4CMosLC2E/zIevE3dRU7A74p2QOnVSyoH3xLyAeV//MOVlOZ
	GwOewSAo03C2/JNiMfe8GUNif++W2fI+SIpO2QTfNhCEsQ8nbWxzwgJW8JxrRA/tN1P6G
X-Gm-Gg: AfdE7cmrxo7BFbRWJqTu8ght4S8puGKyUTXp6hBFb+FJRKBe+xzYTDyh+/oGOw8/qOd
	0n471j+Za0QzZs3NzC0zrcGjm7T4FcxWlvoBi3s2U/O0p55Sx2CJDCMeYXgOhwjYlUt+SCMilqz
	62DR1BefGvLnFu2Z6rCuyS4RMTbZzssKoDv9Gf4hkRj18X7tyjA/QQ3s+KFGbgXNSZ0ggxuKAtP
	LjUmfqphMyzacAuzoTamo8GRSnEr0R/sFAoeTl6IwQZv6UmD2+IvRaq/XqWrNZXQagBQ4r4dwMV
	M515E0jubjMeQTONSvif8SG/Xk21K1UgZupZ5kjfML3VqsEq2Okrap2rMu7UXLTkVt3ZKwcm0at
	WC7ayoVZY7V58V6t2+mbEmNMsM+UHVIlavfL39PaB1rlwEsBLk1R3Qmy0Qmo1jS5we2S9Og7fEp
	FeZ8Zg8muey/wSkV3H01W0AXDu
X-Received: by 2002:a05:6122:8b11:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5be908cc9c1mr307562e0c.10.1783346002803;
        Mon, 06 Jul 2026 06:53:22 -0700 (PDT)
X-Received: by 2002:a05:6122:8b11:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5be908cc9c1mr307544e0c.10.1783346002331;
        Mon, 06 Jul 2026 06:53:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm2932551e87.16.2026.07.06.06.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:53:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 16:53:14 +0300
Subject: [PATCH v2 1/3] phy: qcom-qusb2: enable autoresume on Talos
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-qusb2-v2-1-8d9cd73b1db7@oss.qualcomm.com>
References: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
In-Reply-To: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3AjHvDgnnTcsszFhHhPfPjFQmzqnsj2J02PCxcOc6Jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqS7NNSwp15TqI/ve0b4Klmq4hywtFwwzd4G0N8
 c3NV3rvk9uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCakuzTQAKCRCLPIo+Aiko
 1fAuB/9ULsXW3j6y90PwaiJSN1E6m6IRWia2WVK65A3+Al7MY0NGP/Nh5bSPuloOjPaQbihil9b
 I7BfcCcKGkPtG54wzemp0jvPjQl0i/sGm2sbFxM2unJH6WNhFBLeNnqKe9zxRVECH+so5wMiY/c
 GMB9Fo7JU/8Oo0bmc17CnaJU1ZDdu/L/TSAlf4t72RLrDe11JPNYe+jjtSTMAr7KEae3a9FiVIx
 OW1oDUjjBrRT/LruRE2qz3i8m9mvu8jyF8YDmnT7rbfKdptqz6R62pBk3RFPqibjFCsoBlEg7hr
 541INcxZVAvf/if4rqjRsxAORj2J1YGF/vLVFJjtxWH+FdHS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Dsqu6yZwRnFTmUGBhJhud_AE1qmiRjSt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX5aXt/fg9UaaT
 5mE0cFus6c+yo+PYHfQbmmRMWlIuIbeDX5dH67UbC38fFPdAQkrcOVrmFl+Z9r+AMUJNRtynmo9
 iBhnpxzTNijY5D4IsaBtequdhltrkXc=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bb353 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=R7DzW9ZLaHkN4G92kvMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX5B1BdMotnwkG
 zCWtgRBUoFJ/XvSUdsvGkzNFme7h+pRM19woiF0JuZWnQtcuGGS6tRaEW3UxGO9LwWY4Df5xeZs
 R+7A1fRFVaSQ3lbADN80NebDbobLPL69gVALd/+YVL+9PbQ9GESNTEDH6psrZgF7ba2E3hRE2IV
 HWvMy9VpseEYGH1pfuyLl2L3G/QuBPlzuC3J7eifz0/gL9I20qNGkj0oFtfhukGjmd9dw4zAeYh
 iUpu7AzM7WxFXFvuiWPeZ0cXyoZRxgCGFKUiTSdq7TxmgyAxM9XFbBSZqZjeiQiOiwFg3HxWy7d
 hwhaY8WryzpkC+if0dKXQWcfSnGK0OUl2qVTRyp+LZ6G3O4q/J6HJgg5rI9jDZ/LEKCDh2VlfvW
 ea+sG9exVNfswvgzEs4pPsXhf/3j3Et3c9L6xXyuzLeRmJ9ElP5xrn9FLLJ/T5cyBCqCx/UHnRx
 gVzpgn12zFkgTHFiBqQ==
X-Proofpoint-ORIG-GUID: Dsqu6yZwRnFTmUGBhJhud_AE1qmiRjSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116872-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC8EF711C31

According to Krishna, having autoresume disabled on Talos is a c&p
error and it should be enabled.

Suggested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Fixes: 8adbf20e0502 ("phy: qcom-qusb2: Add support for QCS615")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..15c36b594c09 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -347,12 +347,11 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 static const struct qusb2_phy_cfg qcs615_phy_cfg = {
 	.tbl            = qcs615_init_tbl,
 	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
-	.regs           = ipq6018_regs_layout,
+	.regs           = msm8996_regs_layout,
 
 	.disable_ctrl   = (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
 	.mask_core_ready = PLL_LOCKED,
-	/* autoresume not used */
-	.autoresume_en   = BIT(0),
+	.autoresume_en   = BIT(3),
 };
 
 static const struct qusb2_phy_cfg qusb2_v2_phy_cfg = {

-- 
2.47.3


