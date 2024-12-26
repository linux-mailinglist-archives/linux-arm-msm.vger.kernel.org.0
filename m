Return-Path: <linux-arm-msm+bounces-43429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 304289FCE99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC1D1882608
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D201CC89D;
	Thu, 26 Dec 2024 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh3oeok0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC6E185E53;
	Thu, 26 Dec 2024 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252743; cv=none; b=JNiQBcR3G3AcBL5wi7TNvBAYRFX8MBOGEbjpVQkXk+AgjH8bxdBx+3p2UtEekc3xPf3r0vnAd7JhijcFJ+h+SIcnvEfHbg44otMvEabbiKkGBblSzPQ+fWy1kzAvb6KN2KIgqB0XpW1trta2ekMtfb1GWH2WV/lRgKoSvxyw5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252743; c=relaxed/simple;
	bh=4DhgLTmCOL+xdXNGJxm3n/VcEKzfEVtEWA3Mt9Op8KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M+gUO4DFtwONdCtYEh4rdRx2lXODm1iAHa9NR6Sv9+dL+ZOUXsfBLuJ/cdGNl8BW2H/5oiub4V+GvTRDoWogz2MowGPUi2zhjc+YOwiURrovDY8q3rSqMJsDqoD/9VS1hhe4l3w/A0YuiMx/Pi26LnyRSSRnr99pbSho0DPxrSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh3oeok0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D862C4CEDD;
	Thu, 26 Dec 2024 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252743;
	bh=4DhgLTmCOL+xdXNGJxm3n/VcEKzfEVtEWA3Mt9Op8KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uh3oeok03wk5NpAYERQRgCCfoCMygU8OF9PO+1SkfPjDMJ+Kg6qv054se6+bB+0XG
	 4BB3S1uBX3s4S/fwGX+TRQZNVmUOCuftFZgRm9mvmCSn7OL4BxL78jE4lBHzhH6HKs
	 qmfh2OmI9r0F2RJT0ryCOiQsYPR9IlcZAIWjoIkxx0NY8cOmUwoUooIKqolEFqAt7L
	 ybeGtprtzTgir4yZ1v4qSjS5kaI5M2aws8a0/dCRqXQrEmdgDzdTQDwqQV6vm2RKXr
	 hN8IkrCueFAr3oGelamYzNcEwAMj/qQiS29NeqMVe6u1sE761GQWmIAqzC+jdWsZ/f
	 fFCK2jbEzwJ/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
Date: Thu, 26 Dec 2024 16:38:33 -0600
Message-ID: <173525273250.1449028.5637391320962945281.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202094903.18388-1-brgl@bgdev.pl>
References: <20241202094903.18388-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Dec 2024 10:49:02 +0100, Bartosz Golaszewski wrote:
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage.
> 
> 

Applied, thanks!

[1/2] soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
      commit: a9020afe40e8752c6db905e895e9002a83255e7b
[2/2] soc: qcom: rmtfs: constify rmtfs_class
      commit: eb9fc0f32f9b4e8b7984c276c1ed6f61d39ef630

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

