Return-Path: <linux-arm-msm+bounces-35891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2599B0641
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 16:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 474661F2328A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F14171E6E;
	Fri, 25 Oct 2024 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvGd3VBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9267F158D93
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867938; cv=none; b=ue1v3lqSlYG1/SxX6lkPvAeuTzupJYyubpenFhEPPOHZ0TxFT32HxYNJEZkQbB49w3exX2uBbwLrjISYLGWEJQMjx61Bdi6Dse8zaHq2GAx3vjiBGIg420xg5it3HIxfo/pnmj8XdlQPDm9mAVjE5TlPrM5wo6FWizevtPKZfh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867938; c=relaxed/simple;
	bh=BIJuuavrMOlGZTXnRZtJFIBi6jsUUmE/2bFNi5XpxeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s25zkEZ8F4aM/gV/nEVwfF+3dV82ZAhyzcD/Y/ST5UUiBCDRZ9kHI80Jbh23mkBgmZsQW19O9+JU7lgOs1AZ+bD35TUlfW6esvvQaXvEuKJ5TD5tvaQ6viCeucS1dOZ99wpg/4lSobgqVPjl7vNRsApjNL6v/k1znDSvls4pqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvGd3VBv; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so2784171a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729867935; x=1730472735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nrOief8nbYiJuOMekAxMqg6yuzzPDCii8DxLZ9mR0vA=;
        b=JvGd3VBv4GyxKHxqlO3OtS5A7Y9aW8WI5C3XtQioof5mkInUsNYSitGjR5xH1MnTQg
         WdZpr/NNaaI9vXWunowmvckOPg0QessiRxsH+XSpOVfFQjP3hD3gFyDQRDXk7S8cCwdj
         sDYUmU65pftdWsdBRj2bvEi7STzfaOG078Nvw4ddmAjahiWQ7vwq3xJZRL6Aie7XhvIL
         SjtnFVrxKXatkC6UoMejsBoH6rkobxo3bZH3IFLsMNSF7ztnvBrU9WCL9CFlitNwNurT
         +EqA/8i/7qyBl6pvm+x/insO18akILP4vgFi+rJoB5AW8YLvikUp84yHTvDj5TWhlCkV
         nojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867935; x=1730472735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrOief8nbYiJuOMekAxMqg6yuzzPDCii8DxLZ9mR0vA=;
        b=fKTjEoX+MOQHjZPKZrLP+EOV6MtGlIULRpfIbeAaxWi5DYKDQ9tI7KbxN86AGYThwH
         2sFK9mensMQuZMgL1bMi3/DWklwNLn7Ud/KoYqA3vIsZIW8SsN273IWg7d3xt+c5jMAp
         9Q1USkCl4lFETtQGGaQwk9Dt+4W3bCcQTXXdVvdtmjuQOPFqQ5pUii+6WSq3dwAKs0Cz
         1smHzuaE/VZLfkbdvZGQoefBkIMi17RlkKEBhn2yD5UYahOMEq/5x5jgk3z9OfPb9BXt
         X5ccEkOzENiAxN0ouS4xydqKX+ZlWKWtCbIF05cPG5wVpmWfSyan/lP6D//p548k1gbt
         Mymg==
X-Forwarded-Encrypted: i=1; AJvYcCXyCGNwyEaK0lVv8siXnIROtjlkra2ijZ4AQIWX045qyq6FErbtK2Jeq+tnHvpJ8Hf6CtXEsnsNeqiY1PKF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5F9PTL12rVa8Vnwsk690+MnDfCSYJJnw+MUAMOX+Qca2qkklX
	OTpQ+YRMx0dOPXb7sCtHIfnTMpeS27Bps3etYqp1VgOn49lzlp8bTe5Y4a2n/SEFPFIgQLpZgQx
	mTxN5WUxkFDKpFis4YxFhePtNbV+9joKzWst2MA==
X-Google-Smtp-Source: AGHT+IHscqiA2vwhlqzyfYQiuye1p7e18GSeto+pEBjS430QeRHPKdPaupXdrDQYhsEJh+l4Tn8aYInhGwbc5CIL1KA=
X-Received: by 2002:a05:6402:4304:b0:5c9:2a5a:5f0e with SMTP id
 4fb4d7f45d1cf-5cba249c506mr5998675a12.28.1729867934911; Fri, 25 Oct 2024
 07:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023092708.604195-1-quic_yuanjiey@quicinc.com> <20241023092708.604195-2-quic_yuanjiey@quicinc.com>
In-Reply-To: <20241023092708.604195-2-quic_yuanjiey@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 16:51:28 +0200
Message-ID: <CAPDyKFr-Gzd3Mzn+vN6DXO9C4Xrvpv4z5V2G_VRTzOa=89Fd3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add sdhci compatible for QCS615
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhupesh.sharma@linaro.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_tingweiz@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 11:28, Yuanjie Yang <quic_yuanjiey@quicinc.com> wrote:
>
> Document the sdhci compatible for Qualcomm QCS615 to support
> function for emmc and sd card on the Soc.
>
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index b32253c60919..164a45cdb972 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -43,6 +43,7 @@ properties:
>                - qcom,ipq9574-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
> +              - qcom,qcs615-sdhci
>                - qcom,qdu1000-sdhci
>                - qcom,sc7180-sdhci
>                - qcom,sc7280-sdhci
> --
> 2.34.1
>

