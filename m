Return-Path: <linux-arm-msm+bounces-22741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75390906D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 18:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD0DE288F1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 16:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA05019EEBD;
	Fri, 14 Jun 2024 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="co6gCz47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137D119E7E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382824; cv=none; b=ltL2+9jxDnu7voEZ7F+5iVwsnwW4Vzh0m07n6ae7IpFMA2+PPMh/kZwH9kNE+hfFUp0N/Ozap+26t7XtNS50K+V6rXn2DDmCf5osutMD2jZtdETHjWuRTO3Dsq4Ys8fCaHYIt0mu/vGYr/XxRvCdjALvD/YFgdLpC7cLvIp7bWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382824; c=relaxed/simple;
	bh=tg7Ug+R2k5P5nu7eDn/tx4zxzuIllL4iILv57t75vAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3uesDL0tFJyOn0KRWosz5GVlTQYf0vE/t8909AYfw6fYw4zWH2A0OsuYVKTAvm+reufW1+V9Qe7wr9m8D4Z3TKB8Jt+YE15WUA4Dgj9L+JV+Y0Y3oqoW0EKjqQ0J7PP+TzMRrUaNs/25ALJF7B3+jy2csM1LYYEQYkurHO7fSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=co6gCz47; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so43662081fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382821; x=1718987621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d55ULbnkaBid8TOFZdzcvS/9s8SVhV1X5mA5njwAFo=;
        b=co6gCz47cjUbGKSvknvGqpM5jqgNgYGTxRyVdLMMgnCqZO+1JU+EtQSTpUALmHC7Yh
         a0F+b0G4SYyQgvMdJPZY1wAlf9XmWFVDTrpseHQz2kBHMIzBvKLRK6q35EUtrFPH7CVS
         i4JuA7PkPJSYJrjl2q1F21cR83aj1M9HLEzxubL0iWP7LXF9RHC4dtbkoq1ITIyDwcmd
         JjoSxkSNKUQ5z0tNTcytP/btdwxg4F9eatSxR/EMJmWCgkmYunllnwl2eu+f5fwkMnmS
         1kfr+mFDQdYV6cK9iY06hooU00dDdUWOKJy++NjUrqD38fFfHatNDHIG0aeENAW6FEp8
         YBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382821; x=1718987621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d55ULbnkaBid8TOFZdzcvS/9s8SVhV1X5mA5njwAFo=;
        b=pBkO9OeAmh8UQEADa3DRrnlT+fnbeOITGs3IlNQpAyxBzVdqKnuxp6RBTBfrqz3Ddv
         Ftyo6yy1mzTjYjmGizjaMqKGr/Xwgnp2+PBq9OM6rReYVNrFPy7MkPVmXQSL8beyR2Na
         fJoA1xdme9bz+hTir4ZORC0iSORFaHR0YRQ0MV0p6rQNpIg0E9yyiQLiKYMckItX5x84
         1YyTS0LtcUQfuhIs602CM5xMzKc9AErQ4Dhi1OvorUCfK0K32YFKkFJd0Y4a7eVucCo9
         r/jNzhQCkU2lWnoXpsg1F+SoeQ+h8d29J49alFaaHDpH6A4CkJORQeERdOgOR4QE82WZ
         JylA==
X-Forwarded-Encrypted: i=1; AJvYcCXKy+SYnEEuBG0JJeY4epHACdVrjY/MFImwsfmIe9eNxbAl0K/OwmzR7PJYHx/edZHxmH/jmEi84JtCCS+a9XRV4o2x5bsE5hzfQltJhg==
X-Gm-Message-State: AOJu0YyN3uIwSip9eCZ1pV/lsfmGdjzpH2ZBZZaDRvTZ1D4Seezz/DGN
	RfZ3Rb0nHoYKjFA8q0jF2REb/U45F/gzYp4zLLLLC4fk9LEuNs1a5G6PO8CyV3Y=
X-Google-Smtp-Source: AGHT+IEnB+fBfP43mYT/p53SnlqGh8oUvLF5M1CtSsLsttHfAwsPZDksfX2T6AKsZ/OOhCIWhq9eBQ==
X-Received: by 2002:a2e:9f44:0:b0:2ea:edac:4886 with SMTP id 38308e7fff4ca-2ec0e5c9a5fmr24401781fa.45.1718382821099;
        Fri, 14 Jun 2024 09:33:41 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c89a99sm5527931fa.107.2024.06.14.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:33:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/panel-edp: remove several legacy compatibles used by the driver
Date: Fri, 14 Jun 2024 19:33:37 +0300
Message-ID: <171838280388.2978747.14895279716639954590.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 14 Jun 2024 03:02:19 +0300, Dmitry Baryshkov wrote:
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
> 
> Document that adding support for eDP panels in a legacy way is strongly
> discouraged (if not forbidden at all).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/panel-edp: add fat warning against adding new panel compatibles
      commit: faeebafe1d273ed6271dfb6555cd90ee730343c1
[2/3] dt-bindings: display: panel-edp-legacy: drop several eDP panels
      commit: 73458101e5681a7d766184cb4e16cb7b87571359
[3/3] drm/panel-edp: drop several legacy panels
      commit: 51e1fb144f17c277309ed5a1c6f0d921df0064d7

Best regards,
-- 
With best wishes
Dmitry


