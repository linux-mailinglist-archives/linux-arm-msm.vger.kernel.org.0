Return-Path: <linux-arm-msm+bounces-119182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3rQXGDpFV2qZIQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:30:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A810975BE4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:30:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MPipA1AK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fgVPI1+j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119182-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119182-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FF2D301547E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3BF362130;
	Wed, 15 Jul 2026 08:29:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB8E3CC9F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104188; cv=none; b=ntkezRfzFy3K2kFcNm/Ozn7VcIRNI0bHdXDZVemc2CrDbf05u/u0qAqehM41p7UZAEct3reK8TIj2s3wrKIi0sVTRCbzLQUl5gmbU/FozHEULfkrRDiUcGCOGcUZUsc7JZi2gtyg3XJwsD5d32PyL7RD8NK/31K/x9Lw8QQ2eqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104188; c=relaxed/simple;
	bh=l8D8RAjAOSgTjmig+yQnVyxj5I15TERYWKnxGCFXsw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kiaN2mXM1wU3tiXSv6T8CB059KA6gPIvvC63bw/UKvC9NFlW3pF1lr8TRkSI0+33LuHkdNh4Fh0zRNNaKh/S4i5kjmWAVb2QRckDKOYEl2IEA2DiNtFvpupZPbHbAZ6x9oxQg681g/QeekK5HqyO2Q2XNz9wbGX+vYsH2F4XgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPipA1AK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgVPI1+j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lxh72374697
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/ebKc9zjlknrJwTiFqOlzN
	Oehqv8iPiumObNh+c2x5M=; b=MPipA1AKJB5pq+/cCfRzZdS6a3JYRMziH1OfCr
	cb0i1fHqb0dtFOHY0QIqQSDUNtl9jkhJA3x+VHpfoO6imhs2ZrVX8+tJE2EZmBpo
	tktk4aDNf7vV6A/4Sc4QYcZCD/0DuJzOdj8neQhF/WQrjfPKKjAwm28hxlP71Z9s
	1r5LRACcex+Rfo6WXAq0TQTzX9FN7WiiQOjYZfazeogRi0xrn9BAXsfo9jROmJVV
	b5geB9RkzZFG8msHZXFfW+hmNbfSlJNLLrBIIxQwxw78iFMHKJi2O5EfdArd4DDs
	G/RyBsEXgMVimQZ/pEYUmjkYtkoHiZbR8ZrfNH23D+S5SZWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk4342-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:29:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so30714525ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784104180; x=1784708980; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ebKc9zjlknrJwTiFqOlzNOehqv8iPiumObNh+c2x5M=;
        b=fgVPI1+jeYLbDPKcyf2ZnxMIsl9oKWL9IEW23Hg3gfBVUxeh+BZqyL3pANLbxKIoMH
         t6Uo/SzRbmFKITFvsJz0iTSH+T2iHu4YqD0N7sH54kbbWU8W5wlcDlfM7sxB2GOx/woO
         5bUrQp8W6o5IyCurSJGcAA6PMNyCVlM/JIvEJ6p53fH7qD2xBMY14oEEQUeV18rOxaAK
         GHtaprOwp860MwJ6qi7zM76BdgT9ffEeEc0hwqQ3C0dpJ4huLBZ0D9x0DUtsXPXoiOCy
         hnRA9xEV6M5NuIf7w/WE2fSDdSqzNJRklD1T66bHE2eW2XB64CawOZAWu8cR73ysj5G9
         WftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104180; x=1784708980;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ebKc9zjlknrJwTiFqOlzNOehqv8iPiumObNh+c2x5M=;
        b=UDLGXK1Y1gAHb1wXZ51aniFm1rlUk2PuHCpwVPL2zqQBHDXFsgRxh7hzuk8xU4ZR8A
         QxMAbNafqCrYFo2LXIu2/iLYGeakH6YUff1/QK7BD9BS/Wz5flqVSD5us4DeOXrE8lPN
         +qRXzTw7zgp4/rn0NTPXHUOywccy/dpBU8zb3w4INWmxv4bJzaiquUnNy5whR7YL1Xm+
         1xpxZFU4WRNUXRingf60LP6PfRfKTMEznhr3P7qT3PbeXkSNPBQ3z5BuPQqEDQgsLkAg
         NeJ95kUUdjV7K4YtbH7vXtaPxTu5j8eIyVx4PqAeThRDZx3fQ7e12HBHHG/S1iH8UOYN
         1Zdw==
