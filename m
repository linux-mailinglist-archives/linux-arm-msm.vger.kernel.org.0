Return-Path: <linux-arm-msm+bounces-116557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gPwSB2aMSmpvEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CD70AA1C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 18:55:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aMD8x/LR";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XCFEwleC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F2EF301CC21
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BCD2F8EA6;
	Sun,  5 Jul 2026 16:54:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1A2FC01B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 16:54:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783270478; cv=none; b=beOzqQEWoUBo/+EaTQ4y8V6omTYF8J8NxNkp/MigDEJxEJJD3cqtxzNVc7uUJJSB7jcDrSK+zCuwHEp9PzJGtb6uLeyJp8r3heDqbna0/uZjK7udALxGbK8lZwBFyPYyu9KqjD9T94OfD4nq4PV72RJ5gx80tpN94+prbdhEiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783270478; c=relaxed/simple;
	bh=UYvGAb0u4v30Vliqcf4F8nfrQZaRCB3qVe+U2dsK9uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPjRm5aFmfpUt8gJx/e7thaIAzgFCCadrlT8nakXi+li62HhMfvaPn/A2Yaaa5Zz8Yw7DlpPt0WAszcdHXw9Nfv0iJD2A0+Y6Z+vQpNAj6K9k5VgHdZGtiXiWEgDw/akmwRtkuXu/epCPlTMLxqdTV0pQQQoftPAb0Nv+gjqpI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMD8x/LR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCFEwleC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665DkhgR1858230
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 16:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jl7dA/Rg6hz2QXoECMAQ0xAg2sbs8C1Kx9SFbTtuz/I=; b=aMD8x/LRhnIWG/gJ
	MFq9Aw9stVnfMuJORVGjok0MBrxMO9yjBFIq7Piln6EZKqkZ7ECW42aJGHI8hA/V
	8HUVZ9dTAmTfw53NzBCWuNy83Ez1BAyyj98iA2XqPJ3PGGDVVYc1pX1j9RlVIAcD
	NIO2H2v8nbyO2adPMbN9USvP6xj7d0a8wG2keKHevT7cMH/lJmDjlGUNGPTqIw7h
	d0GUob3r3ion7liAp88Y+MHCAMHEhQm0o+zjSlJSbXtC/g3IWeBNijKpIuGkU/T/
	9+u8j00XT30/3EAOscIBhdslGUo7Ia36GMDaI/CdvmvOe10kIIBR0uqlULBTqFka
	e24Jqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3b1tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 16:54:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1199456a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 09:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783270474; x=1783875274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jl7dA/Rg6hz2QXoECMAQ0xAg2sbs8C1Kx9SFbTtuz/I=;
        b=XCFEwleCjJoqDXE4VKmQvTXwI2VJf8RByVLsledFrxK/e1blhn4JLrDVvGRTGO2H4I
         c6cx4EqBKnQyRsv8C3Kbt/6y3wCIxSy3fuWv4gyOwfrjd0m2E692as7k/vhXwDPBZWOf
         pRu0n2efL0URvYh0s40OeX0hWvkc4aXXbJTV6wouLzkSNeGJS7z+qnN70wPhfcGQvHbD
         IsVuCWzVQpiBhR/ubhpQ/CRF7sEPDgQ3LNpQLJzAA7iwyn/XFiBWY8GT2xH377GY+iTi
         IxydsFBGhKzeKRY95T1t4uRm98AhHZ2tUE5vBhc2e0Ae3F8Xg1DWR28S2GZ2VL7mT7UO
         LaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783270474; x=1783875274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jl7dA/Rg6hz2QXoECMAQ0xAg2sbs8C1Kx9SFbTtuz/I=;
        b=sSVy1wMFVLXgN0zdsOpv0LtRO4l8gyNTSbhg/OHSGOWqUndMwATef8rmQOWBxa/Lb6
         IfcCvBDbjlDP+sK+/fLteOI50Yq2qgmb8lRk5bH4lXqy+LhLI+QDMkBH4T6Rk+JoiAtH
         MFAOU5RtQ1w3RDdVnnWxFClvLiNT92eWB454p4oO1yItASCfdgwzQcGHE2FNBuepgTlI
         bri/PRoRY9NxHXpsbM09N8eRN1RibAL69QNQgqAnUJ68nNb+9TQTnLKvMdnboAImwazD
         +lyaFeqb45Z3cr6Jh+MD2nOsttqvxxR+NcHR45FYylaBBiJG8V58HAjEddUGjeWrond/
         nVhg==
