Return-Path: <linux-arm-msm+bounces-81858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC5C5D191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51F114E9732
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C5931B831;
	Fri, 14 Nov 2025 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="I933hu1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D73191AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122754; cv=none; b=mRJ8uH45vItKhopcSP5/gVZSkboiPJJaEyNUrEKqZ32TT8l9MtzoLig6U9/4Tv97XKE2VP1chxvSkKpf/rDvN1PGwfdvoY2BUbqX8VLvEDD2dY6rDqL6FdeGQ+da26mlu0lKSgsUIkbrjuG7r+OZxg018sh+a1uhhfjKzr45o1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122754; c=relaxed/simple;
	bh=C/tgHBEMS7lC54F1l05FDdUUbx+i2inD9Tlr30ZzFM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBNzSxLy7VMLhatDIyepCevNZRisSZaRu7nK5yPpil95ax7GRC/FU5QWflVtX25WI9dGkw8EQBJ5GXOFenEDqoXNnzjVDAKz/ULSNSFOvzk5oWIoMAtGnb4xlVNS+UJ76Jzkiw/F/tGS6ZBEmQXRS8wtatly38IczddzNmZrtOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=I933hu1d; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so3412934a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 04:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763122750; x=1763727550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u90NAsdBNasBuoFf1cybakUudwJYTlK8TE/NRm955hs=;
        b=I933hu1dNu1pyIZy/RwkNPSps7v6epasv+it/29ZixigwcZAx+zxbbmfic6xQrJh/D
         0gJ3B/6wNYvKWzEEGhbYN1DEs/aZM563f1nuearQxLsE06VrRCiIo1k8YHG9ijarYOkc
         7waHNXWGXIgNAV9ByJxICSh6Hm2ZCz8zM9LwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763122750; x=1763727550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u90NAsdBNasBuoFf1cybakUudwJYTlK8TE/NRm955hs=;
        b=wk+pf0FfqVk0PPG7oE09F/FUzBvkSG2GLxXm69O0udUjKXHay70ndn088PQ+KIoAlE
         ILqX6Cie3Rw9CT24hW5pDLK8R2cEZvWRWQgU70C7nbg/NoMESatlIaNLtmlxFcla6S0o
         Oisw38/4Exjs0x/VpzPsrqzJqP1/3zeky/Ebug9Em2wMd6t9MNmYS3U0MwAwhz1Vjbgp
         4XnOlwwOQT5G+awYLssGWQoR1Dnwsxj2h1g2Wz4qCZpdpSJDiQNzNfCgnBHSIMjvlX+q
         IozCtEzVjUv5SS0XJsJa0447WmIlIMeXcBU++Uwm+u86hlsWLhYNFzq0eqp2B7eGLIKb
         9KMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWAI6CcIulP/wj3CWviKA95XdbdUwSmpOxxjMd0vv1YiljFJG8E9QGJu5N0EW4uGwU7oe9QF8/fAfsHsp+@vger.kernel.org
X-Gm-Message-State: AOJu0YzbYplr3RZSQc+qlY8N43FNk9QNlg6lUaR5OB3Gji4FIm9waYML
	kzK92zBmGeYCnbFJBBkAUW3TrJUMAWNimh4csWXZ+G6W3tKFT7LPOaXCmPypfjRWKas=
X-Gm-Gg: ASbGncvTfGb0rBi3Szp+oPzkIkKQE7V/NtKuxUq8Vx/D9O3/plFQtQ1fp7PflFArQO5
	jps6IySVSAZg/T6DiCknOEJfZTl6W/2VwyGBf3Tca3PrUPFCYdcBX4p+GnpChVk9lWsBP6vTMU6
	wq0KwbLWR7bRRKS6FK/fCS8m2W3vE0ai4ygl3FpHf1eBDZltCVXzQTvdNpzkNpkmcwP0DjrYnBE
	DJ5D8XIGNX4PSJz35hTVyKFbB8hphbzj8lEP03JPIZBNlVf2su8EaKh4LTD4twE2jnLeEE4pzvW
	gJyQBvEww2jrRVcBakCdmuMWAOWoeBx30HEkJeNPCk8jLkaXn/gKh+Zu4DbPpfJ0A30jl1DKlMz
	UpVe0iYQQhIw5nkT/089YrZpvT1K7PUU/mwy8PfMjy01LOzaNdESjv27CQS7Kt0rIvjs4FfcocN
	m8GtdVyNSs4xnvXwxMqrPpugj7TMSdfKh4hfuA85gtlVbc4wxRR6TkV1c0FM6DndwwvAG2E0c2X
	qCn4CDb
X-Google-Smtp-Source: AGHT+IGsHmnSIhpWtHLoB35t9TtSGdohvRhU+DpPgTHUuRWxKlnSUCRa6zD2ZLZYgRuc/phSInmncA==
X-Received: by 2002:a17:907:7f09:b0:b73:64e4:2046 with SMTP id a640c23a62f3a-b73678f4734mr288988966b.33.1763122750026;
        Fri, 14 Nov 2025 04:19:10 -0800 (PST)
Received: from riccardo-work.fritz.box (host-82-52-164-74.retail.telecomitalia.it. [82.52.164.74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed6315sm375295666b.64.2025.11.14.04.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:19:09 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
X-Google-Original-From: Riccardo Mereu <r.mereu@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH v2 4/6] dt-bindings: arm: qcom: Add arduino imola, UnoQ codename
Date: Fri, 14 Nov 2025 13:18:51 +0100
Message-ID: <20251114121853.16472-5-r.mereu@arduino.cc>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114121853.16472-1-r.mereu@arduino.cc>
References: <20251114121853.16472-1-r.mereu@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document Arduino imola, UnoQ codename.
Arduino UnoQ combines Qualcomm Dragonwing™ QRB2210 microprocessor
with STMicroelectronics STM32U585 microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..1af19245b1d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -336,6 +336,7 @@ properties:
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
+              - arduino,imola
               - qcom,qrb2210-rb1
           - const: qcom,qrb2210
           - const: qcom,qcm2290
-- 
2.51.2


