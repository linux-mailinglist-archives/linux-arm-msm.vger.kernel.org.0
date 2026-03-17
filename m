Return-Path: <linux-arm-msm+bounces-98164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFFKAlVLuWnG/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:38:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE32AA022
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D99F830B9C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C313C3C03;
	Tue, 17 Mar 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEVe1rbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxHMNCaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E093BFE23
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751028; cv=none; b=dQwG2aEIaNrWptqZ45JEano+Ux3Su4sVPngrarlYcAsdEYjRTC2zt0X6w0hGrpqZheR5YR0AyEk+7pn/GhkuKQXO+LFAsqfiPAfUvYgBDq5Zm6zcj75L09WNaqBr60t7Quvb0asN29rotdz9ePXQQ5cPWhnC3LfU6R/VcpahmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751028; c=relaxed/simple;
	bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYmnYCuZS2Ekdq1/qrDRSrbsC5ncsFEIaCh7fqmTLSlkWeX33p5v5siKWk4GlarwiRkvmrT7NOj6KfWeZY09xJ1y9lqqd4XljFC0aqFhoTsFFtFnXvIl4mGC/Qn4oOAiLWSdE9oRFf/VXcc3pLP23LsTVDq2pWLa6RIPFgINplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEVe1rbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxHMNCaz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBjoYP1622327
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=; b=eEVe1rbfQl4RZOik
	kQmOfHy9g+KUrlgJA7nyceTXFe0TTiu5JQMZBV7XkZeYhx4eiYR5fvWu31JRsoQM
	BSsRUzV/HsH5gO8Zx4w/l3n3g0rkDC77kqZd3O6JRHBheLW24HNuYuQ6SGjkcAtE
	igNfHp2k3qDjCH5fzYQFinHX0+svqK3Rsn89vuyaZRM5tu9VBzHsM1ZdoTTRuzwA
	MRIwZKGuhwjm4D4HBS4W8d+J84PRHyYCnAJY1O+duNInxSyPxeEdzE0pAR646EoS
	4yQTFZZFy52G5bC67PKtq2uu7O6wURjX9bpzrz+WIi70DmkqCaEmg1hgG+JysvHc
	vNVLGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyemjud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd85e08fddso6030836285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751025; x=1774355825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=VxHMNCazWlakG0rQg23ZlAteiuqXqnP4sYTnnJfrAGWP0503AXZr7Gw/wG2korN4PT
         Xj2qwKrD6aYQ6R5GLekvFnQ3emta6Wc85oQKuLx7603hUlNDOwDhRu7c1YUQXxnfRlMt
         dB1tSUxJvSjYI5W8CX88zpdtyWe1lzE/hDnV+m+8qsZ5Q9nCA8oSLt1X4XFzbPQTNCrZ
         oZpCD9AEIEj4IRKcxq0raclQHgkurb6+UZ12xUYQNFazoBKH6luuxoZtfkSPtKDs2j+I
         eVpLDNNgItLR2386K+MR7rUQIkoBkZWyD81V1TxvdatJblbAq8jr/Qe4nL7zGKQ5UcFz
         HAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751025; x=1774355825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=UZGA2qEh4BwkeqCq8PM+PBz+4lQp7MnJxRQMxd6nTFlenLs7QLiOAmNlP0nx/BWXvJ
         Oiq7K9qx+DdVoJkgDDdPTDDxB/26nC5/SPRYBOvpoHOYWpFgoZuoRCNeZieN0H2tKx0h
         GsU4ETIo1jjp2acd/PtihSrCBp2vMHjUOSXvDu0wpdI32fqK41y+zBvsgT210YPwHvmZ
         xap5vm2/8qewQ9u2Yawvo2KIUYnQM2xhryuEFCHJqQZDaT46ZkxNus5BugHpGSc6bMb6
         CG1vtfUbRBsv8dAE9Dog8w7im4Kvmhj57Tn2u9L10eobltacdIeDVeR085Uh2AAryCNw
         pjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Cte6aSbxJdjoBy0as7ecNEEdA6684Wa6EGKpMYfIGLa+aE2v+L2D8wXdfPwInklqWyYKyJ661Lz/RVzo@vger.kernel.org
X-Gm-Message-State: AOJu0YzrznXyahVJLqtqxd8mDH6i150iRKFjyuEPaFfEIgyBgY+aNm9U
	AW8m3lZTOIVoH4CzlusZphS7xh3qgTShcvdlzZG6TZHBYd8zJQOodHFNJTkNyZzP94a4HpHY5Mj
	wwsJpJxnMhwlYYpWqEH2VMUslVJm7J2UnRafjco21Cz5UBWJI+omwl9Yi1Wt2lrf2nlUL
