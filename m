Return-Path: <linux-arm-msm+bounces-51959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C28A6902C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 951071899DBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDDB1D5CF9;
	Wed, 19 Mar 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5iwi2Oq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523EA1D5CD1;
	Wed, 19 Mar 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393952; cv=none; b=Da/I125uJ/5vGPTd2yi6C8AG94eKkwQ4ERj49HZhOwLmOYaC5E3GTca+nvYb163VrfKqyK5+hlT1l6NYLxzG1g0f+hKHUosOZF+pKPnbgr8721mkgwNcbofgsNfwCCqhKWO83cEmpVq9KE1ikvB3qJr4iFAGy6kd3fXjErqpxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393952; c=relaxed/simple;
	bh=9ApM2Yr8qFcdHesbkDhT7WqN3ZLUjNfLaL0DDOHFqo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0Ev6z1eSPM3zIMXH2CpdCBZds+P36OiE2Ri2965i913r6LtuIvMvXgU7F9Q8ciONoc6m8hU5Uqo8U9HyY4+M7w0Bg8y+W4nv6ytSVdohrmQWLQVwOV27kaNahZVIPBNlHyw/NujkpGaqFMd6r3/jfL0HcbuZCfiN6FHE4yO2wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5iwi2Oq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33884C4CEE4;
	Wed, 19 Mar 2025 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393951;
	bh=9ApM2Yr8qFcdHesbkDhT7WqN3ZLUjNfLaL0DDOHFqo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H5iwi2OqONoPlsDTIcFW1OC2i4YYHy4xn6Qgg6U1RTQeaeR8d50ntRfwQD6GmXWMx
	 Kk9+trbXHFshZXeeNLPertcklC/nJxwfaWGdLxuP5zeRDTx8lPu1xuiBYZuCeZ6VSL
	 leJWDwfzJZhg2/bWD4aHrrEueiNLhO5iZZpBia/3DWtFYURiWVy6fMhH9J06HVkK51
	 ozo/rzwkrb5fp/xIdkvIrwSNuEmlF02xHAeLpusjKYEFnejn07uRmz22sBDlUbtB6H
	 WbLxEblsI+YknKb/nmM46/brPUZGeTd2wzmxhi58S42SbFg1bQC73excr2y0t8Zfu2
	 WW8jGuIiSu9/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable USB retimer and redriver
Date: Wed, 19 Mar 2025 09:19:08 -0500
Message-ID: <174239394606.2278051.11144638961266854595.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318-xelite-retimer-redriver-v1-1-b3e85a37d294@oss.qualcomm.com>
References: <20250318-xelite-retimer-redriver-v1-1-b3e85a37d294@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 22:11:37 -0500, Bjorn Andersson wrote:
> Several boards based on the Qualcomm X Elite platform uses the NXP
> PTN3222 USB redriver and the Parade PS883x USB Type-C retimer. Without
> these USB, and in some cases display, doesn't probe successfully, so
> enable them.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable USB retimer and redriver
      commit: dd20903cc09ac40e71096370a9564e6523e87c22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

