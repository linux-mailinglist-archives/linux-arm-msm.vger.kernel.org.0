Return-Path: <linux-arm-msm+bounces-48898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FDFA3F7C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FDC1423F3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 14:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1081B2101BE;
	Fri, 21 Feb 2025 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePu0mX4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E0B20FAA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149523; cv=none; b=OuM9Thw6UP6P0Y7b662+OxpJSIF5LWFhFiA39dX/w8M61Tb6OOtjIdtLkf9pM/BHRbxYzYkvQBSKF8e3UTkPMvjazt2C+QY0OIb7EELc1EOLagQiQDBfsU9psECsgZIFKrj7ljRBaSTwCsQXnn7nVvWc0gLN3cQ6Zm84o4UdvmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149523; c=relaxed/simple;
	bh=Q83QYgMg9BNvYcSvd+0OOQUvMk1vcqMy7DCAkX3vSsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLSUi6H/aruqkf+c84UaPbq/m3bEjQqv5VYoO+AG5E2e73eEmXmTArGTCwc8aeHspvha6KbmFpZb8wuOc9VBJp5B6C+XR570Eb4FDghVGOQrDmeGe/VwC0+GU1KbuN+WylFHIe6jRL48amowfXPqyXi5q+YQuFIn3TEdWtfps6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ePu0mX4u; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30918c29da2so22667281fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 06:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740149520; x=1740754320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HErEzyWkwZ0RWbaKsVAHI18mvYGkCDcx4TEVCFIo6Ww=;
        b=ePu0mX4uLCR9UaSHS0mKe82zg3BoMIoOtlqJ0Yo7TDSPa2+uI5PTb8qUsr1GatkaDi
         5O/HQtVHKKTrpfNOew6ZpIezyOZumtkpSVeXJ3V0b47bRQrWZVrUZqTSBbIGwQRdBjzM
         fmOLSt3KXeEkk4+05Pkn+AP4feDw2KNNOjcW9aEX8rOxJbZF3sfVhep7pY8RB84aCkPA
         mIx9xU0Q9373EpvJalD5PMQ6X6QdQTaH6A96vJsiHZKKunHjop9ULflDMjG1LgOSvRdW
         40PutE98+etUI4QLKj/1zR/IH21MDfgpQip4A1Km2jxemkX36pWU0+CaJHXnyUAt3K8O
         VvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149520; x=1740754320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HErEzyWkwZ0RWbaKsVAHI18mvYGkCDcx4TEVCFIo6Ww=;
        b=LvkCumk3Sx1ZhcD+4hAOUQc3CZcS1IPmMz9fC5LQ/IN0u8v2M/wdQOeC8PZ2StwIT/
         m3dqd/CIU0Usp+5kH4Sj0ZIO3v9iSr68C13+8jN+Y23+CZI6RORUVIrF7rQXpe3sHxat
         MoldLCSTKp36rSXgbuymazQdaB+8uF5YROH/2Eiyk8OgxRGtVwA6ex6tz2D7ErHQjOz6
         b4Z8/saN4Rr99U8rgZQ+xH49rF5NCWSI5/2NFNmGLTXXTdnOIwmftTXtoDlndJ2kYURJ
         OYePeOeUXsr5MvKUdlSuuwimTq8pmgyEEkACh5T2AGknnIjuEscIpn90a6N83jPBZHci
         RYEA==
X-Forwarded-Encrypted: i=1; AJvYcCV5crCp1GZ9jwju40xHhVoq4XZ1vEUEoK2F4NLo2tj0od/cgKWhZz65UIexpURe+GjDVShMHa/5450P1P7i@vger.kernel.org
X-Gm-Message-State: AOJu0YyE7IU2kbqpFhT2D0FUkfYKoOH5oQd2BIo2xyDlTAKMUoypynvu
	yHdMBzGNQgDudEUiveGkZulYbkSw8zZKk4BE4lzMWMA9GyRDrOp0G068KpsFclY=
X-Gm-Gg: ASbGnctAjb1KeYOJtu3vIhTJOvzBXwRSARChhoaBC3Q5vsOslBvEXOpLISzW0cCHSVR
	bnLOgAORTW6SHPOdAE8BEZgzaGS3IMVM6iE2OWFYK7HHUiIt/ITw94Bgp0P1qyfhVO/fotxVBhh
	OF+uNOV0Ml6NyZtr2cK3Xl1q6lYSh02RjuHVngz73L+HJ7IWbe8IkEDmCKXwBjLaVU5UiZ8AIxo
	X23jTldGqJA+o8w8B1a8pvoOvVhVchYZs+E8871xjA/8aXJuCOHGeBzkwUfjw0ESq/qFlbfDEnt
	NPvHIE3ewuWCEjAz2VweOsRtziTC5yqf6E5IQbOE6GUomfqWYEWjfQZmD8ocKsXjs8iXrmIkvpd
	F8Q0HvA==
X-Google-Smtp-Source: AGHT+IFNLcfJ7gKB3ypJv7fmqVunoNkPKowHqZRPbtqkqs0FOKNliqghvaJdULQs4XtpGOsuoHAisA==
X-Received: by 2002:a05:6512:3e1b:b0:545:1d13:c063 with SMTP id 2adb3069b0e04-54838ef088fmr1338727e87.14.1740149520104;
        Fri, 21 Feb 2025 06:52:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545317a7525sm2043942e87.13.2025.02.21.06.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:51:58 -0800 (PST)
Date: Fri, 21 Feb 2025 16:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: amitk@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, quic_srichara@quicinc.com, 
	robh@kernel.org, thara.gopinath@gmail.com
Subject: Re: [PATCH v4 4/5] thermal: qcom: tsens: Add support for IPQ5018
 tsens
Message-ID: <5quz7ulnxvhsafmjxw2ktwfrkqjcnzeao2msfwdhltoz6im3c2@dh2dbczl2qkn>
References: <hmhagxzvumlmzvnbw533ebzilbvknexarsnxjfwi4djq3eabkc@efferfxbxkt3>
 <DS7PR19MB88835F4120912ED00626709B9DC72@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88835F4120912ED00626709B9DC72@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 21, 2025 at 06:41:44PM +0400, George Moussalem wrote:
> I've just checked the downstream dts and driver, it contains 5 sensors,
> but only 4 are used. So I propose we leave the number of sensors to 5 and
> adjust the commit message. Thoughts?

SGTM

-- 
With best wishes
Dmitry

