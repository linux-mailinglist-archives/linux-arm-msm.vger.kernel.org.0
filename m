Return-Path: <linux-arm-msm+bounces-24836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D891E923
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 22:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0FCE2814E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C20D16FF45;
	Mon,  1 Jul 2024 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6V+A8s4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0916F0E1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864180; cv=none; b=TTTmTO7rsYcq55MFafSwdpyrpuc/XMdCGSNYEo56VLVmZu0t5eY/P86foqS8+U/gYxgxv0A92/2aEnOSwRrOyRzox4ssoazThzAKzdQUUG3xlUGRwEh3vaI8TYFF0wqCJnPyvmC5zI+2NzEI+IZQsVejO1KjzBt9CS6i9350EN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864180; c=relaxed/simple;
	bh=FNR/rmR6vy0+aDEomEh8L5gm+bBQq8dAdbJajJLXiOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp5uXuKRcJFtuL/4SlaqEU25XE/Du0uHGVu23f83qJY9qtJioePMRam5fz9XRGl879KE5wuZ6NidDkLRxgCBDXcCNlfd1tbCONu4ZwmE21VfqvqPK2ItayXHbfbKNWvfsPJgJmZlUlUf1it/Ifeds87B846n26ytjqdTuk0d3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6V+A8s4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e8b27f493so1494171e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 13:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719864176; x=1720468976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfEsJfsC2ks7CWPYI27j4I38dK3PJe0vgriu9DWaCNI=;
        b=L6V+A8s4Qv+url02wS/03LlZlbDn7wWllqPLn36sxVLxiORsCEf2wqUaJ+8RSHnbY3
         Pp1xAZzXMbTH0lyo8vRdKT8D4VLX9lbqexseDjbo+fL8vGH538dRm6GXf2pcBfiYUYwn
         gUZgmwvCqYLa2mPFDGhU/xWeoYUc+PZgmkZ2hm3M/beeMgY9A47u/GI9MxhdUCNXJZVf
         QcZur44QnIggqhuBHSZ98Coh4uDbThtCxgQhDzxWj5M/IB5M2ipEJzSs4wL6MZdY03yL
         Ka0iRYiMFPhCVJ/UqOGwNrYyeiAu+0roS/m99MoVFx97vxnUPY91lHvevDxPzGAPGQEV
         Y2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719864176; x=1720468976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfEsJfsC2ks7CWPYI27j4I38dK3PJe0vgriu9DWaCNI=;
        b=ZeNt1HBsLNxZ/kHfoirUlqv6lgSM57dtWqTi41qOBBHp/W1HBNhNIVo5BtrC/fWUte
         LZYU2rHgOnnLm0axSLA87T8zVUeJj+FrvAC76bGCdrnZKQHkSKiHhmDwoN/QLJfC7Ux6
         Av4dxI4G3TGPSO+BiXpFQ5ucyMm0nCHmYXpnlxhSatPr7jAB5b0bOy3HiAwURLKId+wg
         ZpoD9IaJ1KxBhhtNte4BYBv0GLzB59t4Mvu3OTBFooRse1i6AlYYjlvU3OEOY7Gr65oo
         khX77/Qq/KkIT/kzdXooiBTS4wfQTobxEublHZ0EAvvT3YsRW1MSqXQBbQNxNqNAPDD5
         WCfA==
X-Forwarded-Encrypted: i=1; AJvYcCVOJP9WSAqdeP/a46lPbQi0MYKaJ+m1F0KwMimzQCZx5n6xQIC6VrM8DMjBbjKW+otg4W20PKJjzamtQ+OO6S2vTyv2sNRzoOtxdFTipg==
X-Gm-Message-State: AOJu0YxuvUGeMApi8M0zvvfBpEJU/ksAAsypuGrokfDm8FsuWqHB7DGk
	lULB76+1vfxd0WcmKPt/fJPX2Vig/LPB9j4tgv5hRHz5paAJGm31HFGHGtdkBaE=
X-Google-Smtp-Source: AGHT+IGsjvOAZG6k6Yrc1aU147z/nHf11R4olGWCpEWKjChOK/ghF1HIDqiNrJy1XLnts3ZhEuDM0A==
X-Received: by 2002:a05:6512:128a:b0:52c:9ab1:a312 with SMTP id 2adb3069b0e04-52e8264c2ccmr5115108e87.4.1719864176585;
        Mon, 01 Jul 2024 13:02:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab10269sm1504535e87.96.2024.07.01.13.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:02:56 -0700 (PDT)
Date: Mon, 1 Jul 2024 23:02:54 +0300
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
Subject: Re: [PATCH v2 5/8] drm/mipi-dsi: add set column/page multi helpers
Message-ID: <r2dalmjcz2egae6uw6zlgr7yu74z5uivigcr2r6zzvyg72z336@agftaxio44dr>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-5-c4a1f8da74f1@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-5-c4a1f8da74f1@postmarketos.org>

On Sun, Jun 30, 2024 at 08:36:28PM GMT, Caleb Connolly wrote:
> Introduce mipi_dsi_dcs_set_column_address_multi() and
> mipi_dsi_dcs_set_page_address_multi() helpers.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  include/drm/drm_mipi_dsi.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

