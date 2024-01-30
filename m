Return-Path: <linux-arm-msm+bounces-9051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CD8427B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 262A61C22CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 15:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA79811E2;
	Tue, 30 Jan 2024 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JYKw4HzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14DF7F7CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706627577; cv=none; b=mZAMhmPwMh977XZNK6ZjPFW0QH3JYNOhGVdxol5TEwBYFOMf1e4BRF3E+M45d3WKMuHT3I07co9P7UDfLYy0wb/tzmLS3stmrljCPCMqMYWXEMrOMMAjusROiSdA1kPRcwwyfX4zZ5s0dLyMC+KmipwwrxxZMNZHb8+LE3Ewr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706627577; c=relaxed/simple;
	bh=0DFkUFct/ugpR387roshgw0jmipzQatTIY1QClEk+/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJwwXMzlmOF+boiM866Gdu96MbRPYtt0/5JtWOxcWC6hj8hJOJnuqMpER0sziqgsx9Ro72T3pKByK6Tx0E2K6KTlSkVnYcMhtEyl6LU0MNinrVHtleLq60VJXNqMGh5ihfxHc7JypNQX9dcUOdWFzA+BUmPW01bST61DqXcS7Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JYKw4HzD; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-603dc95b8f3so23238017b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706627575; x=1707232375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DFkUFct/ugpR387roshgw0jmipzQatTIY1QClEk+/c=;
        b=JYKw4HzD8UHaCRMuh3hBPjlFEJ3R8jl7CQ7ppDDDRMY8wha2/QSJNQ7LO+ZXeiUEgE
         E1PzSF0oWktF366KA+ZdPzqCJeKCGGnfBSvYYLvhWzGXuYMFYAHXo5cdCJ8nBtLwfHkU
         5h/VGwlnC5Zy7cYX05Bwe0pSMuuiYgwuPMc/ehME9UKQdbF7iUfxAO0kPqCwiwC3tX8n
         cb8c6l4VIJQVAMLqmqpIjwr0uf9bKB2HGcEDkUY9ycoqWMVGXd67CBqw3hjgUHTYgAeL
         aIY5KfBwCOjF190ljJoYpiXVqreyBzXIq9MPgdxrRS7Y3yefVGx88OMpDFlSjP6CY16u
         6jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627575; x=1707232375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DFkUFct/ugpR387roshgw0jmipzQatTIY1QClEk+/c=;
        b=QUM2k8HfWgEYncTTDTBczBWZ1giAiImshjqqi7Hh2r1z81pyA/+dbkpS/+z7HoFpqB
         wfwLGaStqaDBnwveZmZQlDwiyx3yHNwwP3JHl9KCo+ro6gpq4SNLxNBm6nY4Ia+IGlL3
         w2PCah97dsIr8oXAfVBMkiSB0T0zDDoDkt2bUY2bQbKqQ/yl75DKebrYT0ZW4s8ylxvK
         7dWN/q2eYLcyZk/jOf280YmmIX9EtjUEVH/jK+nvc4NDmxexbNcrjz98NEzXj7joIHzl
         yshQhJJLav4SEfzguKiAiZttNN1lOpSQHgZVPvNp24uTMWrVB1fSvgKsqIp1v9WtrTxU
         h1IA==
X-Gm-Message-State: AOJu0Yz/LUlxBWjGanJLSTfJGQ2avdG1ea786ZHmUGE8yr2+yGc81K/4
	JXKjGIINf9PmR8F/MqS6yEk+AcQ/asblAoxu1NkF5jH5tSLPq06300NGKQpsEXz2hn0Lgs9o7Ah
	JymRt7HYyPH7nVSmHhaM9zKQXh0hTofQHXvWqvg==
X-Google-Smtp-Source: AGHT+IH2LCbeMRSP9X7Ok3vkK3v+WUD6xQZxMdyDiVi8B1Q07WJwPWe+Zz0oJ1EcFj1EyfZwcK1Vi2tiEtpfMGUKcnQ=
X-Received: by 2002:a81:c406:0:b0:5ff:4a64:a8ec with SMTP id
 j6-20020a81c406000000b005ff4a64a8ecmr7620907ywi.38.1706627574732; Tue, 30 Jan
 2024 07:12:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130130930.18683-1-brgl@bgdev.pl> <9016fa2b-fdd6-4124-a53b-e06d45acd673@linaro.org>
In-Reply-To: <9016fa2b-fdd6-4124-a53b-e06d45acd673@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jan 2024 16:12:43 +0100
Message-ID: <CAMRc=MderwyjSGL3vhFngSnsX2rA3Gy7UG+9UFxsgryTcvdjWQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: dts: qcom: qrb5165-rb5: add the Bluetooth node"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 3:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/01/2024 14:09, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This reverts commit 71a73864e144aadaa582fe8296ef73fcf3ea7377.
> >
> > The bluetooth module of the QCA6391 should be represented as consuming
> > the power outputs of the PMU and not the regulators that are PMU's
> > inputs. We will be able to model it this way (together with the WLAN
> > module) once the pwrseq subsystem gets upstream with a dedicated driver
> > for the PMU.
> >
> > Thankfully this change has no corresponding DT bindings yet so we can
> > safely revert adding the bluetooth node.
> >
> > Fixes: 71a73864e144 ("arm64: dts: qcom: qrb5165-rb5: add the Bluetooth =
node")
>
> I don't think that dropping more-or-less correct DTS nodes is a fix. A
> fix could be changing the less-correct DTS into fully-correct DTS.
>

This node was added this merge window, the bindings didn't make it.
It's not used anywhere AFAIK and a better version is coming.

I'm not going to insist but I think it's useless right now.

Bart

