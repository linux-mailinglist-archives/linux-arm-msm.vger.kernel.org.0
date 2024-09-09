Return-Path: <linux-arm-msm+bounces-31335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA330971BC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9315E283729
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E186D1BD028;
	Mon,  9 Sep 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtNEPAOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD11BC9FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889918; cv=none; b=kRnP5FEBD49Sw3cggH3JiiEYo2J+NTxZphSWmVTUlXyJkR/7+LUIS8ZgYX9giUDivsDx3yLXmx/YQ8g+piQuU4/FAMwsqDEmULRJfUHmoODmdx2B2MxfXWRgNF7SKN8Ck58TZAknk8QT+xKR5EHYx7QePjuxPDIDr10zIE7oCOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889918; c=relaxed/simple;
	bh=MS4Vn8NDElkbWDEAQWJiCHTN4oDL8ETlvc4aO5xEqXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uq7fRvWqWgr1c0pg1XqIqMdiz0JO/MQphHfOh9Lt9J5TOUQOm+8p0WO5Ey7ntxyW9G+M5dYYdtv+4CkcsC+sRri0GWewd3OANZy2SPNLe7xICpi7rqmsFfH4wgj1XcbxTyUqCwdx0eJHJz1AqDijwWXtuct9cFKcv12DkZPdDxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtNEPAOA; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a91c8cdd5so22186866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889915; x=1726494715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yX0ieRX3qt7UlOSEcKeb4ov5m9CKVjYZ6v64GoSji2o=;
        b=wtNEPAOA8zPTggjNZsJmPNtm8uCjNQ2aZXUEDuka0sq6uCH9TGvCY4vcxK4bjIyJdP
         ffqgD615pvGgV5j5CiN0BHZCFRpHAOzQsrXeugEcBoeEfoteVqypF+B9fD/CtPOXymXf
         Miuhc6NQi6uAzemHP/iq1DLB6//9g7Wq02djKqHK/iaWOGxb4LUSMC6qdypg2esKTQIA
         4nn23nR/MOwYdi461IfZ7IAmTqbMMJLbhGy5shWgRFRg1IC/aVkzU70xJv3CQncNCsuN
         yBdt8SVNi/+60khZoKZ6BYEyveJxWUvIm+YUr8fM8A3dTxQukcd+EL8ISlAWPT3sv9+d
         b9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889915; x=1726494715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yX0ieRX3qt7UlOSEcKeb4ov5m9CKVjYZ6v64GoSji2o=;
        b=rOmSbZCQJSuEnPa0kfhd4mymBPj1W7bTi0ef1cCftaSOsKYTZVm9gMnabbfrONmgou
         UXPHOQoUI6b3Flz5TxyE7cHSVYC/YIAJFWC5lYbcbnFGv8y5HvP9r/eYI7zn0RRcbYLi
         I8yGdnhNbOAkiIqEPkT5IL7hBCKwSJLz9zFBjx+CiSOHGKWRycrWs6Cm2ATJgIrzAUzr
         dEeLsKAdZTOD4jzCczMdvIhckl5ucEuV0Bp/3lPY/v5AL8wjp2mh7O6Y7GTcpDHz4QQw
         Ps/ynPOwWh1Nwfm1cWnhOxkUHAnMydBcc7sJ1nlKz0SvklItHVzQPUDc+Dk53MxW5QNq
         TNDw==
X-Forwarded-Encrypted: i=1; AJvYcCXmvxyZ3q/WLUM38E7kTzXmo3Jb7D1r5sXaW++sy1gBh3LmfD4v+o16wkhGMHA5N1RKkS0SGL9WglE/PaeV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0+CsaHeHUIjKOZObdkB3dxTLKyvYg+NcTfgvf9Uyeb8tbAou
	MkEvb6PoLkgVaTK91VuqgDXHwnM/WR0pHyVvvHPJDjXZvCK2PLPABYiAJzK9BOA=
