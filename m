Return-Path: <linux-arm-msm+bounces-14042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B314C87B1C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 20:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A2441F21FE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 19:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86A559165;
	Wed, 13 Mar 2024 19:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qxworgdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C74D5A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357645; cv=none; b=kSEF7iURTn3EGSHVBNghh9Isiporyaabmu7+nkas8uo1vBjL3y1v982+pYSapA2MnifSk2EyVRxYy7DqKNnMeiIb0bVPIv57bpiXa0Ag8Exoz3u7XprgeBgIWVMkXXYQzWyEMWnBcsCPsvy0oWJa9iC2/AyZfWQy4rAyXsUU4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357645; c=relaxed/simple;
	bh=VC3FYxAJ7LoxbZlZBeN1DYkzslCxNHfnh7tRxUYmCO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYxJlh8a6ef6i0TsPOKYs3BW8rW/oUDaJZ45Op4s7NPBwd6Pi3keuFHLcaQD5/4Hk9RJHa7LsnLKGpCtfarYZ2WO7WhRiUVhX3Nzf6/zv0+EOjyt/96/dedn9z56C2WPosglWUo4wJbHhU5uUqQj83Ys4j+E4B5vTXT92HImols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qxworgdJ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso123213276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710357642; x=1710962442; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OMo4BjQfv07Q0PzE5HGh8mM1dLTyhXyrou/joPFvVAU=;
        b=qxworgdJ012HU18lqJoxv83RevI6FEJ/u9+a/X/A0hUulXEepSa5GjUonLxeTv2I6I
         135KFVR2KH0csdXWu7/gFVNzDplMEgLmB9fEhSLBa0UkbSYoNW3Tzx3mtbKEiLTcZ4Hp
         uK0M8lAhCnv6C0nRmnn7yPEw4mP8xYe5bQ9eAZ3As0KbvC78UDDRhmBvAQPKZ4BPnGYA
         /SpbP8nqGzd1bxbvoyzwiY3I7HU0DgWlJs0TjuaMnYnq1RUmAx+tgqaGB5q75fPiro3e
         uF4SqmwBjMe6++RKMJm6jfSNAKmMjs/xgQGZjyBp3njNnqpP5RAqMIqzruAo3sEd4pFZ
         ekHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710357642; x=1710962442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMo4BjQfv07Q0PzE5HGh8mM1dLTyhXyrou/joPFvVAU=;
        b=dAsU+GfSO/5q4PgCHB8Em1JZVSH0joxuqB6X3pGJpW6jy9mgkr1ASPUPoYFQ/TRKBA
         eYjhC+I3TiOU75A4cd/3z96oxLUCaEoGtrELWQxN39d0ot7CXd5os1bZazIu+jgkAMyv
         MdR6wdKZMOhEicwpUv4WDrttfQoTGJCP7f7yq3vtiDzVrOpoqXLW+LRGHqk4O09AEbk5
         dVxZ6MxiQnUKRT59Arn6K211KKaZ7PuH66jLHk6HoGEA9Jip4+bPyxNSLkFAYLBzrL/6
         bp2B0Jq8IkyJ0oIztOmI2sA0VmwBaI1vSbBlSF78Pq/jyEZT75LEaCaG6ayLxjowHs00
         sTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6cXoHuEWKoZpfx8fMgk3zAUKBnPjwTKSREkU/TBHFD49K/Iv+s9HRyT/xECgrTrtk9TdXu5+LMLOKAjBkJ4uxJXH1ZhuJyLVYStyTIw==
X-Gm-Message-State: AOJu0YzylQPDwGIC5zQq7605LlAI5WgIzIf4WAmA17twRW9nqO9filv6
	pRJekMrCPOpciF0Tnm3DoWlilRAJi1u1fE8NfnWFtjK/nO+z87Yc5v4fuA52A/PM/bItrodkBPa
	PAfXFVwWPnCQ6dcMTnzfosLcZvFT/cWr+FjaVhA==
X-Google-Smtp-Source: AGHT+IF+pCz+zOs8ZUIs+gSDAT4ZOTitMDi1f/rT/9CPC1qIJVCwncoBoAEkgjvNR2PPBb39YCB5C47IhmON01t+UHE=
X-Received: by 2002:a5b:bc2:0:b0:dcd:59e4:620c with SMTP id
 c2-20020a5b0bc2000000b00dcd59e4620cmr2174398ybr.49.1710357642225; Wed, 13 Mar
 2024 12:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-videocc-sm8150-dt-node-v1-0-ae8ec3c822c2@quicinc.com> <20240313-videocc-sm8150-dt-node-v1-1-ae8ec3c822c2@quicinc.com>
In-Reply-To: <20240313-videocc-sm8150-dt-node-v1-1-ae8ec3c822c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 21:20:35 +0200
Message-ID: <CAA8EJpo63oRA07QNCdzJdHW_hJJWK6aj-LCpp-XwmPJYf0twZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Update SM8150 videocc bindings
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Mar 2024 at 13:11, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> Update the videocc device tree bindings for sm8150 to align with the
> latest convention.

But why? Bindings already exist. There is nothing wrong with them. And
sm8150 platform in general uses name-based lookup.

>
> Fixes: 35d26e9292e2 ("dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock bindings")

It is not a fix, there is no bug that this commit is fixing.

> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
>  Documentation/devicetree/bindings/clock/qcom,videocc.yaml        | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index bad8f019a8d3..e00fdc8ceaa4 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - qcom,sm8450-videocc
>        - qcom,sm8550-videocc
> +      - qcom,sm8150-videocc
>
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 6999e36ace1b..28d134ad9517 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -17,7 +17,6 @@ description: |
>      include/dt-bindings/clock/qcom,videocc-sc7180.h
>      include/dt-bindings/clock/qcom,videocc-sc7280.h
>      include/dt-bindings/clock/qcom,videocc-sdm845.h
> -    include/dt-bindings/clock/qcom,videocc-sm8150.h
>      include/dt-bindings/clock/qcom,videocc-sm8250.h
>
>  properties:
> @@ -26,7 +25,6 @@ properties:
>        - qcom,sc7180-videocc
>        - qcom,sc7280-videocc
>        - qcom,sdm845-videocc
> -      - qcom,sm8150-videocc
>        - qcom,sm8250-videocc
>
>    clocks:
> @@ -75,7 +73,6 @@ allOf:
>            enum:
>              - qcom,sc7180-videocc
>              - qcom,sdm845-videocc
> -            - qcom,sm8150-videocc
>      then:
>        properties:
>          clocks:
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

