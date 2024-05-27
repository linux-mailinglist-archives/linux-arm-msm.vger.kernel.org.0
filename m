Return-Path: <linux-arm-msm+bounces-20502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC168CF79E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8B31C20CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11692E3F7;
	Mon, 27 May 2024 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES4hy7d+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE162BCFF;
	Mon, 27 May 2024 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778860; cv=none; b=okfwjqrOqzIG+XGF7vVQOF4YTDBnmxVPdNT4czjp6d3O6ZfQ5WlcdBxKM0/L0RewZIK6kTOew/4LSQ9HWaB+kB4KYqRaGX0CBvYeR3AsF0pBLbBPItpYjeI/qFdUEXH+DUJ1CuZ6+mRINijuCPW7mKht67P0TtnfF0jp2ZXE+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778860; c=relaxed/simple;
	bh=voDM75UIHHzTHHdTHXioYH1pAW1IY8DWNBmGtUyYAr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sf7uhsk5SlZgyxaQ3iigSuFGAo5V1Xnp0FH8okGUiO2erU3keFynhHzS/CEYm97h+kbitQxQZhqmuKenmR7OkT3sU0079tMISgKBJ0W9yBZg+GOUSIeCXiyYMBZJ2+2OCPA36SBwXAhc5ylT9TPJIfYnbBt0PGlXUiyZgi49i9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES4hy7d+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51C0C4AF08;
	Mon, 27 May 2024 03:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778860;
	bh=voDM75UIHHzTHHdTHXioYH1pAW1IY8DWNBmGtUyYAr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ES4hy7d+c26DwNxktriZPjseS2jJNZ90VyHZA0sBkGXRWT9ye9JIiNmhkumttjEZa
	 7ABiaxu056JDSQnH3FY78FJnxBqxv6jlJwbOEsl/ElSl2bmko+cB4fCw9SqfHoVp6K
	 xuVKwJ0vRhA1y+nRL9Ht0XPwNmXkFWrTrhr9t0HukbNuB29HcqpvpkQZD8gqKongoC
	 dwbuqItCasr9U9hfZvFxczWMxDdtB/CQ/hY7fP/1vy/8SegMkvK1y4RWcRWtvSoNGY
	 8lIWn9yk0dC/hcDHfnvwR4Zv3KLPEsvrn46cvl3C+ZsfBHXNI14E7t8EXVzjqoWB4Y
	 XE/AN+hbCXUuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Update X1E PMICs
Date: Sun, 26 May 2024 22:00:28 -0500
Message-ID: <171677884191.490947.11635728297025525202.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522-topic-x1e_pmics_socinfo-v1-1-da8a097e5134@linaro.org>
References: <20240522-topic-x1e_pmics_socinfo-v1-1-da8a097e5134@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 May 2024 13:33:43 +0200, Konrad Dybcio wrote:
> Assign the correct name to ID 82 and fix the ID of SMB2360.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Update X1E PMICs
      commit: 85f5656a4f3f188cb950cf8dc88f3f0e4e656bae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

