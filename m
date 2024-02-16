Return-Path: <linux-arm-msm+bounces-11363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B26857EAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 15:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA0528B31B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBB112BF3F;
	Fri, 16 Feb 2024 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2Xb97On"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DD12CD9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 14:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092331; cv=none; b=uvEOAmi2fH4VrB6puUcu37LO9q/6yfBF7B4FK7nfa1s0qWJgoyiO3ER0Kp5WsxZ/0NRuGwupUnN+QnlOWl7wORYesxocAYSWN/Vu121UM6gd85Z08tflwO2MlKFudcTCagJrOvhzViF3I3MrJL/nA5h6KEgE/gsJrZieagjK4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092331; c=relaxed/simple;
	bh=F8midk/T+omEqYMOQEp3ihmjyhJ5UadddKfjPp7cwrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnU72E5upH+Axo5oCEPn5FO0vTtzca3csPrkKfsA+lU5A5tGw4kadE0TGSAaPy1d3Jy0vAjYyPIQdH67BWumA+cP7yk7Wtk5EEvXNXrqLicqz6+1pvRIyPGzv1CoeuKRsb7oe+v+LW1Nx0CmGagluDgtYCpoXYcTUF0Z/ItCar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2Xb97On; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so1698182b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092329; x=1708697129; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZufnX9tFnQjoiNUPIE21T+F66j9xwWMF6VYP2fLe/4=;
        b=a2Xb97OnLh4JVfLTfeaTUWfn/bPVLRmMYsAosIsJj9HyAGnaQmdZNjw3vIyMCbaSgg
         otyX58j2hcM29jm0Yea6jzXR+YOUYuw4gnbDvj9L7V9KhNb+6gjkWc9hCn0Rk12+2NTc
         ZtrFdt+dxY9lKxiW4gLD8NGngY0A9Z1Kkhlj0oPp3LBN6xOXx8LMuck96o8XaDEs8+V0
         pLnF8jvhxhokrJQZuUlyvt5aPVLg7jwCm/nOd6+PHBCzjk5VTRlRCCNkfih/QVYWeEAu
         K1bB0aC4kRt0wCWDcXkQn002ZZoLFtI79TUI7iWO9GzV5koNeE98E69dzxGZLaNTDxkr
         1dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092329; x=1708697129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZufnX9tFnQjoiNUPIE21T+F66j9xwWMF6VYP2fLe/4=;
        b=fNqPlhcDhHs2WxFV0Pwl8aUoE4bK9qB6/XhN3Ap/0qx2TMvISMBAN+qPTEhTGhaYFh
         Qpju+wF0IWNvGbqRRbVKqOx4QrpgZeRRusEiwx0LHKTDNci9s83rgbifeoSYWGYBetvy
         4t7UL+INcFfAAzwz2+6yO+tRY3YlQHb0N7NBvvW40i3IqqmOKTWBauBqEPMSZCEf1pF2
         GqRxcDfgTWj9ZdNaa0gSXXyFlUPfIqxEX/oIHzV2+lNe0J0XqQJdwMx2C84fs4pbJaIA
         aW+j1qvoPk8LTcelR937IRxGLz/cuGMUOkwzGYLqn+mIn7h5B2jLeGgSEQsgmR0pq5HN
         0iSA==
X-Forwarded-Encrypted: i=1; AJvYcCU0WuDEYxNUAiU2i+JLQVzuIYa5YE1Qown0OIRxg4+SzJBBaxGRtvosz/xvf4dZFrXMctLyY6o8j8HOCxXzRjzXfDKvWg3hJXzfmrKpYQ==
X-Gm-Message-State: AOJu0Yy4bs6hN+nmfbliVwsduHmxPX4DX/6dQ7Z7J5Zp6x7bh5nuHl2h
	245XJxfYqLsMMbY+JP270xKqArLJsvL7bP/IU3Q58EV1WehvQXDVslcfke3aPQ==
X-Google-Smtp-Source: AGHT+IGIJLu2xD9WGLhIgNSyonAe5waClziHCq3k+o8/45VHBkgDyawGWbdNR9czUymA9dr7fOD03A==
X-Received: by 2002:a05:6a20:c6ca:b0:19e:a1a2:60f6 with SMTP id gw10-20020a056a20c6ca00b0019ea1a260f6mr6534298pzb.57.1708092329236;
        Fri, 16 Feb 2024 06:05:29 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id m20-20020a63f614000000b005dab535fac2sm3279726pgh.90.2024.02.16.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:05:28 -0800 (PST)
Date: Fri, 16 Feb 2024 19:35:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: msm8996: set
 GCC_UFS_ICE_CORE_CLK freq directly
Message-ID: <20240216140522.GL2559@thinkpad>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
 <20240213-msm8996-fix-ufs-v2-4-650758c26458@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213-msm8996-fix-ufs-v2-4-650758c26458@linaro.org>

On Tue, Feb 13, 2024 at 01:22:20PM +0200, Dmitry Baryshkov wrote:
> Instead of setting the frequency of the interim UFS_ICE_CORE_CLK_SRC
> clokc, set the freency of the leaf GCC_UFS_ICE_CORE_CLK clock directly.
> 

"clock", "frequency"

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 401c6cce9fec..ce94e2af6bc5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2076,9 +2076,9 @@ ufshc: ufshc@624000 {
>  				<0 0>,
>  				<0 0>,
>  				<0 0>,
> -				<150000000 300000000>,
> -				<75000000 150000000>,
>  				<0 0>,
> +				<75000000 150000000>,
> +				<150000000 300000000>,

Btw, I noticed that this platform is passing UFS_ICE_CORE_CLK_SRC as
"core_clk_unipro_src" which looks wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

