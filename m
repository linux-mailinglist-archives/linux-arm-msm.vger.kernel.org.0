Return-Path: <linux-arm-msm+bounces-77152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644EBD8AB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D82C14EE78F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2D42F1FD9;
	Tue, 14 Oct 2025 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgM6NoUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3642EBB9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436564; cv=none; b=POJrNuau1iD2q9PNz8ZN1I99/9ROVEYXZJ6itCmJhNr+jL8AsSkO4QB/cTzlfglQQNqr8j328aevfKDBanoLLymW/F7Kzvs7m6C+p9hL/OniOECIoVSs0EYuq4WiiKZsgp7kyG75fj6jj1gDqL4rhdtSR2qsHoh5Oiq/VkTEo4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436564; c=relaxed/simple;
	bh=8NXJFlFsvTG3EbIAl4tjRuPzI2AZxM6EiXric7dRspY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPvg4ew/6zoQQ8dz+5gJfOAbHx06w7zxE5sYItMeQHwosYVLFmSBPmRPE5CNNKbry+wADfJ6Ov3dWDl0IdONHBisD/ZkvkUVQqjTaVowSXnqusrce/I4uZ4vdS4B3nbu6BqwesCjXzkTNA6buAmSZ2iUjlnHA7LYXfrbMGOe6CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgM6NoUj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so53718305e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760436561; x=1761041361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/ttxF/dZw7J4JSYZeZOo0fN3D/uqFn7kWok+tyJugc=;
        b=HgM6NoUjMJKx6ah9M6XamaxyIR72OUtfBcmpK/K9DgIWDCvzVIAzlq9XpiuoI5N0Sm
         ReB62m+bwuHjf9mVxPQHRyjeLtMqPFxQ98q5+G4TAt1C2IDNtcoVCWSLJnUjQ3a7zPKr
         yeXC3Co0GuptdgKf9dgSu95lxCDZvA1E1TY20QA2AI/4gKEk2wqyGHKYAtX7nUMTyWGt
         Z2HzsxV3bPCbFV9uXXrz7skMvl96QwHKuMdRuDJrFxLhJjRrUeSEt3hL6eOBtwMe+QwU
         +jWeNOiHp6f+CY1pjSxBV3xGhWe0sgpOeE9WkwV87aadaN/aJD4ugnE1jTqvqtqnUiIS
         a4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436561; x=1761041361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/ttxF/dZw7J4JSYZeZOo0fN3D/uqFn7kWok+tyJugc=;
        b=p2ktJss66D4gSAH6+yRtWgsnneku8PeDHJSSeRUNBhlerB/C7i1NdAUeXANzwwDWsY
         oiOqP/jllFIRZP7W/ZyqHZhFJXI4BK6aM76mgvFLgjS65RsdCA6MQ6lyKVJcZIWd+pqX
         U1L1bLOGN8BpCoPgopzD6QyOJ2+1qnRhj3lBe1lfxAcyY5X1NEPh7jcustCXORb7XyZJ
         IatJlPNuo/4AnFLLcaDDBj0tJcBzVdo2Vxm9BJEx/wARkMBWYDc3+DNwyiK8swaeDH/A
         dR4ki+ZlcYy3cnsepEAGCdgAqC0GFIYpqb9pKVuF9D1+NkfBbjc23CntDx2680Jk5zvX
         87ag==
X-Forwarded-Encrypted: i=1; AJvYcCV8IrQXobEtzEHHYXSStygo0xgtVV3xeTTYhuZP75o8bAI9pj//rYiujBzpQgBXREqPvsg4fDmDurGQwPbB@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQ/QgKrWszSENCEsztferM26EFYTPjcRfRSlCQCK5KWDaEPj7
	Np0gaC19kKbvEN1I2mEzgFHGbkyp4a4HgSxdCrC5bXj536tD6WHBhF1JIEko3g5OrJ0=
X-Gm-Gg: ASbGnctuiHDCVn3rF6yK+qfDed0lUxpwS3xMxwBx4tjevrygT2VN+fZpRV+JENBMTkP
	El1+0LflV2qYZdrQn2IWljM19C+HdnUgFFfwBFOCN7ymREVUnr0Od0y0ue2Yqp/sR03akRH2e5U
	eiV9fYtUhLEHXEPbLp0bQV26aYEs9MSsM9hYiw3/pXvwfp2BdKFXWaUdVYAhRlGpHHQS3hkTgiS
	DfRB2Tg6veKKkES8AturluBfRcU9QJFU0v8p3TrWjArDLX47pjCpSSR5SZStCS8GiRG3EBR8dZb
	A04hzCIWpUOxnpEqxr0P2LZG7A/zGgToRCah/+stiwPJbOt0i/bXTgMWKHp5O+/pfMi81SvA7WL
	SOe1bJpNKkzJr+vM1j5gMNS6j+Qtktk3/mQ7iw8hBZQ==
X-Google-Smtp-Source: AGHT+IGhYcM1EjuHseqFI8tRZvchmyS35I7xUk/4EU6AC6XLlnEooj6iq3rh59ZcN+RWuk1UNgay5A==
X-Received: by 2002:a05:600c:a341:b0:46e:74bb:6bc with SMTP id 5b1f17b1804b1-46fa9a8932cmr155892235e9.5.1760436560606;
        Tue, 14 Oct 2025 03:09:20 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3d2c1asm149604235e9.1.2025.10.14.03.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:09:19 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:09:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] phy: qcom: edp: Add support for Glymur platform
Message-ID: <c6w5wqjqdimn3cfex3n6aynol4hfqejct23ziq4wcwj2svuk5g@tzfi6fnbpc4k>
References: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>

On 25-10-14 13:02:26, Abel Vesa wrote:
> The Glymur platform implements the eDP/DP PHY version 8.
> Add the necessary registers, rework the driver to accommodate
> this new version and add the Glymur specific configuration data.
> 
> This patchset depends on:
> https://lore.kernel.org/all/20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org/
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Urgh, for some reason, b4 re-enrolled (lost old branch) this one as v3 instead.

This is actually v4. Hopefully, v4 will know to pick this one up when applying.

Sorry about the mess.

> Changes in v4:
> - Force fallthrough for 5400 and 8100 link rates in qcom_edp_com_configure_pll_v8,
>   as they use the same values.
> - Picked up Rob's and Konrad's R-b tags.
> 
> Changes in v3:
> - Split the DP_AUX_CFG_SIZE change into as separate patch, as per
>   Konrad's request.
> - Re-worded the dt-bindings commit, as per Krzysztof's request.
> - Link to v2: https://lore.kernel.org/r/20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org
> 
> Changes in v2:
> - Sorted alphabetically the both the compatible and v8 specific
>   configuration.
> - Prefixed the new offsets with DP in order differentiate from PCIe ones
> - Link to v1: https://lore.kernel.org/r/20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org
> 
> ---
> Abel Vesa (4):
>       dt-bindings: phy: Add DP PHY compatible for Glymur
>       phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers count
>       phy: qcom-qmp: qserdes-com: Add v8 DP-specific qserdes register offsets
>       phy: qcom: edp: Add Glymur platform support
> 
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
>  drivers/phy/qualcomm/phy-qcom-edp.c                | 232 ++++++++++++++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  |  52 +++++
>  3 files changed, 279 insertions(+), 7 deletions(-)
> ---
> base-commit: b529e9498b7948df2be579282cbf0d5a9a3b7f9a
> change-id: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

