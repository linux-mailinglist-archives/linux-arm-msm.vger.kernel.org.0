Return-Path: <linux-arm-msm+bounces-97707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFfEFYbYtWkn5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 22:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2828F1F2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 22:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D50C530B6B01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 21:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43D038BF73;
	Sat, 14 Mar 2026 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD+VjDtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1CA3890F3
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524795; cv=none; b=Rii4xv7fqsVdeKvXDSX4+AWOgra12qEJXr2yfijw/Gh2p6fxKaUc7Ea6Ay+/lamrztb4pSrt+xbh/tF5Jc28CPb1RKe/f62sNtv/JXoX4JrSI1ogZ1qezcaHuFRHcfpRvsl0aH5vY7TcKWSFyEkGQ8V7ohjjsIXruIPt1AsAwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524795; c=relaxed/simple;
	bh=wQWIVAu3Y4jDHR5DBLOkg+dc0hKAQmR/KU3X139W63A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TSkI+CxbF/RA5HfWM0cCONmDTjjwcbNNpQDAJQRBiWBWmRmq1nSsrwd0m3ddTAoxYZuVk8p8Tp2LixaR8yHgMd5GXPayQthOiYJo8cxsZF/f0xQaUMk6e1dzMrJOrNldBPzTzSYnN53cqsWn3EebrPzAdWWBlOKoHNiW6L8mlWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD+VjDtl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853aec185aso27540045e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773524786; x=1774129586; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh7FZS1WHQ+R8ev12RVDamAIZTNW5FHsYgbvpBRxNek=;
        b=XD+VjDtlAwFffjv2YtXfudRB87M3a0xL67N2N1F1TgT4gzPoHXsIubU6bH+ZWPu2Lu
         oyB/U25dLKDJuToN8FZTeZwaoCGtUn6lHfLKp3Z6wxDfEyE6CsdoBZZIWSeBOeYBcgTu
         umHK3UkHJbxkGJ7n+L9pkBSNvr5dbQ3gP4WTeJNSeImRnKc5IoH9B2eS2PFq8886PwB4
         WnAcGIJ6xJunJKjkZgsVzCqt7NHNnvcX5lWk15lz1+SF04Voh/8qjfgIaTRhs1LN9lUU
         +Kfa/JkkftROIVDaI/PAI0n1q38gWBIPZ+FJQtmpm9tmUDekOIsolh/iKWbwShsFJZEq
         XqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773524786; x=1774129586;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh7FZS1WHQ+R8ev12RVDamAIZTNW5FHsYgbvpBRxNek=;
        b=Z6Qv4BNlCct2+IPd6NpCTFXZR7nAZwNA8oaqj+tvmsYNi/AWPQ+CiLlLkaRm69gmfJ
         cn4ykQQmFbChSNbHSz+cajfLSHWrF8jOEcXdC1PruwBpDKWvdoOPp/K8tuFCeXMEfSKZ
         0+fgc+h0UGsNwG3eNm4ROJfE0S+NGLZeIqu/9k3tWOvtxqiyo8Ya4Y7eFlMoECom88aH
         r8TFpoB4AFSAkwwFbPPgYgZiTeIEfZoNL1ocZAHeRV8FepPwir/tGUycOFAlAxE3id6M
         ypgBgywOkkvo0iFYmca6Sko+xT3MgibgL3AeSG3IG6IRojew4JVXMchrAvvmJqoW2jBQ
         z9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzbkk46IIUZPD55tby/sPLIck9aE0YqEHBlJzy5kwqPo8DCE7Y1DeoVAdAOQSNabv1kHNd0qHektdnWIh9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/j2uKbZKK1TeW6u2NpWE6h0bibvtHReFdwIxVSOxYM+Antf6
	OwqQwGjwLC2ssxUeyPUmaW8zYhXEqUYxoKmTbBCx7SDkqcv3gdAb5TOy
X-Gm-Gg: ATEYQzwlWI0pkna5xrSG20EKa+hplUTyZtdPBOr4ygboqt0+ok3Vx1MA87R/C42XE6d
	dVKin/X5uEHY4xhAYOadMooyL9UE9KKl5yoxrAGrhbv/L8i6sYvZUlT3ZKt7EeShLgk6Yn8rCt9
	B4XDQhTvmCqqMGRXF7y96ewEcJl5+XX/9In377TIQ6XwizD6RiIDxvJPwlp4OgJMW8oESDdFIvP
	JlE4cbeEcltcoGrIdLlKr4YHj8gfPLt/Rs37sqLOK3IPQQg7L3jctMEIkbT+Rehk5g5GHrMUvuh
	wDy8peMgGa5ilno8YabpHTRRGtKyyBYBPNtyoyaYLze6YUZrznvojIKILlj2I6/72WUxWn2eQx6
	Tcq1/81lxdLr5Wc0/7+/No6D6pmH/A5k2EGggVzihaixp1MOVgZyY8uE9zogJrtJ+ygq2zOoPWT
	VlVBUUqDRJfI/o+uxwZOINdRHij3ctdU3Qxwwp3kjiQYbSZuJP016hiMsxus1CVUk3hbNRGtFhD
	g==
