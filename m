Return-Path: <linux-arm-msm+bounces-32180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEB97E688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584111C20DF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 07:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F3F39FFE;
	Mon, 23 Sep 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/gcFKiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072022071
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 07:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076527; cv=none; b=N0hQ8Cj1nn8A6PW/kM99MJ8oaTq19BUBSngaZcgnU3URVkLoVTletEV62HbbuqTK3zigdd84TBFtuUHayveoxKhbKGi2H+qqw8469cbk8R1uu3u2Ax0IDjZIMvVoAF7gpggkioXFkYfrjI8JqRBz1eT4E7lb0p9kyhq8GMrVeK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076527; c=relaxed/simple;
	bh=VD76WOxRsjz+vaH8xTAnry3s1TxIX7SixddMnbJRUaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+z3SFFtdBW85pOktC8eSO4ZSm4gl34+PZw946WmQ2OIjwirgHzC5ARTt3HmZmDjVdEQTPz+JcZfMRZ4nGzyMa1zIin5ax89eV/dYufVRZh55epwjHinzjs3Z7bqrLgbSS/N2BDkGPRvr/wwhoAz89nioHW8VdBuhzz4A5Rh4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g/gcFKiA; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6c359669e62so4842466d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076524; x=1727681324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCiJBdE3pxAN9x8firzsoNwMQzJPkBaOxRBz7S00UOQ=;
        b=g/gcFKiAy+SYhuNwNvwoTibrAUdwy1HYcSsQUPug7JtTtNOdgqEuIgFf0x44Ep4+df
         xrSJeqtKndURySQf5/YPHv2kPi0mTH2OYnIpqjzFfVzhK7oum6LZC2QbLxy0v9iuKUnZ
         zlknaYBjqTopuZCcgHMkXqMCNMW5TkyRryZj+PMjWrJbbOrIab9DgyRlgEWD4egTUJec
         PVIsZULLC03HjUgHdulLhtUSghaGd8NTgZfxYSm0/i5zLcoSjQaS60cbVQ0nvCIEBRla
         7yfU6MJo/Siytxw2NWCVFOG5Vx/ecLWPGe1WBbbS800Sxe0ZTUioSz6s2oJE/48C4mFp
         saOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076524; x=1727681324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCiJBdE3pxAN9x8firzsoNwMQzJPkBaOxRBz7S00UOQ=;
        b=q4tgqr0NZ8duJn7pfX/rqNcmanhWe7BfoUvRQSKglvz8RC61FIog8AyBsNB1MSPl5y
         GeKUF4cHK8HAoxpUqKkdzBjFxSvQ0/tSaMEpNqcrAPfU1/d08Q+ZtVcVFGFODcbqa6Tx
         hzYxFUWjQZcSKl06hPmUxjoO7Y9e6ir+vsDNXq4HQmrAtMYKV2nAshmOKAKDy+vh0ghP
         PBHR1RHuFtdo+esCDY5ovR8mZ2pT4stp9/kGhM6lxC86ejffL9utJ+z/obdoWhak/jPJ
         byX5HiEiKP7JYwL58iCeKJd3OuHaPPd0dGHrRRGJaSo43ck0JhC5Zr5dzEuEQoyvo2T+
         sswg==
X-Forwarded-Encrypted: i=1; AJvYcCVO/lksAr+eOp43RveMhQXsapHKf4tDMikVrVERjRFK+Ww8aJ6d7hnC1flDfBpG8wPUh16RDEeSlDgqPN2d@vger.kernel.org
X-Gm-Message-State: AOJu0YxrzuPH6Yp8TaExpPHcGiSKTv8bZZIR7NEQTQ56URJRETyuDEq6
	F25OV0rCUsklDmh1BDvsmv7tSWlYtLKdM9JafeY4VpJV6Fu3AKs1SaVN2Cw2XJc=
X-Google-Smtp-Source: AGHT+IH3PzSquMnMRtV91XqZvXHDGyEIdSlQ2LdmFxatSn497DPhA51pCag3xXsBzbtbUC+mQ05kEQ==
X-Received: by 2002:a05:620a:290c:b0:7a9:a632:48af with SMTP id af79cd13be357-7acb82226b1mr857273685a.13.1727076524258;
        Mon, 23 Sep 2024 00:28:44 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:28:43 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] media: dt-bindings: media: camss: Fix interrupt types
Date: Mon, 23 Sep 2024 10:28:21 +0300
Message-ID: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that on a few Qualcomm platforms types of interrupts
do not match both downstream code and a type requested by the CAMSS driver.

The mismatched interrupt type between firmware and the correspondent CAMSS
driver leads to known problems, which were discussed previously:

  https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/

Here the situation is right the same, namely a repeated bind of camss device
is not possible due to a wrongly specified interrupt type, and it may lead
to an issue in runtime manifested like this:

  irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!

Changes from v1 to v2:
* added gained Acked-by, Tested-by and Reviewed-by tags,
* per patch review requests from Krzysztof deduplicated "media:" from subjects.

Link to v1 of the changeset:

  https://lore.kernel.org/all/20240905164142.3475873-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (6):
  dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
  dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
  dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
  arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
  arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
  arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++-----
 .../bindings/media/qcom,sm8250-camss.yaml     | 28 ++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 40 +++++++++----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 20 +++++-----
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 28 ++++++-------
 6 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.45.2


