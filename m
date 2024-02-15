Return-Path: <linux-arm-msm+bounces-11124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065C85585B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 01:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8251A1C25F2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 00:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835EF1378;
	Thu, 15 Feb 2024 00:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q3wEBXNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A0818
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707957607; cv=none; b=TdPjSVk0Tdtvb90dUh/SIQSXtEI8afI3bDOmUo8tPye6dlOT1k2VaZPPGA/AK++CrP9tym2lQPStNpntNMCoxAlTgxXO7G2Ux93XFZFko82kmk8ehkPo0o9TGcsZbiLBNXbX+P/b1VaXBaMl1BvAtzQyZW8IjSFpLKAj1PnK34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707957607; c=relaxed/simple;
	bh=kYh5k8MyiysiewusV+Glc1Kt41gt5l9m2Lg4dhbhPyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKwosoeZ4F8CeoHUTUnh0iAWTrjJzlbGPtoA0CV1Xde+f18itY1hh3SMuaw2H/VPhB4yAZhQXgkkDWSFOMR/hU037cnyaX5Z02GsOjBE8Po3CYJl7//xskWpGOLzD8smSKQXWdqbVJ7IQX9SitrFHVVX2z+X5wwgNy2KGGVXqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q3wEBXNv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5118d65cf9cso380890e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 16:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707957601; x=1708562401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYh5k8MyiysiewusV+Glc1Kt41gt5l9m2Lg4dhbhPyw=;
        b=Q3wEBXNv03SpEX4Vk8kNpNaZsl8bjdr3PLINCfVs5Y2XutaVUnbVi5uDq7xypB5XdG
         G1Ku/pe3mtpzMU1KuPWl0l3JUSmoRWiMH1Wr6L9vaHldMGCy4TTlJRUseHbNQCHDXHN6
         W+MGSdkmADFDh8S4hgeaDE6inrZo6MOXquLl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707957601; x=1708562401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYh5k8MyiysiewusV+Glc1Kt41gt5l9m2Lg4dhbhPyw=;
        b=DKYeQP+kkTLS48Qw6HRjd1CJWr5+QtuIL39DGOvFuzHX/hN4apGgCIHPMvCE7X1x0L
         DNMwP4EzG9t8B2hBffxW9KbQJzxL4N0zj9L9VDtWVE0LttJ+1jDMd/iAT4ZoKOXwsZ5j
         FpsSzG2aaiGfDZ6KcptFxUqwuYxzfsMwk9SBLAe9E55pltvII6LhYmaLrPN+DZ719i9P
         IWpwqGn2ohW6ZrsNnowbtM/xm357EMxRDlTCFP/IPjwYJ0PTHvt4Ce6J9IW/fxtXndzW
         OVIsKl7BdPjiIgtz2nTypDblHTw5Nie8JnjnCal5FDf3OEAy2PH+dQFY6S62UBqfHbwv
         oVQg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Umdx+gYXCh5EEZKpMLfoJ0nTjMQoksyeK6jGEavO4HQnpnnOLCx84VPoHCnfqBCsshKgrY0LsvnxKZMs/lFrzfveTlYJPDDtIoE92Q==
X-Gm-Message-State: AOJu0YyOTLRrbgjtnUT/FxzpjfY4cbgPwJ0XzXujYdfD2U9b96rzAmTT
	bVfqh77zaphUcf3Up2LAQTlTbZesaJ7tJOWGWmLkiip4oSDYnq7P1XB5rjfbYOW/0wggAWkYAXI
	gomS9
X-Google-Smtp-Source: AGHT+IH2hp3lYKTlWlKfdlLImU2M7Tz25DAZf+SjcXiU/+4E2hytO5cYXHDEzM15nuss816nNJVM2A==
X-Received: by 2002:a05:6512:a90:b0:511:9e8f:b907 with SMTP id m16-20020a0565120a9000b005119e8fb907mr299073lfu.51.1707957601411;
        Wed, 14 Feb 2024 16:40:01 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id v14-20020a056402174e00b0055ff9299f71sm55629edx.46.2024.02.14.16.40.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 16:40:00 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56101dee221so2265a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 16:40:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLoq/kAerCXgoLsGXlRXAxujLs8z0vy6ebshfIe+AvGhR/WOlJ1T/OOFAispicIXPaCtYI6oL5fmvvFRVu2NU0Z95hcjBny1wD/cg/nw==
X-Received: by 2002:a50:8d13:0:b0:55f:8851:d03b with SMTP id
 s19-20020a508d13000000b0055f8851d03bmr333252eds.5.1707957599932; Wed, 14 Feb
 2024 16:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-22-swboyd@chromium.org>
 <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com> <CAE-0n52qgKrasAw1AbZ97zMk1xz6P4KkxNLi4cBpNKy5wWu+1A@mail.gmail.com>
In-Reply-To: <CAE-0n52qgKrasAw1AbZ97zMk1xz6P4KkxNLi4cBpNKy5wWu+1A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Feb 2024 16:39:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAcXs1hmJB_Rd42+Q3gQDuw=2L+igCyWnnnSYtqdifPA@mail.gmail.com>
Message-ID: <CAD=FV=XAcXs1hmJB_Rd42+Q3gQDuw=2L+igCyWnnnSYtqdifPA@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: qcom: sc7180-trogdor: Make
 clamshell/detachable fragments
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 14, 2024 at 4:35=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> > > -/* This file must be included after sc7180-trogdor.dtsi */
> > > -#include <arm/cros-ec-keyboard.dtsi>
> > > +#include "sc7180-trogdor-clamshell.dtsi"
> >
> > nit: Not that it was terribly consistent before, but in lazor you
> > remove the "This file must be included after sc7180-trogdor.dtsi"
> > because (I guess) it moved to the clamshell file. However, in other
> > dts files you don't remove it. pazquel has the exact same comment and
> > it's not removed. Pompom has a slight variant of the comment where it
> > explains the reason (to modify cros_ec) and it's not removed. Could
> > make it more consistent...
>
> Sure I can make it more consistent with the explanation. Which way to go
> though? Remove it from the boards and put it into the fragment files?

I don't care too much. I guess I'd lean toward just putting it in the
fragment files just to copy it fewer times.

-Doug

