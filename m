Return-Path: <linux-arm-msm+bounces-26895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F1193A016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C569EB21600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506ED1514C3;
	Tue, 23 Jul 2024 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkLk4Mfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C901509AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734835; cv=none; b=GYV4MqAFOT7CeEvzSFvDfqNBYmu13UbtVLI9RHOudUx+L7p6n2ciIDnjpZo3NqEkFoiQiekinNWT2LD/K4jkvUJ5M5H0C825bPgS6i98ilW1MdzGU8nXHrfaIpDQJowxRrVJe+aK/fFBnLeHZzLbwjg1tDKkUF8P/BfJ0dRH5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734835; c=relaxed/simple;
	bh=W7OW3Ejgfp7G5j4icOUna0C6UGhzfYE5ZoNeOw3JMyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQf2ekJgCKKtKKvtRvrhl2IoS9dBQgKUMSgVSiO1G/CZEny8jCQefnANlYO7aJqmnWK0FnlF6GTrXmT2Fb2Qf75Fg3x1nphwvr+xYk8upApg35mGTqpYYqhz3yYWACx7os4tcuyjcDVaZ2HeJnC6KnmFrxM+il5SrjjJwBIH1k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkLk4Mfp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so3023479e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734832; x=1722339632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hjlt0t66AG+BzODJZGyLjit24PidKbfoYtsLZ8osE8U=;
        b=mkLk4Mfpu++PmPspTzfAPROfQVTLJb4zyW8J5JDYdzz4HdmEWQEDsVJ4Uzv3e40u2l
         cIQ2YJbz6mBuxV8AFeSFUxGIYIbTfKMXjqan1uU3O+O8KRjuFKn9LJiJgmMrzFn7Umyr
         tRK0JXYvn4OKTW5olRIX4T+kKPsfPp4YW8eaYWTRO9VNKB3txk/jQHB8NN7bhnP5TVLS
         fNpNCIbbNR/qt45HwfM6hGKcMwFr69tnTqGlHjr+mQQoyiXIlscPxeTgdlvHsSfpJfqg
         5uSto9NVi9Hw+NBjdsZoAUyuJYOExnIr8QNoEoLaUOx25cZboXsrtWifnhy2aXJJyhFf
         3m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734832; x=1722339632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjlt0t66AG+BzODJZGyLjit24PidKbfoYtsLZ8osE8U=;
        b=LQ6+zQckc4aH1Q+bbCwQShYnu33Pi8Rs5W3ddqp/wfHswyJ3966I772H3nebuzqKOD
         6Wxldjz0pF5V+EQbKrY6aNdgAEa5oLFKXCnZKcY2q8f8vRuUvJPAzo74Mvi6vLZsSZ7n
         o64vfUSlbOaYwTqdmOF75z5O1/VsVDwT+i+1Kj70ho22g5p9x++R0bjFOsUonMiPNI2j
         zL8b79wgsf78QIHM6z60KEUpfijvS91yCjaKggZynLX0pf16BzGns7IQY8GreaNM4lr3
         J4oMqZu4zTo6eaEzFwfECd7FtyBkaMI0nfG4vlu9xK6NsGrORg9DhP+7AowylEvk9w60
         303w==
X-Forwarded-Encrypted: i=1; AJvYcCVfKhrWvyJPSfpsOBhptyE1NgKoa9zMHGpZXD2RbRycwXA93mzzKA7MJAAu4Xp5HVgaIVtoLT6cpBcgAdY9KFIBR0imsjs/jbzN0F9p4A==
X-Gm-Message-State: AOJu0YzkCglTz6xZANyQRarsUfj23WUep3+whj0ap+D5jh9dpEoYxF6z
	4/1zK+3g41FCf1fKLQ1MUAxaAIGKk6Nbo3DO5bkG34RTChGcdjE9N9q6Xc+JKZM=
X-Google-Smtp-Source: AGHT+IEbGSdRnrn1tMqSaQIsvU2xtF9ZvhQfnBkvrzoX6ZyDx0qPmdCjK7nDuJdNYROSEalcudqrEQ==
X-Received: by 2002:a05:6512:b84:b0:52c:d645:eda7 with SMTP id 2adb3069b0e04-52fc4046b22mr2098202e87.18.1721734831905;
        Tue, 23 Jul 2024 04:40:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f0212c743sm881109e87.26.2024.07.23.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:40:31 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:40:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	quic_wcheng@quicinc.com, quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/5] clk: qcom: ipq5332: Use icc-clk for enabling NoC
 related clocks
Message-ID: <tg6wzvgiv67gpf6cc3wwubrj7hmpj3tdzsxtkce5shwjhbw5lx@kxa3umil5q5g>
References: <20240723090304.336428-1-quic_varada@quicinc.com>
 <20240723090304.336428-5-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723090304.336428-5-quic_varada@quicinc.com>

On Tue, Jul 23, 2024 at 02:33:03PM GMT, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Remove CLK_IGNORE_UNUSED from gpll4_main as all consumers have
> been identified.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Remove CLK_IGNORE_UNUSED from gpll4_main
> 
> v3: Not taking Reviewed-by: Konrad as NAK-ed by Dmitry
>     Remove CLK_IGNORE_UNUSED -> CLK_IS_CRITICAL change and fix
>     that in a separate patch
> ---
>  drivers/clk/qcom/gcc-ipq5332.c | 35 +++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

