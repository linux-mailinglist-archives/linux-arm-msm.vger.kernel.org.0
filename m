Return-Path: <linux-arm-msm+bounces-36637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E22569B86F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 994131F22807
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 23:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FF61E885F;
	Thu, 31 Oct 2024 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/NYc58F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591D1E2829
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730416679; cv=none; b=HiTifDSAEQfL1lnxvfdLRJ29wAX0aww+CuiYHEzPg3U8LON4rXFOjXnSS8YFEBZcbNDfTWqNlECMlJ5y7k9FvBAu5vwhWxz/mCvQNbQllGVvk3D3tVjC5X3xRMwONw18hsPyHaY34hXjUcrnQy+raybqyzw7f+cD6B5WYCPakpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730416679; c=relaxed/simple;
	bh=ERs2v0Kb7VmMC3UlqBeHps9Wp4dnSwv9XPM7aasFPRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPVh6u5fvuUCp8VmYB+iYLTdLEBfqLOkM/Ed1INwfEP3TmmCIpYLGpbWctpqfFRER30PmrF6t7JoD1kY8BBKDhMK5eoiXh4qK32xF/bms+LrjgAP4PoRMKER2HfDGV4CVwY7nY9pUhsto0zdFsAmiUP1Fr+oTgaEDqXZa/wLMCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i/NYc58F; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso13425131fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 16:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730416672; x=1731021472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QukKNK+swCpoqF+HL/k+UqRGIlVJDx2v2LMxJfV7rAA=;
        b=i/NYc58FQblK2/RxRtVl5Zy4eVbpj/lhwtJrJMclAo2+mR4By05aF0EZS1CmkynUQq
         x75kbNP3O3hrMeKyXEqBRsBiFhE1sAOiCQ/fTyqAom4Sy8GNvdXvi3tqATBzZ2RI3Fce
         NVoF/TnViv2HntpS5hF5K9VDVP911Qbsyn7ejt6BtEZElOtsO84ICbkD+Cx1uAxntRBM
         PTHRRveZcf5/nfEwpbWvRcYulzy8uX48PAJgFNSuYbfZjXzkX94dxJXjdXuuAMPX/C0U
         E9H3yhO1iJlBh+rY2d3xzxPOhRHDAKdDJlkcx0g6CfuZVh9uQKN3C8ioW6ssl/fdNr9t
         imgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730416672; x=1731021472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QukKNK+swCpoqF+HL/k+UqRGIlVJDx2v2LMxJfV7rAA=;
        b=LmzlBC9dB0UByJs/3+mPyPJMfxQ4yEKpwn+6qq4VepoPLpFX/krFVljkjmWRJaaUAc
         sNHbad8/DNKJmKday9TaXMXc8u8edC6eSOy233HeQrZuB6d7GymLpoVMuxWRewtzMIqY
         dp+SW4UWXss7Cv5h8Tl1xY/GooDJV/kAIC3GKra8YeBrJjoZY/zDDEsWHIL0ICx4yR0E
         Ou7cbJNTsA6vROFNX9J+lc/iNN78ngQNuJjvYJc/3JJsQltjec7JWUmoKE2OZlH24qn6
         wT6arwRVsAeLDiTJVfxUJ7FxWYVwST4oegk++rxY54YWDZTCHCAVH6BZ8gCUHFaTHthY
         U+2w==
X-Gm-Message-State: AOJu0YxYEtqSZSDXDn+dDk9Alh6A0OjxSi1fdWJaJ/sS7v4/slmuwnQl
	bPDHI5Jbc+1f6l4Sduqsukk9pjpViC3rDYvBml4V+/Xq27iO1pwcvXowJpgXzKk9T+b0cJ2lq4w
	U
X-Google-Smtp-Source: AGHT+IGY+bXC9GKLBWpNC3xXaDr+4+ypv19ingMJcsVR+qr1WR4TEu2fAF7irBNg2lVAiRV/ZDvuzQ==
X-Received: by 2002:a2e:bd08:0:b0:2fa:cf5b:1e8e with SMTP id 38308e7fff4ca-2fedb758b32mr8745941fa.2.1730416671740;
        Thu, 31 Oct 2024 16:17:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef617ad0sm3536041fa.67.2024.10.31.16.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 16:17:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_kalyant@quicinc.com,
	Gax-c <zichenxie0106@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
Date: Fri,  1 Nov 2024 01:17:43 +0200
Message-Id: <173041664077.3797608.9275029444644452074.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029194209.23684-1-zichenxie0106@gmail.com>
References: <20241029194209.23684-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Oct 2024 14:42:10 -0500, Gax-c wrote:
> There may be a potential integer overflow issue in
> _dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
> mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
> a smaller data type. The result of the calculation will be limited to
> "int" in this case without correct casting. In screen with high
> resolution and high refresh rate, integer overflow may happen.
> So, we recommend adding an extra cast to prevent potential
> integer overflow.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/20c7b42d9dbd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

