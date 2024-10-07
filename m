Return-Path: <linux-arm-msm+bounces-33413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D6993164
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 17:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E002857BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B771D7E58;
	Mon,  7 Oct 2024 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZqmpQei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967681D8E02;
	Mon,  7 Oct 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315378; cv=none; b=ugcVxnMNzV3bxlV0/iu1eEB7jc3I8ATqwC66kniPpeFj/od7h0hndkqer3GwyGc+/6aJpoOOWaSRLPo4U8psx2v0ZKazD+jChzW1XyDIh17Bi3GUsD5gyw85m3/4i6kY758hX3nq7qSWauZkapEey2LFROoLZkzmMSRx/5/Iy1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315378; c=relaxed/simple;
	bh=O5hxrvpff939xBpLOlRIOWFF+GV6E6GhdFtYVQrksos=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=susCN8iXpY3neKoh5paOcWuiwcmTcR6ClpBjvr7igDv0Lz0+X4O4dP8HvDDm45DgS1aedrWZ+NPRIa7TPOhN9IMV7Epe0P8zVs1Y8qOY7jieKb15xmKvIcBsvX8xKkVQRARnb4V4bK2I/QweISsGyEE+UwVP6I6psejVeqnLPhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZqmpQei; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a843bef98so615798266b.2;
        Mon, 07 Oct 2024 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728315375; x=1728920175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0W0WfZlzihAIptFRg5B1fbk3FKc7Ee9uAo2PW+KZQ4=;
        b=MZqmpQeiRfsuiGT2EvamBMkpIWa/KTzLOJwmAxzrlIGOg8MnmLnz65K6JtaYX/fdor
         0OaIvQ40WJbklhfHoyUnSocszb0J8YueLxu0zpXL+D08zRhsPUMum4g2BsLiyRYS6d6t
         2qLKc7KbCrNTJqyTLdtf53MdxPiCPaioGl4k9YjGporaj5dGaJ6wYPx2YvceVCKR86G/
         m6K6EuWIeEWpoDgwOwb6ZIlySQxtXdFYZbzN+p1OTCJ97b9YeS2tF5Di6PNMkWXk9W5l
         DmVuvvrIbcZyVRCGQ0v6FWZCnJ0EJIxxzJZVYggubXd0/SomNAzQk2nC8T51sZq1arin
         EgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315375; x=1728920175;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0W0WfZlzihAIptFRg5B1fbk3FKc7Ee9uAo2PW+KZQ4=;
        b=a0QhpcHezlImh6BKUo/B5V8f3mRU10b1ZjB75uLtCjhcXcUI7ExNEqb8Mn6CpRziiu
         u8lvzLXv/dAn4TXoqdjeW9yc/BLpUEpzwSx4Eeg/MrGeIFItdMl1+C6t+9V+dGtuKy44
         D/kBVyVboaAvL+mmJAKpPHPPVMFwOshR6a6/RgeRO1YYufAyqTD1RSMbtdX6H9lAQ1mH
         0tx+Qxnyh4PYW6l6pPDerJ2K/Bsynq07cd7GcBpRtFm+7kBFIUQpNO/+rw90jysrwCat
         rF1OiX+7eFrw8Lyi1dONXKJYHVix5ViHC4sgGZYhedQKM4pjX1qX0Fn5XixEibQYUIN/
         2/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWC3c6C6ZmpgdFJzmkdjLo7ia/TEfUouXyyOCpzm9w8Fbk2lmVMop4svZzCG7TeVuPtsUVEucxNvXUUOS+H@vger.kernel.org, AJvYcCWRWa7TGzTqzszAJQ1wRDChCiZH/QBbz2AuTvuI9I0eDaxVpEHep4cJqKAd/WNKto6ieKdmknkIz6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbiXQxOloyFLFEh1eCYdJN2xMbxhqjEH/gDwMfMTDhA1sQY17+
	64KVwoKZBJ/g5rmoalOVX5f2DxErRagBfv+ztRvI1FXm9dGybO7V
X-Google-Smtp-Source: AGHT+IGfrWiBtQzLk+pTiT0MbPUkWByvZ5wNe7nTlQYHv2la/t/Prh+QvnvcarWo5ZPeSvKKwmpd1Q==
X-Received: by 2002:a17:906:eec2:b0:a99:46cd:1d84 with SMTP id a640c23a62f3a-a9946cd1e74mr646985066b.25.1728315374579;
        Mon, 07 Oct 2024 08:36:14 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9937615e85sm367362266b.175.2024.10.07.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:36:14 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v6 0/2] Add divisor computation feature for sdm845 gp
 clocks
Date: Mon, 07 Oct 2024 18:36:10 +0300
Message-Id: <20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOr/A2cC/43QTWrDMBAF4KsErasiS9ZPuuo9SghjeWwLbDmVF
 JESfPdOAqWhm2b5Bul7w1xZxhQws7fdlSWsIYc1UjAvO+YniCPy0FNmUshWmMbyXCB9zgX9FI8
 hFhwTFPpzPJ9ySQgL77wzTotODqgYMR1k5F2C6CeC4nmeaXhKOITLvffjQHkKuazp675GVbfpT
 6P7v7EqLjiqwRgjRWPBv48LhPnVrwu74bX9BfeNegJsCZS9xKHXXjtr/4L6ccMnblI1gZae7jW
 CFq59BLdt+wYvFpamhwEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728315373; l=2459;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=O5hxrvpff939xBpLOlRIOWFF+GV6E6GhdFtYVQrksos=;
 b=QqcJ5RtqAjBM5Z5mLzGvHXhr1iTqJUKKvIuaTSZKeXYnT4IH+SEylsXY87B/+2TgwkC2lEv0i
 LPyjw0YblazBHu1moBAh8E7EsbPR9xBa9o+YuxXLYSymcV8VR4mjowZ
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.
    
GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.
    
Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate. The calculation done as follows:
- upon determine rate request, we calculate m/n/pre_div as follows:
  - find parent(from our client's assigned-clock-parent) rate
  - find scaled rates by dividing rates on its greatest common divisor
  - assign requested scaled rate to m
  - factorize scaled parent rate, put multipliers to n till max value
    (determined by mnd_width)
- validate calculated values with *_width:
  - if doesn't fit, delete divisor and multiplier by 2 until fit
- return determined rate
    
Limitations:
- The driver doesn't select a parent clock (it may be selected by client
  in device tree with assigned-clocks, assigned-clock-parents properties)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- fix kernel robot issues
- run sparse and smatch
- Link to v5: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com

Changes in v5:
- Split patchset per subsystem
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

Changes in v4:
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

---
Dzmitry Sankouski (2):
      clk: qcom: clk-rcg2: document calc_rate function
      gcc-sdm845: Add general purpose clock ops

 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/clk/qcom/gcc-sdm845.c |  11 ++------
 3 files changed, 197 insertions(+), 15 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


