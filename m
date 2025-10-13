Return-Path: <linux-arm-msm+bounces-76979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40079BD27D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26CE84E184E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9241C2FE580;
	Mon, 13 Oct 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKZfhagI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48292FE071
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350439; cv=none; b=RQivogNsPyS1FuEoxwmPw3zE/my0+fOsIGokQLi8C3v0HbO3qqERohPeecjS+3/mgtyXXpV21cU1XyOuYNP9XXrN4LgM3OleGtkIR4FhzGuSfoE2MI1fZmLj7Mx+sXCIk8cg2Jo483LyBNebbBSK0daUobItWq/L9vc2S4SNApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350439; c=relaxed/simple;
	bh=IGEdbdnaRYWKvG+bGlTd3zUjiAzrtQYQYYulGQBXPVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Omv+wfGlhHUEKPBPlxvpWKs9WXkSJknMfFh4/NEA7Frdi1d/xW1oBXFE2dEucPPK+YQOP4kVziLg9da7g4CbpbU4EWsELqMBjc7Ti3MbuJVIjaBloFjnAS3acobtMwczw8DZL1OMluY/Anh8MMXUtTT0ArvNNNFnO3h+XhuyDtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKZfhagI; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3696f1d5102so38547041fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350436; x=1760955236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGEdbdnaRYWKvG+bGlTd3zUjiAzrtQYQYYulGQBXPVQ=;
        b=ZKZfhagIj4u6LFe1ocgaUTzSTxvFJFATTfnN1c9c/AdjypBb1UGUbP09Fx3EnBE+V+
         ARQcg4e8vFVK7pMSIDZnYie6DolRBozXlWhK/IRYGJiAPlBofRDR6aylXeYBnpoEuhGv
         iseiSIp6IXmb5/RLAHGKdNmtne2KJEtCyfTYZ0GQx29OIoLNNzHbgbSiteZThI+1fWuy
         6iQ2tqxonukRqZd0+JyuVUslzM7a580S0vPXua/SUOhzrz1GTRaZIO//KZYPFxh0sZ0B
         acM7pGN9n0B7kTv0eVLtIP4kLr/o/6MnJ/hKYZViZoR0nzeRLFC72GSOAZE8q7uqRi95
         bVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350436; x=1760955236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGEdbdnaRYWKvG+bGlTd3zUjiAzrtQYQYYulGQBXPVQ=;
        b=vCsIxAeqTXEdlkR0d/isN00sqnWP2PGIcZa252sD91Xdr00VheJApS+iqnQY/JI4PC
         hYZCYn3CFj6ywDvoKeoJar2A2Mw14m+fUgr8Ol70IsZYmY7w1w/Aoc05fYrBIEnZ0AkT
         gEVPnd8Pc2cMwGxeY9oeeghzGDpyQNC7qZIi1pJllxpitTOMm3DklClWFlSkmFtbH/eH
         kyqh3BzNRP4aPlthopAwmnvDypZ7ZMiVe9MVfBZLHO039veIeqVf7n59xBHvNH8ynTL2
         59VSjo3E8lHCaXbO8773b8bf6T+MMxnd1QyoeCEruT8sXGDQZa7sVHNq+iBOaLr9kkYM
         CB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgwJNABmiXOrpyeVfKklZQO0dj5MI/WntG2IeoCbe3Q/EYV/veJth59+jfDtW1L/CVlsvNRGDDrfe4MLWc@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3nsO1EOx08zIqNIJqeZbcLRhVGjxgS6SW9lMXkg8oQCC6iEM
	x7EZhPmQga3lvsy4Lt8UAMHeymQPDRhK4Gm0C5gsW3GOdEpE3huRVPmYG6z5T4otRv6+RGL7qkE
	KfaJEN7JbvtfWKmCS+4JAv0cP5kWUtEiOjVXfzhg25g==
X-Gm-Gg: ASbGncvlel97ZZJZJZXbSMj6n6ea/53GVy0ktY45+F4K9wciRNF9aQS9dsQMpO8OB4S
	/Q0TtxSLc7XxaMWct2MtFhjfpBSiRCPjGX1S8RgQwwnKVqbap9CcLCkxa1EXJvi0lDcHX7sI/vT
	L5JXtj8hoMU6thJc78XFFcnVQgWQGSCJLM9/rotFTRvlMdAt0iEg0HphGtyWAJm0OKYbj9qtPl/
	BitE7jM8+Hm7I8MhDzIdcg5ZVMcUQ==
X-Google-Smtp-Source: AGHT+IEyXfMASnDudG0S7N/mc330ju/Ch5pEVZ3V2N1dVue3s7gHw8dguHiupRcJCaA2bDWHDzkge7BrzB3mH+HUM10=
X-Received: by 2002:a2e:bcc7:0:b0:368:6a3f:35e9 with SMTP id
 38308e7fff4ca-37609e4d4c3mr49784771fa.36.1760350435755; Mon, 13 Oct 2025
 03:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com> <o23idwppfthjoivpyzjojmoakdorr43gpmo5opmeet6oeud742@qhk2j5bjg5aa>
In-Reply-To: <o23idwppfthjoivpyzjojmoakdorr43gpmo5opmeet6oeud742@qhk2j5bjg5aa>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:13:43 +0200
X-Gm-Features: AS18NWBAyKKP7WpPbwzZSRGYCjWy0-gOfocVoYTqFPcgneZRB7ljrZVj7GcZyxg
Message-ID: <CACRpkdZ8kQ4AKLtXpUXPu31DKAGZ45dtzPA=-moBQDtXsY4Wdg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio
 node to tlmm
To: Bjorn Andersson <andersson@kernel.org>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-gpio@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
	Shinjo Park <peremen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 5:11=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
> On Sun, Sep 14, 2025 at 06:34:59PM +0000, Antony Kurniawan Soemardi wrote=
:
> > Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> > convention used by other Qualcomm SoCs.
> >
> > Suggested-by: Shinjo Park <peremen@gmail.com>
> > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>
> Note that this patch is in a different subsystem and is picked up by a
> different maintainer and there are no dependencies with the other
> patches. It would therefor have been preferable if you sent this patch
> alone.
>
> No need to do anything this time though, I expect Linus to fish out this
> patch from the series.

I fished out this patch and applied it to the pin control tree :D

Yours,
Linus Walleij

