Return-Path: <linux-arm-msm+bounces-115777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7BcgF59gRWqR/AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 20:46:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3B6F0B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 20:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iriWx+zs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gmBZPvoL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115777-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115777-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639CA30C72AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 18:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415B7395AC5;
	Wed,  1 Jul 2026 18:45:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B82386541
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 18:45:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931554; cv=none; b=W0Tf/bASsTWGPZ7ymHuj0ZBiSNkmhxiPJCPHopBS0TdAK7df1gMlc8jzQIWj9cAF089I86uVPkmRQpq1nsMPhf9w51jA+QCwKUhIhw8q7YnDhvfZXCteszlq6I7YBAhWghJG9uDUFRcC342T8EyfDvkqENwyJYOUZgdpy4GPZzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931554; c=relaxed/simple;
	bh=azyjWX9qq1aZN+xF8XDJCutJ/ZDvQfovLJoN85Gn2Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEzLF/ZAn8VtR3N35uJDSjRVZ8chmi2VA3T5V3DlrWNYe+7WB4JfGHB+15AzkB4rb43D8IxvmuTPJwwf/c9dT7V91hQoLSrolZi8JEVGDx5Kl/AlnnhWdSgdM/A7T9sB+5hV1wbk8BBuuU5wAxPcE1NNL+ICxtL53AMCRXI5EuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iriWx+zs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmBZPvoL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmgVv1708059
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 18:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=; b=iriWx+zsmazoscfq
	txSE+x7HhfB6MCKvm4Z9Q8OoJIz5EQEotW9Mkp/zHp1oSyh9qrx7q0uy0cjvbPnB
	VCzhOI+PTjEqT+qJgvnzIjhJcwC+WHvRU+DfZsMtEJkDKIVp7jTXP1x5gFssan17
	KsuYjb1Yssev6LysTKKltQVwYCGehbsJHo8tfvso3dZMBDTWsihnxIT9YhbBgPSG
	RDy13F6jed9QDJZ6vd0SX/3DWDdtWQ0ZTQttRlVbYLgJv6L5ExdLgxh/Utnj8wrP
	BQrxxVsPx3W6AxTJDKs0x6q9vR2D4BwdPfMbnEq21ndRrJvUE7PbJRS8xOUKJoCV
	Nh0lbQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqtaw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 18:45:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fee8a7813so945252a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931551; x=1783536351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=gmBZPvoLtpVf/QiTLK/dPPq8kW9vKHoc8rS29uEGsdRxEWi9DQ3c3Nx92mncMx818n
         gdA0xo6W/WlpYjalhKsszCLv4dzxRX74gphXsOEF1wZJArB3B6kGD80LjkytHh04Xg42
         AYSHkcHkKkw6G0k4cXJo4o//LL2Gc28pZ4COkiyyEx5zgp/b8/OdB95hU6lNE9veAWdJ
         drAVqabVO0DZPHJB26pxkeHY65qwAa0W+v5ih5K0mN5U/CIker8h/NVVipHu4uNbNIwX
         8GvcBbOPzgmkoNzegk+oIOqzK+unTEsZsAoxhkk0w0BipgbYedphUdaILpCQNLqqf/jj
         NYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931551; x=1783536351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF89tTyvPBRXppdcG2lsdi3s8UuXsncLSytB3XNQiLU=;
        b=kETAkwU1wOKeBfUtVqVTjjv5GP8r+yzmM0ds+xaCmcmnycde5vpBE8InhfsC8y0GZ0
         tA0lW6xjRU6aYOhkzRXG/b8aMt/RzVO5pDHyV4d3I4fHzG3jJ2lA/O1xbXbiUXa1TCmh
         ofC4VJEJjqQ1svuxWoNbNFzB9wGYUMkKzyBxhNRjNZ65f6I0UJi0Bkl9jwROPRkNYGs4
         /+yYJqp+hXxBo7BTsu3Mih+Q8NMckhvc8oJB3bwsiFd9lHDvSDv3J4m5IIfa3U+CIQlr
         v5jEOcC/HWL5X5q+PA5Y+U41LptR1ixhCqciT5hg4udHMrWYQlF4/hn9Zv6wZu2F0iQp
         wO9w==
