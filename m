Return-Path: <linux-arm-msm+bounces-104799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMZVMYql72mvDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:06:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E824782A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79CF030B9314
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001743D6462;
	Mon, 27 Apr 2026 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qt6HU2fO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCE23EF0BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312752; cv=none; b=N+8RK76HM0qdznGNVdH73Ec07Qcm0b3zUJBs+lsVwrNkxFMHUxWLnGAGvjYJEjKbdoD2zZeydQOkQ41FqnhwxuvMx8zFrIdCLHzZrKjnQZTaBbfDDn2wHclfZBbps8OcBpsPh7EcT7HTLzphBo9osLkKM5MO4PVmqoUjUxwjnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312752; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efiq+i21ONPUHvCi5vs+oQU4QJrkynm3PCIGofrgyv/jmxTnIM0NVhitQly2tSngHSasW+iGhmcfwN53aXxUIREpDJTDFGou6uIzogObqM32wAvIV7PWBZvDKSOBUAUWDwT9PqyeVmKrJxWsaVoFxJXilcwCNykSG/mQTltlwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qt6HU2fO; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651d692e833so10848906d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312748; x=1777917548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=qt6HU2fO4BSejfKqc7MrrF2btpnASyPH3dFrPBoiAGyTf2aBSnbxq4Y5wTM8CVjm+d
         EVtkZcjKO/06ouh800N9yL2OaelBT3WrKm7HqXHAHc6bGPWBggnZ+3KFWcl05U3NQgyO
         OlKZNCarsoO0xScwFfYbscejNqVF99k4XfhQd7dBfDy8DdFIy/OfOaK95LvjbCzB6wZ0
         wEywl63Rkx/W2PXHL+6uYVnWHoP4S4kygjLMDh5mJvkpzqaOEKVVQM20xiqt76pfGboC
         r/55WaqZIiN/69AwFIjMeNHr5oLqQ6coNWblFMh9UO1lMgezZ6QwqBT8GH5sDHmfKnWs
         OtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312748; x=1777917548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=qzrVe6DAzZJNzslQ+pf/I9h5jKzHjBbYXhG9JJctvXCXTY8JnbhwQmyDCIYrRVuXYn
         WyUFT3Rh8GZvKfF36tkba/RU6/ILjBIt184vdXRrFCZNrd5ezv/EV701xf45ln1UNqDN
         tiNhnBjuRJfBjPStliWP+dCzm8zD0imusBgP/TUeB/sIoL9SdXkU0Cxem3wb1JO4UcEx
         /mk3ZiRT1kUb/DFfSNqHmV8C262ex4FaZiyOgk5CVvblvaRrxKuUbIATAIKR5ifKXgTJ
         TuQaCiSWVFvupIQJ4cqN+cipCjzHsDgWqazVeuhjLUDj4fJUhaOf96UjX5U5OnFouCXO
         AduQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ab4LY1RuodNfDRf3BlLvHb3l5GMUWw2ogtMuz5xYg83F1zDnjJyOIoOu04SOsNCA9rstZmLIYZuBG0SQB@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUEhUq35suI20qp5k6bWqD/HL5WnpbeM3TmXY08hEJ8QCNENd
	B/OCosbDWb/yNgGFfvjOSUsS9LerZa6JpflEIBrWLf/KYSqinnLvBvCkvA+mPdxAxpE=
X-Gm-Gg: AeBDieuWWlyx+Q88hIy7Vnzv/XvM/cq9LjSxPlPzy9qaqjiJbKTiLyqfPiPbfrcPokb
	96pP6yDI2VkdegIM64W4Zr+7ylsqDKlJ0shh6zoeI98uvWyM6jwRLYyG0K7fZxZeiCm5qCG/tOO
	vm8BSf/H+SiS2eOnWTlhJvfpaSWK6vrwLZ2OpJlrklns80DJxbw+MepBjswVGL3tEGVhCRj0Xj+
	i5CG317FaJ68E0Wo3NWeoJnmm8gDtXBX7mmiB+KAHqY6UD+D3HlYk/+XLwhxHZT7rgU/+55kpvN
	bVkDSWvYvWmgvzep6aMTad8TbqdP2TKhC00h8jx9zr+FjnzFfuVSf1oii/ssny95rglRk8OXUij
	lhPQcnUSuFaQliFa5rvdUpuqLLoQjeSG0HpOiEe4ZmESpiagpIbYL1lpRx8m3L+jgdl3iuQKzmu
	TQBVzbz4JgYxqRRxrLfjL3MUOdVwUelH502F+O
X-Received: by 2002:a05:690c:12:b0:7b2:aabd:535b with SMTP id 00721157ae682-7bcedcaff28mr3033417b3.27.1777312748556;
        Mon, 27 Apr 2026 10:59:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:28 +0300
Subject: [PATCH RFC v3 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-6-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 68E824782A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104799-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

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


