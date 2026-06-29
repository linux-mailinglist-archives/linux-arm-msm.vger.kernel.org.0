Return-Path: <linux-arm-msm+bounces-114965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ua7EONDQmph3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D410F6D8AB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZCSU8u+/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hB4gStCv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71C34301B833
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2224A33BBA7;
	Mon, 29 Jun 2026 10:06:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD73FD134
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727580; cv=none; b=ikoE0Qy2qaY3BqoA8bnajWmJq5n0dBJfZDorFrrC8n6cWDZ9k42IBLlpnI2/IGQtY9wzmNi1JiBi7xX8Z6iKtECBU5hOUC17M3pC3OTUb4kBn14wfGoHU/zS59M8pc+o2c+2cYTwxYjBqxQa9f9EAQZPwBc6fiKeTiHOhFXhcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727580; c=relaxed/simple;
	bh=azyjWX9qq1aZN+xF8XDJCutJ/ZDvQfovLJoN85Gn2Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESqfHPL3gfDHB546M5MeSqNF2/EMYMs4/KroIYMjK6lkpf2jCA6t9jElVbstJNWgWdYnwYO/C3xVIKT0WIC8y1IiBjRdxVilh6Tgefv5vd1U6InhU79mc4SVjBR9N6PE+RrsX8Ehw1zXIfB2XDW0QVNVJkIzyjjOvd4VhO1fBg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCSU8u+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB4gStCv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T904E22433806
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=; b=ZCSU8u+/jMMoqK/7
	TuayLylSk7BBL8sA7DHm2sGGHRQACoA2vxr/IcUz6aI1xQdRIkTq2p9joQvM6lhs
	v/VsKI0Z/afRmpmUuYEiQbWbXEOxfMDYlRC3bUyZIxMb1i6QvpMwo31mOz9HAHhi
	9fnuukAENN+hnM7Z2+ih2TjN/jFaT3WZFetKXELdg8CU6HOGT3rZCOoD46BGk4WB
	kchqNtCg7rEUePKmZzHw9RYt5J+Y3yZRqR0knjJ5YdinjJVgLo19iG9UCF2ErjCz
	fD6tXTrTZyjrHfqKag6WN1EqTwL1OVnV8c1SgxZPTfmX+ilc2nBgk4cKzBsurMVd
	pzgMuw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper9mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c80f89b64bso42212695ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727576; x=1783332376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=hB4gStCvp7oZ+MRBqzqxTj4N4yCgPQNjrbDQ12bWk395GnL9P/1eq1BLp9UF5+L4lQ
         qVNSerX4vEEYQrMlQSdKmUDn6K7qXspmHQaYwgejVrIerhw6fwEYPTyghriXxj1ZlGCN
         h09bTQSAYfeAWXxQ114WfT8f+csnFgdez4ceJRAfPkgUBuRXNjqjjp3kbtL+cfJCsFPF
         WeTHgnRrgigXc+lsXsg4v1T16/P7tNA6AWeXn1QBLqilGQH4UB9dOLlnH2hqDYmb7vU5
         soeZvVFz292whPi4RkfKPMClb6Y5h2AjYhVzWbUwo83J1QATO+86mPRbDYnOfDWwZ/rr
         yscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727576; x=1783332376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=quapNvFfAp/5dDX9905/xVdc03aK/q2yozVvzAKJm2DVT5bBU0FF1zRSWzvc0fsHYw
         T53I9rxscGR+vkqtmwWi+FGdWkXO/2Sf3HliClFev5k7KI66nLHOeprE8suuavIzyba2
         B5MVNDs/+aQd7kZFtTeNiqozmQrfui8GJS4oCSFJLwJ2AN6/K4xrcUHzajB0pY2b1K0t
         YiH4L59jx7Kn3GrmPkt/dkNwhIgmhxZZUngz8s53THlxqw1T6RZNQrCB75dufKGgHJsN
         b1ndbCfX/U9+HFAZk/D3veoc1vkf7pdXXDY+SsOIqWcv+x8YNKJBWUSv7GKFQIse1AIw
         2k9A==
