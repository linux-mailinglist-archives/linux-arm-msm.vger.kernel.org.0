Return-Path: <linux-arm-msm+bounces-79065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A92C11D9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E30B40336C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8D734C821;
	Mon, 27 Oct 2025 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV72hefN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42134C155;
	Mon, 27 Oct 2025 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604533; cv=none; b=lML0EiHsg22rMpCck8vgBMelMA69oOYsOK5NaOC8qYgz2D5lhNrMli6lA65u+5sUX+NQmvFESxpcuJpTy6tPz1EXTR3kAkD/r9G+3s+4BloRb0VPcmHhsGkY/CVAyk2WbfTp9W8jxKMIIKKKSPt/XJWtFWt2HMn/GwaMGJgepNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604533; c=relaxed/simple;
	bh=vGnjYPZ1ZbXu71IO3HF85YhI2ogv4vo1AMV1TbtasjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXMkDDfo94gfY+2rHJIr1botSrae1SfbCDjboTejxoZU2oMcw5UC585t76cWHTn6mEFpRkBFLp8+UjeydvMNXHviX0fJboZ/6gNOSLyDdqv9N5o/Brz+uFvZLrNB+aB/2Bl+rqP7NHjkamCVWj6H7B6nXNoUOh/CZ/556TBsMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV72hefN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B95C113D0;
	Mon, 27 Oct 2025 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604532;
	bh=vGnjYPZ1ZbXu71IO3HF85YhI2ogv4vo1AMV1TbtasjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fV72hefNsNtVQZ60P/udw0vyIdCxvzBV8ZHcIo9XQ57nesUohm/YmMdnZ3oCJyMsW
	 k4m6AxWWyYx4YdCWB2ECZRJlZCLDqGldqzhrQUQLe3dSOci+0FUndOBXjDPqU8GqtI
	 vOUiywSazabnhUHkPbH5XGcbw56ixIvKq9lLVXv8jK9z85WXeEAYCGocj4RvGADYpv
	 haBR+keGM4mf6EhX8/h1vx8+LQe/xMG7+ulWDufGkKarmbdibXwGfRNhx2rPjGChF6
	 x27hz0CYLtcJEIN5yYdQ7fVmgcB/qgZlEkZn+ZRbhdCPr8mI8K6R86l9qdzL7BbpaY
	 DfPtpKCqU4qkw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: pmic: Remove 'allow-set-time' property
Date: Mon, 27 Oct 2025 17:37:25 -0500
Message-ID: <176160465183.73268.13666964053987809637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
References: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Sep 2025 12:09:27 +0800, Tingguo Cheng wrote:
> Remove the 'allow-set-time' property from the rtc node because APPS
> is prohibited from setting the hardware RTC time.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: pmic: Remove 'allow-set-time' property
      commit: 4654433409914017618233daccfbf79876b2adfe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

