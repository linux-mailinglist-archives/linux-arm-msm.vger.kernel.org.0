Return-Path: <linux-arm-msm+bounces-98355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHVGOlhlummHWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:42:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C462B83DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D520303B834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E76238B7A9;
	Wed, 18 Mar 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8N+i14x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aC+jwNJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96EC385519
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823232; cv=none; b=QAEBSH6smV1HlZ64QbjnT43jbfeqa+RWaftAsJNmHiwdBI73btYd4wHG4nLYd9AinwLbpcg+jaHjpdrXcILqJBw7by6kiajWnwWEIOLMic/WbhpsFAz29KwNlslJ92oTSypISqF3BoCPdgplYp3pHF/J8wz8cYKJUZirRN9ds2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823232; c=relaxed/simple;
	bh=dy2TgZcFr9/VB3bkmaus0Cw/gHd5PPq/I0Ed7LWpshY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRtSFh4W97iU2u9gyfJqrK/HB4kAmmgQEgw6L05DiHHT7+Ukc/DogsmdlhjttZirrVulWUEwjtCDQVKyhWw5/2R5dIkIjWzGLcCuO8rQOA/wc0UT+y3wiH+JBXy/vghLPIXQhRJNE2IZ5kUeScYb82VPGjvzcQBoiI+a/wxzuTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8N+i14x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aC+jwNJs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3kWM93281171
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyAv/fUqxS1bjhIsyOH9MFeZHeI00unuuOW8vGV845I=; b=J8N+i14x+44hohYW
	keV7et/QjarduXc5TfZsM2CERCjRPGwTkDcoi7GKWkY2pbzkVulklifoHG/kYyrX
	nkOej6koPxwZj2HeVvNcc8PInJOSuy8opM8R2JXk4aiadTU8v5YdWEGh9nhkYaRT
	yiuzQdCPu2OPc3Ht4P/eimhQHI2sJA6gMaTi+GIugqrkzM4ybRNyHO3VneLDmqol
	+6VKitcRcOjG+N+tIInExX0CmK3m/j7HP4BRFKxCOaFtg7VE32wqpuAOMM3NEySk
	myuM0p4ONTx5QunPvRUYyH2euaC/2FNVmj8XPpM+V4XuqmfcYA9+gCFD0jdiJTbN
	LIfyQA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62ujav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:40:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b6b22dabso3111975b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823229; x=1774428029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyAv/fUqxS1bjhIsyOH9MFeZHeI00unuuOW8vGV845I=;
        b=aC+jwNJsIc/GyHZg2RCtFnvrECD8IpMbcdwD+CDLH/oHlE/g1Bh46qykUf4LfA4+vQ
         EQ5Kwf2YAl/ofavB2tQ8YioG0DBLQeDZF77H3d0iBvYpEuDH0UZmJ4KIj+pLqgzvUoVM
         xCcY4oLQCK83rOrcZnr5yXmiPSw+Q5zFcSv30y1kNdS9orQZePsR6jFB2hWMNZ2mg9HJ
         z6y4Tnh3MNWEWVS04KC/F1bOX+FrkTwFCn9Wzzyit7Ej6RoiHVuKwYhJlJU2tb2eQex4
         vudeFqQxlh0OdY+kcoqf25MgeEalnjFHM3Mpdx81aOMMTzOQzIMX2zqwL/BEbVuZQvci
         yRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823229; x=1774428029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IyAv/fUqxS1bjhIsyOH9MFeZHeI00unuuOW8vGV845I=;
        b=Lv0P9mPUnLsC/qlrcVyq2E8FxmEvxMI3ixUvQJJ9BNy93b+eF9T3ROmXGZf1CDtkde
         iO/eJFpn5jnS82gwIVnNKdBzPyOm9SlmwLpBI1ztd5sMhvvA4I1gIHNzBxDXilw4Zo0/
         CHXwsH3iHMqwj80arqrWrm1pvrfW2DgxSFh2NFP0qirdPTLSDl/q8vmcT6cYnd+nzquB
         sLmQ8dgv69fL7KIzhAqgz/38KUBw8uEI7d2RbKF/94uDaEYPV+bxwOTBVLvA+fU/lKv4
         zCgff4EzTRx/9Rs39Kk10O9NOnBFu0XwHpMWK7CBnX+HF9WC7kb8i1dZvPKfeOuPr1jN
         yGlg==