X-Gm-Gg: ATEYQzyiTjduuXfQSKaQKSt7FcjFR8tBEnjOGXnlfdL99qMAviA52jzsTPlGeRQpiwa
	uWYJAJ9wcI3ZshkuFso8XaSh2kLilLUlIr1jlQih/HtNuNpjV42zq5rSXrM37c3D9w8nlp6CKRm
	7q/bVY0COZnVH1LXhrJPaw857ZQPqxI3qxt/aUBBolqPvhphudpjP5M9AQ2mZ56QQ+tWq1M5jiN
	Q9SPF8wigPNF2mEOnHrBH6011lLtF6iPhNku6Rp7FkcryVQlvBgG/EAqUuIjtJKWeDiSOdF9bnA
	KQTn3rfizJUOYFgNQWWy6qM1qedo94SntR/JqMrx4iyDLntEa/3bJzXobSFj6lEKzaViley6t5j
	VPlr0GOZD2eMQKAzYqWOHVpGUwIa89O/bYi0pOxUmVEfG
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252383385a.1.1773751024761;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252376985a.1.1773751024311;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:50 +0100
Subject: [PATCH v3 1/5] remoteproc: mtk_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-1-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrnOx+lHsgQiNOkTmEDx+3tpumic0NjHLRS3
 KqB60rCDL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK5wAKCRDBN2bmhouD
 1y25D/kBPvJvGmbh87Tm7p+4o7yQwfwul6JXdr5rhanHpwawDTxECRfEZQro72/xuExaXTi0NW8
 +ogE9W9d4Nje8UndJGvSCSMqdRh2SbV5JAm3KM/4glNysoCAkl0Wzq33oKSyOSb35g2KfmdZ1Fh
 3ZIP3sFnZtuGlju0BnpbXgBsoZSuYJzk6DNo5jphcPjy1Vv2nySE89AUID12M55fqJlwSFsboJZ
 nOwz2Ilyj2Ps3B6pVrwgsP9o8zimsmF1C3y0hQD1/UL50ojAde+rY35dZ9o4gdK3K+jbATigoYd
 t2hxRXshbdtsSxuwFn2NKPOL4k07JHcpJXjHzvl/ED+1hO6zKT6oeGPh452/qPhsfp+WX6VC1pl
 rNF8xXyToTlmgqPC7c0Fh6UvYgNQQz5pkwJbssWoSrqV6vttgXutrbVOUVTqAVPnlkwtGxLGORG
 ouDPyNqRbc08FxOryo3mAkJojtfOgGoZ+D9r4hZOEUMZnFC6yi0xAVLyj8dcmlg641NoXdFeDhR
 1eAOnHfpMylnUdbGgV/GZsGefNVvEqndiDTGWt9/8aQIIuCkfyIBgXYwIvCVc5QNLItPeVO/xVb
 kfR/E7hD+CEjP7vN784wOEsqW06CK3+iIsKX5jBjmvdf5nISIEOWMTvYl7rNgl2qYuW4nJMfu8c
 scpWzdKfIwpCTbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: OsXkQ6acHFLwzDgRxI3IuoeMzxt53MHT
X-Proofpoint-ORIG-GUID: OsXkQ6acHFLwzDgRxI3IuoeMzxt53MHT
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b94af1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfXzQuPcTbCSj54
 53WaHwc27X8dl9L1rdD6ZkyUm8fg7R0oJARLcSp2bia0wVgdZ8q3YvyyebyLaOuQlw3ADVkkinI
 zgbTLxCLLXbJm26XPTVCX7kmADk3NT9k7y1l2uQh9Wq70djP8qHgMPv4ibADvpHPGXyM1/mWw/i
 sHQAxN9gT8cpRJVt9XlBVURvd+e1LvMBPQ546bR86TYm91fyXMUNCmniaasU5n2lZgAJQVL1Lg8
 UvSF48FMnW+DXMXB2uFfeY7VLCNA2b6SH8RwA/Bx8YWj4U1aAAyMeanSe7UG2geZrvMfGBqZPQg
 hozCJyqiz65XK/dD1Ka7aVtK9QiAwjIU4AOsXCc9/L1Mm/ytNDU/lvRSQgHJLitGsuS6LTBJXEc
 RJdEPjclLrcGmXwl9KctIBsVK3qIYG36TehE3cHBl8YtA/2Il3pAkqGzfJsSIIQ7z74WdJdc3Fy
 lbfIPPYjRuBX5iKz3jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98164-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66AE32AA022
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.51.0


