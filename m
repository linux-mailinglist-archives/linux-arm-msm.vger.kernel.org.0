Return-Path: <linux-arm-msm+bounces-3961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9380A5E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8681F210E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E5D1BDF0;
	Fri,  8 Dec 2023 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5QTFyOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3839B179A7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 14:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D819C433C8;
	Fri,  8 Dec 2023 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047064;
	bh=T5He5Aq/lOrFvOVWphEjDW0dKri7ifK39X4Qeuo70+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D5QTFyOdj1eXrySHveWmpSTex81IQ1KyWDBN1yCYV8g7rGrE0MQwcWt4o2c92W+T3
	 os5EtnSPi3XlsGr49dxsvM4RGe7YZrg9c022H4t2nv9kf7mQopxjd142ga2q6Qwmvu
	 I/5HGtVHLG4vLCYoJkbQtw46v2I/Ip+lxXaVVwM1QWtfgqQkfOU66ZmI9QI2nX3/6P
	 vA2M0+sIq29PPMT3ijIPU+P6+BvSBrVj6mkANgWo4Xl6yjSyXKGn5VkyBz9aMh9jll
	 OhMiMMqPJ20LdZK1csiAQXDgNt7BxVUL2/l+Uh469Y/0VgBwMo9qmWxnO1kRkmrupj
	 vPVH08da7wEEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] soc: qcom: stats: fix 64-bit division
Date: Fri,  8 Dec 2023 06:55:14 -0800
Message-ID: <170204733604.342318.17962213281334041105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231206123717.524009-1-arnd@kernel.org>
References: <20231206123717.524009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 Dec 2023 13:37:06 +0100, Arnd Bergmann wrote:
> Unguarded 64-bit division is not allowed on 32-bit kernels because this
> is very slow. The result of trying anyway is a link failure:
> 
> arm-linux-gnueabi-ld: drivers/soc/qcom/qcom_stats.o: in function `qcom_ddr_stats_show':
> qcom_stats.c:(.text+0x334): undefined reference to `__aeabi_uldivmod'
> 
> As this function is only used for debugging and not performance critical,
> rewrite it to use div_u64() instead. ARCH_TIMER_FREQ is a multiple of
> MSEC_PER_SEC anyway, so there is no loss in precisison.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: stats: fix 64-bit division
      commit: 73380e2573c34a45e01786750a4a2efafc2248bd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

