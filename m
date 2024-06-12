Return-Path: <linux-arm-msm+bounces-22385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28C904D67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5469EB2123E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC17638382;
	Wed, 12 Jun 2024 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzYrEmjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9894696
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179331; cv=none; b=lSYuvKI7E93jK0Es3Sa+7XOUQgTsom0HmeCvtu5Gcnxkdc92dcTfa8/fr/LtnQwGU8DXjDIhXKODNBCGUpHuGWS8iDY13hVxH48ZJs1PfDWPE/jDiaugBKXWgiEdYyBql8OTurCDc98fOFCGX6rqIAa4ZwxG4bzZW52c0KoZfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179331; c=relaxed/simple;
	bh=E4ogs9hBictxE7ukXz0EmjyOLTNqPtBX6JxBOeDJggM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EH02sK78KuVy5XChPooevEVKxlzOKKjUtkxk29v0kE4SzR1anVTcG3wR699Wzyw486cYwr3rnPhsmFmiV3zIbNL8S5N0nF4a1DtLsHmR4yzIad1I/WMtizC49Brp6b6hMkPmGOWMchXxI7+k80w4dpkAZd4s3aYBhY3WLxlPQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzYrEmjT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso2579836e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179328; x=1718784128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy6VaAIWsc/uFJxkxC11R2z+NrPGPrzZFexuniHGbrY=;
        b=NzYrEmjTa8FaiGfGTcVuqWzOAF9WVuHG2wKoEsALDBP8S4C1+NJzF/si4ueUzfpj3s
         TkRWLyg/xf18ZfNJFktPsDDftbHCPuRsikZF/X9QmXKCUSccX7DlgVUPvKhpqzxFdCNp
         kHiekoWtxVjyemu54W38CiGgrx3l89sd0fC1ZdD+Y0R/eCpVSAW2hG7+NwGZ3iMEoKSq
         r7inZBJwEw0KgVOuvDsFXa7GpaSV8AzAYp+gNgEm+7n/nxSblj/HCVZGr82Qqr4GcpDy
         gmZNkYyrkUNQPpsQRZ4E9V9n0iAnY/eWuTYd2+DbJGtIW4JG9R4TATcHWzi6ouJtK7e4
         IZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179328; x=1718784128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy6VaAIWsc/uFJxkxC11R2z+NrPGPrzZFexuniHGbrY=;
        b=IlWepMXnK4PYgP99gKtzkOmECx+X6S/lVbR6zv8d+cK0Dh8qa0sRzrlFbiFaAKuwbS
         48s/I5/DbsdkG3Wm+Wm5UEVIQM7AvnrX1lrJ7RoQN0vXzHslmK5nrBx+Rw2BWwpQnFaN
         HWKoVgpHLuwDR5AZfCVdQ+e/qT/lhRUE8Ojm4z3CGJsaExOXvdCcAfu1F9EWsBTJZ4N9
         YsH+nnPitSSuHBDQk05iWdx856vKToEu7lrTlYlh5OKwXwmvvIMiXz9oMXUym3zI+78F
         BfuGxYCBuQqGA4cAPZED6coqCYkwbkfhtAKc8/goBWNyD5IOxfIz8wuJSW8TOUA/Zh3k
         UH7g==
X-Forwarded-Encrypted: i=1; AJvYcCUbkp9uT8al25Mr3IEg8dbLEI8aGX7PTOGTSh7YQw2T2ij5haq50MBxGK2ObuvdqQk87Z/vMf8sXJKaIl3qPO4AM2u4ohDpkawvs42ZLQ==
X-Gm-Message-State: AOJu0YwuyMpBuAtEjmMHo634rXW/HzsKcG3vFUXDIoDAVsSAaCmci2DZ
	TImMmwqr1G/9XA9STC3tHz71+ggqpxS0blXQjBybaI3D43zZQ8m5BwKiEW0M+5A=
X-Google-Smtp-Source: AGHT+IFDKHNqbb5jXRRVasJXbOoXoBcVXVT3XdueDls6+ffc1QNC2kyj8whnyTo7bp9zFvAdHXeXCQ==
X-Received: by 2002:ac2:58e8:0:b0:52c:7fe5:f89 with SMTP id 2adb3069b0e04-52c9a3c6b34mr739943e87.15.1718179327968;
        Wed, 12 Jun 2024 01:02:07 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c879187f0sm1435885e87.272.2024.06.12.01.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:02:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/9] drm/msm: make use of the HDMI connector infrastructure
Date: Wed, 12 Jun 2024 11:02:06 +0300
Message-ID: <171817931352.2727087.11541630600563210677.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 07 Jun 2024 16:22:57 +0300, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
> 
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/9] drm/connector: hdmi: allow disabling Audio Infoframe
      commit: 000d1940c90984a9a2af9c02bc17e3ca0d87f71d
[2/9] drm/bridge-connector: switch to using drmm allocations
      commit: c12907be57b16eed5a73f75a44ebea8f30629c85
[3/9] drm/bridge-connector: implement glue code for HDMI connector
      commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439

Best regards,
-- 
With best wishes
Dmitry


