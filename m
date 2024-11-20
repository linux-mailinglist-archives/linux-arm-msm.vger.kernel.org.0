Return-Path: <linux-arm-msm+bounces-38463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB39D396B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1A02829A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491F619A2A2;
	Wed, 20 Nov 2024 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7F2BWmS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F16C4C74
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101778; cv=none; b=rbWNjNt6Sg8jOTU7kFwJmcZ1dMfj4O4k1FmkGeCsD2Gv9tp8d4nsU4/R2f3eyxeyZs6w36Mr9S6zY95UILAwYI4nM1b5zcZATtWmQQ7sCefAKdedR1xbrwXFQX2nujuQWxsY87u92uAv1OssGGlHo6stmE9dj/HU/6OWsDpW+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101778; c=relaxed/simple;
	bh=P9kkRy8zM31XFar1exxoX3R5DTgmyCvt93okga+jDl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gg/fqxQHT6wFbDn4C///BOEPSDbTuUiaMfrIpvT+mICx2A/is8bZwA2tFvxfrbQCi+lOHREZT5x2cQFGhk/2EJC9z0eRGqnPX87KlYH5TAXyfcCAPXHmZr0m7baCFpgodPOzsvXXgbuO3SDP3k1c0fU6GUJYjbJWgD/y+CeTA2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B7F2BWmS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb599aac99so43600011fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732101774; x=1732706574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQiVlXJQi/VK9tRXY+qooanaI30URiLhdo7sIgDslow=;
        b=B7F2BWmSBbWwQwjCLxJxekY0yzYJUiwAwYmdePxqMg6PTNZNQogzB926TXE8k6/+vh
         x887ucwLEHizIdsbP+ke7w7GaGLQkrnuoNX/7oQ+VSKMWRCZER1IMIxirKlqKtu5kXN4
         eQoC6b5piIjQkpzrLsyo/uRVF+lijhRJpNWxPOU+hF2GAhK7D/PWzDsllOzi9I7gTTrJ
         ehpgLE5BB+pqqJVGfg9B2JL9kSqihCLG3TFMaDP7v5yA+hbPNBuMcICiXp/c0MP9vPPz
         ukEgxrAz9THE24VkY6wgiBbIB/SdaB7BSMUBgPyEMhETfizrlEkJVxMVEoBiYjkHA0x4
         7RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732101774; x=1732706574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQiVlXJQi/VK9tRXY+qooanaI30URiLhdo7sIgDslow=;
        b=BaPInr+fZ9+n4cfCG3jQyeoiw/a/oR9RsMFey4DhgcBtybrlhK2/HzI3Aw7RwVZww8
         ElVuNlpOkWKgbgw1h8Dxl3Hn8W1Z7don+I6QG8mqB2GLoGKNhB13dyfNipaDRo8s70ZY
         00E5sxHSB0nkUshZuWOaWz8YdlIoigW3kq1a/3QRNLtL+xJXmXQPYf+SzfiAMZQmgYJd
         aYZruErK81NpPR+38/f48njs6UoPfrAQAh4dCu/y6OXv7o+AcKbsmDSfi6yIGcdX/aHU
         7F1r4ErqRfCHvbQgWmCAPAcc6P074Mnp9+XGfXr7EhMsXsEeZjjqLfjbmZpB6gPPb8oG
         pNFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQJIYHzhitiQhbwQidDtLsf4fCgClgAHRL81xLLDexJIKzS7BEYC2khpXvwdOvEHgCiNaxG80PqMbw3S8o@vger.kernel.org
X-Gm-Message-State: AOJu0YwjBTR5LjYhBltOgrpK6+V69jGXH4msBc2xZ1l/f3tYiVJkN5wc
	Myg0c7jEc5QwwkHbRmRqoQsqmt8bj7UCAHNAjan3zUilSUqrbjiE1qnPBZrpnS0=
X-Google-Smtp-Source: AGHT+IHzeBEZkGiXTUGchf05G9qXy0QSvlmcCHEMFt2ig0UCdDl7oRuB2wCtA374ksARIUfZPEb4rg==
X-Received: by 2002:a2e:bd0a:0:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-2ff8dbff92emr12411911fa.14.1732101774356;
        Wed, 20 Nov 2024 03:22:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69b15797sm14946211fa.108.2024.11.20.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:22:53 -0800 (PST)
Date: Wed, 20 Nov 2024 13:22:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>

On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> 
> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>
> >>>
> >>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>
> >>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>> Hello
> >>>>>>>
> >>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>
> >>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>
> >>>>>>> are available in the Git repository at:
> >>>>>>>
> >>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>
> >>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>
> >>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>
> >>>>>>> ----------------------------------------------------------------
> >>>>>>> Renjiang Han (1):
> >>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>
> >>>>>>> WHENCE                      |   1 +
> >>>>>>
> >>>>>> Could you please be more specific, what is the difference between the
> >>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>
> >>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>> use v5 signatures?
> >>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>> far i have seen 2 categories in signing version for video bins, either default
> >>> or v6 specific tool.
> >>
> >> Can firmware / security engineers actually advice us on using v5
> >> firmware signatures with QCS615 _and_ with older platforms?
> >> Existing venus-5.4/venus.mbn uses v3
> > 
> > Vikash, any updates on this topic? Would it be possible to have a single
> > FW image with just v5 signatures?
> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> the signing requirements across different SOCs, hopefully will be able to add
> something on this by then.

Ack, thank you.

-- 
With best wishes
Dmitry

