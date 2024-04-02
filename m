Return-Path: <linux-arm-msm+bounces-16026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBF894C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 09:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70DB1C21812
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 07:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0B539FFD;
	Tue,  2 Apr 2024 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgDMSgQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004853839A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712042616; cv=none; b=CJ31CwG5XYxOyrjrsIHUlsR5iXSqOMcawuT3Ud1dH8Wbrc1ZQ2VVgGeZnwyl/b4ky/KJPDGYfcClRKW0VcDvhOfMSQg7eAng96lzMlokSz4G9oqoBzrR9107izWALl7FE6HKNgd5KSWTYWUVkby4Qt2jbpAgE4DbSQkU/tbFSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712042616; c=relaxed/simple;
	bh=R+JNuresxIpeDZu0KEACnnKyySkrtWt0XJ1lu4GqYek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocCi36+RiNBa8UpKOvFuGDVCbHZsPXSLyh4yEvmjI7VZ7MqfPedBK8kh0lBnV6vcyh2vTlvZzz6iahkx6ODr0H6OfPIYwyrcgeOTQrJp4cXET16XtgEzG0UcbqmA0zYlp4tij1TtiNYy1gTH7MAQi3mj54PBxLX/tFPe0U2OLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgDMSgQ+; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso4665864276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712042614; x=1712647414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TabQ2YZKZbkFzivtnWN/s3P657uIJJTcK5H1sTgsFt8=;
        b=KgDMSgQ+Hw1YFVdTJ4UzPXNAp7fCbuNGuesJJFnhQ33i7vk886H75T8i1W1yCaEO2W
         9Su/pBACryYbigkdEkH8zisAcXXjqqXbQtxt87QVGl4Gh1QqK2auCS4xI5cnlzIMP73+
         BpygfxpbkfU+8Wl7zBCHqCY/y9ikDf9gtYUMczcEB5Kt6sud7v5xcoMtrSi1+tVuO2Z+
         S91x6k0WDWxC334KtikUjNcAu63nQGCox2bNnJxUBu6tkhp+QaAsCXPg0yX/dbX+iO0u
         5twYCboqre+ZNfSLIs7RDlbXpZqC9+QVY0toPFM41Ypvl8EEE4E74rLAnvNf1LHoWuVW
         fVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712042614; x=1712647414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TabQ2YZKZbkFzivtnWN/s3P657uIJJTcK5H1sTgsFt8=;
        b=D9+d04pcQHsSd/7gL6wN3NXbYAle9FepihmKpTf2Yc+kMp4JsWFFCt6v0I1DYddV+B
         qgPNhUvkcU3+yMFKFJfYM/upCNeAf0bgZ1pdRZoUubFwag5JY4D6bEbPA8O/usHidMXz
         xRxBq/8geRBU7O2/5P+Lg9Bw4FbcgVZg5uNJ3VN7i/dPWvxMbEeQ/zI13JMDLsn0GiIQ
         HtqQ3/NfcoMOFnlC792ZtXxV+u1VBBAU7Ui/Z0Nc6UhHA/6+NUwFwgoiO0zEhhCJyZhp
         IVpGlE2X778L6R2UOKb4nCSJwqtLqvBzamzb3OQx7LpJdhX2zz9WCkYNphVwVwwQW3NW
         45NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyWOMHX1wOF91lvraDw7O4he9pRvQZIYfJ2+rVKWxWcwS84zDPtXbc94F79TtIVucsER0XIObE3WEztyaCaogTtJEtgr4/ZZxa6dewJw==
X-Gm-Message-State: AOJu0Ywxz8NmundIFnUbm1dve3EOqjgdAZCfGGr2LDMM67WeMh5r34Qi
	4GH6A3ZbfYHJ0ZvdnlF9LQY0SHYDBP4Spy6zkfGN1Hh+Qa4d0Tl7fjSguv3vWm1gFItKGEXY+cF
	vssMRFCSP6uhMBkttx64VuwSXejmikNYVExZOjg==
X-Google-Smtp-Source: AGHT+IFD86Uoe4DkZqNoswdbUsX4qLvBWlBIGcubcGElg6SvFLOP7pWe31TeIM97fq3YF8cj6wVYaY2qIVBhr6NNOiw=
X-Received: by 2002:a25:ab87:0:b0:dd0:c2a:26f9 with SMTP id
 v7-20020a25ab87000000b00dd00c2a26f9mr9419434ybi.27.1712042613940; Tue, 02 Apr
 2024 00:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-1-144f17a11a56@linaro.org> <9fbb9058-ccfe-436d-b413-b3ba27e4e5f9@linaro.org>
In-Reply-To: <9fbb9058-ccfe-436d-b413-b3ba27e4e5f9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 10:23:22 +0300
Message-ID: <CAA8EJprwWd=ZtwnpTm3cVP8RBEqxCcSGyBu-bHj=iV=+X2=FyQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 09:31, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/04/2024 01:51, Dmitry Baryshkov wrote:
> > From: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
> > phones.
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > [caleb: convert to yaml]
> > Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Tags missing.
>
> `b4 trailers -u`

Excuse me, I keep on forgetting it.

-- 
With best wishes
Dmitry