X-Gm-Message-State: AOJu0YzvLSAhalFDRJfCSEQDMhkAvHu1lnQiagihQYff9mrz40YV6J/R
	AK+jxyVfU5B4Qk1e0GRqcVVN+Au39c/09GtiEmhiTLKV36OwKg2ihf6MpGD8k8ASjMKoTHFCsiz
	mdeZ78iCGYLQTbCh2f67yHprDYxFYoX8MwE3jrhRs4gCqBmk7OpLE/Ab/L2HWls40YV5y
X-Gm-Gg: ATEYQzzy2T2zc27fifW5kp7i8EYA1SxHh8l/aCsORZrbdUT8kigUyhm4oDqmIaTBlel
	4I4QHpMlaj9XK5EzIGDeNl0kESsIOFfvc4jGSIVuQb+rO3ONn9xh5jjRt0rPHz6/+3cCkRZ025a
	x0c4R3oL0lhpCsmJhdouTKLjoy+8h5za76GAqx1BekPw2Vu0MHtiuhWke22k5+1RlEPV5S147DR
	CzmPlxmHbx6afDejt8pjJFqhHzNh+C8YFNvHSYRGFFJYI20fVtWQrdQ7qMBS4N4RjDJND2hb2IS
	pum5RkMSbdFlZjtXLLtOs7ZMaRPVc2KdTCSLnWT7/xrK9VjZ+fMB40MJAGcuYdCWrQbyUPMcdbm
	fK7iT37ybzlsdDqqApKJecFy45b0bk/fAtbn2wFL4QuKrRI92utLl7uci1MOP3qeGEnLyv+jANa
	q62b5iD8T+qbzYx4lidm8PsyQ+sRrdMWtL7BezcW5XEL7a6xYoIeo0G99c
X-Received: by 2002:a05:6a00:1f0f:b0:82a:110b:e216 with SMTP id d2e1a72fcca58-82a6acbe2cfmr2308854b3a.19.1773823228945;
        Wed, 18 Mar 2026 01:40:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0f:b0:82a:110b:e216 with SMTP id d2e1a72fcca58-82a6acbe2cfmr2308843b3a.19.1773823228497;
        Wed, 18 Mar 2026 01:40:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:48 +0530
Subject: [PATCH v2 6/6] arm64: defconfig: enable IPQ5210 RDP504 base
 configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-6-a87e27c37070@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=1056;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dy2TgZcFr9/VB3bkmaus0Cw/gHd5PPq/I0Ed7LWpshY=;
 b=6lprkFKodzP4k0sKVzjKf00VbCzbGf50y6WOPChoRVJ34fDSoTqdz3WKbqR382Ul9sxVyiaZR
 aMiW+5nuamxBRio0eXil4YZ906KsuyUNtmTwVq4BzqYpUJQ93OuLzOW
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba64fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: tl_e1A3BdKjeBHZHtzvf6z0RAitAhtXU
X-Proofpoint-GUID: tl_e1A3BdKjeBHZHtzvf6z0RAitAhtXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX2bbu36Y8n4DX
 4Ipd/LAOpUQEsQEmmUJMp4vZrOlAX9vjlEn65hCcNxQefPxM6T9FJnDlfpB45SoNnxa/UvIILAC
 8GnoccH9kbCi9hb6SUb/JAYbbiMfzJl5vbAfvR2uwnYBFbxwyO158NUFXntwbOjomIg2A9Y16CI
 8G75fp/J8Qx419fXgBwu7Xgl06sEhC3gF7ZrT3yjlocTwiy9mEq9uomB0EZZFqbemIao9+paKRq
 u+erN6mwKMH0oUCcYYtE3AMR6/8lL4dnxS1ZqXp2ys4745l185BayC6yGfz4nuIGpMWx8YIEtnQ
 poy54Yg3nRAquKzuWbbfJm5EtBVVusuZvF+r/V1zo6y5nGnECgOJcWozTXjcADZZFZsOZzsIKDc
 cYtfQsXgBjmzb37qrC+p+UTqvpvjRp8XHY93WDvNATgw29/7wBpLXSgSXZQQG0FsmAIFl7AkeSa
 VObj5yPiT2DHEdJVNkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98355-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: D9C462B83DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable GCC, Pinctrl for Qualcomm's IPQ5210 SoC which is required to boot
ipq5210-rdp504 board to a console shell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9c53e74ad5caa492bace394e4fde7..ceec9a109f08f2a2a4f4090e92c228279509c3ed 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -649,6 +649,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
+CONFIG_PINCTRL_IPQ5210=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
@@ -1479,6 +1480,7 @@ CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
+CONFIG_IPQ_GCC_5210=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


