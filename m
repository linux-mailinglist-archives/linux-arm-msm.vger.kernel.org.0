Return-Path: <linux-arm-msm+bounces-117384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YnqnJJVCTWrexQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:16:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E543C71E8ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:16:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=asx49ODq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=APk0z+pY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117384-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117384-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DB7930A7299
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF40443C7D6;
	Tue,  7 Jul 2026 18:14:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799043C7AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:14:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448056; cv=none; b=iIaAdVNr+8WvjNMjCMwOdcsdytt1/Gp9p9oPyzpzFCsd64NwdpVM3auko3SwncJoCn/u0nmiVlYI/05+9eTtfqjEUc4ElF6QOy/KG38SrvI74NepDPo1s1wb42pAikleGXIBxRqiK8PTh9TZgIhPZ6PuHm5D06w1wcVN/VLKSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448056; c=relaxed/simple;
	bh=1HUYH7XAIR/CupbkwL1AAVIC1dEpaLo+sTtoheFQzrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHTUbMcU9VoKH3EhLxsaTkCXgrGYmFGQFktFKqAr1PApnhFLX4g4FTZy1laxHS5Kzz1kmbZAyjFW99CYzwSS8vzyogsal3ahxaFv32COKEmO1rN/f794iAWYipunGCzg8UWY9U2a33V/ojwwroWebcQzSe4+VbAto/I7EA8Zyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asx49ODq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APk0z+pY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT4Qo4130338
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 18:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbT7BxhfzjwybNyzveTsXd+/7uQMhqRO9W4TQz7/Bzs=; b=asx49ODqsw3imm33
	lfEGGGaUPq53H33QZKAGurCo/eYro6gvgRQlJTB11cAjM8x780a1VlSBA+lhkbVM
	HPK7Ctw7R367BzaajMhh9YBjjG3WMBdR6XkMNyEOikgir/7eAq0f/DWZZ/Y/mM4/
	Zn2of4N2B6jKiWJpoo4aSdWqS4mR2uDLzD4UDaqe+TcfaqRInJTY3oPYriHZPPbb
	R/EndTALtwUKVObMC1r2EvC07P5/N84mVmtI+Fza3pcjePmBtPMpePKvlTWBty49
	q8vHpoTSHsvFDromhJ3OSGI2WlzJH1ojIbOpXmrfmu2XmXfskwWsEm3LWSMAeNot
	lA2KYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15bh89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:14:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1067399a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448052; x=1784052852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbT7BxhfzjwybNyzveTsXd+/7uQMhqRO9W4TQz7/Bzs=;
        b=APk0z+pYM2o0B4s9peqORVTWMrEjaiPO7HO4yDp+0kIZlUXvxygnBwDiwjn77Am5oX
         +tg3WLLwy6vcJEAuWh2MxQaguiGHsA857NuJ0Z5+PyDVOgdCEgXIRhqd6NFd/vukRDRK
         mILm5w+xY/vbSSiAo1ZIlLmb5Td3+lNWTR9v3yHr6X1z2/r4JjNEldyi4ccBwP0jFUW6
         3G1qVpEbEyjTcKbvQbhkHA6v6uu7pdEAtIbY2H6UaZZE1QwPogqEej2E0XtdgJP6V2Sr
         ZW/h7yjPembFQymBb3bJYitqJfskMzKvViVMhhHj/wt9LNB8JfyzhdfQOadwPS0ZvJ8Z
         DZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448052; x=1784052852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbT7BxhfzjwybNyzveTsXd+/7uQMhqRO9W4TQz7/Bzs=;
        b=Y4w2chAVy2eR0yZSTR7GbLnfOFWD77cdQlbiiAYpMvCJnusuEaYPTWyfHXuAkTtM5j
         dtm+FarnFOQtcIBrQ/HEudAmdnBqMZolSpBuHGIos3hYaNhNAst19/wnckOsONUuLahG
         ZlqGRn3IIVoNh8t/M1IfIMOoUzBSi6mMwqSMH0UDIbCveV6SSPMd6oFjBKiCIdlnAxgD
         PEhkua5NlaJA2khrQxSi8ft3FlOk+0ZSMfZETQazZJPS9DYuxH7fwnx2cCIflcx8uLsB
         eO1sIQkRfqlJzQsHWMF4bbO+Nl5o/aE0Qfrv4p34fuumg//unmoBu/Nd60DNWm/9JtJz
         04mQ==
