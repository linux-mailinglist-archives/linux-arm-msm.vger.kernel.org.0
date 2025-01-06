Return-Path: <linux-arm-msm+bounces-43966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B2A01F5E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 07:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CFAC1883EEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 06:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF320181334;
	Mon,  6 Jan 2025 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="girgLuz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136C3481B3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146164; cv=none; b=So9gu/IQYtJd9CYdc8G0/Fs5qZkqvbt+G8tvR7NkBLT4KY7DjO9HbpuIgH+M5BiRxj+tTQ+qnhkOHkBtO4Y65s4nVmnzwliqj+5nRbSnh/eyxMefmR4RwV9ebNT+zBXAEjsLz5r+oqFyXDHX4SOQs+wNvBNEaxT2ULZQttrUtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146164; c=relaxed/simple;
	bh=nzAe/KBldoJeXmTeqaN64qn+e6q1Ph5lDjVudvh7sqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCte8f/beGFCXlvnJ9cCzYWnUXE8IY7ZVEAlWR7/kpewXG0l8MXpdKbjzdOA34qpRjk3tUBTbA3lq1ZJBLrN1h7y2nUh8o8GSOaa5h1bdztVf0zYoINzJZHhtBNwIMZkeL5R3O7VupwleMKdHQE5yhnCvaDsv8qrcM4K6dalr2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=girgLuz8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso190174441fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 22:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736146161; x=1736750961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qu8WQXQCtZnShf6h8tAcD5s24D9ELy391aex/eneOc=;
        b=girgLuz8x95bmP8WuaRyNnVsXyiLXOQzwt8Uuw6cMLsdDv8LPrfOoQ6bqW1csLd1Tr
         1V9RUi1FpYIIBnMb0fMZsvA1ckvxXeLEvddma6wJ0hpcoEuk0yo+Kr7XKIIFzXzGWgE6
         3t1G/cHqJUgED5FjV9aR6UkCzNYHIynbTBwgXxk41yzKIAzlhsxqL3O5qjyWQYEEjuX5
         mSE8NnyGv2Q+G4PeOZd0wmd7TetaN9QErzq4KGKqI/a25YO55KfT1CiDzruKgM2fRmZY
         y1IphkG9iSPxeLVPA0of1ayOZpB/eUpZR/Xdw+hhsCUuTwkE9Z6vMruqgMdwmMgYyapK
         imhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736146161; x=1736750961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qu8WQXQCtZnShf6h8tAcD5s24D9ELy391aex/eneOc=;
        b=h39E79GEsf5YfQBy2wIwHK0tRRqc00tEWrd4n7PVyVCN10j8IRFCef2IWQDX1vjiXc
         RZrtGCWfePdT3bTw4TxffZ8Nht0eNYHwwRNSwxEeebe6eZhGVyDZLp57NKTivNqDsSdg
         IFbMxCX13J4aSvDeAdNvpeRrwShA/1TzicQQQDdaR01D0iXiRM3r+weM9rSm9fX++Gt2
         RKXLoVnHs5rR/KAs+5Mx5zUf/p7FkGukyvwgCV/VeO1ptiwDLttrEteJVi1jJz6231ML
         Rj1MWFzOE5U76a0bzdPKOIicZjozijFlsT/tQiB2G+h5F1r6t6W52gqBCV+g0xqVj4YU
         6oWg==
X-Forwarded-Encrypted: i=1; AJvYcCW/82YaBCok9G2+x06c1CZZw7RSCYIFs63heHNrhpwcMm/OhxqitbVA8aZGZwx+DmGmz2qc3SxOXBlxr1J/@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTWx3WxRyK43LbIR7si46eIeKS/vgWFBTe7vn6FeBXXLrtrpC
	fD/k+41B3kUT5mg04w04Nnwqd/5oVlNsG/VpsABB8cCPVbLylF5e7FT/DRpuGG8=
X-Gm-Gg: ASbGncu7+QjizQN56M9JbWUeZtR6eP9JDnvMKTpIagiIwyYgsWOLmpfUecYZ+nKUp1e
	FjPw7K4g0eIzatCF9OrWP92PG/w5RmmXbG71FJKSly/bULagjr/uZd2IMF9myX7zpS6TBzZl7Dx
	4aRIpRq5MNu96Tnjr4sGWNqzwwaQ7rdq0QRqmWKHgxoMUtm0LB9AcddqIO+HVNny1XXADI+v6dn
	QiEMN17GVs372MQxsO9nM4AEqWJUBbecLAWdQYaVJe130rtJsZmG9+zVoPhq5Kz+IuyGPsH8cwo
	EpRvB6D9pXVVwO9avXln6uAVTuBFDSSHMivY
X-Google-Smtp-Source: AGHT+IGHVOrjHEa9YHZQLk1c+OGgL7giB+05TWOpDyNnvuG8TPH/ssBfuMDBwWRFHIFp85M+tdvrWw==
X-Received: by 2002:a05:6512:10d2:b0:53e:39e6:a1c5 with SMTP id 2adb3069b0e04-54229562a91mr18706777e87.41.1736146160752;
        Sun, 05 Jan 2025 22:49:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813670sm4904307e87.152.2025.01.05.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 22:49:19 -0800 (PST)
Date: Mon, 6 Jan 2025 08:49:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add writeback support for SM6150
Message-ID: <w2ybpbn4caps72e6ac45jae3dgmmmhf365ks2sonfmj5uyfvsr@wr5ymif75xbp>
References: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>

On Mon, Jan 06, 2025 at 02:39:09PM +0800, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> A followup patch to add writeback configuration for the SM6150 catalog
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

