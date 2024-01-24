Return-Path: <linux-arm-msm+bounces-8091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4483A34D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23AB31F2B4BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D55168DA;
	Wed, 24 Jan 2024 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSWVwyLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB5168CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706082122; cv=none; b=ktbEcDJuAuDc6p8F8OYr8K5PUIOzl520tU7ml4HJhJ7efW12NoYCyZdFZoH8PXP3o270gGYQo70mkKMThTVK0p8t8Pxhd6Et+22aCjzoPoZaJtFQn443/h4LgdGQ2zqTNeJPGAKhwXUtRmsW4NrT62nGK/mCUpiy/Ib0LlUfYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706082122; c=relaxed/simple;
	bh=OaUKTFa+qvvu5Rsp3TtvsN6u6MA3MqdDaKggac88QpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8Xgu+sw2aKY1Ke2I2A+Fw6Dkh4UbS1oVGCsZi3krSzoXFJSb3mOk27/YrwS4GCcoB/rkg+71zhRzsUv+9qm6IS+DAQn/TAwm5HA0RwloxcWsD1i8ENJnrDAZM6IC+KI8DPpDKUxKoTYB3e9Vqtlri0OsWEtYjtdlfpyzBrc6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSWVwyLf; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf0390eddbso29749371fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082117; x=1706686917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIoS+Yzzl1A1EheZCV/EaLjSj7/UHXg8aEfXVE/L5eI=;
        b=PSWVwyLfLqG1A4Xep2y1UCN5YpeSASGjOa0gB1F13ozFGuF2+qItMCAYMrv13q/xoV
         Xw10Cb+u2mNMU4x2u0kSayR+7+uEg6Ay0tDBNgdBummo/zVZ6mmMSX8oz6CfcyRXj/iJ
         uZjSDRom33uy1jHVBS49ufntW5+GkvVTTFsV7qlMTpSCTwD+hwe9QZgE3mHrwYBQSi1D
         aQFo2os5aLVsWSmlW55Z5UaJnZDrM82Vw9ZrWxCt1ZBpAupyd/aG/UdBxIWIATM2fG4k
         I7G0lLmVcxAX/1ufWifQzpivgiKRTyjSSAsnTE8AniwuEkKLdpmdUx0Xlt4R8Jzp+U0S
         ge+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082117; x=1706686917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIoS+Yzzl1A1EheZCV/EaLjSj7/UHXg8aEfXVE/L5eI=;
        b=bkNJh7dxxLSyuEJtYY6t/OTiVg4BQp/wyiSuk23cQAxJKLiZTh/+uDJAcar/GUkdpv
         w3Cov57SMaT+2tmzqMM5L1+FegFdsqBOk7DRJLD11mBzL/kPpGU/gENc2BSKPFoUSuPg
         dr/LB16TUjPQc8sd0wELwkuAoVDxSdB50iNR1JvZAlyf0OCJW6VRuFddWX1Ukh+rFtE4
         FqncAbMhtwIqZP5BvQ5zpE4SCPvFhUzr+IPkanz/wIRHrlpI2pYoqoPaVlPyquERQLe+
         Zx2oyRGnrCZiIXXe9fuz2gEWN/jjCJ+g3asESQ1yoHV94SqgHkT0pXWRNkbMI9xSwuQ8
         DTwg==
X-Gm-Message-State: AOJu0YxjUrWf0qCHm8HaycKGCgJJE1dJCIfYQpCoEbw6ievS8/t0vdNP
	CPckGcWCmx398woibbwiJ61ydWoY+JQXyI1+dJ15ru37Iip9LYOnTc7HZ+KlKZ2C6A6hb8n9org
	H
X-Google-Smtp-Source: AGHT+IFL6Gd+P2an+MzB5i1gCcD0NpuAS/4xvV73WbPCTiVtNvIA8qk4J6qMXgi1WiQ2hCXmZ1Cddw==
X-Received: by 2002:a2e:88cc:0:b0:2cf:2783:fadd with SMTP id a12-20020a2e88cc000000b002cf2783faddmr134100ljk.78.1706082117202;
        Tue, 23 Jan 2024 23:41:57 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ek22-20020a056402371600b0055ca93f3930sm513785edb.0.2024.01.23.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:41:56 -0800 (PST)
Date: Wed, 24 Jan 2024 09:41:54 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 00/12] Unregister critical branch clocks + some RPM
Message-ID: <ZbC/QqfTvJ09KcZN@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>

On 24-01-13 15:50:49, Konrad Dybcio wrote:
> On Qualcomm SoCs, certain branch clocks either need to be always-on, or
> should be if you're interested in touching some part of the hardware.
> 
> Using CLK_IS_CRITICAL for this purpose sounds like a genius idea,
> however that messes with the runtime pm handling - if a clock is
> marked as such, the clock controller device will never enter the
> "suspended" state, leaving the associated resources online, which in
> turn breaks SoC-wide suspend.

Generally speaking, HW-wise, if the power domain of a clock controller
is being disabled, all clocks that it provides are being disabled.

Are you saying that is not the case ?

