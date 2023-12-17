Return-Path: <linux-arm-msm+bounces-5133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0394D81612B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2DCC28291E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3105F86A;
	Sun, 17 Dec 2023 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyFy/kpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8315F863;
	Sun, 17 Dec 2023 17:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EFDC433D9;
	Sun, 17 Dec 2023 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833744;
	bh=h2OqmYFHkVB4TTcNDJG/cnAAbIrwW5eNKtMKxVacPHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MyFy/kpvsmCwBr/mgkGXTZ4x3oPNxaD/zBBcnYEdOizURHRwwJsTuNhIcno3LbZ3R
	 O6gdsnsjgyRa/2tsd615pjzBUltWfCiYpDJLgcZ1YhRNW3gF/n4ByltLWXxNHHgdGB
	 iNLAjt7zW4Ass1RjYbMY4V1SXhRKYRwGDrAbOht0RbyN7xX8nDNTCEqhSCs7pmSA0i
	 mfeW866CdVq9tmrROciVJoOhLfjkqmhPTuU0IXTt+p7+opKCSGz3STnaF19/w16lOO
	 e8+Lpcq6debX6NnJRT/8uOI08UDV8y58G6x/AeFrFxFIlsUUMsdOMWOG3l8DvT45vM
	 aBxZfIIF7ZZiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Benjamin Li <benl@squareup.com>,
	James Willcox <jwillcox@squareup.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Leo Yan <leo.yan@linaro.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Jun Nie <jun.nie@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8939: Add clock-frequency for broadcast timer
Date: Sun, 17 Dec 2023 11:21:31 -0600
Message-ID: <170283349411.66089.6255618451007463139.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204-msm8939-timer-v1-1-a2486c625786@gerhold.net>
References: <20231204-msm8939-timer-v1-1-a2486c625786@gerhold.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Dec 2023 10:55:53 +0100, Stephan Gerhold wrote:
> Looks like not all firmware versions used for MSM8939 program the timer
> frequency for both broadcast/MMIO timers, causing a WARNING at runtime:
> 
> WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:38 cev_delta2ns+0x74/0x90
> pc : cev_delta2ns+0x74/0x90
> lr : clockevents_config.part.0+0x64/0x8c
> Call trace:
>  cev_delta2ns+0x74/0x90
>  clockevents_config_and_register+0x20/0x34
>  arch_timer_mem_of_init+0x374/0x534
>  timer_probe+0x88/0x110
>  time_init+0x14/0x4c
>  start_kernel+0x2c0/0x640
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939: Add clock-frequency for broadcast timer
      commit: 12844ac08c593c2dd232b1b0d96ee21944dfb044

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

