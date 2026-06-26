Return-Path: <linux-arm-msm+bounces-114627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vaxUF+BePmreEgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BEA6CC4F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:13:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C1Syo4uz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OBXBqbAC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114627-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114627-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AAC3A30484C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BC13AF657;
	Fri, 26 Jun 2026 11:13:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323793F1AC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472405; cv=none; b=DZkVfeKNyjjUI1pcWiKZvpAI8ZZiMdbaC7cy4XmMbB2fkICZwtGGKL0p0i69UnUMcqbnyajzYxr9GoRZUdgTftbpd5u9vzRUV2P2Pgx+SHeg6zaQi5yBfybgZ8ikxS3s6ashMuWa9Jz/L7h2H1ljJC6yDBXHJ6CvuHUhF0Vt/zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472405; c=relaxed/simple;
	bh=qozuC7Is+ZCJZuPyF2xzQxbdLW/oCm/LscdAx2r0Xz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCP2Tkg6FuKTWzlymM5KzESoNFW1LHgMbAQEsPpE04X3WqvU5HD3x+XQxC9m2Uo9qkqxZOdl1aoKfxpJH0Rj8yqooq8XgT4cEqBMPZZcNFpU0vb76CHG5kNHJwtuYS6X8XMHPZ2p5tB6mMN5qdHKemKxNpUZztGvTAr+QPGxX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1Syo4uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBXBqbAC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAe96q607438
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Bp4Y2VnZXk
	iDroJ1eKwlaAmIoOmqROTyYy2Kou57Ds=; b=C1Syo4uzs23K3huKDFuKYyJ8Dwf
	il3YGtZRX3yj12ahab9TknglnawwKnU9xwQzQcs7mNEGInmmyttkdCjr0mVkwaU4
	IoCs0839Xv8XUdNYPTFDpCfofOQ7Es9QNWcbjZLqW00aK5p38j239YERgbMffTN7
	uBOZpG8mj8E5iTSS4G8DpTI95SZiArCyL/SoZkrHnJQegYK3LpZVoKwl4ntnjT2v
	3CIVTVKwItPyI6WZJMWiK66fULQMMk+MH1OXl/jF4CAKX+bLZVve17n4o6WAoaS4
	ArNZb4afmeVUwP7sx+P3ucSxkaPDEWvxdHGD4EPOR0k+y9U/IW02Nhmy6pQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asjb5pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:13:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8636dc2a9fso18534a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472401; x=1783077201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Bp4Y2VnZXkiDroJ1eKwlaAmIoOmqROTyYy2Kou57Ds=;
        b=OBXBqbACu0QfcehvlDrXBvScffeskpBomUmy7syk6X6eU9QHFjLDwwaIkVyIbZ0FWh
         ZBKjl5OO0Cs7IuzG3bG0UtIq/fSFhsCiNU49rfVeS+I+x4t1VF7xc1TijMBRWu9sKLck
         BeKWd6YVqODccOHktBVs0IgXbXIifc18Z+tXtb12vSmucHBgs5w8MI1tj/MpxQ06CmmV
         1az+ThNDcEVfghXMTGjNrOgexEOYoUHdp7QbvEbljf7+x3hzqnpp9hr/iFFET51oQj4G
         /vUR13XT1FalM5fTuWiDcU5j3nPGmTLa/iiHkpYYE27tyZXCtPmrGov9kFAggb8XLQUu
         oC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472401; x=1783077201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Bp4Y2VnZXkiDroJ1eKwlaAmIoOmqROTyYy2Kou57Ds=;
        b=L1+5CBShx41Cy4y537SxfM0Z7af6CoxrqIB7o5JXVSUTB7o63yf5e8S7UfCeU4/wfq
         nOsxY4+9aFVazTwHOJNCVUEVEhVcDCRZxEXoKF+ngQ0q4RK094AzQBtasQ8NuMdRCbJj
         J+K+mTvthIMcUt7aMRaRV1OptQa+UaNka43CVUroRhzh6LxWJ+0cmdWPYgcrWTlAuPlr
         LBLHXnsA2vBbWN6G48qBLjo8IvTkMnoT3b6vaHKz4Ddn7ko06Vfwl4LqEwxA8/LLqszU
         vIG6/mqdMFAdxM+QPVdebY1/1BqCXoisDDg8ZkdYnM/MKiTEkG0Jr/YgHuqa411bxols
         4Qag==
