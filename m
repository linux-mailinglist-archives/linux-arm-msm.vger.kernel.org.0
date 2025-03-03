Return-Path: <linux-arm-msm+bounces-50080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BFA4CEDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BFA716EC7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927AC23BF8F;
	Mon,  3 Mar 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQCu7DmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBA923A9A8
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042537; cv=none; b=sLJs18BJOZiBiTa4GcOWgP/dv5vHxAOheDyICsQGaoYldAlw+lrCAR6GhQRhciZaAPLh9w03WqUjRPC4a9nZqfvpcDvTs6t/57E0uUP7Hzipykj+wxkd+oMUZonZzKbaHBujjv+er6zBP1iYbZSte66c5upKFe/FMFZL3PA16dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042537; c=relaxed/simple;
	bh=cFE6qDwi1fJylD2s+lQiGN8Qez/xInkZpe/71LGwZvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqiONVfNRYvlDliwd7S1+QtHvOKfEvU4OkkZLrbn43NCNe3nhA3GXQVqvmlxV1Or8lze5AiH86oPZxvXRY8OMdpG9NC8PBjG8aq3vnwMVhMAWuL6Xh9LoRK5U5vS2uDfh2WtPA51mgdTgjg+K4h2pXiu7NjZtvqIsah0i9Q7yac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQCu7DmU; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bac96af3eso3555641fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 14:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741042533; x=1741647333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msppfnamUUGgJpFy91ELuhvjtms4xYNjAzSexKS9iEM=;
        b=SQCu7DmUyoW66aZC0hQmREmKph5ZHXoiCbBagqpaGQ2uDwwoS2RjR2iYEfnuXqKOaa
         D4oiRbo5LKedtT+1VHCeh2u0PKxpFOxJ50IFj7mRfidSsEM1XpS4ABqgRqgNImmyzy8F
         +/Lt2Yq6Z67tK1OtY8bUhtCVBLx0an4dn2lB+uzVcvIjIhkROQXc+KjhIopPRsDA0VSL
         fcBkoBt2Ib+ieCUAk6h4lLFY8Ywhoqy1bK3QYqWCCx4nSHZPDwtS9Xe41Gw/2J229f8w
         6+DuNHCjlrJqt/peFDYm/8Q6O8JJNpsou+ihTjBWJ/N2KX23ekmu3fP+oBX4T3sY2s2l
         NIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042533; x=1741647333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msppfnamUUGgJpFy91ELuhvjtms4xYNjAzSexKS9iEM=;
        b=V+mtPfHGebbAE2rdjVZ4x2SkQsUekMGUjA91p7X81LWd1nBw7OEGtfun7yRfl6p6Y1
         Tg2RgMrXF6LWEhmKIJTGq3eLqT7zAhweDgCbDXKrHJxGAibEQT56y6m4oLOsJQDJciIw
         VNI0Y8BTC70Z5BTlgrNmZEWYx7YD9bFK2DjlfosazRRJ4uFKlNGZJgm9d9I49O+AHdTp
         hcO6GljiF6qUyH12vK7D88ZBpUPDRF9IWbq/MBQus9VkCojwAFLlxlEEg4sZtUalW/ii
         v8LmWPTA4TQJEQXpgBQhmo2Tc73Q/HIFOMRzx4xlW/yd8BUngFBkBjgR+v0zVUJaJHLG
         Y0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVFX79+zgl4w9DnXWp+5rArN4Od4w6nj/jk6ZFzz+uINTGj0kFEdh5w3qvB0QqdUDeXOiY6uZmY0gzuSGCO@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDUzMe62P68nekiRjxI1rWA6UHzH+oBh94qVVM1forisKzKGA
	+aOeClSOfPrE4gNGqKKkcc34WPS2WPbfJFdv4+hROLtHWVQohuyGAx9iQArB9CA=
X-Gm-Gg: ASbGncsqPwdrpRu4/UaaGWoOAvq4+BRtz3JwkztEMAp/r+LeWDnMVFiuq/4VSYr2Vcy
	iiMM+NudDf9MMYdoAS8OiVukGU7oOeE1adCTHMpLsnYrb7BJUE7u6NayVaQHeGUH07o9GMYJNGy
	7jo3s5Xl4QayGiZWuqyKgMExdcLEldtcecPgA+WauutNavcVkYC771p2QdXuJ03B63wQ8K3m08I
	yPAc33ZWcH0WdYz+A4dkSCeC/k0auKcXN4FxYjSnx6g9KWv9HarexkUheBLRiSfNMkC+eLN1jkS
	t3DMWD2CdDc6jC1ZIKud17k5ReURfepIaxg4A2Wl1fEhHewN/H+lPVAJm1sCinR+6L/mcf2FoiI
	mt4skoEO7Ek6mkfIUvn/IGxB/9Vfq4oDC4w==
X-Google-Smtp-Source: AGHT+IFIz9OgAP1Nf0cMNCjQ5eIctZ65Z5mYLBJRd33pRm/cFHeBwdUYbtthRjYfB2mhF2ZBPgxgFA==
X-Received: by 2002:a05:6512:b0a:b0:545:bda:f22 with SMTP id 2adb3069b0e04-54975fc58aamr78263e87.8.1741042533524;
        Mon, 03 Mar 2025 14:55:33 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f630cb5sm662059e87.212.2025.03.03.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:55:32 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8550: camcc: Manage MMCX and MXC
Date: Tue,  4 Mar 2025 00:55:19 +0200
Message-ID: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that on SM8550 platform Camera Clock controller shall
manage MMCX and MXC power domains, otherwise MMIO access to CCI or CAMSS
breaks the execution, the problem has been discussed with Jagadeesh at
https://lore.kernel.org/all/a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com/

Since 'power-domains' property becomes generalized, Rob asked to remove
its description, which is done in the first patch of the series, see
https://lore.kernel.org/all/20240927224833.GA159707-robh@kernel.org/

Vladimir Zapolskiy (2):
  dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
  arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.43.0


