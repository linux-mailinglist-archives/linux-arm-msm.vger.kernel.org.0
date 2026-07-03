Return-Path: <linux-arm-msm+bounces-116201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AE8PK7lnR2o7XwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:41:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7CC6FFA80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WKMeha4w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kvw61o7S;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22FF430A3723
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F190036C9C1;
	Fri,  3 Jul 2026 07:35:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB2C36B043
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:35:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064104; cv=none; b=HSY2LfVkA8QcFQ0TrvqOqLJMFMs5sHJoVvUAcOjjBwsCIKSVXikl4NrsITUaMVzGbzdzSED1sZR0VNEs2F7vxEZqdu3jJc/JeQB5IrsxLWhc+wulE0okRfcwfz2K+x8w5r2M2t3A7NWx8cLboB+17Eunhd4SZXeldZPzz/peRQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064104; c=relaxed/simple;
	bh=79dVNdfYRtUY9tNY0FkFa+R7mNAh8aDGXsSsSqtHx/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=czZOOS/mBxZwHVnOr11NXAnRSEdfVsbOq258Do+vQosKAeYUkJ32RqaAChY8co+NfwPx19gOfdIwZfMKRKMLrvHglWevDWE4zFa69ZBwiuCpc0aW7zdlMQkniGc1NG59Q3qEc7IggOg16pDvT0Gh67PcQbKCTya/sTn4KSFy24U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKMeha4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvw61o7S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636hNpc3144575
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zb6MyzKfvre
	hVdscWJF46oi4pZRv52M5v05PzB50DE8=; b=WKMeha4wyLs8teAthRIIGWiyTlH
	XgheJlbO8RRygwbAQ7/CDurXvetN/A1Z/3ItUYXZ+MEjyAFGG+2ZOlDkgNQLhLiO
	0QZ3Qh3uAqw5UUEsUjuHxZKk8kpoSlj13DtVDNt2lVXkUfGxJk2qtN2+uG4PBu1H
	UW25Si75JnT3kEMPdKNHllNDoA3tWmWF7cuVcDEZfcDgSWHHO7AAtqUbcVPl2jJo
	OAtRlHNcXGyGmZnh0Itt9bBefEzkbfScCWv1acwML6pH1koIlMmy0I0DB2gkg8Nx
	/Q2BFX5g3gJC8DZrZzEt+OfKUNfFyBW2CK0ED5ZXXnnWNm9F6LFApVh88Gg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682br6te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:35:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c82843005eso5063615ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064102; x=1783668902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zb6MyzKfvrehVdscWJF46oi4pZRv52M5v05PzB50DE8=;
        b=kvw61o7SdJqghli2ykSva9GrymIt2OH9EPHqURWUNg2GXbnwYAj4+TPGJ0qdQlxG2z
         rtcQs7ZqM7PPFK5D2VY8eehWXdDn0qJGoK5YD/gw+JgjJzk+nkrPyj9zahW2Wm+5GeYA
         b+utjVKyb/yqADKefBtUYM+f9E5whZEzMxvARN2pG/Y01cD7Nvy18gzkNE+OGe3nbBG4
         3UE5kipvMK8z32X592UUOGlDHwydAkWMdi9KSyv3qECFl8cDqkTaGO98+jGjbJUcu/f5
         idxWgqJ+nGwMCRHlhB1+VGg2w+WAaluzWdcF1m7VCOOasBjC2WzYp/eRpsSpMcWBvffK
         8pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064102; x=1783668902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zb6MyzKfvrehVdscWJF46oi4pZRv52M5v05PzB50DE8=;
        b=Q5wGBGvsrxa4DG7q239qXuU1lp4wRlWyrNsLyT7xvF49OtrvpBXJ4k/SusWZu8ZVza
         muAvVvlOBeZwLmu24KyU1PfEycpXjuNlI271kryw8HJGyS17+DIVqFzXokVpwUQ9ClWN
         pABy/FT2YN0HaiY2x9h7b4MNU9CChvWdSpSwGH2dwKkVkMCIDeNvW3KSImxMkjFOxDFG
         DNAqKqxqnRbulPSHpxLtls7ruLNY4IUrO05nPC304WiBmEdF6lAjnT50pNaTi+VGMPhx
         GlOanOt4UYPKqyuu44WXGmkdomYwhqBYmlq/qkxdDYHo/HTtHBuWC0VPB2I52dmJDX/n
         Or7w==
