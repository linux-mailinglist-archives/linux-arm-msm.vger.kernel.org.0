Return-Path: <linux-arm-msm+bounces-26384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0675933381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5672D1F236E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CB078289;
	Tue, 16 Jul 2024 21:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biO6W0uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034562A02
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721165078; cv=none; b=g8bpPyHxiN4Y/WTtewRBnGDcO5WmH+VrUiaOr9fdZr48e0Jho707ihOGbQAh290BDoz7WEWfik3/QezFT/a/dgcfmamjHLnAMiblJ4yncZpq5J0jtx3ugeleVCLJwOTXpj8axU9YzpGyWQG3oj1ZKK534nhzE+VqY+7o2RDybdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721165078; c=relaxed/simple;
	bh=sPs4PNFGR4OdzkX2auFHc60O2CFGJjvXeNJujwKmTZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JiVs+LQt6sjAQ3aRFK8hugeWO9hAnFbcKSmSboMIrFEw4KmCWcMDQlgmP2XV04at63VanVamXcHTsnSeLc4GNx4lbYc5ePrLZ82ku0FR0QSAQEvD426pNAt3/wIc6U1QI2mp59K/BTEWk9iknQMHnBwSN/JNfhTf3WwUDvJb1VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biO6W0uk; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-65f771485f2so35313127b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721165076; x=1721769876; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gQRdC/2kvXyGkK2vcAJKjjyUUocgpd8dsZecLG2PFfY=;
        b=biO6W0ukakZ4Qgh1P91F+E7cFAQgats/qTN1TuaQL58imdfpvCHvnXJlnUfRJFWAMO
         l9zFQp+K4sEzQ4q3p3oUGbuDyS3H9QdsURJGdyHSYFOEH3I1ct1ucfEWLK9ZEAHK1vEo
         1ZU4YfavXA86AdSB8n2el19KWPAZbecQAZpoDhopvIo6Xix8U0HB7Lbi0/RRP9gkJCvV
         ZPSDThYlczU3HB7GMdTksmI415fLMY23fDmsqi97Wd/iRhGidmwzqDyMuVYFZ3S+W6eE
         e3eCxsNeC+J/D324GvoSlc2m5A3x+V4YhfHR5O6ITedU/n+t/h5xoZ/DgZuh4R5zcmIJ
         fwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721165076; x=1721769876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQRdC/2kvXyGkK2vcAJKjjyUUocgpd8dsZecLG2PFfY=;
        b=heMElLJpMBEaKKk2Fw5JyNkhV+t+S/GRDWNFokrOtSmFJEEhOKAhpraDzBI7WYL7wQ
         eq/q6OK+pAZrxS7I8TeWQ2N9R1ZBSDacrlU8KquHWLx1pD633K/mdZAXDijwrfx4RtxO
         SPSKlEXKv9na7/5Zcs2r/XltrvK4tmRwebBgtXodq1VDzTdubSbhReAK+kWDloZ6gOhZ
         w972R8XhsJ0K+9G1Kz/oKQ9wVp9QCCmdK7TZ+PvICOMDunPtPCnipqwdVJItSEH98Ymm
         9wa3ilW/0tM0l87cnY9UKdsYpupp9NtPpYbB9XP8ewRBJEbV/O2qfGCwzxZ9zlhw1NiR
         1p3g==
X-Gm-Message-State: AOJu0YwESgXozxmk/lHFlnePA/tTJMNa4psP3B2K+0V8PGD9u0XNRPgK
	vgBXXjCETzvisAEBesahOZq8ayn7be4mAW6WNy2tJZmislX6kkFT/szo3IBWDYsPlJbEx4I0x7f
	myn33XgYqBQucb4/ToVg4tWAEeEwUF/gavjr5Jg==
X-Google-Smtp-Source: AGHT+IHukAbIJAtIf+1bmFomAwMWZ4a7Sq2fAk/2Uja4FHdmLbwtMbr5cxth2mf7+/2iD5lynbk/3IwoC4vEU9YiHhk=
X-Received: by 2002:a81:9e52:0:b0:65f:8209:3ede with SMTP id
 00721157ae682-663811feeabmr36266767b3.44.1721165076195; Tue, 16 Jul 2024
 14:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org> <20240717-dispcc-sm8550-fixes-v1-7-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-7-efb4d927dc9a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:24:24 +0300
Message-ID: <CAA8EJpq69nuvQc9FkoBCZ-o1avH4kU2_msNNRZaTD+YASDkErg@mail.gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: clock: qcom,sm8650-dispcc: replace with symlink
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 00:13, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The display clock controller indices for SM8650 and SM8550 are
> completely equal. Replace the header file for qcom,sm8650-dispcc with
> the symlink to the qcom,sm8550-dispcc header file.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8550.c               |   2 +-
>  include/dt-bindings/clock/qcom,sm8650-dispcc.h | 103 +------------------------
>  2 files changed, 2 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 78e11eade2ea..9ffcd9eb9283 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -1776,7 +1776,7 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
>         }
>
>         if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-dispcc")) {
> -               lucid_ole_vco.max_freq = 2100000000;
> +               lucid_ole_vco[0].max_freq = 2100000000;
>                 disp_cc_mdss_mdp_clk_src.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src_sm8650;
>         }
>

Of course this chunk should have been a part of the previous patch.
I'll fix it for v2.

-- 
With best wishes
Dmitry