> 
> This series aims to solve that on a couple SoCs that I could test the
> changes on and it sprinkles some runtime pm enablement atop these drivers.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v6:
> - Rebase (next-20240112)
> - Reorder qcom_branch_set_clk_en calls by register in "*: Unregister
>   critical clocks" (Johan)
> - Pick up tags
> - Link to v5: https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org
> 
> Changes in v5:
> - Change the "Keep the critical clocks always-on" comment to "Keep
>   some clocks always-on"
> - Add the same comment to commits unregistering clocks on 6115/6375/2290
> - Link to v4: https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v4-0-32c293ded915@linaro.org
> 
> Changes in v4:
> - Add and unify the "/* Keep the critical clocks always-on */" comment
> - Rebase (next-20231222), also include 8650, X1E and 8280camcc drivers
> - Drop enabling runtime PM on GCC
> - Improve the commit message of "clk: qcom: gpucc-sm6115: Add runtime PM"
> - Link to v3: https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org
> 
> Changes in v3:
> - Rebase (next-20231219)
> - Fix up a copypaste mistake in "gcc-sm6375: Unregister critical clocks" (bod)
> - Pick up tags
> - Link to v2: https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org
> 
> Changes in v2:
> - Rebase
> - Pick up tags
> - Fix up missing pm_runtime_put in SM6375 GCC (Johan)
> - Clarify the commit message of "Add runtime PM" commits (Johan)
> - "GPU_CCC" -> "GPU_CC" (oops)
> - Rebase atop next-20231129
>   - Also fix up camcc-sm8550 & gcc-sm4450
>   - Unify and clean up the comment style
>   - Fix missing comments in gcc-sc7180..
>   - Drop Johan's ack from "clk: qcom: Use qcom_branch_set_clk_en()"
> - Improve 6115 dt patch commit message (Bjorn)
> - Link to v1: https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org
> 
> ---
> Konrad Dybcio (12):
>       clk: qcom: branch: Add a helper for setting the enable bit
>       clk: qcom: Use qcom_branch_set_clk_en()
>       clk: qcom: gcc-sm6375: Unregister critical clocks
>       clk: qcom: gpucc-sm6375: Unregister critical clocks
>       clk: qcom: gpucc-sm6115: Unregister critical clocks
>       clk: qcom: gpucc-sm6115: Add runtime PM
>       clk: qcom: gcc-sm6115: Unregister critical clocks
>       clk: qcom: gcc-qcm2290: Unregister critical clocks
>       arm64: dts: qcom: sm6375: Add VDD_CX to GCC
>       arm64: dts: qcom: qcm2290: Add VDD_CX to GCC
>       arm64: dts: qcom: sm6115: Add VDD_CX to GCC
>       arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CC
> 
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi |   1 +
>  arch/arm64/boot/dts/qcom/sm6115.dtsi  |   3 +
>  arch/arm64/boot/dts/qcom/sm6375.dtsi  |   1 +
>  drivers/clk/qcom/camcc-sc8280xp.c     |   6 +-
>  drivers/clk/qcom/camcc-sm8550.c       |  10 +--
>  drivers/clk/qcom/clk-branch.h         |   7 ++
>  drivers/clk/qcom/dispcc-qcm2290.c     |   4 +-
>  drivers/clk/qcom/dispcc-sc7280.c      |   7 +-
>  drivers/clk/qcom/dispcc-sc8280xp.c    |   4 +-
>  drivers/clk/qcom/dispcc-sm6115.c      |   4 +-
>  drivers/clk/qcom/dispcc-sm8250.c      |   4 +-
>  drivers/clk/qcom/dispcc-sm8450.c      |   7 +-
>  drivers/clk/qcom/dispcc-sm8550.c      |   7 +-
>  drivers/clk/qcom/dispcc-sm8650.c      |   4 +-
>  drivers/clk/qcom/gcc-qcm2290.c        | 106 +++--------------------------
>  drivers/clk/qcom/gcc-sa8775p.c        |  25 +++----
>  drivers/clk/qcom/gcc-sc7180.c         |  22 +++---
>  drivers/clk/qcom/gcc-sc7280.c         |  20 +++---
>  drivers/clk/qcom/gcc-sc8180x.c        |  28 +++-----
>  drivers/clk/qcom/gcc-sc8280xp.c       |  25 +++----
>  drivers/clk/qcom/gcc-sdx55.c          |  12 ++--
>  drivers/clk/qcom/gcc-sdx65.c          |  13 ++--
>  drivers/clk/qcom/gcc-sdx75.c          |  10 +--
>  drivers/clk/qcom/gcc-sm4450.c         |  28 +++-----
>  drivers/clk/qcom/gcc-sm6115.c         | 124 +++-------------------------------
>  drivers/clk/qcom/gcc-sm6375.c         | 105 +++-------------------------
>  drivers/clk/qcom/gcc-sm7150.c         |  23 +++----
>  drivers/clk/qcom/gcc-sm8250.c         |  19 ++----
>  drivers/clk/qcom/gcc-sm8350.c         |  20 +++---
>  drivers/clk/qcom/gcc-sm8450.c         |  21 +++---
>  drivers/clk/qcom/gcc-sm8550.c         |  21 +++---
>  drivers/clk/qcom/gcc-sm8650.c         |  16 ++---
>  drivers/clk/qcom/gcc-x1e80100.c       |  16 ++---
>  drivers/clk/qcom/gpucc-sc7280.c       |   9 +--
>  drivers/clk/qcom/gpucc-sc8280xp.c     |   9 +--
>  drivers/clk/qcom/gpucc-sm6115.c       |  53 ++++++---------
>  drivers/clk/qcom/gpucc-sm6375.c       |  34 ++--------
>  drivers/clk/qcom/gpucc-sm8550.c       |  10 +--
>  drivers/clk/qcom/lpasscorecc-sc7180.c |   7 +-
>  drivers/clk/qcom/videocc-sm8250.c     |   6 +-
>  drivers/clk/qcom/videocc-sm8350.c     |  10 +--
>  drivers/clk/qcom/videocc-sm8450.c     |  13 ++--
>  drivers/clk/qcom/videocc-sm8550.c     |  13 ++--
>  43 files changed, 234 insertions(+), 653 deletions(-)
> ---
> base-commit: 8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
> change-id: 20230717-topic-branch_aon_cleanup-6976c13fe71c
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> 

