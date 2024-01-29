Return-Path: <linux-arm-msm+bounces-8808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AED8401F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 10:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D83B21A14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 09:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55F055788;
	Mon, 29 Jan 2024 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6g+we+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F755789
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706521468; cv=none; b=NpjwyRFJaI4tKhh+pxVU4TgAFpl36o0fmhjT7QBnD7eKqRZkNEkmefYshECZouD/A9YmbO2R8N7wkvb/iEysMInv6TSDTsbCI25HsROTo5QHDeVz96DwKaoSJ3mbFXNC1ZX+3duXxpBdx3mp7TCOX2j1omg4ptEsaZePGL+ps3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706521468; c=relaxed/simple;
	bh=xGW8WGo7wIurlupbyhMGpqaVATp3TBA2uGD+Op0kJcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHcOM107AUb9iTSmA+r6BX5yFbFNPFP7iOqJgzNb2vx/WBEagKG1FmoUB5Kq56dXo6ZSi4sq3BumZ2ygTYqkouQ3SGCqZJ1yqbV+2935zKOmrMGJTFrBOaUiOip1/YPTxhu1u7XKjxSNzsLeEY4OzggQgPb9gI0ZzMm6sQBOQYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6g+we+e; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-603c6621118so11139617b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 01:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706521466; x=1707126266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnHoKf6bhzEn5TkOJv2QvMyWuMlpzWb0+DE5YgR4bxA=;
        b=F6g+we+enEFQlr1m6fOm4GVof/8s5Ocf6ZaAlnvbUrXvhul9JPd3/jIUsG/FiwbwZY
         Pd3DQej9NPGkklaTbj4/EZCmEHT2JHMR8ZXBbDGySrRoByOz5DSweYq6NGl4EfxOD9i7
         XXGv4kgnGk5d4ANt+vBEobnSy1bNe1BLYdxO59XRAgfeQVdbGW4UXstIA17n7roUWPNE
         Q6RVjVM9ktmOyyzYhD4hniHP+bshccImRYJGMq1ibGdWN71KHRWAIfakAgLfyOFjU4nO
         H6HnKvVNfXS+5MFpwleshr3jPP70O/4XWE4toes3oKmU1P6xMiWN8vsXxLzV2sS1HYEm
         THTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706521466; x=1707126266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnHoKf6bhzEn5TkOJv2QvMyWuMlpzWb0+DE5YgR4bxA=;
        b=tbrziu8Wny3Lto+j6+BurRFeBIe/kEakdSYNZRMfY9Xn0ETQlHT1lpGuBxm8ZrwIAn
         CtmyohARJ7taHqFMz6/CdrbSvmWrdSVVR3YnwS+qx5LNbNyfreVuwklshpwopXFF3jG8
         PlHyZk8ZD9qhgVKsrtWek5dT12AlPtYzS1fkIZ/TNOZT6FDG1Aw2mPEHxlLxFzOqbWKK
         zNeJawc8w9iU5jMPmbvWCZ2m4t0yEOSiC9dNQASZvNdvNOOTEfl61V+FaH/8xa8Gy4Dx
         +1GeFKnccLJJUDLSKaj4Pl4ZARQRZ5XS+jcp9JoFV8Y4DQYWb2rIon1kLRjw4r8XOWao
         tqJQ==
X-Gm-Message-State: AOJu0Yx0d0S70z20x3MX1m5c/ndhzIqh4GhVTY6mjV8dx85EIGPqGLK4
	uTGAz9qTQaZOQNucy2lXITb+m/Tc1t22K1W1vn3VYsHz5bHIacL0PfSqc3R8C54S6nys3MDokvW
	iKXAo7fwTCnMmx5wGNKcvXihILpSam03M9MBjaw==
X-Google-Smtp-Source: AGHT+IGMigB6OP5ZQjyQuOqZgXWwLae4qsfF65SWsJYsfr+3v4u9hT0bK9ATVlstC4hsNaw0Ea0YXKFD5gvUnGNVj6g=
X-Received: by 2002:a81:e201:0:b0:5ec:c970:19b6 with SMTP id
 p1-20020a81e201000000b005ecc97019b6mr3603630ywl.17.1706521466011; Mon, 29 Jan
 2024 01:44:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org> <20240129-ufs-core-reset-fix-v1-3-7ac628aa735f@linaro.org>
In-Reply-To: <20240129-ufs-core-reset-fix-v1-3-7ac628aa735f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 11:44:15 +0200
Message-ID: <CAA8EJpphzwoCaetGfnM8dE478ic1-BMqXKA3XVLeC9j5BBu3SA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8996: Add missing UFS host
 controller reset
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 09:55, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> UFS host controller reset is required for the drivers to properly reset the
> controller. Hence, add it.
>
> Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

I think I had issues previously when I attempted to reset the
controller, but it might be because of the incomplete clocks
programming. Let met check whether it works first.

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 8d41ed261adf..a6592b3e2db7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2114,6 +2114,8 @@ ufshc: ufshc@624000 {
>                                         <&bimc MASTER_AMPSS_M0 &cnoc SLAVE_UFS_CFG>;
>                         interconnect-names = "ufs-ddr", "cpu-ufs";
>
> +                       resets = <&gcc GCC_UFS_BCR>;
> +                       reset-names = "rst";
>                         lanes-per-direction = <1>;
>                         #reset-cells = <1>;
>                         status = "disabled";
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

