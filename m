Return-Path: <linux-arm-msm+bounces-111968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WoVFqciJ2q3sQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 22:14:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E265A517
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 22:14:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D3mUJex2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCB7D3046347
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 20:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AD63E7151;
	Mon,  8 Jun 2026 20:11:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793E38CFE8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 20:11:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949496; cv=none; b=OQ0EDklZcQbfCSoAabadLCteRis5ALDrzyi3ZDVORLVStjVT2SwPH3CXJ2Y5uszy+x3B295tVKhNi3hUQIG5sbLiOwPYePGLMqrljd0ii0QG7+Bz/GxT61e9APelyamRMIGIiL1L6hRkbikjqoFp1x6ednYjaevRIjUgSVb15BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949496; c=relaxed/simple;
	bh=b/EPSsa1PBcaKht/9Md5GI6F6iwDsRcNHJwOGBef6dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iUUQmZc+BuKO2OT8inetgswPrBdlFC63sxJqMcq9JpbzzxvD+hcEBIj82FAohRn/dBlA8/lJhWWJLk0hL0Bk7ERtjarMJ97pcWKrDfHalNbM2SgBHC+F1ffWBVRAmrvZCMLZkHFoffbwuwatoz8/YWlefzhKA2dmAD5jl21Vc5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3mUJex2; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490afc47455so24410845e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949493; x=1781554293; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ael+QkcjDUvWdYhINrpLTeBHHZaOT8ZvBuy2R2ndfpg=;
        b=D3mUJex2RlPGaOtxz7lerHX9Z4TD0wXtHn5nNFe38jB8XdGOTaANMdH00wSH77GYg2
         k7hEt8ixJ3AAnIWo2zdVENtCvpdErV0802lavO1K5PunT5kMcSexskr74Lil333kDTGl
         Uc1q2EMqkvbh4goQtnns2t8fIPfAR70n2gBTp3eJTltT9uR2MOvCNaxsVh2ebbGBCw0O
         EwE1/bQwoUitdfR9T4Vg4d7Euzw5uX0MdbIRLCM3Dh3oZzaCjUAdErXP2KAArHmTRKkb
         DW9TNlddqrW10vAsqM4AlSZAai1dIu8CM6ER7T/orDPpY8A0qQMQwMb+rextcBDZuDjF
         L5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949493; x=1781554293;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ael+QkcjDUvWdYhINrpLTeBHHZaOT8ZvBuy2R2ndfpg=;
        b=ko3QZueHNI2I/rF6zez7seadkuCuQT/Z0y7ZHl8ipZtmA0pLH0GNdW8/UC1BfgTZhD
         KhoJ4UuVi+NLSzVH8v3WaN0/fun7snVJISUXd12z8bNy7cToO8j0fxjHZ99Ym2dxUUxQ
         SCv7NQ1ZEyuLE9DSg7b6oINKFHeH7Qrtoik02K7qkqDEjIMlPCnesBb9WXo5XH7wjbWq
         V7ImdnprPuDxgKyNv2mDWlxUGPt25KCN+Cpoa85Ec0lZ1+WtMCTL6xWrsSJg1E042ANU
         ODivThWrLq4jEK0Te40XEAok4SQwzRQCCXcCiP7hU1crjKveWwH1MshyejKMRCEd2My9
         d6tA==
X-Gm-Message-State: AOJu0YyLWR1Lr/8hIKyFLy4zDqf1aprpBBt3LzOzN7cPAOHYYz7ZeVBU
	amnVPwjKIQhkJ9vdIYzQArwokFOLt+IEqrbaurhW/VHjxizLMj7U0nPu
X-Gm-Gg: Acq92OEPe1fP7hBBGkXrq9WtMwAN+Plt5ZAjsG4wmvsLrENEaOcMlQX3Jbn+j8g4AyN
	NkduNIzbxIVqmapEVFfwqOmQ+wEysEIvsGf+BrQgEG6yT+YjSNyj44yg8ZXhODx+h/xp5CXdh1B
	q3oNSHePlgRGcZHBtkIsLXbdR4J8yUA/V377LuY1d5vPA7o7UGrbOygAspo9Gyk7oZ5aBjz1hml
	MkMnwJpRTapo+DqJhfi9s4GcnB6piYtluJp+5hl5b7mrHGgjatP4+8CCpjh9a2McaxLkHt7Scum
	/iLPOAYOgWiqKTo5F1vvei2c68XF3MFCW//7Cdpfm+V5ajccAJ4rpRy+F5B22QeGVLeA6eR2joA
	Fg8JS5dUUzks3b2GNgha18GF1RwrXfeSlD2QnNRygWUKtWo/umq3j1wNw13fyVG4kBYWATSjXRH
	NHXCgEg9kZLrbUpw01iDaNrN+UC9gfbqnxA4ckca9HAEc6RINFOkRIbfqR/N11uOa2hgEJ3r8Xm
	yxML5al42mhiR0=
X-Received: by 2002:a05:600d:6447:10b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-490c25ada18mr199206795e9.3.1780949493179;
        Mon, 08 Jun 2026 13:11:33 -0700 (PDT)
Received: from [10.100.102.82] (46-116-185-113.bb.netvision.net.il. [46.116.185.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm421219095e9.11.2026.06.08.13.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:11:32 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 08 Jun 2026 23:10:23 +0300
Subject: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup
 panel compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0Jm7Zi2QIOuvIdh0ZYBxvCXFoiGc
 HcLXsDly7x53waBPFOAe7KBp5UDj0MEdUnAtWZoCLmKDEooLbQo0Gboxn4yM9uOMGgqaiew5vc
 yoZbK6Erl5iYziIXJUzyc9Wf547DYF7n5SB5Gy2Ee/eecX+Xh/be0SpSYijSaNk+dNI+mN9xd4
 wOU+75/AYNdeNbYAAAA
X-Change-ID: 20260608-b4-compatible-s6e8fc0-fixup-612a6d25a914
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780949491; l=1331;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=b/EPSsa1PBcaKht/9Md5GI6F6iwDsRcNHJwOGBef6dA=;
 b=fIYAh+giMPCxco4FH5yUxrSyW03LnRG09S8YCBJkkdqKGr9ufhEZfK45ZML/4ivoVMeROFajR
 QUIKfxOejdqD9YrVaCt1Y1HhK6k2kiY9jtFWIVYs3PiwwaebXN54oyD
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:yedaya.ka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE7E265A517

The change to the panel compatible was missed, fix it. This compatible is
already in the driver.

Fixes: 493cb869874c ("arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel")
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Link: https://lore.kernel.org/all/CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com/
---
Changes in v2:
- Add Fixes: tag
- Link to v1: https://patch.msgid.link/20260608-b4-compatible-s6e8fc0-fixup-v1-1-303606b53c1a@gmail.com
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index b9d9439e230b..139f2b401af5 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -198,7 +198,7 @@ &mdss_dsi0 {
 	status = "okay";
 
 	panel@0 {
-		compatible = "samsung,s6e8fco-m1906f9";
+		compatible = "samsung,s6e8fc0-m1906f9";
 		reg = <0>;
 
 		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260608-b4-compatible-s6e8fc0-fixup-612a6d25a914

Best regards,
--  
Yedaya Katsman <yedaya.ka@gmail.com>


