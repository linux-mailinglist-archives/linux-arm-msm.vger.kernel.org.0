Return-Path: <linux-arm-msm+bounces-65055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B5B0618F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 16:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F08922C68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 14:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089E628506E;
	Tue, 15 Jul 2025 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2v2bzED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1612121638D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752589819; cv=none; b=XQmvLKGV718fZuWnucHnYczIA9Los8k9U1dvieAsnALSwRF4LHycfL1HcVJYtE9WwthuYWamfpMEgR2WNjZhIs/JVk6t9Ws25sDaj/lqPPcntZVGRZC+oh3lHnNJK9Uo4IDW43FweGjf+uMSOQmj4Fj2CNOQIWuJvLeugFWFSqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752589819; c=relaxed/simple;
	bh=FdL1/HKNTpO4kdE7n4NKm5VaVSkDlbNs48yc+1QgZas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlvvoMhQQVdb86vuTRXuShh1yjyZ4yPR/8BBp5lgDy/fUK6tQ1mrJa0KcRjmd78vohxUP7TAXHlC8HAuhFnfsPD9nUhyv8B7GkvDA8CJfVCIPhCdGbOD3mvjgCKxwM8hJBkuDtIe9WiVTcECeeR5M0o2Zvub5i5Qxyd9//uj4NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2v2bzED; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71824fe4661so9526547b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752589817; x=1753194617; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=;
        b=W2v2bzED3A9ejC4TfbgBBjzjno/K1PhLK2E7O3e0SPUbLWqTR9Evxz9A+K/rXmm1Gp
         Et22K0hwMJdya3IKeHHsXW3hPwxvGaAhOYHBmyAS8ncFcpUbQerWd0RUW9AbdeTrB6sG
         QOUikyYzPsid/y34PVziDdUyKm1BoNauuudY42lVMegWroSPQOo3Qkr6ygEYUTk7hnPm
         kY02nYoNhhonMX9fIknHS1fRHnqETyvy/jv6p/jTCFbethMcmYb0L5oWZWuzyDkW6sow
         OmLBsjvk6glkP806VpmbDr5DbkxrIKVAvgata5YVlC/7rRECoPR3Rnlb3ulchSSzVxCG
         mZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752589817; x=1753194617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=;
        b=RlUWBfaTju04c3fGpEKlZufYw5ORnUZJLs/5+OUL8e/l/mL0qnQMeePkQTAf4gKSch
         KE0BIIysx+NGzfWW5wweGk5QDN4LhV/CK9blosDEbh7AtJXDuT/v7+6IEmKDyO5B1+yh
         cgeFTk8lsZMwW8L86nV362McACfdCeiTpE6lyu6y2iVaQ4fDLuQkzB3xAy3LNHBcRPDA
         fUQ9+9zipfokHD7n34fDIZFWgHgGOpBzoj8EPrG8k+O0XOmTzxrHjyCSjqEMvXANc15M
         7vkVu7IMkq2+t16pRyzqaCNwXWrVDsjrAUuKPVCII62xuDB0UvX3IRlv+zNeqQj/t+/d
         +eAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFPMQbVkyWKGmwnJPYXA+HhIwUYIAB9MPiDbUZdT+YyBZ5J3n6iFND9umY+seCSyT04TqikPrmb8758ddI@vger.kernel.org
X-Gm-Message-State: AOJu0Yynz0rHxXQ/MPHoJgYuGJBimbRe4OJvs59H6XupmVQw77uAuZ9e
	HFsrQ3ziQ8kE0crAzPuXBAH4Jv9h4ZeBRUUmB2i3UiQCdS4aRhGdmZHo8MDK48Jmd8ysDYMOA9w
	OuNI2qL7W+kGef5ey4Tq3hMx8DIDUOQbvw8wKnOR0hg==
X-Gm-Gg: ASbGnctLSslHHnBZUN+ChVVgKZP/j23F3Bua1k6uG6uAw5fWg9O1VGwuW+2x13SAhSK
	Zdkdl06Ff3Fs+CHdszoYWvonTH+vQ2Z1/2FZpzy64ZBDM7wx6Sqa5B05B9Wz48Wt2TRJmFMd8MA
	a9kqPurq8WvIdyGkJw+kCI2ici3OzRdDylotPGCW0gyoJ67v81ppMKKMZsesXJR2NO3JSNLfSTM
	Je6NMLL
X-Google-Smtp-Source: AGHT+IGBzBhoCXe5OGunO7xvl2ZbN7LRPwWWQsLELIyQWERT2XuyowSM7Ti1rVh+eETJFMAPU2ltq9fvUbOvfY7jIrI=
X-Received: by 2002:a05:690c:9:b0:718:2387:4544 with SMTP id
 00721157ae682-71823874737mr49946387b3.12.1752589816638; Tue, 15 Jul 2025
 07:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com> <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 16:29:40 +0200
X-Gm-Features: Ac12FXwmHbA2nWRNuYQwrZTMO008mwPCFYz6i2upkNA2qncGOOVsk9AzGvxKlLM
Message-ID: <CAPDyKFo77_0n0SefZ0N3osbSM=0tXW_rsjd9P4WaqoZAwyaTGg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: mmc: sdhci-msm: document the Milos
 SDHCI Controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Jul 2025 at 10:07, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Document the SDHCI Controller on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 2b2cbce2458b70b96b98c042109b10ead26e2291..6f3fee4929ea827fd75e59f31527f96b79b2cca8 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -42,6 +42,7 @@ properties:
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>                - qcom,ipq9574-sdhci
> +              - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,qcs615-sdhci
>
> --
> 2.50.1
>

