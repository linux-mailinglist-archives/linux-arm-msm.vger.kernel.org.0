Return-Path: <linux-arm-msm+bounces-72993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C16EEB5182B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 15:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D386D1B227E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9317731E0F1;
	Wed, 10 Sep 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YANOrVFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0331E0EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511834; cv=none; b=P+UD8267Nydepa/kaO9sUHY2NuSwiT0k9GtV+3xF16CQPOFUszwbUgf/ff2/I1lGwEdH6caZcE/5ibGkidBbZkpoJA9KolYzi7Hy7maom57grC+/IBWiQyXgZVayGUZerRNgkm2TH46LuQUSqczEhA+jfnY4dLOi/U5WO59aWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511834; c=relaxed/simple;
	bh=geyyEYjk1K6ztSTDk78aVJVN3bfFFO7mnbJHVuJmCv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJTuXAIozBghBd1NpG8d2hDiIFZXsWS9nJSuOKayJ2GOM0HpK9wURLxvcRbfKog7+A5/zhtPZJIe62R4eF9zT0BeNR3HOWAePG64fd2Lod+eeAEjrzJGDvVTNXyMqQRVj2dIQuyffgTXOJQeFNVgdxVxjd4Oi8R3637DM+AdzlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YANOrVFy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f716e25d9so6517255e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757511831; x=1758116631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=;
        b=YANOrVFyFccA1JYWsWJbTWW/GzUPp2wituaBGlY/cQFANxiYpX2YQzm5AtuuKPBZWG
         ruA3Rze3+tjNKS4MuOg8ctXb0Ncp8+zW1hlJ9pL+1KQ5T/9T7Sha17FpiCIP7btqHzOE
         UiiBUczdbzwcK5NF6ZX8s/h2Goz2hznUDfTDEKmpFTGn9iqi+qXJZW+Gv0C/4hFD8j0J
         cikR+XdDEiOwcDmwyJupwUAna2MQSuit2jUVZPmYbdnPwQ1dLT1W/s6mMJ6Km7e2zVo3
         I9WMzb3L5jMZ+X502hsxWSj6ZADlmySD33MmZ5i4mRRdbEE3S/xFDzYlegq7Cz9USrDi
         aGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511831; x=1758116631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYusx74gMgivYw43mzCgiUQelBrscv4e9WlUdU22ggg=;
        b=rMGfRLMGWaZNKJb3/PLwduDdaftrVxMcLCCY5rN1ncx5j5oYzeH+GXOkDrRr20X30A
         QK6Yh9UqR2pIs5BKiS0Fb3QsPRMhdmNoqntOEcY4cnVejFhuBYyb6ORskD7vJ4d8lTyJ
         w/WSR3jau3iHiNGA2499+vWtIrWSsbwSE1oe6cByHhIasHa7v9oPjpV6jzMk7FOz0Uxc
         Y7/yniD0TP1T6e/wN6CijyLP3GWVwo8+PKlU5DZ0GcS6Tq2xqbT7s8Zz1+7uP/NFtI7O
         uvIasWfS4IqGUuPvtlZKUg3/kW6/lFVroNXF1m8ymNcRcbSmRchPAxK+iCZm3846f9yv
         0O4A==
X-Forwarded-Encrypted: i=1; AJvYcCU1TD4ExUcDpVN3CNPMSqpKoOKJTKvvAYbSH2wBAGzi/BjHG09mbQ0STvZWCPHnOtnRJPDLVyzWx3ZB86of@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QVAb8epOguR788CO8dRnsh7KaWDOo4y6FyPyyPXGyR6bqSIf
	SJ3AhPDpVUo8tdripWRMsUUfyTDlEKaEr9DPcUxLR/KAn0xyk0iWDbvZ2wLi/gmm8uea670C2Qn
	hHQPxDRMSKd0vJrgdbEBSw68iZ7Bp/AURXOLZglscpw==
X-Gm-Gg: ASbGncsMy2WAwmubftV9vtrXrNt959sxHJu/XOo3BQZw1blidh3Miqt2fNR/7cwMPzv
	RXmFcGcSLaaMF70+eBe6hOz7XVybJrPC7Ko76vn/6/PCAPjqQxcEQ+CrRUQ49J7fWAs8Y7m74c6
	SXCaL48Gfq8DapmDbYolYtAvJQryogzniSLMW1IpWm+XR+foTk5480p/PZ6TKlJ+t5WUZL0VwnY
	YqMmjzmDnj/K+IzDg8NFvyTfDh9R9z5zdMwFCM=
X-Google-Smtp-Source: AGHT+IFm09bgx/eETS+zxh47Y2IF1gRYf9rbRYIHHMrehDx0L8qn2Ht4Uw5vNEiZ6L2mWS3ck3SpU2dCp6qBpa01PJo=
X-Received: by 2002:a2e:be0e:0:b0:337:f57a:6844 with SMTP id
 38308e7fff4ca-33b5a3fdaa8mr43894421fa.43.1757511830680; Wed, 10 Sep 2025
 06:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org> <175751081352.3667912.274641295097354228.robh@kernel.org>
In-Reply-To: <175751081352.3667912.274641295097354228.robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:43:38 +0200
X-Gm-Features: Ac12FXyZX2mI5u5h6corBWI5JwEw3xwlMcAzjYN5jnXKYMZIVsaIzZH2ILMwq1U
Message-ID: <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Eric Dumazet <edumazet@google.com>, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:38=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Describe the firmware-managed variant of the QCom DesignWare MAC. As th=
e
> > properties here differ a lot from the HLOS-managed variant, lets put it
> > in a separate file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++=
++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
> >  MAINTAINERS                                        |   1 +
> >  3 files changed, 105 insertions(+), 1 deletion(-)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac=
): power-domains: [[4294967295]] is too short
>         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-g=
mac.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac=
): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interr=
upt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-dept=
h', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-d=
epth' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-g=
mac.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac=
): power-domains: [[4294967295]] is too short
>         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yam=
l#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): po=
wer-domains: [[4294967295, 4]] is too short
>         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac=
.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Un=
evaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'sn=
ps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were une=
xpected)
>         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac=
.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): po=
wer-domains: [[4294967295, 4]] is too short
>         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yam=
l#
>

These seem to be a false-positives triggered by modifying the
high-level snps.dwmac.yaml file?

Bart

> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
10-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

