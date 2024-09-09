Return-Path: <linux-arm-msm+bounces-31327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F9971BB3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F168C1F242EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BED1BA882;
	Mon,  9 Sep 2024 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYMZbZj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A681BA297
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889906; cv=none; b=IL3h86OknE0L1TN5yvNIPuAijPkWq2y6d0+ARj+R3RXWJ9p0mEaQpiuJ+36JSLkCAQOdTloDZSwewH44zeJpoTfQFAhb+rqFCdr28J9p1iV+alZupkBxLZkn18nhDHMx3NZbtyRinJ1VVPIehaNHiAhg7PiYzFLIeDuURihOiBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889906; c=relaxed/simple;
	bh=cimxQ+TX+25hf08Y2OSBWqQRlO/c5kpOqNI/3js1eFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=evDyBdGrjQ68ECANRzh6jXlboD/kAZJUpuPEbpAwVgAnlkOWxk8yAG2i4h9gFGgzdQMFL3GXEzlmKclY1i9wDxcbX6DqOQqbAbD5PPd5aGnrFRZISzq8YDoTQObltu6222RWp2JHniS0uuFtaKx7Yn85dMsfD1lM9Ih/l79ft6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYMZbZj+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d1a00e0d0so8613266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889903; x=1726494703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF9bSlgTrHZXU2jrr9w6XSPWJzUj9rf6ysrOlqPBLlQ=;
        b=NYMZbZj+RsNrKVNlgN547ZBZhmw0jmPPdte76bsbeREEptbn41VNMx+pvGia/gEXvW
         5HLS4mzsd5jfWOF6dvhoJJipqTsrNVPkE3/MXOcIt2UWXMCcRokmYFU5HqU/LqRfHprG
         Ua6xNJqxg9MuChNOvuuTqPHOF55x13uTc5aCxpc9vcMVuFdDYwxPRJHbQDxcDpD/ZYyf
         gfyV/BBrHg7IKiRD+C/TyvoPAJoukOZ+SJH+oTZZI1gYUZx0tNQftoSplUtxMc4BjWSY
         IU5bU/AAK32h1PsQA3dUFVTacvADS6o47M6HNSJu9OC1ffvDdA9iCEbSpIN9g+qdRH1g
         /KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889903; x=1726494703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UF9bSlgTrHZXU2jrr9w6XSPWJzUj9rf6ysrOlqPBLlQ=;
        b=vDwnE7mjQFi19qKGDNM3mJihHoX0G4y3b3uK9cjM5WenD7BPjuPKt9lIcBNh/9TGDe
         /Npn/ev9W30FZUPZqGa6ijxR8sdXaQl0RmA61KAbawUhl3JbSuoP2lZG5YoAJY/da/0c
         DHJAMJi+YmlkBjtPXgIVClXr/YoBGR5CDyRfbr5CV2ImgBm856VZZZSYkFBZo2oRQOO7
         IEtzIo0hax4Aich5bLx+opF+96OjidBMmp7Ut/TeNh78x5+onZRzpfbk0YuTRE+VAbUa
         aCVr8l8ZIKKcizjr7LXeUaEGv2O/CvcDoNpBWqWjMSFlU0WnAdV35k65zfPIl/YmzxaY
         0rIw==
X-Forwarded-Encrypted: i=1; AJvYcCXaOrgm/mJ3amyxtfHeuXHXfUaCJLbeVH8xyG7uh7Gh4Q1OrNlgw6PhC/sr4YSx9DBlhJQ78mqb910FIl3J@vger.kernel.org
X-Gm-Message-State: AOJu0YxWMF09uxRCpVSLfg8mEA4OeZFEUV3Oj5QOrhA6uR/xeIVg3wCc
	5Or1CEdKh65odGe+wcLmdIV6fI36yKn65y6b855VDKbQbJctmXjgDTmJyG1502M=
X-Google-Smtp-Source: AGHT+IGzPvI+dNamtmIacGvq6lHaBkBbNG8nqVfsI23RPlJzpDknyE6uAERdml0EtHCTzcwGG+S0Tw==
X-Received: by 2002:a17:906:4789:b0:a7a:a3ad:6007 with SMTP id a640c23a62f3a-a8a888e03c9mr343909266b.8.1725889902504;
        Mon, 09 Sep 2024 06:51:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:14 +0200
Subject: [PATCH 03/17] regulator: da9063: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-3-8934704a5787@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cimxQ+TX+25hf08Y2OSBWqQRlO/c5kpOqNI/3js1eFk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1aJDym6wmOtLH5Qt5LKDk2N02AojxWKhz4K
 7VClE9YY1mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WgAKCRDBN2bmhouD
 12+rEACRykGfztQAt5gbTMUTMyMn8xzuTgPdLneI0nYl5JLT+jE8VkvDxZUmTJ2z13t8uTC3sS6
 D9bTzkZna1q7VwPTVYPz4XAqUSsY9/vStht6IJ8I2/V4LQgW4XoI9ZT4qF6g2jw8p7GmAd3yLVx
 sCxAXAcXG2wRZLDTJc+4eebjeJt5UiETDtn3kl7N0jPEnMUjtAKtDiyIvOKorktNw3zeNhoS5Qs
 BhmS+DVSniKZ91YA2Pkx1znNJW+jcDa5LZecJdiZN71cq/mLhvY8IocBaxs9fA1KLHOQXsXyEDc
 ZI6qtIb9uSSyuhUtFIlkUiCsmDucfrqqz4HD7fudjO7qs1hcqVPSEHt0oXIIHfJ8FznXbE/gAvl
 vvKdRnxXMS+kdFTdo/PvN8mw7sQZAM7JxrJ/v4/tKxz5sEyPLUfWIN8hMGb0wZbo+2+GioGiXYH
 h97DafFKcVZQaiDlk8Ad8YiT7OrxkuAb/FKyoDLaLyWUMYcjGle3LCDZCz1d0m8lO5qin6wUBHR
 061ZU+JxWdGbU9cVoAJtaTlPfZQPaYxzhrMY8QqQQOLfZ8aAMN81CwMft0d4BDQvdH1r5T8334Z
 L94XDn9LI/rScybEhsQLmyWKku1AtA+JWCuJ/HOsXRm0mLo6PIDyGThxM39q2kJNo6bk1EzZ8Qc
 NsjeJtpj6cfgB5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with device variant description
(struct da9063_dev_model), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9063-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index 82bf321ae06f..4b5f1d6a4b3c 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -715,7 +715,7 @@ static const struct da9063_regulator_info da9063_regulator_info[] = {
 };
 
 /* Link chip model with regulators info table */
-static struct da9063_dev_model regulators_models[] = {
+static const struct da9063_dev_model regulators_models[] = {
 	{
 		.regulator_info = da9063_regulator_info,
 		.n_regulators = ARRAY_SIZE(da9063_regulator_info),

-- 
2.43.0


