Return-Path: <linux-arm-msm+bounces-96416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKWqKAhlr2koXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:25:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F5242FF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07E14300D4C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB4A1F4CB3;
	Tue, 10 Mar 2026 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEPGyyNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37931F30A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102337; cv=none; b=KqUxrlgRlB/DwzLcXxF/RzxNqVQG+ipMVKoEL2e8sPqNkmdogO3wyC9HqidyfxA1vyt6WSpcOrzfHetxas3KX1fuKW/5GLDOdtQ6/5mclcick+QvPwY1AuqDCGIio6MKJ0A5Neh+FnycW+6/qPUBXOvaXbSypKyv+II4jBUMYtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102337; c=relaxed/simple;
	bh=MM5jiRwdyozhwjdTH9pNPZFr/0VP+nGcS/6q5o3D7Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUFfmE9ExnZ+bRgWA1SybMF1ynt33SZYDZPocssDG9B8Xb50dgb5FYNUYK9fsYz9QnX5/z2PHazPJdkmwf8dm6UtPLjg2uPNiN6XTLqf/BhzDH8q8SvGEm/YocNjnJ/eVw+i7CI316UYo9QO1vLhYoANOenznv6/rxGhtKgnYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEPGyyNQ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-899ed41208fso166668256d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102335; x=1773707135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rw/bp+ev+1i+10z7kk91+q+vkUtFs2Uso+Ri0pnfIK0=;
        b=YEPGyyNQORhVNVY4IAP230zf1XR43aYz3PM8QaJHUiyyQbEdjdMgoL4IuK9z++lgFD
         TNmlrPkRWGilCvGWOukRZKpZMkBLtvprBgPxNoZCtEe2Sutbobe7ZkiOwRrJjKz2JIwa
         bq8K7vreTzpPcw6TfRqLUQerl+S04sSZ3TPIMQX+5JwfliO4oxhP4V7B97hndXJukG3E
         TEc8KdEVaeOjSP6Gwyw8j9FL2KB+QJU0lXDAOhxQNGWhZZKNfkxvDxccw7vvKOgisKeb
         nq2EU2FSm6xSjcL0KQOQpIAQzXR7jzNVWIPQNCye8KrC/i6sJqKprlMNmBBwpkJYb2m/
         s0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102335; x=1773707135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw/bp+ev+1i+10z7kk91+q+vkUtFs2Uso+Ri0pnfIK0=;
        b=EOH74YhIrS/jaz/l7wYhAYKm5Mw1dLVrYYPTGaJomkPDTBoNzVuzu1wXpNjmuaxWNQ
         eUc1zMPKqqzEN+413wA/ePFOq+xdIg74zcRp8HTO/SmKqR8LJ6CR5hrVjTO+8RWMDES0
         WVMYAV/hX76OpzpLvmISWIBktLkSI0Lc/gpLNJ6P1J4NhQvqT/xbz+i9+W2UHhxPUW5c
         UoFcPHRzoKVM9ITiTr1PeVH7IjjYca0mUKHihuwN1KzsKiCPZe1qPkv/C4/J30Lr5Gmt
         idMcJkAbEZWS+QCNkH+uUIDBU8v3Zsl6NEeLCizjCNSaYEu3R0eFmmPtYSMeE6hAUCZX
         r1YA==
X-Forwarded-Encrypted: i=1; AJvYcCWl+s+XP1/UkOfboP8JukvzXGPhZYqj7tWh7kqFhOxWe601SYdlCTKL/PdDetGasujcXnpjWuUC4lSeJga2@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWKf8454NiGIxy7BCahcIbCTjkVu5+ZclNoJxJ0sAuU5r8T7D
	SB/tovvbrQ8bULcX97djko8DxKF4tpG8MquP1a8IJsv8+1BjlJdNUv3E
X-Gm-Gg: ATEYQzz6m7RfBXspe8M42SKS2kyweWmsmeFJ+wmlGuEt9MhFHPUrirb9IXTd+iTnXkm
	7ZYfoK0050zwpLopZgUmTK8fE6xYN3VWB07c5Ie0ZKmsTtRTazH7uUNgp+Mju3L26kumZL3V5IP
	yj1EtGCOfPwEbEQSsW3NczAjJVmHU+BegmcXRq9JqQNfK8NtjMUspDcYq2pGlXtXEGYujZKzufl
	SpduyX+qMMQ7vTntolzS6+AV9ECko+6Z1L4tm0b9tDHCwg2V2pjl3aNwMmFcKzuUBA4Z268u2vy
	2uH6729vCWSgAONEeFVMk92+A3Rgk3eOt98VahmBbPJOihJ5HT/J/3lqFL4zVVIW2ZWatyM9bIw
	Urfe1SJN5ldJc9IWO99fGRzIU6U7zkMEQXYs7O4IXiFQN58oC8N30V981tdymjh2US8b88ZIUVM
	iJHAJC0wcaQRe5HsGyuD5wdsD0TQ==
X-Received: by 2002:a05:6214:5292:b0:899:fa7f:7155 with SMTP id 6a1803df08f44-89a30a2f357mr194147206d6.5.1773102334650;
        Mon, 09 Mar 2026 17:25:34 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a18252sm9897826d6.10.2026.03.09.17.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:25:34 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/5] Support for the Pixel 3a XL with the Tianma panel
Date: Mon,  9 Mar 2026 20:26:01 -0400
Message-ID: <20260310002606.16413-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE6F5242FF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96416-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches
(https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).

Changes since v2 (https://lore.kernel.org/r/20260217000854.131242-1-mailingradian@gmail.com):
- add support for regulator (Dmitry's review retained) (3/5)
- use common set page function (Dmitry's review retained) (3/5)
- squash new labels into common dtsi patch (review tags dropped) (4/5)
- specify framebuffer in terms of memory region (4/5)
- only specify height in XL/non-XL specific devicetrees (4/5, 5/5)
- remove status in display devices (4/5, 5/5)
- preserve same touchscreen physical width in sargo (4/5)
- move entry in Makefile to correct place (5/5)
- omit copyright year in new file (4/5)
- correct top-of-file comment about which panel is supported (5/5)
- explain license identifier change from GPL-2.0 to GPL-2.0-only (4/5)
- add review tags (1/5, 3/5, 5/5)

Changes since v1 (https://lore.kernel.org/r/20260210023300.15785-1-mailingradian@gmail.com):
- use multi functions in disable callback (3/6)
- add and reformat comments about XL differences (5/6)
- mention the sdc panel (6/6)
- explain google,bonito compatible (1/6)
- remove TODO item in code (3/6)
- add review and testing tags (2/6, 3/6, 5/6)

Richard Acayan (5):
  dt-bindings: arm: qcom: document google,bonito-tianma board
  dt-bindings: panel-simple-dsi: add nt37700f compatible
  drm/panel: Add Novatek/Tianma NT37700F panel
  arm64: dts: qcom: sdm670-google: add common device tree include
  arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../display/panel/panel-simple-dsi.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  |  32 +
 ...le-sargo.dts => sdm670-google-common.dtsi} |  22 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 709 +-----------------
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 299 ++++++++
 9 files changed, 370 insertions(+), 711 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

-- 
2.53.0


