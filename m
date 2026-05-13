Return-Path: <linux-arm-msm+bounces-107488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGWWNvDsBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:28:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AB53B04E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3648B30A3E53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C803B841C;
	Wed, 13 May 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUM4QVRs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE53B637F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707562; cv=none; b=s/bbZ42qDlG+JV4miBOZK0vEGGnY8W75DnBuA7wp0lK5lIrfDsr/JV5GKIwnLoMeQOEKShtkX0zkpcD6GS8gfTizzsFE1sdnsNvQ2WrOUj7sBN291o5AoWK3AtPX/nBPiHP5W2VxWNWZ/MtlfdQnbwHp5TvIOgicESGX2yxbBNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707562; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjEPgM6liDAg9Rg+1co/Okqas6gHCmlidKqBfTH+7PM7Bl6IcTHOC99q21yJUazv1e4HEizF6Vc8fPnzRw1l66qhr1AgqH0gtuk92mx84ngsTTXY3miAyIwmwFvuGfzCb5cbPRfpZcMQlsxIa7u2Yuzwcfmq+wctfs/n69U/Ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUM4QVRs; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so7552655d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707560; x=1779312360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=AUM4QVRswER92qtwHjyQVmWKTlEtgvxT6ShGu4rdeSHpmeGX6cBGhPwtBRS+u9m6AE
         otpzzCLfv933N15iuYZBTlKhJL8zMwVlFSqP2lbNeEbwDjYx4m51N82dFtxk3egp4+TD
         k03QJyEfKVAs7D/udCEJoqwtjQxMBIeB7IFe8DXXCfX26nfb85GIciN4jheLI742UlDv
         871ouuC1SgN4KCrgj3JKKtUAqBRlHZDG9ZpDpqbtbBnodxs5dlIwipEiVDal0BLzMp44
         IhID0j9Rw1LyzmkLfJHINa8xX7ghS6eAYhUkrRnXmMlNGJT6Wpv++BzyzmCkBl3PhGxS
         /VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707560; x=1779312360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=knG7h+CaXjz/SLLna1XFTTMOUv9uyN2mtH1e0FiOLidVlABOoRZNJtXLGZYOpKKaVL
         ltXIcC7g/Ck0L4Rl/rv2H2RBm0g44mbZLBr0OrUXDy59K0CI7aZ6hb01ap0atsueYJ9p
         ftBeOLm3YRQIjN6fto+BOpL3UdG3dUD8MauKW4rxY8jD2pvRQT5X2gW1OCQIlhMxMAsv
         RVxqn+alnu+suIb5TYaqyADBz42UM8ZyjnaF/eNC07mhyB8WioBdOcDTzFN9SF6M9dyO
         rhBevTAoA6F82k4Yue3wQpIfNhYCqUVqbYU67l4X9noizjyb1z/p33fU9wZhUuW1sOLK
         1eYw==
X-Forwarded-Encrypted: i=1; AFNElJ8K60wYjpwaRzhzc2Js2jowCfzv1THfTAqkdZppitbRrifiZ7Wxjhdq1rU1M1fXPIVSQG92A8FG/Rsuz2cv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78jAHAiMsRp1QJ/0iEFLOPMhjfP3MAGjMkUu9G+31d2seNN4X
	po7ZEcgCWXVu/ThMNHsU7ybRKSa+os7qtz1Ekv4Z1vYTYbEO+eIuS//P
X-Gm-Gg: Acq92OHtlaq2DqRLtIapuNlnZKobU34ZQo56jc9bYnpaqdDZml1TiIfP+8tCc0qkkVY
	A78kyVa1uFiQZ+Qxb8ghisJr3qvGvNFygUOgEkJxiwPwE9ViY8ghAIhmm7SeI3WI0u4Rkk0WEMu
	cKcYoYuakOTh+iXcdIeB9rrna8W/ROPfgAKhnQBYtS2BlF9uHYElHJwnUaJLr50DRr/De1mR9nl
	/HTs08tgkyGMgkeuTbdWkir3QRZokrsv9qkA5wH2wqG+BM/97tYIAfjxtbU97gUPgbazXsQjCso
	jkcu4SQyNKWQMorfKVYgXSMPtkZD6f923sDbQjOvzGEM02NXPNAtYEkZLwfeTIcuBd/hIilBWQK
	rhZXKBO424eZUSDX+Za7XUuMcdP0J3oeNypp/Ru/W7c6IDxE3VGxD1clZrAtV06CU9HVMpTB/8Y
	Gc23bWGmfsDkqd2zxftxcQ7+zx3A==
X-Received: by 2002:a05:690c:ed3:b0:7c0:e1ab:87fb with SMTP id 00721157ae682-7c6da11a9e5mr45927147b3.12.1778707560454;
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:32 +0300
Subject: [PATCH v7 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-3-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 770AB53B04E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107488-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0


