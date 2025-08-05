Return-Path: <linux-arm-msm+bounces-67763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B6B1B184
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A1737AB9C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1204B26C39E;
	Tue,  5 Aug 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtdA3sxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE4264A97
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754387631; cv=none; b=QydEsmOsZDK0TG69mt5F0r0KwFsX1UJPbR1dmgCgB1AxIemwfcy9NwIh+GXV8GFWuU78zTmTct9kg0xXiGxuKBj0sokTeqrPKu8tafk6/GiTptdOY4O3LDJqd6H8XC3Q2d1RPBAYBtYfFJqR57r3B+AabbymNUh5UOu4hiBuams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754387631; c=relaxed/simple;
	bh=JzfGyUk5TxqhA2fUD9yFt5uBkf1NxDzIPcarqklTieM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZZe1+Wtzw9TBogzIEu25/zO6Q/12pkG/KPQDEJVQ+FfhkxyB1zmDZ9v7DutquOlxxEUGdzhX7ho/nvG9ergMjYP396Wvd1gkOZ45g2wiOgqFTi2/qxK8/lzcLLQnTWfGynOLnHyZTv4CW3gLJGRcwqU2+bb0zeeKah9Sl/rwv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtdA3sxX; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3465816a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754387628; x=1754992428; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kqOH/YydyeFepQj4djKoRufGWAHZEIvnHzq3g2f3Mz0=;
        b=wtdA3sxXimEi8jCHKA3tDhJx8Qj9LE+x/NhDSNqZpensoIzscfaKorTdMboYoJ6vR3
         3JXbBbDQBdd1IYVJCbNqlIzw4YMJ+0jKB15T6lKB4shrpaIw7lqmbi8nXr3Kznc3fODp
         yrJq/FEFmIAcUr3K0eYOQVA2dR5gxEBtEs6y0J4PQPTB0+EH8bFqfwEIdgv2p5aBPhHD
         VlZ3JU3UQ5QBSV8Yy8yb5qU6wz7HsQlbzTJNY+qcZE0dvt1JmIZXQpuxmQkLtTEAsvyW
         XTsAh40BWXWCsbiEmDSUtQlNE5WhzClB8jI/vMRFPAw7LrC0y4ZkHGg7KV62Wxtz3abp
         lVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387628; x=1754992428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqOH/YydyeFepQj4djKoRufGWAHZEIvnHzq3g2f3Mz0=;
        b=H3CYj23Sk6MpcPhBzgT0LZwkbuPypckJ1hLiH9fijFZxgdzQoBKSwGqwTkv7DY51nO
         OBYEdtwN1pne8EnZT4qeZ1kljHSNgCH6TNI4kKN6cACj+RrvTFXEKGraKDZYaA8T+h1n
         RbzvlTbQJCuwrUxKm8ufLwig6BZhaReDa1KflEiKCiow1//xIM9EhC4E9qJ9Toif3QeF
         45V8rMEcQsczPjYV1Bf+mk7GMUMOcsFky3mliMKHiRo5WdBU3KHwq+mLeX9zhGIVmIGI
         VJFLaj73JPWiFhJE5zn+WBMfaSgWFEyhVqHVpaz5STvNUqvSCEAi9xprGJvr9YZBxBQC
         laNg==
X-Forwarded-Encrypted: i=1; AJvYcCVi10XDs6WLfMEf+zuYABbQnWoNpV3h+34PyRioVmMTVG8O3xX8qsxdyFHRQvfHN8cOHWj+MVD0jqbVeBj0@vger.kernel.org
X-Gm-Message-State: AOJu0YzfghkwXEhjmF8L5oLBPi8srojqWCS+XxEpH7PFXXV9G7Jb6mOi
	9Z6BAsdFcfQsQAG1e4qjkAIXjNe3u1S3SdhEULf3TgQ/OcNDLQdEyGRAr9/y8cIGuanc752sn7P
	nyJXlvFcVe+olrI67qFWGakJwp9qDQ/p8W0BuoCazQA==
X-Gm-Gg: ASbGncsx6W/LQ1GugV7iN/AZHtts/LzMFPWiAyBT08Ki/+ZjuYkr/OHjRQ7bPOCzZQt
	QO31sHtOeJkYRHFzoaaVTZLeavjXlalDW2/cnsrSSw476fc+PVSCVdRJjLALchouEYRoXapaJi1
	K/zlA6kwhppCNwUkrxwA6pJ4nqIIJS4jC94JaBccazhnoHz0kz03i1Y872XxnoEChOs0yGGycYm
	+O3uw==
X-Google-Smtp-Source: AGHT+IEzHAmi0MSWAu1rgQfjhSryD3cFVQRd7ATB9s5pY8kjz8u84GpsLjOHEKwVBL1zb+hkERMs+dO7ax4ayrjHp+c=
X-Received: by 2002:a17:90b:33ce:b0:31f:4a91:4e94 with SMTP id
 98e67ed59e1d1-321162d2237mr15476293a91.30.1754387628536; Tue, 05 Aug 2025
 02:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com> <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
 <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
In-Reply-To: <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 10:53:37 +0100
X-Gm-Features: Ac12FXwafHZ88AWPsVnZmJsBajP70fc8s8ykZSQl042YjN088WSulIMKoD4bYuE
Message-ID: <CAJ9a7VgZ61oL4LLxKSon3LXsYDtaHaPcGNxW=cwzhSOs3ea1PQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jie,

On Tue, 5 Aug 2025 at 05:11, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
>
>
> On 7/28/2025 9:08 AM, Jie Gan wrote:
> >
> >
> > On 7/15/2025 8:41 AM, Jie Gan wrote:
> >>
> >>
> >> On 6/24/2025 5:59 PM, Jie Gan wrote:
> >>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in
> >>> binding to utilize
> >>> the compitable of the SA8775p platform becuase the CTCU for QCS8300
> >>> shares same
> >>> configurations as SA8775p platform.
> >>
> >> Gentle ping.
> >
> > Gentle ping.
>
> Gentle ping.
> Hi Coresight maintainers,
>
> Can you please help to review the patch?
>
> Thanks,
> Jie
>
> >
> > Thanks,
> > Jie
> >
> >>
> >> Hi Suzuki, Mike, James, Rob
> >>
> >> Can you plz help to review the patch from Coresight view?
> >>
> >> Thanks,
> >> Jie
> >>
> >>>
> >>> Changes in V2:
> >>> 1. Add Krzysztof's R-B tag for dt-binding patch.
> >>> 2. Add Konrad's Acked-by tag for dt patch.
> >>> 3. Rebased on tag next-20250623.
> >>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> >>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-
> >>> jie.gan@oss.qualcomm.com/
> >>>
> >>> Jie Gan (2):
> >>>    dt-bindings: arm: add CTCU device for QCS8300
> >>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> >>>
> >>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
> >>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
> >>>   2 files changed, 160 insertions(+), 2 deletions(-)
> >>>
> >>
> >>
> >
>

You need to send a new patch addressing the comments made by Krzysztof..

Regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

