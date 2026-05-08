Return-Path: <linux-arm-msm+bounces-106633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uApaM9i2/Wm4hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863A4F4D1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 448E530956BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C363CD8A7;
	Fri,  8 May 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBWIdeGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpWMU7sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB13CB2FD
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234849; cv=none; b=IW4fbrIuMLKFlhIS59+aKZnXROHm0MlpRw2iFvsq1nHnkXZyzFDl03+CbqLo2zrLEYtHUk2IKXiXc8FtIHf96/nQFX76GotOOOsZolcbx01rc72QeojKDSXMDDNqc7B+wObTVG9LO3hYUVPgLTgAbXTeN+aE2tVGQOJ5uJV2X5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234849; c=relaxed/simple;
	bh=K1PkF/HKL60jDLLEFswrhHL6DnKbR0KAodhPWW8cEn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+xA5RhjN6oe1Bk9irTE6Y7tLcBQtD3EjurwH0XSzBVF62Kpeu8kKOWITl1XpucExMnWM85UA5Uq2G0NpU1AFFce2xjAFSE3DXOs9huC3NlTn1Y7i+ON06/bASXLNmLuqItLhDrcOW+kZ3+BAZzql6XO6zpgjzcr3LIFFVkzrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBWIdeGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpWMU7sc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485UCmR2530922
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8KwI92gtzTb/NB6oii2xcUoz6aQYaPOKHI7qWqsg2o=; b=RBWIdeGd4IP+gTFk
	+fCpepqq5hwa9ebACMV4f8yGsWJSiFrYq+tOe4ovZPE7rsktZJGA4UNvL/+ik3lX
	38yC5RsGAIRH5nLTKbm+gFQGFnskcs6Gxl1pPn6uZFQ2QJmezXzcAumJFVSSCksx
	G4MaZkkJykI60ckqxwRvxqT9X4W5+ojCr8hgHffJhnnARRNBrd2Or00//cweDZju
	K1mt3SnIrOsWbNQfv2HezY3piM3frl4tfy5r1XBhd1kTNMQfBk2BNJbZemGX6zvh
	zpJ4Dth0PheVodYFti6FYmMFuWJfGfiAm4sktdueqwnj597WXggwAa8m3tguaKI2
	c1A0xg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9tv3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:07:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so1009680b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234840; x=1778839640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8KwI92gtzTb/NB6oii2xcUoz6aQYaPOKHI7qWqsg2o=;
        b=fpWMU7sc2cDmmvOuEI2R/Kx0g8Uyww7/MyM1Pf1Qe8zirlyhfNjyXwwGkwtyufaeLV
         AAnpWuRVEIVi3hRHRRYauXpKxVLV4Zr5fCOb++Eh2h2FPAznS8jgnebg0m6kXzRbuNdC
         jHjnlVym/XcwHR9LJt2oJqfKNNrNOA0fAF1qklfSkKFUdisq/WjXb0mwPxjPxN+cKAb1
         7+ce044Yp4onXqFDIAnNzSGR+ZH5zsyBhexFHSZDQd64eXS7OnzGntc+2pWBLS/r9PUQ
         NbaHT0+/5PKR0wfDCT/iWRKvDHcYr2WCRReEj93BycG22zEDbqj2u9NRDmNZwjArDIWZ
         28Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234840; x=1778839640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8KwI92gtzTb/NB6oii2xcUoz6aQYaPOKHI7qWqsg2o=;
        b=FOd2CqELHkURdzUv5VIF0d1m/4UGktgwoEh0Ic94IwT1o0Bkg77T6mOkpxPlRDkKjn
         AKHNfduPXXpioWz/I+Sc1kE3dmRJ83xmFZwvDFJz4DtKFYpuHtjin2W52ykQ+K6QGPkj
         0gnPOQk6vLEVmfY47i0ZGFvfxkFBTtUETkTO7NC+740M+fObAa/fwK2audI39G8qbEEg
         j2KB3xZLGUoscU35FEkTY5WH4uKeyjOWhz5ewu+9t4pQ9yGHagB7lnDGitjjuXoSnouK
         L0TGE8bbkIfCM4XdJAYZPxH4EG3Q6fynip86db1NBH2bqIgaluKn4ab17IFV+stGLYqN
         hcAA==
X-Forwarded-Encrypted: i=1; AFNElJ8sKv288ws4A5Dlvbv2GxRbQgffXkXe22qqg0+Mu/K0YsAznBWicakWA64s8FMwd7SEjhYwTeO8l+1vni/g@vger.kernel.org
X-Gm-Message-State: AOJu0YypUbGJYj+pXg76kc/Cy8BHvisMOQ7Znmt5pVUK1iTK9k1LVqPf
	OZe4djINr+mLd1QHLQs/xHr6VY9XSmCTnAmrjg+MOwJAQAdg56F9smAe0CLrRbg0I+oCotp7id7
	uYZyMp0Mj/n0GcsIhaloVCiz1P1vrz3KBTQUJEbYbqBKMtq9IkAz1c4DNv8IzUWGEidmD
