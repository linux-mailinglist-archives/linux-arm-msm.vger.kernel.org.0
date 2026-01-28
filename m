Return-Path: <linux-arm-msm+bounces-91011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCAqJqUAemnq1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:27:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1FA1356
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFC2C300443E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FE434FF67;
	Wed, 28 Jan 2026 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cXv3WHM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5E34EF06
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603222; cv=none; b=IZthScRNrNn5fQuLDInYxhFHkHrbXpcB1OOfr3QlZbtgq+iDHi044WxG//fa6t6rNEv5KbQssywxlqYtHGEWVC/h3KGac9Q5uZRZsO0I9tW8uWp9hV/DeTQpUr0Ba8DCd+x2POAFTgmAjHQEn4HCGe5JDLLP4LEQidIfazoQCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603222; c=relaxed/simple;
	bh=6q37WeeQdbfyWtDQufhuNOaDmHWFyJ3gZhhYFvngdNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2m8kd27leFeBOOGF5hOoiuUhhCma4Nznzo5BlGHEwVh5ANqEur8irealqCSYz8bUqAgM8VZn9z3pKgbT2hhwSmfh612v6pwadE9QfTyayBJVmsRDPkoO1dMM5qZoSSvtGe3O80JgEinenwRzpXnxskCSxdgGxxFDT2qLsQzzu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cXv3WHM1; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b885e8c679bso831241766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603217; x=1770208017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmjzieLPBCEhG7O94WSZ0LkfVKWhnb5wTsqAsIjf3XY=;
        b=cXv3WHM1WkOoYSYyQfw2nBIxGtFfC9RPgy/J6eSg1ulwE+L5EXhyFtD/5e1NOPStrp
         /4MeuovFphaK6OCv406FC/wEE7S71XiMs3wwH6cePTH7iUppnn5cWPCIaNTuisZsbMPi
         utr5uGboLZeDxqhwyMG7ywW7zs3kBmPrYyzsm3NsGY2vRN6l/ZkWW7s0accUaOkqRc2A
         UgfKbNJkg5LMylM/HyBhytrGi2YhVOjzTukIjx12lc0bZdM6dtZM40uOvP56Ri0NpgB9
         a4oU0qJUNvy1D6yIxRYymN3eYqpG+vB+hAtD1vfMPtD26dLnKkQud9Jyf8tO2G9MgvOb
         egNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603217; x=1770208017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bmjzieLPBCEhG7O94WSZ0LkfVKWhnb5wTsqAsIjf3XY=;
        b=AMrF98EeKc2CyW+sfRjFgOWgKkhJ2tBBZD2HQ3W+2F4V1F91crVNQAI7+gMUHLXeIG
         407rK5ruObBMZTakkN02gD6MxeaK2YQv0Tm3fyRwc5stuYd/B6bllI1DqDkpnPPW4C75
         avSUXFCYVpK/21HKQoIosTCyqCC5fPbYBkj08VIRwRy4pIMHFNt95QC6dt5LQ0a0m9FZ
         0LXJOxExhGCeClfc9aYVieOqvD2+hLqC/YSXPAJR8kzCE4T3akTpu40dLZAlce9heeUS
         EYM9FwJK92nWtWv9Zn+riT3JiWgB4C/e1aARzFN7uRaf8hG9k2nhtgbmHZpNgt7aqC+Z
         EQbA==
X-Forwarded-Encrypted: i=1; AJvYcCXKOpyxECbO2a4Pm2oTF9x1sGP+XyUXDyAtboU6uJmuRZ7L1Xskj9YQkgvdBWeJ232gEY2nDsa7sT/xQiPL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2px44py6liJ+oQyQqVY3cEYCweTXea0wHPKLf6bsVquM2ItM
	MulkIvminVv2CduH4BSVIT7O3CeT7y7hUIHMPEzWqs+80LeXln9gGd+MOlezPHVELQuF6wIOVns
	IrRSMvKoc3g==
X-Gm-Gg: AZuq6aL+npdLG6HHBDM2h2tPlRsdda+9YlTgDw0MDZJJTH21pEzqto6lpPBn+tK7O41
	ztxr7UWZlHXe/VIeh1TctBMfTfhZ6pg0lpvJFA4lfFOCRzpqpUU5dxaRZX8T39uUWRkoYuDYg7t
	y1s65HZ6ee9A0g2JcdN19hBJ7m4FW1NYzF+D1ZFwx/SQYRVqrpQt5V2a01FNdki+d6gYe8gSy7w
	fNih455eogPC2gLsDHQ0IATD7fsOX8ZujILrCN1BaGSTQF0ZETyADDMeiR7DdjZ2IxW1Eq8hAqR
	GFNXfZyQINU4Y9S5iRB3A7/15cWrVaRh5FyYolKQftJ0JoiydAuyPuvmuX66SpgRvGDW++Uy8OY
	CenJLgbTBd8Arv1Odg6kDr5ATN5yDG5QBdjp1OnLuXZ7Hb9ZY1P/tTpKg+Wy21/A3Bew9hMRTy3
	2DD2XOzQv5WnAua18QaV3T42Aq3fdKonkDTtzvz4eVRndxL7H4pGvy0Xk5crKI9U0MWA==
X-Received: by 2002:a17:907:9688:b0:b8a:f7fb:4f4d with SMTP id a640c23a62f3a-b8dab1a4686mr373282366b.16.1769603216835;
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:53 +0100
Subject: [PATCH 5/5] arm64: defconfig: Enable LPASS LPI pin controller for
 SM6350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=778;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6q37WeeQdbfyWtDQufhuNOaDmHWFyJ3gZhhYFvngdNU=;
 b=O2JhrNZ4cx0yR4rIclFuPK5si3IJLYw2s5Eatlepxy7kLpFKU0/o9C0bpUkv9kgglYZW4StSQ
 pnf0PMnNfZeBCJmTjmFtj3Uh+/chxTyFPoXE08AMOzWjHIem6EMS5tE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91011-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 96C1FA1356
X-Rspamd-Action: no action

Build the LPASS LPI pin controller driver for SM6350 as module, which is
required for audio functionality on boards such as the Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d383..5160b81afc6b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -694,6 +694,7 @@ CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
+CONFIG_PINCTRL_SM6350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m

-- 
2.52.0


