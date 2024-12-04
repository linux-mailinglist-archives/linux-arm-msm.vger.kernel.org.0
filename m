Return-Path: <linux-arm-msm+bounces-40209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7689E3837
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11B2DB2EDAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205FF1B21BE;
	Wed,  4 Dec 2024 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ubUNQ/Zo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD71B219D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309821; cv=none; b=uUl0eGgGzcRXsZTWEc8zPBHRd0/BdDeJ039zFKfDM+sa/OeQBaQ6uGWrkB4KHeZpojNfGhT5h7R0IwUZkrRB8WMoI4vpbYS8SxwjD1InsZESADFxOlyLLq1Igz3mUhoyFpvhvTlxh8gxckHiGf2g5utfViw2gcpRoBaygfdXfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309821; c=relaxed/simple;
	bh=qtBqcqEn/lY4EWphIaSlcK33geSovQkjuOYAQ+VZISc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mXr7k1kPGlmYkiaRtoAec+DSn/fxtxpo2qZeU77JBd3Os4yMqZD03v3CjvCtAKthh80nT8TcIijEdves1GguFYm09XlspKpAw8Rc+gccHMA3F4qyKdeLkT/pD0rcIAvcHEovuc9pUqfED+z8WIpR9+et9/RYBMWCuCFQDAptZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ubUNQ/Zo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so4532485e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733309817; x=1733914617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUOtpwQ3KMagjbDRxLtGL35AgcOAJpN0ccPfOWxogUQ=;
        b=ubUNQ/Zo7eXGudRjcjDGkID6y+bZ+qi7JS5CwL8qJ3ZnxkkUmU+HO4R3pUSmNWRaxF
         zR0mzNLZnMA9AuHon2Bbk8843BLkQisMD+CzAxVfw92HcWb3Lqc6/gMuqwt/npOfDro5
         Z1kJhMx6BlF1uFFkMYugDLE8dZOtXKLQoce+96XLyJCKaHztRB9mGIbM7U0IAedcNosi
         27cfUal/SHAwjbc2G+Zb/t+lKyLZBpmqYGM1teuDP0+oyp2KrhXMyN+n3DFOQR4VNaM/
         aJGunLhHBWsQI7G9THh4tGp+Xw4VxxRwVk9p/QAWwi0h1K2IPtbgkoC2t7QSbVkrS99L
         Hq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733309817; x=1733914617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUOtpwQ3KMagjbDRxLtGL35AgcOAJpN0ccPfOWxogUQ=;
        b=UgGZxHG2k07l50neQQAsOU2nYBUFrUwZk8d8Zy88FPVWYZmXMjuF09U4BWg8gddR4f
         VOSGaqYH8F9uXZzGNhtvEfGYDhh2G43CZKYj9+vQ+lZxlO4D7b14gjqH7Y7sBzWy93ma
         d33RONxt54aw79ABarVMZIw4C+XAmUgTN0PTYqmdQ7Dpt+EOhv5np8D+ByQEBkFBR2R2
         O+dXH94u5fz/UaHbSGS2YKjxNiCa1mxtkZDXf+FzGjgi4ZdgNzSlFSAE7eASCVwiKW11
         PoYnc4Or0RpyiAlePZHLnT+t4W0tPDmaJdcul4MxM1lToBgQITV1CKjsJRLmiOEDSG7L
         pDuQ==
X-Gm-Message-State: AOJu0Yxhcsmo2bu3pIWIGT0T/rO7gUjCdt7em4cwT5ybiwmsxnBZcW7Y
	Kt69ICIF+iWX/Yw4Rmw9pJoiwfHOtTwE2yWV4q/Qy6dj4L5FiMsMMRD7+sE7nuI=
