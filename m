Return-Path: <linux-arm-msm+bounces-30828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728E96CD57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FF5FB22D96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8707A14F9CF;
	Thu,  5 Sep 2024 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZLr+/88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BEC13D53F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507225; cv=none; b=hk5AbHHeonA8WzObhjdvR8lpgUEOgELyN7w3bUiltcBMkU0Ke7gZAEBNaJRdk5B3WE6Tr0N12+07AP4Xl7OhOfnVU81SLkqEvGHzlJQlTmDSLM3UR8QpH1xWn/pyJa/rjv8I8di8As9I5BPJAOLB/dYWiqbghaVJfOEjJkFjUYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507225; c=relaxed/simple;
	bh=aWdEb/+/3cwXSqTkHdFszxX0xf16ncywVxHsHgWtiH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cv9qBTPfc8h4AxbWTmmHiNdzwvyLWioPJecktExsqx0SmUgeL+/cqz/+FLrZGNokTv6+xSlszsWd0oJZj+uRYH2vKeIZQefPw6zBaVdZPJadQKp6KowqILJ7qwm7BoFGEAUPMUgbbcY5iHygNOnqCcrly2OwW8z/rHiqJ/aXZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZLr+/88; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-535be093a43so267925e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507222; x=1726112022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Va0ZWJ42TTaZ++AQ2NJxsBFRYO0sVsQwf03V+3l7Vo=;
        b=IZLr+/88txSOf88xRsFN00RvTDWDQcAQ6DPOmVMW1KuokkDh8mrk1sQjNWXDQpk/DI
         VAmlwzMwO8XuVdrVibApBaDuczyhue3OdZ8IH4dGJAJPGWDIz4YxesqgsKLjj0DUziJf
         XBtLxu5ctb5tLJG5yWk15Hgcv38aSi8T821ZcTUsJ3E7keOLTA5WHCQuPW/WuRISpzoq
         YW0nXCCp8S/LOQpRzt+7RHHSMroZD7iswf0vGij7DXRQ+xUP7bcoPNqpaQ8nYkC4URbz
         92DiIJIJ+6sZgqCbgEZDekA3DaBAF2VbGqMDzcIJAK5m84vs2s9vXx6ZHXbIhRkr54iH
         Imqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507222; x=1726112022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Va0ZWJ42TTaZ++AQ2NJxsBFRYO0sVsQwf03V+3l7Vo=;
        b=b0oLhQZlMG+vtk5naiQLJwFZW7phkMNhJIiVi5AbnFmEQKBESe3YI24wvd2ddUrfrp
         UajhL0McoCaczbpNvru8cLCkPiPgjHBbicCVJp6RfcpIvPROs2SihzBlN+0e+zlBd2Mv
         tmq0e8pmSCA5DUUHo+gG6UH3ZxE5K+BSDmHHT13Q9PN47AI7e5xNM+TMbqNQJm5P2hZR
         EefTCicE5zP490L3wMHCqNJU+gUZGMOywiNAmp9DyN612k2yFIL8VPvvBvLPbnp9HI2B
         +KpNzuaXwkKiXKPgr7H+6NLOdEGK2fEVo/Sp/9CGZcqzThEWOVy94KjrOz3wWn55gIvA
         +zSg==
X-Forwarded-Encrypted: i=1; AJvYcCXecI1iZi7c8puFtn7r7vdN9eNBVqo1aSdqwyIJ6JB/ntKQbSqG9cpN5u7+gvA97lycRo6Jci1WutGnZj7y@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdnRUqKqoCDYSUV0cgmon+DwF2wSUdPacje73vXnhceGb07Rx
	TdmP11xCzZ79zFe/ov1ewdt56v9PamT31pnq6Pu1pwMfAQAV5SRULzEC0q+nf5s=
X-Google-Smtp-Source: AGHT+IHDjWmphg9XE/ivcHouG7/jbXrLZyq9A7QTB9S6198sQLS8AtchNk0XKD/0DHxjxPSG+2f3xA==
X-Received: by 2002:a05:6512:3b23:b0:52c:b008:3db8 with SMTP id 2adb3069b0e04-53546b9405dmr11280075e87.38.1725507221597;
        Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other platforms
Date: Thu,  5 Sep 2024 06:33:35 +0300
Message-Id: <172550712136.3299484.13892510093501197412.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 03:31:59 +0300, Dmitry Baryshkov wrote:
> I was not able to test it on my own, this is a call for testing for the
> owners of these platforms. The git version of modetest now fully
> supports writeback.
> 
> Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
> connector, cat /sys/kernel/debug/dri/0/state to determine
> spare CRTC and plane, then run something like:
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: enable writeback on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/47cebb740a83
[2/4] drm/msm/dpu: enable writeback on SC8108X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1f5bcc4316b3
[3/4] drm/msm/dpu: enable writeback on SM6125
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab2b03d73a66
[4/4] drm/msm/dpu: enable writeback on SM6350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/15302579373e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

