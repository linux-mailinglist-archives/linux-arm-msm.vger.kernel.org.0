Return-Path: <linux-arm-msm+bounces-14501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B801687FC61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 11:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554A11F20F16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA495810A;
	Tue, 19 Mar 2024 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mi6hao1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B864CEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710845773; cv=none; b=MXg9iFAoet1mH8yh+Lv5JxhOokKPv4lL7MklHd01fPFuti6/s2G0+XHzJKEtg8LPuKPPHp5KPBpyVO4dGSGSprRBP/QKif5LgB2lAq6NKClzaBT7tNyaOmSo4SMgBhI2GjHD2RghtKIn0PFJkFzcTV/oV2qR/f6ZheECiOK4eKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710845773; c=relaxed/simple;
	bh=udZJLAwRH6Wy2tl08TPal556uYz31Xye+SC2LIJakJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrzNr+YvzyrjO4GlzNe1hhYPGQeEa858K4eYJux8wS7GJrqCuoJ7BLXufoT3d1YFIQNH6vE1r9Tv68cerqXehajajY+peTIuWNNZguhp1MLXOgJrNn3JHNMWH3L3vCVM38lg5nA5oDzN1OufQmlb0+ro1PVVWCUzOzluLePhtlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mi6hao1V; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609f359b7b1so63617777b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710845770; x=1711450570; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHVb8syaGtNBn+LKrTDraLMPvcXg2wUKJP4+OyMiNcQ=;
        b=mi6hao1VuhmgnJxt3iPZ9jegxrDvvimHww2uzDsVGMa8wnzmlc/TFWpr/w4/4Vm9kI
         2cl/AAyk7WvgodCuTlT+VpjhN32tcBd58duKFqvGNB14RuFiQoFWQF/rFi2Rq14JnxIq
         +DJaRi4VEkwPEvJI/VGn6PXo5r0CYBjZ7oTLDiQUPN40WLxS0DnovxGOeEVkVMDZ/a6P
         kJRZJXYQMyE/88lD9ZPjml7ih0s1iB7lkFdZkgYUetv2o5iS7u8El1tPBjmSKeVtTZ1p
         EWwJ7lSfd7QohHHZjradHnXCKetjtSgfg+qy3jlg76hTWbJs4pcBXQ0F24/DdiiE9wx/
         w4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710845770; x=1711450570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHVb8syaGtNBn+LKrTDraLMPvcXg2wUKJP4+OyMiNcQ=;
        b=TBCsT8266JS/QuEGf2zUIVMRGlv2C/F//sPzttYKVfnt1FOU6ZcbQv92i9PQit65Xh
         DD/M0gXIYjAH5aeM9qTgKg/cEux/k6fxb7Sin0vfnS9SPIfSh32iqCGEEhmkVGAISuMG
         ciLCa7gPCgPKHeY7w+zA0ZOfku2SC4ggNMg1XYY0tiNK/XHiEHdYtIzFiq0H/r46wTzT
         BaEV494xzsCUgKBJL9c8vY90Ju58FybyoPemktkRj7dJB4QTuGN8llBoV1xa21sDlFJ5
         4TEAvX08Qd3GO/eD2FeDI2jayg5NaDDn3Z9yFXQ66RDAZKedXTde1L6TQe0FA/3k3OaH
         DPLA==
X-Forwarded-Encrypted: i=1; AJvYcCU2OOUIQS1X/ODNQ4tE15jx4j4/bgBHT0ugSKLJoGrfRiZwQPILGb+E0Zg6/l2saDWf/AlpghmI94ugts4PWeSRHzzMT5par/cYBWbMeQ==
X-Gm-Message-State: AOJu0YzHpawsuq22+l94s533LYXgfwZVIh/jfrf005HAFyjXrQTXkRn0
	IhyEwmpcOM3UPBqEZS91KwrAaOtjfiPSczt65mGFsi+Uz5uHrTwZXn7mUsOybyiDtXTwdFYXQav
	kzWplYDQeAsM4+1GPK1IE7FvIRiSEtwp+/u4kig==
X-Google-Smtp-Source: AGHT+IGEpAdekNoCA0IOiJWhAboleUYp0ur74P3WOj1ZFPMOtJEw3FcSNRu7tO+3SXdvsuHb5u48wzuwf2gWrLakSNM=
X-Received: by 2002:a0d:fb87:0:b0:609:fdf7:b443 with SMTP id
 l129-20020a0dfb87000000b00609fdf7b443mr2105842ywf.52.1710845770674; Tue, 19
 Mar 2024 03:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-0-926d7a4ccd80@linaro.org>
 <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-5-926d7a4ccd80@linaro.org>
In-Reply-To: <20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-5-926d7a4ccd80@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 12:55:59 +0200
Message-ID: <CAA8EJpqra0q+iBD+AbM-EZcyT6w0uco0w-cYtUL40f=udwRUPw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450: remove pcie-1-phy-aux-clk
 and add pcie1_phy pcie1_phy_aux_clk
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 12:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Remove the dummy pcie-1-phy-aux-clk clock and replace with the pcie1_phy
> provided QMP_PCIE_PHY_AUX_CLK.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

