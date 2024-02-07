Return-Path: <linux-arm-msm+bounces-10040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61E84C3DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 05:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FB9F1C25893
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 04:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABF21DFF0;
	Wed,  7 Feb 2024 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7/jrSz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732351CFBF;
	Wed,  7 Feb 2024 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281214; cv=none; b=ZGU5Ayj6H2E6rq2Cz5u01mJLCZ6s3bWiwjXt1GpI8MOogeveSRsCfy6i8X+ZpX44VcLvU6wkP6cExOqYN5a14gX1AuIEq+EzFV0NOdYP8av18VhhIZFi1ckmfYQsFgQ3MsNMIPBQknAgz3jnbF/iKwTu2GlMb5APZ55ibi7DR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281214; c=relaxed/simple;
	bh=bQpmgw8PFGNFfnskolDbFmOwqhSUFVWRfFfjxIBJNVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlAxq5Qfjjl86YKeCSAez9y3qXKLLlmbNPjQO6u7DjsNh0cHnjNqKJhgodoIrFWw1g5a/BzvqYrbDe2BJ6lcUiFX0Xn8X0syM2QKVXSpIFMqRQ0qTtSKeB1pFWJpeBUjoaoWyqcEIKw7cO1lO7SNldJznRl+XZcKZjn+Tudqp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7/jrSz5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B66EC43390;
	Wed,  7 Feb 2024 04:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707281214;
	bh=bQpmgw8PFGNFfnskolDbFmOwqhSUFVWRfFfjxIBJNVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7/jrSz5hKouELAkGhSXxwOohq6NGhdNIZiOcTr8IlF6/OV8H2dRwaqtlzhbZjvgN
	 8pkye1jYuI98WIqshD/yv3wZkvtwBRqv+Y7aZAmfnz9uU0F4tcg5FYcUJmS12HGalS
	 CIENsyrag1DnbhW5cufmUmZ2X2kpz/PJOvT2sHR52A8eqY2C8ZHtIlvoNhfmBHCKPT
	 jpEXIwX9udoYN+49ydwbKwDO6s7lg1xR7kbpNOeV5o1/atAcsHlwewb30Fp6x382tB
	 KejWiy0DjaZXBq00N3f/bEKQmu2lI6ov4eCus5wHj+Bggz7enMlrKQd2Kx99WqC7Hg
	 57wBm5WJpPWsg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 0/3] ARM: qcom: drop 32-bit machine Kconfig entries
Date: Tue,  6 Feb 2024 22:46:17 -0600
Message-ID: <170728117673.479358.10461724344516754087.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231216162700.863456-1-dmitry.baryshkov@linaro.org>
References: <20231216162700.863456-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 16 Dec 2023 18:26:57 +0200, Dmitry Baryshkov wrote:
> The Kconfig for 32-bit Qualcomm arch predates DT and multi-machine
> support. It still defines ARCH_MSM* types for some (but not all) 32-bit
> Qualcomm machines. The MSM_IOMMU driver has a strict dependency on one
> of such kinds.
> 
> With the DT support in place, this has become obsolete quite a while
> ago. Replace all 32-bit Qualcomm ARCH kinds with the single Kconfig
> entry for the workaround required to be enabled for some of those 32-bit
> platforms.
> 
> [...]

Applied, thanks!

[1/3] iommu/msm-iommu: don't limit the driver too much
      commit: 18368ee25d881981971fde430c7f33cbc27359d1
[2/3] ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
      commit: 85148df36835d6bbdb2e4d06a3322629e4bb12c6
[3/3] ARM: qcom: merge remaining subplatforms into sensible Kconfig entry
      commit: 99497df59427a11222571034afebf2f0f7f9a3e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

