Return-Path: <linux-arm-msm+bounces-55547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970CA9BEF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF20A7AC289
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 06:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3414122D799;
	Fri, 25 Apr 2025 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wieX0rP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7271722ACDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564024; cv=none; b=sGynpD59OiUIxSkov4BYCNTA8njZ0PRP6q5JTbmO0j0qUSm0/yCppQcx7oPRV93TFtzIebTX4Bc6SDJDQ7R3ngN/usX/6W9omZRQlJM7KOIBg7XyK27/xbWrpM/tQ5uTH4BeWeAAYAKlhFhe9gIQLTKzoZuPSDFEmfil38znSqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564024; c=relaxed/simple;
	bh=sAHDnlVsh9DACsf+VM+FsoaDdca8H6W3GwhY3ytqgd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmepLAUZHKE9D//fZoFvcu7uhle8nK6R329X4tyDmkkW04K2s+/nZQ56ClfQNH2c/IItsWeXA2HQ8Wf9Uql8SqINTgSeX1p3zYF9BuWVHoi+Ys3SMYe0ca19bWKexh1CV+VLq9ZtsAw+pGoActUCq0AMlR/oR4TxRKDF0SZtT+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wieX0rP+; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac34257295dso309416166b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564021; x=1746168821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
        b=wieX0rP+bYsetg4USRgkvKyZymGxzX5F8UXIZaNu8ldo9rm+ZbcRsOs2msWfrzwehP
         Ztsf7k9dE8EcTYCpSJIOqhgRQiYi+VsOy4IjwSM1h9xfALFt5x/Z+Ao7m0bXFnrehi0J
         tDG+rAW7WkVqMtHi0h94YdDqeazv+Aih5Ienb4L2z/p10valMuWI1J2/y2q6c5C31AtK
         zxSzQLJAX8YcbVqNaJYkbXPYlimW0AJgCLjVP89av5RE6OK8EtM3+bB3DpUDnHuoCdnc
         yAJ+Q/TlhJIfJPMEo415at1D+KoVtuaSTynzzaphTdJkCFHUcKooUaiOIhA8WQ8Iq1FG
         RuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564021; x=1746168821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
        b=qycFcUyeHPjoSSkTMss6U3tckF3jGPIJUs1e5c0kYIh0CcG7momLvM6UyqslIDK19n
         9ALEZEjnqIZ+5cFMLcoaWrTwJZ/yrOv7DqSJMWjcRfS65N4rAUOvYDyneAp5rJxBVELs
         KakdMw/plR2gh1KDLIQ+gOUEjBN0YYlFO2HYTJgZyNbk5CjW7nOUZGZNI61bwNEP02Ma
         cUykuqggDiW8hd35KjqPDhD9xcQ4V24D+7rqSTFH8bLyTx022o24ZJ7FJVpgpRaJBGm+
         58p2qO3Nivvoi0GO1Mz/lsU7ASibseyCQHbWj3ryUiGPICBA2twn7iAh0NKuVffKVu/F
         KTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA9Fmo9ITk9XFVXhZM3eMapd2xwOh4/C2R7OHxfGl3guD+KWOUCBHwrowi2aEVAg2ZpYgDNNHz+P0V2gI5@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUfgQxLNIyG0yMStqaZADaIyuiXQ0igAE6/MwVNmoEPYePZsN
	KE7WHu/xjGNypILYpEsvtXk/VsyJCXDLnDEG8A+X3EcEiJpo5TXnkb6ngg0G+ZI=
X-Gm-Gg: ASbGncvahSZI5E+ISCCjToa8rOIUU5mF/a3mmpIc0feVv8Pe+6P1kXm9/1xKUevugCL
	2ltoJ64foKI0T4IC610tW0HwpvcT435Olpg721cPHhdVTqtDSs7d3RbpTg3Q6mSCz9gx6m6i39A
	31zkMGYv7/nId5SOrNLJ+MWZAm5zWTe0n8lQoNevd/HHtmGrWVquVO7hzxp8ns4vUhGz5MyY/U1
	pLvPUpA+ZR+iEW1AURvjQkl2nJVzkxv2lLcqhnmvT78Y7jxb33KtSZ75u5btZna5Hl4dIM00x4i
	v+/Oaj1qScIUxKEel9wVthp+VS92oZYt5ZoirA==
X-Google-Smtp-Source: AGHT+IGH00KXAycAkV9YoM6vqabPYd7he5htUrIMPdynMtalpRs9NoW+Upt9XSoJNqYWkG7Pm5b77w==
X-Received: by 2002:a17:906:c110:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-ace71178f01mr114937366b.36.1745564020787;
        Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8c9bsm84603966b.101.2025.04.24.23.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:38 +0300
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
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <aAsxcrWyLeMB/Tdv@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>

On 25-04-17 04:10:33, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

