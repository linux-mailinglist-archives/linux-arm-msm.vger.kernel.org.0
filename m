Return-Path: <linux-arm-msm+bounces-78627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0143C026C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 18:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6A43AD4CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082692D3A69;
	Thu, 23 Oct 2025 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow5itVTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B792D24B7;
	Thu, 23 Oct 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761236583; cv=none; b=Da3F35HM/Qf1EEXxG4EHJ01xxWiTHGnsUpFTjG/DfJFS1Id5kEEpx8uIhKRVc7KJ3vxORp/ctOPyix6KwLlkjk99vwe6Lh7+6G0sZoATSSqegJvQtiRjgy1qq9MPg4qvkWAE3AkhG1hWOsmWkqbtGxWN6r4tEtPwxQbvfdNIjPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761236583; c=relaxed/simple;
	bh=9r3j3AdTVU/kmy3Ei2mYw+5H98mhIV0hwNGa4uA1cuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=awa0pTuzMXuUF6+Tfci564qaZ8XqdL193DKwsIIanqPuv3XWXOw3YUxd5fxhTCkaE4q5rh1TfFWS/ahRuJpX9IMLdFEAfC6jqGCaw1L8Z7+edayJc5EYRyTZ7cC9NRGxIHcoKF8c5H15YuDqlBLDkvk8fyb/0qTXVM+Fg0R+6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow5itVTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16A4C4CEE7;
	Thu, 23 Oct 2025 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761236583;
	bh=9r3j3AdTVU/kmy3Ei2mYw+5H98mhIV0hwNGa4uA1cuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ow5itVTpWEXEl5jGmJPSTd1he04pO71nS4NsNyjILWkXtafwP815F24tCakR/horx
	 v3gt5FRJy9ROrIUIk03zAG9dt3yKDLC8topbduMH1ZEC6KJoWapUdi1Hz4btffjbAh
	 fi8nnvdJQkZISDjYFcNkAR1yYRaVlnzjVVsVGUqTsg91Zl1JM4YqfqPGovHLRtBi/u
	 QagBn7cocQAMbxdo2KJATVif4LydD1hq0TcUv9+cfd9eeHUS+x2jllsSTkDKHwn+c4
	 OLDtDOI3FFut1iJVCWlJ1NkXen9kQsYfe3eeQ8PZuRt6+9ZroHmOt8qvu876UyEEcg
	 hXcuQxKaVHDbg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
 yijie.yang@oss.qualcomm.com, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com>
References: <20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Add rpmh regulator support for Kaanapali
Message-Id: <176123658056.145979.6028101761014548543.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 17:23:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 24 Sep 2025 16:30:46 -0700, Jingyi Wang wrote:
> Add rpmh regulator support for Kaanapali by adding PMR735D PMIC.
> 
> dependency:
> https://lore.kernel.org/all/20250916-glymur-rpmh-regulator-driver-v2-0-c6593ff9b4be@oss.qualcomm.com/#t
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: qcom,rpmh: Add support for PMR735D
      commit: f76dbe127f1b5910e37dfe307d2de5c13d61ed89
[2/2] regulator: rpmh-regulator: Add RPMH regulator support for PMR735D
      commit: d054cc3a2ccfb19484f3b54d69b6e416832dc8f4

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


