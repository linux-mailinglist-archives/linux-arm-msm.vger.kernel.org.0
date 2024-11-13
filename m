Return-Path: <linux-arm-msm+bounces-37798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 477809C75D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E15A7B3C102
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD471F9ABD;
	Wed, 13 Nov 2024 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8z3ndCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8B1F4707
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731509009; cv=none; b=J902yirlGnMKTcA6te8A+Iq4hO6ZibIZ1cVqCyxMw7Wbs5PkaksBiWKZAnfkjoFB0YrR+LTORUVQb3xYNGJNSCe/z2APm6NzjzHo/AvDkHwHXFy+EGuW4F9SLGBds8r5knLAcbV0iH3M4/0HNLiXUxGYM2QuMlWa475H1P80jXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731509009; c=relaxed/simple;
	bh=9EXE7mReQjK+dw61YaLeH0p72cihpqzwSAIeeM17A4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxDuF9tCeA6hSYjWXeQijfpEEKKVknzuvL8eXq+AOcyRE0f5SAnkYzijOiWRkBaSEkB7zzzPSEjcBjy0AvgJWTJuf+fRvadLepHXjF+ILr1fo/zYohsDQOpH+wDUuUvYSC10BvPQuqm+RYhRFzzzol3Kp+re1gRxhH/vULS2qRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8z3ndCn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so8403371fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 06:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731509005; x=1732113805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Fgxx52k6cRO07TbzcbtVihhXwwHHKoYqCr4jXepQY4=;
        b=r8z3ndCnP/X8hf6jyWK70EYKAnCnEnoJWVo4XSW3rKTtilcFw6ycJdWEZEqxoG4Bgq
         8EH3c4t/yW2HngaEQMntBCHXjJ/t6apbahOeyvsbxbP+WoWx4L2y9oujgzfsFjTvxukn
         xswskEKH99QSV3n768IV9o9+oU2DOZvJWn13iOiMpGYU+6K/xOxkK13WDKqOJZ6VfDIf
         Gt4vXCt4PV+WOkMqxSSyjp+6+jp8hkIeSeK+9mQEbJGM1e7ls+d0uljkg8N+AwxmbNbQ
         5+/2FTPqKbFBGw8TnBMcaUGZM9fQRQPWlCAXTjzXWd+YOo6XWMd4Pf0uYAfpugFnBq1F
         nH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731509005; x=1732113805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fgxx52k6cRO07TbzcbtVihhXwwHHKoYqCr4jXepQY4=;
        b=iwORmyNx+JtOMHUbMjDpY4JlbtT7VXTna8vOr2fyRrVUITnwz96qD5WhKuCMZ4b6qq
         +J5CxWehiYsRTrTZhzdsdqxJwNkBcdYZbonYc58ZBF2y6anKHHU5pgw9oBOMLjGR/OIX
         W3U83dv0PYBgFHTY8x2R8L89DSB7lEmdmq6Hiu52/Hu3Bqg2EbAqDbfmZUJW/0ja5pki
         SfjbsbQ1OkWI8Rcxe5SnFPT/YITut4gnZ8x82oz0rmmS/ufrl01YN/8C7jydNx0aks5h
         NtO3ps7Ftws1lCrSDipPt0eWSlEv2rZ2WN0GdMUwLYlEKvA4h9Pium5h8Xh1I5uRllsP
         m9/w==
X-Forwarded-Encrypted: i=1; AJvYcCXbWDB+7BEruWY7N3JFFlJjocSwuOVFtmVPIsT0GT8AdxrgW6UjFChIpWRYNKmiu+VJmI33WIiRnKjcDtSS@vger.kernel.org
X-Gm-Message-State: AOJu0YwaChYWcL6o/0feJtWklzpXU4VS7wy6TscNBgbsBVyG0LAnw6Kf
	BhUO6TpBXUhMxQuyrjmzWEqlFeMlpveAreUWTNTJ1M6VP6vTu1FEobBKBnBQkE8=
X-Google-Smtp-Source: AGHT+IGuiQS8G3KYXVswMLT60oAVcwWDVcPu0Sxo4baUZ//Xkb7Dph3igRYbKe3iHN/BqoaKE9wphw==
X-Received: by 2002:a05:651c:b2a:b0:2fb:597e:28f5 with SMTP id 38308e7fff4ca-2ff1f418805mr76208821fa.2.1731509005205;
        Wed, 13 Nov 2024 06:43:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178f3ca9sm24086331fa.41.2024.11.13.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:43:23 -0800 (PST)
Date: Wed, 13 Nov 2024 16:43:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Josh Boyer <jwboyer@kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: add venus firmware file for qcs615
Message-ID: <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>

On Wed, Nov 13, 2024 at 07:22:28AM -0500, Josh Boyer wrote:
> On Wed, Nov 13, 2024 at 5:50 AM Renjiang Han (QUIC)
> <quic_renjiang@quicinc.com> wrote:
> >
> > Hello
> >
> >
> >
> > The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >
> >
> >
> >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >
> >
> >
> > are available in the Git repository at:
> >
> >
> >
> >   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-firmware-qcs615
> 
> Merged and pushed out.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370

Josh, it is very nice to see a promt merging of the firmware, thanks a
lot. However is there a chance that you can give reviewers a time to
react? Usually there are no issues, but I think it is important to let
the comminity to be able to review the patch / pull request.

-- 
With best wishes
Dmitry

