Return-Path: <linux-arm-msm+bounces-28679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A61953BAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A242E1C21120
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8F715688C;
	Thu, 15 Aug 2024 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mtf7ilcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6474F156871;
	Thu, 15 Aug 2024 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754469; cv=none; b=lnDZFo2F6VsMHKuPY1gV92V3IitC5xeRnFHqCoRNcod6m8+DdkEjq6XKAsrsoIgTWh7o2JhY5sk41JabT9NetS7KXLJRefut/RSudAp4TNo0MM41ukxenFFmDkqgqJduE/dkbEuYNjwKN+ff0Gj0oMUH6YQGA+1tJ1L+GVoLmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754469; c=relaxed/simple;
	bh=RY07me97Hp+XVsJNPJ663Spiww09CKfyJsL5b8mH5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNcQLtDqpK+nZq+R2Em3evwo/l2zuLdXhAWpftUW/NgXTPs6hJXIxdBfU1THdUOmked95Ws011iKWjCgtNT3WajnXq/AJvkKIBJ3LmytNSF+OGucoOvMlXWOGWRkDGktofTxfmkOyhUqd7Sz26nNY5DoAi3850pxZ2ZM0q/YuLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mtf7ilcc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EFEC4AF0E;
	Thu, 15 Aug 2024 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754468;
	bh=RY07me97Hp+XVsJNPJ663Spiww09CKfyJsL5b8mH5Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mtf7ilccyPcDBkGrY+Q4vofYyx2Yh6PL7k8Jdj5iJ0/Gof/YI0Fhhh9DUyZa8SUhx
	 BgV+DLh5LRE9emD7O1X3HxDAkmp+qaZeZsvi7+v2uBMFjFTU0u0WVuBqqzw19BFfLY
	 EyaWomAHzVKPaa9jfDG0J6HrbYDRs6/4t+wm90iNs/firh4KIlE7pMejrCgITxY27o
	 7vgMM7R3y3m4IuroKLhaxPXG+Hfrzk+YVheKLF5dg1KMQSFwjh50JC4hDOjrZl+3C/
	 N7tt4rZlkk3Rw+Mc5oa6PDnxLNT0iKRSUXyA0hwmBS3RhvlITZRcfOoil2Mnej2DU8
	 N1xYL+3zuKomA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] soc: qcom: fix rpm_requests module probing
Date: Thu, 15 Aug 2024 15:40:25 -0500
Message-ID: <172375444814.1011236.18008353969050229050.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jul 2024 22:52:13 +0300, Dmitry Baryshkov wrote:
> The GLINK RPMSG channels get modalias based on the compatible string
> rather than the channel type, however the smd-rpm module uses rpmsg ID
> instead. Thus if the smd-rpm is built as a module, it doesn't get
> automatically loaded. Add generic compatible to such devices and fix
> module's ID table.
> 
> Module loading worked before the commit bcabe1e09135 ("soc: qcom:
> smd-rpm: Match rpmsg channel instead of compatible"), because the driver
> listed all compatible strings, but the mentioned commit changed ID
> table. Revert the offending commit and add generic compatible strings
> instead.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: add generic compat string to RPM glink channels
      commit: 0b7d94e9d15d90aa55468b3c7681558ad66c7279

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

