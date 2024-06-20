Return-Path: <linux-arm-msm+bounces-23382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBFD91095B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0E0281E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1551AF689;
	Thu, 20 Jun 2024 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0P6wIfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DF91AED57
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896196; cv=none; b=BFGVgYqpgPhaKYkCxktNiudKnAurCvifO+/Qt7V/kJdShsfZ4OVMb8YLnl4zPKxfX5lTfd+t7DOXWiObCFjm+7YcoNbC8HHyJsEkHXOg6zCn5+oWObh7ZKo47+BmCHogk2m2z35s5St3ilCVqfCiKSmAAuGcfU5Hze9TcIQFy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896196; c=relaxed/simple;
	bh=mfiwSIjC731sExU1owoEvvO8FCSEVIoCYkKggzTldDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrNLGu7WDT5BHCyq7vwz74t78viXl/WZ1pgvWL61IxymV6VdMXq/VycIeWIO7lPIot6Ck6j7Vh5q9QzQ54Fov7AgtFlQrWpdy06sHwYunS5/oEqLRTe7g1gDCuKuXMFaWeswcdAgT5fedIKaILEbtdO4kGj1ce8pzRrbOO045Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0P6wIfa; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cc671f170so1807135e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718896193; x=1719500993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gK+thIDawbMI8D6X0tNOPUzlxQcTHptuQx1Z2ceRXM=;
        b=V0P6wIfamtHqFfdSKj+7giMe3rhe9Saloyfx06RP4zZ0dxam+nYkdJLhiYR7zFY5Ie
         qkHDnkBjV3Qu+1IxADNrakETXBVYpu+Ynzjiu7SwMfGjctAmni9ecnygedl+kMEgFywP
         p8q42rahO6+xzGYFuQISPWf2Xu4eEEvG2P4HDc7wldGhBPcq13FOI6N/Bg4Xo/zLSu/c
         6o8bBdsxJDeMwGQFzVEnDN9DjIl2ohosU7qsGOnJgIab1pHMWpCL9JKuVcb/TYMSPBvz
         LL6B72fExJ34Jn2uT+YyrqVrdUAXJcS7uLZWnF8jmyOe6+cp2mUO5jWmphIaWC6NX8f+
         VOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896193; x=1719500993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gK+thIDawbMI8D6X0tNOPUzlxQcTHptuQx1Z2ceRXM=;
        b=ioMN0Wg4jIt8rM2IR7ghcfyhLWOVZ5QAC+3r4+bCcN2Tboqjh6PTjDiHfKkfrMinRA
         Bz0cO2snL6xlyB4+ukxM95h2t8jeD6Fux2FxHzvlfKDiyazdh1dR5xg2+jVSgH/HSQwf
         lE/8Sw2H6uYzvTPCzrRHoHqQZd6ig1520KWmaYJsLZBhXp8KRqTkxq9Bo9n0XwaABVQO
         xbcjd4O7SnjTI3Gv+Q8Ume90ktEgccKu3Ffmn/5E9jOQ0XdVyQetqpYGRjCnzlmAKwAQ
         dvj04L/VEXth0GSGXBWy3yjinRi43Aqvn3NyeI0XJaqTyySypuYltNQ4rrJjN5Qf80yT
         78Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWPQpUe9mxyCBGD5nUoWkUBl/79+QKqmCfutcappONTbBq34B4Opy/twgYb2ZD5JpxB7vWEorYSdDSNhPw/IgIdft1xyEYxuCfHC+EcBw==
X-Gm-Message-State: AOJu0YzTdycaxkB4/YOgAOXJdu7U+lAJhZC8DTx6LI/h/BlrIKsufoiB
	XrZJOdrSbiBP7ovrjOGjr5D9jQ616WhNev9/LzpFeP41BCtvWO8PmnYtjTKEhsc=
X-Google-Smtp-Source: AGHT+IHZ7VSN2wu7ZM55UCXbxtOpvLmg+Rz6tqxnMXIu8tRVtuNvG3de09teEXUPAPTQMcqu6Cz87A==
X-Received: by 2002:a05:6512:31d4:b0:52c:c64e:b902 with SMTP id 2adb3069b0e04-52cca1ea264mr1869080e87.27.1718896193490;
        Thu, 20 Jun 2024 08:09:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2826269sm2091191e87.61.2024.06.20.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:09:53 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:09:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	quic_rjendra@quicinc.com, luca@z3ntu.xyz, abel.vesa@linaro.org, quic_rohiagar@quicinc.com, 
	danila@jiaxyga.com, otto.pflueger@abscue.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Praveenkumar I <quic_ipkumar@quicinc.com>
Subject: Re: [PATCH v1 3/7] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
Message-ID: <jfh2xygjdoapkno2jrt6w7thlylgyp2tk7oaczundhxvi26qel@ahtskgn4v6sp>
References: <20240620081427.2860066-1-quic_varada@quicinc.com>
 <20240620081427.2860066-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620081427.2860066-4-quic_varada@quicinc.com>

On Thu, Jun 20, 2024 at 01:44:23PM GMT, Varadarajan Narayanan wrote:
> Add the APC power domain definitions used in IPQ9574.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

The order of the S-o-B's is wrong. Who is the actual author of the
patch?

> ---
>  drivers/pmdomain/qcom/rpmpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 


-- 
With best wishes
Dmitry