X-Gm-Message-State: AOJu0YxOhewl5h6q2fdY+7AXcuyBxUJ17W2kW6esCRq8DiffVFV1aOxG
	nIQ+6E//Crd8PFlB6cbI+vuTklXC0kXRpuaVBlYXiPZGCJirgiGd4XXrLy5vHDdeb9RVIeIhxqi
	0ylBno1hfTSWoTKTvVKAXRmobjPU+Cufh3twAv3SGI8AwbpMEUimkefRBIm3gNf6lc/Ja1Hnt3O
	uQ
X-Gm-Gg: AfdE7ck/igOrAoMLKwog4L49Hgec3noonkGb7hCUS15pq5JFtZJLRy7F/15OXdiSvWK
	rtKG7cntnKCG8IjKU26cJYnYgQ4NQBufk0P2Bc4gi010t62LZlmoOvL9bZFB1OkWwykuxXv19v2
	Eaf9p+aiPWKLqLqHoHtfr//bjGvyJNw3W8r1b2E3ECAJL0XGTOhulcNkE3bXJ0lIC9XvfbbR4Gc
	iGRuYdbmmoiQBQHnFO6REiYR1DSLhYyjyPWKWDd/HHgg0jqbsIhkG9BMO3fUS617lHU4RHuoR4E
	Y4e3kGwY5eoR30wS1KrdAGceTigRQFcFlXC+5tbMK09q+iD95X5DDLIo4Q2dGxWdO8DkKNOn8A3
	TvYgS2W9dKhjMU9iRphVheYMD+w6Gyg==
X-Received: by 2002:a05:6a21:e58b:b0:3bf:9fc0:f6be with SMTP id adf61e73a8af0-3c03e3ed5f1mr6892103637.31.1783270472660;
        Sun, 05 Jul 2026 09:54:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:e58b:b0:3bf:9fc0:f6be with SMTP id adf61e73a8af0-3c03e3ed5f1mr6892085637.31.1783270472000;
        Sun, 05 Jul 2026 09:54:32 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm38253593eec.12.2026.07.05.09.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:54:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 22:23:35 +0530
