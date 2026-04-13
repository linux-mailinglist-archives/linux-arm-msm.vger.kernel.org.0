Return-Path: <linux-arm-msm+bounces-102950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFmvNBrh3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:27:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054B3EBF50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1615B30247F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7B93C5536;
	Mon, 13 Apr 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5VxvLgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/2eqdUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872353C5527
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082739; cv=none; b=T3prpZZ5tatwYuYVuhBnCqDLZ4SqMfCWj5LXrDDsHm1Qppt0fW16ZKlLprfwjaFyB1la1tVPPZ59rG6bg5WFwWONuZRUraJad6gGd/2P5VLwsG+OTyamOVzmtxWKdXekXz5JQfuss/Utne+DjQzoKzAd070kuI1ar3StpBfobis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082739; c=relaxed/simple;
	bh=+XVvtrOb6sUd4M1mjXM60gdJnIjDO3h6AAaRAM6nC4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DY0iGlPgcJwf0TF2YQFXudcgnuUmBdTwcM8EoPCHF71AqQ1zHEA7d4Fx+Ek3Z2cUNbxienn7vE8hBfN3kY0btT9L3MWu2ZIQx7P9/RAoiZlSWlv/FV9h2ZPawwhtK1aKGzFpISJ71vT6Rx3hRpx0ZZ/0dIQeE0vvsMPeUX1QEzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5VxvLgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/2eqdUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7p3T71529060
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yns9nvbNXPM
	4TrtSu4abBOXjoeDxYcQDqoClmO9sAno=; b=j5VxvLgZFgUqhJ5DuLBmnI14xiM
	2084BIyrJ5+g4XkDiFu9CgEDXLeetRzHM6qBSLTCOmJqVz9sJkHbQkYLSwdamdbz
	MhmiHctx9ZYteKyNrrp4TH1n2CeMdGikix3v1CnbF4nffn+TMxJEdPZvoUsxWJsy
	iqsO/WaJlqKP+8QJg+9jGGXUtgaQLgMODPdwm/PeXe2fz3nPKha895sgs1dGzF/2
	Ato6GcJTtsDpSw7ZaIzDt6V1uvqSfRrKsIpjYIrXuayQZiRysVgDbwIU7LC3ekly
	pv58xFHALYeA0ztNF4uK/JGsKokcofp5kb9YJ8zDpJGWCaoGZj0tJ+KffGw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bd6j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60599e65115so1705346137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082737; x=1776687537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yns9nvbNXPM4TrtSu4abBOXjoeDxYcQDqoClmO9sAno=;
        b=b/2eqdUlJyVaduoR0Sjq4z1/BWKRCcP1lOToIyB7RlIcogzJAzMxZA0wNmpBbJiklX
         e4IutgEC6NB+vQEuhG17OS5but7so1mabI4iYR97LhO02yTQdi4d49Acv04KGKZpYU4O
         HkO4bsITKreJct1a+OTv+P2w25KK2HB3Jk2zjJp+FYQENB9tyhnXHfvfMM7ZXowMuT7D
         TXKZnaaEDLl20wxyZ28RwN/3qn2ON/wvcFNCfPpPXii4J8Gpfd63lAmUBkBY6RcBJiRg
         zCm8XXhks7PEKHqoMXXmKlCY1o7VqbLsgowHq9HjiF7TLVrIjFQg55pP0g9CJvj7vmmj
         zOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082737; x=1776687537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yns9nvbNXPM4TrtSu4abBOXjoeDxYcQDqoClmO9sAno=;
        b=DI9K7IqAAgS4lNl66zJOkmRkwmfKSnvKKAk/li+kVmGolqXSThmUj3ZmLRFdo6iwIp
         vQn3tdmgcsscAi+jaFmTbt6jYZ3jGGnmtjJnB21KfeQuyTRrZtEIH2riY5W48Du1RD6O
         h8ES0JzjH4qF5Umx/ozGRlSAMLT2yPaHOh0Ev8BjYdej8KA8PLWlU6Pei8Fh5W2Po559
         FfumPYN9+0wsLBezyEgt8IzcPOXma9IK6PZklaArY7fqlGA4s0hgRwPfZSt0AbhVXcUO
         /uM5t6npd+c6TU6Ue2vgWqZdjLQaKcIwZbFYrW2Gu/ZgSf1hpkT2DESDtboqEGOiY9qq
         FCjw==
