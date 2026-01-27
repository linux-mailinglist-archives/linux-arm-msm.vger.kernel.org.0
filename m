Return-Path: <linux-arm-msm+bounces-90688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO+rAICMeGlDrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:59:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9892458
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A35C303A844
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666D73382F9;
	Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4iSseZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447C339B39
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507869; cv=none; b=Uy20h8pq3b61NUkcssSquSIBBtQRnbCtayo5qxJp7NZNGAQg1zHQy/OWBHz21GgVqwjXA2+U+OrcMIJ2jqVHeTl9kCSf4K5/c/aelI3PH7OHtPv8J/AQNwIdR7A1mA6fzJ8zUVsFKd96v1OX6YMNzbgTFdKO5jau4e4OhWWoUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507869; c=relaxed/simple;
	bh=R2eSMSfkF1CrXn+gdldnHlOy1u5nKEpnHBlABgFJnG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YebDIjCY6yxtwuR4q5i3icyjloha1/m6/70XE/IXvbLXDK9YjBUetYCOpNGs3yh2t2sTY1Qr5uSrC4MLrsAz8ODpvdbtHwViUOn9KZVPR1OTxnkg1ODoN+LG8drQd6orKJALKm8l8JIOsy+vMMz5up9kStLVCfCdEd7KraxC+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4iSseZy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806bf03573so418805e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507865; x=1770112665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cb9V9b2ORNjXPVcwOKQNOEMmMPtYl7t/ceGkGIE011E=;
        b=H4iSseZyy1Hq1WnpO3S0m0azf7wKXxQeSLGwbiMu7ekOXJMIHfibF5lKbdZBekL2UW
         fVbRK5sC5VrTRPZ4emLoBlrIOKgpoQnPZ+uxLr14POPmEPb0k2sTNei8azQs6tDZMd35
         pGOpOWfrvd/BRgSeTYMQVMaVTzKhwjVTbZU7syCj5CIy041LlGaSArUNsKxqG7Sh8Gwg
         jRzvdbcAjbINndOZLLf/8ieEYDUNCJJbOPRwt0ER260Y8llvoG5f03zwf+LJ3yrvX5Ks
         Fow1Wbr8dBFl1rO9pUPsEwVBcw890SY1QXno8RRo7sJpzLnjTa6Y1Aa2CaEFfwYeUaRR
         ZYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507865; x=1770112665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cb9V9b2ORNjXPVcwOKQNOEMmMPtYl7t/ceGkGIE011E=;
        b=HanX8knFyqBU7GCbknouEvpiJZT4ctLV33u0dgCZc6fTzeW7/F8sDYgDDZ8Qe2srec
         mUUjbJzd1a+A14PvFbeA/HE6VBwB+PuhGMOJq+k69nRx3iPkQii84npuW5i67z8Cyv2w
         RBvWZ0wNOhd6ww6EuWfN08umowH0QwWbg0vioJ67gRT4gFYnK+sqV1dhhruLSOHcSXGZ
         5pCefrSW5+NdpSWwtoMFlZ7/tsS1UQYd+jNnfU5qI/TUsbeR/DiWo7bxZoL4rEuU7CC4
         0FH3UFAkyL85qPFIGuYPpsuQm39WvOlfgU73CpqKdk+V34t1V5BSqy2w/NcB9+PHFRVH
         hx2w==
X-Forwarded-Encrypted: i=1; AJvYcCUwV2W8S6wYYdIPddzE9kH3n9/dzlFyyM8uIJ8ILVnIAQDeSRHsXS/ZmmMnnOyyavP95mxwX/Zk8EQE51T8@vger.kernel.org
X-Gm-Message-State: AOJu0YymQ0vXLfFdKmYih3qroMxQPfXPifzqLFn35Rw6+vENymNfreu8
	EOtlk5dA2BG3SOvPcpHD3gaBvXbtNGCmX9lspf5FPUHbpuuiEKhW4TYPrMOI+DK7niY=
X-Gm-Gg: AZuq6aJm088XtcnDgt867wWQvwKLkeL9eTentq1kMf0ObksKIwSb0sk3tZMUbR/dzEa
	3v3ldfZr7jCvPt3RZsG0O2TyFNuENQbUzMt2SDJXB+jyByQYZ9jgFRbRV3DS6V3F48wHtljjIoE
	Uwp5aDzAC0oihY/XXoEMNzFuEz1TljQqN7Ni7ahR//Ewwu47VbVINd9lwd4FQcogqWj2B2UIQGd
	QO1aYU4EKgalJYlv6vSnAjosJRil0EetvFA5M897gISYkLsW6G/5aEb3/imTB45B4HCz2cULeIM
	qkj7YP3W8QVu9j17PgQrMjolQmqnsmJPLASsngBQEyj45+LgJmp/HmhUUTqFeISNVeC89AEswXn
	myP6aqXgZyE7tXz6PgA+JDHbZbOVpFvkjUgfymFgh7t/2MLkiy+MxqhvS9B4NibrzBEJaxdpbU7
	Sjk0I94LdR66FUlHzgl0ocFtMRHiNSxto=
X-Received: by 2002:a05:600c:3505:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48069b8bd79mr13663395e9.0.1769507865414;
        Tue, 27 Jan 2026 01:57:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:30 +0100
Subject: [PATCH v2 3/7] arm64: defconfig: enable pci-pwrctrl-upd720201 as
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-3-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=R2eSMSfkF1CrXn+gdldnHlOy1u5nKEpnHBlABgFJnG4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwSWwYfTlxDUpjTB45rdckHrd/ghXsMVEfoz3KA
 UJIdDDOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEgAKCRB33NvayMhJ0XFfD/
 0ebA/1uCI8aJQIY1G5W2HlDeP9+sA6gxCy85Fvlqu2QKR3v6HVdjmWewHNw7QmUyO5DavQTVVHKnhe
 nrwTvnHhShHIokOkxqLidW1RgWFFBXuAKNT3Py33p6UIFRFdUUqZnP4h67dezuWMkU20ldSyRmhfCc
 nYklx+uuwFhZKhZWI6LAg0wmTWUqj9eyvd2M88Eovk5uVP5baUWiIjMmNYLYpLKtk+TR5l47+v5i74
 GA6Fs36+RrakZzYXCfg5BGrNVTBVPkPmYAQ4h6BYsMEgisj8zFWTJIhz6RUMuOCLC11kC+BQoiezNL
 1nmMvEDYFbIOttmDi7qohh0aD/vMiu6vvXFhnAHok8qXpvygBD1FXmAV2E7TX9LzS6l8OsmzTuFmpb
 fuHfRHWFiEN3vhqJMfaJYwRJdcQfIvYttQKWKaqrNelljs1UZewRIPMynslHWhKNASwWImTkjiu8aO
 zIRpcbOaAj6V3s+wB9czZuXEudHIt0uM/CsIzy/d7Ej/NlbG/VVASaHlNZF8S0MPmQbAQ0oquUFqkJ
 TetXbupkFi6TAHpLJLs/1BruV5sTO4OB60LqBoXcsFWySSc5VASS5FahQbjY8MOqelxfeZJkYW7LPw
 XOqevKwZKEpZnRxhBsxBiI5mVfSTc4cHYZick8NejQ2VcmO0RF3o27j17KnQ==
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
	TAGGED_FROM(0.00)[bounces-90688-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AE9892458
X-Rspamd-Action: no action

Enable the Renesas UPD720201 power control driver module since
this USB3 controller can be found on the Ayaneo Pocket S2 gaming
console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..67c642821d35 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -250,6 +250,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_UPD720201=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


