Return-Path: <linux-arm-msm+bounces-16432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70D899037
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1801C226DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3691A13CC51;
	Thu,  4 Apr 2024 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVkVSULn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E213CC49;
	Thu,  4 Apr 2024 21:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265814; cv=none; b=BeHE4B5a/4Nd9Oi9DrqF/QVDFz/5UUGqI1hW/W7q80sZf0etZpglLm7CGvh04fEKhJEQCj+MMp8Mt1dH5P/+7DFrmYbvZEn6/mo93+HKJ2Zl8KfCy8qBNlUd9/o8BZJL04ZL/8RWeU4xhGMElM2bEPurFdUFPXT8PGSmC+gE05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265814; c=relaxed/simple;
	bh=dNhctfixPH2uCxW3lsSmIAX8NjjDvgAwFVvszyUprcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edRjEM+zGGBp5ejPE1WZFP+pxuhLgyzgNd4fqcHVU5xT+Ze0b3OZ+YGSNFoZi777Fc8HaL2MFhdGJWrgGZg+MWaqp2Td7ktFrOBM+dODFcuWd/uoaLnNH//nZuJVF7RUY6VFlzrRY/c+6oT8Qfk5vxMFHV5r4cNxmhTgmwr+qfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVkVSULn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F8AC43330;
	Thu,  4 Apr 2024 21:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265813;
	bh=dNhctfixPH2uCxW3lsSmIAX8NjjDvgAwFVvszyUprcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVkVSULnFma/y4rwhAN6hj1XBmm6C0U+11ke9XeZXDdZpkdSLKHCQZri5cfRh3vz5
	 qShXf7g7VwDXgRMXx0dxeroIvKH+MGj5ggTINP+MOIkOcMJ5JlLccklF+6F6IqbY82
	 +SrASeCp8dWF3zdFP8KPzWYdNCeoKCPJNQ0TbGQN2Oh3l0tYsyOyJnT5KCPQLQ4FOz
	 Xj4Q6iCUY2HR3AYVXBSZSVsXkNmDZFqG3rjtYguS0CD2Lup/Z0jgYQk+pqJoTo8etA
	 NZo5fyYoGZJ9Xarw+/3DGWyOwJ0mT9A6ynYdbn1FPEL3KCZuDfls03w7RGLB3vMXY7
	 1Mw5jNYmQsR6Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Sebastian Raase <linux@sraa.de>
Cc: marijn.suijten@somainline.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm630-nile: add pinctrl for camera key
Date: Thu,  4 Apr 2024 16:23:00 -0500
Message-ID: <171226578684.615813.814062230653133396.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240315085934.1511722-1-linux@sraa.de>
References: <20240315085934.1511722-1-linux@sraa.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Mar 2024 09:59:25 +0100, Sebastian Raase wrote:
> Add pinctrl configuration for gpio-keys. Without this,
> camera button half-presses are not detected.
> 
> Tested on discovery and pioneer.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm630-nile: add pinctrl for camera key
      commit: 0fba148c3ac0fb8bc3d2a788c19b2ede4e5d3695

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

