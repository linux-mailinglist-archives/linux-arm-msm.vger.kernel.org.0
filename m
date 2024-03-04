Return-Path: <linux-arm-msm+bounces-13247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3F86FDDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 10:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3630AB20D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241A41B819;
	Mon,  4 Mar 2024 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChogTRID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6418EC3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545512; cv=none; b=cIt/4GIxIW0RIquboiqaJWM7CdtjAXNdywyekWl5bjwCKqhYezv165eIbXDb46taHyUAVvuEbFQStbwpk63A+CdA1pon6QIvZLMI9vyoeiFTH3njrs/V+RI3bg9SQ4J3eCCa2pjtugfs5zSOdxPrWd1z79lAa5MjsYWIkrlm0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545512; c=relaxed/simple;
	bh=nDfe9LdmYUu7ooEFf8+WqyNex+ko1P2v5qgCy8lQKjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMKSPLl2USPiFrOqCvdy/cU7xyt+I2/6uAv2+hZlzJ/Y7XSRj6JYx3sJW1hnC0hCytSibaY9EbIFlggEwxCtDTTAnwPrX0rkK9+oHw11qNk9dFY5uRw3Kr6IX6lfqYOhOGBNK5oVn9kHHGTJ5ZVdGe87SRqqWGoquQRLFPGxZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ChogTRID; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so3659198276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 01:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709545509; x=1710150309; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G38jlOOjWdyF5F5/2JhgLPVjp/JQd8aCZTbhP3PI+LQ=;
        b=ChogTRIDMt1yug9BX6XYWi7AGwNuTYODE+CZP/4Ke8swPp3CC4O9MTJwu+0KaGcz3y
         yuXY8Zjc+2D0E5SdJt8xdT1f4imFrJ3F0vLXV2Majx0g2mNsitcJ5piaYGZbVdxfoq51
         8Iy3RVUa65hmJsEJxhqUq5Ahjcfq7wm5lgTs6EtZ4VgeEYP1+3JUdh1phs9gZtfsQUTX
         uWWF2Hmo7LoBxLoKb+cbDZTyrTH6b1mCnbMItj/avlNh3yEep8BUpmC3R0fvqy/oQsCD
         614Zbr7pEZ6UxBv1I2u+zHwYqqhffNegxKFFyWhVXOS0uA12iJDELdmxOVhEQAjZiyNv
         OOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709545509; x=1710150309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G38jlOOjWdyF5F5/2JhgLPVjp/JQd8aCZTbhP3PI+LQ=;
        b=gJU0tS2BTRpUPCb9ll/KuMOHi2QvQY1L9cyz9un7D/A80bEMPWWP4xTVisye4bPwCU
         N8+k2blE+rZggLDpzgDuvUANNsV53tWKtvZfO7STVJe9Ydrfb2fWy8c74ZpjRb/Uvt9g
         YBnTa0wI+Bpi67ItdCeG3WpeM4iV3XZ/ttMm8LJV9832lxb7mwBJF0j7ldiyyfvpyyD8
         CStWV2A0E7Cb6sDuN5iuP7u0IH01WRX+0SiOd+El/UEzr9A1zOUF+7YE8RJk3azQSp5E
         G1KGCNesSCt6zd7H8wgnqBMuAWN5YJ4ToENQUlRl+wdvEOpreUtwW/PVkyXZ0jNLnmm7
         4GNw==
X-Forwarded-Encrypted: i=1; AJvYcCXhsWGfvBfU4H/dRXgoQ7/B8ZC6H5QGbpxy7NtAoAPcibieZ8Hz4CxNNBQRfQNgRLrpOpRTS1wraw3tYhCmjSaKSSpfAJV2W3WG9f6Rfg==
X-Gm-Message-State: AOJu0Ywh9613+9fFbr9VzerhFyIj3oo4tkUymhg8yMHJ5HH2lBBmilMD
	zTKwZ3WtNGvgmXNGicb378bFiGn7BtgfT0N5bj8XYCkrqxPBppRV8VMGOiQNKWp1gZJ8YqYMP4E
	KbfmXX/Ynn+ZVlAbe1gRMTwVT3E66GdjISracrA==
X-Google-Smtp-Source: AGHT+IEB6xVfWdbAxpki5Q7d1ldQdkm96MPwnQOjlKKbuMgTXowcNWPDNc1CazVdJ5aCY6xTSuMxXPchvKcEkvfWLWo=
X-Received: by 2002:a25:6b49:0:b0:dcb:e82c:f7d with SMTP id
 o9-20020a256b49000000b00dcbe82c0f7dmr4198546ybm.41.1709545509594; Mon, 04 Mar
 2024 01:45:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 11:44:58 +0200
Message-ID: <CAA8EJpo1O9kDeYt_z9YHAu+nQXJ2XenejOGxm1fjED--brCWgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop unused dpu_kms from interface initialization
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Feb 2024 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_kms seems unused while initializing DSI, HDMI and DP through
> their respective _dpu_kms_initialize_* functions.
>
> Hence lets drop the parameter altogether.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry

