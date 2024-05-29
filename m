Return-Path: <linux-arm-msm+bounces-20863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 530168D2A54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4C9D1F267B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7233215B143;
	Wed, 29 May 2024 02:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TD0Tlbhk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4415ADB4;
	Wed, 29 May 2024 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948131; cv=none; b=aPDotEmrXF4DpT0zlXkFeQJW5Y36+E5pAmxP9UlxfBB799Ssxq+tPoSsWvwFnalhIcVlkX7r39hOhcMBhmY9Qtao1FF2bbq2DnJkD3mIw3nL4pP1iabagoSYc0y9G/zlk5maYb2FaxBc5769oxM6sijBRAd+ihmd5JqpEq6pZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948131; c=relaxed/simple;
	bh=EqdTgYkceBoIQL8Pb8DuDRmlex5LCvLWvePTWZP5/DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YD22yRniTsRzqlT9/I7FUwiAp7gDuy9/7fcTCl95wZ6rmQqQyEXuT72S4CRPsg27Cx6ul/hNzzml8TYeF3EY47kCctwcRfcgh0rLBA4+Bhn76/sB78SxiwpZxnpU4ed/4RM+bkAzK45pBeQzPofPICsBRTbd/iwsliNARyXSMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TD0Tlbhk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A82C4AF07;
	Wed, 29 May 2024 02:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948130;
	bh=EqdTgYkceBoIQL8Pb8DuDRmlex5LCvLWvePTWZP5/DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TD0Tlbhk5FytrvtuSlWWohyS/fHrlhr1FwdMSCT0mZ66Fhj6xNOHnefUMNqmQ4yDd
	 DdKEZ/tzDgJqt+3PauhBV3TcRcLK+Hr3RHmxoY6XjHuI2fdtjuZitcFpzkrBmvleYS
	 c1ZFE2ZlpPkJoLvc7D/wGlV7sQIhkznZff6GN7ugC40D1O5nXUxcp5NJC4ghBXmwaw
	 90lKveNDDR1+2pGkZuWwuN3Lynw5M0GGEpcPdgcitE4ISfZng550n53GoGXdQa5VpD
	 NOwEWkE1BZ8vdcVNuG5ZiKuEDiVemhGKpvJfR7qIPDJ8EfzEybnN5xqxCp0bwgFWUa
	 LVzd8LaTFAkyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable vibrator on PMI632 + Fairphone 3
Date: Tue, 28 May 2024 21:01:50 -0500
Message-ID: <171694812073.574781.12341406388416596795.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
References: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Apr 2024 08:36:53 +0200, Luca Weiss wrote:
> With the patches to add vibration support for PMI632 finally applied,
> let's enable this for the PMI632 PMIC and Fairphone 3 smartphone.
> 
> https://lore.kernel.org/linux-arm-msm/20240416-pm8xxx-vibrator-new-design-v11-0-7b1c951e1515@quicinc.com/
> 
> Patches have landed in the input tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: pmi632: Add vibrator
      commit: bbb1dd6402f9c67ea00bc6bf0e2a01d71db4c7fd
[2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Enable vibrator
      commit: ffaa4b5d5d07aed600d82929d8862263ce341a71

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

