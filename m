Return-Path: <linux-arm-msm+bounces-10354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDD84FB71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 19:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4AAB1F23C54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 18:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AB480BFA;
	Fri,  9 Feb 2024 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxlAsaTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0180C17
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707501690; cv=none; b=pMH84dv4GPOO68uXzn+ROqhb41QqKpOO+STUu21LOWdEX4ZBP1AvO0WAzlBW6hBqzt38L6j5fyNGz0zuSjtJsgagpvf+HIT6rG2kp/v2QQ7hGd2Lh5+r8ct4G+gMDi/OWcMY32aSVhscCs56umJKpE4aAhskUUvVDMxQ/ooM/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707501690; c=relaxed/simple;
	bh=ZIxcGmiR4gGSReoL37yMRXuMkVPpy2y+83NsY4EsGcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtTzBiUyNhJVTfPsjr/1Bh1ADcWMlG/msWAkobgbMJlnC0U58Pl4G8iP9F2U1gC3gvG97FLrERcrJJ+nQmWGi9kg97Paq58LDCs7pRYcfUoezh7UbcAEkYn1DqyRzGa+gI0ZDl6BcZTUcH85Mh9R+AgmVgl2PXfzkX2nV0gsVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxlAsaTT; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-604b2c3c643so13590457b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707501687; x=1708106487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMOHoZq4LqJoeusiTjh5rsO9vvT8R6dscB00SY5z3ME=;
        b=OxlAsaTTlzt7cAS/BB64nUD+6YK4RTVifQwQNa94upJvfjBH2Xh1BChn9TeomyPoGS
         h95p4l6DwF8NzSkJ+zT/eU7vegbBSgQaHUcpbR/BLs7mSyI9gwdePByPNl+sax7cKp6Y
         KI4g9TVRffoqyBsV+4vJmEjvy8IZ0ARrucQuCOMA3PZAaDW+VJzehFfVRPFVsgFQjzfm
         TQhDMw0NXkLqLe41RdXDippRnH/6vyFYqSCmcq/P0YEEz9CNvWGiRu5688KO6oVAFyp6
         Zuwv+rfyArtZCc9/oXKnjxuZx/gqjynNvxVrcHhfY4AOkPwrxTL/Q1CjQOUZpyIgvmPa
         kEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501687; x=1708106487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMOHoZq4LqJoeusiTjh5rsO9vvT8R6dscB00SY5z3ME=;
        b=WG/910mzyXdXosV5xnc7MZj/MPoDl5m3dtvhhliZu9PmAruPvdBFgRW3JK+bmumEn8
         4icoCeMqeEtEL9TwIZsilzxLB3WwvcTmNDLyJrQpApFKMQj0ywXDGAh/b4lYLXq2jCRF
         OBCYdF4V3hnua09JckrMQNY1ny90wNny5djW9I74l4rapoTfqFPsc0/mYVvwwO5UME8E
         MqQ/Lby81bZhhqyIhhEEGy56SFZw3tJhw0UP0sFlsEbUK9ySMOqBQWc8KiKIIZHygQCK
         7V20QT7oIIK8LYmmr4lfALou/yP5slQAKT66TWkZicM7eTEbpJHBoRgtK8UCi2Ou6L31
         frBg==
X-Gm-Message-State: AOJu0YxDeeMBWEgYh2SzMu1USi8QqCW1Z11MvmNhmb5Ntz2HgxOsV0Wn
	UyINrGRsGg96d3vcVpnPS+HhKCq+KeJXIINwyfv5rtJWh4kYoKCzfD2nUSl81m3gCRQGHA9fsvc
	x9ELvvpJdVxOVw32Zrhgh3d+hakkVpwxj6mNH/A==
X-Google-Smtp-Source: AGHT+IFPSOL9a8c/GVGVq9MDFtWcygLZBixUpmOLpueIbE9kRc9dfBdNvOhUVH/jwXvduN581cPLQQrKnVOPmbfI1hQ=
X-Received: by 2002:a0d:cc95:0:b0:5fb:e74c:ff8d with SMTP id
 o143-20020a0dcc95000000b005fbe74cff8dmr2647607ywd.10.1707501687222; Fri, 09
 Feb 2024 10:01:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209-qcm6490-gcc-protected-clocks-v1-1-bd3487b2e7b1@quicinc.com>
In-Reply-To: <20240209-qcm6490-gcc-protected-clocks-v1-1-bd3487b2e7b1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Feb 2024 20:01:15 +0200
Message-ID: <CAA8EJpr987frG7rpceybSmg8TFj-OsQeoRKBdLT=dnTbfzruKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Declare GCC clocks protected
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Feb 2024 at 18:21, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The SC7180 GCC binding describes clocks which, due to the difference in
> security model, are not accessible on the RB3gen2 - in the same way seen
> on QCM6490.
>
> Mark these clocks as protected, to allow the board to boot.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> I did notice Taniya's patch [1] after writing this patch. I'd prefer to
> merge this minimal set asap, to make the board boot, unless there's a
> strong argument for including those other clocks in the protected list.
>
> [1] https://lore.kernel.org/linux-arm-msm/20240208062836.19767-6-quic_tdas@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 8bb7d13d85f6..97b1586f9f19 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -413,6 +413,24 @@ vreg_bob_3p296: bob {
>         };
>  };
>
> +&gcc {
> +       protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
> +                          <GCC_EDP_CLKREF_EN>,

I'd say these two clocks looks strange in this list, but you probably
know what you are doing. Thus:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +                          <GCC_MSS_CFG_AHB_CLK>,
> +                          <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
> +                          <GCC_MSS_OFFLINE_AXI_CLK>,
> +                          <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +                          <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +                          <GCC_MSS_SNOC_AXI_CLK>,
> +                          <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +                          <GCC_QSPI_CORE_CLK>,
> +                          <GCC_QSPI_CORE_CLK_SRC>,
> +                          <GCC_SEC_CTRL_CLK_SRC>,
> +                          <GCC_WPSS_AHB_BDG_MST_CLK>,
> +                          <GCC_WPSS_AHB_CLK>,
> +                          <GCC_WPSS_RSCP_CLK>;
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
>
> ---
> base-commit: b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
> change-id: 20240209-qcm6490-gcc-protected-clocks-ee5fafdb76b3
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>


-- 
With best wishes
Dmitry

