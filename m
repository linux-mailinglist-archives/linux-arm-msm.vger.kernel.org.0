Return-Path: <linux-arm-msm+bounces-38475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C859D3A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B968CB2BEAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9101A2567;
	Wed, 20 Nov 2024 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJ0TGcz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554AA1A070E
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103554; cv=none; b=Kh8GCH8J4a7do36eEoYLXxJr1qDip6pbj7+cl7tt8gtFM2JbdBSNF3jY4MUWCa9gYAV9roB5hBAuhItPKpeCFQcb01QYU1mQuXGJDCrjuO5fjwlqln9hTUUbQwS5nsGjIA0DnD7qPX3JEyCIvW7wMevJPlODZ0tiQqlSfIYVHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103554; c=relaxed/simple;
	bh=R9P/mSKOsQgDZHYSnA6xvbU0oyS2tzJ046K4Aghxd2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msfp8OXFFc3dJQU6KKlS3+62+X6XO0m1ks/ZNraRRoDB29XM55nnv7qYXqRaprbJfDdMLAIy8uAWCoCFuWGCR9494j4BxujknaXpxmt3mLb2s9/gDJcfOeYH9qhikfnQ486+avNHig4UCYHj+MvLphYobNsXHP2ZxyHOs8IFMxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJ0TGcz5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so2044086e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732103550; x=1732708350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ym6sQ4jNg6NAz3DL4w4A1dXlDy5B9Kp9zG6VDr3BqNw=;
        b=BJ0TGcz5q1jVGUYMzP+XIjLQOP5iJgCE/qcWyxHCxuiPmQj8baB2jtWRcpPcDRvkJW
         BcHDPVA1Ov1VVJDkM9oqMu7NlMFRCekw/5s2QnRtYIjjxbI76yZgc9dLTFAUDv+usfeJ
         nE5ItDcdKc4bIpvR/c3x2jShnI8HLtJ1Q+EbzL54Zi6LaYbJRrmJQR+uj7o9shmlQk0v
         ZoWOILwYkjcyE8T1MyfumZQlHKU9Wef+XwC9VAzRRDGV7iJtwZQZWNLw1kGGxJc60Zuc
         gUlz7zky2fZvMzcY7xYF6q7tZHa3PGzx4zIzUsB1tX5+XxxjQ7cv2q3RhWkZFh+pxj4a
         92+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103550; x=1732708350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym6sQ4jNg6NAz3DL4w4A1dXlDy5B9Kp9zG6VDr3BqNw=;
        b=J7eS0dmFsBUV2jQyaTQNggD8wchI8iwhFtFnka87fiFAycVZgyt32y8YJQQvCeI0Yb
         2EWB2mWU6C4cakjCHwy/ZcNJGxflkv+m6zbCId82hKv2Hfaz/kZ7U8pQPKb06wGW87Lw
         pAO1Tt8WF4DTnfv2fALMpJok0X3UK5GlUgAYObtpSxJ13Zhr0GeOd0MF+v0gCz5eIpXx
         g667zkK8EcOSn+74qxt81UP4duUXV6287+1x0CMi1NWgb0gS4B1/uXuQBYV0yJvVLPit
         Kgp7CCCn+OAq0h3VfuhFQmpZY7CAyZVy72iPYZDAZs2LT0HDZ9mAy8IWSPlx4Eu6n9Vi
         a4ew==
X-Forwarded-Encrypted: i=1; AJvYcCVrth8jt2dm6+/+44QYdgNLaW038INYsin/CpaSHVH07GIiwjJPVH4x+pSnJVV10Fi+iqDaeAFB50fXnKEi@vger.kernel.org
X-Gm-Message-State: AOJu0YxNyHeaVZJTae7yNYANCGuydl9cnJRkEv5UuISSpUseBggBQtH3
	1l5J9ziDCwCGZBVIXJOps8IcIFasDey/Aqx7u3RKQ3nlX0FUEKQZB6Bl9KeKNAg=
X-Google-Smtp-Source: AGHT+IH796j7yJ4hJd+DY4Ty2sJK0Q3wclTgxvZXjdfjeBOoVzy4zpbN0pmY5gJ/fhN9fzUW7ncZOw==
X-Received: by 2002:a05:6512:3da0:b0:539:920a:f886 with SMTP id 2adb3069b0e04-53dc1372f70mr1037471e87.50.1732103550487;
        Wed, 20 Nov 2024 03:52:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd478304sm613468e87.233.2024.11.20.03.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:52:30 -0800 (PST)
Date: Wed, 20 Nov 2024 13:52:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <5oavwg33c7jj227df7fvuw3j7l5t4m72gkf7a6qpfjej57kotj@u6ze5am4tx77>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-6-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119174954.1219002-6-quic_wasimn@quicinc.com>

On Tue, Nov 19, 2024 at 11:19:54PM +0530, Wasim Nazir wrote:
> Add device tree support for QCS9075 Ride & Ride-r3 boards.
> QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
> boards but without safety monitoring feature of SAfety-IsLand
> subsystem.
> 
> Difference between ride and ride-r3 is the ethernet phy.
> Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

