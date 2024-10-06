Return-Path: <linux-arm-msm+bounces-33235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A005991F7A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439831F21798
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 15:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A813D187840;
	Sun,  6 Oct 2024 15:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YY6bkCmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477618733E
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728229317; cv=none; b=O9VBOkZT1JwCgRRSyT19vUuOnub43TbBPVetNGRkvUzBs3ku4EtD17zuLquspyPxJIcbZh/ZBAg2zPm1bOnIHNG//+Id0WMamZlF92cz92ITh2FkAfJm81cv05XXPgBeRMSbhNCrnOX38HoWJXjftzHsdNWI8ibr6mulNqKzWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728229317; c=relaxed/simple;
	bh=ZYu1p2iCUXXqlinc4FOntVJQpB0ttoG4OyLaYqbVpoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0Va+fPUfPwYdYj18sqey2cS1ELoQkbVC0tpo7ptrlFnIQ+x/fFBeOb5mYS9ODnwzpmSWDdYHy8oJx6MwuRkQBOyET++YePwiBpvx6Q2MM8pPTrUkLbeHRyrjKPRNBdZPNg7ss5gZTbmrQVzxROZPAY2kdMNs4Zz3GbRtIDOhHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YY6bkCmC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53992157528so3860140e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728229314; x=1728834114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4p9jMFSztyoNE904oPFEPF87mzw4/12acqenqKvZUA=;
        b=YY6bkCmCWbuMtDjphtxjgd0nswbQCh8dbT1cmUU0vU3eKCzYWcY1UIzRsTtGhBsqWy
         Nf5JXslcqdfnAvnTk1oDNkNG+/CJI1pU7h2UIJxpbYLV9kKX7w2YCGxMa1o/Vva549kJ
         YKgBvB/a1SNR59r51/jdR5M0UeJY42wkl1eQ9K21PwVbGyNUyS9le92mB5CSalXM+5cN
         3K1/+LPE83JkQqoFBsxId0gc9Oo+/qSNGIJuV94SgOmr9zHM1bovgXLKNMv86LJhUSii
         Ogwo5nhS3r9/NGgtK8DLjpw7eclsAdNPKrwjKW6C+XLqNs8uzy8I4LsonJqk0U7kFaDb
         cTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728229314; x=1728834114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4p9jMFSztyoNE904oPFEPF87mzw4/12acqenqKvZUA=;
        b=K4K6Oy6kSHgoCMYe9bI7+7jCLgSyUwKJ1lq2EeID5GXRUkL6SlJTd7Tc/7UBe0//aI
         f2w5dAzK23V8EdRD8MB2Ab4GwGEYHN5BX5LdRp/EQ1xrFGS0hh4CL9+oALT3xoEH3TEx
         5OcGOx5yNR14CYoHqU8s5DKOycvk/nlVmCsoqWYzNyPItzD0Hhggl9DTxPeWjoVGadqJ
         4fRm/oyKc9YjzUim4T8+GKN+LDU2gCYrQePrSOWKBzavIGItT7TbsvYYTenn5dimQOsa
         3AWqPWjYQ9D8/PnuXUAeA0YkS5vYC+62v4H4F7gwkJOVKI3M/17H2FyDSTFVAmPh5+tg
         4olQ==
X-Gm-Message-State: AOJu0YzhoNh60rk9y8dxR2kz7BbYzJHo0eZjAG862y3M566IKvuDa6AK
	0txYfcmrsQkXtC/iMHVR3fUAGVGH9zqf5dXQo74b7X4htodPORlXGR3zphbHiKg=
X-Google-Smtp-Source: AGHT+IGHyll29gxgPVrSu7EY6tFsXaeJOH6QVOYgehdPBBFKLBFBH1xiC0t8K8NJD7F1RqXQRBlrZg==
X-Received: by 2002:a05:6512:3089:b0:52e:a68a:6076 with SMTP id 2adb3069b0e04-539ab9eb010mr3830938e87.49.1728229314192;
        Sun, 06 Oct 2024 08:41:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23334sm542714e87.184.2024.10.06.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 08:41:52 -0700 (PDT)
Date: Sun, 6 Oct 2024 18:41:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: fix sink status being
 overwritten with RP_DEF
Message-ID: <4outbhuix7ivgvzqwymttxwv77fuvuwq6cj62glccknc4ftjei@pqq4n7j2d77v>
References: <20241005144146.2345-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005144146.2345-1-jonathan@marek.ca>

On Sat, Oct 05, 2024 at 10:41:46AM GMT, Jonathan Marek wrote:
> This line is overwriting the result of the above switch-case.
> 
> This fixes the tcpm driver getting stuck in a "Sink TX No Go" loop.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

