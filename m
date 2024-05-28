Return-Path: <linux-arm-msm+bounces-20674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCBE8D1291
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 704C21F22B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BD9168DC;
	Tue, 28 May 2024 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7zU4TmQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5014A81;
	Tue, 28 May 2024 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867161; cv=none; b=e1erAtVSMdoBKVM3wqd0BDAWqSiHsttYcrjD64ViiVlyY4st3J8hy6awtV5kSfdETKV+kCpuhII1uYdRUk1nrunnZk2D7eNG0EBCQesZXepOk9aw3bKmgiv6TiOnl8vC2mRErjI/UQwrAaAQ08CB93hC87Xzxknfnwa18btyzcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867161; c=relaxed/simple;
	bh=ITVmDH7VJaoEg2XKzY//RgBj1ab2sf6hRESd42NWe3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8iCmOg++fIEXQzcSG24OHblox/ZApNsbQLjHpT0A1PNSA2YuDfyJgEdwlx5bMWB4st7MoyXEX9X7Ecol/pW9OfoBA5GlIPQBYJjlTOv2gdp0TUxRFbCi7u5d2Q20T5MO+ELo2TfggwDp4q5QI2v2Qwsp4J78mO8BxppziJBG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7zU4TmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C555C3277B;
	Tue, 28 May 2024 03:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867160;
	bh=ITVmDH7VJaoEg2XKzY//RgBj1ab2sf6hRESd42NWe3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z7zU4TmQpwldrjEkzIUM6a807er/kTBA7VwEnu5HyPlBi6GrVl9ajxezci4ncNLDg
	 ZZKNCMB7VF2+NR25SZXZdIS4ZrZ51Ko2CADeqqVReGJ9Kdvu2mAfwDczZuYYO8+8qr
	 uFE29zAMf928OogM9b4oGsAesgvvVxhTgz27SLYLO7m1q3X4AdUKmk8gnBAqWKvB19
	 D19SFfM4LhQWBuWeGK/r98zlIxiOBCoxlzrY5PQJC3r0W/gdcpJvC9f1qcJQYIWUPB
	 r90NPxkmjsfAy6vf1OluomgY0TgKi8Lca8R5LbVhEUqTlNuEq8LvmutXW7HwITwIHe
	 5qn4yVb9wAdWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] MSM8976 MDSS/GPU/WCNSS support
Date: Mon, 27 May 2024 22:32:07 -0500
Message-ID: <171686715139.523693.1894869664497791698.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 21 Jan 2024 20:40:58 +0100, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Adam Skladowski (8):
>   arm64: dts: qcom: msm8976: Add IOMMU nodes
>   dt-bindings: dsi-controller-main: Document missing msm8976 compatible
>   dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
>   arm64: dts: qcom: msm8976: Add MDSS nodes
>   dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
>   arm64: dts: qcom: msm8976: Add Adreno GPU
>   arm64: dts: qcom: msm8976: Declare and wire SDC pins
>   arm64: dts: qcom: msm8976: Add WCNSS node
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: msm8976: Add IOMMU nodes
      commit: 418c2ffd7df9bfc25c21172bd881b78d7569fb4d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

