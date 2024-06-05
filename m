Return-Path: <linux-arm-msm+bounces-21758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9788FCE8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F36B284974
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D1E143722;
	Wed,  5 Jun 2024 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jjCKtKic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88D14D296
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590462; cv=none; b=tba9HUQiiXudFLAolBfItA5Wph8YQbVtcbL8drWZcojrjgagZTpfzFW/IU6RBv33twKxMKGXV5n/DlvYwOqxnoQMXshIa6A/Uvp3vSw+p8+UvQ9jmPkA3e3a1Mf3jAKZ4jJTQwa9MEe3uGH1s2y/8aeh94jVkSRckCOi7HGvbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590462; c=relaxed/simple;
	bh=ye7thy+/3m6Zqj7SbdLqlPoBsKgCZO4q82/NkiqrCwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJ+RApxM4E39FFRr8VOBfqvPPVsnEa1mgrOleiTXzJWthHX5pmpcw7OPg9AysfY//zphlknQ4PQYiNdzrQDQ0yvNjbRIiJFPaGa5LNe0EzClUu/QDyzsouWdLcGjW2i5/3wieTeVjMWRVloo/KRwg9wiyQjt35R2DihZ8mG+4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jjCKtKic; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35e4d6f7c5cso4295698f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590459; x=1718195259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJu4ZVYDYjYu/Y+oCiKT9LoXMtfjh5wGjAB/2kqB2wk=;
        b=jjCKtKic/idn1muC/jKl8JIbZ7/6yTzjKXxFwMRBbRwOH5iveQF/+sTAI45Sh6iynp
         36VUi/Cb90sNKPNEuTuvm0irMOqbpVJVOeo8HeoQsfS0fV4ZS3dDzEiG7ZfhEAvjxFd4
         e6MkVU8X3PIVCAIIij9bNeb0b5/a8pGWeDhScqBcpFMy3APClxrnZvjdt5jDKKM4+he+
         tx64CX8EIZ1b2yLgFrRK7Voz+7uNkuExAWBrzRtBCQtII4aiRy2mQYyZKEk4eNGi/lcv
         5QI5+8Y+cs8W+iSDtn4sHHdDYpo72Ohhv9LmMMfws0tpPyaKdyH8kUCxSgdOQEJBXCsp
         Rgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590459; x=1718195259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJu4ZVYDYjYu/Y+oCiKT9LoXMtfjh5wGjAB/2kqB2wk=;
        b=FnsA3SUnx33t+bebFMahAbhd+VhvunhhXqVvPsSKD+qVQOOrRg56u90YjS5vyxv5bx
         Ev7K2PMjFKn3YiTM2y7GtwnyAN20/AkB+LScb0iJ6+RlUutg/ZlUckeFktTBK2LPLUp5
         aUytKhmjnKsc4nL8HAU7w9dfGw5XgIoCPZt7dNKRxsP56iUskCCwAy+Uhar8crA0oSe7
         wx1VJzG9TvG0JFjEyvl9DwYG/qFoyqIh3+wmhUW1u/VO3y1nQ8wyr89OEZ3m2+l+9tIv
         aglO2/HvKF+JSfEpzmr5GSGLsmYGJeXgOizndTzo/zkdJ1UbnLdYsFVGh2r0w7IglfWT
         FbGA==
X-Gm-Message-State: AOJu0YxPfTatkUGnIFK8+Zj6BQxo3zSO3pE26zuodGMYkM97T98he1zc
	DVYif0XGB9MeZJmclH6EJ7p68C7Jpjt3/9beD+V7h/urMwRqWP1SHSiMnCNFhA8=