X-Gm-Gg: ASbGncvgdHBri3B3L8yKDUZ4JBraKCAd30uyt2WPy8cUVQUoEzs2/WASQrwmsQBC8co
	mlfK8aA7giTNiL2QsGgR0+xprUYmQcvnulTHAY2HrHkQigDQrqstysk0zXbJvjOphv47MuvKNyS
	0Qkk7oIkeCIbSuUstwqg3n53CCBLLnr52UQA7CWlFtpYbe2x5NuVdfM4FE629XW+cs0DlS/YHYM
	bxSyu1kRY+LvH0n1rFu7zJF0H0p6WnPi3LyyTCpqwQm/LHiccni6a77uAXVQlnjQaxOn1g=
X-Google-Smtp-Source: AGHT+IFPGq113W8TSbVKyV70ifhWGbdOFb0tEnBuYinl8tALI+lYoh0ywADaRbQVtJyZZzS5eAD/lA==
X-Received: by 2002:a05:600c:1f91:b0:431:7ccd:ff8a with SMTP id 5b1f17b1804b1-434d0d7b89bmr50085205e9.14.1733309817589;
        Wed, 04 Dec 2024 02:56:57 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd687c3sm18459063f8f.77.2024.12.04.02.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:56:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] arm64: dts: qcom: misc DT bindings check fixes
Date: Wed, 04 Dec 2024 11:56:52 +0100
Message-Id: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ1UGcC/x3LTQqAIBBA4avErBsoEfu5SrQwnWoWaTgRQXj3p
 OXH470glJgExuqFRDcLx1DQ1hW43YaNkH0xqEbpVjUar3iyw4PFob9w5YcEjTa9t0NntVugnGe
 iP5RxmnP+AKpl/LhlAAAA
X-Change-ID: 20241204-topic-misc-dt-fixes-6468da97a4cb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qtBqcqEn/lY4EWphIaSlcK33geSovQkjuOYAQ+VZISc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDV2MoaB0Baiq3Escr/3su21kioaQ6XYNT+UBtes
 cwjUkWiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1A1dgAKCRB33NvayMhJ0VtaD/
 9ar1/puJS665EkdDF+zXa2/tM5u8TffSBQClBS7ELM+fkk3vXa5xxtJxngQmu25huKYP88ncA1pL5I
 FZYkYUZD/L9xeSXqHAgwcmNrhzCkXaUz3Y47eOdHVBZddAn+uGiHpLQRoDHlHauDk5U4R7c3gyVr7c
 tWaeqqpdBMLVEumpdyEA05nFURXSm94Vf4XIoAfQkn52HicUyXGcBwl/Bf3DM702iJs2tDXjkir+mE
 VZfUcCDGrjV9HxgYHNxqLIyj+irM6bldLs/L0VGbL8/NbX0v2oRHsl92gX3AL1JPVxtqSScyrdl0ai
 B1tCRy0hkTcbxPjA9aN4FJ0cqvr5gVXgg0p5aqEQy0pqF1D3HkUOcD4ls5yusM71+rZqQiIoOTMnkp
 VwhzqJ9mu6G8lpdku+CNq5hGJGa87inckaaAJ2Fjj1F3N2c8S01BJt948lClWyTtBi9lIN+6ffZFlo
 j83BuK8dA85/9cFE5B1DSg42MSV3Q9KvOoIh4MYFirKKCcJ65oRxnS5d0CY++2Eeyai1a5wE+vqia+
 TAZmWjQ/9QmoLc8rzZJ3ym7rAQWD0ZxOl3HvKKv6wWYB5jxF6zTD+D3O8OJiPC2ZLz63nuz8hsqDoq
 p7ds4pntgWLYaQh0QQLpc0TVqeyfPy1tTYeOEiL8brug/8KwhSWlIsmmLHgw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Here's a set of DT bindings check fixes

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (5):
      arm64: dts: qcom: qcm6490-shift-otter: remove invalid orientation-switch
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: fix ov7251 lane properties
      arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-supply
      arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal zone
      arm64: dts: qcom: sc7180: fix psci power domain node names

 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts       |  2 --
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi    |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi                   | 18 +++++++++---------
 .../dts/qcom/sdm845-db845c-navigation-mezzanine.dtso   |  3 ++-
 5 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241204-topic-misc-dt-fixes-6468da97a4cb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


