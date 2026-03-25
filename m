Return-Path: <linux-arm-msm+bounces-99924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O28FCkmxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:15:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11F32A66F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9953730BBCEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BDA41C2EC;
	Wed, 25 Mar 2026 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOMagz4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534242188F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462072; cv=none; b=n+18WpOWb8hBwiJT3Kwjhr1LTRCRRURYoPPIvhRHzcpJcInyhu3e/VaQ29rAeao4eu/688kPrvj3wKAryUMxTTH5M9lDE3exDW3s6rejqkYZUekt4Qx1HV5Hf8O3xd5/AQqQgCgeHy3NOPcAN8kZ8wLDyp1Bby2PKqf18J6L2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462072; c=relaxed/simple;
	bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EfLLD+h+Hn2X4Ta07STsDATsaHWzAfku6GgQKeTVAJ1MoxadfdfdyE9lIbRCG4HjWorfG2ZWzDwzhmzpn3v+DqafBQCKJhpBQvrjFYGX48xZAu4TyBSxiwx/tpZcvNdM3DWzVVZedcptRvAgBzUWLReaMjpunjcNaGnw6EeS4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOMagz4o; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so86797a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462068; x=1775066868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=rOMagz4oBevcgtyRlh2BLQU9nLyBqB+b3FYpJCtu/OxZA5eoP5o83IOR7Hi6P4I/KY
         974wvTViL4Rg97e+cfoULQzjTXzwIW8K2/aAMVmP5OUkEDHiTV9s0TPzeeirtq4rFK/k
         RjWufBFI4sFctN4Uc4eeK40hZyzugKVciikaOsphOxCdbe9N9GesopKUSixzG7NnGclZ
         yhDjHdRgYhUoK6gxXyhyY4MIBkDmEPfo+zdr48yTj8n2uOViCxn4SZ5FozChnzfOnfrT
         st9pa6wmdAXAdgwexkQAHjY2Op8+98M5pLz19UtT1oLroySUpX30DiZvkK7Lq1Hwnszj
         u/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462068; x=1775066868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5py/0HOJBBmCXHr1qpaeBygvrnYQyzbcn8bu1Z3hzw=;
        b=ZuAUmhslDHURbl5yCZkjS7V6O5N4CQqzQkdjnhRVjSWcmgYqa4KqusTdxycKTSvpL9
         kokKVaBy+NRb9Ud3JEGZ8QJk/4xhcyqaRKzyM5r78ezvCIw9VKBGPrOPqWeYASZwx6XR
         Ug5pN26AFfYEwy4pdVEK7UOekBgaB1a6AajpjFaNgkak6zp7BAGyOx0ZFVHi8vLF7DgV
         vxn5A2g7iagO7f4YNQupyTAfEFynPFqjN6X3/p46QiJj000F9yX4SefcQeOibYn4i5lN
         vn3xNN+BkkIvjhIbxLCJaOSiz5olrPCptVnwWfQWk3Zqa6nvOdVX+Pi3rutTc6EqSX9k
         NkLw==
X-Gm-Message-State: AOJu0YykGxHwkWtlUT5Xm68hL567RZRT6367yvVMvZTnUAXKlzYXnzWG
	lZZ/cOsTtAQVZakZoBp08FcTZlZJm9RzNeegRUU0SyCq5nAvuXn0aBYf
X-Gm-Gg: ATEYQzyqpewJF6nQFHU52vucr3+kFw8sVssy4f2JgkpYNr3bw2MZUUOE9LNxJVbp5x+
	RrRAqbSOa/ySIrp4qAaU0Po9jOqRhHUbWc9iyxXZAUokaZHIzJ6kd/OHJ5hU1vOcs5DuaMaNQ6X
	/w7BRCSH+nEnnSi6aqmvLPtTlj/doP+1uCgpt7UflD/GUxTTG+GZ+qUqFTCXZx4uiAnoNcx2kNI
	jNkTtlghFpe5vREoTNZ00Puide+uB+RE5s2pK5rLZMYQKxxTJkoTpX3awt1qQwWNTlHT4Mqo84/
	bWlqdgCOByTMEc6ZArtXEy5Dg2Az30oGymizxAHza5ceIKwzP12peegIeFrG41jAUarP4z6ltTG
	C/wNTImFh0A2rGGGg/apzbFL5f56Y/i6ICjQ2zR0akivSAMY1/KZMSxcC81G4ZK/H3uc1uZMXK/
	JB+f2KtVZIfa9Gavls79hRVf4jaK+M
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr50563235ad.29.1774462067634;
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:25 +0000
Subject: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=919;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=SAlCTNhoYBl7jxXpQV6GKIoXoc+5g1uH+ayRwKvoDH8=;
 b=voXfhb5tQm3cVPDqWZP3DiFroa+n9Pp3IhcNpBymaT+ppwL0cOEgPXmQqxc7neKiDp8CqQHRt
 92SQS4v/upQCCItffWGtN3Vw5UcrLztgcL44oBIFh2osoEjUhpL22gp
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99924-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,4e00000:email]
X-Rspamd-Queue-Id: ED11F32A66F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index c84911a98fc..259a24fe24a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,7 +1238,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0


