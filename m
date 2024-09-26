Return-Path: <linux-arm-msm+bounces-32555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 050479871A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 12:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16E82861D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D5B1AD3FE;
	Thu, 26 Sep 2024 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDLVKc41"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF07347B4;
	Thu, 26 Sep 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347126; cv=none; b=TZA12Hca98w9w5gxXT0I1EgDHy5LfwiEat8iRTfhRnprS/0i8/7dPQDdT8NxgLLgI/Gqfr2Fb3n+y9oEOLKH46nP6N2W3XdeLH6Op7ldKaXijJhSxEQROT/rn0NfTEVx8s9TGBlAdrGXuP25gVOtDedbBFGsDOPQ5QNQRTpWKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347126; c=relaxed/simple;
	bh=+qcwPAH5CWuhj09/E6HWAImsCw7nT/5uSGGKzcjVS5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eYGS0v2XQDa1+20QbprAuy9AUabLJO50fb+phQX5ZBsWwbMKR+njgxh1F4/VcHu6dHRoiXfyxlJ2vAdlZAk9NXWzhWHQPpkSNC5qGh7CesYE3kNiJ2Zyy2Iy/CCIOh62frCDJY8Nk3lEaSEJ70ckP6Z8x5rBkVdPIN+iT4GXRDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDLVKc41; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso7381961fa.1;
        Thu, 26 Sep 2024 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727347122; x=1727951922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=le5ANOrzvZoJzrfQColCGsuooOBHCuVJFSkbRGME1l4=;
        b=HDLVKc41fTwbneLrgnCMhs2f8fYFuukefKoRLWMRspMGxuRD3t8NeLV46KNbdNMICJ
         8bpMyPF832nmXAEGNVOM3EzwQ1BD37tRSsoDzFN2rlejoicmD1XkfBJ0MzmoPws2KrcH
         9Q+OqToGClKjx8W2qrjSkNRV5aO+kO9zSdd5n13l0zjTqZHkba+nbOGi0WCBKApMq7V9
         XM5pigYxkSjY4GYSsEXImDCd3i8PmRbHYLkJKu9azc4uRCMXLZEF2hFQQbauVYWSO47X
         Diz3BgfVSlJYCmZ4S7tL3VmgKLmrLNV4FLkgFQ9SSIFXlfuS+HFAls6YLA74fkI77bBG
         CWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347122; x=1727951922;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=le5ANOrzvZoJzrfQColCGsuooOBHCuVJFSkbRGME1l4=;
        b=N83nTNBLI4F0n8jHmA0p/Ck+sQNLIIJ1AcjxxVA9Dm+NG3EuF+/oW8h1A2+1gmA1fc
         DDLxXo8RZ3L3CV/hOAC6CdoozVGHAeElE79QaAgabqpYUGUOW8knLw8h+2bu6hfEZOXm
         +lw55a9INNKxkPapVi/XcsFXjOjvED+3JVy96XVIZxMku0XI5L7ge2yQI3+WA9wEw5Bb
         N1guPpCBYQrU87JP7Wa32GBiK8VRB4sU9Q8F/Q0SU4ZnP9turLORIT2ywS4yTYe9Pe6E
         V2nK+Q24BfSEPiyCkLEFEj+NlF9UV9eJG7gnBt2DgKyr/8/8xnQvSFwoGu6wENHJsxPu
         n6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVY1EKxpThm4/QMysJQeEoXeTD4EtEHZ7GVCoXqP2gusFlgZ+Qe/ntzUXQ9ch4uzQTpsN5nope0HchtG1nV@vger.kernel.org, AJvYcCVlKHvbZ5c1+i720A4ZErefgVTsqhSYsISkwiKVOiGoJTP2wHrffWdmAXpw9BsUGivn5xCIOoKIHc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYe2AKj9sOd0WoMnB0hbYC7H8NQRkg2D0jJ5EkWjOOhM8wbeA0
	GMxFDLuGZYbqeiTPmqnLrOQuVKDKlgKYqZxEp1qz10edrW/HYGmp
X-Google-Smtp-Source: AGHT+IFvlc3qdoIDjeZIFAD4TysLNLgMZ3yQFMyZvkuaMgNliPkwUyywGAPZ+4pvKIIUZR2cn/+qgA==
X-Received: by 2002:a2e:851:0:b0:2f6:4cc0:5438 with SMTP id 38308e7fff4ca-2f91ca407c8mr28188701fa.29.1727347122285;
        Thu, 26 Sep 2024 03:38:42 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2f8d289ee94sm7863791fa.120.2024.09.26.03.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 03:38:40 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v5 0/2] Add divisor computation feature for sdm845 gp
 clocks
Date: Thu, 26 Sep 2024 13:38:14 +0300
Message-Id: <20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJY59WYC/43O0Q6CIBQG4FdxXEdDULCueo/WHOJR2RQNkNWc7
 x66tbqry//fzvefBTmwGhw6JwuyELTTo4khPyRIddK0gHUdM6KEZoSnAjsv7b33oDpTauOhtdL
 Hm3KenLcgB1ypghc5qWgDDEWmkg5wZaVRXYTM3PexnCw0+rHvXm8xd9r50T73NwLb2vdi8XsxM
 EwwsIZzTkkqpLq0g9T9UY0D2vCQfcBTyv4AswjSmkJT5yovhPgG13V9Ad5rAaM2AQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727347119; l=2239;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=+qcwPAH5CWuhj09/E6HWAImsCw7nT/5uSGGKzcjVS5Q=;
 b=gKZKCAqwrb0LGnUPDlBsxmlEX2n5s0TnAxf+aVPZ7zOFtEruk54QeV3Z+VwedfLj+ZboKLyTK
 46AfT6x+LZ6Am0bMvj1ox4Ek/xUn0lzOLUQyQOfiThn6TPQropQiChQ
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
 drivers/clk/qcom/clk-rcg2.c   | 201 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 drivers/clk/qcom/gcc-sdm845.c |  11 ++----
 3 files changed, 198 insertions(+), 15 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


