Return-Path: <linux-arm-msm+bounces-36807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220099B9BD0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 02:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D6B2829FE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 01:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026EA3B1A1;
	Sat,  2 Nov 2024 01:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KIlhzROy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0B1B960
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730509698; cv=none; b=n5W4Wy3peleq1dYRUfzTdFOMmNauKclhmFMKMC95NeKsAc5x9mUgMnsXXRxE9s4tkeNvGq8zVU6kU4ERawYCCEtP83zcfgnDQRNzFWWOLuUAODO9V1csuPS/p7njU1ylYUvgs3prqKIytNhuS9yMr3VgqIf+0a4EpNiQ6TtPFwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730509698; c=relaxed/simple;
	bh=F6ymcuXC32jN2HYeBzTyvgez8PwGDNSbJuLLYYtxoA4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y8SeD9PWikrhmdyRDTUV77f/MQF/fAD8alI5e2Q+JnQ0f8x+fI1fJptrho0ipJ0qsE0ngt0qgD0SAca8Aj4ss73jstUj3LY53IMGMcf6O74j59G8xxYAqowbj0lMI9CAvCGc0vEGXYeFXPPZfjRJczsxmH3meazFSHngaxeujss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KIlhzROy; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f7606199so287659e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730509695; x=1731114495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ73LcOfKQHGeSfhVnzEL1HHx0W3Qb8KYGmPSTFzc30=;
        b=KIlhzROyKmrnj/Z73veLgIYe1uNEgzXJDVghIOvVJOtLbEfxkcN3yjo7FEyc4fQvyA
         Wcg7mPo+8avZyMY1gvh2l10T+XWe6N41KBKwtt+WWTod+59FAQ0BWSpMGgJl9ksYfFqx
         tCP0ZUNAFlUty1AZCIgZUVS7Bv51eqXG0sVtY3QeHvaMnJ3hvEAWddeIY2HBCus4Onqk
         R7lyPw8ah2kftW5u5GFwZUPM252XxCO4jfqZpxsW8ex6o9ptruvSp/0TLLlyT9A/cQa+
         xO9ORTEwzfB5Qmmy6TlOmLJqW7F2WGGcZwd6osoxD5IojVNL7s6mjsydnOqTuvayFzVF
         quhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730509695; x=1731114495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ73LcOfKQHGeSfhVnzEL1HHx0W3Qb8KYGmPSTFzc30=;
        b=RlxUB7be+IG0+Lx6VO3KbHZdheN/yakhptEZOBgxYq/OurswggAR3L7gzWY+dSnV6h
         SnFMW2AYSTj3AWHrH/o6MGKTm5UeLvB9Te9QMu16oKt9nnNklNv60a7c/TK1pkiQI9Zd
         3E4s/NUB+OMyvIbsuZJ4guiI/gynp2MhqGApOKPyDJOUTXjMqtF1Ojk9xg+SF4wrvkpV
         zJKg83wRi6zLIHZZCEugzE+EoJlr09gHS+EDBlhQZa9sXr7FWgV33rBZly+FHPoH6KYA
         4wTaUR2JnPCuPtjiWsV43L6EZWIYI97umce2O/z+j/f+OrrfYcx3zUcwZq0KOq0qjppV
         XVTA==
X-Gm-Message-State: AOJu0YzSTrtxd60KJiTRwi857HlQtbr3NW5BKV/u1nDjeZ2NPHXGqUpW
	ammTinhldk+a53onG2GbGXJ1tq/Nbp+UyT2PzHrecMvudMvsxFbf5FdY/lWj1FU=
X-Google-Smtp-Source: AGHT+IHgtubYy+4UJyb+Qi1jP+QjT2/Oa51KR/0SwdWfoTIIE/48Rgn4AUpWinMbyqlRwrE/EnDG7w==
X-Received: by 2002:a19:7404:0:b0:53d:6b77:4fc6 with SMTP id 2adb3069b0e04-53d6b775575mr59549e87.43.1730509695326;
        Fri, 01 Nov 2024 18:08:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce6b5sm718678e87.122.2024.11.01.18.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 18:08:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/9] drm/msm/dpu: support virtual wide planes
Date: Sat,  2 Nov 2024 03:08:10 +0200
Message-Id: <173050960724.2285086.13738775113532570270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Oct 2024 03:20:07 +0300, Dmitry Baryshkov wrote:
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
> 
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
> 
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
> 
> [...]

Applied, thanks!

After additional consideration, apply only basic patches, leaving the virtual
planes enablement into the 6.14 material in order to be able to get more
testing for those patches.

[1/9] drm/msm/dpu: use drm_rect_fp_to_int()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/50024444c44c
[2/9] drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/31f7148fd370
[3/9] drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b96ca23fdd03
[4/9] drm/msm/dpu: move scaling limitations out of the hw_catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8f15005783b8
[5/9] drm/msm/dpu: split dpu_plane_atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dbbf57dfd04e
[6/9] drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab52d2717ac0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

