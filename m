Return-Path: <linux-arm-msm+bounces-72358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07919B4633C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4757C028D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1971DA60F;
	Fri,  5 Sep 2025 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRfKfjhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBA315D5C;
	Fri,  5 Sep 2025 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099445; cv=none; b=iyfA679sjMNerMvtUfmWfzRTI/dTMJfTZz3hQxQ/q+V+3pH3XAXN0H86yfWGHNl3KBhYcLJdaekBC/0hxYLzt4oMemjuFWu5/Yldg+hn5VkVNfkH638HoyC+oM+TLUR3p1hlMOM1pRIi8JZvQF73KgOEe+rDtg3y/bqjy5QDrmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099445; c=relaxed/simple;
	bh=YHVu/jUGZxgSiqSqO4Pj4BM0V0F6I3r2IY96SZY3aPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qIsi5AQjZChg8wbH4ILHVhvXso/Z+8tSXI/wor5mpYAl1/z2XkWdgyFsFAwVt29UTBB7SnxTigRKM/AE0oQ2aGZTDCCpzAA2r4RieePpM7aDTZq6ugMFVl5SLATGuiVphbs+OhlGEgmIQXxoOLK77um0TbdajDgLbS5AFhScKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRfKfjhP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7723bf02181so2025023b3a.1;
        Fri, 05 Sep 2025 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757099443; x=1757704243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXbWoXxG5ku8P1RSUujuBETizixV/jyJYTD/OXJqAGc=;
        b=BRfKfjhPkq9eVzupvkSlMZv+RaKHOfTPXuLvxUlzn7UGtA36qjKnffktuTI+xzmMz6
         H/RyG5w45OoiyrZS0FsZB6JmY6BkjjOxxg8EuUFE6XsGL4EG/myOyoD4zS6svHKav2S1
         xV2qg/xGNFDSm7HurLq1aa7QGj74YUXX4fXCn4BkqImLhpLxZ9BJu8lJn2rHDM/WaslP
         4KVCIIyQASyqMkRfGx6+x+GAeQWlNfHb+F+9U0IBtqh542yPngoVTprpLSK1hrAKBnz9
         NrvAZgCwz8drVsDC0DZgXtH5IXlyaSdFRNwB2DAQylnorMp876tAtvYC8MFN7IAPHjsc
         r/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099443; x=1757704243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXbWoXxG5ku8P1RSUujuBETizixV/jyJYTD/OXJqAGc=;
        b=FrS9YMPymYtXf7o4tL+8p02twMY0MWD3o43Anr/9k6hJQQhSo/1gLdjMkz15gDu4+R
         eL1CykG0xbqVl0GKwqsLAg+mPZUGozgLdciabLbr6s1skaRkt4pmZ4gPjj3RBk29n8TF
         woapZoiF0if5VZNwHtH3De/s9dQkacqj6MrB2chB/zvV3/VozgXq9WbJQs02iU+NvIuP
         YjGoksVNrfv0eV50JjM+on9Ji+aQRCHOLDwLs5Xi3QmPKMyxM8g7+PtCKzuSGhhE9kpM
         zZLwg5bU09Asq9No8/gBMZGzNUziKw2aJ/wVnhUf5gzbU6BExmgpHgE4MdwBBuX88yKg
         rRWg==
X-Forwarded-Encrypted: i=1; AJvYcCWrcUaeyGY+pffUtjLH4UNzZisLgfA4aG3I7G7n0LSQvywye/B+mNMcF8V6fU/VGacqYeN1R1MPMbOPuTK0@vger.kernel.org, AJvYcCXVLU7AWfT7QNQwrzgv9OKpHHa7S7Xy9GwDJrytz7wPnDNNeCU1A61+DTR09hi95FOA2+wlPhUtrbyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vF5hVqCtQw2qjE/aF9Gw47Gag50b2vj+FzrkSWzfz2pkP8Zm
	esDFO0+40Z8b8mX7+fbAMx7kxFH2783Jhe3jOUauVHSU+yb5RQmcWjgR
X-Gm-Gg: ASbGncsmKhsIXRV9L/XzhGnYUHFxJ2UJcm67+D2O6QmgTmN28LuWqXujShF2jD1B0Nf
	NIxR8etZxatUqKIIyJDy1m6JPFRbkgw1yWbUjPbHsBxw8GnS6lcxbf19zMk4bs2wJNp1ielpY1A
	DFyAVlLwhwdHXvZmkZxSGb3B48XWkDLlgcNB/h9xvlfOFTrhqMMmWYog5+xQp+BJODoCK5/O8Xg
	vnG7D7nhQgNRzqHD7lOecYHrnXucfP9CB2o1sIdo2cjXj/DCGxtv2WY7un8ljdS2qb5N775YVxC
	mFZK2OKHJMGL8U4fZAW2stZOAalFPfn+aJiPSIsABVgP9b5FQ3bKwdsFDAQb4DORoJ8btFHxAhL
	zmbU5Ix8Z2Y5CKyH0/xIS5w==
X-Google-Smtp-Source: AGHT+IHjtoifj+Jijbld8eb9svDOqGQ481RQZFceJHNTfCNJVFvwbC5SrP8L4ZtpAPjdBolP4u3IRQ==
X-Received: by 2002:a05:6a00:4193:b0:772:45ee:9ba6 with SMTP id d2e1a72fcca58-77245eea0cemr24213236b3a.8.1757099443436;
        Fri, 05 Sep 2025 12:10:43 -0700 (PDT)
Received: from archlinux ([179.110.125.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm9102326b3a.9.2025.09.05.12.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:10:42 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: qcom: add initial support for Samsung Galaxy S20
Date: Fri,  5 Sep 2025 19:09:28 +0000
Message-ID: <20250905190931.27481-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset splits sm8250-samsung-r8q.dts and adds
sm8250-samsung-common.dtsi, which contains common definitions for Samsung
devices that use the same SoC - the S20, Tab S7 and Note 20 series. With
that, also add a DTS for x1q board, which is the Samsung Galaxy S20.

Thanks,
Eric

Eric Gonçalves (3):
  arm64: dts: qcom: sm8250-samsung-r8q: Move common parts to dtsi
  dt-bindings: arm: qcom: document x1q board binding
  arm64: dts: qcom: add initial support for Samsung Galaxy S20

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8250-samsung-common.dtsi  | 204 ++++++++++++++++++
 .../boot/dts/qcom/sm8250-samsung-r8q.dts      |  42 ++--
 .../boot/dts/qcom/sm8250-samsung-x1q.dts      |  26 +++
 5 files changed, 245 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts

-- 
2.50.1


