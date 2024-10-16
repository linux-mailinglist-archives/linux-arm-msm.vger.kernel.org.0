Return-Path: <linux-arm-msm+bounces-34577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0C9A0708
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6B2289750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871E6206E6C;
	Wed, 16 Oct 2024 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2G/BbQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE4207A16
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074073; cv=none; b=Mwvu1vSJJKltlidkLvNYQ1kXFmTQBSYT5Dft4sT1+y/EKlACpPYrmxlX2ev9QTVHY21PfYggF1YN1as70JZJYMCsdKvANg5XoQfmABDmn06psK5yRVoKN+YckWWC0C07zExYcEnqaRy4wlKDfLPj4Qj88KdcgYveT50RRik2ovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074073; c=relaxed/simple;
	bh=+vjxN3bVpSF0tBOfRjKZ6xoE3GHMSenDIePKfHckiZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9EWyPpBi6stGjY12o/G8j72WrDorejlWhrAKm2NxQ9RU/AQrlM1q3oUaLyRHHgPamq6MVD2Atjp2o34Aug5WOlRhF2/S5+yO3pqkIBYC4ghiJi0P6lteuMA93cbf8An4SqAXyT+vwbMPdMvgFBbwuGuMs5mk3apb9KyacdpOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2G/BbQF; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3110b964so53330771fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729074070; x=1729678870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLdut8E3E3NtKT42b9sOuPXdXDsonyxQjz/a9BL8yAE=;
        b=f2G/BbQFpmBXJBbkDNZNNXk6xlbfgCDEpT+bXHf5tDm9aY7/5X/+xwlC9VE/rTSTjG
         VyZKPloBJecLWl29tdZiahgcRhi+4xQQ0uYocJ574gsrtgTbQinTQqFKJAujp0Uw+YJo
         6ImkbHoGzYhwBLAZNh//Ksw8af9+Bcovm7vu2Yg+HXHWSwOKppg42UY9EXMlva+RrOWe
         mHIAO5wdxDvM2HYqEFwF6wxS71TuZhLZ3lzhy6lAkSsO4BIPjGVXJT+YFqaIDo7q+Ea1
         ljf4hAmAVTZNn0I7NGI1vid4IiE2Sta7WYMYXgQIN/QK/IW2s07WCGMslg4UHEH3cSJY
         H9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074070; x=1729678870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLdut8E3E3NtKT42b9sOuPXdXDsonyxQjz/a9BL8yAE=;
        b=MBWPkhNel11zc+PbJfrYrBKcvDU2vam+hQjAZFHxdjOjeqbtb2klQzQl9IkVnCTtF4
         fto3kJs1kkJDBnq6QQ8aaPPg2VBH4/ygSASaVAECU1PqDDLWo1vj/vAXXgtAE6L/bjgD
         d9NDobGiDF8Gi9nriFKNlvFo8rQaASaGMAgXRWTjC7vObO3aNpXfDizwbFaHj8zriFl1
         9SZ8VYg42yz3mk6EbHjkhq29iyWLpXILwcT+501QIyOSfBwO4BZ/3PC7kC2h9eosmjKc
         WapCz7XkhTDdVKM16Jo3XfbSgk229tS++SZTiSGNhJE2sWypMY3xRcsFKCkImui97Nj4
         rETw==
X-Forwarded-Encrypted: i=1; AJvYcCV8bKFOF+tNUEOhRBC062QNcEisEkxMPw5zxM3HmS/mxYwef9cyrE2niR6j8ORVVNYbptyuc3F2lXd6CEqm@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIzRZ31asyZ3zn4bjrDdtH7NNIImFePbQEqOgGlUpEKaQ6cCV
	KBM7fOlrXLNTL0b5WS9ATPq81CCCIpNSq28yL8mY9rGuku7GaNrvhDhMh8/GZVY=
X-Google-Smtp-Source: AGHT+IHfqISBcwOLeSQZDV2YK8lfIG4NYRGTSreBdpNCo7LHjqixn5TrNwC4CIw/gihbpSQ4m5WEBw==
X-Received: by 2002:a05:6512:3d23:b0:536:7b74:ef50 with SMTP id 2adb3069b0e04-539e54e81c1mr7747993e87.18.1729074069649;
        Wed, 16 Oct 2024 03:21:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff366esm407072e87.168.2024.10.16.03.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:21:09 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:21:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Message-ID: <6y6bb3vbxaffmaakxv6m4l652rinbbhtzyekxeupdfdvtqooil@e5bjlq7rh2y7>
References: <20241016-qcs615-clock-driver-v3-0-bb5d4135db45@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-qcs615-clock-driver-v3-0-bb5d4135db45@quicinc.com>

On Wed, Oct 16, 2024 at 10:59:42AM +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC) and the RPMH clock
> controller for the Qualcomm QCS615 SoC.
> 
> The QCS615 SoC is added as part of the below series.
> https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> Changes in v3:
> - Update the gcc_pcie_0_aux_clk_src to use clk_rcg2_shared_ops. [Dmitry]

Please don't send the next iteration unless all the comments are resolved.
Sending your reply to the ML and sending next version at the same time
isn't really a good way to work.

> - Remove an extra line [Dmitry]
> - Link to v2: https://lore.kernel.org/lkml/20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com
> 
> ---
> Changes in v2:
> - Update the compatible in alphabetical order for RPMHCC bindings and driver.
> - Remove the extra ":" from the GCC bindings.
> - Update the GCC Kconfig for some required configs and move the GCC init
>   from module to subsys_initcall().
> - Link to v1: https://lore.kernel.org/r/20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com
> 
> ---
> Taniya Das (4):
>       dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
>       clk: qcom: rpmhcc: Add support for QCS615 Clocks
>       dt-bindings: clock: qcom: Add QCS615 GCC clocks
>       clk: qcom: gcc: Add support for QCS615 GCC clocks
> 
>  .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/clk-rpmh.c                        |   19 +
>  drivers/clk/qcom/gcc-qcs615.c                      | 3034 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
>  7 files changed, 3334 insertions(+)
> ---
> base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
> change-id: 20240919-qcs615-clock-driver-d74abed69854
> 
> Best regards,
> -- 
> Taniya Das <quic_tdas@quicinc.com>
> 

-- 
With best wishes
Dmitry

