Return-Path: <linux-arm-msm+bounces-47233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10090A2D608
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 13:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ABD01889E6F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 12:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B01F246326;
	Sat,  8 Feb 2025 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vz4WbChs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4329D2451DC
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739017039; cv=none; b=oTxvvD9wnx7jhXFNP9H/ufd+KncYr7rGinOU07MRULG6aujNN+BLk/FjyX4/zmJ2UbqdHYjD/OXA2jV2SCZhWppo7wh4wOq/XUb3yDuSrFLC/D0RxC7+hg7UgBFZ7/zO8V1r16P7o3GR3rye594XPAGtx9+ioaqBy/KI71Bqpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739017039; c=relaxed/simple;
	bh=T4eIb3bqRCOm/qgXKt5JXRdNtc/g3t2rmHuZgsY86yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvhPNMq5IxWuHFWxfNnOhxPUgoh1Hiapa00thfiknrO+59yx1Wn4vjdJniQPKbj604Ws5YoSFyIw/g2KS5xo+WpD6NIksL3MAuOdWM3hWmGy1n3DjrUa+Bk+fjUIzRaoEfpVN4d5BweTJEClW8703oHuJ6T4RGmqeFh2vklvng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vz4WbChs; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-544ff74be6eso973008e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739017035; x=1739621835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86n5+Q0ZSLD5Q/iLrsvS8vsVVb/euNtkQzazsN+zt/4=;
        b=vz4WbChsrYzHJeJBLC/mlxlljZujRZ0PfRVGAH7rcTDuEDV7gxQWUZkvPhGv8jrfdV
         svOkbRMHQeQmR20yjY2DYYC1dlNPLF7DvoIYQbumt2OAbD43o304uC5av1GxI/eaTICd
         c8ZBOgFnLWkFT83MdOhCKra+e9+fs9cXscdRxUbP62QaklwRIDBLN8qF/QLvx4l7cK7d
         xY7u4E+D3KHCfCDt6nWwTWCWemCsNek4th61UkEBPjInpfsKP0/bF4J6CX3+Az9rh+oh
         4fjFDKIRdqu1e+zW2XLNQUReMcG4S+beFnqXxsFZ44eEubVg3n5ncCD2SSrUCHfRWhQO
         Ikfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739017035; x=1739621835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86n5+Q0ZSLD5Q/iLrsvS8vsVVb/euNtkQzazsN+zt/4=;
        b=NxFTPws+UDMCPAwfJZ2Ll6F2qPfs7BG5qoHFz3VWht2IkGbL2mBXGWw+E+J6fz2gJF
         2kI50t025XJm54BWHVHehzv1NRQLZShloonGwGZF1oxdF46bKZKGko0JhqAlZUyExsc7
         CMP1u28VjI1krDhNAjpZVPJlXjSOWxTS6uDwI4eKWJ2eMizsJymCz0K0C8zn08oFrk34
         i7wUcrgVhb5N9I54UkBCm+xsY+auq8IM/2QbZFNDs53BAx3m7i5P7UoxukMLbdzlg71k
         Gp/k3lhCzWxgTXE+onIp8UJjH85ONnTb73V4XDUv8yCPwpIkrRju1/50VuiOCwFL14XJ
         HBPg==
X-Forwarded-Encrypted: i=1; AJvYcCXJQhm2Q+/OTvBzGMM5ZcI/8g2VlsXqJLafxjbeSzDG3bq/bRlMIrAGf/RkT+DWvWCYxqo7QtFIFYmv2jJn@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxAbLYUtBavD4ffzDs9TkVutiCJPGrKRVfzKyFYZnhspzMftl
	rYjS2YOp+58DJfwkBEC0IFj0oTDBs8sAqu7NAPtmjM6M4i4hQ/llXOx+B4kujTY=
X-Gm-Gg: ASbGncuTnWlgRYpNif+xLewv8gcesSe2DldmmMlmyNT9FTJzYrLzPmkRaBS6TaFNW3r
	rd8gLFaOp0uq0aCSlru3NulQeU8uGKXfdxirI42IE7R6STxQxCJx6v9txYY9tWNB8WMKL9+MDTB
	inKW3fZTGTp709MM/OeKApUTLvU3vXLSEFwZnFZKMBqwU59eF45mFYNtxfs3EALTNwzoqTj7Zzb
	OcrMEXbfNdxAYJKuaZ/pK6oIv+1tRRBhLvKjedek4kzDHChR3h5aIRHk4c7ytDGorc5w6xWtRqi
	0pThKEGitZ+anJz1S0SkOEYuCmqFBnyXVErtE/lVc9ryK5CmEk/yj2slo8R4zOVapQo9DKA=
X-Google-Smtp-Source: AGHT+IFwIWTeNKS4wN4R624q3kbyJQojVN74fOV9zot7wxyHPiII72LWtpH9IvPMBK8s7MHZJcW8Bg==
X-Received: by 2002:ac2:4ed0:0:b0:542:9883:26f with SMTP id 2adb3069b0e04-54414aee2c3mr1807642e87.50.1739017035188;
        Sat, 08 Feb 2025 04:17:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54504062523sm191475e87.79.2025.02.08.04.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 04:17:13 -0800 (PST)
Date: Sat, 8 Feb 2025 14:17:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: ipq6018: move mp5496 regulator
 out of soc dtsi
Message-ID: <x353yhiu4zsdyu5dpgfe6li53bq6b25rd3rhsquab7g4cbzehl@klbvqidc2sac>
References: <z6vspyykbj7e55uequibwacdx7uuwubtuabnsxagcudmqrfwn3@4gfna5rqiimc>
 <20250208080015.553458-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208080015.553458-1-amadeus@jmu.edu.cn>

On Sat, Feb 08, 2025 at 04:00:15PM +0800, Chukun Pan wrote:
> Hi,
> > Wouldn't it be better to move it to the board file without having
> > intermediate include files?
> 
> The intermediate include files were suggested by you:
> https://lore.kernel.org/lkml/xmvtbib3q72tnfpcaic3vbgwilpo7yjnqimr5uk2myjgtslbgm@mlp2kqvljayc/
> 
> Unlike mobile phones or development boards, the pmic (voltage) setting
> on routers is relatively fixed. (Because QCA will not provide relevant
> documents). On IPQ60xx SoCs, s2 supplies to cpu, l2 supplies to emmc.
> The downstream vendor kernel puts it in soc.dtsi (no device override),
> so I think the include files is more appropriate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

