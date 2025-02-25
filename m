Return-Path: <linux-arm-msm+bounces-49383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B1A44E62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08FE188624B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7541A0BCD;
	Tue, 25 Feb 2025 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnJV8tek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7981D1A2567
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517759; cv=none; b=WO/llgcvn1MFn3RB4ic5Q6lj7ysttadlq5EN5f1zkVwIpyUQKd20ygjBQ7/mhDcHbyv5mZ51zvM42CjDfQ3+kOlRxpvXeQh0dn3k9XVYIqB8ypBfxAPVIK0DVpikPo4+I8kLTJk5f2HxX/X3kcjF4Q871NAg1bhd2Pr8KNIDr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517759; c=relaxed/simple;
	bh=f9nu/gjYpScp2GZzc6dQlyISc0mFy1UpPKMQt+2+SPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov/KD+sJINj5z2grAkCXmFAceU/qn09qz8FD/PN/LxgOhBpsDzlEaO+6ObITiMAHYBgiZQLJ1yRuN5I7mG7+uxiHA4SzvHX8mV+TFfm/KeRG6hZRzmj1plBUazCubMUlOS5w83haqeWKkqqNb+jgZp08/qgmjkVQqUjb/e81Ylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnJV8tek; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30761be8fa7so56851791fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740517755; x=1741122555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4XoCEWv2ZTyY24QshaT4Wp49xDJ3qBHY1WAxKeHvOQ=;
        b=BnJV8tek0H2lBSDSA1XJYLnSTGkX5dc7IAY3Bcy7+6xD5yTFyClsz7CB9j2aKrnjs2
         Pwr2aY4vrxkpZQaMaz8clZQhNxTSNvZpvy4U5eWAd1F6TSgBF5ARLJ3vo2vgrIQA0nyc
         37TMXeGfvF9gJuYAHcmcWQNCM6lYq4h3eIqFxxa6O4uHgaU4RfqqHQfK9mprkU3QnsVh
         UoExr8p2tBvij30C89bFkKXq+E9ZyyD0YveWloESi7rb6LMJ7lnxd83iZpeUYTFKt5cA
         hpdkr0aQvbL0gEKafcJgwd1u1ZksD8FwvOvU+mzSxaiSWuaFjSRgulHcJ8d1vSLC4tOA
         s6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517755; x=1741122555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4XoCEWv2ZTyY24QshaT4Wp49xDJ3qBHY1WAxKeHvOQ=;
        b=QTzUI0YlfiFeGlcAMDAPTe1LxDM/CcpoZ+o2rN7VG+hv/22yJ1Wo487r7TM2awnCc9
         S1XDukO3j6bUeRelYQ9gG3NWugCd8nmh5nz7hVr9qbaI9JHvuwf5l4C7e4Og1QBqFQR5
         7aGZWOUG0g3ciYoXuv9XK3Cm0mnSEFAnNzseXG0v7Ww9mb4JkgRxjWUNQLZYnM/bxwY3
         13997xcfdJntbnsYX5C09WXlx1toMVGhi1Jvb9m8HTEXcQ3ZWRUVagJuu4wezyxYUYYL
         T1bEsrWqheTg7hgATeikMIXynoZ1u3zFp4Tp6MwKrkk7c5x/c8SaY/UwYJb8wVBhQpw6
         Mjrg==
X-Forwarded-Encrypted: i=1; AJvYcCWn5FG/KaguPjX9cBiSGB42s9Z5D+hZPqbDBD+cZAG3OleB5are9IxDH/aYX4+KrAiND4+spWMMyWktJopK@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyc1jFxvTd+c57sQCeKod54qU05a51C29IjU8f+2SgjmXzZIJ
	pc4P3BeIw2OdqQAot2BCLjMrajaYnsDu/h0+rc8tBzVtVtdthjAEtB0+YmSjSYk=
X-Gm-Gg: ASbGncvpCFsOgAN9lP6A1/OCVmfGz7PJ1eKZUWXtd9u51XIraFwTqssyqNFwt6wn4MI
	EPoiAaGHRvYGAgA1C7O/r9seJDeIxeEu0WAfuYqgHTEeCQdZZnZAF2zezLTj6Hq0l/UK9LxKPcT
	GIP2DfSNMosd+8jC1SiUWEYLKSRqaIFjgUU9GJcZDf2tXWx7tPZuygzdE55CdSqaU6d5mOV/lJT
	OltlIydgpD2bU8zhtDmDL679LNb8vxLftx6DGLrHiXzcm0mTmwTro/lMffozHwlKUYpC5V3SxnM
	/GBLTsXwuNk63G86TDswYQzAPyFHXsqwvC2Sd0QbhKHBgtus2op1ttjA+o4+IzRr43eehdqbv58
	aM5HQIg==
X-Google-Smtp-Source: AGHT+IHZW6d9rnGPSbTopC+zVuHs8+WHbIcOmyVc/br2TV9KZrFgTMvD/wPr004/MWm+y+QcUxD/DA==
X-Received: by 2002:a2e:9c02:0:b0:308:e9ae:b5b3 with SMTP id 38308e7fff4ca-30b79132d13mr10353661fa.1.1740517755543;
        Tue, 25 Feb 2025 13:09:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae82d6sm3139931fa.110.2025.02.25.13.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:09:14 -0800 (PST)
Date: Tue, 25 Feb 2025 23:09:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	david.collins@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] thermal: qcom-spmi-temp-alarm: Add temp alarm
 data struct based on HW subtype
Message-ID: <n57hjxg6v7z34qmlvygfwakol45dtj6jgma56w3xqxbj67op3x@5n7yoyydnxm4>
References: <20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com>
 <20250225192429.2328092-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225192429.2328092-3-anjelique.melendez@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 11:24:26AM -0800, Anjelique Melendez wrote:
> Currently multiple if/else statements are used in functions to decipher
> between SPMI temp alarm Gen 1, Gen 2 and Gen 2 Rev 1 functionality. Instead
> refactor the driver so that SPMI temp alarm chips will have reference to a
> spmi_temp_alarm_data struct which defines data and function callbacks
> based on the HW subtype.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 103 +++++++++++++-------
>  1 file changed, 68 insertions(+), 35 deletions(-)
>  }
>  
>  /**
>   * qpnp_tm_get_temp_stage() - return over-temperature stage
>   * @chip:		Pointer to the qpnp_tm chip
>   *
> - * Return: stage (GEN1) or state (GEN2) on success, or errno on failure.
> + * Return: stage on success, or errno on failure.
>   */
>  static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)

-> qpnp_tm_gen1_get_temp_stage()

With that fixed,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  {

-- 
With best wishes
Dmitry

