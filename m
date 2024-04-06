Return-Path: <linux-arm-msm+bounces-16619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6589A8B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 05:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F361E1C2111E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 03:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D4818E02;
	Sat,  6 Apr 2024 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKax27RF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45CEEB3
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Apr 2024 03:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712375260; cv=none; b=QugAeFY+qBTfDPP8XrVlFBm/w1U55HfNEcocZHwJDMx5MZ5NXIhVraYPuwqIgH0vVaSXbRM5Tyn+SDD3yvqERvljxCLeiEvcEH+dLle6Hb4BCJXiF+PDHEr8UXvSulNyYmKVlZOCtMYBnewBnZns5JVX5nuTHHvf/AEa8iTXJlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712375260; c=relaxed/simple;
	bh=CrGv366HSVIKG9MIOnxGH0O2/DP73f4DeOovXb91ea8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bnct4dvEzEsr7T/3ylzfdFcpBLwa4bRv+51XFdbNYfAzg4DgG1cOOZ0lw3azleF5WLeXPxI5j3rBlphln9CVZgBw49ODoG7IgwOKHzgqsiu94oJOErZOzSSi4tOiNFmc1HG/LOsaaCNfSuWjJm9WiGVmDcCLXXrMma3ugKRXoo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKax27RF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516cbf3fe68so3164898e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712375256; x=1712980056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/uU7IKHxTMAAbrC11KIil89Yya/JAHmkuNwgB4NZyE=;
        b=qKax27RF2napdAG4dPdG53I7ZIna1DmE9tlwUhQ+iZY7aZR8H5TjoxuQKhCTHYMHj0
         RG3i6gka+sWaLKKPLfp/V+jjyb7+0tQpB+2/0RG6wKelyLIynNEmHctlI/re5dTAflhi
         IxLcQTuiF6OLD54m3VIUE75iatXjJgTqUrhFf93xPX1lhL2M50gM1hoA/mdgeXzZXpuk
         JwsK8kqGtJ6qM3E8tyLYXt41SZ5++cjZXAQ7WHiW0N1xh8HPGOm/AXwOiEx/h9ZyGiz0
         6s0jRWZlVchE3iMJ5pXRU1qcYoq76ftyEN5NiXVfaB7BJazMqQE30ZvHMeZet18hkJ2a
         NtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712375256; x=1712980056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/uU7IKHxTMAAbrC11KIil89Yya/JAHmkuNwgB4NZyE=;
        b=c4vDPkw+6+XuU+5NhbDpSK88VyN/hnUBU0uND4a7R03IFhq5WHl1e67tPsynJah+Nb
         wyi56vzW97cY+SV8X3vMJxjqDv8LsDdGEvpgkVxcm3IdQq3KbRdpl/XygHTRzisdt+9v
         QpAKCa+KXR5ALkXVklapXYYGpy+JoCI65vMZ68CZajArb+cVToUUSjRjxcOgFdPhG95y
         oAMcrbhHcWHjUpHbgvP7BRWMSQZLCgih/XET16WZXR0623tDTet8xZfG6UVgLOOhNaeM
         J6gmcgg1nJJuUzD1FJzOKG7JV9PChn1iuQJiqqKYUQi4e51MEo92uF1bsOcVVv7qV/18
         mtJA==
X-Forwarded-Encrypted: i=1; AJvYcCUIgBYI5kBaoRefvzAmnQpytm+NGZlBjTuShmgYfy9ONjooGtGqU8NEBgAWBC54Lf6r1RNKLR+zyPPXXYaKWwZ2QdcNmBWJnMcakr3/4Q==
X-Gm-Message-State: AOJu0YwlJ832IM2lirXy6+V/yzmxYcj+CHld17ZxkvmTfh5Jdd8OJOgs
	Eld+3ia5W0uRocvG9P6EtVdJcr9MSWCRkuSZg/Cd/rOQ1owunE3DnuYvLpTxEHg=
X-Google-Smtp-Source: AGHT+IGnVgGJgW4W+EbWQbKLF8gQTo8Hs7EZYSTgxIwK/hl1vXLroiMKUu/oLwz+20+QBTD/hTSGKQ==
X-Received: by 2002:ac2:42c9:0:b0:516:82c1:7d65 with SMTP id n9-20020ac242c9000000b0051682c17d65mr2054746lfl.23.1712375255742;
        Fri, 05 Apr 2024 20:47:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id m17-20020a195211000000b00516a234ca0dsm357975lfb.192.2024.04.05.20.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 20:47:35 -0700 (PDT)
Date: Sat, 6 Apr 2024 06:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: Remove now unused connector_type from desc
Message-ID: <iwsvkn6u3aindxqhkbyygoyy36chwuastxvmkoknb2vpgdq6mr@bnuuxveszbk3>
References: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>

On Fri, Apr 05, 2024 at 08:14:11PM -0700, Bjorn Andersson wrote:
> Now that the connector_type is dynamically determined, the
> connector_type of the struct msm_dp_desc is unused. Clean it up.
> 
> Remaining duplicate entries are squashed.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> This cleans up after, and hence depends on,
> https://lore.kernel.org/all/20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org/
> ---
> Changes in v2:
> - Squashed now duplicate entries
> - Link to v1: https://lore.kernel.org/r/20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++------------------------
>  1 file changed, 17 insertions(+), 31 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