X-Gm-Message-State: AOJu0YwD/Dh7rL4NPzkZNAPcUABHvb/FBMLdnszI8Cjc1Tmh0yw63/Jn
	PVtcs4KiylCQTorVEY2OMOyIWkrsuHLBJtgrpy9dWCeeEqXU+rKreURRFO+l1wkweDdGgnh5D7g
	VocuWiDLyG6AKUpR0n4Y5zK1CFukYPtRvoNnpMnx9tTvJEJl9XhGV78hE7YxIyZhP+vtQ
X-Gm-Gg: AfdE7ckmaPxRR1JOKbOPrR4M0d8pq4kqh3v5ikkFVwaMM7liOc7O/QVME4vQ8lYQouh
	qsbeq31RUDlv1V+DU1NlOGDDS40SuurfHfnguDO+V3JOBgcdD7kyu4+fca2GgKaM6KokE4MeZPw
	bGoe/H488KvAiPFKGHTf1zN5K7luw8BZByLYqfh05GyVwuwcin0tZdx1PdZPNRYXy3aYCdxaj/Y
	LoWjfVle2Bt5mBfoTQ2/jRIt0kRmYpMduWw8QuGfOdzMTVCrOmY6INjh979OF2jbHW/WDt/ao+k
	OESCVWWI+vfNschT8mrOtfLiDzvcxH4mHhdsq2CrJrID8WY6WyHxZBr776sl92Z9hOlH5zhCscU
	B9S94ocaHuOkUGTfWqSZtws0J+1Hgepw5iaB/Mp5XAw==
X-Received: by 2002:a05:6a00:ccd:b0:834:deda:c7b5 with SMTP id d2e1a72fcca58-845b3ae2b18mr3598963b3a.4.1782472400575;
        Fri, 26 Jun 2026 04:13:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:ccd:b0:834:deda:c7b5 with SMTP id d2e1a72fcca58-845b3ae2b18mr3598951b3a.4.1782472400121;
        Fri, 26 Jun 2026 04:13:20 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:19 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v5 3/3] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
Date: Fri, 26 Jun 2026 16:43:01 +0530
Message-Id: <20260626111301.3479559-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3e5ed1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=stt3cGQ3O19xYmmBwvQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: XUNA_IlYT117JzY1xe1JgaIORVYNNoaf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX7XI+leuyVE6D
 uIvckw6mUkGk8AWzTzcznIf8WD4eRbRU7tereCzhFeTX5tuG/ZMgGIZseTtqlE8DumfGYJKpptb
 Qc0iLt7HQ3Kb1t20FfAc8d93SjtwrP0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX9mBZ0x8TMmWe
 6sxLKIcQrJZN12yLLvPAO/QRce8RPGs+8CAjFjT2dfU4FEpPJqKehH1n/AcPAIER+0c2Crbraa0
 PnymQZkNL4C2dWydgzsI57eSat26R0vv7sQGq0CwCeEEbnS77YLlhmyZ4s12ay7B6MrrwhC6vUp
 D74Dqk5RstuP0UWzaBboKinSbOYixDHWef8vCa19C8rtA5wjr4WxJHf1ZlWWr/FeyP8s1FhDTSE
 h/F6wUdjFLwaH3dg9IzoF3r6NRYowKtumj4X8/IMjkAeHRObHL3ZNtJN1t6TiXY4Qcd8hHXpE0g
 7GUmtQr44+LsxgVJYOwtIq5sssVFTRHMg8AAcu/iC6gRuMKbD12QCxlwmGw4BmXwjBwon8bG4Ls
 qQwtBO2eMjFEHgihmkiNaAzsfbsSAkpeS0r10rnu0Tk3HUuvyhVMfqb+gSteAx7NLsnPoQubs13
 hegG00SkqiI69BlLadw==
X-Proofpoint-GUID: XUNA_IlYT117JzY1xe1JgaIORVYNNoaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:umang.chheda@oss.qualcomm.com,m:mohd.anwar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114627-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00BEA6CC4F6

monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach.

Add combined DTB for the same by merging monaco-ac-evk.dtb with
monaco-evk-ifp-mezzanine overlay.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 90da4a3d4e33..97d8d5daba65 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb

 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo

+monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
--
2.34.1


