Return-Path: <linux-arm-msm+bounces-21578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E38FB0CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24711F227FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F0D145348;
	Tue,  4 Jun 2024 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pck8xz7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6D14533F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717499653; cv=none; b=JNbCkJHep7tC/6lp2HeJsb5Bia6HiL16QBj0bGofGOlhmm9Ibf/6DV+XYHXN3ZjRFCGmw3+WdBYxmvmPn8BJUjUKOzdccTb3er9ZC8gr6RxnZ8F5K1/Pdcve85W4ZJO/Px/m+YD2MfDF45IwfVGSU3S2yO9DZDFV/iajpF4sMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717499653; c=relaxed/simple;
	bh=gkoEaXTyzcTGwsF2z95ESHnjbvRX6cwJPCJEJHD0kz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5TnaIZebONdgw6ZifhxHTx+W7IxmU5cHlEtvXHPdf1/teRpVtKQj52/LFmO0ZF52JwtE7xMp6eBZbBwl6ixRDn+menrWJ4FWpKgpvOu80EwqIWZRBVtNVG5V1kNcjqq2KOAg0djEOmWl5jHlwRQMFv+017RewHkOY0FTGN7elE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pck8xz7a; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa48f505dfso5447940276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717499650; x=1718104450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4BJtPQ73qcfI2sO7ETwV4VEq/ZHWblB62uvfMkAtXA=;
        b=pck8xz7aEQCZrXxZBnTqIUQJ/hy5CAtsO/YnI4+QTIMDaLZ/iomeFmDWIMuiuEOv2H
         cmI95gO6IS3BM1C3jdbsOzHg2NAmdNpWtKvP4DboE4PEWT2gHw3cRN2xAQ0zW3UId6HG
         qIO3XkzCY38Tqn1nzNDZ0bdyChnOHNXZCqPZqZ1pJkKBbxCtoL4LS2Z5ifWOEboVVBMG
         onQtMeGJXMeS7JF30GvwDra7+5K4S0xx3pnfd+liP8/0mZdgZTdNnX0dCNewHoi5UP0w
         SKY8xL5FCSOcmf734LZfR0qop/RzoYIA4TFibRAQm02HqW5U6hJQBFkMNobVG1rMjL31
         s91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717499650; x=1718104450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4BJtPQ73qcfI2sO7ETwV4VEq/ZHWblB62uvfMkAtXA=;
        b=hk60st+FBrbiud5471RMoheNvFC2TZxQpkh7vFhOBkwRM/FQxHTblGPx+Vqna/bmvc
         hXNwpFs2XA1V9YSQZinu8lfbeZlmzo3uMI8EuHHjSfmK+tJEdO9zbDffX3NQVUTQBts6
         C+Uyp1x7sBFfJL9O/aAyJ6DHjTCZTzyJ8h+1UGVE4PIW+Ea8GwFcJWgHlBKI5AFpTtEp
         axtlZNLl0z/cDRXatNm7fFPlI7x6SWh6KIKOTr/FWgKG1RRJFYomp9Buq574VDNTWVYY
         G10o1c15xkRo2UzZn+883KF9H6g7v28G8Eadr7sS9qgMbGmkieBrEavQe1TtCJ5Y1LbF
         FaLw==
X-Forwarded-Encrypted: i=1; AJvYcCVdkvqCiBgQcJYNZiS1zwYSURsVS0BOmwzm15cpbk/l5Hzbx9uIkb7gG3VPzy5bG1qPlR3R4yn9fXQ1rnugwT7aKqty3TOEvKgxI5IHKw==
X-Gm-Message-State: AOJu0Yzlt7NJpqq+XnHrD6g8xHk6sYSEqOPiOvqgh9d8KSsi6tw9SY3r
	S0ddsCMIw7XBp79aPVmYOTvdTFcxim4O+VDDoeEndIBj5bkmEYFHqgssuj5J8TbrpkL4NVyu1c+
	dkkNzfHc+P8AwjcMWJnHih8evvz0zndH5hY9Qyg==
X-Google-Smtp-Source: AGHT+IGbblsFi//5mNdWKH76B/L88CqYx2joBG7nqbVMyDK7axGNMhKFIZaU+2AbW4M8ccMJuHxy87Azife0n7bvlpg=
X-Received: by 2002:a25:acdc:0:b0:dee:998b:1459 with SMTP id
 3f1490d57ef6-dfa73c3dbc1mr11889385276.39.1717499650330; Tue, 04 Jun 2024
 04:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523120337.9530-1-quic_nainmeht@quicinc.com> <20240523120337.9530-2-quic_nainmeht@quicinc.com>
In-Reply-To: <20240523120337.9530-2-quic_nainmeht@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Jun 2024 13:13:34 +0200
Message-ID: <CAPDyKFpAtvQyfKJ6-xWEZhv259eAzuS+nmA9tcFDf_h728s1Qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: sdhci-msm: Document the SDX75 compatible
To: Naina Mehta <quic_nainmeht@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, bhupesh.sharma@linaro.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2024 at 14:04, Naina Mehta <quic_nainmeht@quicinc.com> wrote:
>
> Document the compatible for SDHCI on SDX75 SoC.
>
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index c24c537f62b1..11979b026d21 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -51,6 +51,7 @@ properties:
>                - qcom,sdm845-sdhci
>                - qcom,sdx55-sdhci
>                - qcom,sdx65-sdhci
> +              - qcom,sdx75-sdhci
>                - qcom,sm6115-sdhci
>                - qcom,sm6125-sdhci
>                - qcom,sm6350-sdhci
> --
> 2.17.1
>

