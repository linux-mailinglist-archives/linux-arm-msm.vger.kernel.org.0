Return-Path: <linux-arm-msm+bounces-39910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7699E07F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 835D81679CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D6520B7E6;
	Mon,  2 Dec 2024 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRx6VuxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916620A5EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153089; cv=none; b=XSJhK1Z13tHRXf0ojUD1RwtRCt/kjRFd3KUWBCqSvHT5H+sScNoVbp179gpGEmP/XwYJhiJIfP+lAbz8KXkjs9amWFx7l+iEikpKEawMIdG0oYkm/jNUh/iXhZ1LlJjh0po0XARUVVYtA1wFCTkiPpPeXZMs9LfO+AKiMnq49C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153089; c=relaxed/simple;
	bh=goFeMCUVRbDjipThdghVVJLskLf8H473+GNXYnXXrDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABVj9opwdjRV2wTmutdVNXxWRuLGMtaWicfZr+QUuiACI3aDInSJ0IxHwvVtQJuHIaMUnuqjS9SYUrlUTny/seJeZ77IG3+h9iQZQ+5nS7AbBTLDlHGuTdu2O6WrZBgKkIsOP4swN39e9ToDsr2mxcgmzdNSCOFY3S5r2C8o6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRx6VuxM; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3985aabf43so2631158276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153086; x=1733757886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05ZXtxtYDYApb+lIzc95yV2LA74LDricN9fUjzTVsRg=;
        b=uRx6VuxMhqjU5kzREUBVrmyWJSJ7t6VMUn63IrxrbKfo9zn62de77W8cHQYI1pZNTb
         +Zf2y+HArTa8UNB7E0w4Sv93LqC/jOfvYSZvfhPTmZs1Hm/pEXeobFAd+FCNtGULtsCC
         vRGSH43uofb1IDl+y0iRlmNSWBsOSa+b10ouag4h2ikswTJEuh+DIixdHGtOUEwl7JCn
         a9t7QKqJ+YDq1wEn2s9ViNVOGoA5L1waoMBg5zdknUGpgn4AyuH3L5gxmTChIvDQNjX9
         npjRvDIQcRyjJ88CRS9jyg/86RMeV+KQzJCzexa74VLy3Xq2ye1HPCUwi16MzhDQ6Gqd
         Uflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153087; x=1733757887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05ZXtxtYDYApb+lIzc95yV2LA74LDricN9fUjzTVsRg=;
        b=MXycCqYkoLNHO1SKsl9XF1T/zbdCkEOjG6jsa2WE3tsYvF4RZsjEuniwUNkjyWN9rf
         qxZzD4bYTBXbsSY0VrlQPN3FBOhbYMAD4YPTBS6hmtTGjdpLcyzCqcAvV/oTbkyosaKm
         22PY9GxFX6BGeVgWqqE8LXvm8/sPEFZmZZ4BNSiQa+7q74QfanHFNamInfQA6rL3t9Me
         RaGLt59uimsrIqF79DnO4rNpvuoBMTM3mVDPk9BUraaWFOBUFcm7V4CFvTpmF5T5SxXN
         bLM1/0xrwq8xMRJ6CEbZMoOkikuZdD8nkXuJDfmUdOUh/6nV+956M7YhvFO9O20P5SiI
         zHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWslt+osd3zJ7tnSCHtNNEQrnY7CM9yoVjZIBLje1Pfu4LOxeQiso8ZIBXPhpCOm4+liE2GZxE2sryssv8o@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNqq2bvRUN7PX8SANdMNVXBEkDzLKHIRHebUKAAZDYo2hJc9p
	87g0mHk+m5Ds1g/+4jCJ8eXYmXkKHTYBVyvLnG4cpnDkvIBtlVJZeRbYGkvhZRWIKoqztWjgw4Y
	gvXNrpUJ3vWZANbKv/m11RjQcCev5En24TTRBbg==
X-Gm-Gg: ASbGnct9apxIrdszuC3oj9iS2mYYGD+4JXno61e9K0wrIAtXwzDkOp5fFpUvheukBAq
	wdUVbyLb5/XqKoMz7jkP/J5pSIOThqP+v
X-Google-Smtp-Source: AGHT+IG1/7GNikn+o7qWaeU6OlA3SHIeQqG6VzX6iFXwmrBOhF0bD/LXd61skcVAWua1i/pv/Z75jusfAxofKt3ImP8=
X-Received: by 2002:a05:6902:2e0e:b0:e39:9b9f:7f87 with SMTP id
 3f1490d57ef6-e399b9f830cmr6954354276.29.1733153086437; Mon, 02 Dec 2024
 07:24:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:24:10 +0100
Message-ID: <CAPDyKFqiar=EKBHG=PHimjNcdLKsVdx+BRZReEJzHr8_qoayeg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop Bhupesh Sharma from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bhupesh Sharma <bhupesh.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Nov 2024 at 10:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> For more than a year all emails to Bhupesh Sharma's Linaro emails bounce
> and there were no updates to mailmap.  No reviews from Bhupesh, either,
> so change the maintainer to Bjorn and Konrad (Qualcomm SoC maintainers).
>
> Cc: Bhupesh Sharma <bhupesh.linux@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I have queued this up via my mmc tree for next. If anyone has
objections to that and wants to funnel this via another tree, please
let me know!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml         | 3 ++-
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml           | 3 ++-
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml         | 3 ++-
>  .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index c09be97434ac..62310add2e44 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm crypto engine driver
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    This document defines the binding for the QCE crypto
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 8b393e26e025..eed9063e9bb3 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm SDHCI controller (sdhci-msm)
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    Secure Digital Host Controller Interface (SDHCI) present on
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 0bcd593a7bd0..f117471fb06f 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm Ethernet ETHQOS device
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    dwmmac based Qualcomm ethernet devices which support Gigabit
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> index 758adb06c8dd..059cb87b4d6c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm SM6115 Peripheral Authentication Service
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    Qualcomm SM6115 SoC Peripheral Authentication Service loads and boots
> --
> 2.43.0
>
>

