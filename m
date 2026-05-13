Return-Path: <linux-arm-msm+bounces-107489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ/0MDntBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:29:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D053B074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CF1D30DA09E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3816C3B635F;
	Wed, 13 May 2026 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQuqohlK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB73B8921
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707568; cv=none; b=D79QaYYi4sd8ZcSkCqBnA7EvznK3Z6TsKZNEY5G860cbXz/pF3OH+rPJILSIMCz3ST6uj4gujG0dj/MPJTOHjEhsRyxnQeWL0aVM740e6A4JXjZJw9m2Boe50g6d62Lho7gbzY1HI22ewiS7AWRYjaAeiqhy1r+Af79oy61v+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707568; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+/8H4fXfMjhPNhCowAynbkSWEqYNMmlbqXdreVW2Pp4jyJN2UhhSLErJya+WcxMDbcdoUjWwlV9IuG9rj4a/63OhmKlVXK/sWzg6xNNnyCZelZInHBjQh69wA6x58tMtBpZAZKoGM8kBz59LR9CVtveVKobEvjPbwhSv8lMbtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQuqohlK; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64d5a7926cfso7249967d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707564; x=1779312364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lQuqohlK7z4Fk55bjl0NZZAObXDohyNSxVbRdQA7mB0duAnikSTFQHacnFCdg4bxk9
         itK8l6YVA9zFdtJ43ohraSl13dD+9A/76AuGIOImg6lubQwi4mnOs0qPPUWBPvuzzkSl
         tRfJZbb+NGCpPkTXzfQgH5nB6+tDkTN3psPDTY6YP3iG0jNXVXTra12zwiMMAw4ayqa7
         ooHF5A5CibhpjWWVjGb1r6J4jpJltAim503s/D83te6Rd/S8ctr67v9M1JqrHcFZFjzY
         XPrUfAMgwV1f7zknfN8ZJ4K+GRI2nd50OINP5O09c9w2UTMCBC8wUXfUOhwcLmRQClFV
         q1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707564; x=1779312364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=T5MdtyPxIG0K665gfGA6EnvPCqFCFnYs58iLwy5/So7RdYVerNZK68tzW86G54Pphx
         sAHYqWJa8EO4xWs8cAMXzFjVEE+Eehig2NAaQQ1pldR1kn9lru5qGuHhI0vL3xzdWcf9
         vVuIheXn8vCbDAM8zjauwtNZUWmos6QpGNG0DXEMSRKfk6Eid/sQvwskvOVI880U1uck
         wkMncVDlaHtN5kEC+dSMy3wSscSmioKsHJ2o+sq1n2Mj2GY3nZsKr/EsxMIXbCDwuBwQ
         oGNQNBQvQlRfeK5UafXyvgPl1eAV451G0qPSzHFg8IlTcFgiyq3qfjX1QIciS3j9ed1z
         Vv0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Cl8o83XWDMPNPpzj8jEIhOfhsBKo1X7iiKCviPXqszl0PNWhK4Ln13fmP1xqbT2AWTUBajLHil/6jc0sy@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0cnBuHhHlhgEN49enAjflheADsk+rMJnQkjBRXzZpi57YCYD
	0r/YPUputxSGHTvLhktZq46ZPM+Lvyfcec8UjdUWIjhcdcEM7Sa4ScKFg3Myzw==
X-Gm-Gg: Acq92OFlhssUVpglpVKpZ0eVrKDtBctM42BQco8bvVcAhhuypqZzHMMh6EGmA3lcgfq
	d37Xv0TtdJ1GYM5rrOMSq8KXFhp9Ry9LQS5Cd1ice4QpZDVsqt67DWWt4cTcOcXcIZoUD9Fj5Cu
	g9ESBzVzpImmCTEvwsNyIUGyiw2XnvDbhPqAc0LYuDmv6LbU3IJXZFoYiDtifvRbf3ctfJXLKQS
	wN5BT9zzTQdSLd4+H33e9fB5nxYMMqBmiUrW9Njz/HRRX6/CdHMANXO1V2P7YVHuVLwsLXQDUeh
	tQN1lU5ngLnbi6+NlYOMXmcSBQT/5kRXP4h94j4M//W8FhAxz/OqWxByrA8IxgBZaZ7+CDFoRGy
	8h9c05LkxWGDy2eQQ5FIjWSkC4/AszKc54bMFtv9oDQFA0ML0y9MOcxygAjXdxdFeUV6doSfuvT
	PQfBlraBGr8kIp63TbDrpCmXGVJA==
X-Received: by 2002:a05:690c:4d44:b0:7bd:4792:66ef with SMTP id 00721157ae682-7c6dc7b21b1mr47195157b3.42.1778707564477;
        Wed, 13 May 2026 14:26:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:33 +0300
Subject: [PATCH v7 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-4-33c6c6fb9285@gmail.com>
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
X-Rspamd-Queue-Id: 698D053B074
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
	TAGGED_FROM(0.00)[bounces-107489-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
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


