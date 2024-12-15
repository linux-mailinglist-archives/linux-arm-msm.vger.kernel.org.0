Return-Path: <linux-arm-msm+bounces-42269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 899639F241F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 14:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D58C7165412
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E51922F0;
	Sun, 15 Dec 2024 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGolfYKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F67191F6D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268256; cv=none; b=RMOrssHgNWc8lIdNhirBY22qj+4hquoGSWrXRFGtYbQwJD92WcCcXVqDplTGGHn985FzOFnaA9g2LHVEmpJaEAcsBDrVVDYFm4AptBhr5wT7uUqqaFbc66oXbw8cWwi8IIjV9JOXOV6e6/kjlhNTT8mXbpnsLNXiDlUQjqE+AJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268256; c=relaxed/simple;
	bh=U03dIrrAWHFMBB0BUbdkuumkA4W+flzASCUPJglUjTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXPJlIACz46AFMEdJmt9Y7weJt+mCuUq227y8d+eI42hZ3t8ZgAACgQ7ztNYUnKeQ/uKZ+FRwEDdekn763KFjDOYkJRZAHfVThO7SVYmjXMJ7eBgl1z1uDme09pI1SV7c1MhLzCq8wbiqwfbQetaIdRJ1HBMOEk4AK/tv50mFrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGolfYKd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-540218726d5so3369816e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734268253; x=1734873053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6RCpuSvue4hpoUhHcSyfcYpwTRHbw1RA0jucyvWPrY=;
        b=JGolfYKdSo8hVENDsAQNlZ0ySr0kVBgVgIKezZ3wztArdoT8Q9Vpo3PWvUi0vfdfFQ
         hDUffQCADARvxNkYft47d6gr7r4dETjE85TXC2Zn7zhGmXRqp4yr+vJI3cqjenvZtCwM
         3TIndKMZpNhL5M6uTLah0If6OvfP3QhIhfHuDTOAyHZDcbx4Ew+3inUC5cto/H6b8vuc
         CvcjfLHwEJWLabWPCVSNnLZMsQe3wOrSjgDotQ76XZj2AO7mLRIbfa1tk9LvWLb43Mtm
         L89HTQZtw7oYemRB5v22ErV3PjWj6xcesl+P3SNmyjFQODvQ3no7RSSc+h6khA1RXTRp
         Iz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734268253; x=1734873053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6RCpuSvue4hpoUhHcSyfcYpwTRHbw1RA0jucyvWPrY=;
        b=e/zgZ4iX1+K0GrM+x2y1GJtU7T/TDI2qDXKOvBiHDU+bjgfM9YfqzTw2ZNMS11mTfi
         zSSg+BuxWrijQvoUNH8h0NOpdnof0nUQiJQLQOJ/lHN1W66HRXVhaEPnmUPzoEDHQZeQ
         UDiIyL8G5037XCZQoo8xR1iBv9Qab4w8icXYPl/GjDFyBgRqPZuCs14rgUFn1dAaFwes
         Q3ZnOFYiyZRkMHoLfdsIC3LiHCgS++giq3/58rdD9sGSVip9EOfnD+FH56f6OJPtrtqz
         U8cjX5wDRvpFtD1How0RCt4BK1MWLrNFNQJGS2Ka0JART/CJ7lcTw5FMzs6AuxQngbnY
         KRPQ==
X-Gm-Message-State: AOJu0YxvEhNvaXMIU3UiMGf0poqgIfaPUfnfaelgJRGGJu/LDNwe4nSp
	iZwtqiMBITZ02SIOhzUTqkQBiL1O0o7Ify/SicYRyx+YT7Tpy35Kp91JeNgVssw=
X-Gm-Gg: ASbGncs3WaNaf0I20OD9gYByKemyMc5dMIRH0Ksw4QhwSu5/RCEmklt6WZsYmzcLZOA
	6QfA1H18WhTgNUT52qGnlC5w+BLgeYYglSc7vfimWWWgXsp6XrtvkQ9rSI10m6pXnXozrZaSUyG
	xbIcto9BtwL+gVRxbXOA4XYOXkUIRo5/L3qHZNUi8n3Awe3fQmFzIo+UFvQI605+5DkY/g4h+5B
	9XJ5ZfvfqWLUCCJg6e4E01OLX+47UUOJMIYpVwLp39YJU+g1ANZgzLbsn6+9fBI0TbaulLv
X-Google-Smtp-Source: AGHT+IFU6V2+HMrRfVLaoWmqetk6W+EYxrP0DXnFOAt11x2SZ8DShJ5hEQO+8CJ4IDumWl61VcxjJw==
X-Received: by 2002:a05:6512:308f:b0:540:1b2d:8ef3 with SMTP id 2adb3069b0e04-54099b6d7c4mr2590910e87.52.1734268252758;
        Sun, 15 Dec 2024 05:10:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 05:10:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liu Li <quic_lliu6@quicinc.com>,
	Xiangxu Yin <quic_xiangxuy@quicinc.com>,
	Fange Zhang <quic_fangez@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/9] Add display support for QCS615 platform
Date: Sun, 15 Dec 2024 15:10:42 +0200
Message-Id: <173426667308.2196979.11322859869026651489.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Dec 2024 14:53:51 +0800, Fange Zhang wrote:
> This series aims to enable display on the QCS615 platform
> 
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display/msm: Add SM6150 DSI phy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5902cd2212eb
[2/9] dt-bindings: display/msm: dsi-controller-main: Document SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e9280f124b3c
[3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/701da2861cbc
[4/9] drm/msm: mdss: Add SM6150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b8871563eb96
[5/9] drm/msm/dpu: Add SM6150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cb2f9144693b
[6/9] drm/msm/dsi: Add dsi phy support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fbf937a89ad2
[7/9] drm/msm/dsi: Add support for SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8a570c93fb67

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

