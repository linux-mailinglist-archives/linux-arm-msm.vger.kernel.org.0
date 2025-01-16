Return-Path: <linux-arm-msm+bounces-45221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C14A1349D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638673A41AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BE1194AC7;
	Thu, 16 Jan 2025 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBQcTlna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F24381AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014663; cv=none; b=hz3Y2T3Bh9fGoECzemA7numjDacfppqtfyj/y1vU10NbWdq7Mi+r61dzWYuVenD/NYTnVq91O633PZkgDO6GaAzuyw2l5vXArOtF9ik8lBu/U5UZCKhX79dSbMNdVrJZqXJ1xWDjcSSbEHjftV7+YlLIMRGHW08PggMjvvSkk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014663; c=relaxed/simple;
	bh=2AfVNAyijys8Wj8WqHZfFKWwszAgWz/KEDJBgAn7Quc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K++bhXScePNlcSMDZng4ruL6R0abhkvvSWMs9dYxn1mcSyYVP/AYbpnhYhlbzvEdtFDRKx2E7BCYrsWuVZ0a7IjtFDoRxF6QL8MAvBCv04s0foZrHkU1H5BbeTk0H3kqDn5+wlkADTXvHGx+S82i1pwdh5JtkbWqr7HSYG20YUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBQcTlna; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-540201cfedbso529610e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737014659; x=1737619459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iWhOrb9/UASERUslvHT6A+SSMFyYSjLv0++Pj5Kul+8=;
        b=bBQcTlnayaHoHHEZrhxZN/Pyydmk4UWYE6ngTHFQZfPyhAKRIqIOaB7DpGYy4RZGZq
         GNa+f0cp8oGrbr9OF9wisF2Z4oS2GAQnRyLrNr0/dtLOxm+ijX95yV+LHU6Kp4PlUL9D
         KCp2S0Mie1UJsYzz6TtmnJZOQ2v9stQwIWknm48Tr/whucbi8YHD2RRbdMkeU2j0hA5G
         4QSl8/6tuVfE+CdPmp2aQIBHNaMMMfNTd4n6SYfGhZK2hiCQsqVDaa1QAwSD52CcAjN1
         CPgUQT8/Hp4wHG0d9lVzfrACL49V+pvd555CBCdLsV5QSLMPpqwYPvZ6TJ1VZC6NxGfR
         Thww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014659; x=1737619459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWhOrb9/UASERUslvHT6A+SSMFyYSjLv0++Pj5Kul+8=;
        b=Ud+8te2I37/yOJ2fiKAJFTujiAXRLL34JSy42l65d6njT8bHjN2Aa9oJUBd7zFi62p
         v2smKZ0R+M5FaAGTVaBwfICpw5a3HhY9hB1/ghXK0rz9UOdVg/SvNxtToKv1yvh/+Nqf
         +4R/xht/E2/vDQzhT7dPvyOwYh5qc9O1XAq2DVWpu6HhF06USuZMHKJNBbdz5qC0Cgyu
         y1H31Lb/EKLP6x8mJK9C4B9yPW1Q+YbDv3QjNa5LMrm8hyNd3x56lhvahVPBguzAgSt0
         MoewThl/g9hAHLBdcokL4h2N99sgIxGctvvUuogLmnaQwDPU4xsdXR9NITZOvatkRk9O
         lwQA==
X-Forwarded-Encrypted: i=1; AJvYcCUC/xVZVM9BtBqL9Db04ieK/NwnPd67LUPZo5b4+yiAbPal/kOhyeq/W67WxR8Z3rcAmjZ97r/fu7hJKtmZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzcvlZ2tuTbvRLap/l6BfGXFTCj7KyqsA1Slm2hIyvRd+Mn8g/n
	hwbhHrmQOKY6qSOU+FQlqDct0eYmnfqwoSjUmpM3ybXl/xSkVvfbPK4U+0Af8z4=
X-Gm-Gg: ASbGncv/dSmHnVqg0vrKovGaTlvs9pLgPPvwjNtPtJg2LZ57c0FgbhEqxmgZ/NMjR7X
	dZfMrNi2M3hNEiWAH1YkFWanqkJYM5ZuuE5/l0T2FHJuSOGcyoRogGQGNjt6ipAWdG5bPzUlaP5
	WXtelYV2B+DhaG76Wf0HDKlJR0Z75O6DhHmGICmmHcXcU6UhzvKP8gsvuRSAq65YMcNL8/DBE80
	cOtn1EZHhK+PQxTLMNQQnchPZ1yiFz2bMejaHgyX/IFzfEVEm7oE6VKR/RkUKrOS7zJpSzjvaEi
	ZbhNFp2XtNR9vfVhH6xfqOL43909tkd6G7VC
X-Google-Smtp-Source: AGHT+IEuDBWymX+JxWIF/uLo9WT0Lp/ZRuWOf2NfkbN1f2elgSAAg2ctJNMqdzX6Qa3aZuc+njgQRA==
X-Received: by 2002:ac2:4e0c:0:b0:540:2a76:584b with SMTP id 2adb3069b0e04-542845b969bmr9906447e87.36.1737014659463;
        Thu, 16 Jan 2025 00:04:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be499fcsm2251566e87.8.2025.01.16.00.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:04:18 -0800 (PST)
Date: Thu, 16 Jan 2025 10:04:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/16] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Message-ID: <vyc6zvymcaaw7nlkrsmxwrpbh5u7znl3pyegex6xndz3ibmm3w@xdm7lxlibkvp>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:26:00PM +0800, Jun Nie wrote:
> Split the PIPES_PER_STAGE definition per plane and mixer pair.

Why are you trying to repeat commit subject? I noticed this pattern in
other patches too.

> Currently, 2 pipes are supported for a plane at most. A stage struct
> contains configuration for a mixer pair, so pipes per stage are
> identical to pipes per plane in this case. More pipes will be required
> for the quad-pipe case in the future, and pipes per stage will be
> different from pipes per plane in this case. So pipes per plane is
> split out as PIPES_PER_PLANE.

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

With that being used as a commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please use this as an example of what is expected from the commit
messages.

-- 
With best wishes
Dmitry

