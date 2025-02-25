Return-Path: <linux-arm-msm+bounces-49268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B956A43AED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DCD3AA68D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6643126561F;
	Tue, 25 Feb 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQegHoU7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77594267AFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477894; cv=none; b=g9hhTQ99VY9CPcFsj2bVMfSEY+m1LEZzQV9MLvU90X7ZmVMd1B+8Vs8jdWmzqrWbpdJxE9MvZAyT3/NTLJBTXGZVi0SkJutDz0vOdhZoOTCI3WL6NPISoxBVE3T39S9PiWP68OIdNKX0d4F8jlPGXuKPENXx0sVdz+6qZ5y9zu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477894; c=relaxed/simple;
	bh=DuA0E92AFzqVAQkY9I4a+gZlF79J+R3+j7twI3wDzXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGu5b3oWoYiGqiz5asu3LsCxuf/AuonluuC2P5/HzH7iKCv1tlakGt2peIPN8TJSpZlPQfSwldGZbQFSiVC25rGiyiBlBk42dECUeyxlcGJA4bDucTJ1KO0SL/pP7yIfFqQ1D2zE3xyhSA1YjXIJ5PBV6JulJpnxjUvPndsGrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQegHoU7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54622940ef7so6110615e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 02:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477891; x=1741082691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
        b=GQegHoU7zMaoX0CCcDUstVZHEP9+1/KQNkt1EpS+vIIFy5FvWSl5vF7BK1Zg5h18dI
         Yb0r+yajDFy4HpSc34S8mwSN+9kaZ4NfThLl935v9VAzzIk6huLOT9fNeurTlW5kKDvP
         H8rw5tK5PV/sFqO3CFk0nYzXcFm/fVxEC4iib4gr5KfudokWG5A4RcN5dGEanCIuwsX5
         SzXIqprGvO+Kz7u5GVRBE3VQhhyY7NCramgDStv1WpMyBgfFkVw4hZByP9DgslbmGNO0
         oQ2jDwCTPs+to8k0Z/j7xOtKBaGZ36/R86qO6ae65QZIaLni6LFqdKJpWaBB6aQsQg0N
         RPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477891; x=1741082691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
        b=de2Am9v9sVGAtjr15Bzb7oco/2FdbaqsIc+NuzF5rTC9wdzYSiLR0T708PUiWcY/Td
         csBKEzp2t1iWW5phS5giq4Yd//q9GhC0pdvk2QbYWmsmOxB3v8WLdWyPngYsiNdlO3/x
         e9jVg+wbly3GUS6BQ9pNAZlKs5Xuj5Z6NMYzP6IH77rcyPVqnqHHUg+olLKciPnBbspU
         IUOztGrzspRnM4bKN4Vvpg+JCHXfUwbso/mAl0gvjmQdNjWjScoTdvJmm184ivNm8+k9
         trCk1RebJ+1+qYxHe0hPAo41sFpQ7Pt+AfddFUl+qLrB/V/RU59Ibg39RHMs4Q6llcly
         Z1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVFTh+NZsR7b3jGW4JNDY+p3Q+ClDz5KDFiVnd09FXJFANjxLcPOdS27ptvXQnY34YrEaNsEeW+pwJRKZCn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw910IjI9kTEwZef2qxqtq4ONP5yZZTnw5Ms78NWYeF7sx1CP6A
	+p4zasqfMHOpAsbnq+y/EAGf9xodQ6eA0G6miQg3vPXeofGSdnJIomey4t5dHoQ=
X-Gm-Gg: ASbGncvvtYshy82IB3nChQCoa53fXQebVqYyjr8DcwDgzBI9tN/hjVpDuy1ip+uq6CV
	wK0o8YBbyR5fwBHu0ggwARG8FyabYjGNtWipDKOE4DmeW0D2vnL2GEoGvEpV1X/PS1MPkBKLGmv
	TcO2SN23pIZkeaAiebJuhNi2+W4uI4HSiR8CBhnIqmmVylnt05CabVnoNKBVmoi6+5f9rXFyMLj
	yjrxMfZ+yxciZWEKSl7G7CrfDwAXdmLzMyyKSSqF+vl3nDlKWZWVO5vXswGgFIwKmbRxxSfGxGc
	oGYx7+lzYcxdj9C9fkgud23YR0NM8g5QRizf0t4sQSDObcSot9ZqOodUWCVjtcnD7p1ujbBpJNP
	DYEIHbA==
X-Google-Smtp-Source: AGHT+IFe8roSMzt3VVv7TZk036TpcSGcoxSHvfVATn8ZrfpARrpjkEuvUDMxx89xTrZ/KzUJppvbMQ==
X-Received: by 2002:a05:6512:104e:b0:546:2ea9:6666 with SMTP id 2adb3069b0e04-54838f4e48emr8396425e87.34.1740477890594;
        Tue, 25 Feb 2025 02:04:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9e11sm136744e87.92.2025.02.25.02.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:04:49 -0800 (PST)
Date: Tue, 25 Feb 2025 12:04:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <uzrw5szojucylvminnxghqld34jez7lfzljtdxtkmkxtm5xodt@ruihfzdhkx7p>
References: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>

On Tue, Feb 25, 2025 at 10:30:26AM +0300, Dan Carpenter wrote:
> If msm_gem_address_space_create() fails, then return right away.
> Otherwise it leads to a Oops when we dereference "aspace" on the next
> line.
> 
> Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