X-Gm-Message-State: AOJu0Yy4Eup5sJzlm/Mru2rFXHiust5zWo4xN7FwE3UxmAeNaYGkJ7YO
	4yed2jHlgzioTVWmYLTNHki7Y3aLj2i9ko9mM0IfollifdmRUArxFpGdKju9M97ylKYmDU7rre5
	jtay2w1/sPqzV7kYCGMC07BfoZHBjZjAhHOJSPkE7955mqMfPepkjzSqVeb489XlFCKKa8GPKm1
	0C
X-Gm-Gg: AfdE7ckHc5zCoRFhsWeUz/Hkf0EWuZFdAUBWq9FzIn8PxRrM0Wj0TEPycUARt2KADee
	4VlRp40/EsgrANsyNyfkkUOUjq39iaHGrEw2sejOyibzdL6AvM0Bh9NhGTgzAC7CH/Dlk2khoiE
	ueE92362/ufNipIdsnaM2ePKXFwznSHrPYFsaPitG8qn8m7Cl/xXPSRlSI8M2hFEgrfZOR3Bgcs
	USaylxMGJ8Lw+1/vwTCluj1xD7lgIcAC/bGv4qo0WYdLZkbMUJ984clIAz4smFJUg0vqsEhCEes
	FdbtSssOC5zDajvSzs5dGTsAH+tdBfP10z+5BkknBr8ZDA5j94NNktch9yy3iNraOf58vvB6JE5
	zO9RhQMCfHEsPWp7TzJU2wctiPCs5J5mRjL88y19bBA==
X-Received: by 2002:a17:90b:3803:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-387d880b763mr4118948a91.12.1783448052065;
        Tue, 07 Jul 2026 11:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3803:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-387d880b763mr4118907a91.12.1783448051435;
        Tue, 07 Jul 2026 11:14:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 23:43:11 +0530
Subject: [PATCH 2/2] clk: qcom: Add support for videocc driver on Qualcomm
 Maili SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Zaxu4o4HQ1ADKaB6WWyqipe6OzJNUiES
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4d41f5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F0qgNhY56VeKpUo0egcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Zaxu4o4HQ1ADKaB6WWyqipe6OzJNUiES
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX2FhN6cHt7+oT
 9NvFnE8uemzNO3cVMml4b8pVdXJaQu8Lp4vqlDIakLZjWIw9wLcZFNqqhPu154Yu96W1ZuhyMri
 13loaj4gDHLImstQSyzDnr1o11R0mjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX1y9rO50JK//E
 ccuygWyh79zaH8/7Lt0Q4D/SYO0GEQy0UWoF8aehsSiyGm6cCge6/mJnGFEL/z9VA23+3WD9iUY
 hYGJYKrJz1yNGGCI3lLDHrTON1E5jjetDJxRCtzWTKbVDn4rxkoT/AsmAsKqso0iF1FRHAsI2ko
 6ZMag7HIzqmFf12EUC+BnYnb8fvTBVgT8xlv6NWUdewB1HExBIHjJ776CKIWX7hc+ScWthF3PgR
 gE8SYHpFoyAQOZQnXiNfErgJvQMHyi75y6sJMZOe8IgDlNE0OZK/d9X0vZOclcSXAHS4USwYNfu
 PM2RKjCrtUGcFRdYC1tYvhjL2Pb2sdlIU4xkk7n6Dqd/YXY+R4hUCCtoVCInCAWZeK6gzt+6GCm
 ZtV9JG81kXsDSlTpDpWf0aJuldiF6kc3swBl1UenvhJUJnOHfIFoe8jm9A0Wkd1mAecXx9xasQD
 OhNQV94CEIjSboqQdnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117384-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E543C71E8ED

