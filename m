Return-Path: <linux-arm-msm+bounces-5704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 298D181AF0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 08:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96BC28517F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 07:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14488C140;
	Thu, 21 Dec 2023 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtjM9kXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB2156C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so430996276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 23:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142260; x=1703747060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6wpIhIIkKbfmQDK+4hse4W5EZyzLtZMXzLX3pjH6fvs=;
        b=PtjM9kXhn6w2otIztfTUBCqRPJcfN3Ru8eED0fcnnGoNO41YbnMEztAOJ+mu73+vTD
         GCkfhtqT0giKWw+VJWfj3zo7rlymC2J7m8F/xmL7MJYrmkuvIq+QkcjKCRSo6CsWbSrg
         xE+5w2S+rKIR9saZeVurtIAXZBgy+Xd0GKWRNr0Ew8XgoXr3dVuQQqjh7jzugdEs+Kgu
         4U3aCPaG/rWP1f+i4OtjZYXXKhsVwIo8cdtmAI2ZWr2mFj5gF65FTduXPVHDDfO4CDGG
         AZj+NdJ6KXmQrBU2Gdijp+e3Sxniz6By7QH7DNuHz5Hx/P+lZvke1yGLP2bKOFUb3YrI
         OMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142260; x=1703747060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wpIhIIkKbfmQDK+4hse4W5EZyzLtZMXzLX3pjH6fvs=;
        b=n+tbYCC/pygQ+cfqYvNP6Rn4hRJXn6Oft93Dvu3VI6W7u4SdmpYq9U7kWLfdE9IeZ6
         T4m6Bbd4cw9RGxH8WASr5O4/1rzsnUxNcer3yrm+AJiOMbHZgIzqFRs1hqApxXYbUrNN
         m2DahVciS5x8eGVZmPxbDXNpY3CG5fXhy4x0dkb2jx1SOT6ideljF3CgYy6P9D4e7Clq
         3JIttRBhCvYT9yazBcVUT8sxo/QwpMnKBHmxxj/oAefbvolGW/EcZ6deXFofZdWvqYaY
         98pw9H1WG9X+koX+aXw5rGPVPkOcUDLGwgZugVedsIBBsuwQy9QDNdr98rE5IUGRqTiN
         olJA==
X-Gm-Message-State: AOJu0YzMWeRUT8rusYNGZcElRBIu+QqWsF8PfdE7ujjGEqUI+sDp33Hx
	448QuqVxljsgdfxNdeSxDCL1KXeIVEG6eelUSBAV1w==
X-Google-Smtp-Source: AGHT+IH8VGwOtYOQAD90bjdzKftgC+tg2qjqInOe0HvrTsbZQFMoKJqfRGrCsvOSPtB7DnGgfHXU4QI64uC5WxbFFmE=
X-Received: by 2002:a25:804e:0:b0:dbd:bf5e:2207 with SMTP id
 a14-20020a25804e000000b00dbdbf5e2207mr673698ybn.121.1703142260124; Wed, 20
 Dec 2023 23:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-3-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-3-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:04:08 +0200
Message-ID: <CAA8EJpqvo9MMBTT8mMCZRn3+zOmicbe7=sPZLuqU_sAq+Ngd_w@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: qcom: gpucc-sc8280xp: Add external supply for GX gdsc
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Dec 2023 at 05:51, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On SA8295P and SA8540P the GFX rail is powered by a dedicated external
> regulator, instead of the rpmh-controlled "gfx.lvl".
>
> Define the "vdd-gfx" as the supply regulator for the GDSC, to cause the
> gdsc logic to look for, and control, this external power supply.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sc8280xp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

