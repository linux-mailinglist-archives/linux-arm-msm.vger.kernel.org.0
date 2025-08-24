Return-Path: <linux-arm-msm+bounces-70500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F009B32D26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17681B66EB8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452982264CF;
	Sun, 24 Aug 2025 02:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnY+nF0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC2225A4F;
	Sun, 24 Aug 2025 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004171; cv=none; b=n0dkFhHhIdkIsBimZG1qFOvW0wXz6jfTz0mrJNGIv0XCl/EIlSIBMOnazXaiQN21MV+IKFX7HNZA9dGEZkT1TPPTEBk19DdssbduAycRYYYMp+nTQVmbauazimLx81Uq9FVhT3e2etLx/qCODtwXdKXea+kFZ3YmnfAQp3gitkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004171; c=relaxed/simple;
	bh=E8WObrPX1vDcc8UDiEavhHs8ZpP1qME13/iDYhwxSvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcTULFGPJSflA1Bzqad1RY1CtPgrIx2565yVdJ+F+b6E7EaUhpo+JrZwmNbgBazz31NFxo1oSaaK3wI82lrquHjNv9M3wjYLIMM3luBZvK/+6unBMJJOkXWo+syNQfNqoYcrI1Nwfq0xnnlz00pEXGuuGWutO3Vw4eVk/YxFeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnY+nF0w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B141EC113D0;
	Sun, 24 Aug 2025 02:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004170;
	bh=E8WObrPX1vDcc8UDiEavhHs8ZpP1qME13/iDYhwxSvw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JnY+nF0w811wGSO2jb9P0950RLCEssEG1FvWa/nIfu1rFnDybeIF4lFB9dDyNHo93
	 luMPv1jV53VIuz6sZw7L0YGCMcGr2WAoJprf65L3MeFsWLrOrUSxr1cymxbjuadb0E
	 e35SLIgUt9AfFkKHAqVY/YrmDRzCRrtQj38KZrF0gMcUChT5BnpXKKwPWOBjrPpxd4
	 9jB16TTX1RNyKT7XiGIt8QQoCt6pma/FOF0gC+AvTKwhcnxGVLa3As53p7U94f5cg5
	 Gelc5TRQKI/ewTuRqb8WO30ri9UWkGzUPii4aqO3hRxwfnL4QqkDC/kNKp+Uj5tJ0T
	 Rmd8Z/kNX45nQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: qcom: apq8064-mako: Minor whitespace cleanup
Date: Sat, 23 Aug 2025 21:55:43 -0500
Message-ID: <175600415293.952266.10435837846695774631.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250819131717.86713-3-krzysztof.kozlowski@linaro.org>
References: <20250819131717.86713-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Aug 2025 15:17:18 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' or '{'
> characters.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: Minor whitespace cleanup
      commit: 41b9f3dae105a3e54c3d94e8c0d67f857109e8fd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