Add support for Qualcomm Maili video clock controller driver for
video clients to be able to request for videocc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  10 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-maili.c | 660 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 671 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6fd4aac1b6cf11d44a81c7a4e1cecd65bbf0bfa5..0409a2e604b0cd3a172c4fcd9211aec4c185a652 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -156,6 +156,16 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_MAILI_VIDEOCC
+	tristate "Maili Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Maili devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 81237e2c8db3b4b56cd50907fc64386bfa8c73ff..9051d559e0ea329dbf2c2df71bfbf1922c9b0dbb 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
+obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
diff --git a/drivers/clk/qcom/videocc-maili.c b/drivers/clk/qcom/videocc-maili.c
new file mode 100644
index 0000000000000000000000000000000000000000..640c1802f4ace38d3568df70043dc20fa8ce6a7b
--- /dev/null
+++ b/drivers/clk/qcom/videocc-maili.c
@@ -0,0 +1,660 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,maili-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+#define ACCU_CFG_MASK GENMASK(25, 21)
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+	P_VIDEO_CC_PLL2_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_eha_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 360.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x12,
+	.cal_l = 0x42,
+	.alpha = 0xc000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 480.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll2_config = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &video_cc_pll2_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL2_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(1000000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0b_clk_src[] = {
+	F(240000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0b_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs0b_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0b_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0c_clk_src[] = {
+	F(360000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(507000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(666000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(800000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1104000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1260000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0c_clk_src = {
+	.cmd_rcgr = 0x8048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_3,
+	.freq_tbl = ftbl_video_cc_mvs0c_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_clk_src",
+		.parent_data = video_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x8194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80d0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
+	.mem_enable_reg = 0x80e4,
+	.mem_ack_reg = 0x80e4,
+	.mem_enable_mask = BIT(3),
+	.mem_enable_ack_mask = 0xc00,
+	.mem_enable_invert = true,
+	.branch = {
+		.halt_reg = 0x80e0,
+		.halt_check = BRANCH_HALT,
+		.clkr = {
+			.enable_reg = 0x80e0,
+			.enable_mask = BIT(0),
+			.hw.init = &(const struct clk_init_data) {
+				.name = "video_cc_mvs0_freerun_clk",
+				.parent_hws = (const struct clk_hw*[]) {
+					&video_cc_mvs0_clk_src.clkr.hw,
+				},
+				.num_parents = 1,
+				.flags = CLK_SET_RATE_PARENT,
+				.ops = &clk_branch2_mem_ops,
+			},
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x81b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8134,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_freerun_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80bc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_freerun_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8164,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8164,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8164,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_debug_clk = {
+	.halt_reg = 0x81c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x81c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x8174,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8174,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x81b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x814c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_vpp0_gdsc = {
+	.gdscr = 0x8120,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_maili_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.branch.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_CLK] = &video_cc_mvs0_vpp0_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_FREERUN_CLK] = &video_cc_mvs0_vpp0_freerun_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK] = &video_cc_mvs0b_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK_SRC] = &video_cc_mvs0b_clk_src.clkr,
+	[VIDEO_CC_MVS0B_FREERUN_CLK] = &video_cc_mvs0b_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK_SRC] = &video_cc_mvs0c_clk_src.clkr,
+	[VIDEO_CC_MVS0C_DEBUG_CLK] = &video_cc_mvs0c_debug_clk.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_PLL2] = &video_cc_pll2.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_maili_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0_VPP0_GDSC] = &video_cc_mvs0_vpp0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_maili_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x8178 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a4 },
+	[VIDEO_CC_MVS0_CLK_ARES] = { 0x80d0, 2 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x80e0, 2 },
+	[VIDEO_CC_MVS0_VPP0_BCR] = { 0x811c },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8148 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8164, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x8174, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x81ac, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_maili_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+	&video_cc_pll2,
+};
+
+static const u32 video_cc_maili_critical_cbcrs[] = {
+	0x817c, /* VIDEO_CC_AHB_CLK */
+	0x81bc, /* VIDEO_CC_SLEEP_CLK */
+	0x81b0, /* VIDEO_CC_TS_XO_CLK */
+	0x81ac, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_maili_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa010,
+	.fast_io = true,
+};
+
+static void clk_maili_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Enable clk_on sync for MVS0 and VPP clocks as per the
+	 * hardware recommendation.
+	 */
+	regmap_set_bits(regmap, 0x9f24, BIT(0));
+
+	/*
+	 * Update ACCU configuration for MVS0 CFG3, MVS0 VPP0 CFG3,
+	 * MVS0C CFG3 GDSCRs as per the hardware recommendation.
+	 */
+	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
+	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
+}
+
+static const struct qcom_cc_driver_data video_cc_maili_driver_data = {
+	.alpha_plls = video_cc_maili_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_maili_plls),
+	.clk_cbcrs = video_cc_maili_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_maili_critical_cbcrs),
+	.clk_regs_configure = clk_maili_regs_configure,
+};
+
+static const struct qcom_cc_desc video_cc_maili_desc = {
+	.config = &video_cc_maili_regmap_config,
+	.clks = video_cc_maili_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_maili_clocks),
+	.resets = video_cc_maili_resets,
+	.num_resets = ARRAY_SIZE(video_cc_maili_resets),
+	.gdscs = video_cc_maili_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_maili_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_maili_driver_data,
+};
+
+static const struct of_device_id video_cc_maili_match_table[] = {
+	{ .compatible = "qcom,maili-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_maili_match_table);
+
+static int video_cc_maili_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_maili_desc);
+}
+
+static struct platform_driver video_cc_maili_driver = {
+	.probe = video_cc_maili_probe,
+	.driver = {
+		.name = "videocc-maili",
+		.of_match_table = video_cc_maili_match_table,
+	},
+};
+
+module_platform_driver(video_cc_maili_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Maili Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


