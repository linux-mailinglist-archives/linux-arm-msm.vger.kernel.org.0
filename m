Return-Path: <linux-arm-msm+bounces-4756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68480812F88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 12:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D131C21992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4006741217;
	Thu, 14 Dec 2023 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMp040Hn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D348210A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:58:07 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2cc4029dc6eso11925051fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 03:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702555086; x=1703159886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U+x76bsJvKZYYk/aZHwgcx3jETmKUK1eOM6Ci4k3g0=;
        b=IMp040Hn3k4XVzoDt4arx3zfnKkOroV8uD4yDS0N0RgzrOM54e8rpH0xhp7DL9wMRZ
         sggu1S0/MzO6q8CkSNtaG5+4jAHBv2a6O6i8RUy1OeUjXBkwKlq4tD0TDVvdj3WEe39r
         M0Kq35AcIL6tDbOYq58BXeZTnroUxpAt3ME2ZV1YAzdNyXXK7uvrT8Jh/i2KOV2RWyUC
         f+k3F/LO8Gdlc/AzavK1MI/X6bCadSBcfitIRvUir8+ld82HVOz1oGOKq/UobjxjrnYp
         LoshgX2YCY1CYLsC8vujKcxwoMphyt6LcUcIMbyhrjW2W2VABGzhj2/mUrE0RiMg/bA6
         8pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702555086; x=1703159886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1U+x76bsJvKZYYk/aZHwgcx3jETmKUK1eOM6Ci4k3g0=;
        b=Q/1Rly/Gyk1nRzUVvFtN10TFH2242Md3qUFFGmc/kCARXWtBQbud7oajqmLNqhPFGM
         Wp/FCZWGVrdF+mpEgixQGJrDr0NZPIOvPr31aodu3bTgeu3BDzpQRLBgH1zuFqRMAz2y
         e5sLGoPNyq+HK1kJd2PDYa1+0pDGwmMwwZKeOIz9AYlH9fQCt7ofVjhHaCXkgjyqrkI2
         iczMSpesGKy6PR3eZvL3E9WwUf4vCT1wrmj534DrJ6lFRTHNbAz878eRcp9mOuRCE8Ci
         lXwlxJm12MJulbrRFM8tZVcET/Hgn/7xtchh+aHsvjgutGaSMdltg4cltOw9eYrMJr2G
         hGjA==
X-Gm-Message-State: AOJu0Ywjrl7FPNG2KUi5LAqaj4REjCHY58zM8ff0DErb60eNP/h3730E
	iuRAllvASF+rXAkJKbNp5pLmHg==
X-Google-Smtp-Source: AGHT+IFUaZgBx9xAcNdJ1qicIQ3i7Yr/GjR/h3Q0aCoeomMp+qKnlU7ATjJSTRoKt8jGVMutXnryMA==
X-Received: by 2002:a2e:711:0:b0:2cc:1cc5:de6f with SMTP id 17-20020a2e0711000000b002cc1cc5de6fmr3090346ljh.106.1702555085972;
        Thu, 14 Dec 2023 03:58:05 -0800 (PST)
Received: from [172.30.204.158] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002ca0cb6f476sm2037042ljm.60.2023.12.14.03.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:58:05 -0800 (PST)
Message-ID: <f30ba74d-62c9-4f91-929e-a3c6d074deeb@linaro.org>
Date: Thu, 14 Dec 2023 12:58:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Switch pompom to the generic
 edp-panel
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231213163501.1.I8c20f926d15c9ddc12e423e07df1e89db1105d93@changeid>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231213163501.1.I8c20f926d15c9ddc12e423e07df1e89db1105d93@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/14/23 01:35, Douglas Anderson wrote:
> Pompom has several sources for its panel. Let's switch it to the
> generic edp-panel compatible string to account for this.
> 
> This fixes a problem where the panel wouldn't come up on some pompon
> devices after commit fb3f43d50d9b ("drm/panel-edp: Avoid adding
> multiple preferred modes"). Specifically, some models of pompom have a
> 1920x1080 panel which is _very_ different than the 1366x768 panel
> specified in the dts. Before the recent panel-edp fix on Linux things
> kinda/sorta worked because the panel-edp driver would include both the
> hardcoded and probed mode, AKA:
> 
> * #0 1920x1080
>    60.00 1920 1944 1960 2000 1080 1083 1088 1111 133320
>    flags: nhsync, nvsync; type: preferred, driver
> * #1 1366x768
>    60.00 1366 1406 1438 1500 768 773 778 900 81000
>    flags: nhsync, nvsync; type: preferred, driver
> 
> ...and, at least on ChromeOS, the userspace was consistently picking
> the first mode even though both were marked as "preferred". Now that
> the Linux driver is fixed we only get the hardcoded mode. That means
> we end up trying to drive a 1920x1080 panel at 1366x768 and it doesn't
> work so well.
> 
> Let's switch over to the generic panel-edp.
> 
> Fixes: fb3f43d50d9b ("drm/panel-edp: Avoid adding multiple preferred modes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

