Return-Path: <linux-arm-msm+bounces-14040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7F87B1B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 20:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87990284A73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 19:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96ED1481D0;
	Wed, 13 Mar 2024 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHUsbeIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E5A21370
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357544; cv=none; b=HRD1RPo4O+pvdicUlQl3PxC7D8Ei7M8OxIBIameX1SEX9i9X5JeRIn3ta2EjUVN6ncaq6r1n6fefRNQ/wZvqADnhF1ZjydGFV/dTXH8d47O+Qeylw4bZIA7iMtFsw2FNEmZhNXNVEYvCKzeTlAluObAA2LEEhDJa+rlm+VjTDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357544; c=relaxed/simple;
	bh=bIUZn3aP0gfZBr2TfmWOdy8wk4pGXFbADHlpjXkL4XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3jISgLmsyylPAKFmUWl5YOJjMBPPqw3vdbgwVWLl5dfnBNkxzds8759yQse04RN0g0rMRPYwl8PWluyiCSiBWXDjP7N/IEC5/EWPjzHzrUwZEpI1eA9sCOO8qT+d3VRBQ0zAjJELO/enkM0I+fXI8YxARwWul9RSSigANMGcM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHUsbeIX; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso97385276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710357542; x=1710962342; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NWiDzUL96PYX6KoSc2593RZofaceS0QVcGsXtgoFgXA=;
        b=qHUsbeIX9fjZeadf6qPIg9HrtDL97qVRQb1DvOflxSxujLfuv6Bscn4iWz5ksGfnff
         /2WmJN8zpCbaYfbJVpVByBt4qkoZinv9l/1VBD9rXMK2BLHFpN3vsbiyJHqsZpyegkk2
         aWwfmANWOWb7b2nUloSRo7ozK8C/XuvvReirQH401Wr2zMYYs/H3edtaXUr0ndTpzXXA
         AfYfAUfd4VTIGXpPUl3GIXW/MqCC+SYlVcienglIllweILeJ0YfPUHoE3prOvqN9I/NS
         3gOlwYjxb8EaNsdUhrZurghLRS5eGY7/XvczdttRuZc2DQXudt8zOgkdlJoRy3FvyQu6
         XHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710357542; x=1710962342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWiDzUL96PYX6KoSc2593RZofaceS0QVcGsXtgoFgXA=;
        b=ipaI3sCDPaB1mWzoJHy+GLV3Eywzfr7m0SUo0tC3g89ex7aLIW/uuQsarNQKf0ALmH
         djdHF8vauHcZK5eD8qTxcspgefNE5rtNKdUcEjGO55EfSEqnwOlA3w6YN5pb5StaTWck
         Oo+WZT0/7DzLhEAyaxVRSovRagNMfpOTNJyMQfP1sx4SWU46qCMjWIf4nly8U+MbxgBj
         0XNIie7LxlgkGQRjH0Yq2AVzO6qKte1iCwYGarj+1C2fLMc40wI9MgWlgmXEvQiN05te
         3AxnkB8JdkrIRBMKnNSmcmyluIMLStUgKAQWPvZIOjnnTrFbX3laFsNa77MB2CUSyOH4
         MkPg==
X-Forwarded-Encrypted: i=1; AJvYcCUguZB84STB4ADzg/wFLqAGHOcx0Sfmf5H0PjagmqKbRqjJKRnQueTea5ul/kd/jUqwdeaYXlweIjA2kLTZ9Y+u3NUOga1on76riiuEvQ==
X-Gm-Message-State: AOJu0YyVmmh2y44vm/yvjKnkAeacK1E2HUEBEFWi718avCt26A168uAe
	dUn65dEAkJilak1N50lr7QgF/1A3G52ECydMLctLW83/BZCObFtNeLHnQQxbU83JxOqDBbe6dZd
	lPbRrPraBj/c6G28/6hSUzE7X1wrLR8aMMK6An4jo5usn4YWx
X-Google-Smtp-Source: AGHT+IFU7XaSo3A/l8xJAAdcNlGfxW8d0srSAclXgekCo54a9GIxv2R5mYBAQ+dt89qG6I1CMDsau5GjmmEWzVp9z7E=
X-Received: by 2002:a25:ac9a:0:b0:dc7:5a73:184e with SMTP id
 x26-20020a25ac9a000000b00dc75a73184emr3449403ybi.14.1710357541837; Wed, 13
 Mar 2024 12:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-videocc-sm8150-dt-node-v1-0-ae8ec3c822c2@quicinc.com> <20240313-videocc-sm8150-dt-node-v1-2-ae8ec3c822c2@quicinc.com>
In-Reply-To: <20240313-videocc-sm8150-dt-node-v1-2-ae8ec3c822c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 21:18:54 +0200
Message-ID: <CAA8EJpqsQr2nfDbW1JRyBoNSemudgrpxCRYH1y0ayX2Wd2u=VQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: videocc-sm8150: Add index based clk lookup
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Mar 2024 at 13:11, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> Add support to look up for clocks using index instead of fw_name.

Why? You are breaking compatibility with existing bindings.
Also the commit message is incorrect. You are not _adding_ support.
You are changing name-based lookup to index-based one.

>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sm8150.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index a0329260157a..2b788a03c5ed 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -19,6 +19,10 @@
>  #include "reset.h"
>  #include "gdsc.h"
>
> +enum {
> +       DT_BI_TCXO,
> +};
> +
>  enum {
>         P_BI_TCXO,
>         P_VIDEO_PLL0_OUT_MAIN,
> @@ -49,7 +53,7 @@ static struct clk_alpha_pll video_pll0 = {
>                 .hw.init = &(struct clk_init_data){
>                         .name = "video_pll0",
>                         .parent_data = &(const struct clk_parent_data){
> -                               .fw_name = "bi_tcxo",
> +                               .index = DT_BI_TCXO,
>                         },
>                         .num_parents = 1,
>                         .ops = &clk_alpha_pll_trion_ops,
> @@ -63,7 +67,7 @@ static const struct parent_map video_cc_parent_map_0[] = {
>  };
>
>  static const struct clk_parent_data video_cc_parent_data_0[] = {
> -       { .fw_name = "bi_tcxo" },
> +       { .index = DT_BI_TCXO },
>         { .hw = &video_pll0.clkr.hw },
>  };
>
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

