Return-Path: <linux-arm-msm+bounces-55546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750CA9BEED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CCD99280CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 06:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D62122B8B1;
	Fri, 25 Apr 2025 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZAK2jBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B4A1F3B89
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563994; cv=none; b=PbtDPuwcMACbqbzuEqHOJ/MGFtNfecY00f92q3FAifDgAqTXVz9CvY7r66wwlfsSc4Aks9qrhvweDZxdzYyhy+VRWYwReMsX7i5qvCbvQ944afEYL/zPmbm6mKPLLzIdYzQhgyvOxD5vamk9wL5FJQQhgPs7XnM+TrIpRekDdCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563994; c=relaxed/simple;
	bh=kWZESW0GG/oz2y5894KE52WFTqR3vuYMxklmsiy/+1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiMPbX92TJNlbxUtqimlYsuDeZRRcA0P8GdwA31/RI/HOqQ2neeBfguFwNiFGO5sed2D2jNW9N3pSzIPIGB8MkXebWufW2Itu7ZlY6LuWnRyHso4/Lom7vfXkU/GdDfsqNzk6GcG+U9nXrMswmoRKwMV/m3jiHXhhMwNAcRTRZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZAK2jBW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so249731666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745563991; x=1746168791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
        b=NZAK2jBW9N/od1YbzOjR+brGmpyoPoW7iGMy3Cgi5SGCyW7dfaq4UFLby6IrcBmnYb
         cX5bb4mcS8y7SHMKXCU5kj4QEeNaAAmiuYZ85eyhG7/dSKke/IwSCfhiuk7eeXzwJFsH
         p/GbfZHLcY9158xsBOl2FvcFmGBJ3TFizCcm1foIaXB231ohHKH+BE4kYgZCedtju1BR
         MAJVoNXJ2SYHErMtFZ/jRQpEafdusNLWYDmTxmYvr3++QReTOf7tETCt+sh3e96bU3CZ
         mBzjwhIrjBXOXuqmMslh/fd/0GG3O9mEqn9vejRRbuCpcbEwQw2vHdQuPyvnxyXkc/x9
         yt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745563991; x=1746168791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
        b=ESacOq5dZKY6tjg2vnRYKZF7jBbe4PgSJMyafNtfpfEM8bj5gZKNdfNtgeOf3sbKNo
         bI8EHV0qcKSkvLogQ28epWhvPU9janhglqQkDFuH0FUnmjUEo1V3B2LJJQuWLpGH0dEg
         gao5zUd3ZicwqCs102CwGgn93kBErsDt1LEPopHzvq+xWqwgB/2lB4p1u77iZJCAlZXW
         ZqW6WJhsJ6323E3vr0Sdusw7hfgL3D9duJP3oXXHYWDSk9buix8QJSQHZNCdJc5Vu8zI
         xCW5cjVgh0b8N7+G0Ypq6kqh9gLhhORMIiPPWqRh0tLkVvmk2Lj4bgP12MqbU2ZYUNMp
         JUQA==
X-Forwarded-Encrypted: i=1; AJvYcCXgtCmF5T+6lMEjDAN0ZVM2MGFKbzLAjbNZLfG4loeHUdITqeuuRbt2p2x8xCVN/PdiwHUpdvQrgeCG7Iqi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sxGpcJfRn4niWBF0FkgSVq6cFvX9uIUscmYAksQ1BvV6Xu/z
	FLjGL5YI5KAtCxIuQrNX1pUUOYUgFSA0GDFCUjdZiQMrlfy7HokmMBH5sCm0kUp41YHEvTTign1
	g
X-Gm-Gg: ASbGncsDyf9511PwXiGIR65E2iinv/WnBjUdKB+PXCZbA/JMP6YTTzesoU4JjcRk184
	ynDEJ/45WIpbcHaQ6Q7X5uYDx/wBcFvlPRuyxkp8NSgZVGNUIQhF7P3cfGyqntB/d5cMwVpfmKg
	/c4Gj/WXyB1cvLYZSTQDF8jBtkns1bLHcYOtumHW2Z2kfXvQqiuAnAo2GFJgV1duMdANqXtRTFi
	xhkFgBxkWzAaxYSrRGVtApu4pZiPYsA+k8zjaW2TzdGFVahoQ8CSLPYNWNFvASSNEUPtWs7twos
	Pwa0a6Hd05GOI3/G/Bpmji4iIYIStkLbOZsugQ==
X-Google-Smtp-Source: AGHT+IG58VzDkGFhm8Z0pviWxJ++MDZSR0fg5sx14OLcY5mVRrQMI1meGNjl2MrGAtIugid/tRuBDQ==
X-Received: by 2002:a17:907:9485:b0:ac7:75ce:c91d with SMTP id a640c23a62f3a-ace7108ac55mr108123666b.15.1745563990935;
        Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1ac8sm82529766b.182.2025.04.24.23.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:08 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <aAsxVGtW+yNlFd5P@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>

On 25-04-17 04:10:34, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

