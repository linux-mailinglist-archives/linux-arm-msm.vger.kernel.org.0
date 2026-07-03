Return-Path: <linux-arm-msm+bounces-116289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3/sHDDSaR2rybwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:17:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96803701B91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:17:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FqJUchAe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JriZn4XC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116289-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116289-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6768304952A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942123B8D78;
	Fri,  3 Jul 2026 11:10:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E693B47F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:10:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077047; cv=none; b=Q6Hs74iW2fmUO8XmnC/nHkosaGxa8YDQzY2pjrZ42y/9f0xitlzq4kaIRtfC11OerK3cB7Fri+1IfyM9va+3hncUZnhV4nHmmxWSZLVifKe61VQRDPPy1ZQkRofT8Y3hIXTKAguDmpr4loKKbR33JmgamqQbyZvf62yw11n7ixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077047; c=relaxed/simple;
	bh=eBili2hDW2W8UP+HYukP+EwIfDoSCDDYOW5zmwASzk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmCqbsl/q3vY3Ddvw6tkI2dGch3ydPhm1+Yzb/Lvw20kMUOsVLr/Ee1ilB5fN6X1uR9LHOjbkP6tTspge+u+L/Yakyr02FkVxv8Od+OT4aTodzTw2Ig4FbEZZ4+ndzofi5e8U1ZD74NK46BCnNTMlBhviApQDXnmBZnX0/yjEc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqJUchAe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JriZn4XC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635riVf3108900
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xL4r67VndkozpKNPgyx2iy6w86h/+n1x0+mULo9gAQ=; b=FqJUchAemWUwZ0V9
	C032Hu7Q+wCy+jjZhsFcaqzgJ7wcRJD7mZ7n1lGsZPmn8Fxa/FVdy3klZbatWQPt
	VGGMxRgyOPeXlw4Hl3EsobmqvmLijcwtzgNWc3uWHpu0Bqj+lvHenG+FfNOQnGbQ
	IRs0mGzhHA6jRuMAhSk5a6wSbApSbhooWOvIuvGsfcJRQr0w9iUSZyRxaoPPvgvv
	4W3VHSSgAr/s4wYmVqbEb8fgUORJEIFvMSn30gAoVaKmDjCFyueGBYOQniGsGFOa
	rX4jPTX5SO8ytS0+JQ4/EL2yXXO5NSlCXgV982E7sgpRliKbyf74HqchYEUNogCu
	66RWAw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyapkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:10:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a225cd91so535253b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077044; x=1783681844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xL4r67VndkozpKNPgyx2iy6w86h/+n1x0+mULo9gAQ=;
        b=JriZn4XCmdWYXhoboZJkyX23U+4B6yllWDiXiii1n4xlWhAc+ex31vSYwXJbN6hzvq
         v+2lSXYBuZo8/amP5+A2aFLNzTpZji09RFEbWuOXQKjX+hb0YZ6vmkmRFYsCCGrExAVo
         Wf/hlITobiXBAUgmtpr/EuZW1y0YvfNPVSY9HgGtUoNMW07uQxBAq42XxDhCkoMB5RpD
         mgtg4hQtwfIV+OLgWK3RuumHKz55P1DkQlVT3ipLur+FdU7Mn9UF/B2DE04srSI8VVBq
         kX5CWANxjKdZXjsNlJvjwD0NrqkpA06PHW5B4aKRpoJ/73KZ2c9kfa/17ET47P3KaYoE
         x6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077044; x=1783681844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xL4r67VndkozpKNPgyx2iy6w86h/+n1x0+mULo9gAQ=;
        b=SAmbTbz22JV3q46HrjAc8bEaSB35a6HFc/ZhRZRrTsuNGd9TGkdE8UmMcw1Wv9du+V
         vldClECDs5RRDZj27Ps/8+nMZZ53CNhWxcDRdg+SyZ+JHNwWnGcQNXj9GJ2cdTNzJvmX
         DKsokmn9Ct0r/twDjxTdn0NiYQH/1dQk+VSyRDwRy3OhAiiU6h7RnnOWuPefGDnhCf/H
         YuAQBta1UBztWqhSAJf6Igu08fMqT/vxgwOdJJfhZM/V0sUm/pvrtweFnThg4VuA0Bul
         qgEF01/eEHJu8pKRfYTwF68XevuQMpLrTXau1F5J7fjdu+7gI166OoW1FpSWttHHzjhb
         LAIA==
