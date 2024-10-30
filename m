Return-Path: <linux-arm-msm+bounces-36481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C59729B6BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7C21F21AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137D51C7B85;
	Wed, 30 Oct 2024 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDPE4/Wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCEA1C6882;
	Wed, 30 Oct 2024 18:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730312524; cv=none; b=ppgcHMHr/eGnLtqqKblRmIzfbRpfXwk0VaLa2Pi2v1T5tcGxFMyaOAtfEgn3JqKkJ8fjvYLWrd1Jk6PByZRXJVokvyoZSYRgJwAcwJiT570Dju0hVelXEkfgJa4a8K5ZQ0oN5/f9/s/W5E4yYMIQKtBj8PiJ3S3nCupJtZaEg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730312524; c=relaxed/simple;
	bh=NsWqDVGi1A1BcKnGI73p3ufConLfzx4FtgmoRhjsomA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/7hLHAg4erYtYhlIDnDxF58dZHkX4w2jx9+yCLRUuEQ/2ABBYj27eDbAV6Ecn5QndRHEohj6XVOUnIS85E8AbSmKVA5stM830pRSGMW+gdbvIknhfKNX2x38pJLok1+M4D6nqQNNCUM/S8MeI626uw6eSVVs66KBVYj5LE7xu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDPE4/Wo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso215103a12.3;
        Wed, 30 Oct 2024 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730312520; x=1730917320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0c+ktvMJHx30kF0i4tUj1ZF8Zpo/O18amhBcx+Q9caI=;
        b=WDPE4/Wo9Ic4flFrt4+JTIydJuG2Tr9xR9ATqyn4Rh06xcfJeqhm4NdSgQ68zpqp5q
         JZI5crbFesaHwxWanD2OJg5IFnijxyjx6Q1M/UwMyD9vYncMTbNaYE5j8y9ZEDkcNCTW
         +0sJTZ9v/hgZgZsvRNEoBmiLaXZS5PF60d4xy1+FpUoscZ6vLetZSroBOvsaJ0yNJ3Wl
         //6WGOQwmHpaRnGbZX5sFFKL4faBtypyNs+LhLQhi9Fqa+oNxM2poMP7Nx80Cuw6B79t
         OCRKHoDhuZCrcbnv6f5KWLQRr0qa9CadBasREfNyP5TJV5EnebNyCWxa+ckyRyuXyYOz
         8Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730312520; x=1730917320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0c+ktvMJHx30kF0i4tUj1ZF8Zpo/O18amhBcx+Q9caI=;
        b=DrZgBzwEhAOM9mjSUJgtVuqGvEPyOUfuG/C+wlQFjhFHnuwhjPED2NRnXey5TyLT4E
         LR65U/CfXQGP9+isS5Lr8qDcDNxiD1aELTRML4wBkmx5QD3BXWjhvHD5sEMCgsYf6zET
         oW6MFzgq6RiKS1lyCQ4/uBFwWRWka/15kDz0PgdYggqO4ALAx+PrpeTMTd2DDzDp0+mR
         mCP6KCyjMewnkJ8uS0btNsiULKxEJFoVJR4YTkOrgkPXaKoDdhYI/EUmcxnMYQHJPBE1
         wZLeiFBhtapkYMzL6H9iCt+vQd3aNFZUoSA+hC1i2rHEHCBUl31+IOXP9R8pwe/hSWLo
         h+uA==
X-Forwarded-Encrypted: i=1; AJvYcCVUEtuvtltd2VzuSpvOARPI6qgySwciJPFd1opYtlSD02qc9hM5WMQQ39ivo24QMm7tLCe7vIs8wwcIqnB+@vger.kernel.org, AJvYcCXEKTbYgAFpJ6312oEQxV7+o6zaTq+tg2G6XhE8fo1d4XUhqsko9+IggnoTBJFcypjL+eLOfaiJlsZAkIh5FA==@vger.kernel.org, AJvYcCXJcOisAUrKF30cu0++przN6ZLhsXxzvumx9BAYRBTx+w8KZMhaUII7eX0DbpRG7S/8RfgrDj7Vv9uo@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0VlhZINi+EIk7dSpTjYYDAAqL5O9gGvvvgzGA0gt7q0UVmcv
	uoACDFfq12RwFMRSsTVpIbvk2CAx6fyw+Z9DU/I+3FpFHDbDQdDb4RsJyBYKdX5Q
X-Google-Smtp-Source: AGHT+IGT+ht1QFMv0+A9wtD6XaYKhWH3AS0/hfi/APWt9grjhkmGNkOLoZckYB2QumrBSB0MfGYwBA==
X-Received: by 2002:a17:907:7242:b0:a99:ee1c:f62f with SMTP id a640c23a62f3a-a9e5094307emr36183166b.34.1730312519861;
        Wed, 30 Oct 2024 11:21:59 -0700 (PDT)
Received: from localhost.. (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2982ecsm586588466b.106.2024.10.30.11.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:21:59 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/1] X1E Dell XPS 9345 Improvements 2
Date: Wed, 30 Oct 2024 19:19:35 +0100
Message-ID: <20241030182153.16256-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe retimers for the said device. At the moment DP alt mode is
not working, but this still allows to use USB3.0 in both orientations.
Once msm-dp is fixed, DP-alt mode enabling patch will follow.

This patch depends on [1], which is still undergoing reviews. As it
appears to be close to its final state, sending this already so it can
be reviewed.

[1] https://lore.kernel.org/all/20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org/

Aleksandrs Vinarskis (1):
  arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 293 +++++++++++++++++-
 1 file changed, 283 insertions(+), 10 deletions(-)

-- 
2.45.2


