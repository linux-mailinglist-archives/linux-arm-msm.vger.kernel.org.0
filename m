Return-Path: <linux-arm-msm+bounces-117237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5H6qOYfLTGp+pwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:48:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 633AD719F46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:48:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TJuNgvCP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZCmEaj3n;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117237-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117237-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04F26305D6F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EB53C109D;
	Tue,  7 Jul 2026 09:43:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6C3C060B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:43:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417434; cv=none; b=IwSm6Ma3OqETzGF5EVEoDmZL/VV3e9nt1wAvdigZjOwSjbhmxoeXEvOWgBax4iPE9exP2O+gDOJpAOBfafBMZOsrAmerCq64KFP28mhtwyIEg7y7rCctRZg6/TogbP8zhcc0ZB10ikUTB3kfm7oohbIfD8UUXCJdrevYIBZrlnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417434; c=relaxed/simple;
	bh=gvlfJ+GjIc8QbJcuGrmTB7YHNaI9OwwSuG3scOuw7Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScoMPmqrnBhebleh8tY+BhD9PtV120as0pOc/HEUDxf98i/eGLFiw8JZom0exMZKDLid8LPnfPvj+sIdVy4h4DsN5a491ksBAmn1oaoOWc49VbzseHo6wrC3Nxl3oiakRJ+7CsaRIS5BDXUUof5FhyVw4RQZb+qExBUaLFJFS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJuNgvCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCmEaj3n; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dw8L3070376
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XiCqGFPrKANfRZuEJahNsbH2lLBIkGTPF/XTZTnYXNE=; b=TJuNgvCP9ox7YyWf
	X42CImIRfLw3kY9Lbe59FPFvBFmErzknCC7Do8rrF502u02TV9zagcz7bG+Ep9+4
	LXMxDL3+vFUOGB7kdjeHrmvDGeD+kzWlLQw7Sz/6t+EXFO05qj2kZQY/ddMjjE2k
	kkPaYo9rmKWJvBboBpIKg5MFaFvZxMWmws6t1s3kPh3QGJEEtno+veVlEl1g82WG
	k6mpytfK/oLkrPqZkRELDw3FwXvT/xRx4RKrk1GRZCh1JSoGtd87HdoMd/X3j9U2
	p9baLmKP4i0jg5tWxtnX806T6YBgEb8390joWVwmnh9SoJY7SxJVq55W/223X9kL
	aJzI+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hbkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:43:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so61714425ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417430; x=1784022230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiCqGFPrKANfRZuEJahNsbH2lLBIkGTPF/XTZTnYXNE=;
        b=ZCmEaj3nBKdjNvqKJaJjmTDwkGWWuRi7CfDRIV+y/5R3UP7swN71+c3BjnK/BazRkU
         FyKKSd7NBaJ18TLccmFgLmGrP0vqdePUtFPSUONOFoN8W5OAKibrTJ82nAow7o6IGuqq
         uVtpncoiw0UJSN/G972HFc6Gqe8RDXMxQlhP3PmBQVAva+8XljcXMh5e0Ap5GBlrK3MS
         XSbuB3eV+3meJxiAni1hqOhp8DweNiJRBbMDuDUSzJbwbs/ql4k4EsvJVclRiyA9hzGz
         i/KH/0MvSSz8a+1RZZ24uuk+Rte9vR4JL+ZDEn4Jnp2LnAO7WZOW3bXINcWEHIIGYtuN
         SBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417430; x=1784022230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XiCqGFPrKANfRZuEJahNsbH2lLBIkGTPF/XTZTnYXNE=;
        b=MWdHDuJbMtNGr8UY6uv6G0+/6PYVWfqQO0DhSr7JVYna4crwt8IeKpC96h+XDbrwXG
         4I9y8Qer7EefBwiWHUzoz5Zl6c34S/pl1nawv1+BFE7JKfsYTLdvyO2Z98T8rWZutPJD
         Xt3cuh9idlKe4KPeTnjz4ToGyB1FWP2x3cU+3TNknJkkFwA+e/dA6JAZe4AgFJ2aQUzu
         aIPHDTumgU1uXoecTxpeeOgl0BISCymgewTyW6of9pXu+1t7wh1RnZua+vF6XP9ieKM+
         yfTxHZQ0lLeHP1fcq0ahbaD2VnV1viKQFq7rvj2XElAGKO3tkMtPjQ6ZrJ4s69QqCE/1
         jlPw==
X-Forwarded-Encrypted: i=1; AHgh+RrkfgfSEoa/D4iTmJhgLT1FxvEU+oixscnoYLe/mwFh4eB0pqTs3+dv5heWg/yWVYFK0E6bxNmFoDPPT4tC@vger.kernel.org
X-Gm-Message-State: AOJu0YxOz1z4R/C4LRiqvZLxrkD7aHmVU5Cb6HkG5g0NHShbc/+HOFXj
	CkdT66GqQ+h1DtomfJdWEVGj/XxkREHLuvI4kNNCs8n4Qey/PeWbDF6YklRDwKj74rPNR6CY/TS
	9IllclQY5OLvFmoiZY6Bv9N6+kbLSp1WA4ci38gNgWSUwr1R3EPp++yas4kmFMn+IeaoEXR56fG
	qs
