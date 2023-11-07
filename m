Return-Path: <linux-arm-msm+bounces-64-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F77E3AF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEBA9280F27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEDD2D05C;
	Tue,  7 Nov 2023 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnFiixIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD82D052
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 11:18:46 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC8B11A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 03:18:45 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5b35579f475so64573537b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 03:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699355925; x=1699960725; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQGe6mNztA93E1vhMaP9OoY2/CZNCEpDDK/s+WkFPnI=;
        b=EnFiixIytwk3XoCxhb3yPTrknvALwow6D5TsvQnzBJwNpCecBOyzkhJ337yXvCXdvX
         vHzjxIJnCUmIy9HpxrFhtKQoJ783iHCkUmF0OlOpZBHcyd6yXdW4J8528FIBO242Y0wR
         pwW1GUbPVplxMJ1ZyITIyPqjZt6vKRC+H1fXUJrqU7PWXkasbD2iF2M8WM+HrqDBGaE/
         7JEZ3D9QW1DLXzDUsWntDgAiyNK2VHaMLp2wTVOxvqSIcsugqlOHLxNw31ka+Jn09oCe
         +GJI0e2a+87rIqUnOIhY64ThY1FbbWd+C+CTJjsCe/CtLnrvRONVFV4oc9iikj2HS+RH
         eAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355925; x=1699960725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQGe6mNztA93E1vhMaP9OoY2/CZNCEpDDK/s+WkFPnI=;
        b=eVbABWx0Q/pOUfavjmaa5/ofnulC0wK08jF1Cf9Yxu6cxHP5IhknapBCrv/Yn7UAs5
         sYfzzg+OPYaSQ4W1RJBccmklLNES8FxVjAIKbDcmc1VzZnxDy1NIEs4H1klRp/nhtZTJ
         ORCt7QjfTCCHbGN8EZbVDsvKBgwm7F5prgBQJ7cFtd63jR0ZcFoDp6TEwsEJVP+DyWCP
         IR/u7pLdmwc9hccFyqedlEW/3MVBBV/o2jvQfUitaDkpX/HEZj/DKfGoe1EZAJQ2suL2
         tOJrP98DZedw4GrJEGLoWwpb7PQgW9eOuDykwu1K/jMxiHH8x0iXJMUDQDv8sIShCoLl
         NdyQ==
X-Gm-Message-State: AOJu0YwNnnOjjUzYJEyYwJ25YkL6vaznO0K097umIriX5x2Z/UReFmTl
	vuHZ+jyc0Z/Z8/uyHDEBv2ARMhsm6V55u71O7JuGQk8utoJeV3RnZHpOdg==
X-Google-Smtp-Source: AGHT+IFFsEhPnerAY8XwonvVxogJKJiZC9RcaEADdZ7gCKoSrkvwJ/ancft1LPF0r9cwbvoXEpKqianptNR/KAZyYJU=
X-Received: by 2002:a25:900b:0:b0:d9a:e129:92a1 with SMTP id
 s11-20020a25900b000000b00d9ae12992a1mr31802617ybl.54.1699355924917; Tue, 07
 Nov 2023 03:18:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107064545.13120-1-quic_jkona@quicinc.com>
In-Reply-To: <20231107064545.13120-1-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 13:18:33 +0200
Message-ID: <CAA8EJpoLaXgxue-+pry8VK4Ln00Dk-jXG_Ev9ot5k8bbonP3Qw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Fix SM_CAMCC_8550 dependencies
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Randy Dunlap <rdunlap@infradead.org>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 08:46, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> SM_GCC_8550 depends on ARM64 but it is selected by
> SM_CAMCC_8550, which should have the same dependencies
> as SM_GCC_8550 to avoid the below Kconfig warning reported
> by kernel test robot.
>
> WARNING: unmet direct dependencies detected for SM_GCC_8550
>   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SM_CAMCC_8550 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
>
> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311062309.XugQH7AH-lkp@intel.com/
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index ad1acd9b7426..dbc3950c5960 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -767,6 +767,7 @@ config SM_CAMCC_8450
>
>  config SM_CAMCC_8550
>         tristate "SM8550 Camera Clock Controller"
> +       depends on ARM64 || COMPILE_TEST
>         select SM_GCC_8550
>         help
>           Support for the camera clock controller on SM8550 devices.
> --
> 2.41.0
>


-- 
With best wishes
Dmitry

