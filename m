Return-Path: <linux-arm-msm+bounces-49655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C4A4789B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3EF23B2204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504A1227E95;
	Thu, 27 Feb 2025 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QD7VLcot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB9227BAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647086; cv=none; b=mJ6OG5rE8Vty+USYDVhXX8ZBTseaQuwL5+zP7iPAa8zA4+4Y5nV2m2rBxqxhmUf1jE2d+OFgFnpLoXLKDUG2DXz/PzRRbMD77LvJidXEsdFOzYm1GFa8QqNqbco6wY7EOe0G04vMlIwPa2Xskl/+3pVjjbpXqy82pYRatVPlcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647086; c=relaxed/simple;
	bh=W311rDcRmH6PDIJt9aRLijFB9RcPoPN/7wm55jPU7jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IWfyPnUq3VgMkyPMbyfbT43IiUCwyvkfIv1jeDuj9pVaM2HoTH/0gHeAvgPJilphw4saEZNfJIsm2N4Se27Lkd+VHxI1TpdRnr4ouSuj3ZMe0Fb/bnF6O9gRafHzyWVJS/ShVLWnQJtdxfHQeTwRX4ts8cnXcV5mk5a5rYDylNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QD7VLcot; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-438a39e659cso4348095e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 01:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647083; x=1741251883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPnXeVyDD3/a5I++Wm32lgrrYtjljJd8QYiSNWIyzIA=;
        b=QD7VLcot3lnNg3oh8MtcKvvbBSTxl7tHnN4xUkeRPtiRQjKWLAf9pvzjcw1Oj9iAxX
         HxAh8ivpVR7rEFQ0ipGXnsMPXt5L9JQbMe3e2EpgJXiOzHLOCPO/2q0VLjECgz2hI2JU
         lhEJRTkW4nVqUfRr+LGlJYGMDlFCC+eMXevT0EH3toL26RCE0LVZN/LlkuQOGhytkXFC
         txqZPPT5H0jpope+WfyOdPgQep/gMlVEeBzCZYppp+ENWXTTz2pJFgHoIAf0k6fUl+9o
         PruXaFc/76gYlBkFCiKMnv6Q2RYTbTGf7MzWjvCVHoFCbHGodWdV5PbjXOXPVPotAuy+
         cWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647083; x=1741251883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPnXeVyDD3/a5I++Wm32lgrrYtjljJd8QYiSNWIyzIA=;
        b=wGrONmqe/glciIZCF+4Zdp4Je8oZaRCTOO0+DrbUdkJdAfMCjIZyy/TqqrWebds4Fi
         HmqE3UWpWN4Wm4pqD9X39iL0OSEgRJWwEl5Gx6FxN/v0FIBPDgXbqHOXFF4zGVzRK/d7
         wkcOtY3kconVIV8DOs7tO2KzebMdhbhcjqYXeQBnqHpFaiAegQsyxocEyp3jqHzH2QD8
         njmj8x23fVCsC6gIqvu6BBO5mKTmza2oE1AqZpTxFRy4IM/Acfbc80aW13F1Cva8wLTQ
         BSrFkJz3296kzO5YNjhzexqMPczFJ2mkgqkOGbao2t29GidjU1tfjHWk+vqEwDE7/z0K
         PGJQ==
X-Gm-Message-State: AOJu0Yycb5ba3Gk8F+k4yw7xhhteLzrazv7zkwMR89eUX0sFlKglu5hl
	t3JKekk9Oni440bDwYggQmMj0hcXnBNkzbRzpijdja5lPPn2PsMazz0hjL+Vc10=
X-Gm-Gg: ASbGnctDxs2svtjVqmUSrwZ8aYOgy9rQnkXMAPaPU3JkFjUBX2yjXlWv5QEaosfHCaN
	+QFtLagt+FfdTkTU0dH5uIJpX4pQaD5QrIENUgaiSSJJChfuZqVcXvLQWP2Z7vwgebhLWcnKT8o
	QXw1wXXXUBxbC6osXuhbDFHGvfK+Oc3Lg6EKIIUA22wU5wc1lPiYTgkAcNrfgJg/ApsmMsdhEOE
	ilbvXs5lXMLItWJ3IWeXxTDcmP4KM9/YcJxonC3+3KkhdjZm4y2J8fCOche4kUQ9lgy1OA6sEQC
	/9AvJsu1NG2gkmQsgjvj/VYLjzvsW1ojWbioTaRFuh5cHe8=