X-Received: by 2002:a05:600c:a4b:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-48556707ddbmr131089695e9.25.1773524786521;
        Sat, 14 Mar 2026 14:46:26 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm28756221f8f.4.2026.03.14.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:46:26 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI and M1906F9
 display panel
Date: Sat, 14 Mar 2026 23:46:20 +0200
Message-Id: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Py2rDMBBFf8VoXYUZSZZsU0r+o3ShxzgR9auWa
 1qC/72ys2jJoggEd+Ac7r2xRHOkxJrixmZaY4rjkIN6Kpi/2uFCPIacmQChQWDFJztQl//FXyl
 xXevQGoJQIbDMTDO18evwvb7d80wfn1m73I+sp5TsoW2K58Mq96cqZU4oKwMc+Wq782T9Oy3Ly
 Y9j97KrnU3E/dj3cWmKoGrQllDZskWpPTlt0DlUnoLLl9aWGoLVbC9xjWkZ5+9j44pHi/scIR/
 mrMiBG1NqAbUypq3Pl97GLpfoD9Mq/qVFptFpG5TBUCp4pOUvLVE80jLTmkLlAXQAR3/pbdt+A
 LTXkXCrAQAA
X-Change-ID: 20260218-panel-patches-696df7e0d810
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773524783; l=2780;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=wQWIVAu3Y4jDHR5DBLOkg+dc0hKAQmR/KU3X139W63A=;
 b=kaHaVx1CkItxr7tsnvLvlHc6nISme3slmuCrzRKlt3I2KBENyh+3rgK8qjI47fQGbcrORQvCK
 cuwBDvT0pT8CYMSZEHREfM2DaP4OWtx5KPC4TDgylEoBND0mDoO5I0z
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97707-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: A9F2828F1F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds a driver to support the Samsung S6E8FCO DSI controller with the
M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
generated using linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v4:
- Use exisiting binding instead of creating a new one
- Mention dsi phy power source in commit message
- Mention only DSI controller, not panel where it makes sense
- Remove VIDEOMODE_HELPERS selection
- Collect trailers
- Link to v3: https://lore.kernel.org/r/20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com

Changes in v3:
- Make driver, bindings, compatible specific to M1906F9 panel
- Adjust brightness scale and default
- de-mystify some dsi writes
- move pinctrl for mdss into panel node
- Rename regulator nodes and names according to schematic
- Treat vreg_l9a as input to vddi regulator
- Add myself to copyright header, remove years
- Link to v2: https://lore.kernel.org/r/20260223-panel-patches-v2-0-1b6ad471d540@gmail.com

Changes in v2:
- Changed commit title like Dmitry asked
- Fixed copyright header years
- Link to v1: https://lore.kernel.org/r/20260223-panel-patches-v1-0-7756209477f9@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FCO-M1906F9
      drm: panel: Add Samsung S6E8FCO DSI controller for M1906F9 panel
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 .../panel/samsung,s6e8aa5x01-ams561ra01.yaml       |   5 +-
 MAINTAINERS                                        |   5 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  94 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c  | 301 +++++++++++++++++++++
 6 files changed, 418 insertions(+), 1 deletion(-)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260218-panel-patches-696df7e0d810
prerequisite-message-id: <20260303034847.13870-1-val@packett.cool>
prerequisite-patch-id: 3fba84f11111406e0d530013fd45ad0eb389786b
prerequisite-patch-id: 81440b7f28f9101d3dc5d4bad6dc86e39b81a026
prerequisite-patch-id: 53469d8c9810169d058f1bfd27ac8399038aae74
prerequisite-patch-id: 80809bee71eb6434f6699d5e5f8c7f9d4bcd1ca7
prerequisite-patch-id: 0269e01c9c54a37bb92983635cd516342189aee5
prerequisite-patch-id: e2bbf7c452d4da6d71b1a5194e0d7ce46584e113

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>


