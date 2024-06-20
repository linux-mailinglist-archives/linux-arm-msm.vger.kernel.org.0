Return-Path: <linux-arm-msm+bounces-23420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BF911134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7320CB24B45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F9E1BE852;
	Thu, 20 Jun 2024 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sj6vxR1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864B1BC09E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718907858; cv=none; b=PxcIL7uj1KG+ahSBvUexqWUKHPNLW36C64Iy/ATzJzZ8V+zHJm8m17u3xls5XGQf3yp9HP4CBDnDDWg0ptl4zMC0XPH4vzp1Z1PI2wUxJ7dyfDrya+5qUApvHCPkj2Zjl4qPMNpjiN7ZUewh+GmY567uoHM5p8ZekVRPZ9pUUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718907858; c=relaxed/simple;
	bh=ifAiEhdNxcCznj/6L+j038GgLUQAUxaTpXv5ZK5nkug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDs1/KNrJ1kSvPGgskoGbRjjdTrygXe+jJiX4vjgc/zsfNFP8XS3ho3RvX2Yt0s9Dcf+X8OEPQHVNZzwKqv4gwGNntyXdlItTvQufysX/qYgYNTS8sMA5LrU0t+gcF0GqLYJ2XXB42Lz32QJpQKrrfAfZOZT88ItnGYXxq+H7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sj6vxR1b; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-630daaec9c7so11293087b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718907852; x=1719512652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLXE8J+NTsLyBECHCrJAgVS17SAByDOT+Kx7JyJFgyw=;
        b=sj6vxR1b9zV/4+EGoD4jc7NSrVEG8Q8aY3SiRrmvugigbi4tC1ANNGoVgxqF4gk0XV
         wqVISqceGyF7JyvbMXe+6nisiJpA+zz4kNlNg4uRu/t2w97KcLZEGlUMxvYbLRiV/GHL
         MGPqJHc1O6Bxe5bGEiwhZAzzX8RM5gO1BnA6sLmafW1iEduRHr1ovnB8eDvy4o5aAayx
         umq80DWuP3da1laezQs77d/O62RevdGrXhz9VNCbXk7GxN+Atdh9ZD8N4p+KV+dKPSew
         +RlNlY8HqCywgWif+V4J8YgW686FkwMI9Irz/dkonMwqtRQWKjkqDNpHzWjCRol6xPBT
         x+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718907852; x=1719512652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLXE8J+NTsLyBECHCrJAgVS17SAByDOT+Kx7JyJFgyw=;
        b=aACvoSP1WtoEaVuOhgWyo/GuqcPlSEiPkBUXjkqfvY6svSzsgN2b1QhMgJ21jBGnED
         7S/pLaVRhCDi5w7EXfrZs0Fo7FUJfXbQTQZzXLvxj7yH8NHtsavoM1HH7jOGNSY5qX1Y
         yZgiX4TiPhZRT5rE435kUChltnb7kk8uxVI/YII0vkRp5N7iddFUG4V8jsWAlpzwKpwV
         cGU2aSa9CFGnmPWOiOM3gbsnha0+0X5aUC48RfqYspJPuZr6WQc5TDBDuJNyzamv9bbe
         /p5H06I3dr774IlK24N1LKv+bIxBSL8Ti0BAf8+cHY3cNcI6/WFiC7onQ6zLl+N7Mpg2
         nW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/zU5UdXMoZctJnc5I+kSVbkBEUAMEwspsOtNX8TLf+ZSv6NMY21NVCNeZUEJhgsqsHEvoPiFmOe6qkk6jXypqjTiOPWv1+jFjnf3tTA==
X-Gm-Message-State: AOJu0Yy4bhy7nZpsBvjOfwuFMetnt5kKy+q2IH65I/g9OSPfAOT5LVao
	xiqj5jgeO2Apt7uWnm+yLWWZ0J6WLFtwwCcS/nOV86M1PfC8806pXlNpviMgyfjjQFApK8054sw
	QIO4Vct7gAV1LJ97WzP5eMgNhGx81JQKvVkGa2g==
X-Google-Smtp-Source: AGHT+IGxZxE4jiQmLPcc9xGdx4Tub95V70nV8FZmgGqTvXqYLyCBLK33Pgqp319QX+0uSThE9zzO7MdMgj6QQB/WPuA=
X-Received: by 2002:a05:690c:987:b0:63b:bd20:8e1b with SMTP id
 00721157ae682-63d932aa027mr19723827b3.19.1718907851789; Thu, 20 Jun 2024
 11:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr> <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 21:24:01 +0300
Message-ID: <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Rob Clark <robdclark@gmail.com>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@freebox.=
fr> wrote:
> >
> > On 16/05/2024 10:43, Marijn Suijten wrote:
> >
> > > On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > >
> > >> When create_address_space() fails (e.g. when smmu node is disabled)
>
> Note that smmu support is going to become a hard dependency with the
> drm_gpuvm/VM_BIND conversion.. which I think means we should never get
> far enough to hit this error path..

Does that mean that we will lose GPU support on  MSM8974?

>
> BR,
> -R
>
> > >> msm_gpu_init() silently fails:
> > >>
> > >> msm_dpu c901000.display-controller: failed to load adreno gpu
> > >> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops =
a3xx_ops): -19
> > >>
> > >> Log create_address_space() failure.
> > >>
> > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > >
> > > Thanks!
> > >
> > > Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >
> > > And, after checking the below:
> > >
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >



--=20
With best wishes
Dmitry

