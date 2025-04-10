Return-Path: <linux-arm-msm+bounces-53806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E194A83EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14C7F16ECB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28F126B2DE;
	Thu, 10 Apr 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="COQDoNwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79026A1BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277710; cv=none; b=mRvYHETEdZISTAd8dCHzceyVSUC8vu9WCD7nMEoAGKDm7qsICUBX+ztx/So1jMpgFhOioAeu1wzRve62UCb1fmzkLcKiz7UBs3ZJ8+g8Vau1cuP8OFhEk1SrJ0kj2WI9av+H1+7+ln06hsVpnuGXckLFs02qXB2zNQB/iu3nKHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277710; c=relaxed/simple;
	bh=eVo2TmgtlN2R2X3Zf9Lol8n9FuUHnBY+y4wdcdE50E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/fZOi3+AqbRlHyTuyfCpztad0q6bQpTFsbmZVKbHOzJY20Fkxhx3lNv5lBSWJCqfnOlNIpDPD7TZei/LlegPxJRkdoFm2OTZ6Ioy6+KV/ifD9tu0t9jZmZn5RormSvuWx3dkxJnrd/HS4vTwsuVhxDxVZC6d3exzXLbl8oDCxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=COQDoNwG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4701205e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277707; x=1744882507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wnrmZrdHGq/Ptu9FCMC7eVlEpQiRVau7cfrJW7kOec=;
        b=COQDoNwGdlffzA3xauBKXcvWNWKHAmwSy/n5dICwNAj4Zu+S7Yh6sGF/Nv1zwsVoji
         iWLbfw6sdMb0kuBPgwlEfunA89MJ3wm3xFbw9p5pzpMMQy3/uRtA4R/5tPYfdbogU/fL
         0wzBg50cIfBTwGqegKbG8H+5qoUhk0bIzDQ0f1FLUbmO0NOK5HNUXPftrUH6ZMNUz9ns
         NfLgMJI16TjTB+g5MCCaKtKq/kASz8g4rdaLkyMBz1vNJipE9hfO5fB4Ax8+GNB/wQUO
         SaoUK0mpqOC6taPkkbc/NOKpChKBOb3JCPlfNvQuvWFAKxSNDTB5Nwr9U/GBhx1lEImD
         Z2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277707; x=1744882507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wnrmZrdHGq/Ptu9FCMC7eVlEpQiRVau7cfrJW7kOec=;
        b=HT4E0ddnAg3OpD0MFhwTomxbJBOVoeOfyWJjoc2tCpPJ7K64iCim1bMUWNi/ZQ1ett
         vgJN5rqSKAtaXMxTV9v0WWhQOxrbMWWFFCjGML39ZurEop/eYrN1NYV3RGG+qAVPfOLX
         AoKl/YXu617ruMM2Rd94Sio/LUuRRlu+aa3z7y/qZ2rmID6UfmswCcrSyEREOGtycY61
         0AmAs8IMHNG9Y9hxKEcgyXkj0mlZjaNC8Lvi4aFiMRAk6r9WvG0/tX9J90TbRaq0YYSe
         NA0OxyNPibtqNT8EeZGbza7jMStKDCMoecofiJRYf6Sq/1HU8h3TBf7hTyUJoMjBQ8Bk
         mp7Q==
X-Gm-Message-State: AOJu0YzqyMese/dWnhVysp4yijuCJXt0r1EWVGRp9ZnAS38z2yIyiv/S
	D+GFBK+xRHkGeAAEN1zqR0drJv5+nQ4/UXyEALToPcG0hSo2moHKo1M59VWOCE0=
