Return-Path: <linux-arm-msm+bounces-6253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F21821FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 17:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE615283AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 16:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980EA154BD;
	Tue,  2 Jan 2024 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoCxToQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC2315488
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5e778e484dbso82101247b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 08:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704214654; x=1704819454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VVh7m29Ky9WukziqxPzevKkxIvdB0PDoPjGRWVMZV14=;
        b=GoCxToQuXJ99CCfr5iMWA63EfTF0f/Yimi0ufjs5iv0aNPM+SOh68DIHyKv3N6r9oB
         DD3OuGiufNXVYbFiaQ1xfyaqG4OpssyYv66cWnLwjKu83WHE/gAmRxp+HkORBOAGJCWx
         JTkm5CpVfYlNjm3COcY7U3xJi/5md8Qwqv9VIa3i8QBgFSZRKh+pUtGGe9f2E1bKQJsY
         uVcTGXsAMzVN4ihifHLHWv0fotUw9v9zwCKVl3Db5I5nX2BCj43O8u/LQMp6lDa+25mo
         L9fAKUXezj7kBFmPxL92XOW3v6Te+vXKAx2n9asNlRIY+GmtMAYG3kKJthQnVdUEKsxP
         pTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214654; x=1704819454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVh7m29Ky9WukziqxPzevKkxIvdB0PDoPjGRWVMZV14=;
        b=q9h9+1tW9xSMglTZAmSPFgQ9SSJQHBUPw/Knsj6HN+sAd9KmjKYJ4TeA1WLxRLEwQ/
         beGm5hFyiW3UJo3u9o5X9HgdITHtnkpbyXojQSoiPf1v1LvW5SuqUymwG4o1JIlmLIyd
         Z5A9/251MeApwPwllhvNo3ZFu8RM70izSeDyfOtvZ4qcAhX4Lprk6zhaHCPGMy24GAyS
         b1AYjnoEQPLmGO6lwB6gUACq9FCQXyk+l7PzK2n5yNZnieEVmkKKPq+leuTprHGvslRL
         hsyfSfupLJyDS7gK0ysPsdwZQmWFx9TpqkoERaMTXsGIzxtUBsPUDkZSCXNIN9lOilqs
         GY9Q==
X-Gm-Message-State: AOJu0YzWMUl7S+lfYCPH7rulMANvOYAvaJ+Y9+lBqfVNPjIT+MvfH/B4
	lakAbUhGSqbdkXTZ/Zq5o7GTfRSkLi5NZQrXKOJG6roGSMK01g==
X-Google-Smtp-Source: AGHT+IG3cKejQU1lw6kB8D1slP13fhxQrPArTQrPYYY9m76Qm4R78xwRcBK6XSjxNJfA9eOGogYLST+VoA5oeAJFa5c=
X-Received: by 2002:a81:b718:0:b0:5eb:bfac:69c with SMTP id
 v24-20020a81b718000000b005ebbfac069cmr8701530ywh.45.1704214654000; Tue, 02
 Jan 2024 08:57:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Jan 2024 17:56:58 +0100
Message-ID: <CAPDyKFo3kpTrKctYX0oZeCxSeBF1ehLmEtFoE4HQfvG0wnEh=w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: document dedicated
 IPQ4019 and IPQ8074
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 09:58, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add dedicated compatibles for the Qualcomm IPQ4019 and IPQ8074 SoCs,
> because usage of generic qcom,sdhci-msm-v4 compatible alone is
> deprecated.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 86fae733d9a0..c24c537f62b1 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -22,6 +22,8 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8084-sdhci
> +              - qcom,ipq4019-sdhci
> +              - qcom,ipq8074-sdhci
>                - qcom,msm8226-sdhci
>                - qcom,msm8953-sdhci
>                - qcom,msm8974-sdhci
> --
> 2.34.1
>

