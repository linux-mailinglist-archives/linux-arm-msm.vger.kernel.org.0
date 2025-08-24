Return-Path: <linux-arm-msm+bounces-70493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86CB32D0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711293B0A73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F82204598;
	Sun, 24 Aug 2025 02:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfJi0PPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0620298E;
	Sun, 24 Aug 2025 02:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004164; cv=none; b=AMGfp0XFMAjid8KBp+Bc/TVdRn2BtwMQiTxtTtnp/OASlN9jmrI17XJEmAJPUPxrNilpTb7aJZHIxKjMVDTWyW+I+9/WBlkUkrm0szIGcnd6ba/U4D2Nw+yT4vLpTztNsxc/EQUQpTKFgWmjUtwCVfS2x5FtF2Zag9+ijyF/lQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004164; c=relaxed/simple;
	bh=paoZxNbHfmn7LVGrZn+AtT4NxafaDjndYSvZBGdyEj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHIa9+kYdgpl14nRV8FIfpP31OWzJQ1Z4PBPRJ0DPHRoTC81yxAT+Xvdig5h8O6dNAeYuL8QKSSP+TVpNCYNV+qkvUWuUXyDbIDAYD4E4YWNgDdFwQXmaNZiYGJvLssXcfQgJJjtp8fnk/8RFnGLOwTUXY55VioxWCbr5yVJY5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfJi0PPK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D835AC116D0;
	Sun, 24 Aug 2025 02:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004164;
	bh=paoZxNbHfmn7LVGrZn+AtT4NxafaDjndYSvZBGdyEj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gfJi0PPKNjw+SMGiyjp2TYgiGqcyOp14pvsbTtWGlvlZrukyBjhPilzdIWJz0C4T9
	 QlGLI+N/0u2wdC6vcAvrtBhylUGDlapBVIJjRaAg8Rp9ic1v00TF23jRoZH26ILdcV
	 tWlBdQ6xQeF7XBz98N2tB4oukEaiK79J2PhkOvUWuB54WiRo7hgW+kLrMoxt/YUVuy
	 m/M2HoS0t0wmg/51BBYr9ZbZK9WLqiAYqm/3ZTg4tyPxKOgsg5PWwO8PbwRxFHD+BN
	 VpfDbXfts3WB3szrrqS+IoR+WVGT4xDOOh3p1IbslIdoI3o69cyTLEKL43aUje63AW
	 rUIAUOT5W69Mw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/4] dt-bindings: display/msm: describe MDSS unit on SC8180X platform
Date: Sat, 23 Aug 2025 21:55:36 -0500
Message-ID: <175600415267.952266.17728057778251475125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Jul 2025 19:31:52 +0300, Dmitry Baryshkov wrote:
> SC8180X is one of the last platforms which do not have DT schema for the
> display devices. Add DT schema for Mobile Display SubSystem (MDSS) and
> Display Processing Unit (DPU) and add SC8180X-compatible to the DSI
> controller schema.
> 
> While we are at it, also update DT file for SC8180X to follow best
> current practices for MDSS devicex description.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sc8180x: modernize MDSS device definition
      commit: 340e57306a4aeaaa64f294553caa25453cc4c48d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

