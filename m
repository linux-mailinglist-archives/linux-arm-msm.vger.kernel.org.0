Return-Path: <linux-arm-msm+bounces-22341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A76904564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 21:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9481C20613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 19:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23FB14535A;
	Tue, 11 Jun 2024 19:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jj+u7llz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215078595F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718135833; cv=none; b=f20rIHkl8l+1PLMXrcBM9+FRnIqYshIHfOvwmzD28Jl8eyqlNk6gAqlL6P5F4Ayt+wgF6ZUOy6PuI3mpz3GrCAkXwzoyFZIUyTFU03LNYvcLoYH/FkQUSz7Z1Ld6mVB17PXWOZnS8Fcu1Hv6fvQhXWIXS9ehLil2XUhZchJaeLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718135833; c=relaxed/simple;
	bh=SSh4CLZGR0x7dTcNZI89uDAy8jCEgi5taxgXm3czsKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICu2ZXghDsrC/8LCiM6tOap7A1oMDkJ75yR4Cav+7nW5uJqtgClC6k+bAzJaUDojTjeaj+c27vekbCNvXpylvLjl7LIIp6RysTiVzzOMD567UUm58uRMIwvSQJAM0i13eIvPPcbECTL5khJBgEX+1MtxnOi+KnsyJDksPSnsB+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jj+u7llz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso1755933e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718135829; x=1718740629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYJ2UGz+oF03p364Ad98W7RimsnHbNm8aDnnj9gG8WI=;
        b=jj+u7llzI71GBrbfizbY5mxesYLdhODdQRgpH0xHJpBnyPtAK5u0OTJytQd5VCZjcN
         LIQpCSuywa9wUVb7DM+yHVf//PNU8XONpDNWFgLWI+9jo2rS8JsT7x+pZAuwNOZFVys5
         w1pjtoeXGGlNJh9vVRPAgIQDkrmiD58aWVWxpy0rjSacjllDKG/UIil45NCq6rz6ZcIJ
         UdpGD+iXxLhPh24ixlTC1OHqOrqC5z+rGPE1XsSDpXXu0djkEwsiEKBTaTJfI7FYIASY
         4AW/R883KvuhlTHNqtB0SZ2vMnG18Wd/RtM5VfunB4IcpCH1aoHFXok2tyJ0WyW/esgi
         G34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135829; x=1718740629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYJ2UGz+oF03p364Ad98W7RimsnHbNm8aDnnj9gG8WI=;
        b=nAXX0JodRiRpKIdEtIx6dJE9Wlx95Yz24uwu2Cn9qWPbi86HFXVWoxJ01HE9I0Zdes
         OcOX+6bHmGdd/JDksCqx2ecNbLWXkqw4HjzYYHU+RoCx3pY5CSRZLbMcaq6mhy1/a61P
         iAfLZ6VSgoDO6NrNzJOdihLZ/P3ghNZ8799LyH4iVwoWdptSkj6SIVRPZZXsWQ9a+VVh
         6nJbnEwgYG0euHeEQ2MDo9FjW7pXySTNBeMY2VZTE38QFEiQQNhquVk9SkOSXupf6gZc
         Ob/wE5UiRV+Wjr/86eu4HA1v8Y76La/Hxi6sFGyuJw4pGDocHi9C/H4HSJrdkK6nfJTM
         hldQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVGJIo3reGljtJhGRRGMEHfNwGjc+QW1CkD/ZcppyQOfmScFCNnsktgU6GoNMmW8/cdCQuStvaLElp8NCi/WAPC3AvjvNPRDrMNra5KA==
X-Gm-Message-State: AOJu0YwnHDUG/9RwRFazvHCI4jV40ZcQLMGc/nElilz/5l9KPH1pa/3y
	ofbRMXGzivliybARgLvRzPbf7cyfG6XPmbCWmDbttcglMCbcRexTO6hlNhmvAsQ=
X-Google-Smtp-Source: AGHT+IFmcuG3Hm/R6MQONyGcWIrBWkWSTmgDdQ48CSrIo7MVm8a7r4HOC2K12S4xTgblYrqS2iibcQ==
X-Received: by 2002:a05:6512:b22:b0:52c:999b:52f9 with SMTP id 2adb3069b0e04-52c999b53e9mr184380e87.57.1718135829296;
        Tue, 11 Jun 2024 12:57:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8012a690sm1559312e87.72.2024.06.11.12.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 12:57:08 -0700 (PDT)
Date: Tue, 11 Jun 2024 22:57:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Caleb Connolly <caleb.connolly@linaro.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v5 2/2] misc: fastrpc: use coherent pool for untranslated
 Compute Banks
Message-ID: <jorlpqmhntzavj5lffxddmuhjdjlis5ccbuunao7p5pzwcqd2j@eetql7bl2suj>
References: <20240524161423.15392-1-me@dylanvanassche.be>
 <20240524161423.15392-3-me@dylanvanassche.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524161423.15392-3-me@dylanvanassche.be>

On Fri, May 24, 2024 at 06:14:03PM +0200, Dylan Van Assche wrote:
> Use fastrpc_remote_heap_alloc to allocate from the FastRPC device
> instead of the Compute Bank when the session ID is 0. This ensures
> that the allocation is inside the coherent DMA pool which is already
> accessible to the DSP. This is necessary to support FastRPC devices
> which do not have dedicated Compute Banks such as the SLPI on the SDM845.
> The latter uses an allocated CMA region instead of FastRPC Compute Banks.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

