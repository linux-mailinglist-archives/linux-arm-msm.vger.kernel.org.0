Return-Path: <linux-arm-msm+bounces-92322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ot/OojuiWn4EQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:26:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484B1103DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F82E303A120
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7856D37BE9E;
	Mon,  9 Feb 2026 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6ftyN/v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMNo+Ls8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1F37BE93
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647100; cv=none; b=N7v0dKuStGQT2sajWEpBAy9/ReBI/PDbT446LY/yVJaiIot6rv/6ul/EapLqjOO0aDVB02n1LikU20QZ0RJ6s9Sz3j1KoHTAx96FgB/iJstLOSSwMGq43R9TCoJ4+yqcCTywBjYhGqlKJcNJ6IZONV8xwGiTDiSHVYjZuqs03YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647100; c=relaxed/simple;
	bh=1b8CcQFTYWJ7MbaqtlEt0Tri+uyqg3WLJ/qexdn1e10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRXdK6NTqOKh4XiBFPbBmkShLSQTd4Yxckk/TsKr5pCIluHDw5OAEk56XrML00toK4OF+2btgpUP+NVCEA9tw+rdRTkA0m9X0ltP9znsrWgtjTOKedI03rQGFVNT2Lr+UzVeSxXPtg8fW+YL0462YsTjC8RGfENMyGKz4NTr5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6ftyN/v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMNo+Ls8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Akom93699972
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SOLPRuJeYBv
	6pjr7JqohPTaObN9oUAkHhm7CCKiVeAM=; b=W6ftyN/vcfx3inX9GU71dNmupEq
	fseUMSUX4DK7zDCweYHDxYpNKnnOmxN/PXRsX6efwR/PiYmqH6eq+1eVHAFsN55B
	QJq/i3jmgWQ7uWNzmSI9sc5zBHFipH+LAw/E65JNt3SstbRheUYbAq/lrQtLzckR
	otQgNeZvP/oAXG5QmTlCt5NGciEnloDrzNKqreBFK3TxQ2XSunot0qY/M5qRJ0BE
	Rg9IRWwBj8c69PuemWRH5C+MSYZpdFWaAMlaycBQSaPV6JI9Qnl7oC0tyWye/8SM
	uhSouvOhByYV7xbgUK0qEo2uW2KKM53fqzuOD9RgrdUINtFROHb4UMr0rkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m8p6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:24:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so802188285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770647099; x=1771251899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOLPRuJeYBv6pjr7JqohPTaObN9oUAkHhm7CCKiVeAM=;
        b=GMNo+Ls8oeYjvrj1omFcvT7fMgacoLod8g1H11XmQhZ/xlElPA0Nqkayh3HP42fdnH
         6KLm4RsZbe/Wt5IZ6NKu8aOWmKftarMw5dcKTNdczO5i/B+HUFZeYmMNw/tzs7OrcDnd
         wnWoUhogUxyYi+C0MC6BhbuDbcTzIOws76JW4Wnit1RMZhWX9Sv3nCdR7bzto2V77cUJ
         xhfG3SfWyGVIoW8U9tGg2sA1DFkLKiHqaO5kc6NtZZV7NqGWRyEDvXiu0n7f8PjM0S1r
         U0G5mFgyJq/FOQIDhU7CLrIuA1Mwq7u5A6aTBBV9BBVvAGVoEAvnOvMYyG1Q0dixot0W
         Mk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647099; x=1771251899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOLPRuJeYBv6pjr7JqohPTaObN9oUAkHhm7CCKiVeAM=;
        b=M/jRHTN3VQCtwSopbFIlSaM+Xm79HylBLx87W/Hsrk4CRqJ/NYZeIu+Du6s2B5tZBD
         cinumvuLF5s565ckWzr3hhnJ8KpRDnkyq6aMkIxQd6VuE+qV8tFtsNY8bRAMqaOlms2I
         LVWNQ7qGl3QjruB4rjEU0PEyoelCzTpj6qAs4De19ryKirjgQbknRjjVmaV2AbctPMLE
         78Pn3RMuE2yFBF0yj3cx5Yh2X4H0v2GUjvx1JIHTEQsARY7cxoHGfOZJ3Leu9uFhg/AE
         hVK4ZUousVcZfZnQu9laLAIUKMYrIBDiwJcxFD4Qv//vQxctB6GyJYEUVXxuoPWBkgdr
         NRzQ==