X-Forwarded-Encrypted: i=1; AFNElJ8NlMXBaVNq69zhS7oWxumw208WByaLT8TDU1OqDfL0g9yvkmEtia1KsJ+MVBKs38i+ZflogzOD3XqHnpK/@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIS1ETdO8PCWgHkWkhispCsw1+hA5M2Mi0GthIZew/feNzF1P
	XLqCpi/uruIYYMuPh2JcJWeK3VH7LjH7W3W8joThfuYtcq/TkrOebQ2UItPXCI0Y23o31ZJ4XRv
	oR4vlICE1Djw7H7BcGkJ8D6ZUDYw457ZlcqjnVyAS6+EflusmtumXRxd64bmJZJTqXSYM
X-Gm-Gg: AfdE7clefxf2uBlnMM7JHXdUyt31niSd1FvX1SjkOQbVqD23ugsWFCVmaCCOdlwl1Sr
	NlVB0d9g4HOdQGURIxS9B96oltbY2GgelmcI/pHXoC70l/EYb2r0Kua66qQSvUyBgVMrtsIYl4/
	2hFSRvUgkr8f27zpdDSFotHVtOI65vc5KlyS9+jgjemKmpcvJ67dxjZY+0rtlYyiMmxWaRf+Tzv
	q6xaFxkex6Eci3Dh07XBCwIDuoXNax1ZGRNQC4zZMrXXgigOOyqEzdx0QmQ9G+QzIngVSo8GLio
	zvCda3esKEPWQ6JaZFj3p7FP37S42T88TXShXQKVIdySze/ISRW5vdQXh7AZx5RnJjmE/sxfhNL
	9pKQEcv1NgIcKNU0z+n1OAdTJZAZQBe5JFTCvsWI=
X-Received: by 2002:a05:6a00:847:b0:845:e7ee:eae7 with SMTP id d2e1a72fcca58-847c5005ebcmr8804398b3a.5.1783077043699;
        Fri, 03 Jul 2026 04:10:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:847:b0:845:e7ee:eae7 with SMTP id d2e1a72fcca58-847c5005ebcmr8804369b3a.5.1783077043188;
        Fri, 03 Jul 2026 04:10:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm2836444b3a.27.2026.07.03.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:10:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:38:51 +0530
Subject: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-xo-sd-codec-tx-rx-v1-1-a3cf683533d7@oss.qualcomm.com>
References: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
In-Reply-To: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX4KSBqa/WL/XP
 TVGSHz2L0g5N2msdlelLZwLL2hOlBLEtvqdl/BRfC+zTCIxkmzwM5IVU5Wk9M/KrXOjHn4mIyJa
 tsKNvZVEERxueK8s9E2WU6dTh8V3p3tAK/zNENkL8YJC1oJoYhTC6nwxsSGp56KqNhh10GjZdQC
 zcvnHL+Vm9c9pVbISMLcXpvXUdzwsA75JD8RNd4DKANIkQqv74Ed7AG/QmQE5aV1i42mW3z6ekr
 juePml0iLi1vB/LstuARBED4VRTIs67BQB1ac0NRcczKuXUdUM6zqL7z5Ahb8imIhoXHan4tNUz
 quN2FXVcAUT1rd5l8t1wv/tsuXX8NZGbl1nAaWnRZxAsAIXeeheJl+JkGXHuWdMx4RZpeMY9RHW
 2NOM3jCiysyeTotNRrce2jt1czinKpdipTLXyOgFHqxdM5IKylmHXpTqjGF00/JqAC9KEAVkdNh
 zlREMdfOPz+Tomrd6dw==
