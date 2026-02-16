Return-Path: <linux-arm-msm+bounces-92972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOdBLo8ok2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:24:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C214492A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6261D3053B1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A94314A9B;
	Mon, 16 Feb 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byOUQlHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C0311C2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251720; cv=none; b=eeLb14RnGKBX8Ly5RLpQtX6GTLMfEF0mlUE7se+9BkIb8UQP2BdhJR1IJAZRy2nojBWfXk8UaCoKvLC2vQYOC6v5iW75irX97AWYPsRINvfpX+QvaY7UG2lDJmyznwJonr3Y5i8yB3mF4M7GV/58cKHrHow3ugVQocRC37iEkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251720; c=relaxed/simple;
	bh=gNRGWFg8BciC69sNOtnWd0kGP1UBPVT2I+H63GUNNOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SD24EfopuMIQZnqs3LAoWT15xxC2+KZV4MNVG2/qh1sBJcGMo4fHV3EjBdF+W98HaQlESe/Ck4h4t1acq8WdVXcInPt95Vjd0KBfdLXUEyX/efJkacxV8wl7qzzm81WAENYG1yo1/0x0kSfyyxvX9kXqZi+qeHlNGbLujrccqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byOUQlHn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371bb515eso36262585e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251717; x=1771856517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9Swo8EHFlkKGAVfWwzLCgBH0uCFJkUFACNjEB/L8G4=;
        b=byOUQlHnfzdAVnJpsZPScdNFE/ieN0JPrzJrXIbRauIKCVG3eXX8QJiB9etCNNTbOc
         ek6r3fUyO+bJtLccVXZ0Sgm2xeI2izW0i1M+Gf+3mD2WY3udYzJfw8u4B2vW2lFHMzv8
         ev/8VTRa6sJVsiCmhSY6/ij0+ykSnFID9KTfELiBb6zT1BwXBfkxXes2ViyBzK8Z2I5+
         yH0vXybytDnmN6rqmLrfbEoR8UwlVDhDrPU+An9bF0wmVVJNpVung0/xomzjP1uqJi11
         g5PWmY9PXQY9MJxaBbB+LA4t8lRDhNi4Lim6OYwYoGdNl7rmHTW8KrDrP3R+TmLeblpj
         boMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251717; x=1771856517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9Swo8EHFlkKGAVfWwzLCgBH0uCFJkUFACNjEB/L8G4=;
        b=WpWDrNro5nRRc//Tbf8c921Jgf/Zla4UfZNhgIc85tahod3fWjdveMrdaz3NKPNu1v
         mSjMwbe3OWDi1VWfG9JBHL/nvGL9BcgWFRd8x8YSGiF/Ibv89C19KsqjVe5SKW8BsGr4
         TdHlghmRCozfPIPcACwi9IxkXkz7k/Apyo8VDpVt0A3r/EKNzsYde6o/v5d7Wet7U1xJ
         Ak/KW+Cuc2p3MlKH3OAGgcofArcmXPscvQ5YF4wT083lLeBLaE3HqBAaXmu5V6ni0idX
         2QmDoVUeL5GGjv5JBFjOdNIj7/KxkynKaIWiy2YMreqbO/5oCD+kM9aw33b3b9L/73UY
         4F3g==
X-Forwarded-Encrypted: i=1; AJvYcCX6UwmAhcx/73fiZ1HWa0yuC5Qx7vhC8wemCxGCifhTiKjChievYi1TYXyjgSG+IhrNnbimY+0i5XNmas4j@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyo0cFxgWz3cZ02tVj5YhnP7aEUzA849ut8LwjdfiN/yyVaiHo
	bnY9mTGAn7KuiPiyptnv/phyyZq4eqNr6zbMqWWA6E/1t9Nb3OzdATEDCjErXBKDhYM=
X-Gm-Gg: AZuq6aJ7ulPJETV8PVT05ZN23wS0/aJiTNyz/qjTw8S4mwNYuTknYvywggjM5ldi29O
	82ouXxYOoV7j6lZcCzzFlGiFt2L38Va79fTf5edZQJXxwl2ItSTYLjSHpkq8A1puOaSlURwWxJl
	hxBDiBspjx1EW3YbRl9xLgirZWPQ9fql7ohdeAIfcpK0WvlEYH9we9fI2NqSbumbC788yiPgu6e
	eIcYuY12JHJU4xnnah+7iFWemrRljiy0QVYF5k9XE+Kx8/nKk1z/EgDTuq9r2wv+P5mOqG2satH
	Hq2dBXY6kCHe1wJOyjSb7lBRwNbOeFiPKpnzj6NChfW5duLOlNt9FpDHS37b+7Ok6NTa0OIvZld
	EP5mawYHpxzWD3FqOiXVfMTJ5Lu0vWPYMsSYSyy+KUxnHmQ+fJ8oKD0uMtEOEc5DrStik7twI06
	R40sfH9ixnEHxeT46+x2NwcxYreNsSCatWZx+0zMcfmA6O
X-Received: by 2002:a05:600c:4e4d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-48373a661ebmr174878405e9.26.1771251717262;
        Mon, 16 Feb 2026 06:21:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:49 +0100
Subject: [PATCH v4 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-5-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gNRGWFg8BciC69sNOtnWd0kGP1UBPVT2I+H63GUNNOw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf8RIFsAp7s23x2o6Io6/7zg8SpJVZF1WB8msk9
 5j22b66JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/AAKCRB33NvayMhJ0TMwEA
 CP2YDUnqsl9Gn67wxmjEyV90tlvminbZqLB7TTbMWXXB0yV0fJGEa31VJ4WxYFn3WNgp474NJUgBYZ
 QJumQwJSFEUQYnnCwf7hJ1XXxxEf69SBOtuaetXqLaZSd3fJ+ayWOBE/jCM7L6SWTenA9EyT+75/wX
 ZhbnxGnsONJ4AP5JT6uBFtXC8cvU/mmT5KncLAtdI4kdR1YDxQuSNxrpSBqcVji+DO8461PYtLWdxy
 ZMYRFAS1n+NU70VIesZaYSygAz4VqHkPEuNqwvcBtQ/rnnJqTrRJZJtKPq4QAOVTYv3jDnc+dZY6t7
 Z63l9a5nNtuGuKZswbIz70pOSLe8gQj3coSTmJUM/K48bjFEYV+Z/v01Qf75/A9ZXg9XiSAnV3ULfm
 V9xx3Gdlz7LVxR2NLFfLzTM77WxwMD37+1hfJsKec3Whj5bpBBWv3FEOSueVwDya0MQDb5C5NQ4oRY
 b1JtVubnau7oFZxkj1oVcLm5ET1Zjto3bMwZMK1RqOU427DXquZUUSvFEC4JqxW3o91OKg1G693vvi
 Miq12zKVxb6PcEjJliKdA0hdj0osZk3e2b5MQwxVk+LoclPEaTcaebglU5nTxjEUjoffNy0oOpAGWd
 siGFXe6Ax4wpaZ4geFQC8ofacG0s215dE6zmpsYOe1/1h/VKXBM7jyQqm39w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92972-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A7C214492A
X-Rspamd-Action: no action

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 35e9eb180c9a..5efcd4943a4b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -250,6 +250,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_GENERIC=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