X-Google-Smtp-Source: AGHT+IEjVZEMO7C1vxZUmqPDIxnQY1ROt8FRk1nzun9gPfCYsAr2tDVzm73X6hIS3+0qy3FLVMoGmA==
X-Received: by 2002:a5d:6dae:0:b0:38d:d946:db15 with SMTP id ffacd0b85a97d-38f70773086mr18953870f8f.5.1740647082797;
        Thu, 27 Feb 2025 01:04:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7b88sm1362380f8f.40.2025.02.27.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:04:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8650: switch to 4 interrupt
 cells to add PPI partitions for PMUs
Date: Thu, 27 Feb 2025 10:04:38 +0100
Message-Id: <20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYqwGcC/42NQQ6CMBBFr0K6dkxbgkVX3sOwKHSASYQ200o0p
 He3cgKX7yf/vV1EZMIobtUuGDeK5NcC+lSJYbbrhECusNBSN1JLA8kHGiAu7aWREJYXhEAQLCd
 K5QoKr25s+9YYZ0WRBMaR3kfg0RWeKSbPn6O3qd/6t3pTIMG5urfK9DWivT9ptezPnifR5Zy/l
 0UdU80AAAA=
X-Change-ID: 20250207-topic-sm8650-pmu-ppi-partition-1e9df8b877da
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=W311rDcRmH6PDIJt9aRLijFB9RcPoPN/7wm55jPU7jc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCqoH1Z9ovNS+vK/O7kHkSt9kBvGgEkdNjMou8IT
 3z9r3KCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8AqqAAKCRB33NvayMhJ0Vd3EA
 CyDf0/pHGqrLmfNe/eagJmtcUw0KK5SeQ2PHaeionUmO0Qezz/txx0yeSydUI+UOT0pefSHIxlGauv
 Ao3O9cIwd+zq4G0ffYl9PYEBUeXHaaYcKxP3hUT+yKOPSmv6GZzxkKu1HGlbaLfsPgkAaVv3Gaq2kI
 ca2LaJMhFwxGhpZihDefxOG7vwuD1ewBTmlMgDjnguGWgA5F2xYp/delBk96EJ5ZTPuA9xo17AtIY+
 0r5y2l4U4Wu6CDBV/nZkLD6P+uwhRwj1Hvuvtc7ZTPMxwiNGKcswT5vr0OINRPneY68IuF3ZEvKrd9
 RB9Kx5z/I4aBtj8g6jf2vzvDOdrViKCpB0mDGqveeSpEBO5b90aV9Kw+CAeUXpm2HbwErKolRGn65L
 7hmK4KDaAW7urtM8wQHu+zTiMipSMohJTnFqXpMS5FiJROli7k7cGfyBY8pZWdrCu2K2mTcrZWxqFw
 7wXNmFTGupXz53lunoC1NLRczCVKP1VhNzcJ0BVtdZi6H3U5ZCXeGsYs0X8gh6R042Tmjv6XLZqZub
 W9Ha7idGmGhOnqyfiHICJcUqli5q7jpcGRTw7uKtEM/HFer0/b563AKT848BD/xNYwYC3rPvwGdSBC
 aI9DglCtJ3L3oFeBq2PYNi2bSbnKidWsTqqk70H7fLs9lkp6tA632A7VE5AA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Swich to 4 interrupt cells on the GIC node to allow us passing
the proper PPI interrupt partitions for the ARM PMUs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added Konrad's reviews
- Rebased on linux-next
- Link to v1: https://lore.kernel.org/r/20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org

---
Neil Armstrong (2):
      arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 556 ++++++++++++++++++-----------------
 1 file changed, 285 insertions(+), 271 deletions(-)
---
base-commit: 0e2a500eff87c710f3947926e274fd83d0cabb02
change-id: 20250207-topic-sm8650-pmu-ppi-partition-1e9df8b877da

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


