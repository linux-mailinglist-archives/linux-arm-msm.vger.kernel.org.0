Return-Path: <linux-arm-msm+bounces-33876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EE998875
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488581C22F7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD101C9EB5;
	Thu, 10 Oct 2024 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dV7wFJjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88A51C9DCB
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568596; cv=none; b=vEbvrsyyKq//JLeoJIN9XjiILwW1+yEnij2DFEG4EdmfticzYleR5hknETFL3upkp7YTjAtwJZWUU9ilBUyYBtSZuI26ZlEKM0Ie7X3Z7q7jX/lFvQEfkyInHTOU/ri4HIUydGCaWDtYC5qLgxQrfTYqlSX+ZM209GHYzrHNQ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568596; c=relaxed/simple;
	bh=6ItZX102qFw2YAGORz1YdvSGeh/1I8+3VDC2XaOcCIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+x0cq5fBUR3/YGEn7hsu5jJ1ttZIdhCpvqlEY/XIFX1AVCOWlfvx04Lc74olwVqV8QD17fiZiZS36EZcG2SpglK4HKmc55K0m5P1IdJ7OD0nd879syBR/xh6CENj1kY1yOvMn7o4Zm/k3xbKzlaBB0JIshdbUc02bh6Lpkvn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dV7wFJjX; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53959a88668so1248485e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728568593; x=1729173393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MgEbP4QzXn0AIXKMH5GH9V//Wmvbs5ys1mABYvpoE90=;
        b=dV7wFJjXyhd6pbNi1SeeW9kj+XhjrFhpMNlFW49bSF+MnGBcrBDF1bIy+LzhpBlrw+
         SdBjU5582XyZ2W0eYdJbQIosyyoTuKEtMd/V2DaugRpHhpPMot9ndIxGslSiCRmxQnKm
         KDal00caZB9zyCwVXH3rmyY1H4z2uYeRnZ7eM+LagjVts52Ok5yyn6BBDa1fapTwi02+
         tvF4BEDeX5MSSMkVjHwiuO09skeOtL/91vJWjfzFriIN9oFXssZbLNgXzDaU+Xt/FZ1L
         EL+whtfN6PDkmDayVz1XR15YTFvGZn4e/nVTOnGzOZCjLmnmUbm+6f+vvhWy9N83vKxS
         y6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568593; x=1729173393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgEbP4QzXn0AIXKMH5GH9V//Wmvbs5ys1mABYvpoE90=;
        b=lPCY8jKyKV8OibaaUAYTKXJWIL7n2KWSN4B5/7ETMih+0iYmR43ezWPHUouI50uWR6
         bte325C/bzN2VSRehym/SGba77h7ofF8BODpyFUxD10m9WyQNKlEhP+edxN1M32YGAPy
         J5DQTTH/kgHne+aZDvvUGZbdJMsrg8Fl8ETMpo6FmPbFp8gAxq0zoA3lbhhwvOjXTA0Y
         Zy4DpvP/MTqzWvETb30B98Ta9/RZzPt7jwFoeD4OjEFn0qWt1tLJi/UJUW3ALfseF3/8
         555ClYQSGlkl0XJoQmQ+6lqCtIWY0S3g1MCYxVKvDySg6gdehNkOzn39qcAojwHN7iXw
         FS7g==
X-Forwarded-Encrypted: i=1; AJvYcCUmE/ypognWn78rCaOkruONJ8zPGc6zgpTYs0gvPnPmqACkdiMsoo/8aPWunhXUae95xFR7gyT2NpaOM9JS@vger.kernel.org
X-Gm-Message-State: AOJu0YxGv21EgRCN/+j9SWjf4GIaQtf4O21KWhTVZ9gxiEGY+CSUwugA
	9BVcwG4xmSsi/8UOMqviZFy9VsTdodbacuAlC3dbmQiNv1nCNlURXtZBiLYe/BU=
X-Google-Smtp-Source: AGHT+IFRJFs0J18XIpOr4N2kPvG4CArMIUph3kbLtDpAlLjw8FFX7qYAc57/vRjXHgekvKWF8dqMFQ==
X-Received: by 2002:a05:6512:acb:b0:52e:fd75:f060 with SMTP id 2adb3069b0e04-539c497940emr3386887e87.61.1728568592899;
        Thu, 10 Oct 2024 06:56:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8d8181sm260912e87.147.2024.10.10.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:56:32 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:56:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mantas Pucka <mantas@8devices.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH 4/4] phy: qcom: qmp: Add qmp configuration for QCS8300
Message-ID: <cdhcojf4xypiym4icdkvwgqrsickw4qlwlp4vmovun5t3gc6mz@eqzgylg2z6uo>
References: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
 <20241009195348.2649368-5-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009195348.2649368-5-quic_kriskura@quicinc.com>

On Thu, Oct 10, 2024 at 01:23:48AM GMT, Krishna Kurapati wrote:
> Add qmp configuration for QCS8300. It is similar to SA8775P and
> SC8280XP except for some Lane configuration settings specific to
> QCS8300.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 65 +++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

