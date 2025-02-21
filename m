Return-Path: <linux-arm-msm+bounces-48945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A688EA3FAF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A78188ACB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A208212FB5;
	Fri, 21 Feb 2025 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTJ3l8N5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD3212D83
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154311; cv=none; b=d5u5oGNeStDTxdxePvKXCvc9aQGJC4XEqy5tu2jQ1X3tYr14zssZKCxRhamkY7JN2Wo1bs4yHFIfR0z2LlwFX65ouoK3Rj5s0cG03Fi8lBQ0FSX9ByKkbeot8qJhlbEVX155XnM4EuCwJWamM5G8sD1W3bqGvQjEbC5n9xSsvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154311; c=relaxed/simple;
	bh=N4UE7/hvMH7g1sYz2CLiEfW+ZkqCP2otYvYKNW8GSDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzYTN6qg54NuG425NYE8GqAKQYCtHd/rv3AuLxtEdm7CSQ5ZR8uLOdRM11AlVcU3g/ySSmj57dZtmrdnrgxLTSpGDMzrzo1DtI7e7ucFW2djXpz2oLQffkSTs7y6nrAQpb87+rS0xB1nlRsvmdYTGF4IVPKKJKeq/pdNo1H5DbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTJ3l8N5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so24195771fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740154307; x=1740759107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+tgAjCj9MawDwVZ/hBSY+WAuy/JgEh3oVqbLFgO/vU=;
        b=oTJ3l8N5d/E12NK8/IX69vrtTUjRSEcn59TWB+qqoLlrKHXE3JNmE1wNzrkF/O5XV3
         82+kF3vkQsAejVTDWwhNtC4T9gSXh48zGEumu+YYB3il8vMYQA7anu0cGtZPAvlzsboT
         dQimTIT8v0RkxKlWyAp73iIG9hn8EFeraUGQpqRys678kI+OLrAIu+6xJ2i1sB9fkht4
         1zGqJP2j9xVmZPdzQmT9sgUQ8TVGqrXkl3PIJoYzy+oW18fFQ8ehihTMU5Rq5G0VYWj+
         0DPsmbz/bUvQPJAFaGnQOdUVDhxX5vIf2sh5VVhnYI01xQwwPqobKzyY68pBN1pYAzs9
         1hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740154307; x=1740759107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+tgAjCj9MawDwVZ/hBSY+WAuy/JgEh3oVqbLFgO/vU=;
        b=pUoEY6hXX6cYPoVukBuzMvm0R4PhxIHmfNYBhlXWRWkq0Xb53u+9wXJ5wtrFNqiVsA
         pkO7OJNikd/91JZCcdBG1I9oWluAiuSmbSx+mmpSQxKSD1jLYO16hq+nl9Z4LK0SMF8I
         R6x8azi9+1u1AlZpPHbC3umYfiiWpofTR2x2JEFspOM0wfg2NT5cbi45yov1YQmuP/m0
         XRVy1OP9IhyP4XcUy3uBlzG3J5OjZl69l+PfL2DbpJ8FTCg1gxZgqNxQu/G+bDIAv1uv
         wRGeiG1vK/az5bwK6q4QEik3dvM/po8kk7M/B4Ei6NrNPtBxUSj+25dJl/tPeV3X1Njp
         fT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVYfK9+L7qKSuT63e0nQuEh5DE517p88Q1VMRZlG4M5wK06UtySEPQvyrBNDnALWR03bVNx1XeN67a0Sa4J@vger.kernel.org
X-Gm-Message-State: AOJu0YwdlwRrdak1qElkfHvpArpI/wXuWdBwLQyP9YSd8VD40qwwnocV
	plPVTZTg/2niH0kzRXUZavHLR4G9Fm7MC2Q02TfNB1s4kcF0DS8Uo0WIrnsugTM=
X-Gm-Gg: ASbGnctKTpK0O/kmTD31CKS27zetpR5aoGn6/9DG1F8jk4WMwLUJc6XW8CqTrk/RruH
	7NwdZXa3Sh7WKookN23xVElqeKYJ9Csmqc1jY3VqgNtiPXmAktz/d20YQuxWoNI0vlvOnQZLwHN
	gK4jalv6dbW9flXlVwKudQM8lQHVUTYGg8N1HtqGUDvAM15vV0YLdwFSbHXDwjZMIIMV/YnxqPM
	h2sVVVwJ8bdF8HYVJsc/3zMoAvu9EfqUX6vFZINR8P4tCdHHPZTlYjEhbw7SHPO0wGOsfsNfk66
	zxOue8ASsjLqlmtftuK8zj1okoCWjZP3Ee9KkoRHXlemOCmSTiPIrJpB6Wmv4SS0ahGuRAJubia
	ZcLPRzw==
X-Google-Smtp-Source: AGHT+IETyZBtso9u2xTJJhnVpTpjfbtC5aJNz6G9jWZcCAmcTZJGEkXDdGpqS0eQHNV8suEN6FsErA==
X-Received: by 2002:a2e:8854:0:b0:300:330d:a5c4 with SMTP id 38308e7fff4ca-30a5b1829dbmr12028681fa.10.1740154307464;
        Fri, 21 Feb 2025 08:11:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a4506729bsm8828231fa.108.2025.02.21.08.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:11:47 -0800 (PST)
Date: Fri, 21 Feb 2025 18:11:45 +0200
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 10/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
Message-ID: <k4ivqzdnvmllek4i4kmbqfhjcz3mohmromcfxyyn2jw6efkju5@mug3ndaptajs>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>

On Fri, Feb 21, 2025 at 04:24:20PM +0100, Krzysztof Kozlowski wrote:
> Resetting entire CTL path should also include resetting active fetch
> pipes.
> 
> Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

