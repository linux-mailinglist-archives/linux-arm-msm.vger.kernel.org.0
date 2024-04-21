Return-Path: <linux-arm-msm+bounces-18074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC088ABF3F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 15:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30ECC1F215C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 13:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E89B14012;
	Sun, 21 Apr 2024 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3ndwcCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B113FF5
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713705382; cv=none; b=FCBK4T4x4MnaVZ+BGJZjmC4EvnguoXsMM8KZ4cmn8dCYJhWeWNPhLKMNz5cfv3Jexb7LIemAWcDDVQzSRLkU32FhlVQRICSohjNq1/lHmhgh5Tv6ImXz1Iqho42JjRXR0ag7eI2GVLGlobACtpyyS3QyqmUvGjZsx/CHKFhpBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713705382; c=relaxed/simple;
	bh=a1fd6e6Gs1jt19mS2k5P5+/TYULLQJhNPZixk4mK/R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtYH7SiDfsWBxQP16Duv62vehjItrZQcv81Y0G3P4zMM/CIgde7vmIEk3CTihXeAkFg2nD/AQKKALaXzXIirqxcbfbRXM6YBFy5S9mTfLu0/kcdJZD+za/twhEYTEjmuEG/xffVhTdOFo7P9Hea3x7F7v0YDUKkCs3cNJaKhfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3ndwcCW; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de462f3d992so3648016276.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713705380; x=1714310180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9b23fzJgHNWlYEQwRHhUtIVBTetbxKE4NVXPqvIaIrk=;
        b=p3ndwcCWHeJ/OJYWXoU6TdV3BiNFxxgDLO8i9HxkrRoTwzpsktAu6s61SndT/Rlhn4
         wiOwi2v6eYrLiUEJAy6jt2RmzlQn8HoG8THHzMVMob0oRcGQHjJlx1+FsJPXmuMMkTLe
         HV7SHL0fE9BTcCRvmTKQ0nUSK23wt2ddYEr5/vEHV9VepcDv/7ITGRy4cY2AqljYH1T/
         6cg9c0N5iFhDGMzmcsmqCOlE7n+KSGPa+8VpEpoH2ojq+j5VwZUVgZAu8YOtb9W1MCdO
         ZFj3uZTLy86AfxyENB6G3wkswsOq4IomI0ie6hCnrAf9HETajSFIDVhzDee8ZgLHF8fC
         db0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713705380; x=1714310180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9b23fzJgHNWlYEQwRHhUtIVBTetbxKE4NVXPqvIaIrk=;
        b=vqnJjfubEmxovTDLyMawfhnxPtPp/CLhjcWrfHmvYK2T89w+FdQyNcdRpKUhbo0DzN
         hKCBbCcTIu1LIn5K68mvS8D7kpMaxX1BunGUTw7GfA6j8/uafvbrpx2zvDDodOvOLtQz
         h/vI/hbUA0eOVCqrnP7nw0VeF6u9D7Yfn5lU2GXG77OBj1wnz/noKuA/oAWTdu/xjG/0
         GRv51Udv2OiEZgQixeFhMVKN5vQMIGO1GQWmRM8EBZPH2GOhyUo4mleq7yzQoGc9RGFB
         Kg/xdKhuiRmeKFT2ZNNiMtKjh3o6XpAWPmRTu6tl+W/xEjUzOLrvNTt8uF2RS2tZGlry
         rBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVTlT7IXxvhphY5dKZBYurP4JX5Uj/NSfUjFuh9bY/156wWIYUcrb/WOR+N9i8P3DNPrPl2DUFOfYNVq9jqc7lrcOrCkNE97wKnePpWBQ==
X-Gm-Message-State: AOJu0YzYLK0zagbzcjXt6LxdUpf/CN79eyaXr8C1gHejcPN2kEVReH5x
	v0fq0Yq1hGl9soW4rhhj548d1HD5jK0ZUb+pHwn/UIgaTdPzG3ODVEYGjIqJPXjcvBLkKppH9Uc
	Ocj0CCJa3BwVuyD2Sn2jWbtYXaWj66vrIqH4gSQ==
X-Google-Smtp-Source: AGHT+IHz7/ue+3qHJOx20G0EY6HjLKwRCFO+3MTk6f+JYhQyLzBF67jQE/qFXNu4AbkFXvkPTeDUIc/sANXq+e3DjYI=
X-Received: by 2002:a25:ae8b:0:b0:dcd:40fa:7bd0 with SMTP id
 b11-20020a25ae8b000000b00dcd40fa7bd0mr6131741ybj.3.1713705380035; Sun, 21 Apr
 2024 06:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-3-e35b6f847e99@linaro.org> <84a70058-38f2-4e76-b62e-b6c44e880f7b@nexus-software.ie>
In-Reply-To: <84a70058-38f2-4e76-b62e-b6c44e880f7b@nexus-software.ie>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 21 Apr 2024 16:16:09 +0300
Message-ID: <CAA8EJpoqs_cgqyosnHHZnsTkMepxRbpcWOQSKfT6zZJyVd2zDg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] soc: qcom: pdr: extract PDR message marshalling data
To: "Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Apr 2024 at 02:42, Bryan O'Donoghue
<pure.logic@nexus-software.ie> wrote:
>
> On 19/04/2024 15:00, Dmitry Baryshkov wrote:
> > The in-kernel PD mapper is going to use same message structures as the
> > QCOM_PDR_HELPERS module. Extract message marshalling data to separate
> > module that can be used by both PDR helpers and by PD mapper.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> > @@ -0,0 +1,315 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 The Linux Foundation. All rights reserved.
> > + */
>
> Is this the right org attributed ? Definitely not the right year/years.

Yes, it is the right org & year. While the pdr_internal.h header (from
which these definitions were moved) didn't contain copyright, the
pdr_interface.c file was a part of the commit that brought the header
file in. The file contained this copyright header. Thus I assume the
most correct action is to use it for the new source file.

>
> Please fix, then.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>



-- 
With best wishes
Dmitry

