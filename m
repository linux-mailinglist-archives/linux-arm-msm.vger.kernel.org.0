Return-Path: <linux-arm-msm+bounces-19339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0364C8BE52E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351DF1C239C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 14:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139CF15F419;
	Tue,  7 May 2024 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOgX1ygQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D029F15F410;
	Tue,  7 May 2024 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090785; cv=none; b=FbcBFHMTlkqE1yterQTUuiXUlj/BT+S+Oi0sVnEQZMofsv5uZgPlNWh8FIOsO751CYGxJDrBckSV3coo5aXh6W9YcO7fTzRXuZgLhGyPS5kjxsYtnDupenGY2QxcKcZa1ROgZc9/ifIzHDCXhFcLNE9sWtR/aLWacy4MV19PXhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090785; c=relaxed/simple;
	bh=voyqdTwmLYF4yUyE3nX9Vp0+/mrFwRKM200ZW0hwH6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=It7CYhI+dpbps+8gNVMFmdfDc2ajJvlrB6RpkPsNub6Y4o5EXgF3LfRFoFhJN2f3Q0n1ZwyWht//bVXEzpvS7DrRTSzywJl0ARSUK8V7I8UhhuMUj5gDofUFofLb7C5tAxs1fXnBN6ZAnkgP/mVSDmveI1p/3VTIp9vL3fqLqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOgX1ygQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89DBC4AF63;
	Tue,  7 May 2024 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715090784;
	bh=voyqdTwmLYF4yUyE3nX9Vp0+/mrFwRKM200ZW0hwH6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOgX1ygQPSGr9CLiMWEaSb2N7zEzkiBhk8+WbOnN4IpknecSSWEMoG2G7oByf72cv
	 fCmanRzMrrGyi+d0/7WGk9dXgUHW6BuI8ZdEiqLrOASOTht/PC3zCqbe+HQJuVmUjQ
	 QFQ2QjpiCr+l8ntxjnLqFkyYc2Yh9iI0gSPjefi5aFCnnL9jnBKxTSXqDZbQ4tlcR9
	 DO8yqxJRXbqFEgRdW92Q4wcM77cRLkzcpt7J1iOKJPcfZ/1XKniLELAhvB2n08NB8w
	 OrntWKhtPmrXMvPNjTW28XXVip+pVQ36P+OkEDegDS4UPRNBqgW9vhe8RXPvJzCdbM
	 kTAKeXO2ddpkg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 0/2] Mark qcom,ipc as deprecated in two schemas
Date: Tue,  7 May 2024 07:11:21 -0700
Message-ID: <171509107954.2289022.6995839548936872732.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240425-qcom-ipc-deprecate-v1-0-a8d8034253ea@z3ntu.xyz>
References: <20240425-qcom-ipc-deprecate-v1-0-a8d8034253ea@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Apr 2024 21:14:29 +0200, Luca Weiss wrote:
> The mboxes property has been supported in those bindings since a while
> and was always meant to the replace qcom,ipc properties, so let's mark
> qcom,ipc as deprecated - and update the examples to use mboxes.
> 
> Related:
> https://lore.kernel.org/linux-arm-msm/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,smd-edge: Mark qcom,ipc as deprecated
      commit: 335617f0d502f80c9b9410c518222b2cb33878e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

