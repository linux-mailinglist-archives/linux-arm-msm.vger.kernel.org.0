Return-Path: <linux-arm-msm+bounces-81428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C14C52A4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99AA24A0861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D61433BBAE;
	Wed, 12 Nov 2025 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QS+2BMr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6383F33ADA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955756; cv=none; b=XIWl3VLkveqbz/rrKo3cfnZQ1ucGT49RtSMtMK6vogi0oKe4aY3WtrM3RNhQx04Psjfly6XiWn14xrACoBn4hIPXdeck233QVGaNN52izyTivUY75LMkzV73wLUoU+/7cnpgL/a1sf6OgZQ/xCUscqkLLv53Rmqn3FMIdp5Cqqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955756; c=relaxed/simple;
	bh=pMVIDl094hPPBJ3k0e5jfhRoS7U501FS2T88kBd7i0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmZlHXPFBo8RKLKfBbmCY0+YZPRv/T9+gRn0/rBcx4edCLKvmfuk1PSG9/jZwbUIHOGtEXKUA/ztKT1N5QU+m7jiirVXBJvZI8uEZsJq96tkuJhPXzOPt55gXM0DSHWxmAMoeoQ7UixIuCDkdICsVep+1yWbJAM0/+4/tUsi2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QS+2BMr8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so9779575e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955753; x=1763560553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=QS+2BMr8zwL0QqE6FRda7pLvxTD0XVkuKZ0vmbHn6+h8WNcTepnkta+ORme+Zk/36J
         572lqLKqsGnX9siT+ht7pUbQv68fRanbdyWY0WLtL7cWYdDn/Vr7OoIo1Qg+MiVS0U0U
         H1d0lqVhku3BLFEzndUceItzk6x+lFn86p2SOMCfDbr0FdvND4SzmfQWxkBytcD8rwm+
         KYH2GVGWbZ+2WWwwl9A9xKxpV3KnYg369MbItIm5NwAla7PoOtBSktf/JCWoWMajGZhn
         sL+/j/M0t2ehzE1P44uWaKNv+jN+xD681gSdqcUpGTZccBmWE/3nbDz/sWkJqGz7d4V3
         kH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955753; x=1763560553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=JTkS0l1ajhvcVKZkC696SRUhNXNzUxfKj+xr4StxlKovFMIVWIG32fBzd79XPUFakr
         wR78W2gtILDWmpdm6Z5GPS1mYxqr4wFZJNyR21tjrazuBExNXmURvUpUttcauWJCNlpf
         LKt+RPxHM39c5aWju2ZFHPUv8asKDnyfTw7F/pHYY1IsAD1/LjP/0EBpnpRKglJ0pFHm
         spX1nmTj4s00kUkq1yPExYzKR3Az+QYLAmqIWCiltpk8s4oDkBrXYLXRZxUXmzVGs2H1
         OakWFVP6A1WzMsYtMb00NUtEPSish88gVgSJVwHq4hqKwRqJGE2pwTH7+L5y4WJK+O8T
         beyg==
X-Forwarded-Encrypted: i=1; AJvYcCUpqSnP6scYNZDrfLM6xujyx0QPpy/GJuB+pbBXf0c0aa+rPAXcZ/DtF41Bods5nnAUnlCLyAOYbHi2Cago@vger.kernel.org
X-Gm-Message-State: AOJu0YwOe9YW1Y+aZt9AS3u3ya2aTrlbf4tWXCLvQ1zvfgnN/Uu7uHvd
	KlSK5yNUvrK0rQbtLeceTKW9extmwRADBbyJkwjvnHtA/O/4hgICYAfBotT9FAzRdqw=
X-Gm-Gg: ASbGncvqn73sGpdBZnusLRHp4EmS+bdKJUkQRRsC9j32uXb4DEU7iwdwC7mj6tEIMIK
	gvk6XDHGMlcp4CVznX1kohGfmgrwAjcCITWFel4XHW69OIDb3vgVUg1dxmQ99MltNKj6Zr/8TGq
	ytk0fDOmpXz3MnrW2Y5pGHmmMHPnYf3K5u0HIl8+sW2ATstjvRPqTGl0bLrc21mz1Vhy1NUc3nL
	61NJG/JQ5SCg76ncKHvHL0kCIC3KummVCxonOTaR7YdTp2rTYsX3BHok5Y0UR23yZnszGwCHLyP
	oiWsDOZc/lWuCFnjbSi+FTBE/e3MSdUtJctfHrhBDxM1FqAzeEwbf49JRZiodF6qpvArBm1JG4R
	trl6NS8CVG6r0wGtgBtKovKiNFHdlke7bSdDHwgthBbMEtzjGmGupygyJx/mBrTUqxNg=
X-Google-Smtp-Source: AGHT+IHJt2UAXPW2MhXPVBBMI+uiCZQQH4pvDWU/Qe5FJx2daMpbRe2y7K/kRKjmxJ4TfWX+tRiFBQ==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr31124405e9.8.1762955752566;
        Wed, 12 Nov 2025 05:55:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:37 +0100
Subject: [PATCH v4 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-8-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5tWrLPzClpmnMADJpWcVY10mVN9q3Vw/ebyB+WPO3Cw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHXDZMnwTAKRmvdN9vLJzwjFFiSdS3OXohry
 PUdZAt0JWGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1wAKCRAFnS7L/zaE
 wzUMD/wJ3SBi0tLbJfLHaJhap/guD7pReEjnW/JOFDIC2yq5EzUDFEcY2ViZzm0g23lmQuNDYfK
 A9dkc1Mv+1lDHo2WyNnysll2axbhGj5aUrn/CRjyhAP38l+zWwE1lmSO8/4QorZVdOBbmKtqgs2
 cAh4KcGjmE3UCT6hw+o1H2Y9P9CjXJR9elZ1tGxe/rhxV/4AZcVd9Y/ii8edu8RxZ/sRYhEk5WM
 fRMEOqLO2vvrStmWdHmJVvco93x2yBlOM8nGDFyAfbus7MnFkbt3/oM1bGOFNMdljTdqAnmqduW
 9w2n4+muj0DODSDmbhf5LxohVoIe4YjL2osikP+z32QEPd+RH6u1WwW/yNKHWsCbGjxiZYp5ySw
 hukbppWtOdg7agAmIeium9gbFu92bYTi6faAUI6gElRB2ZpQxJX0w0K7vBLYk+yDV+KHtZwzdeA
 dYffKpRViRdgesoFBEq4ngvfCW2BXb6Igh6DGMUY7oMiWxZhzSVXJJoUq+3k3a3ly9r71Fd5t/D
 XwQRIape22DdjWtcBS0I+N3YZ551F3dIYO4wV89vQEqxGyIpGgKO8fTaDdg0vGfaz5fOGjHuyiT
 4vcee5JPb+QUHuN3nlCYmBKHKr73jH+0N+HzpMRJZftovkFJRJqTD/ScNSWk0I/RgCE8u/APQA8
 6yW1XuYbXdH+Qlw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.51.0