X-Gm-Gg: AeBDietzLuQOfepKT92Dygjm7354M6UItmIqsBOH7k78KtTEhYdP6B4i96H9/MKWMM7
	VA5Lrn+1ItgH4fSJc45w2P/4ko48q+pmQ9rg/u63vhQjKzEP8StMI6oo235bxDxQGmMGtagFRKK
	bq7EWvFc68crKA0uazQ63DLdpXcncxUvia2XTDBamh09iaXV6ackh2zpXDC9DZN9lnUbyTsJj1d
	zbLXyJK26G8UzoQ9bhn/ryUpwIZKkyH4w4Q7CqXDrpVKZ7p3+Gvy/L6yCE0KCsZNC90LjCBiQPs
	7C2ES8g+A5iK9PTh5KmWwZwIOZWpu5auOniBs++guikt6kNXYb8X0TdY2HwsMvnt9Y4RTrlZbci
	rg70X732qHBkCfFBKJkQMoFiaEBz2rcEoZHjcwlWky5fBu19s9VPhwao=
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr10776938b3a.17.1778234839737;
        Fri, 08 May 2026 03:07:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:a93:b0:838:127d:a16e with SMTP id d2e1a72fcca58-83a5bec5483mr10776902b3a.17.1778234839178;
        Fri, 08 May 2026 03:07:19 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm15876379b3a.49.2026.05.08.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:07:18 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH v2 2/2] thermal: qcom: tsens: widen temperature limits to match hardware range
Date: Fri,  8 May 2026 15:37:00 +0530
Message-ID: <20260508100700.772985-3-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
References: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FVSnqUlmVWkHNZUvdBwvhQDK7BvjFA0T
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdb5d8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7FrdJh-Z1z6zKSyd9LYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNCBTYWx0ZWRfX2K7p3LUDRLwK
 8J4vJJUdKY9xqxUkfQweGnODn74gti7n+exkvcsBuovO8Qp6kjwoCKWB1UuNfGoUrUa4yTQyPw7
 wjrfnwLTDZCtzqUgZrTxB00XOGE4n2PUTsi2cs1rHbXEEkO2WAEQV1haPaCIOs8tOD85dGnts44
 8oLsflMmmOZymbz9JNucWPNS7cOvBlDJ8JqGWdDQ23VntOq2AKxvfuiZQkgGyeumAPbvJYCT1dj
 gTtzebA2p1chqpdJRPKVygkdOOdJIsRjf0m1DlkgLi43oh7qyKrw8M0VubpbxkVxbkO2mN1oFYi
 OXfjVn7lRxvjfqkBcpXhjhg/J1N8ZT4hj7hX1AuIVlpsktq7CMQJK75Qrft9ZhSbZdSPHgzvbog
 CSWvsrn4IyCXrKO5zCt+cKVUMpisu5lEEGCRRe0v7s8jYS+0brBf5oSxzKoKJb/V3TDLKb09kFX
 Qc+/hG5xXVX32Jz+Jgg==
X-Proofpoint-ORIG-GUID: FVSnqUlmVWkHNZUvdBwvhQDK7BvjFA0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080104
X-Rspamd-Queue-Id: 6863A4F4D1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106633-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The TSENS v2 software driver currently clamps trip_min_temp and
trip_max_temp to -40°C and 120°C respectively. However, the
TSENS v2 hardware temperature threshold registers support a wider
programmable range from -204°C to +204°C.

On newer chipsets using TSENS v2, devices may legitimately operate
beyond the existing software limits (for example, up to 130°C). When a
trip temperature is programmed outside the software clamped range, it is
constrained to 120°C on the upper end or -40°C on the lower end.
If the actual temperature continues to exceed this clamped limit, the
threshold is immediately violated again, which can result in a
continuous interrupt storm.

Expand the TSENS v2 software trip temperature limits to match the full
hardware supported range (-204°C to +204°C). This avoids repeated
threshold reprogramming and ensures correct trip handling on TSENS v2
based platforms.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index d39d3a2923a3..7e967d47aafe 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -54,8 +54,8 @@ static struct tsens_features tsens_v2_feat = {
 	.adc		= 0,
 	.srot_split	= 1,
 	.max_sensors	= 16,
-	.trip_min_temp	= -40000,
-	.trip_max_temp	= 120000,
+	.trip_min_temp	= -204000,
+	.trip_max_temp	= 204000,
 	.valid_bit = BIT(21),
 	.last_temp_resolution = 11,
 };
-- 
2.43.0


