Return-Path: <linux-arm-msm+bounces-40925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548D9E86C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 17:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67D3A1883BF8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 16:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5E0189B8C;
	Sun,  8 Dec 2024 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndLAxfN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C120323;
	Sun,  8 Dec 2024 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677138; cv=none; b=hI5VDprm4owEdRraSMY5HxXmsFQXBX5Tff3j6nDMSt4Rmvjb53rtWSgFQ44frMfYKTV2Iq4aohA8Ny+ekXKaqRMvvMriYiCeDUvS2cUoZx1j/jQzTRVXQdnxSjL9SXWj7fELq8rIiAx3OnLgKLO6UmIqroilkTjKyBfz/PgRv60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677138; c=relaxed/simple;
	bh=4b8k6Gcyhw1gaSHNTpYg9f2l+lRd2mJlHG6QsYQQKsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eZrXjaUN+pVenG6TR22xztzCnGoMan7Twifj2Xfgl2ydbGtaYduE7LF256W2eGiZKx2/NgCyYZsYY83jto2mi80kW5sxW2U8KYEv964SzN0DAmvtLukrfhoXgRypRRAQJa1iUzKCfvNGDeiRk7SOITS83OJ6njjSM7WVmnvR86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndLAxfN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4556AC4AF0B;
	Sun,  8 Dec 2024 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677137;
	bh=4b8k6Gcyhw1gaSHNTpYg9f2l+lRd2mJlHG6QsYQQKsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ndLAxfN8c4UFvtBiwysKL9Zvsa6fKpLxJhu55E0mHGe6iKRZA6uEH4JW7gr3jZ03Z
	 rjjg++Ghx9gP6qK/37yTqgfvdehRD+UTGlYIUDJzyw+R8crlfi4gnw8MtsOSGeT8/g
	 1TqSbkVoIej9n5a+t6kSvqo2manBdjuil5z/H3TR3EQwU3CMoG2wmKF8AvuCuygcYx
	 I74rJYIuz7u8IRSE1rzWbhQCEdWsdo1qOeCwmm/Bsh3QXNRjEhVRsw10MrclvwrWGX
	 0DGQTUko6aK6d4T5ZC41JEmrHAn5ITNLLo4+5YCpNejEXxnR3HoNwanyLP/f8ydhIS
	 xfudYZkk09j+A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Mantas Pucka <mantas@8devices.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Komal Bajaj <quic_kbajaj@quicinc.com>, 
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
 quic_jackp@quicinc.com, stable@vger.kernel.org
In-Reply-To: <20241112092831.4110942-1-quic_kriskura@quicinc.com>
References: <20241112092831.4110942-1-quic_kriskura@quicinc.com>
Subject: Re: [PATCH] phy: qcom-qmp: Fix register name in RX Lane config of
 SC8280XP
Message-Id: <173367713289.1031947.10070868300921760788.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:28:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 12 Nov 2024 14:58:31 +0530, Krishna Kurapati wrote:
> In RX Lane configuration sequence of SC8280XP, the register
> V5_RX_UCDR_FO_GAIN is incorrectly spelled as RX_UCDR_SO_GAIN and
> hence the programming sequence is wrong. Fix the register sequence
> accordingly to avoid any compliance failures. This has been tested
> on SA8775P by checking device mode enumeration in SuperSpeed.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp: Fix register name in RX Lane config of SC8280XP
      commit: 8886fb3240931a0afce82dea87edfe46bcb0a586

Best regards,
-- 
~Vinod



