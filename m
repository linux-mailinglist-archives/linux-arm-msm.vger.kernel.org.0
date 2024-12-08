Return-Path: <linux-arm-msm+bounces-40890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C30839E83B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 06:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA180165A35
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 05:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF26C487BE;
	Sun,  8 Dec 2024 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPPYQbbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237FC17C77
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733636742; cv=none; b=pD+c1lo/L06GqTGXs5FaHG+XSmUEVhEQ22514YstC9qqEnHO9rJgApI4E+VR4QcZhtfeCUg3KL+VL3ZEhq1e3rIf2socaNAmjKhnSlXjWI7LD6FNSqTW9XvJi+uNtyHbrnLmTicPsX8sNAU4S5jBFeeJWVd4M+GsT64SxHQcQaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733636742; c=relaxed/simple;
	bh=jQSd9Q6HiFF0J5oME229u0l+WJO4Iu+JBiIo7xSLM9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1q4T34na5vYxGGsN6Gi8ItV2KVn4Tix9ChxLt/0G4nEDTY3vcJaVUqQ05G6ZwITkBqqfqRXpCW1REZr60jdIjCjVmeNcblVycewew0TDp6pNNUACmsU5iziTssfm1tD/6QQYu05iOMqsBDPbVuTNHW/5mNeoKj0szG1sPu8jsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPPYQbbr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-300392cc4caso15430861fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 21:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733636738; x=1734241538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1HYv1e1G167UjBW6qsx3MDds+0Rx8yGRk5hPMxbh1c=;
        b=GPPYQbbrJ7bul9vYdgtSISjSDJN7+pS/g7QUBee/YwNeOVpkl41uMe9C2+tuxKAVOx
         UMmCphJ6HCemWzNQFinWVKjWyeSvVvTOFdR6o2ZC5EjRQuCrzddGACxVYwuZV204DAlC
         3u0IeDoRJRix1+6vBUFe5GsSGBbNpiKo+MSCn9JnzsSYq6bEyRLf0owPYUHicrcfpoOk
         ULuzhr9ipZIbO8LavH17JnMihee2+0SJQWU/iH1Pp3tvoIigWfclfI3JKsC/MEA+sii6
         1ciUkFy+12YTyoCgCXhj4k/CnaS6/PTENwPDWsn2pqFT+XQAg3SGJtArA6hvHapctKVI
         MIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733636738; x=1734241538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1HYv1e1G167UjBW6qsx3MDds+0Rx8yGRk5hPMxbh1c=;
        b=h1H8XdQ7Qazj4Fo/LaOSICEjAhzMavyLpw34/PR4GjUm6ko28r9CZ9ncCz8BEK3tfL
         tc8XyE3CvmNqlPSokoAC8zlCARXOghH7zBWn5MO+wN6RutlCxpvRwjW3lMw+gCVX0pqW
         SvX7f6H172WYkwU2PkckU4I6XFdrk7g7Kvy/aeMFq9H1IWr/9pSVxmF5a1EfojvUhUsq
         LxUedAv6/qi3uayhmz97HUCsTIc3raqS1/HgApTaw3RjKAPvKzxlwTkVNrkJTDogR26w
         uKcACti/IBk46c3Xpe6v7YKiM/ZBYpPKOM99WfEMFXmOqyoHlH3nnM6U156FNHXEnc+r
         1oyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdRCD2TY6GVBWMOs2jErXQEPLD23cY3zVTVuB3whPXBDMKunL6c98xkSNpplisJSKmw1P5UxqC0IdrQ8/n@vger.kernel.org
X-Gm-Message-State: AOJu0YwcaCPvsnlHRlW2ncgAOsw+u9oAvUCh/sbXJUXjTWtSwifC0ijl
	soCxFTsRPu67FVLfptsqJR7RTn186IRKuThA5eTDOL0AWY6xSjwbEvkJlEvZbc0=
X-Gm-Gg: ASbGnctR5YFu06NYaZXbBgJPkjOAWY6q+xxo0SgrrKfpDC72e8eOaBjY51z8xXZ3G3R
	ztvTni6oBma8ErYo94KXWNH1lqSBxsTBKExVaJrAFCX+G5RqmSE3aG9jgFZ5hDKVpOYARy80SXp
	wmcRWgEmwiS5bp2lPJ4X7/dTdhsHJusqXP8dRD4tIsL6WGkcKOeZs+n2TXWvPhxYYuysIGZyUJT
	VfSg89hAzyD4dOCbd6gYLoc3a1Cvx/vCutelHqGISTl7vL025nfj2FGEMsucgA6LvyJty/b4bjE
	6/zUCJi6jP9SObL130nbWhGc4BQeaQ==
X-Google-Smtp-Source: AGHT+IH1C2lNwnSo3DwPCOigAB6lGnv6/ya51zVyeab7Dq7ZnU+VYU4q8UWGtOmfbv3xMxYL+3XXBg==
X-Received: by 2002:a05:651c:507:b0:2fe:e44d:6162 with SMTP id 38308e7fff4ca-3002fc92bb5mr23529331fa.26.1733636738247;
        Sat, 07 Dec 2024 21:45:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3003162f64dsm6112391fa.97.2024.12.07.21.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 21:45:36 -0800 (PST)
Date: Sun, 8 Dec 2024 07:45:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 20/45] drm/msm/dp: no need to update tu calculation for
 mst
Message-ID: <ycu6maap7jonzybk4spyee5maq4if4eapzs3w4hhdmfzajjbst@5wiax7ve33oa>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-20-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-20-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:51PM -0800, Abhinav Kumar wrote:
> DP stream is transmitted in transfer units only for SST
> case there is no need to calculate and program TU parameters
> for MST case. Skip the TU programming for MST cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

