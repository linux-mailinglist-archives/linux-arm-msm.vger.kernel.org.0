Return-Path: <linux-arm-msm+bounces-30204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF07965CDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24F2286330
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66491170A0A;
	Fri, 30 Aug 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8YkC/2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB116F267
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010139; cv=none; b=nMw0DiPCtVv88iR4uQwTb3p0dBFlMNEKNxyYJDCknWKznS01pF4H9FJtJamQzFhITGBDHXsSacDhh7bd3h12tIbNtZusQTcy2yAaXLBjVNpUrapBSnCoB6IHeSiU/NLZVB/NtdBYmvGi4mK76C23IEvG1kG81EJvAH9ShP1psVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010139; c=relaxed/simple;
	bh=dGPvXYYPCXPFef3/PRhqYeXlbsHuxY/Cvb0QdeBIMCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7adHkR+4DOfrTYBweIep24sYUdaf3qrk7RRcYkOS/Dy/BwflehLCDmTGW3KIglRwGG7vd1P1hx/inFssrAvuEs0pJxzVEtk2xEiJqMKJ/NMvrmVW6y95dqSVNR2nrO2UiZWoo+QLgt/gN9EgJ0mUS3GJCTRzhXXvoPBV0pk518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8YkC/2v; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f2cda058so23947671fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725010135; x=1725614935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttXlQxkw/eyshvA7mHo0/GktKkv+RVOKocAIyjalS/s=;
        b=T8YkC/2vS+5/Psr7YAIp2rO+SH9NsILAPaheO7I6HORFZUkte9AO0PvUmYzZSafjAN
         23nOPvE3KwkABI3t38rtMXUaJJc2YwaVopfkon8spWDQxT6vxGSVMtPXNjKwyPUUBnW9
         jXtbWburNOJBvMHCpyMPQtuecOjsPsp/faYuJvPXSjxf5Mvdf+b25KkbKTCJObVNg5rA
         zA69EypgMTV4Rpsehe21WYi71b/YhVkmTUg4SzU8WX5p9kFMy0nxBSEyPZA4lc776Q9M
         92PR3cDDQXI3kcneMMYcf/7xZiRU/Fkd4mLGSN9WvRFhAZOgL+3UkSfXb/VkU0JRKNn7
         lUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725010135; x=1725614935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttXlQxkw/eyshvA7mHo0/GktKkv+RVOKocAIyjalS/s=;
        b=t+5S7+154L1nuicqEodTkMiJQ1WukyKox4Px3/VRGLT/5oT9VcYAFELGCXMwvKji2v
         yT6BYJXmhNGCQA+7eNTSXwSIgWWWm+DbnZEOJmyM/PA+dmTUaCGzKOFvI4/x7aV3Rs/8
         Unp55klAhWV4ftl2BrDzgV2tKCJBvuBJ4ulqn+n3bswIX/Z7ZAL8NEEaIqDOXrUGN88H
         3jLFs3bylYgigxl/mQqYpDFY/R64iHt44muk46hYWFRp6Q16YfNguIuxaGRgisQhpHwf
         sir+MRWgf4xaCZ1tblCX7Oh0ZGJwV+ltXtjps5pnQsdE1BNL+DPOmP4fOVrqzdMKrmaB
         YzEA==
X-Forwarded-Encrypted: i=1; AJvYcCX4lSAwIjsT+3D1xSiNykGbXUkjCEqYcEehngQ/iAhmML4BTpKDWRWQNuMCZprEuWuV13bu+QyIs0rosnqw@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFJZ1JuWIMbEYajJVvwaXd8RrTK/SlS8GoK0V3PRHZymO2GyG
	9jsJkjTsj3tsFiUN2+ipa1o9Hz7cLzohrYZvWG2M7EqRzqmSH7ug8ehZxu0uZPc=
X-Google-Smtp-Source: AGHT+IE1SoiT+DilSlm6txZRiM8sstmJRyCRRRasxT+bhZSb1ccsv8WB79pwNyz/gwzO8oHxrfBOjw==
X-Received: by 2002:a2e:ab0d:0:b0:2ea:ab3b:fd89 with SMTP id 38308e7fff4ca-2f6129be3c6mr17980481fa.10.1725010134810;
        Fri, 30 Aug 2024 02:28:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15fcsm5689041fa.16.2024.08.30.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:28:53 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v1 1/3] misc: fastrpc: Save actual DMA size in
 fastrpc_map structure
Message-ID: <u3qwicfpvqmkopvzgl2f6wrzo5egvvl7sfqimnkpqopg2u4wp7@2prohvnsh2bz>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822105933.2644945-2-quic_ekangupt@quicinc.com>

On Thu, Aug 22, 2024 at 04:29:31PM GMT, Ekansh Gupta wrote:
> For user passed fd buffer, map is created using DMA calls. The
> map related information is stored in fastrpc_map structure. The
> actual DMA size is not stored in the structure. Store the actual
> size of buffer and check it against the user passed size.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

