Return-Path: <linux-arm-msm+bounces-114963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e+i8JrNDQmo/3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:06:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 396656D8A78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:06:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bz1/FqF7";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O3+oT1+J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114963-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114963-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E776E300F756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1049C3FBEA7;
	Mon, 29 Jun 2026 10:06:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D2D3DCD83
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727571; cv=none; b=iCw/liFFBaZzn2U8kDX/9ruaifOkaP9stmU0+i4/FxzTBfANVoHiE1H/n0ASOUPTpUx+rtB5RCJI736sxRb971Z2W0S/tY/FvqbEsC1+eZ84U5hPodUvSoSLhzc/OmjG5aBc6tjmVNQNCWyTuEIRTR7sS3Wj8c3ECZMFjGLIHOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727571; c=relaxed/simple;
	bh=BJWn646ReG/Zhog3+YV18NW8zzIb5JBXv7+oxMebjNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2Dx66Jm4jj+mQf+XbrcM27/qcjZtJEW5EFmchlLVvz6/Unv/LhZGgFnCpasAS6HOOWqv7AJvyy5AXiSSYO9W5BvFC4cZICpEfFjwXmLBbeXKReNUYeJo06FP3KTFnbqX5jLKAqpJ1I7q+400wzikasMxQ9wxXEYOtVlHBgWmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz1/FqF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3+oT1+J; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wYLA2391272
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=; b=bz1/FqF7dReUF1ub
	kXhX7v1RAKPn5lvA7nxn+glzngAEoZh584C0jZ4CRB3quQaaGdWQX/V5ggti/s29
	6QItm00/+DTkyhEOZ/v7YeBzk0Ji3MyK6od1NLogXTmaGpdiDK+sTJjhHQgrB+EQ
	Lj3SOw7MLOoYD47zXtmc1gUEA/xGLMqQDFxkh9fXCDlHVSRKH5w80EpND1D74m9P
	QlTUvhtUjwCyKVjCWlsiCJ1F6w1Kb5tOEKdBxZ+McHNKaDUb27cNHvMR7FUgHu8G
	SXO5NT+36Xb3DUu9vk0Pzp4okJ1dTkHu8y0Cb5O5+gnn9VmVI/Kt+CKrLrd9p398
	cK3xFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw89kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca0d4fb061so5247165ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727569; x=1783332369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=O3+oT1+J6IAYObP9L3Xsz5beWjYx7XM7rmByEUbW2Q00Cv6wnDVfb00mW2ijLU1imu
         i0xyL7WLPGxDSeTGx4qlTCeLDKPYIg/ZJ0A/xoi4DeWU91kxCM/lERVFThnFk6HoDfpU
         UEcTAmCOmBXyCVfxmBngAIkM9vHU9MXJPBfEf7QrgnUeU8h+qIMCsU8RpxIu9c4kqptJ
         AD5MXycWgWJvYp9/2g6KU1KUAKsD9o5LXEXNVbaNaE/YJ+nft6Q4rbhmz+rSozmTezz8
         TPwsHD0qjCOVbEYFbcKNQzRsQpR7qIO0e8hJK7+w4r8qJ8UHsZKP6zmp8Er8a0VXyIPE
         ZNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727569; x=1783332369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=d1RrS0pAJhwskTLGl0oLUsA4q3eRecmK2wpd/0ox14lBzTew06JkLi2W/iC0NLrqiD
         xJ2bmWZiG66bLrfJy4/9H2UWWTuWnkWo8ZBIrgNc29UUWfef7gf2qZagl1z33o8B88hV
         zWGqyrfl0OKUYKHLIwi8DZIAl3IK39thm/RIhtGSR3GDocngqYZOQpXnZHMLyroM+ozQ
         hLPmIW5nf7binav2jHhPiHyHQM2/dRI5hvEWjUXR/bv5+980RgQ3wLRsvKivbDOSuGWe
         kJtGmDprt0hrxSQTakGfG76BfMaEdFr4Bgoa/GAU5fc7WOdxEwb0sfol8YwfcGTOx7Zx
         CqVA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0zTfQbdYtA6+g5y/CLq8Pt0BSNgNR4N+BrpSyJmhSw6Ri3tWrt6gxJHSi0BNSMxHnl2ahlmKXHhx2cvwt@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/kPK0JSY7xXk1tX09wuXHElB1tATG7oGlmEET4TV8HPu5mUX
	zqZE5A9ULEZYQfAs+tVx/typy8eXehTF8RqNHyTYq6e3nNJ+JJMpHKjR44wfr7KYomvAf6Xmzy/
	1VqIuWlSRxRVef8q4WRAdqnfaKOnjcl+wARmdONwYK9fyIijhhwT2ZIObIM5P3QqacBLr
X-Gm-Gg: AfdE7cn6cOXgoeieY2h2kSALjXudS1LMgmWdblJ8bO4Dg3Ht4kUwtG1JM6ak+6PA2GL
	1xNJ/5/44U8yg5JoHitCNULm3z0KngklOICvyIKN6APDkK0kR1uZMN5L+dbn3CXCcbl2mwFK/WZ
	8sTUECjW6wKuBT1kd2zfi0XK2DyqfD9MqCb4cmXxFoidQ7yoNBgdvJGlshZC9ghoSsLiTsMSGt5
	p0PpjsYRgINseLKPzy3UOtEZXzjgdriPKtxXOsd9kCA2p5tRREuTtp1G423YpgA4jHNHCQapVHS
	bqnGEJwq/GWUd4h4pEcqbPtZR+1JHS7kSpBzsIwzK8gjFNJCTVTNkCkYA3x+1sFYwAfERUe7oF8
	84Qazcl0BKmbHNCWkAosFrYMQpWtipbAUQ8nq3x8=
