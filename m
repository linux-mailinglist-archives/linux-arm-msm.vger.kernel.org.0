Return-Path: <linux-arm-msm+bounces-112923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlsbMs/lK2pDHQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:56:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6630C678D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:56:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=UBalcRBn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112923-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112923-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FA4E301426B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F16338A70B;
	Fri, 12 Jun 2026 10:56:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CDD3803D3
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:56:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261766; cv=none; b=MSgtPNzeTOGsFCvh7NLvWKKQvgOOGpQjW6if6tDKPrE2eumZQ/QXftEOqTCuN96XA5wRA4J39cnoptgQO+Zvhp0oWoXNmEzpd71XF1toqGEOa2c2wBBGB7TsksgqeaRpxq3HIAcRSDM7iV2PRz9BuN8Tb0hhfo6Z3jPviLrn/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261766; c=relaxed/simple;
	bh=wFr5Y86M5KQ4p0pgwW5LDGp7lkP5OjBgz9reRpjmvqM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UjeZTDHtD7dg8YsOigG43xWK5SNoirpuHkSokRXn7FUA5qAU4WqU++wAEnAsw0ObsH/xiStwF6+g0KmeR/bD9LZKy2pGczzujgpcdRcScQRknN3pm5Ryvp3ZHKF19DUjGY2vfVHpd+Jg7t8DtScZ/ir7x3/bYQ5oKxkUvKcNgcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UBalcRBn; arc=none smtp.client-ip=209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso154161266b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261762; x=1781866562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBCl5cCfEjB8KtDNmXCPzRhVFXfyDWsOPQ9sKNOvYaU=;
        b=UBalcRBnlIAfFUTrVUOe6LC8D7vMqKFrbOYILd/Dx7UBXr1haQCUeD5f0aJ4bsCncy
         7HT1y5iv89fKN/ObSR5cT2DJXE1Z5IA+vbpZkmSptDnMItaeWwPj718FdYkrZtExwT+o
         deOZT0fhYg5ed/di8Mo5HVZ3YBb7gWkoN9dpknyG5Mbglb9lynxYRg536l6e+3nOMg2p
         xDJSkVfyn2lRUVnHz/brpe/2bfSeMZ4kjgXoJALEGGnFFVy/CcsPMtLumvIA3bM14cWb
         89PHleGt03sgJZXnkb7FM35piPHcZOR1Ixh70Dl7RYjbyS2aCgXgTv8HTzNU19js+6V2
         4AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261762; x=1781866562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBCl5cCfEjB8KtDNmXCPzRhVFXfyDWsOPQ9sKNOvYaU=;
        b=LZRnq8uHF3nOCslGmRD8+/ACVidhOyHP9rCLShbtt84Frx2IB8r9iTcmHav3G6PRWi
         XBExz/oFpQeSHUx5tGYCDELwB03AL9wx38f5PCHFRk2azzLrFnpxYD4QZFgtg05g6LWU
         frH8B0Cc1Id1zeyTB8Eyzh6d1ZyRkfEGdU7J5naTYC9cnvnGTQOWOunk3bCEuMH3/5Bm
         R7IrOq6gMmNCzNTocoWnanDnWoKVvVVA/W3OO7AvZQSTSHSCz/Q9VTOw7/pNi4nwnBKP
         fb5Ju+PDurhoLzb/cXUhcT2uN74d1ZyyZT20e4xuf39L72Qo8ontXXXmAkQbV4tzPUfu
         G99w==
X-Forwarded-Encrypted: i=1; AFNElJ85fgq//EMzZfc17cvYLJcfz1+50zQTDQGh3rnvrUl4Tl1BhqRdUv4seQkycEbjV4Q6lnM5WV15y4bS0YTB@vger.kernel.org
X-Gm-Message-State: AOJu0YwMph2MzfWad7B3BRwcmI9S7i+GLslW9Xy0vM2e6IcjzFQqmrFb
	bNDF9FII+pUe5K0e3/9YW3zz8cB9klXUUa8+5HbeJcwbznWGddSU0C3aT98MOrxCcKs=
X-Gm-Gg: Acq92OFt6P6XAogVUFFLoVCGvLfwioscpihPETu1SBYMeMTgC9wh6HOcNjg4o9KycK8
	SAVAS6qOdFu6lf/cxQcHCudBNaTASXeDX+ReqbFeRQ3tnZboDUNaYiN2XL59uCLDFNZihMxBYWz
	WdI8R19jLKIm6/jNveE4NZ2IlByyDp/Ix5zlKRwTRcj+AsvLigKzXJCnkKt/sprgzuW03JEKd/2
	cdqoBtTX+FIUjGQE38zw0qde10ZlDJyxcDvQlBf0HGfKcuEsYaXo1EiglwLIoEVf2u9YmLDeqLu
	cfplIN+0OVaP5bgr0LS84kYUjt8/N+9kFYXKJs9JinPBWzU3P25FUFLatkJXrhzh4iPDfezHdqN
	Gidn2IxgiBNdgrfltBtJHIS9Nsuq2ysu2Y4GT54V4kmvF1vBcIPulOIC8rEloCciobgL1xBMZUI
	nrmWXGCnFTEaK/BIGgIGEItRWdZ9NxpdYeZ7fY5upAAu48r/eCzIo3TDTR0hPG6E+k1NrQvguSw
	k5UvhLPiukUq9Zq55A1zYC3EfQXGT5+k2vb0s2Nk2vn5ktV
X-Received: by 2002:a17:907:c308:b0:bf4:9f78:8399 with SMTP id a640c23a62f3a-bfe2acf357emr117904366b.42.1781261761918;
        Fri, 12 Jun 2026 03:56:01 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Sort kodiak pinctrl nodes & add camera mclk
 definitions
Date: Fri, 12 Jun 2026 12:55:50 +0200
Message-Id: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mj3ez8lMzEbN3kxFzd3OScbN1E81QL8xTTJENTC1MloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAyNd1CXMAAAA=
X-Change-ID: 20260612-kodiak-cam-mclk-a7e87d5b1585
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=704;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wFr5Y86M5KQ4p0pgwW5LDGp7lkP5OjBgz9reRpjmvqM=;
 b=JDb4H6sSEzWpZuNT4YY9jzkb8Myz1vbnJisiKns1kVM2EVGQa7W9H8MWDn7RYLoeOA85wFL98
 Kynnoq/HiGjCYH/vOlyakAUJue3zOo2kEQQKziGv2plVxdLVFPfVhwr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112923-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6630C678D00

First patch is just cleanup with no functional change, the second patch
adds some camera mclk pinctrl definitions for preparation of adding more
cameras on different kodiak devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1413 +++++++++++++++++-----------------
 1 file changed, 724 insertions(+), 689 deletions(-)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-kodiak-cam-mclk-a7e87d5b1585

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


