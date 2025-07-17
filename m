Return-Path: <linux-arm-msm+bounces-65431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B1B08A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF4FAA4728E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 09:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0A728936D;
	Thu, 17 Jul 2025 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QowrTCe9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679A291C29
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746274; cv=none; b=pIDj447pAw5Hei0VJVO7XwvYCID0EzV88TpyNF4LSbV+csJKLokRZicG2zbzzBlTILYR2RQmTNE6agxf0XGtWjb4+GpBPe0p/JUK3eP/SmnWSommcILD0FRirSTswuQ1bkFjw5j4ZPuGKLSuhon10c9N+qSrg3E6qNQCZu+5jOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746274; c=relaxed/simple;
	bh=C5c7x2+5FmrN92Gtg4+eigW/yNecgUmNAwgsD6/1sDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAqFlg/ep7l4hcnNo3pwXgxh5t60prToUyM6nMIsR2DCc196cfiGamsPGKyuH+lczEOxN2GVg7xb2B00i/PUUv59XzLMuxdjRpKZ0xzWV942sSBIZjHZrCOSbTrrDaG1N3yCNJVZrid5oQz7MvVjxnrtnT4nTe0gU4yKulMnWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QowrTCe9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so125067066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752746271; x=1753351071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9sprcw+FL+M/3WWYR2avdQL7tHTil5o2+4ysJZAMdQ=;
        b=QowrTCe9WCXjf09oV6lzh7IsOIfnXLoYj0QjyFw5TFVMvjFEe5vMJuqIarxDUnnFhL
         JObcf5HO3Ht+Aprbq62peM/eOS3TiRc4AGsHPm6TA/IvqGRXISwBabFbgqOZV6eL3WOP
         wAPWrfLitxqxfCixthSQY4I2wQslmobKMYOCmG9ak0aGAPdiFCP5Lw1AqbMls5cjCfp2
         lgPV8jDCg4K/gEZ3CSPkex7qJt0VZOkS8aCqHFYW2AaGZ/YO8itEx6Ndk+eoTnvZJsx2
         FZhXWBcStF1XFtNaOx0IQH0mYDFLlekNKfB06kIyjLQVYSsZaqltTNx4zzkoPfGSjP6W
         11ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752746271; x=1753351071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9sprcw+FL+M/3WWYR2avdQL7tHTil5o2+4ysJZAMdQ=;
        b=Du1XmqkYFBiNdbmkIyN6wFVYXliDilySvzk7O1/L19RuhbtU35Lcb9hLPjMFTGJ7b3
         rJ8Pd17pGKReWPF7SGXUHAscgeWE0PtoocQvrkLK3Duuemjc/VfWvC83K4Ua6oMCfe/1
         eP/rX6p2H3tUxuGBFEH0wB5DDe902GZbSbkgaeGcMmOA8w7ou7kjIM/pjd1O7irmrwP/
         0DuYJTxjdGGs7UuIc0jDxFeaexNh42xmf75c9qGaUxfuqxgvMIWCrXrYcJjRLUwHQROS
         VJkWNbYH3nHqRU+VPDOlXLXNXsacVjWiX6VK9Bm4gM65xycJ0UY4NzSp4PtjdLKMLN09
         9UXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiPnCWp5+aGFeQlUybdL0qnpKlQUMeifYRni5owyGf4pg0Q5TpJDZW/Ai+r/me4OpIBxB/Y29N3uG4+TU0@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5hkEUgbmyV4HXWWB5ncXhDJIzScO0jF+yhXIDAcuhwL1dJQl
	YJWcHGsPLgx7khhrDpv7GpcL+PEFB9CgTFauhG5QD7S36dcl0i7KzZkqBaM1j14EEGg=
X-Gm-Gg: ASbGnctFwojkKyqvO3ZCpl1tS55Rt1gEPced75Wrq/AzMsvpHc953fPwaF5qHEAciZy
	XzsmECMl+5xymQORc9Y3wsdyCSHN0+8rLCgaJvO1hSghV3NHSicNm9DGRN6J2jKtVSnhWm399He
	HDzbEQYVR8daOWImX9XOd+/AXE4oJM+ePyWUdgBDrGiMG40zNDJARnYm7afSfNmQnO751mSiozY
	PPFnsOZdB7nQuzr+TJCExkVMAgTUSogCtD8Wvqo1ZVmUU63wms7YHnaMOJeVXBhyklFNOsPkvUJ
	FX7qIMONBNO7Tx4KCV7b5qdA7lGMuNvoGc68NM+qakCs1EdwHl5DlGRj5aTdXsbxynr/08ic2sA
	fBd5A/6fsGtB+jjsF8vg=
X-Google-Smtp-Source: AGHT+IF2F1sezQkalvkubfc1kydTpgVG5QuWYuPnjDm/LqI0gsy0QRNYJ/pRxI93KXsHSADKAggVsw==
X-Received: by 2002:a17:906:fd84:b0:ae3:63fd:c3af with SMTP id a640c23a62f3a-ae9cddf1080mr542887866b.16.1752746270277;
        Thu, 17 Jul 2025 02:57:50 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82dee16sm1337846666b.152.2025.07.17.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 02:57:49 -0700 (PDT)
Date: Thu, 17 Jul 2025 12:57:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <aHjJG2nrJJZvqxSu@linaro.org>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>

On 25-07-16 20:50:17, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>  3 files changed, 8634 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 051301007aa6..1d9e8c6aeaed 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>  	  Say Y if you want to support graphics controller devices and
>  	  functionality such as 3D graphics.
>  
> +config SC_GCC_GLYMUR

Wait, are we going back to this now?

X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
then.

