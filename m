Return-Path: <linux-arm-msm+bounces-37699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD439C63F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916341F226DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 22:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451F421B42F;
	Tue, 12 Nov 2024 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ps2RhRBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215AF21B426
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449014; cv=none; b=m34fK6Y7WL5DL/Dw1K/doCjetET9h1YlzAk7u2lck1NQdza109pQUgE79mjPChUWNGiQlszq2MdMwvFFG+rsjHmgIDHVimc0eZ7UWciiSaCxMC6kOk+bnjSw9g3a+7ZG73AHP/jCUh4K2a+5sBZ/J9Kzq7n5PfTatEuiWbDJjo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449014; c=relaxed/simple;
	bh=A3C4Fal//hdVi+L/UXPM2xUyPiIoEdnAm/WKnoFHevE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqWuSt1avuYcE2uKIWrvvZr4Yo02wHTkIbBVQyaaBzLBd80JCUM/PH+x7PzfCv97ALSw0hpgGLcsOih97PFe67MpYcY8CAppVMDyPqjXNcYXqkKQGM/L29Vd8/ZLNmq/6AiGlUnCA/jkGw3Ln4UanHkdY5OymMXLLLgNxq9WkiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ps2RhRBn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64363C4CED5;
	Tue, 12 Nov 2024 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731449013;
	bh=A3C4Fal//hdVi+L/UXPM2xUyPiIoEdnAm/WKnoFHevE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ps2RhRBnENAx8Th/8OvL9sjMTdwyPzXjt0O6eGKo3MyZOS/gUAl/tU8joADHc1ds3
	 Y26Dp39p03QAjcew+fPsq8RzPKL32WkuTu0x5ItM7h4q8/XMJZV4qSpbN1tktJm1uF
	 XEKbWgS6ld6DcJ8ByVIDtzM0TDxDaJ8U/mgdQrfIIxKb/HCk7HCdDUjbSRprE6Gnvl
	 AexAO0Dr6IGN3aVj5UySlAIhRSRg+GA5/QF94g8V5GdyCXDR7Oza8/Q7Fy8+mSJddT
	 NN+qpBE6gNiSfYwiUEBeTkYDKlVWCo1zAnyNszJ2I1rkUUT1n755XsWjaZCBj+wIjN
	 hU3t3fPAZ/G+A==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Remove the device_link field in qcom_ice
Date: Tue, 12 Nov 2024 16:03:27 -0600
Message-ID: <173144900028.331728.5519402412027600440.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030025046.303342-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241030025046.303342-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 30 Oct 2024 11:50:46 +0900, Joe Hattori wrote:
> The struct device_link *link field in struct qcom_ice is only used to
> store the result of a device_link_add call with the
> DL_FLAG_AUTOREMOVE_SUPPLIER flag. With this flag, the resulting value
> can only be used to check whether the link is present or not, as per the
> device_link_add description, hence this commit removes the field.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: ice: Remove the device_link field in qcom_ice
      commit: 54a8cd0f92068a3718092f68c8ae99e2078f44b6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

