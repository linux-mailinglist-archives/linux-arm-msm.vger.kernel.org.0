Return-Path: <linux-arm-msm+bounces-23740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9ED913892
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A254D1C20D4D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 07:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465B25A10B;
	Sun, 23 Jun 2024 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/4KQ8go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721003AC1F
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126858; cv=none; b=fzSxmDqVjE+NCX58AtmvRJHARY8FmAA2eU+kp+HbktxMG4zD8kipZxbESX0j+QkFge5kCO66NEjrol7a4ZWCggM+dnXBjf6Ii/5QTZ8tWVwoB8kD70aAAB9M87R9EA8RTDI1EXbIsM/3zPPGz30Y6EiKnloTU8+6D54LLVC/heA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126858; c=relaxed/simple;
	bh=BSN1FG/8g8BXDXDTjedq40cJnFrBuREudY/tMYsjNb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUuccLXhbFrDQa024q/O0PxDpwhpTng/SJ82Cpl3neckkN8OuJl5f/nS/k+n+ojlDLvcl5hcKdictger04bpCziirhSoWLSF8jwLuWUTzO4qs0HWhHHH38JjDX1E8UoExXY7AC63Ewv/sBIRb+mA2EvlYIJeRNyTJxJZEMUxjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/4KQ8go; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so45326541fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719126854; x=1719731654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bv3RmqBzxRumknsNv7kNaxp5ef1fpM+tuKvMs4Mga4c=;
        b=Z/4KQ8goXEm93IxufypX+H12V1AjAuNyrbAZyLxwtZWfH1d0AbLQgZ68jGID4VboWE
         MTUBZrQ/gry97W/8CmQUTv7VL9HHCR9CD8KfewwqHEHs4czRSMVy7VRwQNp+ejf52ASn
         ukN4VyoV/cYLdYc6F9mnYZy9TOwK2ejbgCgBvZPwWdqzdV2LzcjnWwK7L5PYcdW6cOdn
         6YE4AsiYRLPx1Z7G0bqH3XUZRVTSm4OMvsq8pUW/5HreYGDnQ5bOLZ2fQci9U8tn8fDv
         ILCI4L7I/eP5okwgJq8xC5UhbHOMgXOl131JYkpl4I3Ix0+iICa5fS7JdLsUbeztFXtO
         R0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719126854; x=1719731654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bv3RmqBzxRumknsNv7kNaxp5ef1fpM+tuKvMs4Mga4c=;
        b=elQCSl0/k++nh/x+COv/EQ6LF6LjZ4InAR4YtGdQt465ocAIRKCGhn1V3SHm1+mAQb
         2zClixpIhuLLLbKK39X17/+CmArTAGbvXOKiZ0zoYpHb5suQ/BrSnDJapSechNQI3+Uh
         RnU43rJPuf1FV0/4NmFlamjZKXwdMp4scs+iePUMuc2ge3gJLepMvNDJi+OkNGNp3zsR
         zBRgE2vrz/wtajQ9aIA8D1WQmbGYcBGO1sAajfnk4kFhc0c19mVB7gELrM0mb84Zr+Cz
         c9ErH2e4/tdboUocPOZR+BJK2/9MusdHr26mnmdjSA7iNt49HnGJ8UG1tt5NNq5OOUJ+
         Pa6A==
X-Forwarded-Encrypted: i=1; AJvYcCWjRPyyX0JS48t0F+s/6AN7na4rzI+DlV78qPozPfXa2owZtiGGzp2FQdLEKQJJLM7ubzLoduD97lsOw1mWP1jd1vu9WNCHHgjwefJd8Q==
X-Gm-Message-State: AOJu0YwMSqkIxRziYrN+Ya4+V3joPZCSEo7QkOHDBYMfnRhr6KB604VC
	KUjEnMKTKxC0qOJLgryrckVb+96CvvEbHcmXUA4dzn4I7959UJcgBlBL+KGjck4=
X-Google-Smtp-Source: AGHT+IHVCwjM8471lU/ehMDgW/YT4M/SicFwOJ1D/s5IwFxGRJ9Q7jeIscRmJofRYLPSnsakpvTTBw==
X-Received: by 2002:a2e:86cf:0:b0:2ec:5a6e:7771 with SMTP id 38308e7fff4ca-2ec5b31d1b6mr11292671fa.37.1719126854458;
        Sun, 23 Jun 2024 00:14:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 00:14:13 -0700 (PDT)
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
Subject: Re: [PATCH v5 0/9] drm/msm: make use of the HDMI connector infrastructure
Date: Sun, 23 Jun 2024 10:14:06 +0300
Message-Id: <171912674295.840248.12157846241927511158.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Applied, thanks!

[4/9] drm/msm/hdmi: switch to atomic bridge callbacks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4fd10fa0b573
[6/9] drm/msm/hdmi: make use of the drm_connector_hdmi framework
      https://gitlab.freedesktop.org/lumag/msm/-/commit/aaa38235b5fe
[7/9] drm/msm/hdmi: get rid of hdmi_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/97d6442e8f9e
[8/9] drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      https://gitlab.freedesktop.org/lumag/msm/-/commit/917921a20294
[9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf28d52a20b1

Per discussion on the mailing list, 5/9 is deferred.

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