X-Gm-Message-State: AOJu0YzsZ13cy3hXGl5dyVy8NM2g5x69NP+ctovaZznQt93Hypi6oisa
	0Os+1Is9Pph9XvFDJKx4N3Rri4YRLE6FJTISFgGCrVRE1DFm7P0PV25t9A4PC22Q8VtfjNq9VuM
	kSUORqsp2j12GuLa49dNMN61WnGGjUXujOIVX5xrFsViUjMVExmMty5g+VfDYJYHmArmL
X-Gm-Gg: AZuq6aJr9U2iOlko3bvcK3tdKXwkHoLo/jLUZqXTenD+8qlUWgR8rGm4QmVPEVdyUH3
	Yif9s/gEg9mIswERiYFeik/i3Bw1UR0xr4WKilpVtSQ0FORW1wbTaEBawO3CI7xtFy+KZHKq3gd
	DyDf578OMCtDshZld6ckhj4XrWb4yO4DsaH/7lh1VIOLGR3BhZA4C3HqwWHtHilxr1LRpHx4+NL
	bm1UkzvB9FzSa/lBwx52LGTY9cq5fRfTHhljiK4XuDN4LlTP8XoX3ejq2+UIQ7ooNsLtjIFmDe7
	4ixNl/5bFtwO0PQndR1FmzoDxnI4fWvbvrzzLIwQYZe84XNrUk4CEndPxahJWm4JeUyfZo4XAzN
	Eqr32fVL+jySPO1UHlStsuTG7iU4+vnT8THXVn7v8zsc=
X-Received: by 2002:a05:620a:2846:b0:8c7:a39a:d51 with SMTP id af79cd13be357-8ca40b91540mr2034934485a.13.1770647098714;
        Mon, 09 Feb 2026 06:24:58 -0800 (PST)
X-Received: by 2002:a05:620a:2846:b0:8c7:a39a:d51 with SMTP id af79cd13be357-8ca40b91540mr2034930385a.13.1770647098283;
        Mon, 09 Feb 2026 06:24:58 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm28296634f8f.28.2026.02.09.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:24:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: defconfig: Enable Agatti audio drivers
Date: Mon,  9 Feb 2026 14:24:28 +0000
Message-ID: <20260209142428.214428-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k6bKjJgBtjHiwOHaL1cjIFOLHlXFuu4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfX0TpzrdDmMDDw
 QrUj4u8hOWjpEylM1I/z8b3c12QbokIWT0miHKppP/qW4DFIWGLWsT3O9YfHXboTBT7iUMxtsHr
 s5adqHx2dQtrZng/6cn/+Hm0c+pTmW9DpGNCJEs8JrW6C9eI56ipBUpM9+ZY2trc5MdR0lFU05b
 LRv8G0t5L+txfTrUWDYrfUmCvyOc51q7eRTY0mDaklyyi9Q+0UI5pOlzEZ3TeO3Bs9JHXg5Avkj
 sXmE7Bp97nioueO7wsT+hr+w3YHBiJHPJ0ojyFAJzyxaO6xy6u59Mg2/1Xuya/k+DMs5wA2tRba
 +e66l1y7qTQ2DGwneSV6xj/USUeVJ5m2UFxLUvW6n5Cx1d/6mxHT9w9Q4DC7DIXVbKYbOxDKPgC
 X36T+h+RFHTRcEpN0XKxfpAUPEyqt5yLou55P6x95MJpQVhoIvnQLghHlBObVvBZTWEZaS+1c7l
 GvsLEaQ01zkrKmOadjA==
X-Proofpoint-ORIG-GUID: k6bKjJgBtjHiwOHaL1cjIFOLHlXFuu4u
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=6989ee3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=rO3wVDe-YCVyVCuK1RsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92322-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8484B1103DD
X-Rspamd-Action: no action

Enable reset controller and pm4125 audio codec driver that are required
to enable audio support on Qualcomm Agatti SoC based platforms.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..6db35c1605a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1146,6 +1146,7 @@ CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
@@ -1550,6 +1551,7 @@ CONFIG_SM_GPUCC_8350=m
 CONFIG_SM_GPUCC_8450=m
 CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
+CONFIG_SM_LPASSCC_6115=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
-- 
2.47.3


