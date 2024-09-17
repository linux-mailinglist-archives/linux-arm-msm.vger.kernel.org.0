Return-Path: <linux-arm-msm+bounces-31927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727E97B22A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9CC41C2207C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8BB18C345;
	Tue, 17 Sep 2024 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jrLuhqHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9418BC15
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726587149; cv=none; b=P4s1sjKX0IID+POkp/sZDH2oUVlEBmcodG5O0n6PrnC37VvKP3hdFnonXoQ+WMD6MAYXhXCn2x9nKrDRpE//Wx3Q8mjkwhMWFEbAeVZYbzSy97Wkwpuadxa8DTGhk066nmysBslBKpkvzfkF7fRfD04BVthvY3pyQWpjlTgjDh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726587149; c=relaxed/simple;
	bh=GtH6orHOd7OaviqK1eMSDZXt9/hshFTmujsoRog2i5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJFNvjyaQ6xiakjAoiVq0lGaV2W3XKixPECpj4RYk6z/YZ+FZNXuSXac95yIBazF42LP6E26r3h8AoxKgqpR8SByIv4e9m4RTKJYu3LN+bAWxU6yaftyqbK8dkdUj6jy+anoCxgnIqZECtheKVAaNCe4Upsyqbv3wOosev5B15s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jrLuhqHE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5367ae52a01so5138571e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726587145; x=1727191945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hovqWX9ZGGc/PguKDoamC6JnPtCjHAI2q7eZhe99mHg=;
        b=jrLuhqHEB/m24mTFwQ7lqODwdsXkSI4ZHgYeQwxkV1wFXNhYcaw7122NKAdfMyCKDU
         OYu+Hl7guKw94l/38T0I5poKeyMpKnx5xw5B4JmQMX1v7ZNji5jUwGA9BzRpQQS0oYuX
         tjO60Nog3uzyDTPeglaHhnBPWd3J5r6bDXhbROzC59bAjPFtqAHfw+sLhuvavONSHJX4
         nhaYBPxpZLeX3xboc3kOrhC3R8LM4JV9i73ih1L2LYdUenfajCgycXe8fvxKYWpnUJ11
         YFGodc9EM7bctRm4mf3Me2ns6M+XJiz5bMcelzeTeGkFFhnAZvmIlMtFDPUK+MrJFABS
         Qacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726587145; x=1727191945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hovqWX9ZGGc/PguKDoamC6JnPtCjHAI2q7eZhe99mHg=;
        b=fWmrFnu3owbWI/OEUpsiL8ekK+wCR87/8QEyruFAv7Y8V+84zglANvnjqGRXyCUO6P
         aQBXWd/OKnNGKe+D21MztOzb/wxqku+8xyZtVkjIaTHZrYl5HdMqxxqN4BLIXW+v4GDj
         JVgIt30G5vPB+SiP+58ZoPkFZNKMFA1/iDJ+u46RVVbiQneWG7YU2NkDNejNUnEYzzox
         eUqDumlUNROqnBsWorFJ8MUVsvPkYLw47LqOTZhWvNqimhQT2vCf8tbQ+Xk+/L2ZguQ8
         jyPDGuTGylNlTAJXPOXwf/VaboJO4N4c/FqAj8E4BytHE3LnKoFRjPnRYjvoR22E1v2B
         u9HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyf2sdTCnVSyrou3quyhCPAkstxJ2oQtBhkp/Lu2WXZ9+ME2RMFd47pDCMLoijUfUsFvxGtBBSvNf/VKlK@vger.kernel.org
X-Gm-Message-State: AOJu0YxO3ehZPrJMFuKvb0Zzfol42SxhqRFyOTEwFv4iUxMiJDbvrPU3
	DtMHUDd//wPxeZ2kWwWJnvhgm4gNhvmAXjSxsLVDUrtHnwvmXHLKkrUqJGXe8kc=
X-Google-Smtp-Source: AGHT+IGtfgOTi9jypDor4dQ1o5T3M6DF1HXTXj8usXJ4QJ+V6oHOzNjz0387tRIfAxVH1jPQlKdX8A==
X-Received: by 2002:a05:6512:12d1:b0:536:5827:8778 with SMTP id 2adb3069b0e04-5367ff3382bmr7813936e87.53.1726587144460;
        Tue, 17 Sep 2024 08:32:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b8cd6sm1218096e87.290.2024.09.17.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:32:23 -0700 (PDT)
Date: Tue, 17 Sep 2024 18:32:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, abel.vesa@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-t14s: add another trackpad
 support
Message-ID: <xn3pyfko2px4w73qijpkhccujgipckrazquesvzz3odbkxclzr@azgbhljfllfv>
References: <20240917150049.3110-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917150049.3110-1-srinivas.kandagatla@linaro.org>

On Tue, Sep 17, 2024 at 11:00:49AM GMT, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
> at I2C address 0x2c add this to be able to get it working on these laptops.

Commit message should describe reasons for moving device-specific
pinctrl to the bus level. Other than that LGTM.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
> - moved pinctrl to parent node so that pinctrl can be claimed globally.
> 
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

