Return-Path: <linux-arm-msm+bounces-25073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BC92576C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C48628CD62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CAD17623A;
	Wed,  3 Jul 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG+PT8Uf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848D7174EF3;
	Wed,  3 Jul 2024 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000245; cv=none; b=MQuHMft9aigpodfZhkZzCYjFXkb931LRncWha3RftcHw47LHe1HHgjMDnevJG61plfGxqCaLwXMsEYdlgVobWvY8KmaD5OqRU6veoozi1srD/9LuVGBdZmJLMha51/cZF+PAPMBMClZHZ1UaS3gKCQWpU9tMSq3q3FqlgmI0hYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000245; c=relaxed/simple;
	bh=0Ld8vX9WBeucJVIFv2KTKTHdTYHtYqJmnFDn01dCNek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT2HfWtrlqht9K2uLuc3QTdUzGBvUmLwOliPw5VQtQajxEXr5N6pUHdcvQOyYGGmuUQGaFPuWJLJc8B3VGGakpFOZ3jAchzXcaipYRVcB7FwY5uK5mF3KLngHWmYJDtORWJYE4WYut5LNRZ9L5shogDyEGiVxMfkbMvQAto3GLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG+PT8Uf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7541fad560so206109866b.0;
        Wed, 03 Jul 2024 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000242; x=1720605042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/FFHHxRXCiHESWSSzIR+30DbRf3GOBGMceZW/6eQho=;
        b=WG+PT8Uf2ZxBQnk3ANyzZ/4kGwV3sYvcBoUETlSdCLKgziZYYHuxgJ1ucjDTys+5Gv
         AduJIlmXHo5aKobFEM+pFtdhsrMn6o0intTQXVOCxu3VsXtT9A5a/0MPcQjK0dKU6M5+
         +avLmllrWsAu3KJdcv9oG3H57r7T0GVX+3tD+72CMb7aWpWFwQv49EICmrnIfdzbQtUg
         s7KtlkBYhQm82ysmgBhks5iKBVuQwIT4nPEkpuv51pLljun3/BNHSsdRfkWW/vlqU6Ud
         dmvXu4l221mi8GxVbwV6d6NMzjmp5FjpILja7SuWnGATXFd2jVmO5NDjEi/C/+fubr/A
         c8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000242; x=1720605042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/FFHHxRXCiHESWSSzIR+30DbRf3GOBGMceZW/6eQho=;
        b=Ii0xA3P+k7bzIdOiLSf31QV7YDySJ1UQXLwyRn2v3vBlSAVB+OASMO4bS9IWUp0eNi
         cE0r3EzbPSFWccBp2TE0B98edGDU0r5eVFz+M3OwnrktQDfRrctacFohQ4rHmdGTA2U8
         /RIQLq8OdcZMWpTS+7uNhYAX+HQmw9uqd1NGidQ14dAwsD9AJTsDHih/S5OwgeHYOuLc
         li0ejgzE8xBe6z8FhHpw7C4nnGGhp8ajWg0Ekj5A8FAd4H5mWAKkrauCGNWslStNCtjj
         /2StwxBl4aCPq2KyqpTrkc2eyEwdjqU4xGPCjOvcyapu83A2o5rv3DV9GXvR6eIph6zL
         70Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU9yBudVuKpqOq0UXnc7o7bVR9sI0YaNHKAOFT7ii2patEb+ZWG/0Jt2A6l9CVAzBSejd+NqY6EVxR57ftdsdBIGWUL5h08uJa9f3WQQnQNAmm9L2vuziIQfK1jilvTCO4FrPkXLzSgzmzici2TrXeUO3s4bQBp56N0UqlDWqoYpBtNIdMiBA==
X-Gm-Message-State: AOJu0YyFTufrMEsNgzTAGCA+8FTvy3S2t8d3fsQbtJFRCcg2X4fhIKjp
	In1rDlyG04KdduM8Pqj6pLoqsdku9vSjPupp8Q92T2fj/e9APpro
X-Google-Smtp-Source: AGHT+IFvEQQ1or7Te92RZ7ee6rZM9e+5Mnmbmp6JAtgn1kSIV+we403CXkNT3daH3fdDLTkrC72WiA==
X-Received: by 2002:a17:906:f847:b0:a75:1096:bbb4 with SMTP id a640c23a62f3a-a75144b9bb8mr700286266b.69.1720000241798;
        Wed, 03 Jul 2024 02:50:41 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:40 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:23 +0200
Subject: [PATCH 10/10] clk: xilinx: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=760;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=0Ld8vX9WBeucJVIFv2KTKTHdTYHtYqJmnFDn01dCNek=;
 b=qbAZlsyWzomXPwtnqnjjR10PqlzCLG5uVxcNmtMDRmfWhY+nLBfhZqS5clqsqtfVrERC45aqH
 MoIjvu7D0tkCoOqeHOgE9Tak9NQ52dqqmYQ7r9zdNOTlkalNvb0TusC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`vcu_settings_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 60a3ed7c7263..d983fab12756 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -68,7 +68,7 @@ struct xvcu_device {
 	struct clk_hw_onecell_data *clk_data;
 };
 
-static struct regmap_config vcu_settings_regmap_config = {
+static const struct regmap_config vcu_settings_regmap_config = {
 	.name = "regmap",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1