X-Google-Smtp-Source: AGHT+IHCG4aOhWEoDHhp4VlM/hSRsuN52yWkPHfFAEGYdvVImYzvsFpKRpyVze8PsPQZpSmUk8de4A==
X-Received: by 2002:a17:907:7212:b0:a80:ed7e:8468 with SMTP id a640c23a62f3a-a8a882725e1mr381160866b.0.1725889915394;
        Mon, 09 Sep 2024 06:51:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:23 +0200
Subject: [PATCH 12/17] regulator: pcap: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-12-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MS4Vn8NDElkbWDEAQWJiCHTN4oDL8ETlvc4aO5xEqXE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1ipR0PFario11XiOMREeg6br4HZqWH6heoy
 GID0BAwI3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YgAKCRDBN2bmhouD
 1+kjD/4yE+PIP+59j+gU/cUsfasMKH6r1asR/aM3IqmfKNUATk6MFUoNDDqUNZZnvEQ2gXzj2kL
 ThFAHRQoOCDMk/5me0Qil5BYYCS7NVWojWcIA/GVUsB90Zc4bYWmSZxs4UijN3cVkqmqT4ddIHK
 tBcOZmJ9sibK9TVjWT5DjKslzyWfB1WjU2v0w42c6pFD5D4OOdrXMHg1EhcEgb+DsObz20hKhTD
 JH+rPF33xMlY6zwl0/fcmgxM4uQv2+yLuyhGKg9OFDdcYtXICXhc3Uk7+Uky79VqwLP9hnoyGll
 Ps0YHrHaeFLkVFErLkBvJtfe8C0+z0LvhmyM8Hwu8OICUSQ1SImwdzggxP/8aIGVSmYCTIxUhmM
 fEgimd1EJZxM9199uNr2fXFFSw7+2jgiOoVcYC18cQieDZU6mkhTkysZeY7YcVrzF49oNuYSONr
 GIDEw65D1QWqcpSwx7HEXOwfROB8RgQgoo2D41EYaE1hrqLob34BEAhOqAVZhAWAfUiOYhMkz3O
 ENspkvf9K2h/6v13cIsrsKnUqjA0C49v0h5EG375HB3awPv3EBQHxCN3ZeDcSWT8qoMJ646n+qC
 aPfIJZXhcERGnaRZVS6MtRl5WezHcyJ71zGeqitfhtptvvt9rfqHlRQ+fLDtqjjy03WFiT05ZGr
 a4zrHL0vlDmpXiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
pcap_regulator), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/pcap-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/pcap-regulator.c b/drivers/regulator/pcap-regulator.c
index 319a88412154..441c9344aef7 100644
--- a/drivers/regulator/pcap-regulator.c
+++ b/drivers/regulator/pcap-regulator.c
@@ -105,7 +105,7 @@ struct pcap_regulator {
 		.lowpwr		= _lowpwr,				\
 	}
 
-static struct pcap_regulator vreg_table[] = {
+static const struct pcap_regulator vreg_table[] = {
 	VREG_INFO(V1,    PCAP_REG_VREG1,   1,  2,  18, 0),
 	VREG_INFO(V2,    PCAP_REG_VREG1,   5,  6,  19, 22),
 	VREG_INFO(V3,    PCAP_REG_VREG1,   7,  8,  20, 23),
@@ -141,7 +141,7 @@ static struct pcap_regulator vreg_table[] = {
 static int pcap_regulator_set_voltage_sel(struct regulator_dev *rdev,
 					  unsigned selector)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 
 	/* the regulator doesn't support voltage switching */
@@ -155,7 +155,7 @@ static int pcap_regulator_set_voltage_sel(struct regulator_dev *rdev,
 
 static int pcap_regulator_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 	u32 tmp;
 
@@ -169,7 +169,7 @@ static int pcap_regulator_get_voltage_sel(struct regulator_dev *rdev)
 
 static int pcap_regulator_enable(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 
 	if (vreg->en == NA)
@@ -180,7 +180,7 @@ static int pcap_regulator_enable(struct regulator_dev *rdev)
 
 static int pcap_regulator_disable(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 
 	if (vreg->en == NA)
@@ -191,7 +191,7 @@ static int pcap_regulator_disable(struct regulator_dev *rdev)
 
 static int pcap_regulator_is_enabled(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 	u32 tmp;
 

-- 
2.43.0


