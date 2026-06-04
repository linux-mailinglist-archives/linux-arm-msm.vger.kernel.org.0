Return-Path: <linux-arm-msm+bounces-111207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3fbpAHN1IWopGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:54:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15B64014A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:54:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GvvLNtCq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ay0IC5Nv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111207-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111207-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16CFA30AFDB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5981347D948;
	Thu,  4 Jun 2026 12:48:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2E47CC9C
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:48:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577336; cv=none; b=PLHUypEhGHLqHFA4hKgJHRDBn0JmLM+HHD/o9Is6bWKdciL9L0X3avM6tut8vcdFZjdrLcmoQvTdmlVBxhKqbFHQte9RYUx4bOE3uS42wyCT/VzFHuYArvffZb7+QgQEVw4oha8fpg4AOXvcaMm7s8OxDfTZ8KMI4Amo0mlsHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577336; c=relaxed/simple;
	bh=thq9wo4DnffvLwfPbwYBFKtMetFuKw6slUjFLdQaF7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dhenE9LLsFuZDMbbZnWvE9iijbvtOwGCyC2c7XdxA+3XMdCR1XvA4etqT8/a7XOrgmn9ry0KNzGJuN3GrJ0dIdp5zRjB1fbAzvb3eC4z2y0qGHVcA4w2/jZcATGzEzaLeDd/y7JgNo+wMSC0Hej38JouTubZGFSdxdyN5q4eB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvvLNtCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay0IC5Nv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548TclZ598640
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ny3IMUpPlVW
	GWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=; b=GvvLNtCqomW9SATf27g8vvmLvvq
	hXH9ygma/LchhFLGkXGJnCe/tdY53y2OkqTJJv9k6bAJLoM4Jcob4xzzNkKjOdnn
	6Vzw8jIsCOcrnSID43cazIDlA1hM9o4O6w2Kz8wY+yFvM2578ndv8TznLZYj8W2M
	ssf3xb/skpPIVqtZHLr1WwS1sD8CPcJ0XxPHp9LNiC8n6SfDzxOFl6QWc6o7zir4
	0Q3zofqVpwt9ogRaHurdmjnkbwjSX5vGrrwW0Ydf7+lNqA7nV8/GVUU9gc2VWkTA
	9OtRO9uX5BmNeWyY6z6btjAQeGPHJU7RUkdRYcz8UUPcOqY+sCmKHKXBhRA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m2cfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:48:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbca3so368398a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577332; x=1781182132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=ay0IC5Nvr8o9rp+8BvJP98d8U22a6k8cicP3PJoMAaHfDAuE/xPlmFJxZnF40c99jy
         gntjJeEPTTrgG1B7bQCyeBllhkxwmPUb5ewBV+MfWKpOy+erfL2lp08c8ARztpU0OJhW
         fWXqrEPB5HHrDMlhdFzeb8Fh9ihuir2q+QPXlqa6BeHAUWCOQcHIu4bUExRAhifFg+go
         XrvO9Bmz51pSkWRT5VBTeOkl1Q2j3YrxYdWKVC/vcsguog4XYBcVY4La8QnoWcwayvAl
         RzOJS+tz7p7ZUqbGMwtkwQ8ufEuF2WCLlo7pnVcmFwsnSfjXhCeXp2Uho5FEdNx34mfG
         DzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577332; x=1781182132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=LIkVr3LbZ+UAzaF4YNNc8JIi7qi/xGy6/o/uYo4iEpVNI+zRFTFxPlBd1qfF8FNaUE
         9AoOVExc6Xo1TeZoTPHafuX2LHjTCuxjujzY0S+S9WB/uCqZ8TeyAXO7eOZ/zyJwIkzb
         P1HC95HJObtuTZULfUcmfTzjNZpmFoJoUY4yXrihHPkwZbiGTucI8IduHGmwiN0GDQMm
         BW3yIZBPEa0j0c0hE/1F1wAmzoFFfugZPy+V9wp/J2+rjtwb/d6rjYvxzKgnQfFCWZ/D
         0pLpxQQK/JI/VbIa6avF5ngaLmYNpqrQpXLez1iOXy45pkRsGPmTla5LXKaPRZ8msPlf
         7big==
