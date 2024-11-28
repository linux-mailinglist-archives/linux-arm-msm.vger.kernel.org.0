Return-Path: <linux-arm-msm+bounces-39450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 554F99DB884
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B90491626C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515BD1A3BC0;
	Thu, 28 Nov 2024 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x8qCv6f2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85181A0BFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800300; cv=none; b=QvLekGvmTy3dsYdV06ULwTG7YOnclzaO1XvSlY1ExyCe9L1QOjtOknsFAs2JkRtDZdrLVb9d0zd26i4SAv7Stsd5FB2EKzUp0p3pwLnEEJcIdhb1yrfU9VburVsRykYe/+5DvbH03YmyxBza5TFZ4R/p/4WHJh6uhMDGXDclt3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800300; c=relaxed/simple;
	bh=TJHCUr65Fx9nI0lYWVGuUksq2Eus8GiVaUverXhwu7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1pnkIxGCYQ1BLqh1htNDPlW1TE/iAK93KrbIWGwPb9kC9BLOOOG5L2r+p+daNzofsn50HfNmHMRP/XWLrCrpRNHsJpn5bAcWus2XE22yMv/UUmBiHzgurWsnKmS0+/16eOzqYYSB0mkUvfA79KHqZDIy4rkBlP6Q5qHKPTBlF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x8qCv6f2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df63230d0so801168e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800296; x=1733405096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xu+TtrzBU++n85lMLAMaz83aPvmp/GtLgt6yR9tcsxk=;
        b=x8qCv6f2g15tGWULR74XizIesy3u9PNUaoXsJTDaYOOkU6bz4qIZPlX1KJOpiqH2wq
         aPe4DId55Z3tvCHoIjDmoiOYZKTPgAn1L29EJHFmmfqA0t3JWRdtDnW/CzKoYLZlzU9r
         vKYRnJXEZb/bIffKGg06ZsRVaXNepgj1N38LAhkJYcfZdFZ2CnkpWBXLdZqp9l+13NHE
         A2anRj9u8uMhujJHTKYEB3CvfOWTKAJF+xfEopNyCrUMHMlx9VeJ9yAANn7D9Nd/Sflo
         aYb+GM7WryQ3Aepp5QqJ285vk35m5Vre2fuLKf0wqsfWfcOnr+hCuphTTkV2MEbpsTP7
         /HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800296; x=1733405096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu+TtrzBU++n85lMLAMaz83aPvmp/GtLgt6yR9tcsxk=;
        b=XLp6biJAPZnXpHcU8LN1udiTf5DM4oCMAuuQToe4+TsoimwpPFOxMImGopYSmFBk6P
         hTZLtnFTW3/7cLmzceZ+q+wcTiYmjjlZxekuXP1DTp9RWmBLm/lxk7LY+8V/71Zf0aB2
         Sw+94hXZKLvRhCGLrP3xGuAgrX3ODVdQUxnZPAGU49W2pWbSP/MEHOFw2d491qQYe/w5
         IELWeAA56fm9J9qtRujPflmICxO2lzgUJ9tSDJut1lhQrlrROjf/MWa9mONkAkjiErv2
         TZufDfiITG9ToM8QA+ejpQuRqtJuIdnZjZypJNahYvm3KOwNj5wMs5WtkP9kgxRyHV5m
         17VA==
X-Forwarded-Encrypted: i=1; AJvYcCUWKopBKMay2A9ko13MGF98+u/7YtCkvz5yxTpJ0xPdG+Dc0ifVg5nyY1wumYkjqM8nY5405zNZnsieigRy@vger.kernel.org
X-Gm-Message-State: AOJu0YznvTFhRgRODwQv9bU6Pl9NPoLz/B4VyogGyjWScPhJsdZ1PHd7
	OkD7pxEE8HGEwH/aQU4KJtpWebqBvRR0y3k8TTw0BnoTk2wrfstf2g7r3lgRJYc=
X-Gm-Gg: ASbGncsLEvcpsN3MUPdgZD4JGiYclyRj+SK62DOlb++4QzgAcQhtnYxvHVjhKASN340
	EhkuTmH5n+2oMBluuCxsP16Zq+95XF1B8sBx2ietZ/zyslt6zcRszW7wYb7kvIf2kS2/1vJUzjM
	Wymh6/pScE1RBu1Bg8Z6iScWitT8xvGy2ExubmHVh4wd4OAyJBIRDDjwFyYWtfnF2j3ziUC+Qdq
	zcySdDAaZ1uU8/Xd7xjQwJn3jVlwXl4OhIYUI4fhv7U0Slrrr4jk8D0PFBL6w+8UrDEgp95qm3o
	SBD5EvUzHtWN/kcp9JLTSeSxo9NQtg==
X-Google-Smtp-Source: AGHT+IEpZe9yoi47jMikkocK38/MKcOL4vKUAWk7lAfQh1r/azAfrCwMc0oz7RX7DyOhdOTWypto/Q==
X-Received: by 2002:a05:6512:a90:b0:53d:ef49:5b5a with SMTP id 2adb3069b0e04-53df00c6057mr4150533e87.1.1732800296195;
        Thu, 28 Nov 2024 05:24:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df644313bsm175297e87.69.2024.11.28.05.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:24:55 -0800 (PST)
Date: Thu, 28 Nov 2024 15:24:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
Message-ID: <emsraqtyxkanfzafej45dt47hdx37okvngomqgou35a47uly6k@5w6iwq6xfjul>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>

On Thu, Nov 28, 2024 at 11:25:41AM +0100, Neil Armstrong wrote:
> Even if the code uses ARRAY_SIZE() to fill those tables,
> it's still a best practice to not use magic values for
> tables in structs.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

