Return-Path: <linux-arm-msm+bounces-70765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E123B34BA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCE047AF7A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 20:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C857E28489C;
	Mon, 25 Aug 2025 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gK+sRZ+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7872367B3;
	Mon, 25 Aug 2025 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153266; cv=none; b=LmCcD3ZZITI7xPnP1+9eC54h9FvjufLoq+PZLILGwC+yzmqPLTqZdXfRqzYMfyCrj4myjJykuZKZX/zxmHw+Sa+nYUeoB4ZbJJ3R9JVeVJYOyvgf/J73xxxgpx4Bjx0bhstFA7aXWnR5J8L+c2TGYy/cvvtgAbwTtLJvuAFuHi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153266; c=relaxed/simple;
	bh=HBUjCi58pGbQ1nqkVRl1Er9XlTy0S4iGn0Zj3CWDiaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pwLLPN9socaQ3aX9vskdS5uEsdF+/9IN6q23xKNjCMD2oCCX9l/zl9egfRTd4qOc/TYmVGq5hunSp+AvamA2Ph2yXvkwG/6iQ3kk8RNMc8EbH4mYkm890JlklF2jwH0htndOOdxoHbOEGVLhMMrWFmutCox1KRq1/pCYKC3Hdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gK+sRZ+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB32C4CEED;
	Mon, 25 Aug 2025 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756153266;
	bh=HBUjCi58pGbQ1nqkVRl1Er9XlTy0S4iGn0Zj3CWDiaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gK+sRZ+zc3gQfubJ/tLh+xKDp8ir/zajj8z2iQOt2wZ5v22TkQk8Fkmepmhg4pN4R
	 1iOHMTHhJp7vy8p51MQga+gFnbJyvmyojNdWyB3hwJyMlSSS8M1UqBdT9KG5ti9TLj
	 WQz4TXEB0L2fNj1ga2E2vksG4NhbZv9WsWU2iUdcPm4paP8qDw4/RvbSW1xggv/5qR
	 5Zp9L1YjmW6Hubr1/YllayeLEunAjPp24KuCV5Q0JfcXAfK9bwnRLDxRMYo4buM5/h
	 CqwPdgPtZ83WEiqnpwEBwbSM/LDhe7tf4Xaod9EHHFVDmbkTElX9NpapjWpCdo6K9D
	 jOvv97PG3s5mQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 johan+linaro@kernel.org, quic_skakitap@quicinc.com
In-Reply-To: <20250823-pm8008-negitive-selector-v1-1-52b026a4b5e8@quicinc.com>
References: <20250823-pm8008-negitive-selector-v1-1-52b026a4b5e8@quicinc.com>
Subject: Re: [PATCH] regulator: pm8008: fix probe failure due to negative
 voltage selector
Message-Id: <175615326276.232492.9513119697865046178.b4-ty@kernel.org>
Date: Mon, 25 Aug 2025 21:21:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Sat, 23 Aug 2025 01:56:39 +0530, Kamal Wadhwa wrote:
> In the current design, the `pm8008_regulator_get_voltage_sel()` callback
> can return a negative value if the raw voltage value is read as 0 uV from
> the PMIC HW register. This can cause the probe to fail when the
> `machine_constraints_voltage()` check is called during the regulator
> registration flow.
> 
> Fix this by using the helper `regulator_map_voltage_linear_range()` to
> convert the raw value to a voltage selector inside the mentioned get
> voltage selector function. This ensures that the value returned is always
> within the defined range.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pm8008: fix probe failure due to negative voltage selector
      commit: ef3e9c91ed87f13dba877a20569f4a0accf0612c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


