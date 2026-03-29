Return-Path: <linux-arm-msm+bounces-100614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P26BuwlyWm/vAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 15:15:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A332352234
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 15:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A4E63011BF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 13:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD78370D5E;
	Sun, 29 Mar 2026 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0oHk6nj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F436EA86
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789956; cv=none; b=Kg2b0HyGtfXPhUaK00SFSJ9VybH+x4UYpjvPRlfY/+ucyGf4mqhVHda7EkVXJkvoxbXDtiRags90Lv3qqfB0C0tQeeyUsXlkAJH52f2n6CUFcCgrrPst06Pazd+OuyEYIziiXF9fUomkdlH2yZHP1Ft0kXX7P8OHi4+tiuWXsJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789956; c=relaxed/simple;
	bh=LMrqkwZu/ieH+9iFcK6MY5ZjY7001IIPbG2c/91dYX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X13Oy/Jtb0hsYhVltMGzJXVRKqJGFRNmZtp0bbXODJE6ijUNE4Z0oJ6c/8HPu4VsLjs6ObPDh84iOjKEdFCEXhkywlxcXsMKmEJ1Wvuaz4xRWnYSPQFJ1Tb8P6HEP9KZqHRchxt0AQI1IRI8qiDt+TaQFcZKNpgkD5yUlFWxzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0oHk6nj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so27424695e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774789954; x=1775394754; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMp+g178cIoRt7ghKFgZJSeiR1C+eeY47NCArU/8ZAU=;
        b=F0oHk6nj38MTY5bi1H173YZIfs8ofg2GJrIWjhNO2jx1gl3/ulCytAGy+RCWcOP94f
         QheKlO3EwR88Te1XMXhfwg8bIl34eK201ZBFeIsIgsork4MgvS2JpUY8fygqL4HwvP5A
         zD8x3Hlf/mePpRdxXW5kYAR9JQdguwxXnWeIOUSPLPsurAV39SWNB+tmgaSUryLMkb5O
         GIq0rX5QNWSqb3odD6aGgE/590koNwpW54xvXnvHtWcCnmntiIyojCBXyehcpd0YN6dS
         s/20fGNy3/8tgh5WpOKeI3rZRY6Jve4u8oUMBrmYW9loPcd7+jXcDqmvk290Ul8MJclQ
         sieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789954; x=1775394754;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMp+g178cIoRt7ghKFgZJSeiR1C+eeY47NCArU/8ZAU=;
        b=rXh0WkAVGtmiCq9Scec+7QqK3NvNn1csvujkoDFKQTgzeU6N94H2D6YF5baJFvmp2+
         rx2V++ovkQ6vLQjJ6VDGg3vU6jQfog5yAtNcNjhygw62otmqJRZIyX9J7ACZgZvgAsCw
         kBkzBVAolGhfdEENt+zMQC3+V55wzd9vlb4/FbZ/XFrC6R78m+nhWlCbFLQB8jHdkniP
         KTyA79Y4U8vcNkekfwQZYvIjU920ZGoSlTBW56vT/OKtEFwly45Jg5UzRATxDuUH7Y+Y
         zo1Vwj/JE8QmUH4zvthl3BcPDiahYcy9VFPavTO16Z5QuY6ib+qpZ4C5Tn5E3NSgioC6
         e0KA==
X-Gm-Message-State: AOJu0YxLSZNHRJEQzauwM4RzPzgeS0os2ij080vh01lXMekJEvv94glk
	TSFggVCeJiVzF7h2xvhop3Rit/7lXPTrqk0fHPvodUWcTFeSLTfxh5Ij3WncQ35zeYM+mNj7si0
	6Lb0E
