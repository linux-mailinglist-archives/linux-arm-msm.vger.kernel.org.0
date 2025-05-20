Return-Path: <linux-arm-msm+bounces-58564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B1ABCCE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC6C3A97AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7BF2566E7;
	Tue, 20 May 2025 02:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vG68CW3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C1255E38;
	Tue, 20 May 2025 02:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707304; cv=none; b=cVuuS2N9JgKPIjg+HZn0R3S7/sm/Vzua4TOGIWbuvqZlKXhAIwTAzvnedZ0diJPu5JoYcyuRK5Zis2Z2htbezyikcFn3zX2rKkokQkwD98kngLTihXBuUCGLRnNkr1yeKwNceTrAv7mUe9WqLhl2tVz9IIEmlJmYtC/+My968x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707304; c=relaxed/simple;
	bh=szCml1hnOq0OfaKEbkzj1dBaoX8uj5729N4ukr4/Pvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipTSUMHs7/9P6jvY7eS7ZSsmlDMeYAtT0tfOH4KFixwtyhVriTfyLoSQmnsZwV4jwKEik1RRAO1bgy7lkT0qA2fV8uuM/loXXMI7OEZq0zlr2ledUBTEtGKxw+bhJn+dbsy+KO2T4OpTpk5AY6SwyACkOJ2Vajv9RMJQs7paop8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vG68CW3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49614C4CEE4;
	Tue, 20 May 2025 02:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707303;
	bh=szCml1hnOq0OfaKEbkzj1dBaoX8uj5729N4ukr4/Pvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vG68CW3tWM2svfcA2NkGGLnTcJose1VTxQv5eROeCQsyYmaex8M4MMU0Bxxj6+23v
	 sEOvYaGhIuJETxwcnmvu5C+3UBC4csuLF7oP1CbJPApeIDXpfbiBoB0lSJ/ar3q6sd
	 n9S6kqL1CoCOOfFgIU88MMYxyK3DcE6sAMIZEGQRbcGuufb/5j8+QHW3Dv2ei0BQ+T
	 Dn1igGgVCew/O+qw3eHXe8fcydgUDiySytIf29rZGEKj222w3ilsZyXt+mQpx1uTd4
	 6hEbEmgLU/miBcF0onmx8yCmeZam+2N1iOGnKt2Qc+QhL24ZJG+3bUvX3EunaXcOea
	 z6L3mGoK0BMtQ==
From: Bjorn Andersson <andersson@kernel.org>
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
	Konrad Dybcio <konradybcio@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: (subset) [PATCH v4 00/16] drm/msm/hdmi: rework and fix the HPD even generation
Date: Mon, 19 May 2025 21:14:36 -0500
Message-ID: <174770727705.36693.2142458724007239007.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 09 Feb 2025 07:04:44 +0200, Dmitry Baryshkov wrote:
> The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
> is disconnected, in most of the cases cable reconnection will not be
> detected properly. We have been carrying the patch from [1] in our
> integration tree for ages. The time has come to fix the long-standing
> bug and implement proper HPD handling.
> 
> This series was tested on msm8996 and apq8064 boards. Previously HPD
> handling sometimes could trigger in the CRTC event handling, however I
> can no longer reproduce it now.
> 
> [...]

Applied, thanks!

[16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO
        commit: b2c547cffe2f67e18a3a276905649cc95aa7f293

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

