Return-Path: <linux-arm-msm+bounces-106303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIkIOvhR/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:48:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10E4E51D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 328D731232A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B7837DEBE;
	Thu,  7 May 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKaJ/t5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C4373C00
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142869; cv=none; b=kS5imkr86vk3WhQJfajGcWADt+8VQ8aDNd4vfLOqlrkwMc9KGjP6BmnM2JCjfRn+LFsiHW0RcoEYfEwfXqVtzr5tFQ18VTr0lSLHn5cWSiGfaUK+tjKsNTmlPXCtOvc7TRPCLM3B78bybCPdrWyEY/h0GWea83pxztu+gTIXvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142869; c=relaxed/simple;
	bh=Hgic8MxAnTFchNHGOEh1DGqhIUm8syxUYUmVA61qdbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhYfTwEWiGYgh+VYoB2t3YZKFcd3gLuj01M0EtSILvs1O+FN+htRQPNVTmV7FTXhYGAbLze9lWppOalibApAevuhBTdclvGkYFzJ6v9q0E3W43KiYWsKhKsLIpJidDr5eX7LAH5BuR/wjopBfl42y4nM/R8sAF++R8o4cm3DY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKaJ/t5P; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a2ee65171so4721247b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142864; x=1778747664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=pKaJ/t5PeESzq4Ku8QJaTko0AFoNXDrstBGeJbCiaaOYOV1Yxgt6ECLJ9y+19OFDCJ
         jlHvWF9kwHqyB4z3x/RApNHtEefxc55zgwp9rT7I/V6x/bStZfuVW1zximSBx6lc6YMY
         F/cseBlHVL/fn4/aOZB/ycQba4Y/DqaG/RLLggT4lCMGxBzB0h1Bdw/MLtrHf8jU/QVn
         mV7XmHoLGY9Q/2yEnq5clF9V/ZlpBVg5BvtAz6hTuTUWbqXz8CTt/+65o/FN3ydfPDRW
         x5YL9CFCKs146RuwF1yslsWhtjcrEhV5BGCUO3FW2Rk2oE3CCaYtvxjFpDMNuit81+Rd
         Ue0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142864; x=1778747664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=Zz9wxGKeofvoN+uT+LqMwIdu99UbTlffqtMdHmPwQgRw3lVhEdYR0Xux48tbuXBDbP
         epUNraF3ruzPAjHgICINnP4rzhlwlg0RCY4rAJQ6g3A88ht+iws5FrPj9HHpzyrI+lWV
         B6hleqwB3wCN2Bf0JuvHi5DJZ1E5cFRLLEqoXsBPaYJfv8CY+RuxuuMEjIqwMJEQ89Ha
         I4oRcRk9EX3ot/0vnIOGwv0SuDl9W2JxC10JtUDN22CfH7WZ+3WTuYhtESMdPDJVWGyl
         ZqrAL7NPk6MNO4Oe/XoYRAVLcaBOSB6XLzs0UMxmtzCU7dYRKZQIgjhJlRQa1MdpZ6pN
         Su6g==
X-Forwarded-Encrypted: i=1; AFNElJ9GE7oK+P5rJse1Abdkfdv008etWmNXKkjq7/1uBo/ZDxm45WqTIGzgAcb0GP4CCwfM8hFoXhJvOTPzBol5@vger.kernel.org
X-Gm-Message-State: AOJu0YyIp55arYnDoRsHussqGcejqkyzcX/bQPBx0yONZ934EGiVjx06
	ohfBYrrn2EoxxpP/KYITqWVQE5XSeF5UgNN/TdW1lC4T8ygYvjZRpNpL
X-Gm-Gg: AeBDiesdLWDjmaralDwQgbdFI3AJGwQOSKQUYIBCLzvL7ikaYCYfp3zqrJysY4X5Wth
	OS9W/vjvq6f4OGuyMhd6dY3yyGzGlR9/9mV+dn3bA6gDG3L0a3gzC16kKeDlnwmkuTgT6vd7abM
	PnFvjbpUthjcn4rPAZmqrgoNgyWelf1/5e/n0VnffzZQbyJ+qHYDTTwx0cgVcvM1YgVfsIwKsXX
	V2a4L5EzUDF/0/jDNb93ihT4zkBL5vN96W5RnF/96Wy8mDuE7soIL9OWpmPzIY+dYd2xa/7NJQQ
	FJKzxQgUNykfoYWe4rraPxpOoqVaIQtYFeqO2zm1+OyDZvNaUT/6UoR/wBMfW7h/TxhYCDYLwSU
	/UpeE9pNx1Ko0YVPWkWbxEp7Zv6TYp6IMs1hSvstpU5gcK5xapTgFe2xZImLqc15VYSR0AO9gK1
	U9EA/5o0GP68s1otaVhhQCe915jqP8N0RigWGD
X-Received: by 2002:a05:690c:c4f3:b0:79f:b903:88c4 with SMTP id 00721157ae682-7bdf5efbc18mr71178527b3.46.1778142864586;
        Thu, 07 May 2026 01:34:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:23 +0300
Subject: [PATCH v5 8/8] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-8-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
X-Rspamd-Queue-Id: 8E10E4E51D5
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
	TAGGED_FROM(0.00)[bounces-106303-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..89798ad1087b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..178274d10c02 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -207,7 +207,8 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->enc_codecs = codecs->enc_codecs;
 
 	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
+		if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))
+			core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}

-- 
2.54.0


