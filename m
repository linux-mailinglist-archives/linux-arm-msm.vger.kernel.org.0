Return-Path: <linux-arm-msm+bounces-35514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB59ABCD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76A9C2808CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F76E15666A;
	Wed, 23 Oct 2024 04:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQcBXN8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFA156646;
	Wed, 23 Oct 2024 04:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656987; cv=none; b=qyjnzcUjU/fANilq/pDoEYypznIq6ets/1YlDAqXrL0L/wq59Zu8W61pcS30vxEkUxij2yI/O6Fr9jjQIubFoHWzTZGttFQAbE1hk+U9uBsCrYDVur68YT70erWPqV3ibptr8gdcEVT2Hxz33oPfAxok17X16rREZIOpBo+pPRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656987; c=relaxed/simple;
	bh=bec6KiO+m8hW8ozeZJcuyh4/Q0ZTvqAXQGBByAauqSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mynY2GHxLQmkDYuX15LvIcQOd4OisaOARN37S1ADY75v9AdFs3gjGPe8eNYxS7rcoUhzVUsEoc3eJ0/wq11U/f+CYOGLL7+swk9ga4s0LN0PSJ4cwC4DomeWhzHQY6pQxQURJmAy1ostKUNwbOV13VEwfWCRS+E2joUFaVPSvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQcBXN8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F04C4CEE6;
	Wed, 23 Oct 2024 04:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656987;
	bh=bec6KiO+m8hW8ozeZJcuyh4/Q0ZTvqAXQGBByAauqSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQcBXN8Ezxrg4GRkhOdSv9J7cLWE3PBjVgkOOBm16GR8in5IPzsPeb4B3l4slWbCg
	 a+9iGEP4hJpnJnwBwVSAA7Lqi6ksCM5wXpFz2DnBHOocqIpDoQlPplPOuksmLF+0Or
	 KhI+1cuF7wyr5KxxEu6hrXePz1QLC2gf4yHrQQRPPzNm571EdL1uDBgK+fiG17451z
	 bFDGXGRjxk0/E+VJVsckxXc6azWlmerlg4l9RE7dpEQ1baniqLsMrszFIA7z2cf4ag
	 qjW7QET/T9mBnBglms4GlTB/BrKOzjLToIfhckyn6x9NCmG75kC8znEi4zn33XvkX9
	 dU3ykvoaxpYUA==
From: Bjorn Andersson <andersson@kernel.org>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	lee@kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for sa8775p
Date: Tue, 22 Oct 2024 23:16:03 -0500
Message-ID: <172965696405.224417.14379916194468164981.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830133908.2246139-1-quic_mojha@quicinc.com>
References: <20240830133908.2246139-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 30 Aug 2024 19:09:07 +0530, Mukesh Ojha wrote:
> Document the compatible for sa8775p SoC.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register space
      commit: 1a82fbfc87fd7627ce9499590fb381069db99e8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

