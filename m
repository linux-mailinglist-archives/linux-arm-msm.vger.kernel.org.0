Return-Path: <linux-arm-msm+bounces-25108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B8925AF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 560AE297D83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072B717BB00;
	Wed,  3 Jul 2024 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5eobs/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623D17B519
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003344; cv=none; b=Rv8xt0Rc88uXEnZM9827PiKAGBf9vR6z573ZqqeZ+TcdD4shvD+6wt4s2+YwSutBR3k53jH3EDPa/gX4DsKrbUMisxK4TOxRsOpERqdXG6RqPJf9KwARwhzONumYn2EG1lQ3jAN6awAW28dR7sxBWMiH103XV2/F5pZpNr2PDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003344; c=relaxed/simple;
	bh=+qeav1XYsLy6VqdTKX2WYfgYp1f8/s8aYqZZTA7+cn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzdEHKheZjObDrjPibGIn2nXJbJpxzE4CBuxcu/ZJ91jmA1NYYWn1I1dpwhhSKEO+1pWUXnSdgs7KOYRIjfbXItCeJ7KmzwDsiZ+lgjV6bMtw4QW3m//i2SWzgrt05sCsWD0bSOnuvVeNTtALUxG6MjOMlLS6Hg+0kW1ObYjQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5eobs/7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso65116261fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003341; x=1720608141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u+8jSn1E/yhCSIPYZqegveZ9nuMdvW8tlwjJzbxZ4/s=;
        b=d5eobs/7f8CXThQnfnvM7v2EaEIvWO9yhMfrCjj9Ag1dOGGUbJtP+PQzKKIQcJa37o
         A0niD0G5WwABeQoyvqKH9KYs5RsvDWkmHtIEuRWuZTJNZh3FoclSyHEGE30BkYNG4oaa
         7R8LnBpboTDx9NpqdT00HDyIschPfn38rhWNov9au7d5WS6k1BebgHiQ1/bcpI6skj20
         DXbFjuH93nP/CXisztWNNGIc6CshSEqmugHz483CO+5OOWnepgzEK46D7iWiQWkIeKz/
         rqBsk36lu8ZOjKmlp8EEJWV1hIfR79EY7HuxRF7v+W6FgEL9Tn+cr7+SqVXTOR6e/Zw3
         YULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003341; x=1720608141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+8jSn1E/yhCSIPYZqegveZ9nuMdvW8tlwjJzbxZ4/s=;
        b=njsSnLhvNqD07A0vSq1tF67xBWUbN/mp0rEVt2T1tn0RrIca+EJzEsbXY1N89SPj3E
         ei66QUYl0kMUu0G5IG7T/FwgzDEeVg/aA55023PJhx1Bslll1HYim01FGel6mZsfbdGA
         keYQOAJneMgFymmd45c6cPztfKL7vn5oKamgc7NfyxDTUxniww4C7ZLEUBTM7IKN3oQE
         /4HS9ebIY+e5ceT9Y4Rb0oSQel6/aSeQyI1ZVf7B8eyeZOMLsW87HL45q0GXafZORSw2
         AMBvkHiSeHMHn8XTnIlLCbr3U9aEacO8JeMiGp59AQcr+gw5bbAxyQ8136OM1iZT0s53
         uspw==
X-Forwarded-Encrypted: i=1; AJvYcCVMKB/aT5NBh38UCxkmM/UYg88xUcrq0F+s9+MqfUYxZ2ejGwndAZGXC2dJASmrM6Krisrvj82JLq+RlluyEYDxw2DpBvcMN0gQhLL4nw==
X-Gm-Message-State: AOJu0YxNLdMfx8rAM+tRBvGZfgzIeaZ/SxXhIjYxRXc1lUZUkAaHzUV+
	k233JEFRInL5zE693tpfu2GxgxtxxgKciQD9Ne/2pVvoMqFv0EP91e7rylkzeg8NeJK/DOTf5AT
	74vk=
X-Google-Smtp-Source: AGHT+IH6JJtUSo7ojZ35ce20s/r55s3BW08cZO2StT7odZK8FedamUA06n8XsyRQp8517JigUqPkhw==
X-Received: by 2002:a05:6512:1089:b0:52b:9c8a:734f with SMTP id 2adb3069b0e04-52e8270ade1mr9509495e87.50.1720003338920;
        Wed, 03 Jul 2024 03:42:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bae1sm2081496e87.44.2024.07.03.03.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:42:18 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:42:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add PM6350 PMIC
Message-ID: <fcqzyi5vtox7fvs2nu67nm6y7bcjoabzosfvbqkj6n4yxaebpw@rneg5o5drkc2>
References: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>

On Wed, Jul 03, 2024 at 09:01:03AM GMT, Luca Weiss wrote:
> Add the ID for the PM6350 PMIC found on e.g. SM7225 Fairphone 4.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

