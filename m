Return-Path: <linux-arm-msm+bounces-40996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ABD9E9086
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35121603C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BEC219EA2;
	Mon,  9 Dec 2024 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+p8Qlt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DB219E9F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740600; cv=none; b=gWt22dwwJKFa6uuC506dBPrj/tKOkPC3Ch7OZ8KhcR8YbuVD57sLdCC9YC+lmM6L0wqnWhtg5Q2Qi/cuKCltC9Cjor2++f91J3S9LVNRfYWrNJ2mgJ1k+NwNnDUtdPFGpZKhqfQr8is+BpJauzNZH4PR28IYJ0FF4nXHAShUumU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740600; c=relaxed/simple;
	bh=ACXO5Qt8yD2lMEn3m7v6vS9hAknZibi0zte3gkpeALI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPRNGuN+Yja6UB3dQwNyCP/m9SeVb6gEg6YCwX7G5c1fjRDPRsqUHlIhGfONeZGwAs0t3azEmUwDNPe3gXWaE/V/zNbgSoJlYSlLUWHcjXjWDs/rVG3GUDxt0iGVj/JJ4iFIRPqp7sW8SoxgSfp4jSaLx101D5k4/bhEfwf+gNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+p8Qlt3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401c52000fso938028e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733740596; x=1734345396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FuUdDMOOLDdlflJUIRitvACbstmB9pgtHWr8wBAP8w=;
        b=D+p8Qlt3Jml7fzSvpE23gNt73rqYa7Fmy0SP2/o7q1AjSthlx56OVQpyIUQ/HwAO3e
         hZ+dejjutJwQCWKjBCXj2svdcEhMgurLWpPOhGBsMHB3NPPLZQ3l1IikFiHQfsz7GtdE
         SopeHHg1T22ow6FPAq2TgFE/azeZpo5Z5QdklRjAF9xjaFsFjnleBjsGw7yfVCKz75/C
         RoAbY4N57ewtRWDwGPOBNSJDu4SOb5IRZaFz/aR65qzhDnMGa23XH9HEyqxR2sWWBcX2
         y+VUQfHgW34CY2AViRgNmtEqyw2SjuE2uBAceyE80V+2tgMVvBINZjs2AjOv+tfPrvvX
         xhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733740596; x=1734345396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FuUdDMOOLDdlflJUIRitvACbstmB9pgtHWr8wBAP8w=;
        b=jI1x+4oW/PPnmAcH/C1luhVdSnnFDKz1Qee5EsmEaJq6d+MRIJdqr+y73n+NEvbFI1
         u4Vza61ClHLomHQS57g0qOjhPVwsqngfRko3/WThID9lqEi3G6RndZlSPE7KNIYl5awA
         QTb+PvW9p2af3EQsl82ybQPgqDopTSB3UAu7KySL+LHVD0TtFhsXUxtX1senfOSXqzPl
         2PfgsiCoFY9eAZ58ZJsKNFPs9r1QUAkgWAu4WxfY9J0/RsdBEHC/2eo9pvyQVzwf1fxU
         wXjfbvnyxJfTeqmQxh9ec26mjpQOC+uI+oyQ0RZE9Su8JOCVCD9ar57hkrwPYSYWeat7
         06qA==
X-Forwarded-Encrypted: i=1; AJvYcCXm1vnn9Q1WBgVSJioH+FslO1M3wZIc2xeVe7apcmaL6vUv1cu1TPKfLK6LckFOfSPW/V2F79aA5eIv+zHq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2JHGYjSyxSdJRe9JbQCnhsOKsGeqFk0y1a+/lZ5+LHuj/GWvi
	1EvM3MTlj8JQFJX85FTpOdMmEr6+PFvg7t2/zYqPi+J1G5yL/0F6/MszQwYAzkc=
