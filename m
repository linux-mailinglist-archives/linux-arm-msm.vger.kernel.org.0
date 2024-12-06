Return-Path: <linux-arm-msm+bounces-40719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F969E6920
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CC1281965
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 08:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DD21DDA3A;
	Fri,  6 Dec 2024 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEHB3Yfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6E6FBF
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733474343; cv=none; b=r3711cGkSU/QJIHrWtEINNnwxLXs8tdGx/wEHHwF7F0yDwl8PAOxvkE0ixJLlBds2y+24lEdcL/dci5Lmj42is1ijnL36F9LH0Ro8PMuxlyPxh+R71Ge08Xnfx5nOqD9MOzMBOSAXmM358nafK4BEl5h3peNLXRwZtnQqSuc8KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733474343; c=relaxed/simple;
	bh=CbzbQCOtdOjN0raEAF8iseTHj/jr2mmJa+ApPFP6pOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExKhGEEb9Rsre6f57DTvEgAmQ/gzCw3WuwZZyWKx6do1rWB1uxPg3QVtkwPKldOrB2KofEykUxJ1p2/xyNrWyPjxNL8KD2/IskRMWvBfIM7yZ0rB/GZ/uABvW2AmvtzysbK5UQ4BI8KhCKuwWJzwfr4sNC3cDLhtNX1JXXUKL4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEHB3Yfh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso22053811fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733474340; x=1734079140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2pvfFf/6NDNSMoinPIggBLinWMjnUSRNWqgC3AbSwgA=;
        b=LEHB3YfhPIlY+waYLjnjFx85bCTwjDemhDoOD3uRq30N/C3gGCZRp53u+pe7cUdxky
         vSFiY50KGt8U/h9r+YeiGQxzdmeZVwBqHNfDmovTBtbVXI9dlcyR6WocRjKWxXoO2zUX
         kcEsrohrKmMDyptVBGLlAoITrjI7zSN7dwBYaJJ8sFd1ProlNhGyujay/PsWRIWgo+Ln
         RLIBG/0IyvZ8soP7Gyq2fQiTHpt3T5eGYpHZ4g/1IESXXeRaGeHr9kaWbylelPHsEcQq
         9l1qMjh7M/XPUdYkkXKgLTyfhjVMdo0LVypNB5fecCuktCV+UUsjOtBApl9Ocm2AeYsB
         fM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733474340; x=1734079140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pvfFf/6NDNSMoinPIggBLinWMjnUSRNWqgC3AbSwgA=;
        b=ECWHb/GAJIXooznqFA8IAaaJS+15wboGxXVxZXT0yJNHTxQA5h9z1MOEZJO3NHi8Y0
         VWQ9oUoJb7KZlcRkKP9WS7Y38hwAb5gqHHpu1DPmLT7ibP9Rcm1kBxkpVPEDit1h56Y2
         wGpQvwVDjW1S+7dHRtbNMsnrenXV4vSyXRauP/YIwCFVFTLSnwAiTWw1xVsugPTj3RSK
         LYIw3nIvrgT+EXBm553XrpQEWbehee6Xo4Lcpk89ORHI1kCY5pbRdXw6kzaZXe4Fmen7
         OLalUWa08TLJBMLB9m4z5GHrAeGwKmHDnAAbzn3EL9BuyRK2KeRcnY3xTv0NYUKTebli
         zQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOWQU4SbUpmqhNqhRwd1nENIwF/Zj9VgGQjv9UJgRwpjPU3onfmhZ0SJDoWc8h1q4pxexy65AJGsAhdg8v@vger.kernel.org
X-Gm-Message-State: AOJu0YyGafg9Ss5DzHk79O+fFjcocFjCdGD4VGGggBazdmETHhjZ8QSq
	JFK62fzQO87OOE6CZpr6GIWgP6Ymb6c0JzKI1aR//VhilPFmu6VgNpj2TVr9sLI=
X-Gm-Gg: ASbGncsUVh1WN2ocRwQKweRfhSxE4ey584QMq8rEPxqPltMDN9VnvVwryMOclJ8qKQu
	4wRjFHfS1wlzEmVdWdrMDI8QFo70RfvPB9/eq+25DPXLaXsQs983r83qylOIIT0EGjg79l8Iv78
	q5SP9yU0/biCtuxv5YUHVRcMoVAyx50hwNoftOt1qkf/pNtbyzVemnf8J0dBmT+jbTzqLfYtZbc
	FA3B5HUuoVjkzUWVAkSB1qsDo6IiJvE9lugK7seHnntjTHfITufx4pgRecHJ+7odfRWEMfNRbwF
	53JcJyFYeUuEDsJveei9rrC0mIdZNw==
X-Google-Smtp-Source: AGHT+IF6jOtbfo5h6K0/IZgJWEqqGaGGkKnUPirENty8sxWRk/6JZs4RfsdDJScIMrUIWenQ2Ic/pg==
X-Received: by 2002:a05:651c:886:b0:300:2dc8:41c0 with SMTP id 38308e7fff4ca-3002fcf312cmr8313101fa.41.1733474340135;
        Fri, 06 Dec 2024 00:39:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d858b4sm4111111fa.4.2024.12.06.00.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:38:58 -0800 (PST)
Date: Fri, 6 Dec 2024 10:38:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 02/45] drm/msm/dp: disable the opp table request even for
 dp_ctrl_off_link()
Message-ID: <pouqn275ajaerpicruqepijjs4zuteid3ocqyczdja6o2zhpwl@dt3ckyixmzrf>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-2-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-2-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:33PM -0800, Abhinav Kumar wrote:
> dp_ctrl_off_link() was created to handle a case where we received
> a cable connect and then get a cable disconnect without the corresponding
> dp_display_enable(). For such cases the pixel clock will be off but the
> link clock will still be on. dp_ctrl_off_link() handles this case by
> turning off the link clock only.
> 
> However, the vote removal to the opp table for this case was missed.
> Remove the opp table vote in dp_ctrl_off_link().
> 
> Fixes: 375a126090b9 ("drm/msm/dp: tear down main link at unplug handle immediately")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

