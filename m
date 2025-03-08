Return-Path: <linux-arm-msm+bounces-50689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8537A578AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B606C188DD31
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B5D188A3B;
	Sat,  8 Mar 2025 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdOF2JqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB7196;
	Sat,  8 Mar 2025 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412609; cv=none; b=dvxP+AwAAK7LK8Nl9Xm4hiz9XpgOVWflqZ1tMBDl6UrjDcXllj5icOsMUL+IkBSSBWK6DLsdCjf7efsqa0jy5eSwUzWGfQJWe5/F0VTKajPTJRiVhJhjJzLRFNmiyISNYb4DQ02nFP1c3g/efmmD9gU80P2jVzEdGTu0AaPpYWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412609; c=relaxed/simple;
	bh=ovZlCRfpGxU3/hjuo4CLsJ1CEQZkEYIY+jKDnqT6rSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gbF60SfM4kQwPppwxttcvZ8AHRFX1Si8JuGQ2iHT/9hiu6DJzY5bH4x2oewWNRpg16kbicA9lODvXJ8kq2G2hSSRoiT+311ULvWAO6+wzNib2/1Gzz1pcPD/2/ugdhh4vNZcZUpqqpR+mEXsGcyKKfL4ELGzr2fuyY6UlsyjfN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdOF2JqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA39FC4CEE0;
	Sat,  8 Mar 2025 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412608;
	bh=ovZlCRfpGxU3/hjuo4CLsJ1CEQZkEYIY+jKDnqT6rSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qdOF2JqAGlZ3avu+8eSjQmrorNfh5LAh3694+nIPDuUdNdmAcEqD3CtUUBz9ZS4P0
	 UaC/bPe/yBJnZKSgohUjBrYuMApX9swb/yhBsOe5IbcqFRchtfdpXWht+22aBGzCGB
	 z/m9vNlNDbIiCwoKoqTqUawawmXjxgihNbJQ0e8+f7tgvA+jpmk2yv6IX/bRo5BgQ+
	 oGgCHvmFDsComwPcm2g/bNYH1CmZXIhnpl2VZzEDOnRJhITbgfRVeJGuJwP9PYhshr
	 yXzXLQsPyBV83WIbKfJlKeiEZa/KATUISQeN4GfrEGCP3WlRka1i/0En57/Fb1W1Tl
	 EiHTT3ntKrR4Q==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v3 00/21] drm/msm: Add support for SM8750
Date: Sat,  8 Mar 2025 07:43:13 +0200
Message-Id: <174141256285.1924437.13836613214296970424.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 21 Feb 2025 16:24:10 +0100, Krzysztof Kozlowski wrote:
> Dependency / Rabased on top of
> ==============================
> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> 
> Merging
> =======
> DSI pieces here might not be ready - I got modetest writeback working,
> but DSI panel on MTP8750 still shows darkness.  Therefore we discussed
> that DPU/catalog things could be applied first.
> 
> [...]

Applied, thanks!

[01/21] dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0edf7b1f3190
[02/21] dt-bindings: display/msm: dsi-controller-main: Add missing minItems
        https://gitlab.freedesktop.org/lumag/msm/-/commit/83ee6d2ec52f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

