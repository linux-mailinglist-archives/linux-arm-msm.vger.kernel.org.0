Return-Path: <linux-arm-msm+bounces-42327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DAD9F2E32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 11:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2654B1886C3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B192A20370D;
	Mon, 16 Dec 2024 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpHF1bso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0AA41
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734345225; cv=none; b=lPAzZLXHnaSGcXBzEncY65SA93gO3Kgib1inpZVjt9DGTlrAlBBW1rK1KNVW6mn5MD0bnE/nBBDSxLVR7rvLKDRY4nebLEMtND8XCC6auOqQJ/Nxsv+WJWtxAKWZkj1S49ksoFRYxDi6AGYipX0BGW5UNsn3OjlewxPpULZ3KNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734345225; c=relaxed/simple;
	bh=PYwh9Ejzktqnk/4b3X6HTET4UjWYpwtQYwse3ElACjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADn9VgnXBnKS8rGheJlp5lqpkrAVc9d9qM2V+RO3QjNUPnThzHXiir0/BRJQXgxh0XJ0bhYLFkDB0Vrwh1Cw8IRc6MN8s7BaMXJrhOPRz8kfJ8+9WGDbOS+5PuLrEzdnMpgmpamOPFJ5fL/1JG0LccPyR5NXhidnzsmP3rErcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpHF1bso; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so4235879e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734345221; x=1734950021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81rR1eTM9HElymQ2hIkXvkfh84mtbQHR8oN+z/vprns=;
        b=dpHF1bsoXY5M3b7MlnEpOGGHghGom+pSsXU1kbrqQrbtRIs8cx1uhnSzks/KNBTRHJ
         DDh91QvjfyewUjLrjskEBJ1MnZb4EWytNTwFvF4ODS+gBeWYtv5f6ftxVKezxH8bfUxr
         YwSSlNMwi+ALqQRPr5fvgsaZqy/faIRKD0R7AXaJrYOii8bd2oIPpIsA57IDTmvJjAV6
         X2Edqs0XGJwYI9T137tVGg+7dXjgn0dccJ+iscBzpZHBVLieHIvhQ1uxRb7jEvLX4xQ9
         bXpsY8++GJ/vOCrO8STHTESfFnmuiZYksPnnwJz6E0lyh9iKp6Lh2y3MC2ArjmDHftQ2
         oZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345221; x=1734950021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81rR1eTM9HElymQ2hIkXvkfh84mtbQHR8oN+z/vprns=;
        b=BvWEcVeqaFqeP1sboKxl77Y2+0b9Jhi82oCH/vaAwQmlAYtO6Xw9OoktH+Imk7T5Tg
         AzpKZamdA/sKwOBeSTiczGxtTR/V0oufUuFFLTdbBa4y+oDzt5Vo0p7Sfu7o5LqAohou
         DrlEq/bbJUZrfGkvIDKSVqfiJx/nm6ylTvCuFfSQqdqGa9wnB7trk8hKzsgfZEptW2jl
         zZ+NIzLPNP5ynS7PwTNkQ7myThgBWjGvCloVfwodv0b/oS9hZ7fM+ndBQK3Nwy6rllmW
         ctL18+MYXJSuGZbbNF3yZvB81mX+kDepgc9XTq84/7IKsSqtrT85XNJR6p1eChMryqiB
         y7MA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Lepx+F6O0ihk6xFmHU5PBfemlP3OSqAeaBWWM+WWsfnxk7CUNXq/wn2LM1A/dxM8t7rAMMCepDjmRgNA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw++qq1QvJU8Bznya1FNrtd2bPPcYGeehq9KBDKuYqKxx1lvkXL
	JwEe2LxzPRV7XP1rkDbAg0KjLCzEtjwBADENAf821/7Y3YAA82NgwJESAZROHYgu3xXAGWCXKXF
	JbYETKw22mLSIZT5PDrXYgMkBgdLbMEv/aZMxbw==
X-Gm-Gg: ASbGncsu7FfYQWDE+HGV2wELCgvcUXW3NB1td/3NClS5nJ1UC8hKsfNEJAAND/RcmzM
	9GzHcgoWt0J/ggWaq2+qhQ6MOyXOuNFAakydv
X-Google-Smtp-Source: AGHT+IEUf3iLQlaHwj+huKVEu7Rf6ZfMRHEmd0RkbAiajFtXRNVDdgnZzJS2Enw8KLsa6+/B9ivQKuoEjmBWCEUg1Qo=
X-Received: by 2002:a05:6512:230b:b0:540:3561:969d with SMTP id
 2adb3069b0e04-54099b7188fmr3706580e87.49.1734345221514; Mon, 16 Dec 2024
 02:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
In-Reply-To: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2024 11:33:30 +0100
Message-ID: <CACRpkdZ-ZEiGMUPObHU=kw=OUADrRGtxgMc-QC3EaBevp-Shng@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] Add MSM8917/PM8937/Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Dang Huynh <danct12@riseup.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 12:15=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> This patch series add support for MSM8917 soc with PM8937 and
> Xiaomi Redmi 5A (riva).
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>
(...)
>       dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl
(...)
>       pinctrl: qcom: Add MSM8917 tlmm pinctrl driver

Is it possible for me to apply these two patches in isolation?

I want to make sure the patches get moving.

Yours,
Linus Walleij