X-Gm-Gg: ASbGncuhJ57yjNnHg9Zc/2muPQ3BSFrvRMxfSecyDuKnxACFY4h1kgpeEizip/62L5+
	F6TgrybHY8HamUuitT+RaVigkGXJKcBaP3AnZfc2CYSkh2QArmxqlY1xbsNYRAABhHsuzyxVGca
	9KDLggJ2mhkbQUAYb5cUXPoXlMLDkyY4kGeBV57Pug6rQb32UNq7j0HbaeZEaf+Aaw0FnE2u1Wo
	hz9MQ946zxJi7UH5DfC3xoZgVgX1S3YHFmigbKP24T71K+tOhLB7CRIclJHYr6Dhlc/4YvkMpCW
	H9JOKFm89Ps9xMaTuDUfzqexpwfBkg==
X-Google-Smtp-Source: AGHT+IG0/+SKBMw/5f1+ZyEJlbWxrwfew1srfVk4IGIHkI5OVmqUeJfGef6LgALCfmJhHSEEb7IV6A==
X-Received: by 2002:a05:6512:4012:b0:540:1c67:fc35 with SMTP id 2adb3069b0e04-5401c67fccbmr1296490e87.21.1733740596288;
        Mon, 09 Dec 2024 02:36:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54020b50393sm169927e87.20.2024.12.09.02.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:36:34 -0800 (PST)
Date: Mon, 9 Dec 2024 12:36:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v5] dmaengine: qcom: gpi: Add GPI immediate DMA support
 for SPI protocol
Message-ID: <4nazbhr2gqgvxomy5ewewnrvivppof3yxo3yebkhkfvfls25pm@kfkvizxg4cqy>
References: <20241209075033.16860-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209075033.16860-1-quic_jseerapu@quicinc.com>

On Mon, Dec 09, 2024 at 01:20:33PM +0530, Jyothi Kumar Seerapu wrote:
> The DMA TRE(Transfer ring element) buffer contains the DMA
> buffer address. Accessing data from this address can cause
> significant delays in SPI transfers, which can be mitigated to
> some extent by utilizing immediate DMA support.
> 
> QCOM GPI DMA hardware supports an immediate DMA feature for data
> up to 8 bytes, storing the data directly in the DMA TRE buffer
> instead of the DMA buffer address. This enhancement enables faster
> SPI data transfers.
> 
> This optimization reduces the average transfer time from 25 us to
> 16 us for a single SPI transfer of 8 bytes length, with a clock
> frequency of 50 MHz.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> v4 -> v5:
>    - For Immediate DMA, instead of making dma type as 0x10 and then
>      enable 16th bit of dword3, directly updating the dma type as 0x11.
> 
>    Link to v4:
> 	https://lore.kernel.org/all/20241205170611.18566-1-quic_jseerapu@quicinc.com/  
> 
> v3 -> v4:
>    - Instead using extra variable(immediate_dma) for Immediate dma
>      condition check, made it to inlined.
>    - Removed the extra brackets around Immediate dma condition check.
> 
>    Link to v3:
>         https://lore.kernel.org/lkml/20241204122059.24239-1-quic_jseerapu@quicinc.com/
> 
> v2 -> v3:
>    - When to enable Immediate DMA support, control is moved to GPI driver
>      from SPI driver.
>    - Optimizations are done in GPI driver related to immediate dma changes.
>    - Removed the immediate dma supported changes in qcom-gpi-dma.h file
>      and handled in GPI driver.
> 
>    Link to v2:
>         https://lore.kernel.org/all/20241128133351.24593-2-quic_jseerapu@quicinc.com/
>         https://lore.kernel.org/all/20241128133351.24593-3-quic_jseerapu@quicinc.com/
> 
> v1 -> v2:
>    - Separated the patches to dmaengine and spi subsystems
>    - Removed the changes which are not required for this feature from
>      qcom-gpi-dma.h file.
>    - Removed the type conversions used in gpi_create_spi_tre.
> 
>    Link to v1:
>         https://lore.kernel.org/lkml/20241121115201.2191-2-quic_jseerapu@quicinc.com/
> 
>  drivers/dma/qcom/gpi.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

