Return-Path: <linux-arm-msm+bounces-36565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211669B7DF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7E81C203E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32B51A2554;
	Thu, 31 Oct 2024 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KirEsZq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3E1AFB31
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387580; cv=none; b=ADyPE8zAM9825516Ih7FaaPsaBleadUGup3Nl/LIXjTuyHn1kMqzWKbQI3ktW4gMDkOxZKUZuGDVXWgqI/a4kqw7sad0IpqRkQsuNRaIHNBfyaJcBRGEi6SzDK3iqF7Qsmj/EKxBG34CmkON4PGyncRKZg8TLrgvUOGzvCS1paY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387580; c=relaxed/simple;
	bh=kr02wbYSWNCkbF9WCD3f3jrehlBz4QKbygRTAdCmEHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnU/3Yz+ryUOn4FSKyUS2W6f2iV4Bc2gcsn4RzuJ88Gb89edVOXsAaYsa2blS5omv+5aklUC5wqretUQuuShOMIWyeVd5aUufbloXpXX7n5dli1aD6yMJDHTJczqEgnw99uAl+yO61gA+sVh4bEXWOmKq3ItZP5BEUbxg+WQsjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KirEsZq+; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5a5a59094so9262777b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387578; x=1730992378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=;
        b=KirEsZq+exLGPoyML4/+40BDpyFtnLYUgF7jco3Fe1XYI/0jgKqasZapXuRrWGVnmA
         KJ5fL0x6RzbYwNUhd+bXV0a7IfNYnYd+p7M5iz0p4fzPVCdf0zdB1hZIvXbIRNPktaFm
         sxgoKbelcctcSVYKGiXMJE0Mzm3Wa413MqdepmZK0BmhKYd3IsvvuDIuJLXNugYfen6x
         3rJhwSztP3HEpKLMdSKfucGYwDDynmj2VAoGJI7y3eTywcWvtJzKKdi6RY/OxZ4nxBd+
         /tYiVel0cV9Su+jLvN3iyyPQQjIZ0+mzeZ35EJe8psIQLCocH2msX/gpeMz3Cwoet5is
         ChCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387578; x=1730992378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=;
        b=Ba8tIsrENbptyDs2oIVipiTMC6F0XDaOjHOk1fL886rxZIEx/vHc7leDQFGnWDItth
         3/UJsTjBJ8JNIYnyLJNheEPsBISio9Qut83fcNYDfbZ40kdlbQ/dz8wg6BAr55YLovE6
         FB/iZSItJCRkzlSBtxbRBlAJLUkEzM4TJavCAmdJlDDFwtpsY0b2iZM1ycDtnV3pcxKj
         AqCDtRjGqVyL0NE1IqYw6MgYk/7uLmLnfCs6OYZoaSsOgF6nHSoDQe+8Te+lzsBVLlGC
         qiht403K53LTZ8z/KA0AxoQII+JgBW9v1M4iMdGLhJHVoQnOs4IoBazCHl5WIAur4QzQ
         W2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXkb9uIB9sDmT3cAchnmY5YR4RyqDGBF3KF+JdL9I+GQTuhFCC8/Z3627VeV4oxP6QFMqSgbdGF9CccfHXS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8OE0z7cInFVMT5roaCR/zNkGEfFiyehTXqWHd81rZ+X9fUiZ+
	5NjoCiEO0JTzQyZ+IoFGPT5qDABnEKebSGGH+5pQ2CoF4ZXXRg9L4SeVMm1E2hDko0I9GxU+TsB
	1FsYgi14inhx9QtKMSPPkxYtt/gamRHx6W7Y0Pg==
X-Google-Smtp-Source: AGHT+IGlMNJu4DDdD/Y1Axdwvh3uw+1T8q9MjgGCDRsqTJLHxT7tV2PbJ7zg2vq/LGfZxClDt4ZTbCxoj+EvkACSNbE=
X-Received: by 2002:a05:690c:380a:b0:6ea:4d3f:df9d with SMTP id
 00721157ae682-6ea64a8d45bmr3072217b3.4.1730387577820; Thu, 31 Oct 2024
 08:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>
 <zsgdwc6klccdbytdysgl342zllgmb7ttatjh4tnug3unyl7vl3@tlptei23yozn> <1eaa1fc6-721c-46fd-bcc8-9b575d083dea@quicinc.com>
In-Reply-To: <1eaa1fc6-721c-46fd-bcc8-9b575d083dea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:12:53 +0200
Message-ID: <CAA8EJprhyBpEyQYjCPopgEUVGF3ztGZ_6zo-QUPJ6=4VffEzZQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] clk: qcom: dispcc-qcs615: Add QCS615 display clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 19:59, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 10/19/2024 1:55 AM, Dmitry Baryshkov wrote:
> >> #include "common.h"
> >> +#include "gdsc.h"
> >> +#include "reset.h"
> >> +
> >> +enum {
> >> +    DT_BI_TCXO,
> >> +    DT_GPLL0,
> >> +    DT_DSI0_PHY_PLL_OUT_BYTECLK,
> >> +    DT_DSI0_PHY_PLL_OUT_DSICLK,
> >> +    DT_DSI1_PHY_PLL_OUT_DSICLK,
> > Is there a DSI 1 PLL on this platform?
>
> As per the design of the clock controller it has a DSI1 port.

It's just surprising to have the DSI1 DSICLK and not the BYTECLK. But
if you say so, it's fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

