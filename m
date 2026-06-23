Return-Path: <linux-arm-msm+bounces-114103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7WYPBN0zOmrO3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:21:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5486B4CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:21:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N7wv4HHc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FJ2DlP80;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1553E309A0A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5103C585B;
	Tue, 23 Jun 2026 07:17:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C12D7D59
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199058; cv=none; b=VZA+U5zUjvkdZIeNG/5y11rmYRNZo71Emyq0h1z9bxr3an2euLwu2iayX41hUbV9QS2jbNp2FGPUqku3Wa7lhaf574oHfOii1v5tJ6u2MAzMcgIi0BcDopYDs02hceFz/avOw/fzScpINoR8W8KSPc/jP19o//3dRE9Pn2vUcLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199058; c=relaxed/simple;
	bh=iyY+y5TN9IyHjJokwttza0905vWxKzcVubpcRLTFUdE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hQwIFXhN3PtEOcR01lqUXlsCPAZqq4nAW/zCrBfs5p0i5EtvNkVQqCD+LZiRJewxybegOoBJ7RTWsK9ikIIkSTOE47V6EA2dlYLM/60do0NhgXF7EifDTizj1OulYHJr9mDOIjK0MVKfYkIjfj8vWGvdBYx0rvw8BVQQMw2EMMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7wv4HHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJ2DlP80; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6d7Tg3376127
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ROJ6IfZLONlQgvg7ILGZbruv22ROJsbV5xS
	Xg8JtFPo=; b=N7wv4HHcvRLQQ1om1KpcDWI0k0uI3ku+G06CCvEcOSU07QcRgQI
	yp9o6xwOJZ3WBkwFYNBOTLtvgZWR7yRMXnzBE0TcQnAyjDnilp36ffdxR9bJj1FL
	ejJu//o/JDS3+VukAneClGKAD7iR1QDvNxVFjeBlT6zucv9s7gAj4AqEjJqFaX4o
	AChp3E8CLQ5KXO7vYvrZtDQ7+rbonn9vFW5i94OnWFRxTO1tovaK3eCqxJlDCAy2
	z2LOe/7BRCiGO/cTjviGWjqLYJd6YWGG87dudm5m1fcbbH4RHiD+7O5NQyeLbvB0
	kKywCRI35Y2h9dllDBQeQv/uILtJOkJYW2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yebed8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8ab01bc3d3so539906a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199052; x=1782803852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROJ6IfZLONlQgvg7ILGZbruv22ROJsbV5xSXg8JtFPo=;
        b=FJ2DlP80ZCSLEca1Z9u6FwbBodWiFhVP0sVcxc7BVBlChSSE2yOGoBdvgLe9p4WpTN
         NkXi2CNHV5oRnUsYEm7tDZezM/AE4a0giHqLOXmm98SqcCndZzzwZnzFs/OgxqRluxig
         VWZZmhIFt2b4D8lpogAyftl40CtMbPS948n9VNewMFd3NaquchYc+bjr89Ly1YEZui5D
         LiNLcv4ExVNTpbmBtLsgM6vTd6UlCfq/vRcWR8UXurjvjZRDGxUxYmEY0dgr556XIVeq
         emeziCRocHN22j/6Vhgf7Q5YGGqQKf86EzmHDiO/GtZbWern8QAr1zaUmAXlsADKRqM3
         vHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199052; x=1782803852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROJ6IfZLONlQgvg7ILGZbruv22ROJsbV5xSXg8JtFPo=;
        b=U/rVIcMg6vjDrxNmJP6F2Fr5yJKAa+Aij1UdNTlJrU2L8z9NJeI6kwXveV75AN2WuI
         XDiW/tHbjMDs85wnPcmdcuMOH1Qad4LuIDWRxcHWQN6CXONo2rQmDkWwK/DvcZzz0Eip
         WvfvxbVaWyIyX7gicBh39wza28q4iN5FqvfUFHjHyBjISwwOjgRAZ0BO2iwbB136Aopm
         KkOP3CzK4X/XKMyfnB2uMfFks+yoOiE4p6K/r2+E0vng2WIVENWEQ0cliozHS3KB2bQb
         hO0pDroI8nqbBy9UhRAH+g6eUYJZ6taKr6zvwC8hBxtjDJSDqIcPKijuTVrAssQJcwH2
         Wxmg==
