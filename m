Return-Path: <linux-arm-msm+bounces-63093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDBAEE2E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 17:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDEF87A19EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 15:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB45228F94E;
	Mon, 30 Jun 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/bvYIwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDA28EA76
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298083; cv=none; b=llyBx31YczqCL2XOoSntjxwRYro7bJIUDDYhXE2WBTkIFMUM/tXkP+X7utpVJ4WoOtIrWglBKAPG4NVyxEIT87sdpGJIrG9+xneOtUb+HA06axetwyleO8mT0XKe6oJXbV3nYtutSsAB346lVIT//EoopYCk3G2a6t2PiV/9/To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298083; c=relaxed/simple;
	bh=TxdOtgVn7aBHw3u7r5Eza56bp9saXogFpjFjd1vydaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WbHuqul1WkF9VIrTir87SYjoLeBn4xDsodnJTmrTQDlowoilPjBulr2RZgS6T0grw5HZ3tzicoxi7UirjWZCjte853SbLrslZPAfSfibxLdq4ewQGy4UDltbdX7FmueGCXwDlg4OMe9BaVNJAg7CNl8LLmJKp82irSFqoj7+WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/bvYIwT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4530921461aso30401445e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298080; x=1751902880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
        b=l/bvYIwTLe+P/YxQ/fVthVLj/wfTXaueom7iYq9pGA7+Bvd4VgzG3PwqZ+lxILFWH7
         hEGMmAd6MnVHwua0SxlkMHoKunanemfIY9O2nxdZD4SKsPBoDLP8YMsEG2jOiOzlE9fa
         cKhdz14FkEtQen+0ydDmPnAYuzh/U3efxThxySe1s03BGkRizYEbjO3adrhWTZq/ruq5
         vKUATi+Y4/8s0Hmk3OjrJr7FSvexq4nzkv421HRr1Gh6lA0kWpqgakO9qtJaXLbuzyph
         BhFQ/jocYNXYRil7QSzNL7JcTqWIW+NhSK9PgAu7JeYdB8GPV3ztkB7N07npA+xLorDc
         TBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298080; x=1751902880;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
        b=fYxlEREJKnKlKTaQ8WPogNUF4ktWFn4966TUEfsLsZVGnll+Q7RvbknhJ0xbqu6RqM
         FQFE33K3vIWkQ9EhLBwUttK/MdOfKg59VTl/R3pdyOZhknsCAH6/CITkbQXXZifbA0Dh
         TuMweVcEXrnkcOPwA6r7AQ2aUr5tKwGDOqIveUmVNoqxZWleMtEp6UVkOf9/9JMooxFi
         9SLkdA6x+l1wmpNBuXwStPZqJsLL20jndbv9znwvMOQ21RR9IORII5V832k5+DAXOVZb
         QO77HYHorGtJw0IxUMqJva6Trkgwg5kWb+CKKOsf2iY9pzhN+STK+U6MPGXe5aab9+0d
         haBw==
X-Forwarded-Encrypted: i=1; AJvYcCUXFGANenoMIxgHeyolQbae2ZWCUGzubm2WVpPoqyTkYZN+WXmmrzvw6wb+E220gx5Atx2ADpi+qNYGnVTe@vger.kernel.org
X-Gm-Message-State: AOJu0YwrQqa/lQKbCOYnQ4+f2uYzWrELxhBE24IFpwr0PmUVhHL6pWma
	F9SkGJ1Fj/wlYyw6bcdPVO387oRyCpcdfGvzEjaYKYVYUsqXMwzKx+ZnKRqdF7GzSfE=
X-Gm-Gg: ASbGncuKUxN3Jv9WWwArH/GWrWGWQZiiY9+6owt9bbw9H3otlWHBQg1+u4Uk+W9WaDu
	JO1Ck2br7ErqG79T+HydoLF/gW+Vw5jO9kECukvFmkAzxktFyMEJDKU5dCrmKmBClugmDxwcFq2
	IidIG0qUDWhx5jpBFGr01A01l0IiLcsPtKPSYDGxHmqKAf7V4fzSxYB2ERsCOtsnicLzz6wL1ea
	Uspw+8aTRcoGbGrucCcxrFcr42vX8ntutcB3sG3iKCNDPWts9NtWZb771zWHd0kb0Rx23xdDAK7
	NJoiHizfMReBzqLU/4dnJARCajUPGsnVTAvGkso+Il4VXgHPHTDP3hEmlOcpoxBqOiplRxCBcr9
	r4eufhk0=
X-Google-Smtp-Source: AGHT+IE4551ep9ypNSyk+kUT7ORHBKsH3ZNJO70PmyyYi6i5YwLUZhV22aROUA+T9WDlUEHG+Ihrqw==
X-Received: by 2002:a05:600c:5392:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45390bad330mr126646345e9.5.1751298079968;
        Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
Subject: Re: (subset) [PATCH v4 0/4] Add display support for Fairphone 3
 smartphone
Message-Id: <175129807911.2286551.14063311790282968036.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 11 Jun 2025 18:33:14 +0200, Luca Weiss wrote:
> Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
> to enable display output, and enable GPU as well.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technology
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/978a84297371ac33a15c56a7d31fd1b125427dac
[2/4] dt-bindings: display: panel: Add Himax HX83112B
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/54bd1390e98450a2c1cad99da3e2594e92c41a4c
[3/4] drm/panel: Add driver for DJN HX83112B LCD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df401fa1b80775109e2a52360fcb0b2b2300525a

-- 
Neil


