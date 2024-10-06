Return-Path: <linux-arm-msm+bounces-33205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F143991BE4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CDC1F22270
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 01:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DB115D5C1;
	Sun,  6 Oct 2024 01:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANAu7fCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40DC171E7C;
	Sun,  6 Oct 2024 01:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728179748; cv=none; b=S4PHFAEefz0hTPKlWRH5F7sJAfsaeic4LuYhmw/bGxNdZkBdZ2o7w0xs0ElLZ0qi1zdgY2ZupyJztVSPKml8T5Ae3Y/sErC9pgTpGAN5ea5ULV3Mw5lYKy1y3xus9Q7kYDFGyjNuNah73hrxK4JgYnuUZiqfKwonP9ZnL7GipiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728179748; c=relaxed/simple;
	bh=rC+M5Q4mJ52FdeEm7n0DqxEJm1JtZU9xFaRkElGY0cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHRG2b31dyvYGEHMjel1bH+kVQQm15GBq+Pjg+rzKIqD/VlcCCfyNCtMvRItm8/9ZjDiOYvei0DQOCONzaUqxzC6M8xFRLeuZf6S1LwCw2zSoufPutphwaDkjp/5dN5n+9zl+uQ3xxK5a8ZxqYL3pe5KjSu9smWinOn6HFKQrC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANAu7fCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C38EC4CEC2;
	Sun,  6 Oct 2024 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179748;
	bh=rC+M5Q4mJ52FdeEm7n0DqxEJm1JtZU9xFaRkElGY0cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANAu7fCFnOLld8npK91JMiF0SSNILGzX7Zxq3t17I20gMXHlfLIAhNINRBVvQ+MFh
	 wLrNy6x7BrJNiI0rDjIRCpBXFGLNJ+ZGLkE5gEKh7CSZd7NjXbkUOk4z34uP+DH4hR
	 aIKX0fAbD2476S++uZJvu/P3+YutJuBIqWYihXM+tsAjjdBjNqc31cvaas2hZ8cY5l
	 yMH+ywiAd5e6YRLZUDWyQf8MQX40fK3D9IvPcdpVlPMej83wmuQT/V3ayrRZWmyzoo
	 T/xp1m3R6zLBTXdN+5tk8kvKHVzjHjoRMNFoY/P/dfJu72jb5EVvVmnWWhSgrxfSXo
	 N759TeFLHt1pA==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v7 0/6] HDMI TX support in msm8998
Date: Sat,  5 Oct 2024 20:55:37 -0500
Message-ID: <172817973327.398361.7245928166448591196.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Jul 2024 17:01:33 +0200, Marc Gonzalez wrote:
> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 

Applied, thanks!

[5/6] arm64: dts: qcom: msm8998: add HDMI GPIOs
      commit: 1b97f00d1b11ed6e349816ba7e60fa76e477fcbb
[6/6] arm64: dts: qcom: add HDMI nodes for msm8998
      commit: 2150c87db80cf7eed3939f32cbb18393055c58ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

