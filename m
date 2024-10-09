Return-Path: <linux-arm-msm+bounces-33683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A64996775
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 12:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42382B27BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE08190470;
	Wed,  9 Oct 2024 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qmoEEGBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6286190056
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470298; cv=none; b=WlSomBvdshxP+pXcub167e8wsaFYbhI5cy76195dug7ShLOYFPZBtpmwKdccbK3pO42FpyTNoDAWhgnwN5ciOwOekdgktqHa4GgbhOWFOEoMphJO1DiXWMRyY1a2TuUPNqhBuMgNPgtV26JYYSeSHyxmh515YL5fNcRHWLVeG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470298; c=relaxed/simple;
	bh=/pirvcswA+FHOwpqdaOFXRCzEZ6TIlpHexynPVzZ09E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaScR5ayIcWUcM9RbRuvf5D/8aq/4+pZ05vcy54Sl0Jf8InxBhGDylBZjfgxouejSr41GyuA5xsXmNebgBwiEE6ifL8gewKAWpjx57b0ItFcdEr60h74wKeuOTHvVEYxiUx3onjUSh0jPD/QKwI5PmrDK9Zaxy844gtPpC512YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qmoEEGBJ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e25d164854dso5688729276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 03:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728470296; x=1729075096; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ID1WufQHJnNG6qgq2q02dpWhdZV7K4BwizWlrE4oEN0=;
        b=qmoEEGBJkSJudMhCOcbWY6+0lZdlZc6iWyuMpGeN/8/AoD4VTBSuaiYUzFEm1Gsa1K
         8+CIo5z5tB3l83u/f3/Z5M5FunX5/0BCIRjsFQIah8RXKaW5SiqI545uYuS7YQTur8X+
         RTL4lxlk+s34a00BRZx2Cghs65NcSU4/YEl3JvzTYSUzBFHZlDcMCx8gzGx1YEGMnFBX
         wSF+NhNuiE+CscVOBBBUMxB9yBvFcJnk/tcPZHaPN6HhFI6gvBSiPdwDVC6uCPqjqeI1
         PXtnfBedi9Q9s5465+cEuISCzjVzLDGIdUxxto5bIYlUCakINVBx0Vwx0W0FDO1KfJez
         a00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728470296; x=1729075096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ID1WufQHJnNG6qgq2q02dpWhdZV7K4BwizWlrE4oEN0=;
        b=r4p2J89dxXy0it49TRn24BLyqO+9nktlu5WuMrozB+d/foyAE16RopXZNtn6YHIITQ
         /2/CVu5qoiDv/BnfyAuKLnOhGSCr4qt97P27JajvKbuwP6tieMFuZ152jNMBBBgimCxu
         sqy22SsnGHT2fB71W4im1BQ5RaFckh97wldvHMOVIW4b11uJy4KlPBrVMNxSZ3BzSKAg
         H+dJTzGceSEcN9bg5Eao5yT5/qSg2WYZ23EwAcvs/ab0hDeX71uzArdYKNCkOpsGoVfr
         s9BPBXxm0QZvtmvasoZnzSIbTHSPjZgyU4KioApp/X+w01cm6cR1wYrdgnrzPtG79e9P
         24/w==
X-Forwarded-Encrypted: i=1; AJvYcCW2+AwSsGlSnUzqBM2z42UjFyEZ4GgjvzWsVE7nxziLEzAxUbfO3NHdusIs4lmSTiuuFsjY3z6OV41GahNG@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFeSmseCyMCahPS1sDatGTaxJFARexQ9CRvzemKsme9IyGe1i
	JyKlfF2aWCwwrnt9GgZqJ+xxjMU6Y0k9fkWaWEaY1eERgIIAKsiOWpLvLMMTQx4EwIOTHRmmB8o
	2eJDQASq9RxSIfcTuknNNLFtA6fm33Mp/CXatPQ==
X-Google-Smtp-Source: AGHT+IFoviElVg6zgPKSNNlWRMr8af1m9Z0WlJoeomF8hhSrWTf+U4itcPkeioazo85YkG9vWzGOAE0Jq1Lc8Dev+Pk=
X-Received: by 2002:a05:6902:e0c:b0:e28:f2b3:1a3d with SMTP id
 3f1490d57ef6-e28fe33b8c7mr1913514276.6.1728470295854; Wed, 09 Oct 2024
 03:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org> <20241008-x1e80100-qcp-sdhc-v1-1-dfef4c92ae31@linaro.org>
In-Reply-To: <20241008-x1e80100-qcp-sdhc-v1-1-dfef4c92ae31@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Oct 2024 12:37:40 +0200
Message-ID: <CAPDyKFobpQjYBys6J_WUM5ws53ffZfn1G_b0AHN6xee=q0KJHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: sdhci-msm: Document the X1E80100
 SDHCI Controller
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Oct 2024 at 16:06, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Document the SDHCI Controller on the X1E80100 Platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 11979b026d211050270d018c03fa73c107e7c10f..8c7e016306f14be20e4a3cff289317ed603633f3 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -62,6 +62,7 @@ properties:
>                - qcom,sm8450-sdhci
>                - qcom,sm8550-sdhci
>                - qcom,sm8650-sdhci
> +              - qcom,x1e80100-sdhci
>            - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
>
>    reg:
>
> --
> 2.34.1
>

