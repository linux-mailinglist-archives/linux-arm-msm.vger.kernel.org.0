Return-Path: <linux-arm-msm+bounces-5705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69C81AF11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 08:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F1881C21B0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 07:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6B2BE6B;
	Thu, 21 Dec 2023 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzVIFIT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B587BE4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5e7409797a1so5323057b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 23:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142334; x=1703747134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b2l/21lwZTw7IQF7dk4Fcyzt/h7TEeXxjAh9LiPFqQY=;
        b=GzVIFIT4t9JqJIHw2czuo9D4EjjMvO0ZlYwFLq7cWVEm/Ou6gfup/1CiByIChIaD76
         ck7SLlDtLC570+p4DIERV3blTntjRo/kgxeouTfxylNhnZFX/vtytctsZD4LAuHsSDCE
         5PJlrOq1ktUVhziZxizAvTnP0vOM8u+jeoov30ak2iHEUaQQFR5Lqz/6Vab6Y3uwhKNL
         YZGSWGP9UlR/oZzmF10vhonMO46CL0ymUonyd7JbxhopNnUNrLBOFcWQQYFULv9vEB/G
         7A8g153rKvhkC5Gntb6KhBFKceB3Bo8X0Rlf9tXYLXN9Mc3VpgvokSYmL6fE7EEx1hQa
         mPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142334; x=1703747134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2l/21lwZTw7IQF7dk4Fcyzt/h7TEeXxjAh9LiPFqQY=;
        b=KKfpvjH2zqMuBUemJQA0YK7PC2MS7Oh6oAF7nmWx3PEVCZXzxmaNvExsJSROhYxTyf
         G3n8AG1XoihX5C8yCcm7aUkI+g2qEbhx0Cd9MKWQUd3KJ/aRNtKS8dgtgWkWGRdSb1Z1
         jR1D2XRAUPpL7syQ7E+M/7FIZosZLctwn8Un6NMFI2Qp3KxoI9XiuXnMxVg5s7yWjZFw
         RH2w2khwSlttbtdEW+THIYMuLvFxMWINI58zClUFld/e9SUZb1l2rcvxMcikmEIiYMRB
         wW92csSM8l/Z6rzJhLQTzxuyXNYlqP6uXLAqSwl8hh14Rqae7KBMQs8f5c1Yrjbhi6ba
         An0g==
X-Gm-Message-State: AOJu0Yw7/LJYTQ186gM3Ded5+E5uOYYw1oz2PYARwZZgZsdwF+iFQ0LA
	sZIXxmgpXzh4F9FaDZfescGWmd3OU/agge55+kNtWA==
X-Google-Smtp-Source: AGHT+IELCozVLl1R8n3zTGGFMiCWNYuu11PkXOo81lZp2eT14pMFwMTk6tgZ+aXRxGDYl64Al13t8L6euZ+ocJlEixA=
X-Received: by 2002:a0d:d286:0:b0:5e8:c7e4:e7a6 with SMTP id
 u128-20020a0dd286000000b005e8c7e4e7a6mr936045ywd.71.1703142334551; Wed, 20
 Dec 2023 23:05:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-4-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-4-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:05:23 +0200
Message-ID: <CAA8EJppbXZQcMw7UGka4YCQDdEJKD0hda=QdsEyNcjYf9U0PNQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] soc: qcom: rpmhpd: Drop SA8540P gfx.lvl
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
> On SA8295P and SA8540P gfx.lvl is not provdied by rpmh, but rather is
> handled by an external regulator (max20411). Drop gfx.lvl from the list
> of power-domains exposed on this platform.
>
> Fixes: f68f1cb3437d ("soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

