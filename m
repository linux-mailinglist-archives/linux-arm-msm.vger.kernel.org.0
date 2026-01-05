Return-Path: <linux-arm-msm+bounces-87549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF936CF559A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A7F311E7FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB202345CDE;
	Mon,  5 Jan 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srvTsG/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED58345CD9;
	Mon,  5 Jan 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640604; cv=none; b=kf52+uqg3NOedFTz+emzyuqqU1gbJIs24KpDu0Bt6fNRsoywc+833Xn5NFlJgXvI8CZhM9xJaCEBCc9Jy8S0e5ThbREHhVlabqjrzSiQzsWUorh2rjfefwExHTT1X0+D6tnKPPWKdCeugArVPgK5TTVwpYIkjgBSLKiBa9oBEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640604; c=relaxed/simple;
	bh=PrjmIebn6x7x+kTJN8YuN3S+cBkcKFEhmP6QFXPNwrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6U44EGaPV3c/CaWO/qjk5hBU8JHhX4uP7lzG2z5ZnWPBGJ6xw1DOzAaLB3JCGlxAMJONBy2zqjM22Sf0166fXC4FhEcV36m7bgEH2ezWvJmtozr38eLcv4k0mNOqsHOG/PNv8FBCk0D+Cd1TlHzkqPxvacpmrw9sddHDG9pDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srvTsG/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D88AC19422;
	Mon,  5 Jan 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640604;
	bh=PrjmIebn6x7x+kTJN8YuN3S+cBkcKFEhmP6QFXPNwrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=srvTsG/2mc2jvYZsk7CuXBhVaf2sA5s1ORQ7Qo/9DRTTQhzx3PhTCnmbvmyfn4UcM
	 yHyOdWXiyvvzuEmHv6lBz5A8XkC+e3hxH6ad6Y/7l3TfqV4vCgpoyy7YWw+wjYq1kX
	 kh/phfloUSk6fSWogO9VBgK1dhabJvLIdpF/7zdAhkLB+px1SD18jEPKIyz3QnpK0D
	 n50PPFqR0u//0UbWVl0iJeEtCNqr7dxmL+X0ALlwPjT+Ny+n7BvmuvTcfQQDHmjkNj
	 CiMHXnlvxUVG2UoLks/Aolov/U3cMnuMe5fBs/KTa8tQ98tPC1z9iakztj7mJsEcaE
	 GcdJVGemCO0Mw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Add eusb2 repeater squelch detect parameter override
Date: Mon,  5 Jan 2026 13:16:23 -0600
Message-ID: <176764058409.2961867.1947297193392128715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Dec 2025 23:01:05 +0530, Krishna Kurapati wrote:
> Add support for eusb2 repeater squelch detect parameter override via DT.
> 
> Squelch detect parameter adjusts the voltage level for the threshold used
> to detect valid high-speed data.
> 
> Changes in v3:
> - Moved status property to end of repeater node.
> - Updated commit text as per comments received in bindings patch.
> - Retained Krzysztof and Abel RB tags (since its upating commit text adding
>   information in bindings code and moving status property in dt code)
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters
      commit: 09d87fdd83894bf3df4ecb79296d03c7a1ac24c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

