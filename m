Return-Path: <linux-arm-msm+bounces-115150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c1QqLsmAQmrc8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:27:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0E6DC063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:27:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lbn+4ocR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GHQefGer;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115150-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115150-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E97D302B741
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF57421EF6;
	Mon, 29 Jun 2026 14:16:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F55421A18
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742619; cv=none; b=eb1K7NEE9756+h4oVP4c3vusVVmTYToBvhGU+9LnT55V6T+0aeYz7dVHFEWW5h2X8fu+LScd0XfqXlyAu9UzFYYAjRCtoKv7VuhBJHCdYW+FuK5N6sFBtcsbQNZDaFU19NJ7Cat/HqvLhl3StMhL/aLob08RPVDuEl/KRzujn3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742619; c=relaxed/simple;
	bh=fUvFc3fENqrCdtYGcnwIQZGyeEr3x3tj/FL3fDKbygo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asijoEaCCsufNlIZzvX/924vRTRF5gWNrvVuht3rGRLUrSgE9Ry5KOR3Po+VidfLpad3e9xqmnLgO3tMh5mYDLBLC6f+DlTRqwxYh4z5n8KYhJTZCHscVk098BCt2amDci/jyQfLovLpSb+tZX3xl5fMisqjEmeYUTymEuAXtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbn+4ocR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHQefGer; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATCvt2647686
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SjUvXL/mX56mOYrPBguEs1h3doPmK8H6vkztD3URlg=; b=lbn+4ocRVkoZVnNE
	yD8zRV04Vo2axT6kVqEI4NsRhqHaqVpNwKgncF89EcNsy3miEGchJpJMVXaEzKwi
	R5UgEaruRUnjJ1iyHH8Atx8poYrHKtunNdqTc3RAwNIKq5F+iSdG6deAbkMk4PON
	SGwLM9tZO4chqQEnPPMXpbExYUc01vLxImzSdgldO45CV/KGJF+RvbbVFw9Bgzo7
	QZQT3kvwsce4c42qv/rpTTQRUdM2HqCE7likLCqpDP74BDr12pkxl76QPkzkn0B1
	GNLmH9KlPBoTkGmz6SC5AtIU8sr+pPzsZcrErlLvIHWdR8lbS/Vj3e6KDpfzGgzt
	zoucNQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhp43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:56 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-44863459ac3so1851871fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742616; x=1783347416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SjUvXL/mX56mOYrPBguEs1h3doPmK8H6vkztD3URlg=;
        b=GHQefGeragr51ir4quh9bILiJjpxHSdZN7/lHiayR4iPxBNWZUdaccvrVZOd0kN5kf
         vy4gpTQ0zuTVLC4qkRawz6WGMVx+nGLnoaJkMPq6XYh2Q1dCQ4AR5p7NCZHt6oVcXQvA
         MUVfycrqinIAK1j1+9CocjqgTsscZCQwgDdxsEI/IBIK+J/KIa9xGCUv5GXf6jOoapyJ
         cyMpCVQ8RE20e+U+VVJAeImZhUTPuLqA10PIQBc55p+h8WzOlflPTiuB2qB3j9XxR542
         ga9GF6xd9EpLKoCXc20Y1anxA1m+8c6aOiyZOyYmQfH+L4cfPn2qV9cSi2yfxw9JCp+C
         HviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742616; x=1783347416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3SjUvXL/mX56mOYrPBguEs1h3doPmK8H6vkztD3URlg=;
        b=QUEs7abXpRpYOqvcGSISfl5sY1Xl0yKqkU+9RoQJl8oWJ9HdZ44FMmTRJorL9xgX9n
         JXll6ukxVuVl+tTfp+QduEgv4bSK/3eJCRofPbDkeckF/g1pVNb2rlTozn7rTDF1dP3F
         BZ0VkwVerFmnJqokucm7Bj0PHzWTv9CO4Jl3EZSjREQ/hDQxcJtWs3btRs4XXlJk2pbK
         IMFSHqVITTETe0lEq8DWsVQV1vHF5wI8loIWeExaAHX50APU6+YzCqVUlIRWunpCmO3L
         OHkhM2ug9MdQaAnUnawgV4Vq4dv4I+QjsGNqhHhvo5xhoWwEp4HvWann5uc3YDAWXHgB
         rPhg==
X-Forwarded-Encrypted: i=1; AFNElJ/CfmLpaXDyTiHv0bC9ZJE61GkMS7AXvp2UooDE4so0LqvLmnJzJ4TcLnFF9yEpSn6h72GxWwIDKo0G3pk2@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtjrcg0SQxi8LfNNyYtcPBsVPNTU7WSjeDHH724bt7rxaVMaY
	gFcERm6GUBLBAivkeC7bRG4KBiVCKB0bcTSpnyFEdwiRZGYrPQyXpKHzljMEd5KW5ss7zUkU64F
	XoRVvDOI2NF8BfO4OlczEItkqNlWTNQMmo1SoAtkM7ZeRdwNa4rTaBPO2JGrzVnttkx6C
