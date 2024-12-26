Return-Path: <linux-arm-msm+bounces-43406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD79FCCEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF752162E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49B81DE89C;
	Thu, 26 Dec 2024 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StEQnUgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FE21DE894;
	Thu, 26 Dec 2024 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237663; cv=none; b=T0YwdMFFt9nGLMfpcTpo8ZbWqqDRFR82VgRmT0seHlJf1xq01ZkNwkYyOXb4QpfcSTAMb7aiHOcPiw1OmQO/cipC3RvQiIDfv6CGYkFST5ev+i37da4vL2h+Pih21NtU4jOrFYbK6cCZmcjBtOQHGRv7a4nTETNzkju/wq4ni2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237663; c=relaxed/simple;
	bh=XbaRIBXX++53EAV7f6o+5Fne6MfcHGo8kE9yf4TNueI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zfndk5DcRtJVhF5NO38nhTUPPb+uK5dD4m6RHjvcp2/ZoKMxj3QUTQimIy3wiqlUpCYtfJ61xvoORvLHiLSL8+mGZFqoX31F/HpvArfDIxXcd5yBF8H4QRElWX8pK4QOvp370wfBFxArJK4TXnV78VS9HiDH3WISF8d46Gny4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StEQnUgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4C2C4CEDC;
	Thu, 26 Dec 2024 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237663;
	bh=XbaRIBXX++53EAV7f6o+5Fne6MfcHGo8kE9yf4TNueI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StEQnUgino6gZh6rLPilzSzHvuAp5spDH7WTX1Kmn3QBLrOXJyv4HGAHaK4eOf2Hj
	 XqCbZ6oW9bBaThNBEx1CBF3ObJvZgYFGXCm3DQ1TBtSrwxX2cnUSu5ije4Ng6eA4TD
	 FHs2JDCqNQpUi3UHZ6i0wOx2S1AREhYJNxjgYQ/mTjgPxmNgVcod7L7+IBMLY7hSBT
	 eiKer5fgMoEVlj8bEkpALEkr1EYWmBYoYMWxalqzOfMvh0nktLYDuI2a4ksnYdZMSp
	 Cvqmo76Km6/2bk6QEIbkZUKnv7e9cvv/zWgeypbPGmEytHXtdjCJ9W4XkNU2t2cFOU
	 PAEKFE61AlV4g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_lsrao@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add CPUs to psci power domain
Date: Thu, 26 Dec 2024 12:26:59 -0600
Message-ID: <173523761390.1412574.7439187543307746572.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com>
References: <20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 16:31:51 +0530, Maulik Shah wrote:
> Commit 4f79d0deae37 ("arm64: dts: qcom: sa8775p: add CPU idle states")
> already added cpu and cluster idle-states but have not added CPU devices
> to psci power domain without which idle states do not get detected.
> 
> Add CPUs to psci power domain.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Add CPUs to psci power domain
      commit: 736f50489e08ba7329a9e828c35a2358968dacf0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

