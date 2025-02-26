Return-Path: <linux-arm-msm+bounces-49526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54807A461E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66BDD188D54B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337A8221559;
	Wed, 26 Feb 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DeOZhNdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C921C19F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579038; cv=none; b=QzT2hlxN71oFvK0GswCQJ9Y5nSgWXLetfv3DW6UyWg33psye24F7bCaK4V4vM1kpGDEkgYuPzFxQkRJYVbntOQiPenQNHvS+FLoFn5rmQZY0ygq4OUbmauC2x64aBfVlmJvzrCJ2OAlohlgRFjVka/xYnS+DvY66xJl8wgbyHoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579038; c=relaxed/simple;
	bh=hUdgjR/RHMYEJ230+g45ik66o3c8rPTSefQWcBqffE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S87HSZ0j/Hg2iZdjDW1J+blTeFS0orEu1UXyyttW7iE0iFlHiQqTgDnoSeKUrYc5vtaCF+CVLZMBkNQkxVREjvCBjJX1mYV+FVxwj2AnSBaWqlZsL+wroc/jcof12Oa0ZhB891O86yhWAYwpsZw1FFsRnT7oRtB/58/5b/iGUfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DeOZhNdX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4399d14334aso60150615e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579034; x=1741183834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6v2COQag385USHXDZetedSCoQTFZUjvQNehs7tzBwHk=;
        b=DeOZhNdXYJ0BLCNchdC3zPuh5engZ5KAccRSZuU5HlEK/qFmVJOdM1mk+KZJrlQHye
         GLMR/ar2Tp/V6LipuO/A5DhRC5r0O3S8fZcwh2Rc/aog7/7VZbrlPOI4uLRvsPjK0p2C
         jSFwizIu0ydRsfsBRdouuuycQLHvAOvsI41TEefFhp/7rUleRhzCSb/GP9JxJ00r+7uT
         nEA0ssVvwLz+Mgt+XY10elpypie2YDmu4iM0QW1IUhuhWZH0e5xjlZnanl82k/y4D6I/
         jEPbBe0RuUcb7jwPxD1xqo3GupikXR3p47ZlH9DEKb3K5kIS+M7oDtB0rwM+cFmHZdJj
         x0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579034; x=1741183834;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6v2COQag385USHXDZetedSCoQTFZUjvQNehs7tzBwHk=;
        b=CNmhmJzB5zLisfVjXK7JsGV9+VbecpPtiNOuX91sZ7jV0Zcj79IfX38ZHKSRc3v/Zp
         2eRGJpAyEHwWMh+mu2Ay41hXHSsrk7lTUPUonEEbC1rnD9UH+Wrn8bMh+5cr8C/a330c
         mJBdd5UzxzTbE62SwbKWfBBt6Nr4dshMPhpSBO7tjxRB1VbqdWnGKavGbRQBJxWe/dxt
         pi5tXq1ODX/Z3oYH3S6Pvy8nb6mD+L5we+NLJHdH1VniWlNqM9QvClFxiMPWYNVK2Dhv
         dSe3UrPtOCI9jOZMfLGx2ijuhiC3kX427qOzSOikN5dL+JY2KjMnXPOWTO6a5WtQZzLK
         LZmw==
X-Forwarded-Encrypted: i=1; AJvYcCWM2NH07wmdfKjS/+D6HtASqTwN4195frBqryrnClz7/RzXB72sPizi0AGXQB2QMd16JHTBWZlHS+X6xDNn@vger.kernel.org
X-Gm-Message-State: AOJu0YzKdWeREvfYBbj4IIqKf3FmwVz7Q2wVfhZvcNwdAL29Ru6Cvj/z
	nVIY3dcEXhDyz+Sm9EfeOoDE8UYQ6cWS/V9TUUScmtXme/U39pAhgWIqxLahQ1o=
X-Gm-Gg: ASbGncudioaYiOz5GbVJZvXKrEygVV4iwk2JUp65BPfwU/t2iIQD+Y0k65PIYEDnjkP
	tUO13M4k4HGvgneH4l1/CSy+rbkEDjTS9Yg/ZxvHt6RX9rVdWdxl8CrRI7Zl1ea4kCYkuJ2Z7P8
	sdVgEYo4rPjSRDTwVvea1/PPae0yRIBnFH2KiH6fA+VB73NIgMG4OZXy4Hwf1dO/S9xBEj+wwkm
	G6GD7iYAEHeGSp9RQZdUqBJIZIK0/L6DGmkRgtS4uXZ+twXeXLkE8EjmvLGJVlELVG+YeFKWyl8
	TOtk43I3oQt+4USyscJCTvttYoNoayQUaHPSfdKpKY1xh/XdUhU2pisZmsFvz9F3KEnF5fvx6hE
	=
X-Google-Smtp-Source: AGHT+IE4o+OfE2YSudEnTjsH/f3XjsEpd8AL7T6UbGEbbpXVQOECvonikWzyjtQETBsUiLsBsFmVjA==
X-Received: by 2002:a05:6000:1ac8:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-390d4f8b64bmr2958570f8f.44.1740579034331;
        Wed, 26 Feb 2025 06:10:34 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd70be4csm5755889f8f.0.2025.02.26.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:10:33 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Fairphone 5 DisplayPort over USB-C support
Date: Wed, 26 Feb 2025 15:10:17 +0100
Message-Id: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkgv2cC/x3MTQqAIBBA4avIrBtQ+6WrRIu0qYbKRCGC8O5Jy
 2/x3guRAlOEXrwQ6ObIl8tQhQC7TW4l5DkbtNSl0rLDxdfoT7a4Hux2nD1q1Zi2kV1liCB3PtD
 Cz/8cxpQ+CQWT1WMAAAA=
X-Change-ID: 20231208-fp5-pmic-glink-dp-216b76084bee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

This series adds all the necessary bits to enable DisplayPort-out over
USB-C on Fairphone 5.

There's currently a dt validation error with this, not quite sure how to
resolve this:

  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#

See also this mail plus replies:
* https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 110 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +
 2 files changed, 108 insertions(+), 4 deletions(-)
---
base-commit: 417c2d4ed67b729abea7dc73d7fb2153b7154d31
change-id: 20231208-fp5-pmic-glink-dp-216b76084bee

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


