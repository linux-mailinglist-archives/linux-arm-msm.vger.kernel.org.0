Return-Path: <linux-arm-msm+bounces-111156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g3IOHnEyIWobAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:08:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78163DDB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:08:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CfWgm0ru;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fW9Qwzvo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111156-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111156-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B4823059A66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2273976BA;
	Thu,  4 Jun 2026 08:07:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902691C01
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:07:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560474; cv=none; b=RmrLHORY7q2lK1XP9/iHdK20FmGnI0jNpehKV5xpSVU+UiSWH2TVes3bl1TAWuPERCd34WymqFlkZrZY1MOTlj05E9jLeW4CN/7pyfZwcNcwOd+X6F1d5YG5ClOsytUOuOthRNo3BR+wRJ97G0GWyI3g4MqGIfWfHa4hwYSrvEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560474; c=relaxed/simple;
	bh=5O6Xa4y0fRL3DY8QrCMxGJm7vbQjen4MmAX43kAt6RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZNhK/mxpdUjtai+/lcLnoCCC0FxAIdiKNu1GbU9jlcq0PMlirqzZsmrr20c6OtyoInMbxWYAQoQApYsWLZ1U6WtGLH1Afi9V6M8RlqrXo7617eR3hzPrsjoe9/BjUV34z9c7g3GN60XADsWF3gBatjYgOHuzo5QlXNsXtXXywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfWgm0ru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fW9Qwzvo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543Aibg3234568
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61PQyy4C6QpV3imW0J6BGaQpSZ8+cchsOaIwpKwWfAY=; b=CfWgm0ruK3Ws4/cq
	fe9Rz0fzfRAXiZG57QYctG/b0XUmBCrl60JWrwQeTUOS1sxwhaFk3S9JQzIi7iga
	TU3wIWhbkwoUxMj62mM3Dc/jEpJO9QcoJmU9X1o0QCKrSLzg6qSCQruflN62qeFz
	tic7sqwCj8+NSpSUwo77C/ZyGUp3DERxXZIrcEPXPUEhx74MTAVoY8yjTQ1nGFNZ
	IgSl8Z82QyJohCFwdPaf35bOEkvizJz/tE24hgDRf+/EltMYm+t4CaH0tm5Fj5q7
	rqUQSV5QPoTZFd9itw2YeODG9xL+TyKVA0Inr96uPQqyFvd+HbBT6UnBeI1ntscz
	+IVFWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s2p0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:07:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157b3e5182so8309085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560472; x=1781165272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61PQyy4C6QpV3imW0J6BGaQpSZ8+cchsOaIwpKwWfAY=;
        b=fW9QwzvoynXDfd+JoJIoVn8ZbmtfUC/44g7PeUxoX4ILAPKErx067s0hAwFa47zQ1T
         8t5Pfu6R/nVQXyi1wioc+t/6XtGTVqYkGuHGe/cdtZVCjnJPDrk+jahPOpYb/6VKtIYJ
         l2BaNvu26UbcbDjmym1eDr5X7bxQSZA9+drEYw+2Mk7f3AWbiPwjlvqD/jkX1yFaHBgs
         PZGuT5iZryzS01SC0ZtuG+Hqp73yRij2OVBn5eTlOtpsyrP/xYgS5okj9hsjrUMzDwtb
         uEvfn+0vqcLDWtq7u9xq9biGSPxRCJLkyijsmbx4fsfLlTELiCT79kbAKGYvAY3AaDxH
         nN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560472; x=1781165272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=61PQyy4C6QpV3imW0J6BGaQpSZ8+cchsOaIwpKwWfAY=;
        b=M1TB2j68+tzN3Zm2yuUt8sXL4Xc0F+kMR3/9iNLwml+LfLzHDCozhuimGsLq4BDhWQ
         YGJpxU9iSNXFmgSjLiESrgd67SRqNmDZ1vnzTk5bwahKHL9khKKmc6v9fGsunmoMDprt
         zJY715BNYSRIBlwNowlSM3/ByuyPQ1lp9SibQmVsHP4f5MsDobAMSn0+OktdmGCubxbX
         ZODFAJRHXkCOXm/SAl7Rr9t4lqIE3CnkXsXRFmSrJWYjniOrY7H7e7UA5seTHM3AYF9x
         goFiykPjnRHI1ltgmh6HOmIXwlQh9VdK7yl9HQrL1+dahgYy5pabtypcGpDP7nRGHV7D
         E7mA==
X-Forwarded-Encrypted: i=1; AFNElJ/BzRpx0zCyIoTQDwb98chg3VHy1NaM+kkNV4YTn4TZqPVo4Nr1JivhZT8fXixndhkzTY6N+69yYFo3xVFN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/IajVd56ZXdcM7xVCCNP0oN6EWZ9j6nwZ7L1SdvzZj+q9Hhk6
	JxNlD175MWoHBmMSx7h8wU7GRYh82Vd6y0gQthspieJouA8yYUFTirZE4m/cj2xDJGdt85egdrE
	arBVIZbDhIP3vmzaP2IBJzkKNte7x626Vjf8YDB31IzKXFjiVjaC4VmPlt2VfP4IDRVS5
