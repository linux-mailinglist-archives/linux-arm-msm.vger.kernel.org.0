Return-Path: <linux-arm-msm+bounces-4630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0C781242E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 01:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060B11F212B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 00:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A5163D;
	Thu, 14 Dec 2023 00:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NfuUm96i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A68CDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 16:59:49 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so5616380a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 16:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702515587; x=1703120387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqcAH2y6Hz8HXbwvCsmkFY7uTh79KxMlBdJGmAf+Vgc=;
        b=NfuUm96ix+FAGu7arvPXlIrP1y9UE+qXHkuGmOzjo7jc60rHGuZeWbMZVo7a4Ri5LY
         w1q6xRQr2CqIQcHL82oRk6+55xZ31jeaUSZgE+OaqJ/x2Ot6+4EGou+bh3oZ646VzQWn
         zpRlya80SD0ogjHPCMXii8rMVkfKYXXH99i0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702515587; x=1703120387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqcAH2y6Hz8HXbwvCsmkFY7uTh79KxMlBdJGmAf+Vgc=;
        b=eAf+UO1RB4QAKa6PZ7rfHo4yKMzByyO5v5I3nHKoiioNlkSqMDAkbViiEYzwRQHZUi
         t3ORRk3zMTUydApYrKEv1lnz4DwWR2P8P1bpBeCxnSdanlR/yislslJksS5jnU0mT0Il
         v3QQ2qD53zNe3D8EA3EOLknbU7VaQNEn8YyuTyDpyNXhKZXSjWqc8dDbYc/QaLvIixUQ
         q/cePmWGZw0jK0+GVZpEN7YQlvHU5TvU5gSCV5pibckg1JcwyzWQ3JfjxaTxoneR7Kta
         U999MZv5C3b5StNWXbD+OwLJ9rJfcz9cQZ9LU8l5UkzC3ID0FoLv2HKEkM6+xYrhSf63
         2RdQ==
X-Gm-Message-State: AOJu0YyQc9vz4CBceUyMRezMlJ1JqCpBBXAE2N0Ag3Hfe/31onHq+cjf
	qwhL/msE4x1JBk3b7R6hAnHQ437MC/0yAf62vWv/ue6W
X-Google-Smtp-Source: AGHT+IEQH7NXXx4A8HuaToFt+K2yuSJCOmuAMe+hg2EXCJv8nTEAPVcuLhIASVZM1WRN1mTrRnho9A==
X-Received: by 2002:a50:9fc2:0:b0:552:6720:7b43 with SMTP id c60-20020a509fc2000000b0055267207b43mr118943edf.106.1702515587030;
        Wed, 13 Dec 2023 16:59:47 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id q19-20020a50cc93000000b0054d3d20f429sm6464267edi.72.2023.12.13.16.59.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 16:59:46 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c3963f9fcso13055e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 16:59:46 -0800 (PST)
X-Received: by 2002:a05:600c:3648:b0:3f7:3e85:36a with SMTP id
 y8-20020a05600c364800b003f73e85036amr464020wmq.7.1702515585949; Wed, 13 Dec
 2023 16:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
 <20231209215601.3543895-2-dmitry.baryshkov@linaro.org> <3ba4da84-a17e-47ae-8958-2484cd6cbea0@linaro.org>
In-Reply-To: <3ba4da84-a17e-47ae-8958-2484cd6cbea0@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Dec 2023 16:59:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XX4wLg1NNVL15RK4D4tLvuSzZyUv=k_tS4bSb3=7QJzQ@mail.gmail.com>
Message-ID: <CAD=FV=XX4wLg1NNVL15RK4D4tLvuSzZyUv=k_tS4bSb3=7QJzQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: qcom: stats: don't crash if DDR offset contains
 invalid data
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 11, 2023 at 1:11=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 9.12.2023 22:55, Dmitry Baryshkov wrote:
> > The stats ram on sm8150 platform contains invalid data at the
> > DDR_DYNAMIC_OFFSET. Most likely this is because the platform didn't
> > support DDR sleep stats.
> Interesting. Can you read back DDR_DYNAMIC_OFFSET on 8350/8280 and
> see if 8150 has correct data in there?
>
> > However this platform uses generic
> > "qcom,rpmh-stats" compatible, which implies presense of the DDR data.
> > Add safety net to prevent old DTB files from crashing the
> > qcom,rpmh-stats driver.
> Yeah I'dve never thought there would be garbage in there..
>
> I'd advocate for simply not doing anything wrt sleep stats if DDR
> stats are unavailable though. The QMP handle can stay, as there
> may (I don't know) be more data available that we want to export
> through this driver.

FWIW, I'm getting a crash on sc7180-trogdor like this too. In kgdb it
says I'm on line:

key =3D readl(ddrd->base);

...and

(gdb) print ddrd->base
$1 =3D (void *) 0xffffffc0833a3149
(gdb) print reg
$2 =3D (void *) 0xffffffc0833a3000

...so I guess my "stats_offset" must have been 0x149.

Can we get a fix landed or a revert? Thanks! :-)

-Doug

