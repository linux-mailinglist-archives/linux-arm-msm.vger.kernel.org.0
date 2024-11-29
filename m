Return-Path: <linux-arm-msm+bounces-39598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46C9DE89D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A83EB22B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3CB20B22;
	Fri, 29 Nov 2024 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2jpaRuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4A28EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732890952; cv=none; b=JnnZCJ1F3fnDA+zW0a3y/CibsCXETArIB8jHOmkyeQekhRPCoOXz3gl+3qMfKtkveQMWzd/4/piTaRxjg1mhO1RrJkZiGSIsv094loAKEJkDGH9xHga6lonqHkJl/X4iCX+QEbcp47gDeK2aSTi3ER+nqbnWDuVmLkjpHhMYghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732890952; c=relaxed/simple;
	bh=4FE2FOpJAa5Eu8yKZqOmKecKeGGa1ci+ll3hjZ1c2LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmzHPPlDGkk+xSGWoPZ3z7V08fTehtN9GT75+C7EVM+0+PxQkv4eld06r8me0tDWs60VMgFf7JUWoHqV/pXvLJfMCheZJ/emTxg6ZxYGrVYLFyhCspvA6KqcNOV5mgHi2cIPGocpCLNr521Z10wG+rVzwKybSPa6+k9khunXmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2jpaRuA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1906575e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732890949; x=1733495749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nw9bGbYR7ywJM7+QLiwGJZn9TRw0SySFZKLZYZ7Xjy4=;
        b=I2jpaRuAtogkZSSLDlBY/djCoGEC1kwIR4SAvrdClN7ZxZGyEm1p06u6MySCFWsIYg
         SoZMSi/CmFSh2MF8CteoLr+h5BMnDO+4JX1v+NxuhNov2+pmsdpdgB9YGJqv3NHr1D1h
         B1q9w8DzS5T+n26bQspOFVgdVdnsTnsXDrCZrRASZLPknCS7tnbI36/y9/NZYuT/kgQP
         jwPduHvWdK6un9lrovWo8/+rw+55GwxI/vxks6LW4AwxBHd39tPdlIUvTjaHEa79Co9V
         IzzlRayX+RgMqHH4F+YLEuXfeAMV/f/4OqkJHFszFG5n7SiVXlpRcrMrytxyZIdcPFvD
         +ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732890949; x=1733495749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw9bGbYR7ywJM7+QLiwGJZn9TRw0SySFZKLZYZ7Xjy4=;
        b=mQC/aV/TG0VubDUYVqk/r7pYAX4dsswu30t2aJQH0vK7DUofm/suFqXDCfitJX7xZb
         hFFxMTk/So+oUbXkjHmrOP2VJ7WRIXovtaXCkKQMgbqfEYxOB0tPqHOJfniw8cqSJ2JR
         7qqCZjvu8ZeGPTxtkLMmJefXsTSt7IW0206xluwP9ZGSsWqt2gNEIXdbjCa03Tl80mkD
         4A7vDJUZTCBrM6zK+PlVaAsYPQiMoGi6P7sFfMRSrRsWFg74EBFsI9bOV7roB3dcRuaP
         aFHZ6e3bJPI/tNq03meuhknIBUoLBVcxTVEzn2MmprhKdjj9TIOsn9Yimbtiipfx9gQ/
         AjGg==
X-Forwarded-Encrypted: i=1; AJvYcCUZMuMRBYP3T6hYoT7KPrX9AzugEFbxgv6yQz8Koglij04Zcs2nciSAYtt2oMbl9GvHNFdbkbIAAnMdTdq8@vger.kernel.org
X-Gm-Message-State: AOJu0YzG6HY+hSq2jME4EtQuxnPuBp+HN1JjjD+nKC1J6PjHeISgWuIi
	pqHA6YjwYFo0T6KJcS2YSDbvNaBHJzPpvX59zbLVRLmV9yS7Qzd15YsOn5hzhTM=
X-Gm-Gg: ASbGncud3w8BXkpHLJPHJz1fBem1K2iJbj6c3uldLDv+M2AwbKo2YDRaDY8n1oqoDyn
	yXSCOfYLZGEoW1HhZCdj/M8EqMJajDBC3+DiCHa4f1LqmbInO66GLtJdTBR0XH7XHXw3uvomXVU
	x5yrFykhYdO7xYk5bi1noRQwjm72c2IbWoCxoHz6G8LHcmsI2yUaYmEIykXJCkVPZvB5oabpTVF
	kHRZOqyqituW8NAvbCa/LlE9C3kpWAQ+lZos9U26bTF1EBdq54z8yZwm/ZpKcTnd+MciNZPTApG
	YvyMHX4VVrmFch+VxHGtnWicssA20w==
X-Google-Smtp-Source: AGHT+IE90QA2sTXGE7j5GHpkF7qty+qWC7fK8rfj51Ie6NL//0MeGeC2BHWUKfGUChva2DyOh+dKyQ==
X-Received: by 2002:a05:6512:2391:b0:53d:eec6:4622 with SMTP id 2adb3069b0e04-53df0112169mr7638601e87.48.1732890949187;
        Fri, 29 Nov 2024 06:35:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496864sm499591e87.217.2024.11.29.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:35:48 -0800 (PST)
Date: Fri, 29 Nov 2024 16:35:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>

On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> > 
> > On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> > > On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> > >> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> > >>>
> > >>>
> > >>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> > >>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> > >>>>>
> > >>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> > >>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> > >>>>>>> Hello
> > >>>>>>>
> > >>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> > >>>>>>>
> > >>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >>>>>>>
> > >>>>>>> are available in the Git repository at:
> > >>>>>>>
> > >>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> > >>>>>>>
> > >>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> > >>>>>>>
> > >>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> > >>>>>>>
> > >>>>>>> ----------------------------------------------------------------
> > >>>>>>> Renjiang Han (1):
> > >>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> > >>>>>>>
> > >>>>>>> WHENCE                      |   1 +
> > >>>>>>
> > >>>>>> Could you please be more specific, what is the difference between the
> > >>>>>> existing file and a new file? According to the soc_vers the new file
> > >>>>>> supports sdm845. Should it instead replace the old firmware?
> > >>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> > >>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> > >>>>
> > >>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> > >>>> use v5 signatures?
> > >>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> > >>> far i have seen 2 categories in signing version for video bins, either default
> > >>> or v6 specific tool.
> > >>
> > >> Can firmware / security engineers actually advice us on using v5
> > >> firmware signatures with QCS615 _and_ with older platforms?
> > >> Existing venus-5.4/venus.mbn uses v3
> > > 
> > > Vikash, any updates on this topic? Would it be possible to have a single
> > > FW image with just v5 signatures?
> > Not yet Dmitry. Having a followup with relevant folks this friday to understand
> > the signing requirements across different SOCs, hopefully will be able to add
> > something on this by then.

It's been more than a week since the last email. Are there any updates?
I'd really like to get this sorted out before next linux-firmware
release, otherwise we'll be stuck with these names for the foreseeable
future.

-- 
With best wishes
Dmitry

