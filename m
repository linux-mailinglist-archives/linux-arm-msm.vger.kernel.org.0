Return-Path: <linux-arm-msm+bounces-70502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA96B32D1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8826F7A385D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A591230BF8;
	Sun, 24 Aug 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTQIDgep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9122FDEA;
	Sun, 24 Aug 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004172; cv=none; b=tokBjZPwYVX4WFXzvRmpqELArauqxys8Ru+hf0ZwxnjHNr5Nhwge9acFuQYoQ9gWV1YSzmjgiffdbo7eLeUTv80vdhgnayRe7XQSWX6UPGUGGTXqz17Ym/SOUfyKz8VdYfI6IXh+ZOSyOiRkhIODOLlWQ0hdjfkJbUgELjpeGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004172; c=relaxed/simple;
	bh=QVf3FYRTtUisuWHZOxyobQGqWGErSO1p5x9chC1UNgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwgIJepGCrZXuXNcPfFxUbNXqZyHJBwfa+UOf5xXHtudHhKBpCBFNZ0wny2gVhle9A/S/IdTPMyfTB+MVRikcl76MYOoNm8OniQib4c/W6yQEeiDJabWuuTBU3fPpmND2LHScax5dKulcsakQBs+o2+v9zgpiq7Qkf4lSZeNtj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTQIDgep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C56BC113D0;
	Sun, 24 Aug 2025 02:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004172;
	bh=QVf3FYRTtUisuWHZOxyobQGqWGErSO1p5x9chC1UNgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTQIDgepshcnZZlZMXFnnydve/oKFCB5Ddw9U+Zi4xp6n7ULbW3By0hTBzZ+eH9qc
	 5xF/7liGBGEkuggu6ZJa7basGTj9P/dd033y4LNZaIb5nYG66h+7I+bw40NsfJ9wfs
	 TEmGbfmHofRRug97/Qfx1yj65ifTG7nKeVmX+WEEP0PuLsl4L2IkYY0GRWFpW956eZ
	 foycqQ2vo+WBdKICyyB2Ck9iwe2FMwVLEhlOPCYtY5aNzs3p1iY/a+k8LjB7MCijOY
	 iVpo2z4i0Eubrgwr/9nz/r6jCto8zjkBdtSsGtclUnBhG2fdJ7JcyiiQq1SVD6S4I2
	 83HgrUX+FpI4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors
Date: Sat, 23 Aug 2025 21:55:45 -0500
Message-ID: <175600415268.952266.9400258339470808858.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250818123851.111326-2-krzysztof.kozlowski@linaro.org>
References: <20250818123851.111326-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 Aug 2025 14:38:52 +0200, Krzysztof Kozlowski wrote:
> The ISR calls dev_pm_opp_find_bw_ceil(), which can return EINVAL, ERANGE
> or ENODEV, and if that one fails with ERANGE, then it tries again with
> floor dev_pm_opp_find_bw_floor().
> 
> In theory, following error paths are possible:
> 1. First dev_pm_opp_find_bw_ceil() failed with an error different than
>    ERANGE,
> 2. Any error from second dev_pm_opp_find_bw_floor().
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors
      commit: 13650cd32cfc640fbd49f0424640f64d57335d4c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