Subject: [PATCH v3 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
In-Reply-To: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783270447; l=15041;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=UYvGAb0u4v30Vliqcf4F8nfrQZaRCB3qVe+U2dsK9uw=;
 b=/e03k+v3ORqRdIrVlWn6ZXzqyi4JALy6qyVHGcSUjXMyMsg39RbYhIN3KNz4WwDdFgQiDbB08
 63Vwf7osDg/DEt+4znAKNMOOyoCAb590INLE3fPS0XruXojN3s3T6z3
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4MCBTYWx0ZWRfX6XfnMrfwrCNN
 Nig+TgBtbnan06JlZdIeBN636RXJKbQEJtRRI+QBzoqCHqCA2ePKV21gjnF1auSVmqezx3tAnsh
 UUa2dzPgMA5d23W/ny7OezQCefO4Wvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4MCBTYWx0ZWRfXw9lRylZCzJtZ
 0dq4WEc/2zsQ1xZA+GU23WePd/T16F5cwD0iCoaHdORHjstZJGh0NEiNwBmfzw1cGs8zLumsIJI
 LyKkNr4mGjiyVWa6Zzka7k6j1ihAkjNoYZ/VOBccTm1a0tFFN5T0ViAp1cYL3zCc+d9Mfywm9sM
 6igHR1LNqs3Hp+J7C4SdiVPJj06/aRl8e8JnYxHWo52ZH37/qXetStIRJgNesVE197hyXCelfeX
 0+vyFgU9B8gf7CJgrjkPM6LPWhgc2n+363rvNzW+po5TcD9BFwB2Hp2emhYVRkNTcS7dt6tgJcQ
 4Se5p42tK/G0nF735+y9v97A6diOsLIgB8Wc04lV4fzKmAIibJEpX10wt0SES8KPc1gJaousi8Y
 Cq+tNjVfQ6jt1sxWqcmc1lycTpmUo1B48mljKJvdvc+TPgeHLzzT3cyMnKMehy6X8zmV4dOQxVt
 yVGSNxdJfY1zDe0z5YA==
X-Proofpoint-GUID: vTNlmJXGWVa7GWClAQo3oaCz2DZzmwY-
X-Proofpoint-ORIG-GUID: vTNlmJXGWVa7GWClAQo3oaCz2DZzmwY-
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a8c4a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YHkA5PA7XmDVxWZIdzsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050180
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
	TAGGED_FROM(0.00)[bounces-116557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:jishnu.prakash@oss.qualcomm.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B88CD70AA1C

Add support for ADC_TM part of PMIC5 Gen3.

This is an auxiliary driver under the Gen3 ADC driver, which implements the
threshold setting and interrupt generating functionalities of QCOM ADC_TM
drivers, used to support thermal trip points.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/thermal/qcom/Kconfig                  |   9 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 425 ++++++++++++++++++++++++++
 3 files changed, 435 insertions(+)

diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
index a6bb01082ec6..1acb11e4ac80 100644
--- a/drivers/thermal/qcom/Kconfig
+++ b/drivers/thermal/qcom/Kconfig
@@ -21,6 +21,15 @@ config QCOM_SPMI_ADC_TM5
 	  Thermal client sets threshold temperature for both warm and cool and
 	  gets updated when a threshold is reached.
 
+config QCOM_SPMI_ADC_TM5_GEN3
+	tristate "Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen3"
+	depends on QCOM_SPMI_ADC5_GEN3
+	help
+	  This enables the auxiliary thermal driver for the ADC5 Gen3 thermal
+	  monitoring device. It shows up as a thermal zone with multiple trip points.
+	  Thermal client sets threshold temperature for both warm and cool and
+	  gets updated when a threshold is reached.
+
 config QCOM_SPMI_TEMP_ALARM
 	tristate "Qualcomm SPMI PMIC Temperature Alarm"
 	depends on OF && SPMI && IIO
diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
index 0fa2512042e7..828d9e7bc797 100644
--- a/drivers/thermal/qcom/Makefile
+++ b/drivers/thermal/qcom/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)	+= qcom_tsens.o
 qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
 				   tsens-8960.o
 obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
+obj-$(CONFIG_QCOM_SPMI_ADC_TM5_GEN3)	+= qcom-spmi-adc-tm5-gen3.o
 obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
 obj-$(CONFIG_QCOM_LMH)		+= lmh.o
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
new file mode 100644
index 000000000000..5a82c4d8a37e
--- /dev/null
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device/devres.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/iio/adc/qcom-adc5-gen3-common.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/thermal.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "../thermal_hwmon.h"
+
+#define ADC_TM5_GEN3_CONFIG_REGS 12
+
+struct device;
+struct adc_tm5_gen3_chip;
+
+/**
+ * struct adc_tm5_gen3_channel_props - ADC_TM channel structure
+ * @common_props: structure with common  ADC channel properties.
+ * @chip: ADC TM device.
+ * @tzd: pointer to thermal device corresponding to TM channel.
+ * @sdam_index: SDAM on which this TM channel lies.
+ * @timer: time period of recurring TM measurement.
+ * @tm_chan_index: TM channel number used.
+ * @high_thr_en: TM high threshold crossing detection enabled.
+ * @low_thr_en: TM low threshold crossing detection enabled.
+ */
+struct adc_tm5_gen3_channel_props {
+	struct adc5_channel_common_prop common_props;
+	struct adc_tm5_gen3_chip *chip;
+	struct thermal_zone_device *tzd;
+	unsigned int sdam_index;
+	unsigned int timer;
+	unsigned int tm_chan_index;
+	bool high_thr_en;
+	bool low_thr_en;
+};
+
+/**
+ * struct adc_tm5_gen3_chip - ADC Thermal Monitoring device structure
+ * @dev_data: Top-level ADC device data.
+ * @chan_props: Array of ADC_TM channel structures.
+ * @dev: SPMI ADC5 Gen3 device.
+ * @nchannels: number of TM channels allocated
+ */
+struct adc_tm5_gen3_chip {
+	struct adc5_device_data *dev_data;
+	struct adc_tm5_gen3_channel_props *chan_props;
+	struct device *dev;
+	unsigned int nchannels;
+};
+
+DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *, adc5_gen3_mutex_lock(_T->dev),
+	     adc5_gen3_mutex_unlock(_T->dev))
+
+static int get_sdam_from_irq(struct adc_tm5_gen3_chip *adc_tm5, int irq)
+{
+	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
+		if (adc_tm5->dev_data->base[i].irq == irq)
+			return i;
+	}
+	return -ENOENT;
+}
+
+static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
+	int ret, sdam_num;
+	u8 tm_status[2];
+	u8 status, val;
+
+	sdam_num = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_num < 0)
+		return IRQ_NONE;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
+			     &status, sizeof(status));
+	if (ret)
+		return IRQ_NONE;
+
+	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
+		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
+		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
+				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
+		return IRQ_HANDLED;
+	}
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
+			     tm_status, sizeof(tm_status));
+	if (ret)
+		return IRQ_NONE;
+
+	if (tm_status[0] || tm_status[1])
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_NONE;
+}
+
+static int adc5_gen3_tm_status_check(struct adc_tm5_gen3_chip *adc_tm5,
+				     int sdam_index, u8 tm_status[at_least 2])
+{
+	int ret;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
+			     tm_status, 2);
+	if (ret)
+		return ret;
+
+	return adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS_CLR,
+				     tm_status, 2);
+}
+
+static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
+	u8 tm_status[2] = { };
+	int sdam_index;
+
+	sdam_index = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_index < 0)
+		return IRQ_NONE;
+
+	scoped_guard(adc5_gen3, adc_tm5) {
+		int ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
+						    tm_status);
+		if (ret)
+			return IRQ_NONE;
+	}
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
+		int offset = chan_prop->tm_chan_index;
+		bool upper_set, lower_set;
+
+		if (chan_prop->sdam_index != sdam_index)
+			continue;
+
+		upper_set = ((tm_status[0] & BIT(offset)) && chan_prop->high_thr_en);
+		lower_set = ((tm_status[1] & BIT(offset)) && chan_prop->low_thr_en);
+
+		if (!(upper_set || lower_set))
+			continue;
+
+		thermal_zone_device_update(chan_prop->tzd, THERMAL_TRIP_VIOLATED);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int adc_tm5_gen3_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
+	struct adc_tm5_gen3_chip *adc_tm5;
+
+	if (!prop || !prop->chip)
+		return -EINVAL;
+
+	adc_tm5 = prop->chip;
+
+	return adc5_gen3_get_scaled_reading(adc_tm5->dev, &prop->common_props, temp);
+}
+
+static int adc_tm5_gen3_disable_channel(struct adc_tm5_gen3_channel_props *prop)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
+	int ret;
+	u8 val;
+
+	prop->high_thr_en = false;
+	prop->low_thr_en = false;
+
+	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
+	if (ret)
+		return ret;
+
+	val = BIT(prop->tm_chan_index);
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TM_HIGH_STS_CLR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TM_LOW_STS_CLR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	val = MEAS_INT_DISABLE;
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TIMER_SEL, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	/* To indicate there is an actual conversion request */
+	val = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_PERPH_CH, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	val = ADC5_GEN3_CONV_REQ_REQ;
+	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			       ADC5_GEN3_CONV_REQ, &val, sizeof(val));
+}
+
+static int adc_tm5_gen3_configure(struct adc_tm5_gen3_channel_props *prop,
+				  int low_temp, int high_temp)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
+	u8 buf[ADC_TM5_GEN3_CONFIG_REGS];
+	u8 conv_req;
+	u16 adc_code;
+	int ret;
+
+	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
+	if (ret < 0)
+		return ret;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, prop->sdam_index,
+			     ADC5_GEN3_SID, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	/* Write SID */
+	buf[0] = FIELD_PREP(ADC5_GEN3_SID_MASK, prop->common_props.sid);
+
+	/* Select TM channel and indicate there is an actual conversion request */
+	buf[1] = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
+
+	buf[2] = prop->timer;
+
+	/* Digital param selection */
+	adc5_gen3_update_dig_param(&prop->common_props, &buf[3]);
+
+	/* Update fast average sample value */
+	buf[4] = FIELD_PREP(ADC5_GEN3_FAST_AVG_CTL_SAMPLES_MASK,
+			    prop->common_props.avg_samples) | ADC5_GEN3_FAST_AVG_CTL_EN;
+
+	/* Select ADC channel */
+	buf[5] = prop->common_props.channel;
+
+	/* Select HW settle delay for channel */
+	buf[6] = FIELD_PREP(ADC5_GEN3_HW_SETTLE_DELAY_MASK,
+			    prop->common_props.hw_settle_time_us);
+
+	/* High temperature corresponds to low voltage threshold */
+	prop->low_thr_en = (high_temp != INT_MAX);
+	if (prop->low_thr_en) {
+		adc_code = qcom_adc_tm5_gen2_temp_res_scale(high_temp);
+		put_unaligned_le16(adc_code, &buf[8]);
+	}
+
+	/* Low temperature corresponds to high voltage threshold */
+	prop->high_thr_en = (low_temp != -INT_MAX);
+	if (prop->high_thr_en) {
+		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
+		put_unaligned_le16(adc_code, &buf[10]);
+	}
+
+	buf[7] = 0;
+	if (prop->high_thr_en)
+		buf[7] |= ADC5_GEN3_HIGH_THR_INT_EN;
+	if (prop->low_thr_en)
+		buf[7] |= ADC5_GEN3_LOW_THR_INT_EN;
+
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index, ADC5_GEN3_SID,
+			      buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	conv_req = ADC5_GEN3_CONV_REQ_REQ;
+	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			       ADC5_GEN3_CONV_REQ, &conv_req, sizeof(conv_req));
+}
+
+static int adc_tm5_gen3_set_trip_temp(struct thermal_zone_device *tz,
+				      int low_temp, int high_temp)
+{
+	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
+	struct adc_tm5_gen3_chip *adc_tm5;
+
+	if (!prop || !prop->chip)
+		return -EINVAL;
+
+	adc_tm5 = prop->chip;
+
+	dev_dbg(adc_tm5->dev, "channel:%s, low_temp(mdegC):%d, high_temp(mdegC):%d\n",
+		prop->common_props.label, low_temp, high_temp);
+
+	guard(adc5_gen3)(adc_tm5);
+
+	return adc_tm5_gen3_configure(prop, low_temp, high_temp);
+}
+
+static const struct thermal_zone_device_ops adc_tm_ops = {
+	.get_temp = adc_tm5_gen3_get_temp,
+	.set_trips = adc_tm5_gen3_set_trip_temp,
+};
+
+static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
+{
+	struct thermal_zone_device *tzd;
+	unsigned int channel;
+	int ret;
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		channel = ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
+		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
+						    &adc_tm5->chan_props[i],
+						    &adc_tm_ops);
+		if (IS_ERR(tzd)) {
+			if (PTR_ERR(tzd) == -ENODEV) {
+				dev_info(adc_tm5->dev,
+					 "thermal sensor on channel %d is not used\n",
+					 channel);
+				continue;
+			}
+			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
+					     "Error registering TZ zone:%ld for channel:%d\n",
+					     PTR_ERR(tzd), channel);
+		}
+		adc_tm5->chan_props[i].tzd = tzd;
+		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void adc5_gen3_disable(void *data)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = data;
+
+	guard(adc5_gen3)(adc_tm5);
+	/* Disable all available TM channels */
+	for (int i = 0; i < adc_tm5->nchannels; i++)
+		adc_tm5_gen3_disable_channel(&adc_tm5->chan_props[i]);
+}
+
+static int adc_tm5_probe(struct auxiliary_device *aux_dev,
+			 const struct auxiliary_device_id *id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5;
+	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
+	struct device *dev = &aux_dev->dev;
+	u32 irq_flags;
+	int ret;
+
+	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
+	if (!adc_tm5)
+		return -ENOMEM;
+
+	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper, aux_dev);
+
+	adc_tm5->dev = dev;
+	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
+	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
+	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
+					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
+	if (!adc_tm5->chan_props)
+		return -ENOMEM;
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
+		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
+		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
+		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
+		adc_tm5->chan_props[i].chip = adc_tm5;
+	}
+
+	/* This is to disable all ADC_TM channels in case of probe failure. */
+	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
+	if (ret)
+		return ret;
+
+	ret = adc_tm5_register_tzd(adc_tm5);
+	if (ret)
+		return ret;
+
+	/*
+	 * First SDAM's interrupt is shared between main ADC driver
+	 * and auxiliary TM driver, so its flags must include
+	 * IRQF_SHARED. This is not needed for other SDAMs as they
+	 * will be used only for TM functionality.
+	 */
+	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
+	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
+		ret = devm_request_threaded_irq(dev,
+						adc_tm5->dev_data->base[i].irq,
+						adctm5_gen3_isr, adctm5_gen3_isr_thread,
+						irq_flags, adc_tm5->dev_data->base[i].irq_name,
+						adc_tm5);
+		if (ret < 0)
+			return ret;
+		irq_flags = IRQF_ONESHOT;
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
+	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, adctm5_auxiliary_id_table);
+
+static struct auxiliary_driver adctm5gen3_auxiliary_driver = {
+	.id_table = adctm5_auxiliary_id_table,
+	.probe = adc_tm5_probe,
+};
+module_auxiliary_driver(adctm5gen3_auxiliary_driver);
+
+MODULE_DESCRIPTION("SPMI PMIC Thermal Monitor ADC driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("QCOM_SPMI_ADC5_GEN3");

-- 
2.43.0


