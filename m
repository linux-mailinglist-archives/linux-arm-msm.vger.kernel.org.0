Return-Path: <linux-arm-msm+bounces-48887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086CA3F61F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 14:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B50CF3B8188
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CF820AF84;
	Fri, 21 Feb 2025 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpeZ8WE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F71F4E3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740144834; cv=none; b=Gxznb/rltF+xkoiJ8Mm2N6UeZkkz8Fh9DrufQyos9fmgKb87qG8SO8+bZOTfu7vRAK2xGLm8VcA2MRDZpGWJdn7l/dnUvsOZng077BUzzcyZUScAHLW04QQbFhruxS3fJR2gELaxdYx6ZK2kQzSnBeXbIlrFvHG8aEZy6023RP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740144834; c=relaxed/simple;
	bh=+xQvuAjburFLy08XVkCb+80zAeokEaI0amiqRDkhEsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTK3rVThmuDj1QUJmmQMgUVaeZqhWVl+Sw0UCIbwSgmkAcXm0/8Ihva0mvL6Dwnaj2T61wAnpyaymJSKpWD0/lhFKLF1TT+YxxeEHJsRAFu8MuH+f2xwJk6EBo+1EiRGaesPeMyk5BUmW6jOZT56mypQZceU0F8Qzuza1psIHXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpeZ8WE4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54529eeb38aso1760198e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740144830; x=1740749630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ieh7CBVPmu3X5DHV02AR8XvoaNx/S0Yj7VuoRST8SJM=;
        b=gpeZ8WE4mNKi3cKUMjepdYuJw+p0NzyZQiXfPgFp5wijkg/BcKfRPxR6ei1OyfghJj
         czGw06jPXtb5j4q3SsQ17Zh3yXl5c4BgU9z96rqwfS5v4id3hj/VE2Tkcp1NA2gKMmxi
         N2ZSR5q0q+oALPUtlkXujI2RjS68itut87mvrXhPqqA1eDs6ntmzOeY7eFaaxqoaYWrq
         OTJEG/j9Nsc1zk26ZpftukAhK5/duS2tTgJVldLVLl9X7zyH6xycW//xF8m+ew6VNYWY
         PWwEjfb326oRDRPCwe4ko5UQPIfWx88H7NuApvOvHxZAUvMwXNExRolL85KRLFHk0XNi
         bajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740144830; x=1740749630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ieh7CBVPmu3X5DHV02AR8XvoaNx/S0Yj7VuoRST8SJM=;
        b=RqR6dMIb7V87vgoPuDA+RLYIdxyXW0rp4baalBE7XhYWfw6OcH+o0aT7ccH4wZJYAr
         sMd7vr36+ACXCJufFGfyXZFskqfmkICc92yIfVROK0xQy2XQIx5VMSAuwyJH/VBjEdF6
         oiT87Sd7jiiUs2sqk2JJhwxVMbOseVhUV9KvPmIpsHbY+Mh5U+ZgP6fUsjGTX9y0Ya2c
         4fOCNe9aUDWF5waXxV6keNy2u9gI1ok2rkTW4B1fievAw3ddA4+4y9EkpEcABMWoeNqw
         zmNSRh+8qmcAmNGU8o++Vs38KygRY0wSpV9B5dY/pYxd/6TgiFHguHCAGglI1cn0ohKQ
         OeSA==
X-Forwarded-Encrypted: i=1; AJvYcCV0p2kuwCq9MIFLAFsbUq/QCjW0RGu1R9xH7xT7u/fcuk9TKzyxd2tG5/jEKUbr1/jl0esipZEtQ1UNN8Xr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/IRHGsPCCOZxDgdyA/6OEeaXRNaQqB9aztEbINnuJsl5HsPT
	df/3XmspXrhsPSeSu1F5M9Aq5LpEpD4Ay7oyBojXC/vLeIqtmMC3MRmTG0dsZS0=
X-Gm-Gg: ASbGncvspI5QrP2HixNtmtwBJ5OgGzE2opl4SiEW5sM3GiJ+cnOqXYHpoJPgMlLZdTh
	y+f3RkvJ+okUQe1Mq8yfa9/wtSARbPJRyyy89slYu36xSbc4YZXJO9tST3brzgEG5EHho7JV2/Z
	LaEbWsPDqovAHzquVu1rHaUggFUyxluKzUhc0vbGaAGjvykULO9m9IM6JSRINgGzI4AJ2QRmZaC
	mzSMSqxnFCl1bqZBU8l3OxBuBX4RhLus72dsni4c/SyHHCPmhNz+MXHsZIyj1tsrN86JrI3R7x9
	KnqvLwLm9E5nW1cH180M2t/Qe2LKsl9z44wdfpFTPqsqkEWFweNgz1NyZ2kIaveHcXsYGw7ysp6
	dyLDpSQ==
X-Google-Smtp-Source: AGHT+IHiz5c3L+HbXFi2J+BpEhRbGbpZKCFTjF5dKolaGhW+97N+o7e5V/9KYwQhome4h/soVI0ylQ==
X-Received: by 2002:a05:6512:3b0a:b0:545:ab8:2be4 with SMTP id 2adb3069b0e04-54838ef5a15mr1252449e87.27.1740144830527;
        Fri, 21 Feb 2025 05:33:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e4b08dasm2235004e87.87.2025.02.21.05.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 05:33:49 -0800 (PST)
Date: Fri, 21 Feb 2025 15:33:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
Message-ID: <nls3qurambg6ioecf2y7zp74sekgmshlu4nskpelulvfad36lv@4tpangvp7m4a>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
 <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
 <CAA8EJpquBhQeac0E66NqeagkxP-qY0whmah2ND0xziUQdxc_7g@mail.gmail.com>
 <883fed07-1d21-4ab1-8c72-9a1750ec1606@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <883fed07-1d21-4ab1-8c72-9a1750ec1606@linaro.org>

On Fri, Feb 21, 2025 at 01:36:51PM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2025 18:24, Dmitry Baryshkov wrote:
> > On Wed, 19 Feb 2025 at 19:04, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> >>>> Implement new features and differences coming in v12.0 of DPU present on
> >>>> Qualcomm SM8750 SoC:
> >>>> 1. 10-bit color alpha.
> >>>> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
> >>>>    layer mixers.
> >>>> 2. Several differences in LM registers (also changed offsets) for LM
> >>>>    crossbar hardware changes.
> >>>
> >>> I'd really prefer for this patch to be split into a logical chunks
> >>> rather than "everything for 12.x"
> >> everything 12.x is still logical chunk. I can split more, but without
> >> guidance what is here logical chunk, will be tricky.
> >>
> >> For example 10-bit color alpha looks like separate feature. But
> >> remaining PIPE/LAYER active - not sure.
> >>
> >> I can split them but I would not call such split necessarily logical.
> > 
> > I'd say, the following items are logical chunks:
> > - ctl->ops.active_fetch_pipes in dpu_encoder_helper_reset_mixers() and
> > dpu_hw_ctl_reset_intf_cfg_v1() (with a proper Fixes tag?)
> 
> 
> Ack
> 
> > - 10-bit alpha, border color,
> 
> 
> Ack,
> 
> > - active_pipes
> > - blend stage in LM + set_active_lms
> 
> 
> Ack,  but you do understand that this is purely from new hardware, so
> new registers. Even the 10bit border color is actually for new
> registers. It makes no context outside of new hardware. same here.

Yes. However those changes are logically separate, they cover different
parts of new HW. So it makes it easier for anybody reviewing those
changes (now or later).

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

