Return-Path: <linux-arm-msm+bounces-117236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kkh+GxHLTGpupwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:46:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E15719F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:46:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NUZwmWzb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eaPAbnAl;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117236-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117236-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF7E0305179A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4A33C13FE;
	Tue,  7 Jul 2026 09:43:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05F3C0628
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:43:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417429; cv=none; b=F51pDgW6wecQY5mROSb5mQBhRn00Cntlws0WE58x75UAe5P76hXRgK9zBQF2fExxYgjU0qTVp6wS4k/Pw9N1tBT4m/CYwfAYRnF5EToHbMOznKH0TsNep8F3s1L34kQXVjIuS66/Ks1whwlmS2k8wagMB5nPr0CCB9/LebLvSog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417429; c=relaxed/simple;
	bh=TSbl0m/FOAI6PfxYdgJYXzRM4StznGnbNf0pbb6NsEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXrk2kjcGW9y2N+evCdmOVgqUW1w6UqzpkIwX/eVj0PCdFUvHTTFvQSHZPHcTrLJ8domPVcMtvIwBeFJVfUN4ojzdZUhRShTDteY1uIiyPGSnyRHj/VPss4C1dYb/403iu+CHNyDE0xS0o+0jJg986iR/2K/7NHeJqbBBKtptVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUZwmWzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaPAbnAl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dkpg3219411
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsC6PBdktmUOoL+JYCulZoNVI907voK3HYruugWamTo=; b=NUZwmWzbhPUJx367
	SrCGdhG27Wl9S27RyWVfC05EQNrJtsjd4WDxa4aDummtiaeVPAbXYEQ7qrHLWcUq
	DGHUEePHr2Cv5mQtAUMG/0vb6MEOP3H9dpGH2hFGWVjNRqxwgWLDBZQTUmftaasL
	ut6+1HQ/Jm+L4/1qbxFaxznZdWQFRIdkJz5yuRHxMbwBlLcmlED8Rhk4NtKGm7SN
	9La5JTDD7a39AbVQiEcaXIrSLGdPhJ5JMs4u+HcP4yQ+7e1wr7XjkDpd9SA6b+7t
	oR42VveZIcSw3iTn8jxvN8+QRDhU4Xs3QM30cB35eH/c7gZoU+UWY8HfKe4MYKQL
	nznQfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0fb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:43:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso7030111a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417426; x=1784022226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsC6PBdktmUOoL+JYCulZoNVI907voK3HYruugWamTo=;
        b=eaPAbnAlbvCpZzW5iDCClTpYsfKsdMilACmyiVsD2Hpl6EyXrsxo/7SzqWSV7l/JUV
         EcNojd6EDbVN3j4VU1MiUfO1K02w+aFAWO9sY7bZgd2M/RadjnqWVDe1nIRPEooc6e6K
         Apok1nIZdSTIO5JB7swOpSKpnrMw5l/H4GV9MCBNou7StUcI5ABTleDU1Y3nBQ1/ZK/i
         afhWjfGT5bb1uTQf4sd61LDJnEsIBookBQ9i3tUuytIzODT8Hmxzcygel+36gdEETLVs
         4l0oxXqVteXvr4PIGQ+NE9Wes9S2ydQRSS7lJjk/WzBAVu1eA8QfY0YCuSjS+yXU4Yuu
         wOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417426; x=1784022226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsC6PBdktmUOoL+JYCulZoNVI907voK3HYruugWamTo=;
        b=DPpUy01vS5loe0SEN4xRvf0+lXU0SwatxUfU1tIqAS97LCYACNNZ5DRrs4GqRXEZRP
         jK4ePqxwm6br2knR5aE4jpyOYxD3bLAieVDg8iMlW/3wO4+6g9P6YJdNlCZsmuk488w6
         qqh1LiePn/dxXygT6WfHEScXfvDYw6sv1IznxYnFwZB+Et8wboQQiJiIjYUapRD0INR5
         N4qil71787o3L7GCqbzs1aoogbvamRteRfAVPEFOuCYKAMJhNuXsg0DTGV3aqvChOzX8
         /6dOzqnmhqxlEKoZpT3QbYG7raQ7uKsG/GZNUiTrpLNY31MJuXNfCh5Xy19MuOI2Nosr
         w51w==
