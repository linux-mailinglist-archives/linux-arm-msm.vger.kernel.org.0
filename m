Return-Path: <linux-arm-msm+bounces-23159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84290E04E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 02:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8052828E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17F9155322;
	Wed, 19 Jun 2024 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ivYdYx2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA5179955
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755207; cv=none; b=etnhnlKY7fh1pOkh6c+/VvzQSGOIcDGkP6JIh57vvjFstuaH9dsqIZeftRg0eguajihWXXugxfuG4wUV90rYuUwEfc6v9mwiPiyMggkJWx440bJuHmNHP8O1OcOBkUcoTDJiGwxZ1q+ELbu9wUdWhYKykHcwxFg1pdSyVCh4Vyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755207; c=relaxed/simple;
	bh=PuNTi5bUdDeMTi/XN+FoMWULngrNdVFbUfdvtMX5iBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQ3mMgDSiGt+ncloCCQqi8N7E1eDk0owcI2fpdMfOcL0elmM1vwU+5rxjtzpj5YOLFwbyOsAoVjnH5EtbUDTvtqPqMB+tcoEKtMHBoTDyM/pYzO1FYjYjdnY/hd//9XYRQVVJYjkLeLjmKUKpNvxgU+C92XVkvHUTqdwb7jktC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ivYdYx2U; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44116be80ecso31383361cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 17:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718755203; x=1719360003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd6aptPdhHSWBGR29uSXjubG6ZgMcokb3JBWxjGVcBM=;
        b=ivYdYx2UGZfDyrOxZhR1AqPEq8tbLrb6UhDQ1xRjcoFk7JaXoz4KIuTtArpjS0ebh/
         MICsIkzbc4WUChM70CmuDArSs/FiDiAgg3cd+3pgVs4uiXuIxFuMYohTQWnH50b5PNni
         bsT1PVNEylPy18/BvSRQCtzi0E5DxllcR8fgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718755203; x=1719360003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dd6aptPdhHSWBGR29uSXjubG6ZgMcokb3JBWxjGVcBM=;
        b=MAq4ZiNAWnskfnbBmBmKl6iXsbhZCWK66HOAJPwitn9uw51bx4xqrp2dvjTDj5IYtM
         LVFxyYMaUAtqftO5vOiEeYFKJ3miOtTFHKjrw3PEmSjZfuxZ8yWoGIqe9PLonf4nxDOX
         8pF1D2AngcVL40RbRLqaK4cFSwUxNblmnm8QLd4mDGyTfMEcD9tYXc1UGo629gEFrsjs
         iiFVhAU7SNNuwHtrc5ZjzMQwAPtT4w2Ee3JIMUPZp+7Xt7oHDFVWmViDvI5q3ylO73+x
         /9FR/7fqN0GKrs3ihu/X6E9bEx2BTDMYdRTre5CS1/kHUDJzH0dp4uUTD6sljtv704fg
         N9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhwVUceNvfI2MGkf0mQ36m0tnaAR91Vs3F4QsIWfi9FBFDhYscO03Q145tbjtr8icBpqV1I+dVmuVImPr1GmLf9r7vMrJvVoHhI5o8tg==
X-Gm-Message-State: AOJu0YzTd07P9WsayZE8s8IcK7DY4gFL4EQtYtyHel5XfssyvGlHW5Fd
	JiEYG4ZS1ZkfSvoXZL+OxO4tctSUXBmjLa1cllzBwuIwnWiEEFrPHvNp2KpbYZG1X7KMSNZ+rxE
	=
X-Google-Smtp-Source: AGHT+IFiI/4SgQc2PK1oeDJM/i9Zo7HM5Hi1v0HPXfifz8/wc3tYHGAsTChHMRYvwICO7Mks6L5xUw==
X-Received: by 2002:a05:622a:144a:b0:440:f03b:7991 with SMTP id d75a77b69052e-444a7a1ea0cmr16429511cf.12.1718755202662;
        Tue, 18 Jun 2024 17:00:02 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2ffb4bbsm60702551cf.87.2024.06.18.16.59.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 16:59:59 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-443586c2091so212011cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 16:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfUIujIA4Oqtz6ecPLMg9QWVksYKUcMCt2qysyM0G7eeuuJD2awep5QyksWf/325USg+sfL7uLYrXAYBVwrxnAhs7gbRpn/2GHzAnRAw==
X-Received: by 2002:a05:622a:54d:b0:443:99d8:746 with SMTP id
 d75a77b69052e-444a8b5e25amr1444801cf.0.1718755199364; Tue, 18 Jun 2024
 16:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
In-Reply-To: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 16:59:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYAgKRwYrBgFvBjaR8WS6Cf4Q2mcH6ifwCp3ygbEdbOw@mail.gmail.com>
Message-ID: <CAD=FV=WYAgKRwYrBgFvBjaR8WS6Cf4Q2mcH6ifwCp3ygbEdbOw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node
 where unused
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>, kernel@collabora.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 14, 2024 at 2:00=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the keyboard backlight is described in the common
> sc7180-trogdor dtsi as an led node below a pwmleds node, and the led
> node is set to disabled. Only the boards that have a keyboard backlight
> enable it.
>
> However, since the parent pwmleds node is still enabled everywhere, even
> on boards that don't have keyboard backlight it is probed and fails,
> resulting in an error:
>
>   leds_pwm pwmleds: probe with driver leds_pwm failed with error -22
>
> as well as a failure in the DT kselftest:
>
>   not ok 45 /pwmleds
>
> Fix this by controlling the status of the parent pwmleds node instead of
> the child led, based on the presence of keyboard backlight. This is what
> is done on sc7280 already.
>
> While at it add a missing blank line before the child node to follow the
> coding style.
>
> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogd=
or and lazor dt")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi              | 5 +++--
>  9 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