X-Google-Smtp-Source: AGHT+IFVJVUC13ysU+7mF23cQ0ytETMFziGqtuOyTgLfDsFL1z1ZE0h27PO06RkLagYGFk1T/JjCig==
X-Received: by 2002:a5d:610f:0:b0:35d:bdb4:f623 with SMTP id ffacd0b85a97d-35e8406782emr1861012f8f.23.1717590459187;
        Wed, 05 Jun 2024 05:27:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04cac3esm14383619f8f.39.2024.06.05.05.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:27:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v9 0/4] arm64: dts: qcom: add WiFi modules for several platforms
Date: Wed,  5 Jun 2024 14:27:25 +0200
Message-ID: <20240605122729.24283-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Here are the DTS changes for several Qualcomm boards from the
power-sequencing series. To keep the cover-letter short, I won't repeat
all the details, they can be found in the cover-letter for v8. Please
consider picking them up into the Qualcomm tree. They have all been
thorougly tested with the pwrseq series.

Changelog:

Since v8:
- split the DTS patches out into their own series
- Link to v8: https://lore.kernel.org/r/20240528-pwrseq-v8-0-d354d52b763c@linaro.org

Since v7:
- added DTS changes for sm8650-hdk
- added circular dependency detection for pwrseq units
- fixed a KASAN reported use-after-free error in remove path
- improve Kconfig descriptions
- fix typos in bindings and Kconfig
- fixed issues reported by smatch
- fix the unbind path in PCI pwrctl
- lots of minor improvements to the pwrseq core

Since v6:
- kernel doc fixes
- drop myself from the DT bindings maintainers list for ath12k
- wait until the PCI bridge device is fully added before creating the
  PCI pwrctl platform devices for its sub-nodes, otherwise we may see
  sysfs and procfs attribute failures (due to duplication, we're
  basically trying to probe the same device twice at the same time)
- I kept the regulators for QCA6390's ath11k as required as they only
  apply to this specific Qualcomm package

Since v5:
- unify the approach to modelling the WCN WLAN/BT chips by always exposing
  the PMU node on the device tree and making the WLAN and BT nodes become
  consumers of its power outputs; this includes a major rework of the DT
  sources, bindings and driver code; there's no more a separate PCI
  pwrctl driver for WCN7850, instead its power-up sequence was moved
  into the pwrseq driver common for all WCN chips
- don't set load_uA from new regulator consumers
- fix reported kerneldoc issues
- drop voltage ranges for PMU outputs from DT
- many minor tweaks and reworks

v1: Original RFC:

https://lore.kernel.org/lkml/20240104130123.37115-1-brgl@bgdev.pl/T/

v2: First real patch series (should have been PATCH v2) adding what I
    referred to back then as PCI power sequencing:

https://lore.kernel.org/linux-arm-kernel/2024021413-grumbling-unlivable-c145@gregkh/T/

v3: RFC for the DT representation of the PMU supplying the WLAN and BT
    modules inside the QCA6391 package (was largely separate from the
    series but probably should have been called PATCH or RFC v3):

https://lore.kernel.org/all/CAMRc=Mc+GNoi57eTQg71DXkQKjdaoAmCpB=h2ndEpGnmdhVV-Q@mail.gmail.com/T/

v4: Second attempt at the full series with changed scope (introduction of
    the pwrseq subsystem, should have been RFC v4)

https://lore.kernel.org/lkml/20240201155532.49707-1-brgl@bgdev.pl/T/

v5: Two different ways of handling QCA6390 and WCN7850:

https://lore.kernel.org/lkml/20240216203215.40870-1-brgl@bgdev.pl/

Bartosz Golaszewski (3):
  arm64: dts: qcom: sm8550-qrd: add the Wifi node
  arm64: dts: qcom: sm8650-qrd: add the Wifi node
  arm64: dts: qcom: qrb5165-rb5: add the Wifi node

Neil Armstrong (1):
  arm64: dts: qcom: sm8650-hdk: add the Wifi node

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 103 ++++++++++++++++++++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts  |  97 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts  |  89 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts  |  89 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi     |   2 +-
 7 files changed, 370 insertions(+), 14 deletions(-)

-- 
2.40.1


