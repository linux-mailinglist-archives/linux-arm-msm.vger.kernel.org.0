Return-Path: <linux-arm-msm+bounces-103752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLaUF8Ic5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC442ABE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D83BA30903C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CE71A680F;
	Mon, 20 Apr 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZVnKx6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvQJTcqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D92D22301
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688253; cv=none; b=SrX5i5foh2zLDDoIv6K1DKEybS2wEMLvORafZAQYyzME/Mm+kBkQnnRPYa7lC+2AKIkNPP9Euy17F2dY/fl24QXG41nC3OuZVkQW+ygrv8ByW8/Q9gy/+UBQ0gb9publargtlPGK+/OhAgpk11XPYR4EOBXUKiuVtjqMTfACX+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688253; c=relaxed/simple;
	bh=PA/QvOlsC0u0/qbxAcT5gkNdGywkpZrUjPHFiDBLqbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tkZmoiaRt7c0ALS9w+klsSV+LhvljDgy1xk1TUOu7M/LHEc3OLRZnJG/YKNtOzhDbV+2aaOa+dLZbY5IMq9qynF5p26l/nKP3Xw01kkx99FZcxDtSohY6voTVx7QBceeEH0ymTfDrf+pE/CrGe7m9jbgaNLDmRmQlLg215Cnazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZVnKx6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvQJTcqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97EXl2755820
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S/Qeg3RgPaB
	xLYXsfip8wmrQzxBx8ciePjzK0KBJRGQ=; b=dZVnKx6gR+f3uTBkOGa7lWvTbrL
	nw8nVHpSkdmMsYf8o1hmDDow8x5W+XaFQnKQQV7mGCU79sZzNFKJd7iouOWNzPtb
	/X0D6zv+siqaNYLtDaEueSawkpUy1QaSJRIkIX1v2nvLk3KtpPGLJ4mZbeKR9Om8
	+JxwKqXb+VbPkayDCpl/gzaIJxHNd2/IulGXIuoPu6DRcJq1yQIqVQn/fuSmDeI2
	bkqIaB+KRFOg1u+bI8LFTJGhwqP7LbKvvdnyT4dIEgc0ZCA2v5zmtgXHZuaboRqO
	mWZjoWvk6q4zefKO2ao9DXsrn55k3QzAT8n+2j1VZBES8PBm0fwNgEDX1kA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xgnhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:51 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7900fc7033bso67384377b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688251; x=1777293051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Qeg3RgPaBxLYXsfip8wmrQzxBx8ciePjzK0KBJRGQ=;
        b=bvQJTcqTi1o2uZPgcR/QDXlFXuudy8NNchYER071yVXXdXR63CpcrGlvn0gXFf7oet
         T3WrYHzREdll/wIF/HNtjrONrv9AaZN0KxAltvmP3XJwjX/FQVydYM6FG+O3p5W1VfAA
         7f643xYdfyITzSqd1v54KOpdYyyffWIqoXhqBap2Moktxb+fjXc9KOpYP7uTYzM0O90U
         xUpuYUFOmW5rXkLwNwYSuUdCidA4PoeG9DAF1RxNCbb53sMbb6JhjmFSad4BxuBVLRj6
         93Ksjqn9yAG650rX1oErSkCOP9FLojYc+CKkBdW0mZHL9iOVrNh4Vd4BPLTLISJwh4Xp
         EIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688251; x=1777293051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/Qeg3RgPaBxLYXsfip8wmrQzxBx8ciePjzK0KBJRGQ=;
        b=mQpPfOE2Hk3LbVMflJffA2YVEu7yysRmmNdJB5J7n1f2md0f1pBgnBbLQtlEl9CI/O
         wWWeOlzmuFcmTlBIWaJkiwAcgkSrIq3vH5VvXraDvJGnCfDK0QEhBH1VfNVMKQTbJdpc
         /plvPujJQz+LwT05UeKK3lvFfs7l0njelfhev3dNX5kzy5DSTvG2YsL5ZMHnxmFQ0Uv+
         el8peFM8sveCe//JM1vHfuT4P4RExTcD+748YFgVJuo1W4qSKuOvlcMcLS0EFhM6oNSv
         1n1ZXS2wb6fDzgMZJVZ0TzUPX7N09vL/C160f/jg7Ihn0vdiStBsoXk4v32p9kY5CSNr
         P5WQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HNWJuxO0cGzqgJC2avr2rL1ZvgZQkoNZq4k/cmbzU7LLaLe1I55PRORAzcWvSiE3zugZBwG1KiaSt9g8D@vger.kernel.org
