Return-Path: <linux-arm-msm+bounces-64634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75127B0238B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 20:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF903583118
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 18:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0F32F2C4A;
	Fri, 11 Jul 2025 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoHqdOg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808F5383
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258241; cv=none; b=MKexAnaBsUS8LOn2GjUgmj4QkHtNuSOw1y7VfNu1ND4cvSEik/l8W7S3b+xnlp8fIFNM8L28aIIZs/XE1ABrdEeTrHZDmN969tzXMFRkL50WbFdcgtDJQMFDathz7tlLaIUKevfqTSCTJMl6oCb40/R7L7ugWfuWdk16lIIi8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258241; c=relaxed/simple;
	bh=oqnpzafFV0ZoAjP9+YkXIuQgzQ7Z2BnDR3jdUDfSn1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXohOD9s9JN/FSrmbYi8EeeQzKIUyiSSUxxrVPDaNN0ur0FAtGd4glK9Cf7vQ5dQi5tzjQ2NCS1QZhZoPoDOVYiR+MLh8jVR24MfVDRHXHvg5HBCiAVUlJdPynokOOyVtnQmKuiKZiziiHCy87DQqKbbPIBIp3BRz+Gm3F+fAhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoHqdOg7; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b7123edb9so26774871fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258238; x=1752863038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn9f3mToefJGhAX3nWeu5w3wYZCnJamomvhjD+Ab1ts=;
        b=WoHqdOg76g00mtNGc9b6mI0r8aUJGHSi/kYqVz3FrcupjrccaiUA5E81IOhiSNG1DS
         DLOLJj05TSt77p1GeeTXxr9G7XXwsKmTy8wbas1cYl1PxEnhR9TqSpAORx054LeQCvMq
         cquUu8MAw2D1CblyKwDcaeKBzE8tIsYqLUQht4J51PuY5L14IDVKK/hD2Gg2JaIQcqtT
         QmM2XQ5/HFiU8G91SFF1z93mV/IaHcalFlT1hEJhIilbL4rgm1eVPW+JrmTFvCZWJW/N
         gDs4Yn0ISsIdz8vEo5U3PqeflH3xamUoMoW4snzw6NTBR38aeOGU+bArfbAw7WbZ0zPr
         HF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258238; x=1752863038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn9f3mToefJGhAX3nWeu5w3wYZCnJamomvhjD+Ab1ts=;
        b=kmRFAEVZe9y7Wubm7aab/Zvwe39zMk+DqMKvc9Z3ggZJYvOmDWrS8HX9wb459k+7f6
         1+wKqw64dpYK2DMH9aRa8fcGGxdMmuk7zzWvX95uMwJP45TyL3NfnFM+tFy1XDhZPk5q
         K11f/1v5nHSU3+/ceJMo7YLr3xAWZuLkXdmMfDFDYHT/bt+Uh6hySNQfcV/RIw9NEzM2
         ZhTi1/elON2ya5o/yxIMMzeUEKQ81P0QH1ze9XFyPmkY2anYe4gS4VbUYzkTlL1n7wUe
         72JmDuXWRx2DanZL6Qjhll9fjq1giWTXQJA2L1kIPjtwVNhLcM+AjHBT649MYwoPI9br
         chzA==
X-Forwarded-Encrypted: i=1; AJvYcCXnuzC+6f17D3xYLfTPZ+fU/saKUbMJ8GHQpFziA8NqFQHYgODEWEqQyzxLBAHOIU4IrpQ0ohS1it2N9j+g@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZ6pNMUbVG4lyCSRt0DyoPeZ4zzGk5ev3rDJvybiGGeWmnf37
	RuASHHNfamVdjx2Bz/+m43Np5qmHkuvV+xbtTMw1fiRYmnni5SCeVo1bx8iV6KPbOaj9mIU4tam
	MAC0yJ2dmnd6VCErZ1tr1B6sQznDqkZIv9FAd3g1RXg==
X-Gm-Gg: ASbGncs5CFOgnwCMqTS1BjnxvIJMPFUkJfTKhNliL9GPh7aHrHSza1t39cjydMaExaQ
	ID4RVmsDk4kP7MQrvS+g2Dd31QCPtzuUatTGM5xtz2NQIZDK7YWHzgk5eWDjpExlpJkTTVFFXwb
	/K1LqADAW30lAe8gMGVN05Dz8yMbQjsxrJU9JFkECaOi/HCQfaeykS3hgTrXEnqXaAAfDUwS4nu
	6XuN1I=
X-Google-Smtp-Source: AGHT+IGtCjuAm6H1PqMHwvBz6rzeqlA0wEu1fJowmdiyHYt3WhUGaKpgqvny6J1SrAMvLEx6RSED9oPi9oqyZbgq9O4=
X-Received: by 2002:a05:651c:1118:10b0:32b:47be:e1a5 with SMTP id
 38308e7fff4ca-3305359ff3emr9390161fa.39.1752258238428; Fri, 11 Jul 2025
 11:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:23:46 +0200
X-Gm-Features: Ac12FXyyCEbHvtTkJzK2mrQiawaykksuUjl6fIr0994V2EB5IcqiLGuqcPuxELA
Message-ID: <CACRpkdbUo21S-GPPrTpwhExVqm=XbE+juQfVo=VddOks79La2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add support for PM7550 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:46=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Luca Weiss (5):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
>       dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
>       dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550 support
>       pinctrl: qcom: spmi: Add PM7550
>       arm64: dts: qcom: Add PM7550 PMIC

Patches 3 & 4 applied to the pinctrl tree.

Yours,
Linus Walleij