X-Forwarded-Encrypted: i=1; AHgh+RqoA0897/6XjT0gFZluO8Cb4oW8Gs7KboTIC0bhEYpsYwm0W8eaBAP1pQHeGQUS4oPlvPd/Rwicy9cIAABX@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPYeFQkkag0CW7dJNTomw1Z+tlCHoo63/hOl3+IPxHROn7cyE
	WWJq138EORfMV4dxeuZ/rJHSFlFlSkTmp0jilxrwPgzGWfUdMOrPfkiiHekhdoM2vY3ha9itxCy
	e43ZODEcg2aZaDrO7V8edhTpx21iJLMQjgLb2bXcTs3aATniCIfXU1yYp5CbHmHfPTLLL
X-Gm-Gg: AfdE7cnxeqndiSrD0jHiPg5YwqRsrAjlUHeAx4cCneGVzSDGsW0RxXcjPwyo05d51Mv
	pRxdB4ZQbY3bSP5Vc3cYmzAVWKQhcC+c3D7m+6VpR5OuPp6ydj1Gj7ppiDQN4dGHhwJ0nNBvnOZ
	7XnUokaEnwq0h3vuENOr1GEsyltgI1oVly6G1dqJLy2MpfmFISOKNMrfNq/lo0DOOO4VVKrkPh4
	yRGIaPJA7O0jrf15SLfUKxp8kH/R3D9+UMy6xx0+wWT6YiKtRy94kMUzScAGwer3MvNLvAR4HeC
	kDjWVUzmG76ddKiUYT3MjDyOQSdoIKlwheOU8YStvuvQDV3xcqXm6ME6MbZNVmuxPFJO/LN8rzN
	x0hoEjde8ptX9wSbn90xOGT/Rr1QaoCMQAOOaBsg=
X-Received: by 2002:a17:902:ce02:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2c9c57580abmr51451325ad.9.1782727576106;
        Mon, 29 Jun 2026 03:06:16 -0700 (PDT)
X-Received: by 2002:a17:902:ce02:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2c9c57580abmr51451075ad.9.1782727575697;
        Mon, 29 Jun 2026 03:06:15 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:15 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:35:40 +0530
Subject: [PATCH v7 3/3] ASoC: codecs: lpass-wsa-macro: Use
 devm_clk_hw_register() for MCLK output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-3-fb37ce457c42@oss.qualcomm.com>
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXxvprBd3cvchL
 ruvJ36YimUuuGXp2IPLIpkKdOQYNZ2JOZAIpmOzGSYUm3mHpbewHDZWcm+Hu9nbiXOf93OanLYZ
 u3fVrZxz2Z03fqr20X0RQeZ3YxkhRWnAPePj08lHJvxpgdeFSrEb8/YboifWfgPIRBg6xxUV/9W
 YFXyBPwN4f6sCz3f42c2NcPQArWWppeajlyHC6SNPqCH0wj5PqEV72e/8zdxXbBWsjcv/D2cUem
 j5tuSMxy7fnDpS2kme9P/wFgAxKRS5i2HIhb4W7ptULxc6Gj2BsFfF3ckGtdpZ8xJrf1qugGmfu
 eYnkeVLZ4rIyaSbHUDzj2YMcD6emo1Wpz3Lp01yjHodOnDxjFD9s3lTcqDcAtHnJGx/HbeibSYs
 vnOSl5vuURgKOXECRbim47cm9nsxZCgLmOyRCMuyUR1slSqOHK9rmq0qKS9UitF/nXRDXrHaksZ
 b3LlOy4lKlkAQTy4jtg==
X-Proofpoint-ORIG-GUID: ZBlkoo5mzEiPIi2H_uEgvWmdAKYpexwU
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a424398 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3zrE_5izju647JJH3MQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX/Tfqu3VSVRRm
 ra4xuMwOu3XMekMWcL3r9T4WrLaPRIuNHeIg7vBvCptGEqAa/84pWuvm9jic3nHg31JGxa7e0yB
 fs9Fec2KOhro84IatPd8hlBaaP5lsVo=
X-Proofpoint-GUID: ZBlkoo5mzEiPIi2H_uEgvWmdAKYpexwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-114965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D410F6D8AB7

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 718564ee381e..f511816aa4a0 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 

-- 
2.34.1


