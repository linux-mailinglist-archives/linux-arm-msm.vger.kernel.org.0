Return-Path: <linux-arm-msm+bounces-7962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DA839137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A32028383C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 14:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EDB5FB88;
	Tue, 23 Jan 2024 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtAV89QF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89E5F872;
	Tue, 23 Jan 2024 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019665; cv=none; b=lK5aD0yyx/mOjR92B+Sk/CEtOWgkQcuoGdN3gU/DMCczW58Frx/VXznVAKUJUS2rGrAn08TMtATRMhueB4tzvWtggruFKDH4SQ9oiPAQiLVtaZKFbmS9qc1jguypAd7humO5POtPg6bVaJ7Jrc6Gl2KxDBtILtq+uEKI2RCJBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019665; c=relaxed/simple;
	bh=WKRQ73No1XIRwu2KqkkEv1r+kkKq7aREKeLPaUxbAqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tpqo+HTMl0qex6ljIns+ky5EVknhI74bvVn9zH/irQGyt6erW/F8WKlgdu010AVYFS/H3y/okqvP22edPqoQKAP317wO40mcSTpmfN2qXq7dHaUQKQqkpnjK/JfBrtJB1+yCtkozkPMXf7Ir4M3L0IP9gkiYhHL38Ai+k5L2X3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtAV89QF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E2C41674;
	Tue, 23 Jan 2024 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706019665;
	bh=WKRQ73No1XIRwu2KqkkEv1r+kkKq7aREKeLPaUxbAqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CtAV89QFv0xzENblAt7WHnJuu9MVJHmLkTbm/cuJbA/cvhLDjkhKYf399tf3B6x5G
	 n7vGfM0uFl1feFsr78vmbluhO644RLIWojIp7cZaJI/oxid4lL3KpjELcC/V4LFU57
	 Iy0/a9oDegibaJE61edB/jj0WpDYJ6cm2hTuvw7ZLZu0Rr8l+4gRD4cI7PVODsZcBO
	 6FBBr5+NSOA/4i4LTiElE7fACRLZCsWjsfdQajf6d34StF3/uJfrV0jQFh4aIjs76Z
	 1d5erJ3mxOuYKkj8OlAIyrXhby1q/xSijek+ojQ0LuCiUa9SQB4dQEdH48gjEAjKYB
	 TwB8HR0CxMSfA==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
References: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
Subject: Re: (subset) [PATCH 0/4] phy: qcom: qmp-usbc: enable SDM660
 support
Message-Id: <170601966220.371263.7812920821998823049.b4-ty@kernel.org>
Date: Tue, 23 Jan 2024 19:51:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Tue, 16 Jan 2024 03:10:54 +0200, Dmitry Baryshkov wrote:
> Enable support for the USB3 QMP PHY present on the QUalcomm SDM630 /
> SDM660 platforms.
> 
> Dependecies:
> - PHY-related changes of [1]
> - [2]
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support SDM660
      commit: 0ca5e2bf2f4753a879ed3f4a747ee5c947152838
[2/4] phy: qcom: qmp-usbc: enable SDM630 support
      commit: 78f2d7df63cd3811ef878e881fa017a20a648c0f

Best regards,
-- 
~Vinod



