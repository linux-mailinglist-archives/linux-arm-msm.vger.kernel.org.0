Return-Path: <linux-arm-msm+bounces-48574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD2A3CBF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBBA5177529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36F81DC98A;
	Wed, 19 Feb 2025 22:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fbm4edc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB807253351
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740002545; cv=none; b=jksjYcYwYb3RdA5T34y43Nk/fYREh2V9jm5s1OUnTr6avJ/glVTCRMHaIiY1oK90sGowe7Uh0cy6Q0Ap4MlTofveykTqKydCJaiURWuUYIxzKvTtswZ/ew8McrGpFBVrMk4NEZr/prQrSZwZp/CK2sgDQv+/boRYomh687Ld2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740002545; c=relaxed/simple;
	bh=g3mRNuX2xpJTljzE4dMGM4jTNrlqKgJ1nYwtEHsNtYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8HceSHqAC7avTGOYL2wPOahPObZ2YxiTT4TODUtsAERblrAmvgP4pn3Y7vBAyKRXF+Qmkkh8OU+03f61NzMhzmKrMzPbWCDPL6wfiwElsoy7cEEeu/B18Fzf1ZGQOaYYv+fHa3Xhemb0se+nl9TsTZbV5zo53DnpWnSA3f3GqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fbm4edc/; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a6bso2623461fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740002542; x=1740607342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXHpN0DWqjhN0hLE65VSAtbnzicm1GUQhBz/HJwZ43M=;
        b=Fbm4edc/8iSQEmOEeBQippKsbgpcgZjsiJq/pur4Hfp82w4LaZeXOS/87Y5qrCRM1E
         6mXmHRTfpwd5y9UIlb+0sx2yA/qE5fUIjKnCQNOHfNnf5KXhDJrX/SWVFWnHzqdGoWeY
         sSvHd0Mqi0o0fStv3ZwEssjNzEvZfvD4VFw/72vjrDNcU4uExeevKLeEApZL9JdHb9Wo
         pfFwY7y1C1AUUejcl56FsPUbfOS117yqBaJsVk7k1swu/RF59rAqCuRaZzWz8BVDcTII
         YrA7kH03pTFd4CKd0i11+yQsN7CFqtYXg8QY4HyiEcFCT+csJTHeu2m9CjrJZHZguVCh
         tAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740002542; x=1740607342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXHpN0DWqjhN0hLE65VSAtbnzicm1GUQhBz/HJwZ43M=;
        b=Y5qouj+Ly3fF0XxEtlNVSgdNnmlWrP+wvwtuaKehaWaw77BCaEHQNmyQCLEu9dTrpd
         TB41Q2spZD4wzWCYOYBvvbb6fAKqGY+6i5V18YvOyQ1B+PW8KdUH9wXOuaqmXuate7dw
         3PQGcVu5GDSgmwPyzspffGP4lHZVygKUg4MLaHvP1BUWFcpaEX4Jz8W2loZRRDuCk/pv
         dOAz5XG+ziwQxuQZ1I7qGJZfeebGNm20MG34p8iCd8S4sx0sJU2TXsPXO6ujzkxCFHAq
         XwKLAIN2BgyZ5VjCAZcg129v6NOZyxF78OOB+ZVPwxzyMdbTmivUCTXh2gOVKPCfqejz
         Lwew==
X-Gm-Message-State: AOJu0YzYwWS6pgI/+14pViSANKDmijn4eT1x36rany4MQjPw4yb2Xqtr
	Qwa1KmF9w9hRSPYYNEAHF1FZ5xVUPVDrL1vKxXhSSPUGslga0M9vKULtCNSLw2P17/zjsGzLLiL
	k
X-Gm-Gg: ASbGncsuU00ZpHZwazkgQMQYFFkHCOhXKOpBKJCZWoh4nUq0D1sEQofVcu3AeN6Ejhd
	Uf7S5sw0YEryWvhyFyhIF6RLnZRiA5neuba794xMzqPpL04ldUwR1PsiX7W+1b5j3PoHnw9/kWd
	g6+b5wHlgpPC76mjjUX2chLVIviWOI8sHA25lkDbmZYWV7U8C5HbB8MYLH9j6xtEDq4mIaUUNmL
	iRtNpP8alf/pLHq72uAyhPu7eLx8KmDSL+Mi4g5BQ0OFQpk7905Z2RneLt+rTFApgNv7hsJJxG3
	CLx49e1zbwGljN/n2VxE7PUSrTvRcNpLs8J8ExnmtZX55TtQ4XPqvAl5TXRK3+ZWK+H99jg=
X-Google-Smtp-Source: AGHT+IH3qwpCZJIIRtXoLdJAC5M4Yj195wVlXHneaiHgEATwNAfneT8LPoyDLjdolhf1GGkQ1/U9CQ==
X-Received: by 2002:a2e:a302:0:b0:304:d8e7:7ea1 with SMTP id 38308e7fff4ca-30927ad5151mr58261401fa.23.1740002541724;
        Wed, 19 Feb 2025 14:02:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2b50c78esm13466611fa.74.2025.02.19.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 14:02:20 -0800 (PST)
Date: Thu, 20 Feb 2025 00:02:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Herring <robh@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 00/16] drm/msm: Add support for SM8750
Message-ID: <h6rm4zlj2xoqp6ze34cwu6y5xxx423l7lrdrbkezp7ct5pwms2@jmrlxr6hyhb7>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <eedf08c5-d781-45c8-a5f7-b0369e3efac9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eedf08c5-d781-45c8-a5f7-b0369e3efac9@quicinc.com>

On Wed, Feb 19, 2025 at 01:17:35PM -0800, Jessica Zhang wrote:
> 
> 
> On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > Dependency / Rabased on top of:
> > https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> > 
> > Changes in v2:
> > - Implement LM crossbar, 10-bit alpha and active layer changes:
> >    New patch: drm/msm/dpu: Implement new v12.0 DPU differences
> > - New patch: drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
> > - Add CDM
> > - Split some DPU patch pieces into separate patches:
> >    drm/msm/dpu: Drop useless comments
> >    drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
> >    drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
> > - Split DSI and DSI PHY patches
> > - Mention CLK_OPS_PARENT_ENABLE in DSI commit
> > - Mention DSI PHY PLL work:
> >    https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
> > - DPU: Drop SSPP_VIG4 comments
> > - DPU: Add CDM
> > - Link to v1: https://lore.kernel.org/r/20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org
> > 
> > Description:
> > =============
> > I got modetest writeback working, but DSI panel on MTP8750 still shows
> > darkness.
> 
> Hey Dmitry,
> 
> Just wanted to emphasize this note on Krzysztof's cover letter.
> 
> Can we hold off on picking up the DSI parts of this series until the DSI
> panel comes up for MTP8750?
> 

Ack, I will try to remember it.

-- 
With best wishes
Dmitry

