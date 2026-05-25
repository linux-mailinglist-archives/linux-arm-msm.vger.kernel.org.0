Return-Path: <linux-arm-msm+bounces-109683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOK7BGRiFGoONAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E355CBF84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D7F9303CEB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2113D3F20E4;
	Mon, 25 May 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoQ7A+EY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031E1B983F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720480; cv=none; b=LTh61B0dRPhFw/RpgXHGJqZkme1EPW5CnCDKkNKLUoRhYQxHZgKSBCooCqVgjyi7xpp3UcGxd9++ctCAHwpjg01xj0EVnjMnyTw5QHfkLaGErShjmDNWjZW8a/kMyUckGcqmVdGPOdrQF1iRo78313f4Gz5BgEhUJO5OycQ7+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720480; c=relaxed/simple;
	bh=ApyTNGQqGjBxvFRvwMaHvvYHMwId1OBVvi//Xkx5AxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgZYQAjZ3eSIuCtn5LxRC41QZzCEluS03PzjY6s7AGRu8ijfdrMN/FL3t7b7wro5Oc806wiKqF3HYtE19S/sEJ0+Cwi9omIBcrT6E0QY9Ix9FkkDHZFoZS3KvBhAfFAowTqFy6FmHtfKe8rS8UDJuvP5gjoRjUIsVxjqtguFkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoQ7A+EY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so5819028a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720478; x=1780325278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqwtJk8xmatM/f20tiZM3MnIEuWEW+BjNIaufm9TpJE=;
        b=MoQ7A+EYfe7BKJLVo0cLGDctXXJ1skLbBTwRPdiT5c/mACHra88EM8jRRPMcdroUj1
         SJxpG++n4pqxLuqzrmWZ8mFq5MT+W+nMlOpyxdZ2nciSxERtFw+nZD/A8UlCk0rvPksI
         xxkx8sRcAv+Ui8GyF7mGegHYbVShHUjczntM2J+YEtV6KN5li/EwXfSRZqHgfRCVQPPu
         y+QNN7r1EW3omWbmOyaBnRXIN+BFd68PfUIf2dq7sm1M2txLnjUcQicvwWo2Fptr3UtK
         JKfE1c1t4cKFBK+/7KVEWiHBsfUC0VB8iO6XNG0eHKLEtwh4Si1qKehYrmUODVq6Uc1b
         2fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720478; x=1780325278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pqwtJk8xmatM/f20tiZM3MnIEuWEW+BjNIaufm9TpJE=;
        b=dSRra8TtyD4mlDPpNzenga8nL0EK6DNz7N5lmuEn6JnIF9nnF3n5Dfb5woecrK1D5t
         hcJoCKZSSAenprG5IG+SFfCDIdNUwXnohfT4iJ1b61L7skto1BXbF18cYMVDRWP7lik5
         Cz0ALV86YSigTyS+DwjHsrCaYsWwHE7eSta0wtAgeABetdo9vUXzbBW11vZ3KiDaYfoP
         MKmKTWtObfPHNouA2xEXWD1EgFpGrry0BdhnRVAhmvBLluqJlx89PCY6kLi6O+2kp1/N
         hhDgi0pghHtlV9JPUOqcYu8HH6Q4rYj3Y42f5Gs1CGjX/wA2wGhFwBJ+qk1pviiRfhDu
         FOnw==
X-Forwarded-Encrypted: i=1; AFNElJ+Gu1u/fuobZ5W6VP5BB+h8lata++kpDAvs0xXgKGDGgmYVD2ztP2Sccy7ahTGcOKJV2pl/ZKCqLbKZLLbg@vger.kernel.org
X-Gm-Message-State: AOJu0YyfOkLoIJvefNwfiiOX/bNrF1EZY5Hezfuvo2zb1yVX0W/vICyx
	gQHSgvuDEecMw0zGSbnG65jM5Sy5pAFlKZr7+2DpSYgZMnNc2YTaH9Cz
X-Gm-Gg: Acq92OGBqRaJLEkjp8SAvvyStzlRQLweWLssxl9ygDMcP9DqujZ9bwqTUWIZJfglsoM
	LmwGcDQNresXA4fYIOx8Fi8Eco3jr41EeKxRG2x0a/9aWUlpQVlaAoVHHHxkpuu64CRWRZ2CCRl
	qXTkraaPsGeUBqSBqSte73hY+Rj6m9CZ78InIp4hju3RvxuUaGBWlMScotgKOx4GpcgjovNbtnl
	GrfKrb2y4zf4NNHB7nBrqLEKeqS+M0ifEGWSrx6xL3Jv+8+VC0W5SQok3qN6m1SVkhzwTqdc0me
	V3TQzRQ4vP6z9Z6aJ/IfyuUcFYTKDLvqYZIt7Qv0IljL1QjsjXtTgw47ERLJEgKMldlm18QyiKS
	Dhg7shJ9koLST0tM5UrdTDjtGj2EodM/duDbkYfv1rB3sOczqVTa5DYNBlsgrfXro6O0f2xNxW+
	Y1U7mJ4VrNG2MFHYIyk2qe2We6vmcFLNXilwJ64+kzj/3asvfw3A==
X-Received: by 2002:a17:90b:274d:b0:36a:caa9:47d2 with SMTP id 98e67ed59e1d1-36acaa94cb2mr5894653a91.1.1779720478207;
        Mon, 25 May 2026 07:47:58 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:57 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/6] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:11 +0800
Message-ID: <20260525144629.498630-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,ucw.cz,kernel.org,glider.be,tkos.co.il,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-109683-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,st.com,socionext.com,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lumissil.com:url,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.68:email]
X-Rspamd-Queue-Id: 66E355CBF84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 258bbbecd927..c528d42bade5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -147,7 +147,7 @@ led-controller@68 {
 		compatible = "si-en,sn3193";
 		reg = <0x68>;
 
-		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.54.0


