Return-Path: <linux-arm-msm+bounces-7361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EF82EF3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 13:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026711C233C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 12:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502AD1BC28;
	Tue, 16 Jan 2024 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6LCvaY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82CB1BC30
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5f15a1052b3so89152837b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705409782; x=1706014582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qPvAzx+acIKZbhCoWwT8OSWs5JRbg5iaUFTYttPLGXE=;
        b=d6LCvaY4SkmWU5YNL682LM4UXvW0vCI32O9aQZyCkR5s/MdxuPDmBk9EZxdKkVlBhD
         vOn/lyr8093oyg6qreV6CxiL1JOx3L4jmic5JJOQNgY79ChnZcV4vb3j+f5MvGzPd3bg
         V82PLm8HjmLDQVnyAoUDbCLYnrHc6x7FfhRhQaMHmQUYS1tyDc0MUe/UnYcomqq714vG
         nDhIXww8XOC9Me6A/ssHT/qe0w48T3ms0Fczclu1jEAZkBm8QGYOYQI6yhw/9+4uza7q
         pBzOzUpLuFeXolNL9uR9yexuYqUWyLpIm+jC7Gu5ehd33DQSR0J9Dtu4/e33GlplbAXK
         6WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705409782; x=1706014582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPvAzx+acIKZbhCoWwT8OSWs5JRbg5iaUFTYttPLGXE=;
        b=Lb8Csjp98velnUbnK/2uWyhgQxKrg0RIpBmsYUD8NVBHPBlCeZgcmR8Il22NB1J/rT
         GsSfoG5nq2goR2twK1yZJoFk+iysB/LQYUDIDnA/y7jlw5j7Iu/yVLYXSOWT6pCLoI/n
         FwjyVTot8Io3zu/FA5iHE0qsvbVXXfUk5+iMyod/xkiUyyI7PF5VOyzpdx1NfC4fPjPz
         fNa9tpyjRcEUxp5rZmZvYM7fmpmC+yFnkJktY52cjD8NmU6HrFhuUv8nQ8xwzG3HkolV
         uUPcUkHWJLLoWzz2dL9EKE+fwc1RiB7keMK2JzVHxoktR/PxbtcR9y8GD4aFv4UZu2Fu
         vy7g==
X-Gm-Message-State: AOJu0YyKsq5yo+t82M00AtABeszaxsmqbxL7apd6OXuUIyZPN4VLrYEc
	SreNqrW/pkNQ2cC7gNp1SID9FvdXpmf8sXxlpGUjKgOsELe+gg==
X-Google-Smtp-Source: AGHT+IGjE5GhtOos1P0amM4JQFu3eKw1tqmWIYnsnq3XqIvhlz9Y2t2oFk9YyYvvD1PT7sgkLdzkQK3eFQUVOOf4dFk=
X-Received: by 2002:a05:690c:b98:b0:5fc:d36f:b9a0 with SMTP id
 ck24-20020a05690c0b9800b005fcd36fb9a0mr2829729ywb.80.1705409781910; Tue, 16
 Jan 2024 04:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org> <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
In-Reply-To: <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 14:56:11 +0200
Message-ID: <CAA8EJpqPqV_nHxxbo2Vzwcp__hvREjF3bhduGhM=7UpuOgBxTQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] usb: typec: qcom-pmic-typec: add support for
 PMI632 PMIC
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jan 2024 at 14:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1/13/24 21:55, Dmitry Baryshkov wrote:
> > The PMI632 PMIC support Type-C port handling, but lacks USB
> > PowerDelivery support. The TCPM requires all callbacks to be provided
> > by the implementation. Implement a special, 'stub' Qcom PD PHY
> > implementation to enable the PMI632 support.
> >
> > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Still not a fan of stubby stubs :/

Me too. If there are better suggestions, I'll be pleased to implement
them. Greg, Heikki?

-- 
With best wishes
Dmitry