X-Proofpoint-GUID: NxJDoUblvKV-3xVpeEWPxfYDp5JPLoJN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX/cgVin/OpQZr
 IGETccqMQByl2P4q7VOsrHuuQWtCnbnHqLPG9d9//VCM3m7xTynvwzl/g/R2vg4KkME9QrcG8Wn
 kM1AfRADIzzhMYASPNZXe39waFAzgt0=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4798b4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2ztkfpsRXklUYACcPygA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: NxJDoUblvKV-3xVpeEWPxfYDp5JPLoJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116289-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ravi.hothi@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96803701B91

Convert the LPASS TX macro codec driver to runtime PM clock management
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_TX_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-tx-macro.c | 115 ++++++++++++++++----------------------
 2 files changed, 50 insertions(+), 67 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f90a0d4c77ea..cdb50316f471 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2909,12 +2909,14 @@ config SND_SOC_LPASS_VA_MACRO
 
 config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_TX_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..2b2dda5ee1ed 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -2149,17 +2150,20 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = tx->regmap;
 	int ret;
 
-	ret = clk_prepare_enable(tx->mclk);
+	ret = pm_runtime_resume_and_get(tx->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = tx_macro_mclk_enable(tx, true);
 	if (ret) {
-		dev_err(tx->dev, "failed to enable mclk\n");
+		pm_runtime_put_autosuspend(tx->dev);
 		return ret;
 	}
 
-	tx_macro_mclk_enable(tx, true);
-
 	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
+
 	return 0;
 }
 
@@ -2172,7 +2176,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
-	clk_disable_unprepare(tx->mclk);
+	pm_runtime_put_autosuspend(tx->dev);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -2316,27 +2320,26 @@ static int tx_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(tx->mclk, MCLK_FREQ);
-	clk_set_rate(tx->npl, MCLK_FREQ);
+	if (tx->npl)
+		clk_set_rate(tx->npl, MCLK_FREQ);
 
-	ret = clk_prepare_enable(tx->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(tx->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(tx->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		goto err;
 
-	ret = clk_prepare_enable(tx->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		goto err;
 
-	ret = clk_prepare_enable(tx->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err;
 
 
 	/* reset soundwire block */
@@ -2356,30 +2359,21 @@ static int tx_macro_probe(struct platform_device *pdev)
 					      tx_macro_dai,
 					      ARRAY_SIZE(tx_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = tx_macro_register_mclk_output(tx);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
+
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
 	return 0;
 
-err_clkout:
-	clk_disable_unprepare(tx->fsgen);
-err_fsgen:
-	clk_disable_unprepare(tx->npl);
-err_npl:
-	clk_disable_unprepare(tx->mclk);
-err_mclk:
-	clk_disable_unprepare(tx->dcodec);
-err_dcodec:
-	clk_disable_unprepare(tx->macro);
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 err:
 	lpass_macro_pds_exit(tx->pds);
 
@@ -2390,25 +2384,23 @@ static void tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(tx->macro);
-	clk_disable_unprepare(tx->dcodec);
-	clk_disable_unprepare(tx->mclk);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->fsgen);
-
 	lpass_macro_pds_exit(tx->pds);
 }
 
 static int tx_macro_runtime_suspend(struct device *dev)
 {
 	struct tx_macro *tx = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(tx->regmap, true);
-	regcache_mark_dirty(tx->regmap);
 
-	clk_disable_unprepare(tx->fsgen);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(tx->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(tx->regmap);
 
 	return 0;
 }
@@ -2418,34 +2410,23 @@ static int tx_macro_runtime_resume(struct device *dev)
 	struct tx_macro *tx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(tx->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(tx->regmap, true);
+		regcache_mark_dirty(tx->regmap);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(tx->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare npl\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(tx->fsgen);
+	regcache_cache_only(tx->regmap, false);
+	ret = regcache_sync(tx->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(tx->regmap, true);
+		regcache_mark_dirty(tx->regmap);
+		pm_clk_suspend(dev);
+		return ret;
 	}
 
-	regcache_cache_only(tx->regmap, false);
-	regcache_sync(tx->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(tx->npl);
-err_npl:
-	clk_disable_unprepare(tx->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops tx_macro_pm_ops = {

-- 
2.34.1


