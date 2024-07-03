Return-Path: <linux-arm-msm+bounces-25072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6E925769
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DACE28CADD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FFA1741FC;
	Wed,  3 Jul 2024 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwYkkUlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7651741C2;
	Wed,  3 Jul 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000243; cv=none; b=PGeJUZnLtu1mujZJz/vtGoyyEgqpNwzhfN5j8EaAgsiRwAUNYCWXM+LdJJer3ZuwQHF6fXX3ecAmXct3VtfiaJOVh5EIuTiIh2TfrjJJRUSdhq4UZKDknd+KlMSc3pKeMQtlrLUzCoROJ2A1kFaou5g59tLpP4fYf0WuIgiFjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000243; c=relaxed/simple;
	bh=4FCNr5GOWcEA6y5NqdpifkLm70epZYiiKRWR1KypcjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZixHBzw2gTRgGdm6rwNWxQ2zuZWc4em9LeAxbPoktjBEyz8PcmoEWEe5w6TqSqbktroMM41uuA9TzUO0eDdTBZmlV86Hni/0ZB7ZGfw4+0DvlWAIGtpIAQN/9pdZDat+dc8fMy+LTN3BmqmGDsT0rSRmVz0GFuElKr2waA3eRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwYkkUlV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d046f4afdso1495307a12.1;
        Wed, 03 Jul 2024 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000240; x=1720605040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiCqBhqUCgc2qlo69kMyfb9Kw0XmXS+HbWPYR88AKtM=;
        b=JwYkkUlVIbIPHjTKtZaKrfdmCLSqLIhyuyx38W+H91zZY1BtcXVylFiTSGDI5Etsua
         lPo82F83b+hMdY3AFj1T/Mkyww4P9cwp+mXZHjFmXX3HL/YoSoeWF1hZxLeX73p3GVkz
         GXayrJZFGJspaL0Zyn34v8vWAEZjDLx2hE8oqi5KsbALYTWzzb5xNgf2yAqWET4DWANg
         TV1Pjihd0wpZLvjNwcpNhkGrmF87HEqO09vIIbYbtE32ApVxyveJsJSmZ11mI1rJpW1Q
         MerYFXuDxCrvzaU4wHdKfi+UL9F/je3cTUgXtJqGsj4O/xP7vBhqmzNdmDtE21rPsUjR
         gfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000240; x=1720605040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiCqBhqUCgc2qlo69kMyfb9Kw0XmXS+HbWPYR88AKtM=;
        b=tSlPFsnUFzX0Tc5e9aIpRdOfetkxH5qJrSglZq/4/lFUNcOCkGEHMoYm1hAm2eXlu3
         oyX7/16KQ9JlU2H6Qb3h2a0cfhEBjGpqD829q7DXXSVBbpbSFMmiDtBrUqVFEYEM5tq+
         l7fBWgR+bbucuZQky2J9DQrUIpAUOHNgeEqVdKQigH5va7JqAvzdWGmxvZOwvbYApd5F
         Xc+VSSrRvtLAW1AakxhTyTbwetWW2YLzctvRoDYJONjwgG+XJsQN6Z/5mIrcnyJAqe+G
         u/MNpj+SPwn4K8VLrO4JPrJA95QXTW2tsoOKq1AvM3VvGaoHShej+hSbkoortcFVpXPt
         aAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu6BL0u1HvbiHcsubW9oaHiTPgDEbI11XdHyqMD/4OvKeWHCdDvw0jpXwatZyDkopTMPfe1vgM09RZ/73Z1HdpolAckj9fSiPZOnfFrbRF7O1RldsxBDQj9eD1cbEuyCzvcFXCl1lAx+Xa2Wxno0CjAr1hyjZ3BeBRzljITAtYIPwDOjdx8w==
X-Gm-Message-State: AOJu0Ywfudp0FNSIjFsCBp+QcoAiS75E53Hh6fXVLbyptBObagHkIUd8
	9BpRmOajfBJmor/NMPDKx+dhQUA5Ayo7SiWnjAMjpH8FpLhipmY7
X-Google-Smtp-Source: AGHT+IH9+soogFDEvM3qfzATv+xM46StvZo3k4+MIXApLMLfrZb95ASnqwtlsqhaymD0ber1BdzxkQ==
X-Received: by 2002:a05:6402:1d53:b0:57c:dd3a:f399 with SMTP id 4fb4d7f45d1cf-5879f3ac31cmr10795277a12.12.1720000239972;
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:22 +0200
Subject: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=823;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4FCNr5GOWcEA6y5NqdpifkLm70epZYiiKRWR1KypcjM=;
 b=hxckhw6snFQZeQGymAQKqS0eL3J2chT1g/zqB+Nq3f/23Ef5U+/1Bs6WOELhWWFbyyQW0D6hS
 pI0dG8mxc8nCvqABfGl2sjQpU8VqFqsdaygU+yFnBzBcOvEHmee/pmx
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`sun8i_r40_ccu_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 984ad3f76b18..2f51ceab8016 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(struct device *dev,
 	return false;
 }
 
-static struct regmap_config sun8i_r40_ccu_regmap_config = {
+static const struct regmap_config sun8i_r40_ccu_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,

-- 
2.40.1


