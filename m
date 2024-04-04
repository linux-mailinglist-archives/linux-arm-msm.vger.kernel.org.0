Return-Path: <linux-arm-msm+bounces-16427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77A899023
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B4C1B26AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964AB13C838;
	Thu,  4 Apr 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1R8YnZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28413C833;
	Thu,  4 Apr 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265808; cv=none; b=MNMaWgDcFnwAapl9YCUCgqQRVRl/3PbLHFXh0sYWXH8c4N+K6O7+c0rcHtF84VKOr84KqiczFPH/DNluWTytTgVZDoZ9C5dX9Uathj4v39uuxs5LWw15ZYHbAw1QsFeG80VvPdJaVf6jLWwY7d1FqKovctcvH1KmPChI2jJLVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265808; c=relaxed/simple;
	bh=JrGEN+bSmXEHASdj2SVVExmWiUl1NQ/BH9LvPjHMJ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJm12DxhHbKLfZWIJRnzEhPOq2+eIQmvi4YeCS1WFieEiS0QKPpGDSSy2dsIhNd1sK0pnxW9LedGV2G30ql2O+jEfvmnvCKVayBOKu/UEelaB/UGOF5FmAUbHUsISRM9EH/GrY6Qh3sqcrmJ3d6ApF9ut3QMVcMFfTG4NSwqnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1R8YnZ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E96C433B2;
	Thu,  4 Apr 2024 21:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265808;
	bh=JrGEN+bSmXEHASdj2SVVExmWiUl1NQ/BH9LvPjHMJ6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j1R8YnZ7QFNodKRbRwffmnkM8G2waA07tc58ltzwG3eh78eCmzlGJ9Umsop1LWfvl
	 bC4zTRnpwUB873g0FvwuTPj2gdG2KP1cPAZvp/bdJpyLovpHLSoj3g8VptDtr01kcs
	 rynss+FhXiToBALEOyGIlPbrx4gmbp0uzhazOgBLMkV/NavgwdCY2BgkFU+23OjhjL
	 +F21Tq10/Aj+4fsE6hq8FO1RzN9dx3+hHFs3AnQUCGdPctEAEgsXDNDLdh0yM9e2to
	 gQPKjbLcXGWoeDtZ7MCi/LPREupqVdhv/gdZ20TSSWd1gmolM2IqdIL2FP7XcCiC4D
	 ESFPfZvcFGFWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Raase <linux@sraa.de>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-yoshino: Enable RGB led
Date: Thu,  4 Apr 2024 16:22:55 -0500
Message-ID: <171226578686.615813.851500439944875824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240316-topic-maple_led-v1-1-ca3430fd9dc5@linaro.org>
References: <20240316-topic-maple_led-v1-1-ca3430fd9dc5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 16 Mar 2024 13:10:46 +0100, Konrad Dybcio wrote:
> Add the multicolor description and enable the PMI8998 LPG to expose the
> RGB notification LED.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8998-yoshino: Enable RGB led
      commit: 7c2a774f028f6e2acc40bf969fcac288d3143c7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