X-Gm-Gg: Acq92OEikVv6/EZcijkYV+BCiWb+4o2H0heMqqFt3cgJcp+C8VR3yzbNw1PxERXyX7x
	PjDjcX4aP1F+90FjPPy2uVeJoEh7HJM4DuPHC8wb6HamB/Pe5dUOi7eiMMbpvypAkDMvILmFZ7E
	8SkGC0BrS+MH8XknZIi5M5OYhHRiJIHRHX6MKNNj0fZG7IsJfxZd1VG6MeFLUyKGHlyRlEjLK90
	y85UQ0chfpz2rfpLjkVKJiYKWfWqtz2g91ocfKsScW7/k7KUFWC7FY7ZO5QEpUxSblFbKxnfrXl
	NO29/tkpNBM3LB+8sxOBdshc/3pxaxSyb3NjuHCE6wKzUVsgLbKWM8B+vZ6UUhv/m3nkzihl8GF
	7RC/eq2TetgwqdL3oKtUcvaoLe9igMPdkcMs6oXBr508A5Xf9TX2ibI9eMIV5YRaoibA/3S0pa8
	4KBjY/lvvU
X-Received: by 2002:a05:620a:4406:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-91589e9f107mr763055885a.0.1780560472088;
        Thu, 04 Jun 2026 01:07:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4406:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-91589e9f107mr763048985a.0.1780560470457;
        Thu, 04 Jun 2026 01:07:50 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:07:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:06:54 +0200
Subject: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add
 ATNA40HQ08-0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=2628;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=5O6Xa4y0fRL3DY8QrCMxGJm7vbQjen4MmAX43kAt6RM=;
 b=rLMvjG7mqjoAENyW81aGwEM+FFL2OYknMHLQLduGD2E0KnvZ4OUtUjeUdI70qzYVYz+UItdq1
 FRcQcByBwnGDy4JTbwneLSLgnPawBQoRAtekYIyAbCEIasSsghyjBaX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: XoZTyS2ub-gJvvEA-7PmKBAZ4EYIj0of
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfX7TM0UH4zNldq
 xzvmh/vbNCb6LfvyO8YHX1DW4ADBHSzhTPWtFX2CXqKcg48onp9ZIe4c7DtHb7v8j9SFDGhp2by
 MheoOzZvqw1LX3LVfTL9fBiRXGWlzUKAXgk+Muk/YOc1cCXZJxKUadlZhxAsqCqcf8MTG0EKfVU
 RjNHclCf0rxjDRHtGdvvugPNfPiq+Ayn0fqyH3yYKBJC2aepXw22W11U9Jsrznr31r8zXXPasUq
 pCFVrImyZ1dDg3NU0u7HVgFQlbz/Yv68HWiw0W6h9GhZd41hKHMDfw+4w9Ho4fDZ31tfbwB8GNl
 9Zyc5hU/axmohTmscwWXKYKyLN4rKeuw928+Ag+TaoGGgtgq1pFmke9nuTfrExdJHIWxHqnQNBD
 ozqVBJ+4UC0ZqHGVzCq4qtS3LcozVNOF0mF2y0Kw2UgXmLR+g7Z1XN7vQlDx0TqqkvjO4XPSfE2
 dc8NTvizE9JkPfF5Sjw==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a213258 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZJ8lwXEUdTpOK_Y3SCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XoZTyS2ub-gJvvEA-7PmKBAZ4EYIj0of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111156-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A78163DDB7

Some variants of the Qualcomm Snapdragon X2 Elite-based Lenovo Yoga
Slim 7x Gen11 laptop ship with a Samsung ATNA40HQ08-0 2880x1800 120 Hz
OLED panel which seems to be compatible with the other ATNAxxx panels,
document it.

Note that I stripped the -0 suffix from the compatible, as it seems to
be of little importance and some sources omit it.

EDID:
0000000 ff00 ffff ffff 00ff 834c 422f 002f 0000
0000010 2300 0401 1eb5 7813 6603 ae85 3851 24b9
0000020 500a 0054 0000 0101 0101 0101 0101 0101
0000030 0101 0101 0101 0000 0000 0000 0000 0000
0000040 0000 0000 0000 0000 0000 fd00 1e00 e678
0000050 47e6 0a01 2020 2020 2020 0000 fe00 5300
0000060 4344 2020 2020 2020 2020 2020 0000 fc00
0000070 4100 4e54 3441 4830 3051 2d38 2030 c402
0000080 2070 0279 2000 1800 1200 2ffb 0042 0000
0000090 0000 0c23 5441 414e 3034 5148 3830 302d
00000a0 0021 ca1d 5e0b 4007 080b 0007 7ae5 8551
00000b0 b9a3 024a 020a 5445 5fd0 644c 4400 7823
00000c0 0026 0609 0000 0000 5000 0000 0022 0014
00000d0 0ad4 3f85 c70b 0700 1f00 0700 7707 4f00
00000e0 0f00 2e00 0600 4500 5fd0 644c 002b 270c
00000f0 1e00 0077 2700 1e00 003b 0000 0000 9085
0000100 2070 0079 2200 1400 d400 050a 0b3f 00c7
0000110 0007 001f 0707 07f7 07cf 000f 0081 731f
0000120 001a 0300 1e5b 0078 8fa0 6a02 7802 0000
0000130 0000 e38d 8005 e600 0506 8f01 016a 0000
0000140 0000 0000 0000 0000 0000 0000 0000 0000
0000150 0000 0000 0000 0000 0000 0000 0000 0000
0000160 0000 0000 0000 0000 0000 0000 0000 0000
0000170 0000 0000 0000 0000 0000 0000 0000 900f

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 1bbe0da3997c3b06eccd18fe8980b58a6c05d963..27536eeaed8594c047dd0fa1cf425912be189508 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -25,6 +25,8 @@ properties:
               - samsung,atna40ct06
               # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
               - samsung,atna40cu11
+              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+              - samsung,atna40hq08
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
               - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel

-- 
2.54.0