X-Forwarded-Encrypted: i=1; AHgh+RpJAW/5NYfT3NfFWB8YTsp8ETCLSeg5X5Np7QqNhiRTp+tFLGNRMFdH1Z3S6kyDAkBAjfNQUbISm15mMFPn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QhgRqu4Vz8HTLpLWl6lxt8b6oAYJy8xyaXovqUQSpf/ydn8m
	vf4uA3QXU7QBkoOxf97dGgEFQg3iLiRluLqF8KsUXkajuRCsOVuJsOzrCZV9RBvxBFI2ppVARTU
	r0FU2/tUttp7xALqZTkFuvjdmlXjDL6G11mBFFktOvejDOeat3i2+hQSe/JvIruDL6mtp
X-Gm-Gg: AfdE7cl3MkFVsZCdTPHg1GbZkF5gF7FWVVWBY1oecXs2qNBnWA+Shpr/x6h8O+UTs1X
	lagVYO1P+A/z246HGUeaEYEdpe9uvfzBAeKYg8LoZuiG/W67nEl962kwx7U2lRLlpfCWTwxERi6
	5lw7M4eMoW5RQKm/A5xO8UYXEuDwPhPgryO3LtBYHAv0hV8lvjVnQuM4SmqidP+ZDzZJMxuzSOe
	iVMOiI3HjOu7k90jZ6tHWWvg+sVSgzblITC/Jx7c2wRHyvDUf1PukXuWE4FSXQzGiEO+3h6EQxV
	uppvAiTlJ2OcP/J7MRpJXuQ4CK1uSSBCpYKr5+o55dY9H8KCgaa8Fv7ZAvmX1YUUIqAuWr+8ov4
	7T/wgSb98gmh4qty/Ss/kfP8qnKYB0Ydfp4rprOI=
X-Received: by 2002:a17:902:fdac:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2ce82959a57mr187844385ad.22.1784104180089;
        Wed, 15 Jul 2026 01:29:40 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2ce82959a57mr187844145ad.22.1784104179511;
        Wed, 15 Jul 2026 01:29:39 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb75fsm129260715ad.8.2026.07.15.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:29:39 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: codecs: lpass-{wsa,va}-macro: check
 clk_set_rate() return value
Date: Wed, 15 Jul 2026 13:59:22 +0530
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJEV2oC/yXNwQ6CMAyA4VchPduEEZnRVzEeSlegaphZB5IQ3
 t2px+/y/xuYJBWDS7VBkkVN41TgDhXwSNMgqKEYmrrx9cm1uEa0gByDML6NcCHk5wNNMibKgq7
 3nvzR+bY7Q6m8kvS6/g7X2982d3fh/M3Cvn8AQKQjO4MAAAA=
X-Change-ID: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: 1ZJXE_icjBXPBhUdmF-VheG0Qkqw0nR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX+7dm8oOkSsNw
 eNNSRa1RRqgqN42t94s6N5M2hpaBBHa88cUKXLpJY9iqVpIPj1yEWDm4Xh7OW1ta/D5thMktsAi
 08B4ovdQLMvJt/SPIJffhG/GrYrtKcCNY9CFq9Wbgb1/7N88jitgjRk9kt+euEsyWuyKIh2nSie
 G07PApMcOFfSFe94XPVS9an7HlvuLjNeRVN9MkTpeLkGz0JBhxxDJgqzeU4gob3jMDbeVhXyEYi
 nkgSd/70VC7KnEo6g2scm+i98+5d0K5kX6DifAoP7RgxSPZTX1s6ziCLlD7TgEQ75j/Zy8k7HyP
 Rxp04gXCZozji07TVbHnskho2dhYt3Aia1XmeXrwWfVQYtHBCWOhLVwk3DGY1R5ELo63YuetD9X
 YeGM1D6jxA7pE50j/UeKpa+61hz6AzM/zc4V2eKm9UC3emAVnJzvB2QnrqvHP5AABa2/tiNjhCa
 27tRflbs7KozalaUdsA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5744f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z4yzVyvRmzhIkooYk6kA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1ZJXE_icjBXPBhUdmF-VheG0Qkqw0nR5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4MCBTYWx0ZWRfX8i/+m3zhJctG
 BSM8KVZBj1+QoTIH3Q3NifKh/0PlNfG1xvrUhc3vCmWR+KFLunGNfccZ1ZVCmROKOE4bDp0akNq
 +EAe1WVVxJ0zXGWKg0P8NzNz+5t0SsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119182-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A810975BE4F

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA and VA macro probe functions were ignoring it. This series adds
return value checking and bails out of probe on failure.

This mirrors the same fix already posted for the TX and RX macros [1].

[1] https://lore.kernel.org/all/20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com/

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (2):
      ASoC: codecs: lpass-wsa-macro: check clk_set_rate() return value
      ASoC: codecs: lpass-va-macro: check clk_set_rate() return value

 sound/soc/codecs/lpass-va-macro.c  | 8 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>


