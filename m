Return-Path: <linux-arm-msm+bounces-80179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FBC2EE3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7FB3A980E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A72123B62C;
	Tue,  4 Nov 2025 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHCHWg78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC623ABBB;
	Tue,  4 Nov 2025 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221289; cv=none; b=iWxn+M+dxA/uuxezHaU0ABdRdu9FRd69DL6qULJ4p2ePZZqD3OpXr9YuDrLCvo33Mu3FJAUQyLbhhSiDspvp8onGe8lQpa2hBCoCY1QpWpxLVQ041agejqw5b3PpBIpb8olGoMtH09Gwq3J3N2COMUYfJ1oPYaTzt1EVONdY7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221289; c=relaxed/simple;
	bh=EFH8iZ/G2w8bUIhBezkXWpFBQbj4f9VLSoXOG3u/BPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2yqhBBWtGLVi3qagDnIo3GFJPcHdMsU6wG0k5WiGCru/ZJqNzsm53rwjga1LERGo4kIOQQxAkhV0OrFCCOk05ecvK0L3XPPjkuSznhmV0mxApkhveRtuBIQEcZMUdo/92A+mhQ0QLJGqZ/t8Ccb4JXGEMzFwiGeLocMqRY2tMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHCHWg78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7B7C4CEE7;
	Tue,  4 Nov 2025 01:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762221288;
	bh=EFH8iZ/G2w8bUIhBezkXWpFBQbj4f9VLSoXOG3u/BPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHCHWg78fFwg10Ibsbz8T+L3pQu8RwbXz52JXBPvCCG5gqqGsuvts3lAfPlIAW3yh
	 aADcxh+Ts2vEgQ1Qx1JEI40p4YjPHE55SXTd7sMdS2GuRltqyW0cLWvzkn4yPnPE8y
	 BI3mPT6fr5vUOreFJAFMGBli0WUodN+Vz23+isDdpGD4r7SNUzcTWy+8zw3WVigQS8
	 tGbw7afmeif/reBzT09R5e+a/r4x/hZfapiOgIVb55mXvgctbYwq9DVC2hZC34tVo3
	 zivWg5uc4H0HFmVBNohGUtTKRoqlqQN99/3kknto6nQlC8wxRoJqxLGv/6YTyiOjTX
	 Q+drWpv0D8+YQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] (subset) Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC with AMS641RW panel)
Date: Mon,  3 Nov 2025 19:58:14 -0600
Message-ID: <176222149546.1132260.16054473586834002338.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
References: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Nov 2025 12:45:49 +0100, David Heidelberg wrote:
> This patchset enables the display on the OnePlus 6T smartphone.
> 
> (subset) Patches document the panel, pinctrls, and GPIOs.
> 
> Since the display node is shared between the OnePlus 6 and 6T,
> the following warning appears:
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm845-oneplus: Update compatbible and add DDIC supplies
      commit: 69b8bbde238a1503ac45998a911ea56ddb7610cf
[2/4] arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      commit: 6c55c3c261ed7c17fa7823daf4d8f716504ad46e
[3/4] arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl
      commit: 8dda2fecf76b6c4db5f4c1b81a765b73a7a878ed
[4/4] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
      commit: a3da84c36b1a6b80814b5a72ca1546648aba9e75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

