Return-Path: <linux-arm-msm+bounces-91008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIzYNO0Aemn31QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:28:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F5A138A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D672D3029241
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A7134F47E;
	Wed, 28 Jan 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bM1AAuD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083B33F8C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603220; cv=none; b=BbTj9L58TpykAR5wDUguM9km83674gZAg7+oBMQwd5L3lqn4XZQcLI7clBHJSgM71mkb/RxcwJSjr8graLbePahDln08s8JfLA5JrHi0G7Nu3W8Z41JbSpcscj5h26GLCVfAEKNE8qxplu21tVyktpt8qmthDOFv0RGwksxg9L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603220; c=relaxed/simple;
	bh=PMp+SYYveIhSJZHGkVejvHSGEyMcoktcC9f/SvT8FV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XrjdOH4pIhShH8kjXg8zkDwJOfO/Ifpwgb/6tLvmz3IP0qyx3tlTijp6CxTWpa98E3VZWG/H+sBnFu4PgccZCoplnXRikBCy+KmA6gTr0J7fBeg37jVwI9hNbo/zkeefa+6zB8IdnTSwxkw0Ib6fLSKCHRek0iK3LCg5IvM8euo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bM1AAuD2; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so927811866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603213; x=1770208013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5z0ZO3g+Pz6/wrKMnuRW0D0vGmyfcpUHFLY2ZznsM=;
        b=bM1AAuD2KvXogd5aScJ/QmkjU/l7uS3WAfQbGioAUERsUe9UDXyHsUHajfaqFIXo9N
         4Snm8sCVXNnnYfSKUahtMhzGkAQ1Qow5mkWva/H9h1t2utCcrnrTZbPdV61XRcO28Wje
         t2Wv+Zc5wI5Nj1B4PybxafeLrR9VjQXcPaV5aYMM0skZOn/J6g7fEPBruPxy8tyyPV7U
         M0WFhhxqjYThZlPXApbZcx/XeUy0u6/OMJhjnVsHCb5CPRZ3AXVm2ygoNnummgg+44ib
         H4ZBwJ1lTzrXTLh4eUe38YFisgowgXU6zgnJH14ycxGPgbph3A1elBe1iynh2EuCmcQ3
         6pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603213; x=1770208013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t5z0ZO3g+Pz6/wrKMnuRW0D0vGmyfcpUHFLY2ZznsM=;
        b=Sl3jctMiEMsR3xQ72gDXbp8gE8iuoYGzxtNT4J2K3b7zwjm7jkacpX7BWgYN99Kc/2
         Bxe9OLb1fX27Lf1+J/Qe+g9H/4EM9EanlNzpuy+ixNHXYwXBfAOQWkFNovlQOswuJhMz
         yDSnqTouNnFLAt/TiyJj2lvh8Ki0zBInVCbtmxr/9QHJILLxHi3P55QX3aeZBUBAdefc
         6FXb6EHOSFMwjodm9xXWjpGKB8NJzYzkPyNZY1pZ1ujzMSHcdl270TpNBNmy/sJB1uzD
         sK8i49WjuBm2o2USPjefOYbHZumycPWW853U43oOMxRqn+rQYSJhJQEG9R0E2tcsvY4m
         XULA==
X-Forwarded-Encrypted: i=1; AJvYcCV4wUthIoO7TFTbmkAxSbtYbkbhYhEWnPsr8QHwm5TwlNgGU72u4Nulklmzw7t1EdIb0vZqCGixyzDDd6A3@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/iak6QOI82qZxGau58sItTiehyRb8w4YxLOfpyRebFi/dlQm
	ADEWAQDdHvQ3GK9Iqz0DJPDINSbmYymj7ovbEf/YyqAf/KIUWJHCaYzhcANzCtRu1kWVpFDG8AC
	5GpUitKnSGQ==
X-Gm-Gg: AZuq6aKueppw95kC6TpXC3k+8lM2yg3uUlW2bk6DD0cJE3HZ3JiKx3rXj4m3E09VwkH
	qqNHETU0xgCJK4cdIatrYoq+On73wxaPhVjIcM/p9pmcCpD47ZoJavoI9tIgd1B9r0w/Uvygzw+
	MXvnt7LgV8XjDZIZLoRaMxFsnAErco0vxczF9kuGqtrFrQ7qQSTWtEkX85cQYJDzfKfkGgfIG3I
	KqNbPaeyPy9eHmJxnRICIsOsLSQIqfB7HjRfixu4gL5K+7UUuwBHsHmotWfTMJO4nzTNZsXNf+R
	yQsflj8fJuNCs9dbcPrICS4golCsDgORHQKmdXp5YCS6+Lj8zbrl2ts7Zo503iLciblgu0ToaEL
	Byf+j2Sb8z1lTH0slyFss9BGUjjxkRo929usNGloALzU59qNYIx3QEQraPFSe68pulOLuTefNgj
	BNnQZV6R05xG6RMD8pEaLRLP2MOJGmZrn9v1kY625XP4iWVElHw7dswav9DcavTKmF0g==
X-Received: by 2002:a17:907:6d19:b0:b87:2c3d:ef08 with SMTP id a640c23a62f3a-b8dab346cc6mr391601866b.33.1769603213084;
        Wed, 28 Jan 2026 04:26:53 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Add LPASS LPI pin controller support for SM6350
Date: Wed, 28 Jan 2026 13:26:48 +0100
Message-Id: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtQM4muEi1KpxpIC40IorsnL
 d/i/wcyJaYMnXgg0cWZ91igKgFuHeNCyL4YtNRWKt1iDrZuJG4H47mFgJN3o/E0NdYoKNWRaOb
 7P/bD+37vl6xUYQAAAA==
X-Change-ID: 20260128-sm6350-lpi-tlmm-bdca4deb5641
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=1773;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PMp+SYYveIhSJZHGkVejvHSGEyMcoktcC9f/SvT8FV4=;
 b=UsE+EyCE2pBBQZcFymi5Q0PEW7r/CykmAv6cAEboBbsuABg6FyiTEFpjDDYFfyMV5kqMeo4vV
 FWV/6spJRJHCmqCx2acLsST+juopXH9Pt4zcWzBt6+IF99A/YA/J0Ny
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91008-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.software:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 805F5A138A
X-Rspamd-Action: no action

Introduce support for the LPASS LPI pin controller for the Qualcomm
SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
in the arm64 defconfig.

The custom slew offset for gpio14 is described as
"qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
some reasonable solution to have this handled correctly in the patches
here, but suggestions are welcome how to improve the situation. There's
of course several ways to implement a solution for this.

[0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
      pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1 for slew control
      pinctrl: qcom: Add SM6350 LPASS LPI TLMM
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  66 +++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |   9 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   2 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  20 +++
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c    | 149 +++++++++++++++++++++
 8 files changed, 372 insertions(+)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260128-sm6350-lpi-tlmm-bdca4deb5641

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


