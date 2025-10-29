Return-Path: <linux-arm-msm+bounces-79538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83652C1D598
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 22:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9EC74E25AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 21:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D277C318135;
	Wed, 29 Oct 2025 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZEfa04lD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E21313E22
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771941; cv=none; b=LANjxG/BGaeAP6BI7BSjs4SAEltyg8KWHJcSqgpM8OukroGkf7q+i6rmdJRU8pgnKMlijo5c7rKXcF+tuTFl0LIcAKwSf+NhQrvJy9nxnFIYwMSh+xcl6Z+CHXA5YKgXu+Essi19EXq11GJgikyqGTeatJXFGS6Fp0fFSTCl/zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771941; c=relaxed/simple;
	bh=9KmAI6n3EJ3DEXVuJsKSffz4cZaU2oJ/Pm5z8amdxno=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kOuDNs3yCdnda8cPZF6j8zXuayvCUTbxMqK2vmg2VSHvVquFNLH/hCscrwp/hfvS6c5VHuK/8lnMpfyxKo+gV1MLwr4yO30WyezdJgzXvnVkcV+MsCvY2X/qIIF2yEITe9vgqenKiORKvfdGcvImHz6cqg6eo9fJQwBKc3u7ZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZEfa04lD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47114a40161so3034935e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761771938; x=1762376738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svITpYAx9yweNnxVjT+0+O3geT9huO9jW855FUX+XhA=;
        b=ZEfa04lDwLR7okbgCUlzWQOoB+ywIMqo4XLVUiFR20HwJtH1uw2Qpf3F18sCvzE4qu
         lJyrbIGnYSHOND1LrbY70AwWqzElUhj3G7SLf43k3PQ9WwrGjgGOjKjSBPpqEJN4Ik1o
         n1G8fmKCXsLKYEK/Z9UODgypfNiY78h/5E58BHUls2IVvg5SvAzxxWAK9kLyNqSHkyzY
         r99G40JAdan/w28VMAQk0kVmb765lhBULiaXQ3N/sDAubtAygZ1qUxrmLrDM0sdxKr7/
         K7voduBQDQTvPgr73iyxX5doo/sMcEKTzRVP1Ts4v6PeBwwwsIAQBspl48VxeSLjMEOP
         403A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771938; x=1762376738;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svITpYAx9yweNnxVjT+0+O3geT9huO9jW855FUX+XhA=;
        b=m2lSagJTGDea2sQl8SL+RSbOvLUIDhYPe5z77TSur+GEe1JSdaP7l2PGeYiQr/W+MZ
         Tm3T/fBD2Ngf3FQxEHzAGBPJAcqk4YDktN5R0ELHIwOWKIq+vIYRP153yT+HH/+4gyAx
         Ipu4z9BB7YA29dsEOOqvbpuHMYbHtgz6GvV9DMbRJqhBlCAqRBXlEz9TYEXJT7bXHWg4
         nUKgdUyB4Mh8EZXYdSZY7HPxTVOLnaZWvBusNa09bWifSJCy8kOr7/dDVh/Q/n9zM872
         P6fVyapqmQJZAHvJSsV6K7kCS5Tef8wE5gX96KIWk3BDXRdRESkJvi44K1xrWGSHithh
         GefA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ/HZDdk+f/z52ZhbctAW3ypOd3RTm4dpp5XBpuiKUalxeoalTP5M1UZpMRS8bPcsn15yqQTpAZzWBL4+f@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkZiLw6cEgtGh279PSAjbxzqiMBLmEyi4pbbiRdlg0egsF5ZW
	60onAtYpzUcdari6CggXVJClr5750m8Lxst9fZA4FV3ZJX3U54FiMz3oC0JGTycJRZQ=
X-Gm-Gg: ASbGncvvoNTOgrT+AVOLOfQD5Y9jT5pLoHIVN5cbzUuKLNK7KZMS8D3M8H7PUGXcnFr
	hwgCl26hfgSNcLGv6Yq7ChKCnR1xjPNSVIzZNMYHWdFnbt2wm/bAedJjtsOOMl4piFNDQG6JPBJ
	o4UuMItqEnaKp6pL6DCUrHyJ44jvBM+8CHwII0iVGlnSUxkdAiZdYiJI3jriqyP15pwPTXJ/xRS
	e+tM4eXhpxD/WR09XafvoeovtOLvreLaBi1pAYlwM9i2iPSaKKKvYK5Vy909L+xv+pKHVZ0XjJd
	a1bcL8i5K8fF7cjpJZb+upl1CyToo2eHOcHGp6Yll0K9LkAMVheP/3VlG/X6onMgAHnIAFxy4Qj
	S/2m6T+Bl5kuGQPIicAPIG0SWnWsPZ4b+e5pQ5gOz31/SFYke+0PoVOwYIdmZB1vc3iM5r9nxNa
	B2QKSZr/H/korqKKENvieY
X-Google-Smtp-Source: AGHT+IGjUyoyzO/jtzz8hqH4iMiJKrG0QJvlJqguCgOC62nY4tjJMHbN2DvHDlUADKcH7/pRsAHM2Q==
X-Received: by 2002:a5d:64e8:0:b0:405:3028:1be2 with SMTP id ffacd0b85a97d-429aef7358dmr3777675f8f.11.1761771938241;
        Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:05:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
Subject: Re: (subset) [PATCH v5 0/6] Add OnePlus 6T display (Samsung
 S6E3FC2X01 DDIC with AMS641RW panel)
Message-Id: <176177193744.2073083.518976981687833729.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Thu, 23 Oct 2025 22:24:24 +0200, David Heidelberg wrote:
> This patchset enables the display on the OnePlus 6T smartphone.
> 
> Patches 1-2 add the bindings and the panel driver.
> Patches 3-6 document the panel, pinctrls, and GPIOs.
> 
> Since the display node is shared between the OnePlus 6 and 6T,
> the following warning appears:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/986f28f3a71e44ebd984ee45c4f75c09109ae7ee
[2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/88148c30ef26593e239ee65284126541b11e0726

-- 
Neil