X-Forwarded-Encrypted: i=1; AHgh+RriBvnja43LuLfo5t/lX3QMwneuDuLtk/ur7I6ziwlWAGTJr1nzBQK/TGCQbgac86yimCkuNjh5L+VhYe8W@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29J8VsNbNYm8ZQ80BMYkDjjan8tRxzAUgGfNs8SBJkQHoHnD/
	OXomyhqNYNnf25nUAVGZwArad1g7ANBOLb7V/rCKKoanVUQbyd8saGTglZxmvYBc1IDFABA544o
	Y9kGjrriZWem449WDl13Qnp9TXUCJyqleEP1r1Oz6Bu44rRt+GTNx5hChkoN3OzsDBTRLTHjXJf
	ph
X-Gm-Gg: AfdE7cltzTct7siIYuuXatStp4vfzqsoFPNbHG+Jay1IfdAWAcmEcFGnPx4g3CX2eaT
	GQfBk4X7aBsEB1LO+kAX7dSL35euu/2HbpglmUuDctP8oR3ZZGz4wdT/6YKP82taiaJsZ4pM/JI
	WwH8mTcZssmydYJqPXBw4Aco/ccT32T1mO1AUFXTbjLnGGuQhXmfybc4CI0P9fLW+wHIUaTGbJ0
	C30UjmT4fX7uTC9t3a15pMkhm7phyphVFr4TEE2fJpDslSJ+AOp3XQM2ZML7ZYGFycNZOTOAVwu
	fNGNDYoC2sO0GddAuJOMWT2otQJ/rqLnMNjvHv4H6Bv6bA96axye6N0YcE8NvzCt7McSCqTDr6Q
	y1Lmy7DmRXLOMq5gGGUwvbV1aEJAfq36Ahqc31rg=
X-Received: by 2002:a17:90b:48cf:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-387e0db4394mr1940809a91.43.1783417426293;
        Tue, 07 Jul 2026 02:43:46 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-387e0db4394mr1940781a91.43.1783417425845;
        Tue, 07 Jul 2026 02:43:45 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:13:12 +0530
Subject: [PATCH v2 2/3] ASoC: codecs: lpass-rx-macro: switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-2-f61b4622f97f@oss.qualcomm.com>
References: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
In-Reply-To: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: ly4P-kViIY3bHV6nJORja9b1ttMeEqeu
X-Proofpoint-ORIG-GUID: ly4P-kViIY3bHV6nJORja9b1ttMeEqeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX/N6sMw1Yfdd0
 sWmbm0qFXc5RQX4nIcVpzY4S4RLVAS7crc+xHzJEDB/YSTm8Yf8mwm7CwUPUNfeSJL6zsSexDie
 EdYJ8GrVLsnv948OFn1TgOSWGUAVH678sOKhLiRF5uDZ5UOrSnc9P7+p2dIVRUmq0V+AQBWvBLb
 rZWq6VM3sJ3bZdxuF9mIVKFkG6f6q0Ao9iDNHvLVEzJio4R1Ydo0yW6p/qLSDO4s5xeekfY5lHC
 b/nFyv1486OMn7ztmHfDNyCuEmeAA7j2ddIH/gmVl5krZIRyCEjPspG2cPwYsqgvDKcu0BQJsFR
 IsLlUF0N1MukprG95g1nGwZCW41qZZKMNbfu7//BrDyHXihWRVfa4jk6Ani4t8TTZOdgpdPyz1W
 HUbOcx4JscKonVLleM6PdBTnwN5t/btBD3RmlR4ZggngBGOAfRQx3VccAVW5yZElQ6e2dufhFfi
 ROM+auVAAXSKQ9KK9yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX7E0sF1I/8paj
 9qIZhse9CTtsbP8MQQXVA3DVVXOr/PtGwXbXNxhSsVu1mbQMSUcsLvsWoysK+C8s7QHgkOJDCjO
 9ezOGBUdZiMhnrhj1LkcH+vP9DR3khc=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cca53 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SrGOOKtgq2-mNKYMNKkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117236-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: D1E15719F1F

