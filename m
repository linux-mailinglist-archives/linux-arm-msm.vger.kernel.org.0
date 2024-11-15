Return-Path: <linux-arm-msm+bounces-38048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEAB9CF08C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 508CB290558
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C261D5AC6;
	Fri, 15 Nov 2024 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dm8f46Do"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9B1C75E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685250; cv=none; b=B5VwTrjHozg2JXPhyRhmLX4XIdhbSVWqrVB2FDYXZEfOmQDtkmjaYtEc+iCBUxoCdHVCgywpoPrOnM9ESZa7eU7p80ynf5qimgKFb+f1r8V4LptO7dQnXGlvMd2s3Tqg4ObY963vETLX0wtQ69qIlUrUlEiJdKbhFaQ4PP1WNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685250; c=relaxed/simple;
	bh=e1BsjWrK/kzNf9cCgD7tXTxvlV9QNmyd9j9wKC1xxNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAioW8blzXRvTDQL8c2LIy8L8wyCW2hvBBlRofE/FPz9iQcR53aAa0D4X+dU280veGQUXsYQCUtlxTmk+tuvHNFTbHLjsstNH711qAg21HdVgMmc59PucoI3oSLOAnjDAiltzKa2bl4lqOxypiDwanhBJmAwEypyjInlGqcqtpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dm8f46Do; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53b34ed38easo2006007e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 07:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731685246; x=1732290046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddEutbtPWg1KmTucj3taFQtrXu2EJy6K8zzDaRFp7s0=;
        b=dm8f46Do7FgLGA9b6rp+XaBdYQIk7A46lrz1H3RQLWehUfA9+NZh/jkJM1TXfdtz5G
         MtbUkoBKrCX8MeCluRISLAsvLWEe0y/c2tiiSk17eqYkp/xpGtbLxve25C9TcmRtcf6z
         9waVoMMOA1ZT0ehskotBFdJCv9jlpebaIjkACl95+hh5pUBRRgsz8SM3mHykPqdyO5DH
         Msj4k/vPQ4Pky4VZ27CGmOdw4wiYsfov0exVsj1UpDeTL1JL49DBcBB3RAT7JYg4v5NW
         vxSsEEQKyD901XT4LHsS5YP8FvtDFKrlzMVEJ8V9tc/0QGlQwZiQl329BXTq8YvOKV/k
         PU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685246; x=1732290046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddEutbtPWg1KmTucj3taFQtrXu2EJy6K8zzDaRFp7s0=;
        b=r2q3MlsRB30riRxv+hc7xwXa5qpFXRqU9mgtQ/ftVZdi7XSp0r+vkV7Mixq2d55jD+
         VCY9Gb5Km8WHCiYKVW1J6w5ooY6rnPslhCj94I+H2SnN2LtjBT+U71rLtM/vRGcWViD+
         xTExUPKvoBQ4P8c0u12dSxQHScgDTvQzUMQLo33vlnxjYwluyPtcItBx7oB4SOJgsGdP
         h5SEsA24GPPektZOGe1of090m4NEWQwySA5lloEgV5a+5D4pFsyG0hTt/6HZjM7k02GQ
         Vk11/YHX1sj7AOmn+21enFzY3CsqMvR8KiVgHL0DW/Km0wxS+bbP393g5GGFf8VnMgBh
         GS8A==
X-Forwarded-Encrypted: i=1; AJvYcCUZnz0zWfVpmpYUn3xuGi6IdlItp33ng4icvusgdkNJdYXMkogVw8QtgplhpZeI9yVhfuxGWBkI0g8ZiGDq@vger.kernel.org
X-Gm-Message-State: AOJu0YyUng/kO03XP2YN2/qBVpWMgXnmZvxe0KahEji1cJ6l/VXsojPN
	djXwHGJWqXZ0isEgAYmXj6udHmT0YaFWpYAqFaGZU/xTHbs1jYqCPerAygxvwbw=
X-Google-Smtp-Source: AGHT+IGiWuk5Q66NHJ3LjXN67sEupBz252YAxeBkL4RX4XijCDZTBhhYO6iJP7cDergE3QFssvqbkw==
X-Received: by 2002:a05:6512:3b85:b0:533:44e7:1b2a with SMTP id 2adb3069b0e04-53dab3b261fmr1703126e87.40.1731685246352;
        Fri, 15 Nov 2024 07:40:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653104esm609956e87.131.2024.11.15.07.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:40:45 -0800 (PST)
Date: Fri, 15 Nov 2024 17:40:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Update ranges for FTSMPS525
Message-ID: <d7zkmr3kdgrtyxettnhnt4cscxodsxertmocsgtpqdokjhi7z4@ox32a25ekbfv>
References: <20241112002645.2803506-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112002645.2803506-1-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:26:45PM -0800, Melody Olvera wrote:
> All FTSMPS525 regulators support LV and MV ranges; however,
> the boot loader firmware will determine which range to use as
> the device boots.
>     
> Nonetheless, the driver cannot determine which range was selected,
> so hardcoding the ranges as either LV or MV will not cover all cases
> as it's possible for the firmware to select a range not supported by
> the driver's current hardcoded values.
>     
> To this end, combine the ranges for the FTSMPS525s into one struct
> and point all regulators to the updated combined struct. This should
> work on all boards regardless of which range is selected by the firmware
> and more accurately caputres the capability of this regulator on a
> hardware level.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
> Changes in V2:
> - merged FTSMPS525 lv and mv into one
> - updated all regulator structs
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 83 +++++++++++--------------
>  1 file changed, 36 insertions(+), 47 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