X-Forwarded-Encrypted: i=1; AHgh+RrTirCwk5IPih6SUGfg02XN5v5QwVfAYwv+SrCFsh/VWuUgeiXof+Vz0k4B+WMPUZ8QymjyaoXDMoCMoFpj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8S7n3OyvGDvz34Vsqnvy9B9f4c4SGaWL+RMQMFNSHQFdDiLwP
	QAxopmnSHcz6oDkk9ciTqG9v4jI0jVQKOy5ur6uaXKvxX0IUhNhTTIUjZCuhSKqp/zU/xV4T9W+
	tGFGZIPypwhc3v5ZO4lYbWUIdsuKyx3cdFounxYxajYgxC37yE8XqxuKMLX///GjiyCxO
X-Gm-Gg: AfdE7clLUahtkFGNlCIAuOIbPgBmQh6/vT3z9gQJSRM6q8Au4wrssrGnd3TG72RFQKY
	TXjC41xjVOl7uwodCsaoaOOhS5yBoBTD7pouRvczj0iu6kefXCyr+5MVgekYvUIPlU6Jm2dqaMT
	CHYMF7us4reHEZEqhpxSWazqKEeWPr/+R0P7Y/rKGrWQSyGlbX1TrrdiRjDjrOK3e+2Y9H+dc6k
	mTamRucPuomXiWsFj/4DD+pssOOYgXcmRANSDinnTu4ALnheSZq3wuJSQuHnmzd83c0spEHY8Wl
	vzS4XOao55HDNJ89pCnChhe9GwgjO6Kgi1bxcH2rBwXm3KdIRCy7mFykJBVNT/JyRKFLD1RBxhH
	aC/aI2x99YZnEOnZ6mWtwNOEo2c9gIZd/imxwHpU=
X-Received: by 2002:a17:903:41c7:b0:2bf:1845:baf5 with SMTP id d9443c01a7336-2c7c3eb9751mr22858905ad.12.1782199051863;
        Tue, 23 Jun 2026 00:17:31 -0700 (PDT)
X-Received: by 2002:a17:903:41c7:b0:2bf:1845:baf5 with SMTP id d9443c01a7336-2c7c3eb9751mr22858665ad.12.1782199051402;
        Tue, 23 Jun 2026 00:17:31 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:31 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Tue, 23 Jun 2026 12:47:07 +0530
Message-Id: <20260623071708.2822269-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FiBPYX86xTzvD_AQK_aI61ZX6d2TdUXe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfXyqzuEjRWT5Nc
 P0hnQtEYG8Vfk5oWvWYLPogqol5dxzw+ikWiXaHMyQuxKf3uPNhNx0FrKmYoneZAd1db4RQwBGh
 x5YLdz8JQImoYK0G+PO9klNGU7Rnb/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX7lK/Nig4GMHv
 2ZHztXmWrdqYiCQgzM26LYOPShRoxwWOWwahlLy4WciFMV2u2HIqNBSGL3JbY+EohBaSbAoy1Ac
 dSEVp+clxpSrU/yRIIgRfi44WeY6HKsKPO6V+qS5C6ILz7YjG9pomCElfdPWdSCvhij84FfV0b9
 JAczehlOOE4s1aJPOcnOoiBMwaMPM7cagkAgAy7ajH6xXTQQQcrInuivbKS9resLOkSerRzb3c/
 mFHNTwb5oF3rbWbDDVXFKcWLC6smVYqs/xVwrTbmiSfmID139K+14KqyS5SVD3/svalpxhQAplU
 UojxqEU8gtcFJSRvByxGzQQPoPM0Qd5L3pRDAMSymvAaYjnmufIi1tVMm7cO0yycjpb/hIpxpfv
 Af84aiRFEwW/usHwmasIJweaMiqbZ/XYd5yA3GD4SIncnDr4tYN8RwHdASq7DuKp8tCRMHbW6CD
 KG1kXivz1epQ7wObk4w==
