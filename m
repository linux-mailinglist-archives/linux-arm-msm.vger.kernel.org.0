Return-Path: <linux-arm-msm+bounces-7023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E7882AE90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 13:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC381C23004
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 12:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD0B15AC4;
	Thu, 11 Jan 2024 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mduOEd5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362615E8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd17a979bcso59027031fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 04:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704975571; x=1705580371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sB0RisVxzG4fCy/lSv8Ys0Km85GWJSkQtSWNZJfVNYQ=;
        b=mduOEd5ztWZKxwvltBRjkkcOj2taQea9CAYhsW2kGNELDFgSBwUQFvQOlHviwANp4Z
         6ujfH/wtdcO3fDdM3F91d3G4fxOKSm9tpzRqN31YBnKn2zMzyZ5k43xLa7q5foykcRIU
         hwlUm84KqH5cY03VlGYMe0TetRIcvfSrQheZbsxI/iB6A5W2DItkKhbVPjHToaqo/UUq
         z3VdNGlaOE70GtA/sE7+sjDMyxDXgOc9eEONUhx03zJua0jCeFzt/96QccPUC4P9XRpP
         lmF4C+6nSPCS1TVjWFvK85OzOdWd92ccJuKPDanwaY1ne5KEbeYqF5Pcwf0RqpIPgwih
         B45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704975571; x=1705580371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sB0RisVxzG4fCy/lSv8Ys0Km85GWJSkQtSWNZJfVNYQ=;
        b=ebIgp/hed7HH+bmU2YZm2o8lH76+nCqvIuXirC93FcQl9Z0dcuEf/xMarhcMm4Skc6
         WfEs771WajWaYTVUKCEuakDNx0odAquxAs9cRZNNuGzUyk46oGWI75rdvXG68Oemr051
         jOt6cw2ncnIdsOAKNwx20GkRhGuwSTKnjdvEEt1TTSbCOTcnUxsKiulHhdFxJfk0GPMm
         EgzdDIc62I/lMvJyP1XMDdRRpmOiXTveINf6kMuEBVyE1OpfCJW/Np4Df0e9m/mJcR/m
         HumT2K+iQDTQa0wvnsMvm2aLqU7J/bq/SUph81c9KmNT/OU/ohVvfRPGI7T+UUyzWHqK
         +zHg==
X-Gm-Message-State: AOJu0YwODw4474PlCVYq/Im/IhCKoBlCBzJWLJPYKfJR9ONFQEUlb0Ir
	QjMvkfBkStB5/vefyP2JV+XcposDq9v2aQ==
X-Google-Smtp-Source: AGHT+IGw98QB8JspIZaFT8NnyeapJqJS+aKffDsBw668qr0QiPfv6qoV3Q3lubRojSpsGwQ8+nazXA==
X-Received: by 2002:a2e:94c3:0:b0:2cd:45dd:73c3 with SMTP id r3-20020a2e94c3000000b002cd45dd73c3mr181748ljh.78.1704975570776;
        Thu, 11 Jan 2024 04:19:30 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n25-20020a2e7219000000b002cc83210f65sm126181ljc.89.2024.01.11.04.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 04:19:30 -0800 (PST)
Message-ID: <b64a5650-6152-4a66-81c1-22df2abfe359@linaro.org>
Date: Thu, 11 Jan 2024 13:19:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq6018: add LDOA2 regulator
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Robert Marko <robimarko@gmail.com>
References: <20240110151040.2155938-1-amadeus@jmu.edu.cn>
 <20240110151040.2155938-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110151040.2155938-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/24 16:10, Chukun Pan wrote:
> Add LDOA2 regulator of MP5496 to support SDCC voltage scaling.
> 
> Suggested-by: Robert Marko <robimarko@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 5e1277fea725..2f892d3bbbc6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -174,6 +174,12 @@ ipq6018_s2: s2 {
>   						regulator-max-microvolt = <1062500>;
>   						regulator-always-on;
>   					};
> +
> +					ipq6018_l2: l2 {
> +						regulator-min-microvolt = <1800000>;
> +						regulator-max-microvolt = <3300000>;
> +						regulator-always-on;

Why is is always-on?

Konrad