X-Gm-Gg: ATEYQzyCEVou+DupSvPcEHg7Z2ZXG7HgQDyz1XzjelOm6a7mKvR7BSBhi08IBsXnM0u
	Q7o8sBgWmqGOEZ2DcpqzolyUzeqMJaWK1oAEa1PxBOUDaSEsFjitPr9qBbO+orHrfkyYyo4Tkwa
	LkJh5EDvHCGRptbZvRuHzAp8sC22ySxd9gyOVyaM3Iy7+ymhP3mnzTviIs00sW5b2AEPcZNutTz
	wCCD5YAOEsVzT3fjur+f4+fb1PmY9HI0MFKKTx2CjF0x1pYEfEYsSDsqoHdqfN9/kLQuoO5BLUW
	WyABrGB3HxFpxHdT21VXZoKz1EEHY6inv7s2msRsYkiyf04jNFatOKbao1jduVyS8yj3mkXiVvf
	g9qRSLvVniTJPtoewVJD2KXZl5FZ3Czei7Gf0e24h/BFbpJJxxl3Gjlj5UvtT1y7O96tp8xF60j
	6JeGrwSep2Zk3bsGEjQ1Hkr/Y2kCurT8I8DkBJIr9mSpuueBjw5sDLZxg/tw2R7NOXmTMmvxZm0
	OlsBRSTUd0Y
X-Received: by 2002:a05:600c:a02:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-48727d59d34mr152817225e9.2.1774789953803;
        Sun, 29 Mar 2026 06:12:33 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b105sm422368815e9.1.2026.03.29.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:12:33 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 29 Mar 2026 14:12:26 +0100
Subject: [PATCH] arm64: dts: qcom: msm8996: fix indentation in sdhc2 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-wip-obbardc-msm8996-whitespace-v1-1-ba3a278f043c@linaro.org>
X-B4-Tracking: v=1; b=H4sIADklyWkC/x3NQQqEMAxA0atI1hPo1KHYuYrMoqapZqGWRlQQ7
 26Z5dv8f4FyEVb4NhcU3kVlXSrerwZoCsvIKLEarLHOtNbjIRnXYQglEs46d947PCbZWHMgxo8
 30VGbEjkDNZILJzn/g/533w+SQF3rcAAAAA==
X-Change-ID: 20260329-wip-obbardc-msm8996-whitespace-490d6c3ffc60
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=LMrqkwZu/ieH+9iFcK6MY5ZjY7001IIPbG2c/91dYX4=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpySU8OzchjV+uTceOsXUKj8rGOEiyXOrUjZ+Td
 xJwDfCxaoOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCacklPAAKCRBjTcTwaHBG
 +DXSD/9WCMjJZDXjZfst3IxBGeibEEIdtAKAMQtSBqbis41DhIWMZ4B1Jp0dEuA6OtLOobVJQS8
 F2sVDlpw44XELRAnwZQc9tWT6JsYEVOBiK8M38mEL+wIjBB2ax9rFXJ5lC2lVmGguvZNcalkmrG
 VbhTBcMmRr0CnVdrSwEDPqYqjML9Sex7d1gUtteQ8BSHxXovriQrn+Ns3UI+0ax+I7hQsNwU3W8
 AfRdYEay8x8vuosZ5NAagjcZAItfqaA1l+bXe1rl+XJ9R81W73kFbzRMbwY0K09fuZKbssinsdE
 YTMiBCe3r2DLtzasF6+AzULHZGPZQ2dKHqAdHQi8Ce+IHGXWIPgMV0MTqtWVrrF6mttYnLa/99F
 J0UOHLeXoNI/d+IbBAS8Ffzo0oqmf/ghoq6HaW0WpANYGOch3OT1zUGBA5QYvmSMZ9QNC/anxip
 5Fgg1VArBJS297vOX6LfWDHUZxViXPgSPLnaC/yschP0J9Ghjbn6wfI2XIKOgjmwt2Aabah7Ue9
 fd4b7C6a7R3d02iPNtG/rRcbTXT50PBAaEnxs+8jcOhNIPmjcB9TDDknNgsLDuHwuhpDionAink
 RU+G+MtiYVJIaB2sIpGKqEk+2yN8ilOE/MmHc8Uq/z/I80alTVOIilU1eh1VgyyzoLTXuwYsnxS
 P8YI2hCiq7zd6Lw==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-100614-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.115.28.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 4A332352234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop stray leading whitespace from sdhc2 node.

No functional change.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9d4ce47578fb4..2f67e665996f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3255,7 +3255,7 @@ sdhc2: mmc@74a4900 {
 
 			bus-width = <4>;
 			status = "disabled";
-		 };
+		};
 
 		blsp1_dma: dma-controller@7544000 {
 			compatible = "qcom,bam-v1.7.0";

---
base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
change-id: 20260329-wip-obbardc-msm8996-whitespace-490d6c3ffc60

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