X-Forwarded-Encrypted: i=1; AHgh+RqSUEqJiEs/M9YXARNa6ZzrKOZSYiL5NNQqY3Xvw/jCUhPxlUrXn5w8HuYO9SWRR/hExoTwHGazcxkp7+9f@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpfezECUIK8r7fz/IT+ml396B6CnuvHef76RHwBROVzDvJqdG
	WxCFHEeOpSFGimerL6dbc/jEW8m58vxMfbM7OKjiVxuD7KHLjos+2zKnvKJyDGjwNbi6fe7Wmx2
	psxmBpNgL9x6hC62P24VzLP6Sa46lesqvCsKpysd6+KtFBxrVDKd9jB3SJxs1EJsf6Yxf
X-Gm-Gg: AfdE7cmad0i83TzvfshHCDCtRlZ65uDGnD/NCaGMruM0envPuyQwPoTMFshRtkBspQn
	OFZTlxd6q8xZ1+Y1rAWnlEIcKVELo9I0tGfZ+SlShWpU1BDNeKKCNTPFtt2bJTdgJTml0yE89oe
	jqET4Wa1aiWD7HPf2RymsBhHrxfiWjhZ9E1RIJThmySzNJ4ld4vc7m480w+Xhr6HLWh110PKXtY
	rTkrEQMcuSKxsAegZff4Oq2nTRYjw5JKLjjSnjENpdv4d/WOUP/iTulY4QtFUCSk3zuSiOTWQuO
	x7pfVaAmFbRfNOoSgbkQNiZl3uztpyqI5J6jzXOvEKKNQ8TCyWVS6NCdurJ8kSiIpEw+xknYcvO
	OKx+4uExK1buudXGtktFt/KNEhJT/K+vGmf5VcP4=
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr2942997a91.13.1782931551102;
        Wed, 01 Jul 2026 11:45:51 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr2942952a91.13.1782931550605;
        Wed, 01 Jul 2026 11:45:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:14:59 +0530
Subject: [PATCH v8 3/3] ASoC: codecs: lpass-wsa-macro: Use
 devm_clk_hw_register() for MCLK output
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-3-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: yO5G1G-LN39d-f-zxfjvzj6FayM7Kyx1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX0IAsQ3nG1D4g
 JsjU+ji3NdQBmQWA77/vMAGNsI4kBAvwgR4Sr5PLTq1lk+KV5ucLUK1isblQwu8iFwVq2AICfLr
 rOwYYooQGiilY18JXgtV9PDQkItGsrI=
X-Proofpoint-ORIG-GUID: yO5G1G-LN39d-f-zxfjvzj6FayM7Kyx1
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a456060 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3zrE_5izju647JJH3MQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfXynuBpH0oPFt4
 IwmBUfHjx6VauPPbOLRipCoN8Gcv2msvJOqBkisqgofUKnMERoZNjgVgdQ8iuXZowAULFg/OZH4
 PiPRH3Lh6JS/pmpUmGBeWZVegLfKCarFwLjv9vZoQ0LuqKAMj4ILFprTSEkg1C9w+ppuC/AekVq
 AmCNLeI2MSRsKH2BcoYef5wsx/fs1ncjfldwSipiRn+XaUGQKqMkEHuJGgKgTWoRiCHfuRItOhM
 qZFhpQ+8NglDEV8rsxlJyitB/7CEN9bu/RA4qHsZ3rHCAlpQjzdBSeR2G+IUbzScSfN/XOC9aTX
 1pUzRXnurZ5y2pgyW42y2P8zTYPklWZMPbiDQMI9ntmqTyXIaktfB/8Oby/F8ONPxLuiHKd9UUb
 cfT7bV00NzY5e0Qcc/f7OSzjIIbJJz84BCIRh9ezgxB4+CfAL8dQIU70vRyUtecb6/stxtk6xh8
 OUAKmDlrQ22X//p3GxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: ADD3B6F0B0D

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


