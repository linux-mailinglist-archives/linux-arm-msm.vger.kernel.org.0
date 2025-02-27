Return-Path: <linux-arm-msm+bounces-49623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB0A474C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7F4188F610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5096222D4D2;
	Thu, 27 Feb 2025 04:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgZEgt/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF622CBD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631076; cv=none; b=Iozxxic6ZZJgImXuxuzryzu+6cQ2l/+mnzXSj/y2Wwq1E5uYK79wLQS6KkyhG+cL7yFkfwIW1ny18Rs7hH3PfObABUkeT/aZ6Se0VeDJDWc1xqE4P4cjDyKzbvwQb9cgKZTeJKbxWvqnRRKerDz0nObBCMNLYODNT1xA0k7Fw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631076; c=relaxed/simple;
	bh=QRZLpSNEAnOL32FL8Ctxebt8/NOfyWU/ufQwSk6Z5Zc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKx2cAok9lLH3pCom4YVnz1BP0bsfjkoPbyICE3SvdvkrlTQ6KDABK1iEisuBkJ7y6PCAtdIWHy2wV0OzJ1Opd9p4SAp3y/SdpiAjkxS6BxhNbeFC8fYh4Oh0L9DMj1Dk10+q69u0SIMXObK+8b2K9bv/LxoVoUlb/1fxy68AoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgZEgt/J; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5461f2ca386so416139e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631073; x=1741235873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQXAVAgDJ6BKpu5knilW0G0eInEdBbGOYFBZny+389w=;
        b=qgZEgt/J2Awrp4I+uZ4PUSUrJDpYGkW6rmmmtZUrmSK7Ba7ZBCpwNM3cdEGQw75Af0
         kl+MXYh3F9F5J9CGO26jpxCqiG3IkOF8kfgBbX+D9kiYvOU734KgeC5UPT17M0YaijaH
         D/fsp9EczZwuJKMQdqaoSscwV/ClDfTMrFKyg5pmRerfVrFzKh4RPeNFzJ2w4m2AP/bQ
         0bNND+eJhuyRrQBDSw68tG76Q6iSVnXe//gq8+RKX7wrrrM7JQz9NZe4Xj/K7KJV8zqX
         TRpZjw7g7/gu36wWmU51K5uyfb9eWv9cS1KFYWEORN7JzsXYGrFIdy6SksLDmnp36m+m
         W9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631073; x=1741235873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQXAVAgDJ6BKpu5knilW0G0eInEdBbGOYFBZny+389w=;
        b=mErxOdM/mSGeerGbt+pkzizCAks9Uvl9Ce+M9NjJS73iE3SOsgtcPz052tJkFeqFtN
         P1ao0iWW+HV65CEIJnz4FAlJWeXFSHWR2bCp6Q3Z2HYQ/QRGUJQSG9vOaECDEDr/R1p3
         UBnzGLLrEJiwmcc2UP5YVrlj7lJioOn9/JnD+cLCf3zn0phPJkLb53G3iEMFT6PPW3bk
         +GkzrCwZxlG8RWdWQhNCDye0RRokv1oVSrNXoG3FeldHaqUboL1jOHyw7Wdhq/95S145
         UarkSYx09LJVNDVbD6kPryB6Qk7KMJ+/d35oGHJJzxceRFJMcymZvnxYVqSLiPgReW7T
         K+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXKd9XQDkXdhcCTKxtVl0a2wozc3UXClV+DYCEF7S9RpPzgiomPEYfn7X0Pn1PRfIB7UCqKG4tRTXfAhsPH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19qaT7jJbOmmyB7xLtJNu/sR8lP7aHbZ9pYiSHwOMECYp9ySo
	/V2k3ZG5L9l8HeISCJSA3hap0Z/bUvIcaqw+aOcwx53jPUJkhisABeDF5YI81RY=
X-Gm-Gg: ASbGncv+ZyWjakad+CTjbhVpv/8tx3KRwpzvznLUnpOQgTemzL99BAwc5/Go1iObp8H
	IMTVr1GMmOa+nBVzlAdaHphHTSoUx0+tEVfyyeUIKDLVhDh8QJcu7NEXhAWjzweUZdt3q+Ctk6O
	+bTMvSy1UtoUFzdKfpF56BZJcENrX7s5z0WzVR8ax2k0wPp1ijE/KDqQr0VucCWaLdhZ2e2G+kz
	dxyQG5yh0rSyVsV4vsgBGbIBivTCpYF9uRxnl9iOTY0WqN8PH85R+oSYFNfO+kAXqqrVjmTGhUQ
	OtKMqtggn/zfXvLDWrDaQW/Tqsite3RRY82UdYJLWA==
X-Google-Smtp-Source: AGHT+IE/BaugbmI5byqUClykJvO63QUq6xSxLwwkVKoSd9babs5cKTzcwdFko7WC+SL5Xw2OEWmMdQ==
X-Received: by 2002:a05:6512:31c9:b0:545:981:1bc4 with SMTP id 2adb3069b0e04-548392598d7mr10071939e87.38.1740631072721;
        Wed, 26 Feb 2025 20:37:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct register
Date: Thu, 27 Feb 2025 06:37:28 +0200
Message-Id: <174063096232.3733075.4572201293177555361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
References: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jan 2025 12:55:04 +0100, Krzysztof Kozlowski wrote:
> Since SM8250 all downstream sources program clock inverters in
> PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
> reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
> 4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi/phy: Program clock inverters in correct register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/baf490728777

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