X-Forwarded-Encrypted: i=1; AFNElJ9bmLfDYv7/LUyCjgx0UMBk33qFT2rs+R1hrzFmlG8qOFiYxLcCIe6HGNIGJRsgxx/m6XcDJzQ8TyEgM5Uq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy36AyImSgG7MAFBm1vEk112UHxIhHxOiCjM/FoJuCZusiGJugi
	V2jm1OM7b9YoKVGyCJVQwhACxByTizBazoiG343Xqy2VfmraURGHkat9adE4c6gBc25aIcn0Hw0
	kN+fwi9NtjIvMY1J7xFgqA1zhe0mqbKlwEN/0aEC5uCnpbGmXo2RDCuRQlvqOMZyMOI7f
X-Gm-Gg: Acq92OFGK6coTeebhBzkJhQSozlAMjuti7g3ck35WvVH6bxJLTHFQpLnW5SjVBWKK1X
	4Y82IIEqyN9E1T7UFoxSk79tfVLXIl8zN4lY4L2zzdhqr8gva9IMTb3enKs8RZsVV1tXRrSJ/J0
	wcL3SzBrz0dc1lcwSnCuiTLlXGkc//2Wcx0o4DDO0YrPFknNH0AvQPUWyyN2lAyMVUMuFvx+H0C
	cfxxDeBsowoKz3TzcKshFWSLMirs9eQQoMiVt+R6Va/ce5Sk3PixZIsmD7AiNvlPPVCEtVPwJwj
	twfhY2vfifn+r4ntTHNmsbrV03Csy2hWyq6yiVMH2SUZ1kx4Lop/SURKqDNB588+ky45GlBK6of
	ulYnIh09CnCmepS2QX2G7TrPNr+jBpJJhWfhGmpSzfuH6spN8EZXwWY5ObiLo
X-Received: by 2002:a05:6a21:50e:b0:3a8:1350:ba47 with SMTP id adf61e73a8af0-3b4977b58e6mr8944139637.47.1780577332188;
        Thu, 04 Jun 2026 05:48:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:50e:b0:3a8:1350:ba47 with SMTP id adf61e73a8af0-3b4977b58e6mr8944108637.47.1780577331731;
        Thu, 04 Jun 2026 05:48:51 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:51 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Thu,  4 Jun 2026 18:18:23 +0530
Message-Id: <20260604124823.3467457-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
References: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a217434 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3zrE_5izju647JJH3MQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX5hyXUOG3lk8W
 Z49VfVqblXDbUbt7n5QA+alaGslx4WGYe0o8duooqwVL44ji6lV3EN5Y7bHdXT85k57fJmqUQBc
 1JuubGLFksnaWkzGnyqGS21dm5Z0UzpXRWMQYXXF+deLHh71w+oxF3BpbzKvM/NLoI5ZXfr4Ee1
 vz5phmPPD6f+IUqScvnzo9mxJMMXJNSg2GhXdFuDDFdL8QOxiSbKc8G3ddjImngWZuY0uwNq5fu
 jwc8+dW5cAhWrz9x1ymUEJsbxyVw8bvnnQkiVim0l7SvpYfhVHRhD/j2CranMnzrMO2gAXKrqTb
 dCGRXWQ6TFVas6/Nxx6j93qzLxY5Oq7vtmB+L5bcALVbJXZlcU8pBfrtHJ2gXsBHrPnigLlvvuk
 Lh8zn6/1jlLAMbWvz79U1JPh4tddaGkEoAtLClRnH5KTlfR8gQbNJ4SwfrzAyfqlZsrYzaPnAe+
 xYnNzOxfc46XhZuud8A==
X-Proofpoint-GUID: jRoIbK5jPjymCUtnwyye0JeSKQY4B_dU
X-Proofpoint-ORIG-GUID: jRoIbK5jPjymCUtnwyye0JeSKQY4B_dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111207-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B15B64014A

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5952bd6638ae..97e917338d58 100644
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


