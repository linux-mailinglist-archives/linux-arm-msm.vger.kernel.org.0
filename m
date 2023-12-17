Return-Path: <linux-arm-msm+bounces-5132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AF8816128
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D401F24C25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C185F1E2;
	Sun, 17 Dec 2023 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXh0UkUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101F25DF00;
	Sun, 17 Dec 2023 17:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BFDC433C8;
	Sun, 17 Dec 2023 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833742;
	bh=fwqjF1PGa5TRHl3Z54KjpzOuHaIY4sZAyzkCxZvCIj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXh0UkUGdfYn+6HYHy3YpQvgXScxfmvmcYdYTNWz/yIHBwISa5Aia6cdPL4yW0wZ/
	 BrNCmyqyQgwcJwzF7t1YY+fhhIT4TPqrpFlrFZJAzX8c2HK/0WUVIMzPPFJ3q1DCcR
	 orkrb0ViSuPl3d09KTAXn94bX9aZRZi8JyN0Y/powFJoGJSn7BMc5hjV8xaD+/Uypr
	 ICWx3b/wBtXalASofnhBWAMOe8Idxpd34KQR2AnGBQNVhDehiC+7ncSxyDXPHDCzJt
	 saU+FsPg55a6BXjE5o3MccvILDKO0aIRN6lRRovDJkcjIadgVWeA/lIZN5eBYKUb6o
	 ooD2g4UA5ut4g==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add missing vio-supply for AW2013
Date: Sun, 17 Dec 2023 11:21:30 -0600
Message-ID: <170283349409.66089.10911234204410022500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204-qcom-aw2013-vio-v1-1-5d264bb5c0b2@gerhold.net>
References: <20231204-qcom-aw2013-vio-v1-1-5d264bb5c0b2@gerhold.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Dec 2023 10:46:11 +0100, Stephan Gerhold wrote:
> Add the missing vio-supply to all usages of the AW2013 LED controller
> to ensure that the regulator needed for pull-up of the interrupt and
> I2C lines is really turned on. While this seems to have worked fine so
> far some of these regulators are not guaranteed to be always-on. For
> example, pm8916_l6 is typically turned off together with the display
> if there aren't any other devices (e.g. sensors) keeping it always-on.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add missing vio-supply for AW2013
      commit: cc1ec484f2d0f464ad11b56fe3de2589c23f73ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

