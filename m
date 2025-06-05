Return-Path: <linux-arm-msm+bounces-60344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B35ACF38F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8F51899D0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C372419D080;
	Thu,  5 Jun 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="gW0btmgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A41E47AD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139112; cv=none; b=W8s0uCK/YQXj8LoP9do4dVayf7Ch81oZD5rpJ4sivuwlAxVBjVaokleTiX/xkoZw7TKORwR8lHbfGi51tLCg2LwqCqWIZF4gMBTZGGxn5pAzXol3w65EKL9ZvHJyjF/DjJSl+SKVu8OS9NhQkhyapXBtaTvTxsy/yjMRdJkr+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139112; c=relaxed/simple;
	bh=5oy6KHOvTzdcuYytmPkKZgPrpl7idOQtfQSObqeQCVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdHiYwn3LWiToa9kYOovAM70NpP1+qL3NUdHhHSflbVdgfqV/lo8i6JxxY7V81bZN58o7E16i+8KYS0/KOEIZjERTRJGG/e/UaW5tmBBVXQUv9W3RR4O5A89yMeoo2x0SHHoiy/DI++Eqvw+gQqJYvXNQ+gOMNvAcgY1QzgKLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=gW0btmgC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-552206ac67aso1329283e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139109; x=1749743909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jY+fBvo1omxGhJb81xJVOAzLMDMZ0VpHsAY7o7wB4qM=;
        b=gW0btmgCzehWxNok2ZvOcAU/uE8xx9vZXUoy5HO61a6CGpYTesRV3mVq0K3ft1B8tM
         rUfO7oSyn2QAdn+0prfGkxgjfeEe3rV2DcU94NZ5hkktHJtR8uQOq0igXIM4zdanNGW0
         SkZiD3t+Q7ak90C7SZYqumWqSu5SipEt00OBWDGLmFzc2b8lunolrsGLGh6zfEM3qSTH
         AcLJdOOYwT3kYTAa6oOZpbvzHUmD7dU4yqImBpZ7WdTcH4pWANga0XVeYm39bPaflEh9
         jcP9zS08Fr24XRrrs0yfmPJ0UHj2DxyBKi2dOSpD+SlaBqnBKJBUETa+LAbIjNBITq6u
         kXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139109; x=1749743909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY+fBvo1omxGhJb81xJVOAzLMDMZ0VpHsAY7o7wB4qM=;
        b=w+EIvOTrlxFbRnYru7C0NckxHGqxMX+y1IOw1IJsRDPTLhGpKJhRuhZeXiOGTVvJtX
         pgfSzNnj4IdwGG45qnZn4tzYBc+rgCqXJVrUfv42I0UuSyPqEm9TsMPmhoAQ8kh64rSa
         iaFTcUeXYUoIKPffAugw5U4+XKDEBisVqmK15R06Z8NHrTFFoYcn9sdIBnppy9giEvjC
         c9oGZc45fDzu8A8+Hr4cg1BLECYTzg7OE0CedRlkNCGsefPT6f0MMkXVLxY/B/egtI1i
         C+1qhazPmamMrdaAKNerhkSqWvx/5tHUp4sqHLzxurpy0OuB6qcOv2OK9+PqXbWRSzFg
         GREw==
X-Forwarded-Encrypted: i=1; AJvYcCXidkn4R9RKqRxe/AnVr0HFNjtrhhNPQvO5mw3WM+UrkolG5VZw+d/CbIqnjcD/bUhm3CLB0bPxyQLvop3i@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bCdx9SCb9iSnVLbbQT9xrT63WpX/68yS8trQ1pBvu48be47N
	0XjLSqpi8wC+qiBklBdrJXEW58RM25UXBPqglQ1dFOt0CmnauJNgM3Uih2TIlOpMoDg=
X-Gm-Gg: ASbGncu/Zjy5nt+izHwkoanYWcucSqgCEQh/efq5te02RxDm4sFPjewzObbvByuI+B+
	p52JCI2a7bgECz2tyH7MvpJsgY5nNKkRpjbo2ZA0ts4FhFvPgUGyQDe9/mqWi0nWXX926noD8qz
	M25LdjVf+hEE1x0vGsEx+I/dnhsPRO4G/6hgSsJY/d58YnUfwG4uwc5/afCjpwP4vAIWU87o7CH
	n3/gSkc3WqrfWSJ4glSwjKNkLF3MXBCsanbGgilZz45MSLr2lt2FJ/ETwh0vOR9AYh5BZXMDQoA
	eHX/eLWMQMC2RDz0+SmsUcBIexkO9lzbqUVAY0DDalumFkcsykbNAuHjFWDYhdIkDj58/luW74l
	DXU1fxMu/p+CwxojOC9Q4DSas21msuvvh0nerMbtUjrVo
X-Google-Smtp-Source: AGHT+IE5g0NpZiGKWdQAhxqzPgU+EDalkwHq2x5qhV+iGVnnLfBvqqZ/6tin9VLqkHuvfZ3nNw2+aQ==
X-Received: by 2002:a05:6512:3a8e:b0:553:2a2f:22eb with SMTP id 2adb3069b0e04-55356df996cmr2190335e87.36.1749139108888;
        Thu, 05 Jun 2025 08:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b5664asm25008971fa.60.2025.06.05.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:58:28 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:58:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Message-ID: <p2nl6wmzo5tn7ve3ufhuwiw7sixg2bmmml3txwahq72h76asok@y24ixmekdxfr>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:02AM -0500, Bjorn Andersson wrote:
> Rather than relying/assuming that the tools generating the firmware
> places the program headers immediately following the ELF header, use
> e_phoff as intended to find the program headers.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