X-Gm-Gg: AfdE7cmg09fJYExa3TuMEvgXlwZNAXrGTl+wDxiUCuDqGVU1CGXyunT3wnKMho35Jrn
	kTae5QjSN15GNbqV8NMN6Vxge1/4ypZBzB7iQbXcx725UOHsPdl3vTWUexvxxJQ9KnDjDEcqHpq
	XJVm7C8zxIb2lq4Yh9xOPIbM3+mXfJfM2eMKb7rsdwMZGxMxkVeZq6BiXLMY9+w8e2BvOl0sQK7
	cAiy10+7P18B9gipziJjxHMhfciWIpK1rV5efU1AGr3qbmfnprai8hvZR1E7KgmgJHb24P9nnPI
	r6Mzgii0fWotYnl5KYUfabfaiPEDcy8+wbibP6E3a4MMO/jb9+LmpF2UP+oXHqEVZZf2TUP4qeo
	VnqBEPy9j+a7sAYte70ZfP9+s2fDzdo7kQZt2YHU=
X-Received: by 2002:a17:902:d54d:b0:2ca:304:f93e with SMTP id d9443c01a7336-2ccbf07b157mr47459735ad.22.1783417430251;
        Tue, 07 Jul 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a17:902:d54d:b0:2ca:304:f93e with SMTP id d9443c01a7336-2ccbf07b157mr47459275ad.22.1783417429771;
        Tue, 07 Jul 2026 02:43:49 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:49 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:13:13 +0530
Subject: [PATCH v2 3/3] ASoC: codecs: lpass-{tx,rx}-macro: check
 clk_set_rate() return value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com>
References: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
In-Reply-To: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX7ocJ9SHQ5Sg6
 586y54yqOrcRjy+fNSypLXx+zC8f3z3nDGl47cD8SLmcpFEaknUROEr+FTvbjdxYVb00RsS2GrP
 w2tudKCRM5uLShc6qlJTaHX6I+vqC+SkDyjBcdDLC25iJHoZbATbMdNpTUWRYISTDH6IaTOhPJw
 TjOii+CeCpZnoeGdkgqAAf9tT//i6EvJ1cENo23U8tA4+hC2jNk1T/6Ez/M++p2I4l9VQJ85DGC
 a7Rpd+gzddDDinJfZqkhI3ZCdhmbgyNNwoN6X5ilceJT3kibqTUsjY+nIyNuWGC9NvjUo2wT1gn
 PpBoep+CR+Oy2Dfuqe9ohrp0JUejco058qBPJ0i6XEBFPo3dxNVG2wB3y91On73WeqsN0E5GeX+
 aSfKPQXNtiZKes7yOfscRKjCPvgvQDW6DB5z6LnK/6rxwXI+t6gTq5hSWgqjtDrDtil1PXC9qWv
 sYrdrKAH5HyQG0nhUMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX6DON//Xnxfds
 PTK3Y0+1/eABuqABLaxZZaoopSAwKobyYXbv/MFsDrQZn6fOiQ5tOqgG0MJcQCdymelC1TUGlFT
 wtfLVyvwCoz8py6H68rmBGrjeMHie6c=
X-Proofpoint-GUID: T91TJWzoc8qXlOfTZcgrdGGvej5MMkE6
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cca56 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aH8E-B_xiLpXBELwRnYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: T91TJWzoc8qXlOfTZcgrdGGvej5MMkE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117237-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:ravi.hothi@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 633AD719F46

clk_set_rate() returns 0 on success or a negative errno on failure but
the TX and RX macro probe functions were ignoring it. Check the return
value and bail out of probe on failure.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 9 +++++++--
 sound/soc/codecs/lpass-tx-macro.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 927f75050c0f..388cebf461a3 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3863,8 +3863,13 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(rx->mclk, MCLK_FREQ);
-	clk_set_rate(rx->npl, MCLK_FREQ);
+	ret = clk_set_rate(rx->mclk, MCLK_FREQ);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(rx->npl, MCLK_FREQ);
+	if (ret)
+		return ret;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index fc073a556fb5..b56605639a24 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2319,8 +2319,13 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->active_decimator[TX_MACRO_AIF3_CAP] = -1;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(tx->mclk, MCLK_FREQ);
-	clk_set_rate(tx->npl, MCLK_FREQ);
+	ret = clk_set_rate(tx->mclk, MCLK_FREQ);
+	if (ret)
+		goto err;
+
+	ret = clk_set_rate(tx->npl, MCLK_FREQ);
+	if (ret)
+		goto err;
 
 	ret = devm_pm_clk_create(dev);
 	if (ret)

-- 
2.34.1


