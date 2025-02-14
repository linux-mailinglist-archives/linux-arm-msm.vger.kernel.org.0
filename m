Return-Path: <linux-arm-msm+bounces-48052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C252CA36191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC1F3A14A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CD12661A9;
	Fri, 14 Feb 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbutWQuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34D4D8C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546698; cv=none; b=MKxhOF8UBfmn2Z+WrBWWNrjtz/yVJU6zejuBbwlBaC4rGWJrEHJ8Mi8Flm3ydgpzm9MMePtNJ7Q+bQKfxgjmf+M0i1VKWFsnu3ZkHD12tgrr5K92y/J7jLDqfleutAsmT5kcQcipOOTAQLthKfZO3T4qUvIf/6mOerpDcoWilEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546698; c=relaxed/simple;
	bh=3AIXK8A4HfhLUSnVmGUk0Vjs1zG9SV3ymB/OECkXC1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVpxz8cR4vRlPNqC0JUe+VuF1p8tSkihL+LDcIm4khHSSHosxCPjtfkgg85iEHYbzuJYV8p37m3pM7V8pqQc8XTg0mvE+5lbUpU8UUTdBm6eNhmXeSCKEaPxs+pWNSancZVacNuRH09Z6yNuohRkU8cYgiIdNIdGUPlnCuhAe+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbutWQuz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450b91dbc8so1968057e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546695; x=1740151495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43NqkkXmKkwdOYGO6ycij0gMr1OHesReBZTFUoOKNec=;
        b=MbutWQuzrJaKYsaY8jdGhahj0L0woF0al77qb4KvNyecG8WR594uofdo+Yd1YoQYuj
         J92CKYvQcYO8IFsz5M8fnB6hYc/ZGrYf+nFFpwT4y1G/UzVFqXPYVFIL9tLp1HaYHZih
         Ttyl8AThTwHbJf1EfmBYq8tD6uxGs7NEMvaGBW21M87RnaFTmbOuUqMFZlUe1ASwn7+l
         r4IyswdS63sva21gMvPeojc6hKD4OB7yYe5V5nuouK8f1DGzuEY9VrDbWND17eRWaxkG
         TXCaElkY+9ySCwCLzMtUixPSuScvwsj9bgHfmuVrJ0NexGrqakC1HPtAPpyLyLI8o9kp
         baew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546695; x=1740151495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43NqkkXmKkwdOYGO6ycij0gMr1OHesReBZTFUoOKNec=;
        b=tthtBJO3tL8F3lG7o0RkktG9QX11utbaYpPunswg13R2yn5bxgxQjKIM/HiGTdHz5f
         5i+7F1dd2KrmoewVQK+zUi+Xt0hbtCk+NxyczW334lhxhCXK+HUbTGBVCGMXMC5haXR6
         7bO20gGzf4rD6HBwzE5ZB1WfqmE1TlEn2qsY8pJVsceGPHgyZVzXO8SMDuVXu97C+cYl
         xHlIENq7O8jimXtC34toj+scsXEs+IZyl7sI9fSIbT9aQMS/ST7JZ8Mn5eXAMaHwySD5
         kkkcTNsDWYdkvdOFRbwSz3XriReWaj2VEpe6f6g2Tkvg8htdb7rikuI5TyKAT7WvRsAu
         1AJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeWn/oVcwwaF52aptgChz1KpNHx34NZpgBDWxoU5k+AS6rq9ak7w3FGUU5NOddkPGn3JHRFov511xTudP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fFqmRwjFMQq7FvihplKAXRXfGwpIJbbRKHIwyjP9G6APT4+V
	d3rho5y1p3FgPFkQh3/M3L+ynxjWsRs6CQtxwm7/edvedtrmtp/GgKdHrqe+DPA=
X-Gm-Gg: ASbGncuwdUYWLV73L3OYztVefDwZhkNrMTsreKf+sPG/4ssKBUG4dc4a5CuKf97zwfO
	pFcPyI7ZekKrbRo34V3qXtt2IBUqrwgkcl+TjM+70kqpSQgCgXNSd0Fd5XD2jRx9SIsfR59ssYL
	TwLJ2gRqd8QpHnAzARIfBdL/fGXyQfPPYsi3jHA7UdZxoqY2BRdTz9RMS/2pXlG9Rrkeybuy0BJ
	MsmTk+grG7icerXQJI9HxzPKfPZRttTZp83KtPVaOfrJa8gpuE3Fcsgd1kOQebKC9qGWIopr3iN
	zlx1Wdxw97P/+reV553fEBzojvnUFUY9atyiPykjsh5/gocUUBBGwLRNlDlojcMHrPvNqOQ=
X-Google-Smtp-Source: AGHT+IFMMRc1GwytzG6k6ATLntN6Q3zbP4uW7Ri3VRuH1h0hGLW4B1KSA+4aA5975RklLNi1meEo1w==
X-Received: by 2002:a05:6512:3a84:b0:545:2837:17d0 with SMTP id 2adb3069b0e04-54528371a46mr1151389e87.12.1739546694728;
        Fri, 14 Feb 2025 07:24:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f083528sm556057e87.23.2025.02.14.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:24:54 -0800 (PST)
Date: Fri, 14 Feb 2025 17:24:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dsi: Minor whitespace and style cleanup
Message-ID: <7ppfvbbfvlfk4jtqw7acxqjm7flcfpx57ijyqcgc2x4qe6tlhr@jdldkmghceay>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-3-1bec50f37dc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-3-1bec50f37dc1@linaro.org>

On Fri, Feb 14, 2025 at 02:17:46PM +0100, Krzysztof Kozlowski wrote:
> Cleanup few obvious kernel coding style violations: missing or
> unnecessary braces in 'if-else', unnecessary break lines, incorrect
> breaking of long function declarations, unnecessary 'else' after a
> 'return'.  No functional impact expected.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 51 +++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

