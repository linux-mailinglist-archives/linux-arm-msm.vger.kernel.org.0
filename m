Return-Path: <linux-arm-msm+bounces-8352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50EB83CF47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF29286680
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65E5130E3C;
	Thu, 25 Jan 2024 22:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzggMAON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200EE13A27D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706221536; cv=none; b=iihKlQxnIeVgFezxu7Ap8DtvdwIlwfaRtdTWEFMOA+aGMXZWKHOr1f1GuWBQ+5sv8mx2IidGiDv78mdyQicq90Brb8GFufXIQe1r78tnYgmCegxRb6nIiniC+Pcf4KVbBOli77SGqQtJ43s9nbw9JzgzEmomg2M+lbnKaaXkMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706221536; c=relaxed/simple;
	bh=QttQygQdo7pOZKGzvwTMezGVWdOihA0j7oTU2gKSb0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgwc2kUGoLFbbaRq6wVepmUY1p3NbKbQblnTtM5l0Zm1mRJtV0xcAhoh3CSEsYXmJIjJ/kHjYEwb6X563afM6TvKgHoj1HZRAwpUIViVg5YmE3Enui4kHJRHrsy37i7KWLNJQIJyJQoUmQKNHA/Z82MkEPcpEM+pv0ar5EcWgoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzggMAON; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5100c2f7a16so1272546e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706221533; x=1706826333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KiOZjOrG5Dv/gAk5/b+HZFzoBKoxQ5QJzGApcdLCas=;
        b=jzggMAONnKcnQs5EN5O5Jy/+XhG51WD1Qe5EPoU9yE1xKNnXIvSrec7/VQIqefTMwp
         oglv7SM4ooqCLJz6iG2ko361BLSCU17IcFkqvpbd/INZNppl1CQajM5iYoxiAb7YsUnN
         7j5oQwWWKUiXbDga2+d2ZMfQhnBleFL8K/lg/IvBvqUiF/9TmHRvBN1PBiIUEj9NxCRc
         /qHfuwJt+qnGPxU3JnQQHQHL4hWzRrFTOHyQh32El6BfvJuNau4/VlkCgs6/23AysN72
         kQCRv4BIEjgD1mE6BC6jbrKGFmz7hgeYXPWLTx8cGuzJyRMW/RKCQqAijM7WzCTsfLLr
         f2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706221533; x=1706826333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KiOZjOrG5Dv/gAk5/b+HZFzoBKoxQ5QJzGApcdLCas=;
        b=LH1lZqmJUKoQut04cL6KEtD38OJ6X9qBlC50KC7ed594XYJOhmJzpzsxE4zGSLHLnX
         huDDWTk7PJ+v62qf1IETaMrs4tWkhF+8Tguhqp4z3r9pesJgwNZNdZO5Eq8JNnfeGnb8
         g0jPDxP0qN8iXWzF5jDWeqRehrk9aXhuk4vf4RCs/h7EABfgcF1Ep8Yx03QnoVs257mD
         fUiqKN6G5P7pbeeK74HIeYDkXyjYerN8BFMkiZDK0XcLd7B76DUZ9gmMsLI/KqugHTUQ
         h8iwZ5Vc5l6CaurCkV5T0JpfL3wW75I7VAhtLAdcxIYta+2NbKEUO6X9Rtr9suvAO8TN
         6MZg==
X-Gm-Message-State: AOJu0YxFiR2Y3BXu458bfciTVmOOOaxmTkx4nB+LbgnpOpKxU2CuAk/p
	OwNItDgzzhHRQg0vf9pqkr0tA3ttJtW7q95o9mhrYzJkzXkGYVyjPS65SjiYghE=
X-Google-Smtp-Source: AGHT+IHqsh+U8A2CY/6REXUe0YOPeKMZR1c3NhEvX0eKiRnqxaHtd16+71a1kqL0RUXl3lS0fgU3vA==
X-Received: by 2002:ac2:504a:0:b0:510:198e:6ee7 with SMTP id a10-20020ac2504a000000b00510198e6ee7mr121722lfm.18.1706221533341;
        Thu, 25 Jan 2024 14:25:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi28-20020a0565120e9c00b00510220e251csm111794lfb.47.2024.01.25.14.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 14:25:32 -0800 (PST)
Message-ID: <485e5e2a-840d-40f9-a5d3-cfd9bf322e64@linaro.org>
Date: Fri, 26 Jan 2024 00:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: msm8953: Add GPU
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240125-msm8953-gpu-v1-0-f6493a5951f3@z3ntu.xyz>
 <20240125-msm8953-gpu-v1-2-f6493a5951f3@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125-msm8953-gpu-v1-2-f6493a5951f3@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 23:56, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the GPU node for the Adreno 506 found on this family of SoCs. The
> clock speeds are a bit different per SoC variant, SDM450 maxes out at
> 600MHz while MSM8953 (= SDM625) goes up to 650MHz and SDM632 goes up to
> 725MHz.
> 
> To achieve this, create a new sdm450.dtsi to hold the 600MHz OPP and
> use the new dtsi for sdm450-motorola-ali.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Co-developed-by: Luca Weiss <luca@z3ntu.xyz>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm64/boot/dts/qcom/msm8953.dtsi            | 115 +++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts |   2 +-
>   arch/arm64/boot/dts/qcom/sdm450.dtsi             |  14 +++
>   arch/arm64/boot/dts/qcom/sdm632.dtsi             |   8 ++
>   4 files changed, 138 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


