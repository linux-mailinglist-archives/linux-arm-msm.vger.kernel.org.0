Return-Path: <linux-arm-msm+bounces-21621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A48FB6BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A65D284293
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DCC13D607;
	Tue,  4 Jun 2024 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyUugpeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F213D2B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514089; cv=none; b=FAjiUqC9UUSR7QfHvX9miyCUydgSUW5Z+P8c6t//VJfYnc/QmZ+N7MCwGQZiug4+zy6RoWe4Kbw6jMbtZmwZJdRXffgxHCS0It/7vwE3TnWuU1U5MNAkNvKvSnx5O7SgcpIoUUyDP9QiZ0NQGl4qkU8yKAKt9crCBbt9GeYqinI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514089; c=relaxed/simple;
	bh=Gd0yXtKKs+ZHP6Ht3QxpUvb9WFxJIgvoYvpDMhy07/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWmjjIdHyHMVuIdWwpGmVJtJLZiRhnLXUL42N4WlKuIJbd5QwXP1wr3a3Otb38ME33Zh4MSt3NRM+NeEHf9bxoOSRxS1IaSLcVn069OXWFYgXkgcDjjh+mm5/NnHYfwFWN0YD5gu0jlU+ea+7a/BHobI1B1Q0U4Qllr0Gm6hlvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyUugpeY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso5988005e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717514086; x=1718118886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWiHpLew9vGqorYtx7ts5j6e/3RBM+m1gRe0g/Bu3FA=;
        b=iyUugpeYbnTUE4or6QM140sw8cu4xYUbSFc2KItDUurek7t/okMvv7Z7WteJvmWE8Z
         j/pj0GpnVYVej4P9ObF4pfV5tQdvQYOvHkzyHmZ3RVnnEqHiU7+/OwdVu6u9K2uzM5vP
         awEhIC8HuQcLRcZ88oVlaYAsKrnDJjBLOsW9C1H4dD7JJaT04STl+Hg+lSXXlt3EttCw
         LhEqs+mw9PRZzvSCHmTikEkd/9GktFsVLjAIaOSL3UlSW78glgOSwm1nWnnnQGNVB8Pe
         r+phDVGx2LeOb+wZrC6XoseZ+IvWaolRo1bpZqYnRz2tamtnkk0LWwEHtJt5eBsp0BgI
         dW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717514086; x=1718118886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWiHpLew9vGqorYtx7ts5j6e/3RBM+m1gRe0g/Bu3FA=;
        b=OR1WH7nzasxcxMr6vAykPycSn/Y9SLRy0mxEYu9WT1duMod0YH/HNqsIDOnGCe0RDh
         f++Jvjl2Pd32j4REtVgbrIaDuVAMTh/JzP9E1+Do2nvE8GuR0KJGgAPW6r4N8ieEURWQ
         hccpDKq77NQwHpurryB3W6wAP4G0qaexdDZoK00VfN27J3HiA9WHI3RRtZZmqekhzACH
         0uTqJRUG0mqXq9/zYxn4GeQVpWIshLf/cy0obs2I0XW+UPtKKBXtIdH1PZDZ9+J0zU6a
         cWywMX3g40jbJPfc5DTKQhY5QOGd1zRCXY1BxVXlARTm124TmP9cmCJgSOsDmE2hG27B
         KrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAeNxeSEBWkSQi0TigAGG+nqeWjmgIvUf3Zy5L1AWFZKCniiHo+MAnlBLDKUc06zjsrOX0NuIeHqd0Urr3fgSH6UQ9ABuRpx6SkaTFHw==
X-Gm-Message-State: AOJu0YyTphA5Mv+PxnirT6tOLh2D5zKsmvN29qmsZiGVzWzwN0nzQva/
	W1HdjmLXDz8sqzPeXHPOIhaErEQz1mwxSpq7sxZImTQba6NxynwZyj93jMzMxQHQOT/k20YOpyS
	E
X-Google-Smtp-Source: AGHT+IHm+hB/6mNiZerSwvoXhE+7cXjeasN8XmPyjTFGT5CHDOB7i12qXaNe0UACZFPBgbH5sCq09g==
X-Received: by 2002:a05:6512:5d0:b0:524:652e:1696 with SMTP id 2adb3069b0e04-52b896cac46mr8566501e87.60.1717514086137;
        Tue, 04 Jun 2024 08:14:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d873b9sm1513803e87.229.2024.06.04.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 08:14:45 -0700 (PDT)
