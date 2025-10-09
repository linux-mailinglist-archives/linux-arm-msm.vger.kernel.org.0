Return-Path: <linux-arm-msm+bounces-76638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4224DBC8FD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E7618860A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465542E11CB;
	Thu,  9 Oct 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Gp+ctcNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772332C21FA
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012632; cv=none; b=fyj8Fz2rPxdsghgsdorgzivBn3CJuO2mfgdQzloSiRAcAp+K/amOcXzozmaLzQ6Hy2kclMZCc4V25y88TP2tKoI4cBJbghygXqX842UnDcrY4rPC8Om2u32Vw3TEDOchImuxTrMhudxqxkn/3eSx7a3ipiS/YH2RegEtxb30nMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012632; c=relaxed/simple;
	bh=NKYwbSuoZ7KUdj7otYEtY2P0sntuXVy4h1xZozLcbWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QXa6UGPZ7239TaTlCgPGu4K7qQBJi2WmVDxB6K9EUAeViqHBfdAOTPkKBB7sCA8uILJ3bieQh52oTWlAibAmFdXIFFJ59/D32MMYJhIuYPmYxMflew/NrkEPZQZxdRaM9OEYawES9JsWcCUGa2c3Ct8hdwXpFheS2XtHTwwb/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Gp+ctcNA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so1812562a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760012629; x=1760617429; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHySYeGJ1ieMTpnCcwu2cfiHKzDSjdVN2CuFIzAgi+Y=;
        b=Gp+ctcNAXQVtTo4EyNVw0Jje0zFymioIy6QAJcQelXjUpxtCi8o0wH7ihgAoJt7yon
         DtJn2lDZCkruacpp8k8ndaZYbRER0IAOnEc/DGyihN3Ma7UEZDsZpW7LNOSiG3aeiDJq
         eFVbXzft8WovxXH3ozl8G1CYPJA7Juji5ugWgCWpkndhnzHecN4cWmoji0suWhT1kPs5
         shVxasnAredQmiXH60Uatdjg+uzky/NWEW91zcvCJ4oXevdV7Hcg7g4pLet24/lAIEJ2
         NRpZva5d6MU7YDgSb30BYkz/Xt22uultBF0RjqhaiXu5a0PWdju1m/WMI52CM8GNxbc3
         bKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012629; x=1760617429;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHySYeGJ1ieMTpnCcwu2cfiHKzDSjdVN2CuFIzAgi+Y=;
        b=bqeD1WYGuMD3VmctXMa2AkgPB03wk6x9qQNhMpJ4NERs367+ZbizhLX9RiqauSDDza
         eXfHktZX29wl+bChupUOjHG543TyBeKhgQznYMtAsFy3jhIxDJwIeFVsibS6dG8WuRmj
         9kRI+uZenGoaMNbmt+cOFwFEMynvDEvDJuWfqeHuLPDKwiiAdUDsjxBJw3etgNTQYpwG
         9RkxofTcYfAiNRADPISiP1cQd84pdERQs5Teuc9Wli4Cb8yT8a8PSwh0j8XnPibMuneX
         R+8U15Ut0CVuyYBr8vtMWzKgGbCvc5ZsskDFXVBWUktruJIQ3+K+HTtKJcVmXYZHhrEt
         aBGw==
X-Gm-Message-State: AOJu0YzBd+wg1E8f8LCiqLFlQ5iTW68oe7xeiDq+D4WsbQZ8t9Ppuvxm
	7seY44X14WM4z3/4eQcqDU4o/tn8g3lalsVOpg7qeEgnAX5zPUV8m9kN/X+o0Avb/EU=
X-Gm-Gg: ASbGncuEYAqxYYuboqMMmWtl1iBG88aHNsXAG7I70sBKGpP84i6aZWYSqmUXT0Z441L
	hti5NSEncnMo8UUEz0MJIiKt0Z8JhAUyfjOpWNwstuvZHgtVL916HhC03EhfXRDC0bXSBZLWm2s
	Z6sQyni76jXh2SFmKNWWZkEHi3aPtCWjgCy7bKeywWN0Ce9gcL0F7QEysqxbXpJ6gsYaIYpvXvv
	BsT/ZwRC0/61OdaWTLF8USJ2YQsHDms8P3G4qf5VZR4FF22I9xr2wmYEJNI9pqfe8rY3R9wweV9
	3cU2VpPGGGHzQBdYfs6o3uuzvUPYXsQFt/L3S14IwCjSC96KUWkkPSK7niVgF7Qr/ncZXgxdniO
	nGtFEFGzW/2ShrJPbr7Qs9QGJQZs9f2F6M6L6PaQgBfqfOF9BH1POrb1MB31VZGDb/l1JwTzSL7
	cTuOL/FrJcrlHt4HVOKFAz3jhtbYUCXPWVUrZ6cJk=
X-Google-Smtp-Source: AGHT+IHHln953x+ocb683fbtunM4jGpgYY7ccluW48jSBvEHmWWg41yNKdtcVem28NTFOpr1Aiy6yA==
X-Received: by 2002:a05:6402:520b:b0:61c:9852:bb9f with SMTP id 4fb4d7f45d1cf-639d5b57922mr6410311a12.1.1760012628801;
        Thu, 09 Oct 2025 05:23:48 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3d09b92sm2231273a12.30.2025.10.09.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:23:48 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH RFC 0/3] Add support for Asahi Kasei AK7377 driver
Date: Thu, 09 Oct 2025 14:23:37 +0200
Message-Id: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmp52gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNL3cRsc2Nzc92Uosyy1CJdCzNjC8M0I0tzM9MkJaCegqLUtMwKsHn
 RSkFuzkqxtbUA4DpR2GQAAAA=
X-Change-ID: 20251009-ak7377-driver-86381f29765b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760012628; l=1154;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=NKYwbSuoZ7KUdj7otYEtY2P0sntuXVy4h1xZozLcbWQ=;
 b=+mBeh2zVh4IEuQ1wv5ncOtyoapeQ/seSYFdezBTttdLSr5A5HdBUQ5/+Rl23YaFQySt8PmHTk
 ZaZY62dL0V0BQ0C8GwuNMvZWkYHpWkU5koSyUD3jX1Pno5WCl/AhfBZ
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and driver support for the AK7377 VCM driver.

The driver code is added to the preexistent ak7375 driver, which appears
to have similar function order. 

Some values of this driver were reverse-engineered from the existing
drivers due to the lack of a datasheet for the AK7377, The driver moves
the lens but could not be fully tested due to lack of camera sensor support,
that's why this is marked RFC.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (3):
      dt-bindings: media: i2c: ak7375: Document AK7377
      media: i2c: ak7375: Add support for ak7377
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam actuator

 .../devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml  |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         |  7 +++++++
 drivers/media/i2c/ak7375.c                                 | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20251009-ak7377-driver-86381f29765b

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


