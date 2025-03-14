Return-Path: <linux-arm-msm+bounces-51483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B8A61B8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3DC47A2AF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE620E316;
	Fri, 14 Mar 2025 20:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yr0X66xE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769620E306;
	Fri, 14 Mar 2025 20:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982503; cv=none; b=TV9CVnRLlyvj/LNjKkCBA2QCyWII9D7aIPOKYKv3j36bD41JOxubUJrspsgr+oPVow29E6Fcd4Qycm44d161oO9QiFzq7fz0ljrolmA22ouEAtujdJi0NcYrdayOQCngUtp1+uGWMV6GHWUK98GvjjjHBd/4WDLA5AC50EQl5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982503; c=relaxed/simple;
	bh=zgpk/oCHfxojEE4OLIwneMYJJD7ooBCWKgprWtcLnaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvzEOABJmz7eGOyDB9gSmrI92EsOqo0uSO5SuwB75HpVuCG4XCNoJQ90lWB8cfVQq0w+93H7GrXyTB4XRz4iAZt+KSby8IcakUWVJGrWCQrlFSYWAL7gmJZ2PWuQQjx1mdCPsFijWEV/ymhFwxhYexLOFKfuglep5WGbjxHQAmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yr0X66xE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EC7C4CEF0;
	Fri, 14 Mar 2025 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982503;
	bh=zgpk/oCHfxojEE4OLIwneMYJJD7ooBCWKgprWtcLnaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yr0X66xEV6UnNSUlWW+BHWpHiqiVLO+zg/ATWBHc+UzpCBZ/MH0Ul2lJgCvjhDIen
	 qnOVgI4SwhABcD6wvCD8jRZHJUFjWmSGg9TRyq+v4o/8GJvOqt3GN+lr4atW5g59zW
	 cOLqLy8pv/sHZr1JK12+kDhFqSXcdfWES8adYefe7qR/uKFf5BIqM6lF96z1PjvsT6
	 JQN2seECcj4hCUFqMZpErQDtBj4+6X/8GvC6aW0dDQP0YLhW3wu9a85b599Od8y6pf
	 8iYgNlboAgNGpaKs8TL4QQ8NxNufSx7fgnSVh0SciN8994PhoqYLWs4xPu0asYAzzZ
	 Mreo17WH4L2Jw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: sm8750: CDSP
Date: Fri, 14 Mar 2025 15:00:57 -0500
Message-ID: <174198247867.1604753.14460307303146330461.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312-b4-sm8750-cdsp-v4-0-4925d607cea6@linaro.org>
References: <20250312-b4-sm8750-cdsp-v4-0-4925d607cea6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 14:13:56 +0100, Krzysztof Kozlowski wrote:
> Remoteproc bindings were merged to remoteproc tree.
> 
> Changes in v4:
> - None, only rebase (context changes).
> - Link to v3: https://lore.kernel.org/r/20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org
> 
> Changes in v3:
> - Based on Dmitry's feedback, move modem pieces to separate patchset, so
>   this can be easily merged.
> - Keep previous tags.
> - Link to v2: https://lore.kernel.org/r/20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add CDSP
      commit: 58471055ae76f639ba8cc2df3e1bc12fa4be2c02
[2/3] arm64: dts: qcom: sm8750-mtp: Enable CDSP
      commit: 070b7e0490b521999b95c9262ab9e1609c8ab4a1
[3/3] arm64: dts: qcom: sm8750-qrd: Enable CDSP
      commit: 0bbdfaa204ce673570e41fe71d4f571a82c7b04d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

