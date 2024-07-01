Return-Path: <linux-arm-msm+bounces-24839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B191E962
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 22:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E60E283109
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511EC17106E;
	Mon,  1 Jul 2024 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0ahzrXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E94C17107A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864961; cv=none; b=oUXt8aysGk/XmBNCDxTUKLonhsmEReZkdGe+bb2QA8PLu9IzRXi1EQGtp+MITR0S1TrQ2N0/46oV7bIfuuANLeb1JXvg2LCF4YnoJxKjCgJWiF/01aMO9bJ7qvLXhbwTUh3F/VxI5yP8SDrYBzQVdUFbKwTbRzCD7m87hrzcCgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864961; c=relaxed/simple;
	bh=VIwgCdYfo2EDVpDqpPnXe9fwfK490V75vA+cDr+FOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQOsmlASBr6PzNTFkss143c82ahRIv6LL9NwhBQy/nl6Jmmt6OLnDa9msWdHXX9FuTmCaSVrCJJPvRvnWtS4SX/LKbdOZxIqJdf1ntYeWcagAuLdV5Y0KSltBJV8+AoFN77/rK2GjAPQrNK44q9uZHA3jyl8lb0q5YEUjkK6ZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0ahzrXC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e8cdc6a89so1201945e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 13:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719864957; x=1720469757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9/8mIy2Soy1rT0VBZ0KovI3gB0F5GIqwuAKjma/NsQ=;
        b=x0ahzrXCW3MiNMAyxszkU9qHj6PhkGMDRT/mg/YU3Erad1c7uDkn+iHzrLaNg1ZMnO
         QRN4T3Ri1c1ZYFPY49twg7xstYvNkEwnEsxRmcIwY+5kVfWvziKtvUtghCp4DfoXclNd
         X3gYJ2U7DaEhjkxnskjnnGenvM+4I10mj5O62dPqoczL//f/YSCVnFqseUlfHj7x/5J5
         K3aB0rp+uH1jgD8EVX53JGZlZrdeu9PEMuB52GGryNyliPr2X9IvFfbpJuH97ITTIlDk
         ci73QlCYpVWdZVlx7WYY4lhi47WSDYQ5ij2aPWRpBHesXbU3oj5OpdTgHxqem2Crbit/
         DQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719864957; x=1720469757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9/8mIy2Soy1rT0VBZ0KovI3gB0F5GIqwuAKjma/NsQ=;
        b=sSZkmAFvLdWMVsf6Q1ifjmCDn58PQZnGtS+1Kv9+xfvaV2m8ZHo/dcUyM6BXEUopv6
         G8opwCBQt2baa/L+VVSurRtMvy2H5g0Zdnmz1MOGvwBeCxcvjBdCxovLLUENmImpzhEb
         Z2bDxJM9J6Yimv1diQnf0zkGSXM8TWmXUC3PDNLgOZtCLsPBX0BMpHxfvGOEF6LGPv/z
         BcuMELWSdnHdwf156b7ZYgP5cWj8h35z7DdQfU6TaFG3ZLsuiYH7+Xcj16x2EON/Pjt4
         Hs9qJMhRnePDtX93iNKJRBQ2hDlvQ+F630rwaVQcC6M5b6FmCvH4BxvBFfj8Ce32s6Fo
         ZSsw==
X-Forwarded-Encrypted: i=1; AJvYcCVUrxyneADSxC0QkidVB8u/E5FrVD7EuXiXR+gwWjLD+WjCLqzjUD4S4Beba8MJvxzOUWh7U42HIKORB811j4DBB82klHyDlpuEtTkIHw==
X-Gm-Message-State: AOJu0Yw5cR0J8mvFMu1MH8fmAaCUAIN2vUXxexTR/jivebZeFVioWYDu
	Va9/kZv4s9vCD1Jb684MXCnBYpS3zNWjdyZIqx1Lnv+oKByOeYaNpCIzMEFbZtE=
X-Google-Smtp-Source: AGHT+IFxn3+GVHpCKWLFmtvjbAhKGJt1X+Qt6/RrWK3J3/PhaV4OJn52mux+6Y+DaNLf76MWaMizZQ==
X-Received: by 2002:a05:6512:3da3:b0:52e:713e:697c with SMTP id 2adb3069b0e04-52e8267b8d0mr5580487e87.25.1719864954692;
        Mon, 01 Jul 2024 13:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab100f2sm1522634e87.69.2024.07.01.13.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:15:54 -0700 (PDT)
Date: Mon, 1 Jul 2024 23:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 4/8] drm: mipi: add mipi_dsi_generic_write_multi_type()
Message-ID: <6bbvfyh3pgbx6cgzvgvxszrlm2eycpuqf2lzjppvlfnojwr4sk@koppspbhqins>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>

On Sun, Jun 30, 2024 at 08:36:27PM GMT, Caleb Connolly wrote:
> Some panels like the Samsung AMB655X use long write commands for all
> non-standard messages and do not work when trying to use the appropriate
> command type.
> 
> Support these panels by introducing a new helper to send commands of a
> specific type, overriding the normal rules.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
>  2 files changed, 56 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