X-Proofpoint-GUID: FiBPYX86xTzvD_AQK_aI61ZX6d2TdUXe
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a330c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tLfOVjUU_VM9_-uA5fIA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-114103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B5486B4CDD

Convert the LPASS VA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
and runtime PM callbacks, and keep runtime PM references around fsgen clock
gating so PM-clock-managed clocks remain active while fsgen is enabled.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
introduces PM clock APIs.

Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
paths and restore regcache state correctly on resume failure.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   1 +
 sound/soc/codecs/lpass-va-macro.c | 142 +++++++++++++++++-------------
 2 files changed, 80 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 458ea62ad983..72a973dab84d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2896,6 +2896,7 @@ config SND_SOC_LPASS_WSA_MACRO
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..6e822e47c863 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_clock.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
@@ -1346,34 +1347,58 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret;
+	int ret, rpm_ret;
 
-	if (va->has_swr_master) {
-		ret = clk_prepare_enable(va->mclk);
-		if (ret)
-			return ret;
-	}
+	ret = pm_runtime_resume_and_get(va->dev);
+	if (ret < 0)
+		return ret;
 
 	ret = va_macro_mclk_enable(va, true);
+	if (ret) {
+		rpm_ret = pm_runtime_put_autosuspend(va->dev);
+		if (rpm_ret < 0)
+			dev_warn(va->dev,
+				 "runtime PM put failed in fsgen enable unwind: %d\n",
+				 rpm_ret);
+		return ret;
+	}
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
 
-	return ret;
+	return 0;
 }
 
 static void fsgen_gate_disable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
+	int ret;
 
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
+	ret = pm_runtime_put_autosuspend(va->dev);
+	if (ret < 0)
+		dev_warn(va->dev, "runtime PM put failed in fsgen disable: %d\n", ret);
+}
+
+static int va_macro_setup_pm_clocks(struct device *dev)
+{
+	int ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1534,6 +1559,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1627,20 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
+	ret = va_macro_setup_pm_clocks(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(va->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(va->mclk);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_mclk;
+		goto err;
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret)
-			goto err_npl;
+	rpm_ret = pm_runtime_resume_and_get(dev);
+	if (rpm_ret < 0) {
+		ret = rpm_ret;
+		goto err;
 	}
 
 	/**
@@ -1629,7 +1653,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1683,28 @@ static int va_macro_probe(struct platform_device *pdev)
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = va_macro_register_fsgen_output(va);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
 	va->fsgen = devm_clk_hw_get_clk(dev, &va->hw, "fsgen");
 	if (IS_ERR(va->fsgen)) {
 		ret = PTR_ERR(va->fsgen);
-		goto err_clkout;
+		goto err_rpm_put;
 	}
 
+	rpm_ret = pm_runtime_put_autosuspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", rpm_ret);
+
 	return 0;
 
-err_clkout:
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-err_npl:
-	clk_disable_unprepare(va->mclk);
-err_mclk:
-	clk_disable_unprepare(va->dcodec);
-err_dcodec:
-	clk_disable_unprepare(va->macro);
+err_rpm_put:
+	rpm_ret = pm_runtime_put_sync_suspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind: %d\n", rpm_ret);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,27 +1715,23 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
-
 	lpass_macro_pds_exit(va->pds);
 }
 
 static int va_macro_runtime_suspend(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(va->regmap, true);
-	regcache_mark_dirty(va->regmap);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(va->regmap, false);
+		return ret;
+	}
 
-	clk_disable_unprepare(va->mclk);
+	regcache_mark_dirty(va->regmap);
 
 	return 0;
 }
@@ -1726,25 +1739,28 @@ static int va_macro_runtime_suspend(struct device *dev)
 static int va_macro_runtime_resume(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(va->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
 		return ret;
 	}
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret) {
-			clk_disable_unprepare(va->mclk);
-			dev_err(va->dev, "unable to prepare npl\n");
-			return ret;
-		}
-	}
-
 	regcache_cache_only(va->regmap, false);
-	regcache_sync(va->regmap);
+
+	ret = regcache_sync(va->regmap);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(va->dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