X-Gm-Gg: AfdE7ckSyKwyvzlskX42VfVbTV+rj7X7vFGEO0bLpfgseSgKvPY4VqVCf6YcOkMX6eQ
	Y8T/ej8TzruEjSfngDEcTLusgtv+anVBDXa7NCrmyrA2u2hiQLfDA29/Ss3Of5UqdzamEYZYXTv
	RxJYKnnc7N5qgNUDUY8PGh0iy963MaHK1iD7KsL/vkqet0fWeUR/RXL5UuAERWLF3ElrLP9QFrx
	hfXjkKZxbVQaVplIutaIiArfj17/0crblpXUzVY512q7Ai8wqvK2/n7ZbAbaWev3VR+UChKSXZm
	/jf13s6kMex3n028veDygcbYfGO8b6dN4l5qdMDMLp6mSqJp+9JJytilCGs4iuSwzglVC2aqpuS
	VCbWMs3Q7sgnTMrJLDyIGTiyv4bfv6Qx9Ai7v6JqNgdeQZr0=
X-Received: by 2002:a05:6820:4b87:b0:69e:53fb:7867 with SMTP id 006d021491bc7-6a13434f2a1mr10237308eaf.17.1782742616008;
        Mon, 29 Jun 2026 07:16:56 -0700 (PDT)
X-Received: by 2002:a05:6820:4b87:b0:69e:53fb:7867 with SMTP id 006d021491bc7-6a13434f2a1mr10237234eaf.17.1782742614096;
        Mon, 29 Jun 2026 07:16:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3500sm8584812a34.8.2026.06.29.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: qcom: sdm845: skip set_channel_map for SDW stream DAIs
Date: Mon, 29 Jun 2026 19:46:32 +0530
Message-Id: <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: St3QsJH_NwPVkP8Bwq2CR6yw-2fbxEcb
X-Proofpoint-ORIG-GUID: St3QsJH_NwPVkP8Bwq2CR6yw-2fbxEcb
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a427e58 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fJR0_yvY6LQ15X-jUkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX0LbsWmrjizrs
 NF3zxNYzXctqOPwR6Ftz1qz5pNK8e25Di5RvYh5r3K9zMuMuwT/i6i6bKYzK7CsafMimA37xxra
 LZ6V62Vaq7cqzqE+b1rLn4gOkolbBTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXzoPqTkPKtLAN
 uDQ3qh6VNnybpl9gRifkOmMRwWC31TmQU3YL/7F48yMnAgZRkAOEsC/FxKDm5InJwoGzlwZPfU1
 MHsIyyAtgXVpaqL9jIvPKT/+sXZrLerjLMjg5dN+Rpv6AvNkF7R8gGs6QhA0qceog0sSEAvdwmj
 42LgHDF9YE27mRk3cCbvVZ8N1yl2WNPGbZYN1CjbYi3UdfO4w1eDJuKfxSgWNW0xBA0TpncM272
 G1SZcvwbMG7G3vnlxxXxZr5D8eFRbJRiAqGFof5B2TQGLLP6u86MynIoHJtYiCpBTihpvFeKXJf
 FzYoXhB/NVipwPqM+XpjV7JxLyYNi1KeYK+VIUItrBjU5i/Iejz9Ifb3ani25Y/zhkRtr/vBTUq
 qLkuHdnFo/yBaIEF8xJcQLL3xo8yFXRhCFNoGqxcD6M9P3iJjX+BJavM+5Ki4XN+A53wgN1BGdt
 qn28tZJVE2NuRJk5VBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115150-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,suse.com,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:quic_mohs@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4A0E6DC063

On sdm845 the SLIM Playback backend lists wcd934x alongside the qcom
SoundWire master and its SWR slave speaker codecs as codec DAIs on the
same link. sdm845_dai_init() was calling set_channel_map with hardcoded
wcd934x SLIM channel numbers for every codec DAI on that link, including
the SoundWire ones, corrupting their channel configuration.

Skip set_channel_map for any DAI that implements .set_stream, as that op
is the distinguishing marker of DAIs that own an SDW stream path — both
the qcom SWR master and SWR slave codecs register it, while wcd934x does
not. This confines the SLIM channel map to wcd934x where it belongs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sdm845.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 0ce9dff4dc52..509d7a551397 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -294,13 +294,26 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			return 0;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			rval = snd_soc_dai_set_channel_map(codec_dai,
-							  ARRAY_SIZE(tx_ch),
-							  tx_ch,
-							  ARRAY_SIZE(rx_ch),
-							  rx_ch);
-			if (rval != 0 && rval != -ENOTSUPP)
-				return rval;
+			component = codec_dai->component;
+
+			if (!component || !component->dev)
+				continue;
+
+			/*
+			 * Only wcd934x (SLIM codec) needs these static channel maps.
+			 * DAIs that own an SDW stream — the qcom SWR master and SWR
+			 * slave speaker codecs — implement .set_stream; skip them.
+			 */
+			if (!codec_dai->driver || !codec_dai->driver->ops ||
+			    !codec_dai->driver->ops->set_stream) {
+				rval = snd_soc_dai_set_channel_map(codec_dai,
+								   ARRAY_SIZE(tx_ch),
+								   tx_ch,
+								   ARRAY_SIZE(rx_ch),
+								   rx_ch);
+				if (rval != 0 && rval != -ENOTSUPP)
+					return rval;
+			}
 
 			snd_soc_dai_set_sysclk(codec_dai, 0,
 					       WCD934X_DEFAULT_MCLK_RATE,
-- 
2.34.1


