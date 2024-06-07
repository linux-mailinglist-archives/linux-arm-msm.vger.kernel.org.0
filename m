Return-Path: <linux-arm-msm+bounces-22013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8508FFB7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA921C23D7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 05:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02554200A0;
	Fri,  7 Jun 2024 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVDDYZbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3FA18049
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 05:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739723; cv=none; b=SIIuaUNNeD2+FjJE3wumP+ke+5g313DHUMIces4PNmKouUec15yCSYXk49iJKOSh2gvdNQPVuPTaq6qr/JrGJ8EQL2iEtQUgW8gzlMiVowAXMmtGrhUysOjZSlnUEllNsvNMymKnYFK59yOIdn8ZbhAKEU+suQrfCA8dvzMOIn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739723; c=relaxed/simple;
	bh=ZhXwI1cGzdbG3/xPhux84aeXE5uygV37OsetZ+A49tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHk6YiGjMGmjXltctApk7+JYryWv5iSgzByRCg69B2I2v93mujBVzQYeccRC0E0a+oatGbfFJKfcqUa8uPlkv0wJL0n2qUwRLvfd8rg/63ZGWyKJDkrJWGgqMre1E3jUGcmjdrErfSVCOGfFrPeqctuTyNep2SL2NEODJtMac/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVDDYZbC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eaac465915so17040541fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717739720; x=1718344520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9BPHj5tjsy40u5xnIOS+sJiXd9TZKhkHWvmbm5XCXCM=;
        b=RVDDYZbCHjjSb1ysoxB8BQxmkpI/NReyrjiApQ1a5ucarQr4KM2V/kiXNnIkcBcD58
         oMKVojybysSXvLaQ3Nq4f7iyV9DoJ6dUnMWQyYWtYFe9dPW0qpwx29IvLJL6nhulVR9p
         I+BB2JU6pejVBI+iE4u2X+H+CEP4V/RUHSEQJ/om125O6T+R6NOdLu8hdQYeQKH9C7ZS
         xuESyungs6DPZmOfLSOToop1EveK7BuWTubGewGjQEjpzzxKDWZ+j5cBMBMas4IlGCul
         JXh9wcYGP+I0pKHdAOAcUmkxApEW2YudQ9chdntdv2sUcFSVoLCIn7XHTd9WgtbN8T84
         bxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717739720; x=1718344520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BPHj5tjsy40u5xnIOS+sJiXd9TZKhkHWvmbm5XCXCM=;
        b=ACzZ4DlTtv25Aewu5rn9ufzEyaxwGG2qZ/iVWLgxJzTUI3NUfH0ce1rTE3al8ixQpr
         wdf+klLv7zrNdWNWHCt/o1/Vi2Km5txAM/uKVGE8sLsUAqMwukPyyNNqlA8uSeKgd6a+
         ySpPd4T3HzY5GcGLXV4hxr9oBO3yBzTGR+sXaTIq9Hgp1qcgP3Q+h9wjx/XZ4GLsSRnm
         kastoEtxgjAw2do7bZehv7v4zWJ9CSy0GXcDlpoZ8Ur9DQP7/QWkF+XJt1EYfvDdsr+L
         bc1J69paKV2RzuiyQijTjJ4cI7z0kWWvRxIfDd8QYLIphM7K2SsF4X4OofnmXQl6d2c/
         HfEA==
X-Forwarded-Encrypted: i=1; AJvYcCWwXL8w/mRVnTdNxh4eweaOD+88uMDBleRo5dq38YaFpn9j4wmZv7WkIK7e/25npII4Yh/z1ILTR0wkVdEWyIMyXXnM8SaZ44/oBQBi4g==
X-Gm-Message-State: AOJu0YxkLla7Q8ACiXAt7zBEq25jIyZyfxby1qk3mnmsJu6X47t2/zBW
	NFrADcZGo4/eDfTSsG4K4lq58WLeP5E80hgM/Vk7NQpKFZheMX8UC6P9EcEV70E=
X-Google-Smtp-Source: AGHT+IHoz1Kc5/yTC4dbwlAKkn/RxZ/i22SG7V2m9thfEVSDlUh/a8lngHbXSPt7qixcRb4bTIg8IQ==
X-Received: by 2002:a2e:99c2:0:b0:2e9:881f:66ac with SMTP id 38308e7fff4ca-2eadce34e53mr9065441fa.21.1717739720539;
        Thu, 06 Jun 2024 22:55:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead40f11b9sm4233071fa.11.2024.06.06.22.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:55:19 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:55:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: typec-mux: nb7vpq904m: broadcast typec state
 to next mux
Message-ID: <i3ampmzac6rsbvjkysfcu264jhhzre4rz5jkee4ktqlwxnpbor@n2jjzv7sklz5>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-4-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-4-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:16PM +0200, Neil Armstrong wrote:
> In the Type-C graph, the nb7vpq904m retimer is in between the USB-C
> connector and the USB3/DP combo PHY, and this PHY also requires the
> USB-C mode events to properly set-up the SuperSpeed Lanes functions
> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
> 
> Update the nb7vpq904m retimer to get an optional type-c mux on the next
> endpoint, and broadcast the received mode to it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