X-Received: by 2002:a17:902:ce07:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2ca0e5c82d1mr15363525ad.3.1782727569200;
        Mon, 29 Jun 2026 03:06:09 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2ca0e5c82d1mr15363225ad.3.1782727568666;
        Mon, 29 Jun 2026 03:06:08 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:08 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:35:38 +0530
Subject: [PATCH v7 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-1-fb37ce457c42@oss.qualcomm.com>
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX3CKD+j1j2DH7
 axv4nUr1Kh2QNgs+FVgPBt2KIc6plUYmtjxFygRcSBfXTd2vfZrfAG5UtFz6fsGxLj5iydXyJVe
 +BNAs6ZNsUr5tq41pXFcvJHBBRpZzPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX3rtmRSBlE08q
 nADphmY/Q5dzHE1FqDknCLPteKHJFoyJi7QjRONXg+g7IIa19aXf9EtoK1aa+/zrMjZLkZ7r5Pr
 fV0P58WWYJQ4v/qMORw0OLgZ2kkIenuw2SFNxb5aSrmk6CAVsqvt/gx1iFmqQKiJM8sF9RB1U8D
 eCNFwmzE1UMvlnCL2JoDCwGOVDGpxEghxaA7oeX/gcZvqXXWoNZCOqDVxOUcRtg+yVZSjbmrYy5
 8zqJXTApe8jPeRjKyOxSsTwAhIKU/8MO1fa/jbjC9muMUp9DBsQVsmQFEfT6rhkPiFBPyd42MFu
 4dhVPhZp+0i6fMVBIyI8FK2kUCL9wo9SxHTtYid2BsdUXktpXsLJjB0g6UvSQRgwzn62IghbQtO
 UAEgsNotA4n4wcA69qAO4Z78oDIetnYrFS/K4I0Apu6CVU54xlOzpy1ByfiApyPk0MZ76tixe2d
 PTfEhhCguQ7XNOw19tg==
X-Proofpoint-GUID: QscsmFxdGDDpF3JCq6HDoX-jw23qLucK
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424391 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=akXh_AD3SVDOJReeMSQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: QscsmFxdGDDpF3JCq6HDoX-jw23qLucK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114963-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 396656D8A78

Convert the LPASS WSA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig           |   1 +
 sound/soc/codecs/lpass-wsa-macro.c | 131 +++++++++++++++----------------------
 2 files changed, 53 insertions(+), 79 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 252f683be3c1..92cfa623782c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2897,6 +2897,7 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..718564ee381e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
@@ -2529,15 +2530,13 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
+	int ret;
 
 	if (enable) {
-		int ret;
-
-		ret = clk_prepare_enable(wsa->mclk);
-		if (ret) {
-			dev_err(wsa->dev, "failed to enable mclk\n");
+		ret = pm_runtime_resume_and_get(wsa->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		wsa_macro_mclk_enable(wsa, true);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2548,7 +2547,10 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
+
+		ret = pm_runtime_put_autosuspend(wsa->dev);
+		if (ret < 0)
+			dev_warn(wsa->dev, "runtime PM put failed: %d\n", ret);
 	}
 
 	return 0;
@@ -2774,25 +2776,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
 	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_prepare_enable(wsa->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(wsa->dcodec);
-	if (ret)
-		goto err_dcodec;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(wsa->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
 
 	/* reset swr ip */
 	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2809,56 +2809,37 @@ static int wsa_macro_probe(struct platform_device *pdev)
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = wsa_macro_register_mclk_output(wsa);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
-	return 0;
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
-err_clkout:
-	clk_disable_unprepare(wsa->fsgen);
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-err_mclk:
-	clk_disable_unprepare(wsa->dcodec);
-err_dcodec:
-	clk_disable_unprepare(wsa->macro);
-err:
+	return 0;
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 	return ret;
-
-}
-
-static void wsa_macro_remove(struct platform_device *pdev)
-{
-	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(wsa->macro);
-	clk_disable_unprepare(wsa->dcodec);
-	clk_disable_unprepare(wsa->mclk);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->fsgen);
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->fsgen);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(wsa->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
 }
@@ -2866,36 +2847,29 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(wsa->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
 		return ret;
 	}
+	regcache_cache_only(wsa->regmap, false);
 
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(wsa->fsgen);
+	ret = regcache_sync(wsa->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
 	}
 
-	regcache_cache_only(wsa->regmap, false);
-	regcache_sync(wsa->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops wsa_macro_pm_ops = {
@@ -2929,7 +2903,6 @@ static struct platform_driver wsa_macro_driver = {
 		.pm = pm_ptr(&wsa_macro_pm_ops),
 	},
 	.probe = wsa_macro_probe,
-	.remove = wsa_macro_remove,
 };
 
 module_platform_driver(wsa_macro_driver);

-- 
2.34.1