X-Gm-Gg: ASbGncv31Bsq32m+Vwuoou4lsYyxo8mbdSs8Jx4MZBT1EWdBNkzMoY3/bGCtoiX/xTr
	IbShLa/9Ir7h7XbkGcEtn0mXok1uG8ldBPr+3U7m8zPUxLBw8qNr4+zuYWGHYpJAMckes/nHJw5
	a8qhWPwVbwp/gGUQt5gEeQZI0El6UV1uWMN3jwZ8Nzuor3f7Lr4Ede2q/upLWwV8rvAu4W+H3YQ
	uyOHrUrz5FAMyQPj119wBoaVSFLkUSUFhpsApzLQ6jYrup75cu5LLoq4r59dAfo3V9z7F2znURN
	26nHJbGpQcA04G/jA8pPdNrVkE0N4U8aDg==
X-Google-Smtp-Source: AGHT+IGakQPRYAPoJeyW7V5nBHKcFb/A/w0K9tmVzuwevmUfE7eHObjlPjw7A8Ij+9x62tILpo5Brg==
X-Received: by 2002:a05:600c:138a:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43f2d7af1cdmr21099305e9.7.1744277706886;
        Thu, 10 Apr 2025 02:35:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:48 +0200
Subject: [PATCH 6/6] pinctrl: qcom: ssbi-mpp: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-6-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tLV0wE3qzspwnGpVRf4xL5olQ7zvo+pba8sfw+/Sleg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DEzBrkMLJs75LETQ44j8nkxaxMY86Ykysn0
 smsHuuKeWyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQxAAKCRARpy6gFHHX
 cqkMEADblPn6aOx+OrtpJrETH6MXqe+xcAyk6YzC7QkHT1ed7muXekwa5z/ns4vdBg+vjdYe5cA
 nI6MYeBI00QuCAulcPLG1PaDhiWlQVGCoKo72gVtvrQ7WWX3KYEO2h3KolApV6VO9vBzxRmlNNp
 oXeEVu4yntXxVjgQW9IwqNNdA9yby+74CIgFnZW3oPm80l40U+u2KrmkPG6WI0l27I4CaBm7wvj
 6upPOcO7XcL3U2AHw2W6oiy1NBYz1pdVBA0xnaZOp+jwG4GbC51HZDq/xZXA1/0UgAckLRIHBsS
 YDwKFv+kmvXMkik7EFFktVOnfHlpTsl6/pZvru5GoW6RW3DEX4wcdHxTAIBIe071BtRqUzbvdGd
 hSpEteSq3knJDiqMuizmpSIPpHkHjNJrT5uqTABHeWDWYMC1rlO9AvxoDA6/Q/eZkGzDhx006YE
 gfTwRTW2CAL4hZ9ZftY8v6DMu+WVoJyw8aBf2ICV5BetJDvlOoIHWJ/bF9GGAgpGddTRz9AMpJY
 VBkvNZQTn+iztj94eQY8Il+YZUpeQ764BhVBFOjBGfrowahfLBn5DRwThWHV0ZK6/Y7+Uh9zgFp
 XgWwQcDrFTpcHyvNfHR7eaL93gK1K/L3Iohr3pHj1bnBK+aGxihS3zWsWOoEcg/ENxTZZeA3dxR
 O06WXteu3SoaDMg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 4841bbfe4864..087c37d304fc 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -511,14 +511,15 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip, unsigned offset)
 	return ret;
 }
 
-static void pm8xxx_mpp_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pm8xxx_mpp_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct pm8xxx_mpp *pctrl = gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
 
 	pin->output_value = !!value;
 
-	pm8xxx_mpp_update(pctrl, pin);
+	return pm8xxx_mpp_update(pctrl, pin);
 }
 
 static int pm8xxx_mpp_of_xlate(struct gpio_chip *chip,
@@ -633,7 +634,7 @@ static const struct gpio_chip pm8xxx_mpp_template = {
 	.direction_input = pm8xxx_mpp_direction_input,
 	.direction_output = pm8xxx_mpp_direction_output,
 	.get = pm8xxx_mpp_get,
-	.set = pm8xxx_mpp_set,
+	.set_rv = pm8xxx_mpp_set,
 	.of_xlate = pm8xxx_mpp_of_xlate,
 	.dbg_show = pm8xxx_mpp_dbg_show,
 	.owner = THIS_MODULE,

-- 
2.45.2


