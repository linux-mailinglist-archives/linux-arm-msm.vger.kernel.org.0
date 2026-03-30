Return-Path: <linux-arm-msm+bounces-100744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME7eJZlPymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:25:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62C3592DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63AA530B4916
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C91E3BE15A;
	Mon, 30 Mar 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4z+A1fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73783C5526
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865683; cv=none; b=d9XmzAtuRchj5ZTo6UC79MdvehT9yVn5WGTVZVCe67iXDuVYe4jqfpZaH5A8Twa8DRUKwmpuIlKcfBBANoQkEEKMc2I4JyrVXN2D2lcBn4fPbxA9O7PtHTXG8UxNM5UTNvLZJlHrNR6miDWHUiCy9nYTR5BBSudFmPXHbaff+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865683; c=relaxed/simple;
	bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LelX9a4JIHwUcMxplIeBcxR+xe1jBaQNwkXE/Sr+YxklBbG/eGY/l5Ug0hZcj9mjqFzDt9AdDYp3HifF26uMQhU8eG0UT85nUNWwvuMBu1mBLI2IBhDQYBzwe9Phl3AnLKObsEar5mCGSjRqUAi8LvQliVxEQY3ZO4a/sM5XtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4z+A1fr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c768b85d5daso1813509a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865681; x=1775470481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=E4z+A1frgD7HbSHpoU/RSKkChYO+ZXoZztnuNsgGGb6F/iEX5+tceagHHeXwaIJ1WN
         dECc/pyPwbRFOMMX26ez68MulsSMOGk6DhPbdy/DI11d6yZoEDwsug695MdKkpW3uw4J
         9T4luZrjzcK091v18+zAHyBKpXHFmlCm2I43OKgl0YSbL0y8CNhLLzUoxplAMd8gxcPk
         gcfVO/jOVPFzvXvjYovdAf5kV1xUXZ5YVGfmcpc6qtxeXjVtZQXdd6w3ESpUwYToAshb
         RKz7XQj9LvOdPdQ/k/UcnsGoxFkgCtyrB5g5IbOtP5geNn5zuQT969OJEVQMLDlIH2iX
         EW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865681; x=1775470481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=OY0XxIGcJectgHRS5aTPISGNS1DW6epIFQ5eqCbOINLuMz6eBG2iJ+qRUi702qY15k
         wjT/7SBU5z58ozmiiDUgny4UBcOwgei0ymJuX2uWlz+7tQvIeX+I62Y6i1Xx0yah0KZ4
         DTiBqlAI87gNfgrzLUt8R5lj98uu5tb5SxigOTnGzhuMPA9nWxZMorH96NE6AtPmk5Xi
         2T5Ar7JvKi/OCbn6sn7lVwSiQHZ94QOuSDrWoQsSmfKiCs8w3DMo5EaoCw63za/XHKDj
         lRoNFOP4FU55HBNFgwov5Sck3elU3rV62MkBxlyugZMoeZYCI0hvjtunwI2km4HRFWZ8
         o0iA==
X-Gm-Message-State: AOJu0YweMhXaEn9ImL6DSvU22VF395YJN4T8IWpxhOBXVAXNgy7dZPwi
	MnM2gOkOSVZwdVCOiH1Rv0l2rsrcDo2yOCxi+BCYc9goI9ipZzo/Pp3m
X-Gm-Gg: ATEYQzxy/aSR0QG61LMyavEPhEKf7Vk/SwSCqSC46YBtCJZZFDwZkizVeU5HLKCSPrx
	cQeyesggQbptfDqDGvboAw3DLQqK49zZA2qt7YHM4/iX+/jmfjHYuN0f8a4t3S6Ym4QQS5cCDe9
	CZRwm/xZOGA6caIQjTUjG1sam8gDSF3zIXFBO2g6KAipDfUyJ+EMRTnJuIMY8Yx8zni4B2UrcMj
	fcG8sk8io98XuWi07Yjsc5CVPhaT7Zk9EbOkdWZbFB2fMSY1Aa9VE7mHmUDMCmMSF/5bdwNNe/L
	6agQsXuJGlB2cPrQkNuTfai+cUlD93Z6FMzyinCf2OIKQQYoqDUS7gFUrdT70U+0vf8f/42XMVI
	H66zNtNZsc5TMQaARZhxY1KDnhF4V8zenD/E3H3Ty+I5GqU2guDqbA19RWJRJa7za1MqSnuRpgP
	aCoQSvHNISGVOhnlbe4ni3izHmayQkvMGIIOKOD9o=
X-Received: by 2002:a05:6a00:9a6:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82c95c16692mr12268865b3a.13.1774865681008;
        Mon, 30 Mar 2026 03:14:41 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:50 +0000
Subject: [PATCH v3 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-3-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1039;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
 b=LS49TNAgLyEV0MUfNYzBAWrsjMBXYW89M52LKh6tWjsnkPwI06uo8+pPm/rfZlnkSJ+nUrkiJ
 YfNIIlAMjLCCZ2/KOG1g59f47bu7VFvehWc3ihP1+UruyFKJPSTle7C
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D62C3592DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the vibrator on the PMI632 which is used on this phone.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..88691f1fa3a1 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0


