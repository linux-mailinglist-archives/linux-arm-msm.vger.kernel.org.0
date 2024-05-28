Return-Path: <linux-arm-msm+bounces-20724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3AA8D19B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B267A1F22884
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5159616C84A;
	Tue, 28 May 2024 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAY2RnMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8177D07D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896157; cv=none; b=h9vsF8/gTCfQNYv43+X2DdHfsBI3oj/Wx7fpy3bB71ZSSw+ykeHM519Mt+zhvS5CQKuW8NyZ1O3yi2zXvlDwDaqFx9B/pqxX30tZI4nTSrCDLapzSWxfr6FWA2jyP3/ObGVKmYKGpLTcl+58vPUknKdk5hQm6gchQqnEKNL6Jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896157; c=relaxed/simple;
	bh=Xfp2r9ij1P5CTBREktxWD4UygAf6m4hovDM0hqYiyiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMxTWewRal6KBGUlVj1KiYNaksEGV0hW4wRDpF2TWHc8JzfhKo5SRVUM63C7eD5DCgFXfd3Boq1YRIrROBjGkZ8cWKbIClaeJ8hdFtY4QbgkNnHniNFoZsaTVm8ZVTsasK7zKr7jhnUm4O4/soSpgCgBevG1Ei/GPr34CKzrqBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAY2RnMq; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-627dde150d0so7446167b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 04:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716896153; x=1717500953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfp2r9ij1P5CTBREktxWD4UygAf6m4hovDM0hqYiyiQ=;
        b=nAY2RnMqefPp9GsQ5HwjB8VBIIC52JvwHZEG1fLjBqTgZ1lyPzoGp+8EhReVFmL5AN
         77gbMnJ0xhVEzF9SU1Yu3ARhEHwcHV4rIIBwHYmPSfphIF094BiQVoJ8VgFU4cwRtopt
         HxeHUrjm8ige+OPbW/wyRbJxH3LteAP+rBHCIUCE2Dj0zWgQEpidBc1xEp0Z3ouFtkOc
         ipW+XwqHj04f0rPPavJSOqgSzxrS6V2y9brG32qbeL/ExYHrrHUxCB7bs7oHE3W/RT1V
         xpM0uTWrigYcDOaHdjg5JSTSKuj79NyYh0vNMCTEwme2ilu9wSuvJ2QruKJ1D1X6M7KL
         wcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896153; x=1717500953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xfp2r9ij1P5CTBREktxWD4UygAf6m4hovDM0hqYiyiQ=;
        b=kE1uwE3XTJ1jHmuEweehsvX/HUveKDecdEHNAWag/RXVqy18BG2ffDzhkIieTDvQeL
         0Ya+tpYn/2CdDvsUTQMPRk8kV+VaBCqhXVobGOulyY3KmgUN3PtIsEgJb0y3lA9tEJk9
         Wo5/iQP1RXXPNiGricpbYnTHyYITdynZ7QxA/0CV2E/akOom4ToyO0NyN6kRAObnA8eH
         zNV/MOrYl811UKnJxmSPqv+cFfj/4hrawPtYWmNOad0PNsClIOAwHQvMbrp+SW5nYrDo
         Lk8ogN5/AueMy9tMu+4rLgV+FOEVtkR52ShmPaMb6ruwsUvqh1gbXA3ZWAnbxQM+U0sl
         3PMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKrHMeYWbuIsjFX57Um7Ll/Hf317vhnEbe0nHtb8pUSUQ3IiFMl0Prv9camKSBID6OrZjbFrGl1DFa65oT859J5wNOA3/PC8dHmB3Wrg==
X-Gm-Message-State: AOJu0Yw2R2pLtHyI+7QnJ301urmZCTF/4r8OLYFQ+yFacKtDY6GxPU09
	VRmz04JdxQ4xFcEtSdYtKmdoN1Z2pIsmboV7aYvEzKb8G6JHKexZxlf+jcOkAOxdZhlwif3TuoO
	e/LslUZRaXT+/z69V8RTnXvoWde14H0tBqsRg4w==
X-Google-Smtp-Source: AGHT+IHSwsTlGSMEArMj/xYL1c6lzKrxuJrq44fZGDxcHYJAGPi+BVhhdCd/jcFDvVhiG/t2ufjdh49VsD3tEdeK98I=
X-Received: by 2002:a05:6902:10c3:b0:df7:93d4:61ef with SMTP id
 3f1490d57ef6-df793d46655mr7431246276.26.1716896153602; Tue, 28 May 2024
 04:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org>
In-Reply-To: <20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 13:35:42 +0200
Message-ID: <CACRpkdbTo=oJoKmF5SPbSyzpnfrVtMcAL8ZxAXUz59jWm6JkEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PMC8380 PMIC pinctrl
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 1:37=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> nothing special, just some boilerplate
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patches applied!

Yours,
Linus Walleij

