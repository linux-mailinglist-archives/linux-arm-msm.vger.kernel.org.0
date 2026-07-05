Return-Path: <linux-arm-msm+bounces-116581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XFOjKKGzSmqQGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:42:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC570B110
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Lc/WGFTE";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gKDe1OP2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116581-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116581-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CCC73011C77
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD233A4520;
	Sun,  5 Jul 2026 19:40:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11E2FFF8D
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:40:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280449; cv=none; b=EZsu9qevdCZuWfP9P/rPiPBOkJcLYOuJNFov+dXOM4RI34rBrt7GilIgbbsup1PkpU10Re6shCeVoTx+xcV0h7yFmRoea/rRS+jqViBWTYNpKlCj9IgSFgU8PeV2XwGXh+rEDrbdZiljxvIZ9l3RISDmAYc3vn6qbKxAQGoZluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280449; c=relaxed/simple;
	bh=uWGYzLdeRrzr6t0aAVNStOMdR0p2+G904nfPHoPwpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj6CjiKWa1krt66XFCulTfzDDbrGwBQzhYhyFOieHaitre4AZEA/HQHbMQnIommVPpzkoskPl46KYExUgun/MitVHtq5l8P4CdLBTRAMta5pb+isV3nlLv6EBbxsVikWSvTumAhGU47qeuuBYDh2COzybZN2eNsuYIXRIrhUzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc/WGFTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKDe1OP2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhk1x2313542
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so1912838a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=gKDe1OP2VeZBHb29Tyhk0spYB0JmIjlaM0WTmBM1yBJQhBOf9aEAfK2exn1LVOPmEW
         t4kJI5JbWvo7DnSp0hgIRl4RWIqkD9+3U5qVshADpK4OTBL9FHpl2bQOdUEXUgeyPqdr
         8kPKsWQfcJxQQOftnOh2eJtuGQQ31071Y2jn62GkaOy1+vlsou3sABX4caEqGuvHzOKW
         ns2kVtK4ktPvEWHke6Rx7gSE/FRUcNMXW9zs8/1IZh4kAyQ7Pu6TNfQpy3Hq/ARbyQqK
         EmfE87yx1Oi4kvZWhENXHgShyz/hVyxit+9LLPZMP5iWFa9ik3Bh5lE/KP9OAvYmxxsT
         xdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=aWoC2L8cFwA4LMRaSHnU9Res2S+hp7kwQuJPX+2QP7QDvWqbKJuVxUsohpPPRK29vf
         mKFMyjwJ4gNsId8RiY2/E3OluheCD4/iOE+KtJwwnD4nNDy1cDjINj8Mj18kTlQxSOI/
         u04dRFFkYUuDqwEWudHQOVanIihZJ8nJA9vstbSDjEZuw1ogw6jApt/yje73ZAgfB2nn
         o94obgCPgvifnqiXXskMNL4LijRSPjaHRcwUvSsYSg820dLw31k5acv38dSRvbxYny/o
         Aiz94tvltBLhbOS4encnrqfcF+grmovmZhOx2PBupXaJQPva27hcdyAHRBmZEzuOxBlr
         96VA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/VhK5PfMreYnktUcdLFd7QzDAK5CMaO4xq5pFXAxFzrLHy9nLlKs/AQgu2GEjAyQPVB4Lbh54h0jDrDtr@vger.kernel.org
X-Gm-Message-State: AOJu0YzCz/RVvz9nRBLI61n1MleaoIZOJ3u6uo0EHsZv4DenvUvJZ0AI
	wkqi+zr1VIfP4fFzu377WO4F7H7i12hWhFqCibRE/I8MXPsSBI9qVH1rKgBO0Gzk2QM9drwo2p1
	qZ/TiE/dapMb+BXnIVxRJMr3LKjf59uu00BQtoRPORzcvYCNfa+XWnw/RQ9KG+3gKlG5T
X-Gm-Gg: AfdE7cnjcS/WH6/MAemsYAZYWUOfZmnoJ/ioDGSuqkU4tQB5Xoovd7S6Kt9HHGsB3h4
	eWJ7xG41Rep6ncLJ9umjcmzX4hfPclDDK/CQAwUGXggvpObq/1KkdLWUOiuY3c2gxBkHg+8xag4
	hmVWTGsciWaG8Rpr9zhU3Tgj5jkG22W/kbVXZbGoKdfotCPZXcwQLTGuny1IAsvKH/q5sOhNRX0
	Z1StYXWtkMcjycR+HpqMBiRU66K4MsXAwK1cDBNmWCyPKwLPhG/6+Fa4UnPJvsxAcDVNc7qhLwP
	wP+0xgJQZdPBqmft8rv3GridyMdZbLaLVbnVzuiEd+QB5+8H9fijmmL89FmLqR5U4f0zCCKcWac
	DzXXFKgngJaAY9EP3QaYfdBlurKifxvE17Uc3Rw==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049942637.60.1783280445929;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6plDfAOZPNBPbuf2_kh5Kom-Jm6J5CJw
X-Proofpoint-GUID: 6plDfAOZPNBPbuf2_kh5Kom-Jm6J5CJw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXyEh/ML6ZZjMq
 kr4HEHciUIR4HKPQbi27P79X2YA0FAysplbPyObzUssRDKuuNERKCSqjndXEU2bWFNEOaylxHzX
 P080JvfkImDTvpXKqHAFJiepzXikiLI=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzHLNIB47UDV7
 xovJSPaSt0Z6fGrb0FWnq1+BUP6ZaRRJZS6D4Dq2N8jJBS5SFpeEAo4OOtCXIaK04ChyKQQZAJg
 tfddvth2EkRyH4jBGuvDagpAaP+ZkO9850PUAWu64WiuY6unjn75Ko3NmTTMHKEUKLp/IadNGJm
 9rW38AKPjTyqjXFtVT6z9cBYr3i47sovUu/ZZI2U20XvHj2P09u31Rrz6F9I4nbTAJl9jAxh9x/
 aV6B1M8vbaEsIsjNXWKauNITstxmTk0+pS1d7LuG03628hLs7I2i9fZLRctz/ciRpYkQrEVjzew
 fSDCXP8TdYaE7J0jwh7ZPjY9+1igOquvldxTIPdKkOhlbA1xohWLCezUHIzL3bQJfAloVzPRWia
 F9HBYYgrVmptNuB60G/EHVpQpkq/i92zGsQKCbDj1D5uY46yIeBOe7qtGA7/rgeLWO/vVlcxYg7
 /0zQlifN0LkllwDabug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-116581-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39AC570B110

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


