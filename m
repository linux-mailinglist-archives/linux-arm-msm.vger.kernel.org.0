Return-Path: <linux-arm-msm+bounces-79718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1AC212C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1680D1A6781A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFED236B966;
	Thu, 30 Oct 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5SX6DkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DE36A61C;
	Thu, 30 Oct 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841371; cv=none; b=YSqKLP5jKiXMczJqzIitEd2XmR7zJ82gL6ngWTNg7k4/Xb6kLOXppsNzBiOvG4J01SyJ2OYh8cAHldMMcl3GQGfpLmGgTap4HtCaNn/qBJe6ztzgSZ7XdxRdiLD6l0RDz0hlAEsWjVccq/74FUvyPliLvln+C4JiPH7ZC+Fc42E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841371; c=relaxed/simple;
	bh=WZAmjSoGOgy3/S6QNh5UhcE8tubnTaz9O4xJNaQSAFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klqju9/7i+rFNWDMtbwIdmmRHXbXMz8cwAE0qthntLH0I+1Sbazr0TjUu3Vt9pEotSzE9R2VEPZaP/KF8UehfbMJYExNXS7EKXlW3PxHCg2r2LsViH3WF3g/LIIsJjAGSEGHVgCDCmSEMMibDKWN9mJu3t2joWoouTsU1YgN1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5SX6DkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84655C4CEF8;
	Thu, 30 Oct 2025 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841371;
	bh=WZAmjSoGOgy3/S6QNh5UhcE8tubnTaz9O4xJNaQSAFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y5SX6DkXrsc369n4H1kxKHkff+B2LkKnBhFxUGs2pC3G4bt/GKh+6eILUEiGhH4IR
	 yvVOUG3pMhMNGUn8Pdkcd2ZV8of4VBfubr2NoVWkgnZmA7L6DeHNx8UYFXvQgqvwT/
	 GrO8nHfa7DcQTX9li2xZm4xM/b+a4DLF6rVoJ/dZdUwmGrRhnjox9N6sSB5eFShDGu
	 TWV6qn51Z3NNu/C8rtdiz7OGH6OCd3tGN89OIwM5hGN4L7114YP7FtwvIrAzSDqyFC
	 7XJ05kDEqLOZk4IimIGHiJyFy+8Ua0r7896pb3wfVWOS2eKa8SD1K93AWTmNpdtcJI
	 kzjTc9XUFbkhQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xin Liu <xin.liu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Update 'model' string for qcs615 ride
Date: Thu, 30 Oct 2025 11:25:43 -0500
Message-ID: <176184154236.475875.2628791155363083563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029023137.381386-1-xin.liu@oss.qualcomm.com>
References: <20251029023137.381386-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Oct 2025 19:31:35 -0700, Xin Liu wrote:
> Update the 'model' property in the QCS615-ride device tree to include
> the public board name "IQ-615 Beta EVK". This ensures consistency with
> official documentation and release notes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: Update 'model' string for qcs615 ride
      commit: 500d3d0e88362eaee5e655bcd3ab2e9c808bec66

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