X-Forwarded-Encrypted: i=1; AFNElJ+IBXZsfoP2D+V5p4EGilNJ9ySTsq3Aef/MTwkXB6r64rlaThmSR8EzGFOWNC2R3Bpj6mKnAoqsau5I4VbS@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwAdA+arXwq0tsihUz47u6HApGy2rAk/9YEe/rMB/wsbCoMed
	yYqWJ+SChXY3+tpYkmOku/Yk6OzqckeUt80yuw2ds8QrxyMNgJGkYB11DTZshwVhFmx/vuqxmiQ
	Rhu73bVESXvdimEEEw4eNpGbcvzrm6RLGjCbjLO9yuePTVDEdgJVGsZfk0T5iYYm90r+x
X-Gm-Gg: AeBDievx/QdEbWP2tI1H8M29C587/a6WpUFGHp/L1DCI6D8IFvnoK6IiZOIH4EhrtUh
	60vf6IKG3ezrrrTIrGcwmK2Pw8EFOz6WiM3MezVwdJevK9PeytsWNh/DQPhdECq59IHB5xglHVB
	Uun2C7yJpvPXmSdodYndri/5PIe3U59YnCQxme6UAVYWSvs2RoYWZlZjbUbWe/A9A1/Q2EkWMrP
	oyQyfEB0avbYiz7HBeB18OTi2nMXDQll9Y/hGX7Y0g/AVwSaU06YQ02SADFKjxV8nFE8Pnz1Ava
	4CzJothyHVgpRVzr/UkwTY+qZX4knck412dEfprtRFPThlIpTGVVIHZ1pU1LdLHrNPKvUqwEHSA
	rnuPLyOXw80CkJr5/Ao6hGGHLJkR8s2UPfmmvqD9ZdBdtldV5Yw==
X-Received: by 2002:a05:6102:3a0c:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-610123a0b70mr437426137.18.1776082736838;
        Mon, 13 Apr 2026 05:18:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-610123a0b70mr437408137.18.1776082736416;
        Mon, 13 Apr 2026 05:18:56 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568c185a71sm1449231241.7.2026.04.13.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:18:56 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 3/3] ASoC: codecs: lpass-wsa-macro: Guard optional NPL clock rate programming
Date: Mon, 13 Apr 2026 17:48:24 +0530
Message-Id: <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfX99gC/zRTvbGk
 g29iHEXXoOgw6lQgMawnz5UhtgpZBilDY5VSRxJRLiaEJiNPIEx8YSMFmE7qOWhko2ANrT45hGL
 hmjQ1HJmPyKTh5f2DG2AsiiyMf5OJKnNg46P6iTOtk/zU7uw2HSYimMg1EWmPPUMLnWjaWinu7k
 Qh6A6sVYi1FwQfM6jkprFthgxqVr7PGMJ+nE7CW1K7db/iC2ECRrwF2E/RYoOy1iFAUyvYLE8Cv
 /XPH8+MCmZp+ZBKJCXYVcWMZoPqxAxz0k5XTh54hU4sTDH+PT4eEQv7KmaEZX5yDynYpUxTXf7b
 EIPSLwYiseIkHZ5eEvh51VT0l3ui/N2SW6c7Lcl+7lVKWSI3qr3HNfnilmE/qK+gCGBZMcoV/Gz
 IfLd21+54/OKtuKXsflGyaJ2MqgQDf0rKBoL69w+0jDTbhCYFup31VgqOv4r36IuG2OZmcu9t4z
 1elaXF21dLV+4xrvLkg==
X-Proofpoint-GUID: TQfDhCs1v38JZ5nOqJfPUrsOPBoMZ_lW
X-Proofpoint-ORIG-GUID: TQfDhCs1v38JZ5nOqJfPUrsOPBoMZ_lW
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcdf31 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EF9g5WYaJUPSkAj6upQA:9 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130121
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102950-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3054B3EBF50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The NPL clock is only present on some platforms.  When it is absent,
wsa->npl remains NULL, but the driver unconditionally programs its rate.

Guard clk_set_rate() for the NPL clock so platforms without NPL do not
attempt to access it.

No functional change on platforms that provide the NPL clock.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6aa6c4d95..8c8c50a63 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2774,7 +2774,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
-	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
+	if (wsa->npl)
+		clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)
-- 
2.34.1