Date: Tue, 4 Jun 2024 18:14:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <tymwexyhuujgrz2cvxkruimst3ff4mnevcm2k4h6qdmpmb7yqp@zqbwwc5t66ya>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
 <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
 <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>

On Wed, May 29, 2024 at 06:08:21PM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/29/2024 5:02 PM, Dmitry Baryshkov wrote:
> > On Thu, 30 May 2024 at 00:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 5/23/2024 2:58 AM, Dmitry Baryshkov wrote:
> > > > On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > > > > > > 
> > > > > > > >          required:
> > > > > > > >            - port@0
> > > > > > > >            - port@1
> > > > > > > > @@ -452,6 +467,7 @@ examples:
> > > > > > > >                                dsi0_out: endpoint {
> > > > > > > >                                         remote-endpoint = <&sn65dsi86_in>;
> > > > > > > >                                         data-lanes = <0 1 2 3>;
> > > > > > > > +                                   qcom,te-source = "mdp_gpio2";
> > > > > > > 
> > > > > > > I have a basic doubt on this. Should te-source should be in the input
> > > > > > > port or the output one for the controller? Because TE is an input to the
> > > > > > > DSI. And if the source is watchdog timer then it aligns even more as a
> > > > > > > property of the input endpoint.
> > > > > > 
> > > > > > I don't really want to split this. Both data-lanes and te-source are
> > > > > > properties of the link between the DSI and panel. You can not really
> > > > > > say which side has which property.
> > > > > > 
> > > > > 
> > > > > TE is an input to the DSI from the panel. Between input and output port,
> > > > > I think it belongs more to the input port.
> > > > 
> > > > Technically we don't have in/out ports. There are two ports which
> > > > define a link between two instances. For example, if the panel
> > > > supports getting information through DCS commands, then "panel input"
> > > > also becomes "panel output".
> > > > 
> > > 
> > > The ports are labeled dsi0_in and dsi0_out. Putting te source in
> > > dsi0_out really looks very confusing to me.
> > 
> > dsi0_in is a port that connects DSI and DPU, so we should not be
> > putting panel-related data there.
> > 
> 
> Yes, true. But here we are using the "out" port which like you mentioned is
> not logical either. Thats why I am not convinced or not sure if this is the
> right way to model this.
> 
> > I see two ports: mdss_dsi0_out and panel_in. Neither of them is
> > logical from this point of view. The TE source likewise isn't an input
> > to the panel, so we should not be using the panel_in port.
> > 
> 
> > > 
> > > > > 
> > > > > I didnt follow why this is a link property. Sorry , I didnt follow the
> > > > > split part.
> > > > 
> > > > There is a link between the DSI host and the panel. I don't want to
> > > > end up in a situation when the properties of the link are split
> > > > between two different nodes.
> > > > 
> > > 
> > > It really depends on what the property denotes. I do not think this
> > > should be the reason to do it this way.
> > 
> > It denotes how the panel signals DPU that it finished processing the
> > data (please excuse me for possibly inaccurate description). However
> > there is no direct link between the panel and the DPU. So we should be
> > using a link between DSI host and the panel.
> > 
> 
> Yes, I totally agree that we should be using a link between DSI host and the
> panel.
> 
> My question from the beginning has been why the output port?
> 
> It looks like to me we need to have another input port to the controller
> then?
> 
> One from DPU and the other from panel?

Dear DT maintainers, could you please comment on the OF graph entries?
Are they considered to be unidirectional or bidirectional?

Would you suggest adding another arc to the OF graph in our case or is
it fine to have a signal generated by the panel in the 'panel_in' port?


> 
> > > 
> > > > > 
> > > > > If we are unsure about input vs output port, do you think its better we
> > > > > make it a property of the main dsi node instead?
> > > > 
> > > > No, it's not a property of the DSI node at all. If the vendor rewires
> > > > the panel GPIOs or (just for example regulators), it has nothing to do
> > > > with the DSI host.
> > 

-- 
With best wishes
Dmitry

