Return-Path: <linux-arm-msm+bounces-30699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82096BA14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE3E2823A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84851D0147;
	Wed,  4 Sep 2024 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zbwb7gY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39321482E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448600; cv=none; b=j85B+TqdumV3NszhuawodPShO8oomrWytIs2f7Kw3p7Qyatp+qod5PcaoSq3fAELcLdkaxoirC9bUqEZMcnwaYQrnto1ImZLJyoew0WdNPyOBbt3eUU0fKj0Oor7YAeFgwZ8862DSB/Bw9sGC41tciaY2kGmlMAfbaEUCNGp4Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448600; c=relaxed/simple;
	bh=c7YFjQZQ9qFiuq/qc02UdppMtxArDtNb87IQeV7cXpw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jd0QpIctHZr+mlysQdmhNYQrmS4VHxX2K7ijI/1hXORcNhgncF9B5Wc1L/Ool9YWBrpIEA3rViCZ6IfgEmaUuDwnZEU1rj9gyBVrO56E2A7c0HhwD3VQj7fU/6bTWitQeMMcwM4kam/oUUPyN0uife9P9R9NPJwtVYOxKM6Clqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zbwb7gY0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c23f0a9699so4533989a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725448597; x=1726053397; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oilg9tWKvEXxQ/M2O3r+jxuJg1mqd+S4i3tG0SK8JO8=;
        b=zbwb7gY046kxD1IavPkAO4+3by9K3XkI9OsNtC2+5SSD9OxBoGmpmQmnCndJTL/9bu
         UNC5GdpMMR8FrxDg7fJKxe3a5l1t3GgoXt8V7XSjuaVTbdY/lsEkM8dsP6OkiE1NsrDB
         UJMKa9c/qYwUqsYq9uGHySDRyIM9bIERyseQI13VmlatVskKipuVa7OWID4rCk4ud73u
         A6ijngLOzK5WHjQZexXFMuQp1yyCzzt07KNwitNHe1aEudNkGj1LcSn6tgFF+0gQ1jMN
         QusJYiWrWkttydtS8ERTbFNFGfFKOprxMCtMrpOJOW2M16l7BA8rZRFD36gq7xKWZ4s7
         DJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448597; x=1726053397;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oilg9tWKvEXxQ/M2O3r+jxuJg1mqd+S4i3tG0SK8JO8=;
        b=WZR6DNmrJKVlrtqU61lZyocPob6d97ZE4WjyDg4dar168iFruHZc/48ca9inmwVwKC
         Rx76/3tulhycapCFRgAeTlpwKsc7izbZDllYoAQga6pRhOC6MhWDkyB+pgIarM5vg8mj
         HZs3xKAgNeKK+U5nlCDHeA2oFA8JyOEEgdDujRAi1uDbel1Cr/wpWSfFldQr/lY0pj/w
         xEe04F10ANEFmwLh/5Y4JCxWLfljL9kKEIsToQf57V+kWqVcFwG75xPrirz5vphUZnK3
         SpM/viBJylPbZGWXw7Rc7hFFIWXE/PGTdpbge3wdKdCBYX5aRPUeDPr98TS1YxLUURBe
         K8fg==
X-Gm-Message-State: AOJu0YyyXk3BYJ4Z5njAy276nheqkkrY0fSXMfTjcm9zdfGvB6aZr5Ta
	onV5eqaVqSrBNZK23pIF8bpoKT/5y1NGjoVKeqqvg0n+N7Rk0xTbUWgNM9xPhgXaQVlaFnSY9F0
	k
X-Google-Smtp-Source: AGHT+IFDLxf05mFn6Zpo7gPc8OHs5gmBfZ92hDGbPWWx24YvDxOHnYJCYJHl59RPYjBMZgwXa+f+Gw==
X-Received: by 2002:a17:907:3688:b0:a77:cb8b:7a2d with SMTP id a640c23a62f3a-a89d88494ecmr1086423166b.49.1725448596781;
        Wed, 04 Sep 2024 04:16:36 -0700 (PDT)
Received: from lion.localdomain ([2a02:8109:aa0d:be00::a253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefc12sm793401966b.9.2024.09.04.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:16:36 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: rb3gen2: add second USB port
Date: Wed, 04 Sep 2024 13:16:23 +0200
Message-Id: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdB2GYC/x3MMQqAMAxA0atIZgMxrYheRRysxpqlSosiFO9uc
 XzD/xmSRJUEQ5Uhyq1Jj1DQ1BUs+xy8oK7FwMSWerLoLEZnvATGKzlG6oSabmFpVwOlOqNs+vz
 HcXrfDx01coBhAAAA
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=c7YFjQZQ9qFiuq/qc02UdppMtxArDtNb87IQeV7cXpw=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhrQbjpNzMsUjnfPSGo5sjz+mqseqyafq941JwfDifr+9Y
 tdzpzV1lLIwCHIwyIopsoifWGbZtPayvcb2BRdg5rAygQxh4OIUgIn0pDH8jzdeVsJrNUfzVPXG
 7X4hluk2V2xXzeo7ydCbk3ZLgIkpk+GfvStDjmfoqXklWW5qFvWqhTvPKp8qC+da7rVeg68iguU
 yAA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Make the necessary adjustments to enable the secondary USB controller,
which is routed directly to a micro-USB port. This is intended for
debugging via EUD, and is otherwise useful as a host-facing port with
mass storage or network gadgets, allowing the type-c to be used with a
hub.

Peripheral mode has been tested with a network gadget, but I don't have
the necessary hardware on hand to test host mode.

---
Caleb Connolly (3):
      arm64: dts: qcom: sc7280: convert usb_2 to support multiple ports
      arm64: dts: qcom: qcs6490-rb3gen2: make node names consistent
      arm64: dts: qcom: qcs6490-rb3gen2: describe secondary USB port

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 75 ++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi         | 18 +++++--
 2 files changed, 87 insertions(+), 6 deletions(-)
---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0

// Caleb (they/them)