X-Gm-Message-State: AOJu0YxaGKj69kN0+ZiIXAnTwBMDqlPvWyOzppElKhC31OkW56Edyly6
	BYM2HC+CPXMdXC/vQhNS0d1RV18vefGkP2YXBf5RH/UApHMz/TlsE7PhghdHVgU22E6hhYwSDs/
	1zuUkOyzeLUAC/gWH9SLGnIqBRasr9nVcPX7xQMhU/Uh9oYskphAPzgM8TVOLrTr8u6bF
X-Gm-Gg: AfdE7cmCRSnU5xHHPVp6rIzO5yW6W1b3WaW+n/nO6x7z2CUqHpXRFv5r/oaPCxOVXEX
	jbyMWlhlOmlv+sEgDWmoWFM/aaqpXsXig9eIKDwwZ4AO9JwvLPLE2g4mhErN/i0tIKA3qy5syRW
	nImIpS952GXebn2ZeVgGNpY+bAJ6wFCg258IvJAWNDp6EW4oZpdzKrA5i9GAnwNsByPJjixSKxl
	UB0q7v/KCsBjvtph2mTrA+SReliI8sacscwK9MvBD2V04FfHTu5avHebW4Dmf0qcoTJiu15ggNE
	bYNc9tRIgMQAPQTjBW7FFwQ1S6ZejMkJT4jA9W0zptxbazcSWh1h/UWEn1hMMZjG57UD4ZLSdM8
	Z6uhlDflvH534vrgUCaUiulzVSiRdrdAIRhWnoC9m
X-Received: by 2002:a17:903:2411:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ca911de5d0mr89041125ad.23.1783064102444;
        Fri, 03 Jul 2026 00:35:02 -0700 (PDT)
X-Received: by 2002:a17:903:2411:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ca911de5d0mr89040925ad.23.1783064102008;
        Fri, 03 Jul 2026 00:35:02 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:35:01 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 3/3] ASoC: qcom: sc8280xp: Add support for Eliza
Date: Fri,  3 Jul 2026 13:04:34 +0530
Message-Id: <20260703073434.2589657-4-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX5fI4HkF7A0f+
 7c23zISZGDriUhB+6H+aFYWLMxMr0IznSQBEO/NyH18Nk1TUiW5hPzo50xsqz7z4hsqpxxUAeBE
 dI59AZ4ehfFnv+x9I1nMSLuyMwuFt6zSjks0C3dzoB1H+gaQNhUk4g/XkZeeTtS0a8hTHr2LqLZ
 JrJrOMwMokaV22ufmnJNM/hZTCnjfIp8wIsvDAF2Um9WyLKrm3CKV/DnuaXTH1DbwjbyCcLUmMC
 6oiQ5LYgKfh/fTKLgSod4KCyGXfONgBYoflglb5Xgo1MdRmOX5wXAP25X8DBy1kCEMTmD8e35nu
 iM5Pbqjfm70pZVeF2+GgHNb6JF3AG7wm/WTTYOpGuOSYu7URc2QX9VPBDjH6dTpXtWKYUovZjVJ
 JSIcJvt3VK76wG72GtBVoowNm5x9up+a/LeZhdjNw2xg/6KOsqg3l9wfUEeqgXcZ8su3uXFDRb3
 SOikpedPr5hl5YM3G4g==
X-Proofpoint-ORIG-GUID: s7NWzclYE-dsebKVmYydZbdpoL_0chMz
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a476627 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TZOEHHLujcuKf4pbZmoA:9 a=zgiPjhLxNE0A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX8h7hat5fajZh
 /66fst4GKwZnffFylQ83Un303w5vOxLsiA4xM1btb9hCw9QrKjJeQsakdGKSImqqvI7Zg3jvzln
 0+aisd+STEoP6E0DPyFNG7P6EUZUxko=
X-Proofpoint-GUID: s7NWzclYE-dsebKVmYydZbdpoL_0chMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116201-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E7CC6FFA80

Add compatible for sound card on Qualcomm Eliza boards.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..98b15a527e37 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -164,6 +164,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "qcom,eliza-sndcard", "eliza"},
 	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-- 
2.34.1


