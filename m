Return-Path: <linux-arm-msm+bounces-17029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C789F24D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 14:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A68FAB2484F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 12:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0E37C08F;
	Wed, 10 Apr 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2nAbddA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E52BAEC
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752313; cv=none; b=pC0tAe9M1L0hhIny9QCIK5Qt7gJ/MamJs6Xv9OZ7YUZncIFxiWPixP3gHb/BjE307peaBUYWN2/Y1KxAxRXbR6+TufHFGCwp5hs429D/awWl2mXySXIz4giOlc1sWULMcNRxUqZWJOSr0/ToOeKlTQ7fpCGEKzGwIiJuhW36vAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752313; c=relaxed/simple;
	bh=zZX4qRuSQT4Ixzjk9d+eFBFt6tNhfr6P6XBUzfTBakI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGggirAiUqsF17Ln8aPpv8tHuFn6f0i2T+siYgWVJreGm/yCgq0llsnYvptEhPPjhjjb4bAjDbCSsIXbqL8Zbace+txLe/eKzZRdEfib6f0lVmSXIE9RVuFSvo5/Y4zDgeisa1zb54H8XUhJ6tHmjlobmA0tZYQ5vecNdFwP/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2nAbddA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516c403c2e4so5785738e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712752311; x=1713357111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RQ5efwtF91P/NXm4zP+Bn3Bw1Shjn+65DFZgweTfHo=;
        b=k2nAbddAqlSj4ayOjUK6eeQoU5iV0RcN+LQx/X08d30nKoebg1WdK1t+ENbnL1rIDf
         00Qru8fzi1ERw9ry4/ZHG637m9DZA+xfbgVAUzaU7/ZSjoUxaizvnndih/JTVJi69pdF
         naGKHMJyyCAV2BrTWkizLLzV1F2Mljrx84gX3/cZG0JWkUxoOLO21Ry8hX6IJUPVws3/
         oPM5bKbdb/3nFlegTqqqJg2lMN9l5CjowNrvj1FJ/lr5rcyA76T498tg+oEQuUDimc9e
         sxjDsa+P8carCzxgJHv/Zfi2XC5evYGJvVqjs4Uhj22KlibC6VOeZBTTHrQhhZQ4lI+w
         UkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752311; x=1713357111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RQ5efwtF91P/NXm4zP+Bn3Bw1Shjn+65DFZgweTfHo=;
        b=QzDB44opmMa5N36giab8eCJKpCmEJqgicB/a6Zot1O/OGdlTMk3Cm22ryqQmJfSF87
         XltjLS+9VedCkExC9D2Bn/3k88S7y0HXpNlcXc9QCWcsbMswJ+gw2NdwgFWvEOVD7Nmi
         OLqnC02cvZor0cYq4en+DsdBDZn9/1Nj7i38YyTQGJxw1EHWeWHl9C5QKdYXUA8u9RPi
         mPnDQYvcJArjN+rXNy0Ze8mmOIZfv2T6tBP24N9hJL/XcqpkIMCukpYS298LmrSwqYu3
         UuuA2RxWe2ZMC4RIKVsd+GMv/dKwbooimMdCbe3w2wprPhzFeUqeDL0BZHKco4hYxYCy
         yOGg==
X-Gm-Message-State: AOJu0YwcQrsmCEVSI66MPF/59ff92N9Pzk/6NTdKtI+OxiUd1T8Vm8U2
	vybLZa/b6LJl4EK4joG0H+lGVG/65kFCeEYzrQtzjDU9nUrQNx1+030Fou+K0RI=
X-Google-Smtp-Source: AGHT+IGUBEm3kV7zksxLS/PxGZXtv2FBFfpwUJ+HG5kWCLXfREoERBZay5F1WVN0+sfAAXr9iBMlTQ==
X-Received: by 2002:ac2:5471:0:b0:516:c3b2:d65c with SMTP id e17-20020ac25471000000b00516c3b2d65cmr1834705lfn.7.1712752310540;
        Wed, 10 Apr 2024 05:31:50 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t16-20020a192d50000000b005114a0c56afsm1835819lft.279.2024.04.10.05.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:31:50 -0700 (PDT)
Message-ID: <41cd0ac3-bef8-4a0f-8ee0-beb2378a74ef@linaro.org>
Date: Wed, 10 Apr 2024 14:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: sc8180x: correct dispcc clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
 <20240401-typec-fix-sm8250-v3-2-604dce3ad103@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240401-typec-fix-sm8250-v3-2-604dce3ad103@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/1/24 22:33, Dmitry Baryshkov wrote:
> Correct the clocks being used by the display clock controller on the
> SC8180X platform (to match the schema):
> - Drop the sleep clock
> - Add DSI clocks
> - Reorder eDP / DP clocks
> 
> This changes the order of clocks, however it should be noted that the
> clock list was neither correct nor followed the schema beforehand.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