X-Gm-Message-State: AOJu0YzG9nHYXGfdyl3B92shtfNi7O4l851k1DJRJzvYLCHRw8wzMlDB
	LWwD6BvNcc0l2vjOaTuGyD/VfNNsqvX6936tJbkndtqTzzXrlomcv6uuWjT6yvrzj3YSi28c5vE
	QzZJraaLFnYTmxw+Nqcw3c0mPA10PGaEEBdcRGDN5dIQ73Jo0jY2//nZSca+K0HM8QboX
X-Gm-Gg: AeBDiet2vfR3AJ3ZhzLQfFmLog5NosAPtFmf0gtqUmBMzA/efhV15F7FisCOuERwM0R
	e4pZBv4fEywdYKpg2h5uR9GsCnK3kgN8yvElO4Gk5ejQBts4RawXFOrCRJ5spCbeshKk6PwHJfF
	lkZHJTff1j0ftbvFLCeZ6t0CgTN5pbs6RKoLh+121D5raQSkquy2ZgTXGmlQuEQVBG7FmsEW0sF
	xvjEBGFKukupd7T5gQQlPGnQYQtE4TINoU9H0nCWpPtgRNzGD6J3XCj7QfwEUo411gWcSfc65SQ
	CgtOMFFdURszyei+NGp0kmsYraoPPxYl6E/L8XUKxfYh6k3ozvCf4oZtY6CKsNI+xxblnQWshBt
	Tsp6vcbieebd1mP4CIYyPvrOFPJ9Zm8ZWoJBgj9/f6puFseac0Uenyn3BkU3Z
X-Received: by 2002:a05:690c:60c5:b0:7b0:4bc1:d713 with SMTP id 00721157ae682-7b9ed44c8d7mr108157407b3.23.1776688250830;
        Mon, 20 Apr 2026 05:30:50 -0700 (PDT)
X-Received: by 2002:a05:690c:60c5:b0:7b0:4bc1:d713 with SMTP id 00721157ae682-7b9ed44c8d7mr108157207b3.23.1776688250442;
        Mon, 20 Apr 2026 05:30:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Mon, 20 Apr 2026 17:58:43 +0530
Message-Id: <20260420122843.327171-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX32Oj5W6Lz4OA
 t/BvXRs1bLQp3IGl1PxIFn1nqy6TOqyWoL9eNq1Ix6RFTd0AwFF7qgWspL4i2jplTORCLcNxuyH
 Sy5Av5IZuDyWAJtORBPa67SOpci0aA1uBnnTt81SkRC298f/Q8RCmirK+SmOw/Od3LZEX+ExVLa
 nfvfnSQhom8wuP5zZkNHFTQvtV87mIJrvm1lAA61LS+sz6rmORPsjJyLeHjJm2CqZvpUWk5rX6k
 2R9Pmj6w5K4f/6vMBMXCz6ZVYuO6GJ4OIDSzjqbTIymXu0ymSsYbDH4Yin1uBUjN+Px35AY0nmJ
 NyV2Jq8s0Nz1wlf2TMqGH3K546tgc8viMTky02RzPQDDnzuDA25CRWNyj5kIcDocmkb5qJYCxWU
 tzYLbZ7NWjiS0lrXMYT4ZLaANpnZ4QI5K31QoT3UKtSTtmC07oGzbIwZAMTn4HLWlCLW/FUnP3m
 1Y2sTMzLttPIaDNKMUA==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e61c7b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: MLElIk7BXwSOWj6UImFOhoNKYV3dAk15
X-Proofpoint-GUID: MLElIk7BXwSOWj6UImFOhoNKYV3dAk15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103752-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2AC442ABE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This avoids lifetime and cleanup issues and simplifies error
handling.

No functional change intended.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ded1cd8db831..29c8edfa739d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2657,7 +2657,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1


