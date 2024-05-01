Return-Path: <linux-arm-msm+bounces-19095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3D8B91E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 01:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3891B1F210D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 23:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AA616191A;
	Wed,  1 May 2024 23:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtyJnr+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265D1304A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 23:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714604680; cv=none; b=jNaAkeuEks4+MoYRPhPMZiGe6BcYAImE2WkEtuJ27Eg/P+HSQ/FNpCJZZhj/gQ3s/N6mm/C0aV4nnhvMRfohM6AJrs0c/J1mrtq9lQKZHJ8bZrMVfkIa5n1vfawS0tPsg+BqTaIXINv270U1ow/G4uvR+4z4iwE72F7JkGEtNK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714604680; c=relaxed/simple;
	bh=czfbW3eQ2FeSXvjVG7KevGs1zXV7jhvRpXXA8pt159g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwDw15fVllsma3kvzGKwxcwRlePYlIfIViA3HjevFWHiiinrSytEDS03OM9s94TZuPj5NaNoFMkPeTYvnWMSuFif7anSVfvHHF9MNXgpiK5ijPUiA3oxlcRoyIVHSz+/+5z2Htfz8g7jPCStK55vsbvFT1eIDZA15/jFKEV7kOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtyJnr+5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34da35cd01cso1642682f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 16:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714604677; x=1715209477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MZf7IzxWqjKAXWgojjM+rZhudRNMkvEdO3ZPVkcbHfk=;
        b=OtyJnr+5FQqVA+BelL/URddK4eLxbeCJeFPfv2y2pWwutCQJpgybksno3BXAPpPBvW
         A9811tanrKP6TC50oV/5YpIG6YvMHTyI/e0f6Rxag2UaLQmbKcsQr7yhzi5cUonwQP3z
         LiPlXM/tGkvd6fDg6jap1UfjH7SAeVBBabYYkZCsaaYnsEfLwDtKA75r1wmnNzNvQSrT
         qKXVpFnzCCs5UNdw5TfzlOmjTN4eaZFrQsFqljoRiYCKO8QvyLwJlYvPXrQydxwo+6H+
         jtQqKHqVVFNcP4La128TMUCAOaKFzY/GjUeo+mRYGq8l95WWwxzEfV/T73jGq2/IgoxL
         gjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714604677; x=1715209477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZf7IzxWqjKAXWgojjM+rZhudRNMkvEdO3ZPVkcbHfk=;
        b=JyCL7kCPthOolFR2DMiW20Rjz/Wo5aFWcUkiRpyBTiN9OobxIVFWbrROJPWqFXgJfD
         BCoNhypcldcMSXeZxkfbyTv+0X+YJu9ki0KJGzgkijZfaHCqMB1BJfuqOJ0Z7DpJ4kmr
         YcsO0qjWe4dVxqQzbrVWSf7cAF6NqZc6AAVlYMY1/zgyCRG3a9Ohafcz8lwqb9HU9snd
         oWPT6Pdtsm37MQPySku6b8xNwC9sYIei3VwzUlD+TP5tXKNQM9lmzDSoXPlDcpbA1/Zx
         Q6acMbdMMtWQpGeEUVxjT8OAJ4+B0K+W/279mxuzQLV7pj3kqShcpGxMrW+JckF64vgx
         wVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuuxv6U3uO1i6/RTAx+UHWNnizVN8OHt0iugMf9DhNBJ4cRDU7JmWWnauUkngQl7m5EdUDpuzSDmRXuqFcPhyvo1o0tp0YPlVJGxmGyg==
X-Gm-Message-State: AOJu0YxmhDt/OwQmBndwurqlIaXXRgqap1r3a6d3bT/NFM6qK6Z2Ygrg
	snHKGrJ0cTJ0F1m3XKG+y8Fj+0/Z7fiu292pMyC0Qz7kCy8fG4G/BLHuvoq5cp4=
X-Google-Smtp-Source: AGHT+IF6sKRBezo0n8XAqHLoLo/F3pJARzbazZWeweqP34YGGYMTfBsjmt+wT/0x+cFJ2ANXeFX5yw==
X-Received: by 2002:a5d:4538:0:b0:34d:a9ff:7ebf with SMTP id j24-20020a5d4538000000b0034da9ff7ebfmr3017840wra.22.1714604677236;
        Wed, 01 May 2024 16:04:37 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id be11-20020a1709070a4b00b00a5588a9fe66sm15257372ejc.86.2024.05.01.16.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 16:04:36 -0700 (PDT)
Message-ID: <1e7f2dc7-3f28-4b68-bdf2-72ce54df1cad@linaro.org>
Date: Thu, 2 May 2024 01:04:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] arm64: dts: qcom: sc8180x: add power-domain to UFS
 PHY
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>, David Wronek
 <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>,
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
 <20240501-qcom-phy-fixes-v1-5-f1fd15c33fb3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240501-qcom-phy-fixes-v1-5-f1fd15c33fb3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1.05.2024 6:19 PM, Dmitry Baryshkov wrote:
> The UFS PHY is powered on via the UFS_PHY_GDSC power domain. Add
> corresponding power-domain the the PHY node.
> 
> Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

however

this screams for a follow-up fix to use UFS_CARD(_2)_GDSC on respective hosts

Konrad

