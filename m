Return-Path: <linux-arm-msm+bounces-45982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C9A1A467
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70A547A1CDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3752C20E6F0;
	Thu, 23 Jan 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sR4j8u+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8E61CDFBC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737635826; cv=none; b=J2k+ZT7pFHaD5yWy7nPh9tX0WH5FwVMjSrsr3ComkNVLfHEHFAeBTnE5Xc3DGuixoVi6AzfpSzeVdzJiXdx/KLjcOO1wckJ83N6nM2ylD7xJb9BDZJ3DwE+NJCV+xd3hmy6aSSlfPsReRDHEuCP2aoaMG24UsAmW7GG4lU16wG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737635826; c=relaxed/simple;
	bh=tHdHTvWFCZYAXhtuy3mP/yPDwvETQ/a+b3uqBbj7cSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=se9xJonLf4apOkvCoVQUoRyULg//IkqkcXA+F8MyohnpXMF7m6qEJDhMfK7ZkJ3G6L1hlAXygED6Ztncgtlf4OU1ei7b3jqwm7QOGo2QmlIIyz/u6tSLOsWcFvu/jGW1kBMbdmHNduokRMvwwybdHG70vo5AEQzRK7ZiFFndeWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sR4j8u+G; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso720024e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737635822; x=1738240622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKdcdXEFyobe2plG7qw0BSF/MpVvCBWQ43hwb1Q0khs=;
        b=sR4j8u+G1S1tEDUCpiU0dLFRdlMHWiqjlIcxF/uKDdlIhMeQA884QZz8Ls19ceFNZg
         ix2uFSnATB8ngPr+tHcBsrrMJpF1sk/XTWQjGXLV1Jn+Ayt1k0yHi1g1rT+DUE19vbmV
         f2I0GYMbNtY3qEGG5hKwgF3/o8Y8lin43zuuDnsEG9MW4O9oPkfsAuLMTX5M3NMvD6Sk
         wDl5UZTS+3TVxuV1tPcRzUGMlCr5L09gL3BALul28NBKEkQt7LjjgBKhLMyimsKKQDUE
         u2acxGicls4vqOi/utTONsZ+SucwHvMvKB81H4FmZsi6CgmdkYIWqqPAHJ7SFOCwQhBP
         EaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737635822; x=1738240622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKdcdXEFyobe2plG7qw0BSF/MpVvCBWQ43hwb1Q0khs=;
        b=G27Z/FSj8HTHObn+JFVKov4ewTTQAxHj+aoFeUu7anCBweASsUQ/0gIdY+O0CPJ8Iq
         PPQBzEP45RThPMvUCOErWcL7gWorv/fITc7bMHQ/jnT4vA2FN9cLPhRr5vo//06jXDlj
         oez15eaC5vtnd+6f5PcZqAdDZqvX9Ytxbqf7XDTVcewkNe1Nnq2uqLVh+Hf9ALiPodnM
         sUuMIzBTIiKfWiVtutympi+5vvon2fHkOqbj7jpO7SLBI3dqrdYRfKc8mxvIwl512ENi
         Gd2PH/9xEhlViYboG/QeZs8xDykIaFN/+Wy7LVeVY4yrCnNt49wtgRguvysCDDWjMa2d
         53iA==
X-Forwarded-Encrypted: i=1; AJvYcCWxQ7Jcl+3G1EZglBpwUl1fdDAZiZGyRsasKPjWdVHyH6fQ4AaFoZwM8emYx7EW9j11DL2/Rxkms+EPzviB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wh8Rbh7Sw+rASyPgG+PyfsK4mR3pHQkMrh9DO0QW79RJQGTm
	v/64xdCdLJA/2yxPKJ+GntQhyHW1fgNS9ApzODJboBefNWinp9khuYwcb3jrS34=
X-Gm-Gg: ASbGncvA+fGQYioaejH1aH53xdoSxdCttKY0NKWgrKx2Lj/9m46NdX6L0Hy5MUKEjNT
	WkcDdS+1qcUsvBHkP1t5bK4pcVIYuT8vXHbhJkRBk4ldQJLdhfcSFzDWyFORipda+Yspoq4HmYV
	dfSl0hH42+HAdglzGwdmeH+CI/PX4KGNg8kLAspji2WOpRiWYgy2+LA9FOAWGzCOjosL1KerIvF
	Olv9qvOJrPtsZCwa1qwhFVxwXvEkF15G/H/VhGx+9pvWqIhjoI9i+17dSVnf8wZQ7ZmKrdU00cP
	07GJkpFHF/c61JXrUZ2m/ldt+/dSJ6xzMNtBRd3FVPvr6zYS
X-Google-Smtp-Source: AGHT+IGBYgoKjVLGqk4nQ0TpNNIeuOwqMR2fmDd5qqw23X6jFlAaj4AT2fiFDZRl/Io8WQubg4H1SA==
X-Received: by 2002:ac2:54b1:0:b0:543:9b35:5ac7 with SMTP id 2adb3069b0e04-5439c22a87dmr7367906e87.4.1737635822226;
        Thu, 23 Jan 2025 04:37:02 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07437sm2644853e87.25.2025.01.23.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:37:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: (subset) [PATCH 0/6] drm: enforce rules for drm_atomic_helper_check_modeset()
Date: Thu, 23 Jan 2025 14:36:59 +0200
Message-ID: <173763573257.2683606.1940279042120421914.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 22 Dec 2024 07:00:40 +0200, Dmitry Baryshkov wrote:
> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> drm_atomic_helper_check() require the former function is rerun if the
> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> drivers which failed to follow this requirement.
> 
> As suggested by Simona, implement generic code to verify that the
> drivers abide to those requirement and rework MSM driver to follow that
> restrictions.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/atomic-helper: document drm_atomic_helper_check() restrictions
      commit: 0936f0e54426177b0f0263ddf806ed5e13487db6

Best regards,
-- 
With best wishes
Dmitry