Convert the LPASS RX macro codec driver to runtime PM clock management
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_RX_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Drop the now-empty rx_macro_remove() callback since all clock cleanup
is handled by PM clock framework and devm.

Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 111 ++++++++++++++------------------------
 1 file changed, 40 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9f5bc6..927f75050c0f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
@@ -3671,11 +3672,9 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	struct rx_macro *rx = to_rx_macro(hw);
 	int ret;
 
-	ret = clk_prepare_enable(rx->mclk);
-	if (ret) {
-		dev_err(rx->dev, "unable to prepare mclk\n");
+	ret = pm_runtime_resume_and_get(rx->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	rx_macro_mclk_enable(rx, true);
 
@@ -3693,7 +3692,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_RX_SWR_CLK_EN_MASK, 0);
 
 	rx_macro_mclk_enable(rx, false);
-	clk_disable_unprepare(rx->mclk);
+	pm_runtime_put_autosuspend(rx->dev);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -3867,25 +3866,23 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_set_rate(rx->mclk, MCLK_FREQ);
 	clk_set_rate(rx->npl, MCLK_FREQ);
 
-	ret = clk_prepare_enable(rx->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(rx->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(rx->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(rx->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		return ret;
 
-	ret = clk_prepare_enable(rx->fsgen);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_fsgen;
+		return ret;
 
 	/* reset swr block  */
 	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
@@ -3902,46 +3899,25 @@ static int rx_macro_probe(struct platform_device *pdev)
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = rx_macro_register_mclk_output(rx);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
+
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
 	return 0;
 
-err_clkout:
-	clk_disable_unprepare(rx->fsgen);
-err_fsgen:
-	clk_disable_unprepare(rx->npl);
-err_npl:
-	clk_disable_unprepare(rx->mclk);
-err_mclk:
-	clk_disable_unprepare(rx->dcodec);
-err_dcodec:
-	clk_disable_unprepare(rx->macro);
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 
 	return ret;
 }
 
-static void rx_macro_remove(struct platform_device *pdev)
-{
-	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(rx->mclk);
-	clk_disable_unprepare(rx->npl);
-	clk_disable_unprepare(rx->fsgen);
-	clk_disable_unprepare(rx->macro);
-	clk_disable_unprepare(rx->dcodec);
-}
-
 static const struct of_device_id rx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-rx-macro",
@@ -3969,13 +3945,17 @@ MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 static int rx_macro_runtime_suspend(struct device *dev)
 {
 	struct rx_macro *rx = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(rx->regmap, true);
-	regcache_mark_dirty(rx->regmap);
 
-	clk_disable_unprepare(rx->fsgen);
-	clk_disable_unprepare(rx->npl);
-	clk_disable_unprepare(rx->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(rx->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(rx->regmap);
 
 	return 0;
 }
@@ -3985,33 +3965,23 @@ static int rx_macro_runtime_resume(struct device *dev)
 	struct rx_macro *rx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(rx->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(rx->regmap, true);
+		regcache_mark_dirty(rx->regmap);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(rx->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(rx->fsgen);
+	regcache_cache_only(rx->regmap, false);
+	ret = regcache_sync(rx->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(rx->regmap, true);
+		regcache_mark_dirty(rx->regmap);
+		pm_clk_suspend(dev);
+		return ret;
 	}
-	regcache_cache_only(rx->regmap, false);
-	regcache_sync(rx->regmap);
 
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(rx->npl);
-err_npl:
-	clk_disable_unprepare(rx->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops rx_macro_pm_ops = {
@@ -4026,7 +3996,6 @@ static struct platform_driver rx_macro_driver = {
 		.pm = pm_ptr(&rx_macro_pm_ops),
 	},
 	.probe = rx_macro_probe,
-	.remove = rx_macro_remove,
 };
 
 module_platform_driver(rx_macro_driver);

-- 
2.34.1


