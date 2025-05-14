Return-Path: <linux-arm-msm+bounces-57990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944DAB7791
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AE8C16B680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0213A296709;
	Wed, 14 May 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6TEX1oP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71B2101AE;
	Wed, 14 May 2025 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256649; cv=none; b=MkzBIW2Ke/FehS16zkhumQQKprQDsDlArsp/CrOqOgPoDngvVr1FLNEcy+E3bxbCXwDuHFf2PKrTRKjsiiY+Nig2/ILfFTmn4PU9cqVcHmHiDIhRRQwYqLi9tr0cTR9vUabiLVXNIY0JlpteeScQXgtEuSF7Gh7MRaBymavhvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256649; c=relaxed/simple;
	bh=nBKq0fnl7GX0Xdg3KAXTnjZGOSVlR3+3JM+SvFRRZRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8z8KjiBwnIf3p1olnM9j0BR4IMlIeCVunU9iYqQADvGZNO+8JsJ/zzOgbyTomDN1VW/aZQ+VvNShjm1fkMO6qBpMO6lsar6MxD5WrIYRWSRniXlxFIfBymaqBVSfMeM3SaC5JCaGdMjXDtoRMRa+cBQ2T2rQx58v8+OtIPYVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6TEX1oP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B46C4CEED;
	Wed, 14 May 2025 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256649;
	bh=nBKq0fnl7GX0Xdg3KAXTnjZGOSVlR3+3JM+SvFRRZRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6TEX1oPBZVhaInSUt889t/j6ZeYnPaOWwM42ijIRu1qRj/1EgRC1WHbWos/7iN7d
	 W9wrBO8tLC5hJ0kbZ7sqD/mzFKOf3w8w6xr6XOCC35J3H6nb0pFQRRuxYAlZBXBgyq
	 NUKWiomaUZhk3swQWfvr+mZSf/3NPiaeBHVG69OZ0mRuKm+ofsi2OH/CybMOKYaxRn
	 gxYFKLoW+yf+ybaboqjpa7oo9wD88K4hEtAid4Ihtg8eT7eo4IIowSW1okzkvW5462
	 dQua3x9UQwR+Xi8W1uUiBGqM07T8A2bQXuiMTqTk/rk4g3rBvfrjIhvonrhpgYhCyY
	 gnfOuYOaB2dgA==
From: Bjorn Andersson <andersson@kernel.org>
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
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Wed, 14 May 2025 22:03:44 +0100
Message-ID: <174725663055.90041.6507924250877502931.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Apr 2025 12:51:50 +0300, Dmitry Baryshkov wrote:
> The LCDC controller uses pixel clock provided by the multimedia clock
> controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
> clocks properly, taking MMCC into account.
> 
> MDP4 uses custom code to handle LVDS panel. It predates handling
> EPROBE_DEFER, it tries to work when the panel device is not available,
> etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
> to follow contemporary DRM practices.
> 
> [...]

Applied, thanks!

[7/7] arm: dts: qcom: apq8064: link LVDS clocks
      commit: d8dc4889afc92bd8757fcab607b734c684fce167

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

