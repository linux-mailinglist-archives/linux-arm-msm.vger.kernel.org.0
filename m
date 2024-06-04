Return-Path: <linux-arm-msm+bounces-21628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58C8FB76E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0527F283473
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60D2145B15;
	Tue,  4 Jun 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3benqch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CDD535
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515144; cv=none; b=PIL/4r8PqxBXVIo84Uf1GO/LGA2Ew/XWD8VHh+kVNyYwUhcTazXTJ2pRtE+k5m3N8rlBWthtDs78ezhlQXVvnozhzoBtoDiiKeNy5Kai/GoxTWKMiE9trVYGUpcADHfaKuFDoD5hXFzkDFpWGirVBI3jVriSf7s0cBpSq0tNHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515144; c=relaxed/simple;
	bh=KATACN7PPYiX+iwxVKQicdKwHIF9fNOrw1pCGGpfd+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOPYZ6BXw2Hg8sQ07jrWW3BZUOmrW8JTIXw/q08B99zrLFyLU04kodnsIBGnPMSIS0gUSLlHna+ud0BlPF1Zp1xbL1VCXwbIxGJ++r7cmfeiEYtr9rhUZuAESHkS/tV+NK9NEf5smzaLg5QDJThQjHhHiJUi0IZXMTKiTAmP+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f3benqch; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b976b5d22so2850685e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717515141; x=1718119941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHrM44L4syIp6QXQbLvLBhWUBG/rKUy59LnNZ47iEDo=;
        b=f3benqchLwJy/GJs6PRzB85FcLBbu/3FjaYJJDlyxA87fqXiB/1agQt9LZJdfDNcpH
         G5RSuo7V8e6KWnGiogD+0L5oyEWVwkWA9eJPBis/sMdVsThzZxsOJxHEC7JieM00nPiU
         T5V7cX7u44h96+aYSa786UA1cwpZquygo4bAE12VL1kysvjKidfqsoI37uZ/LYbiFZKO
         yuZHGUpsNAMela1cV7XpymliXeaDR2+m8uHqbLw/FoGke541AFca8glA9dwPSfsQTMKV
         zAomgxUaAGsJPPmifbsAsm3kmJDZbTDIpXzPfPomiYnquuP2oCeKuGpB60baFGdax1Rj
         A2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717515141; x=1718119941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHrM44L4syIp6QXQbLvLBhWUBG/rKUy59LnNZ47iEDo=;
        b=CAQjTJ6j3MwWB/s2RdtVmE4jVTEaPm1CfClxnZBYc7duFbwqD0ZAsi3ucbJlT6ehqA
         YW5gwcN0SdH4TJvZk5gw53tF2gDJS5u6ZtLJCaX9hZ9GlzLqL617SZn/6TYBFS7sJoCO
         D0EjGLhL3LNjYnsNidPj61O+7nUF4Cff//dNFG+JK/zxb5IhEiVAG9FOr0SUmAFz9pf7
         g3VCLWs/Dnpr6hHKzxqs+t/Jr1pTEQ2grtm4LCCBfM/wfcFgGqlFEwcntnFJa3iniPNn
         DAlZsrpthTbFI//wUYgLmZrsc90az3NX012CgasXrR/TirKri2Qc4mtL1kmptm96mnAm
         Qweg==
X-Forwarded-Encrypted: i=1; AJvYcCXkqmPa6srmS3CW7M5wTAH9hS6CBptXF/8o35/4eZUbyadAsQKmuxV0yIyfCeoiRjtvDm7tZQ9FKC2Fm7FvHCTj5zNpZok8x622YjHmFQ==
X-Gm-Message-State: AOJu0YwceQez17VBITSiiLLxt3p/hnpLXav/bluq0ZNYifkY0WPNbrmq
	fW7wePJj5NsXUuAhovFrSV6wj4dCSnkuAP87Y4Foov+FwL3zNttHH7LnraPFCmE=
X-Google-Smtp-Source: AGHT+IGYLHNudiIaswlwjTUb/rMLM3nXqJvLYwLC+U0gfFCMtw5YjJkut7czzapYE+YZat6n4c3unQ==
X-Received: by 2002:ac2:47ef:0:b0:521:9315:670 with SMTP id 2adb3069b0e04-52b8957f632mr7525530e87.9.1717515141146;
        Tue, 04 Jun 2024 08:32:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7ecfdsm1538150e87.189.2024.06.04.08.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 08:32:19 -0700 (PDT)
Date: Tue, 4 Jun 2024 18:32:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <xc4knruvh2kasc563vbatppof67w5ui7bnoiq73euogvkjw2hh@meq3vz2qeekk>
References: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
 <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
 <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
 <tymwexyhuujgrz2cvxkruimst3ff4mnevcm2k4h6qdmpmb7yqp@zqbwwc5t66ya>
 <c9cc5a0e-35b5-47a6-b271-46cac9e19872@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9cc5a0e-35b5-47a6-b271-46cac9e19872@kernel.org>

On Tue, Jun 04, 2024 at 05:22:03PM +0200, Krzysztof Kozlowski wrote:
> On 04/06/2024 17:14, Dmitry Baryshkov wrote:
> >>>>>>
> >>>>>> I didnt follow why this is a link property. Sorry , I didnt follow the
> >>>>>> split part.
> >>>>>
> >>>>> There is a link between the DSI host and the panel. I don't want to
> >>>>> end up in a situation when the properties of the link are split
> >>>>> between two different nodes.
> >>>>>
> >>>>
> >>>> It really depends on what the property denotes. I do not think this
> >>>> should be the reason to do it this way.
> >>>
> >>> It denotes how the panel signals DPU that it finished processing the
> >>> data (please excuse me for possibly inaccurate description). However
> >>> there is no direct link between the panel and the DPU. So we should be
> >>> using a link between DSI host and the panel.
> >>>
> >>
> >> Yes, I totally agree that we should be using a link between DSI host and the
> >> panel.
> >>
> >> My question from the beginning has been why the output port?
> >>
> >> It looks like to me we need to have another input port to the controller
> >> then?
> >>
> >> One from DPU and the other from panel?
> > 
> > Dear DT maintainers, could you please comment on the OF graph entries?
> > Are they considered to be unidirectional or bidirectional?
> > 
> > Would you suggest adding another arc to the OF graph in our case or is
> > it fine to have a signal generated by the panel in the 'panel_in' port?
> 
> Which pin are we talking about? DSI or panel? Commit msg suggests DSI,
> so property is in DSI node part. Seems logical to me.

Input pin on the DSI side.

-- 
With best wishes
Dmitry

