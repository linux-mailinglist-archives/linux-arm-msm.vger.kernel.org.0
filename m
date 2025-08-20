Return-Path: <linux-arm-msm+bounces-70000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E5B2E2E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 19:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1F41895629
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 17:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1A133473E;
	Wed, 20 Aug 2025 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKQmtVQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038FC23E33D;
	Wed, 20 Aug 2025 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709401; cv=none; b=moxWPkkE0aL92bCXapB954fKDHN7ODOCASm2Rt8SE3/PbFJLl4Gylaapdtue3z3svJYFyXPeX8bDTrWEoS8eS0s5ZvGXB1IIVl/2GR2lnE+QUXojAZOt1knSL1JpNa1f9xxhqKkMp7cFNLyemsamW9HyEoD0T69W6EDtUy63/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709401; c=relaxed/simple;
	bh=lH2FtywTwxeDLF+4pDvhZz6bWPeakR4zpNH7a7rIn2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gjgIDOg3MXLhHIEvdOAlzWuG1n7Nun1nIwXMY8G2Mp7U+WnOPIDh+tM2v90vSZmMDGW8oG4bu+j8iu17WDe1e3RU1R99XoTr9NFeP/3uf+XdQypqaMnyiuQlcVKJ+4o52ToVRwJlKHbaQG8rwZ+S1z6ZzxxcK544Ck9HH826V94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKQmtVQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16455C113D0;
	Wed, 20 Aug 2025 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709398;
	bh=lH2FtywTwxeDLF+4pDvhZz6bWPeakR4zpNH7a7rIn2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KKQmtVQEyHUVnrTNnOqLotbg3P5LgdahJtjlEKgP8UXd5YMShfA2d1MwbtAZZdx1t
	 FU75f9g1QkbuwYhvr+GtcGgx18R4eATpxYdeHTSlGbpESeoq6c4oBnDregwza8ig/L
	 GsKVRAZ/pWQx4TMENvjtKw3/LzKk58V7dIHwrf1qr+eyzRerkeR5aOZKagQuu03ftI
	 IcP3yWzSF+alozi3lWad6HUKvdiRfMZAz8OkpN3dgmRXyd/EXkDI2aFhEsE1vedk1s
	 c4AB6LXcZWr7vo77NqqbdHIjpJCAUldkr8zAYwb9iGmqdX2drN599+sej5i1V8r06U
	 456MELkBtF0hw==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andersson@kernel.org, 
 Yongxing Mou <quic_yongmou@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
References: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
Subject: Re: [PATCH RESEND] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
Message-Id: <175570939464.66459.14512137933312026042.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:33:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 30 Jul 2025 15:27:25 +0800, Yongxing Mou wrote:
> Add compatible string for the supported eDP PHY on QCS8300 platform.
> QCS8300 have the same eDP PHY with SA8775P.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Add eDP PHY compatible for QCS8300
      commit: ce489635960a6a3fcb0abe0918994f2d8deb02ed

Best regards,
-- 
~Vinod



