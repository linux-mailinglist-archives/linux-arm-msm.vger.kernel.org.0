Return-Path: <linux-arm-msm+bounces-33355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCC992A1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707FA1F213DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26E2199225;
	Mon,  7 Oct 2024 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwqiPHBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31CE18BBB2;
	Mon,  7 Oct 2024 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728299976; cv=none; b=p89ldqyRQCZhVb+a/KwmcpmE66rXo6nqwbnlTPgNnqt4k1fzMQotfEplLhi+Ex1T6GcuaFryvphrDCUQ5PR/W+ELy+kaIpWuxzxisjnMm/9UmY27r/+M0aub19eiGk4lA/eO8wHqUbqtSXm7XG3k2ubNvTEzZmHVKRbVmv8dEiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728299976; c=relaxed/simple;
	bh=H7HFbdmfpLnACdEpvqjRNyd7qDDx8lOaxpdXXTZzVVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIavI/z2nDNTs/8CMBRKzG7wKQmOER/nagmXLno0d5/1Bh57ft7xWS8J9ToNF8ZV5FVdnnSgj63+Uhz0gAJITvocOa4k3yqKP6gDJ8ziukA4geIAjwNAq6LEWOHtqDre1NVy6emZR/r3+0JZYPFpSzgZkJrXXuuhbqME629ifkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwqiPHBl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DF5C4CEC6;
	Mon,  7 Oct 2024 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728299976;
	bh=H7HFbdmfpLnACdEpvqjRNyd7qDDx8lOaxpdXXTZzVVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwqiPHBlt9pOlT7HGr1tMP8O0N9W926x64cRkQ2Nr+xM/HXjkyAKfCUmp60iqIJGr
	 ZDwldHNL9cVzEktT/OP4Ea91xKS+F3L+pulIjYhi0BcikhyUdUSVPoFrUExhJxbnSi
	 EtwpVeubFr2lji3qD+hLwVuqyztoQTTe9Whn4lP8489+6hksfjKcKSQgTo6lKwiff7
	 R63gXK/R9azYdLZiocgttMQZBo6nB02vVo4xNNSMqJr4dVj2S1pRJgZ29IIpXyC9nH
	 ZCMb/8f//UmUMvcxh/r5gXsgCW76xzUDHxbabwBFiPiSxi/UmVZhl7O8InhFnX+sJ+
	 rwF6uyNkG22tA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sxlm1-000000007dd-3eC2;
	Mon, 07 Oct 2024 13:19:34 +0200
Date: Mon, 7 Oct 2024 13:19:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
Message-ID: <ZwPDxd9JJbgDeJTi@hovoldconsulting.com>
References: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>

On Fri, Oct 04, 2024 at 12:06:33PM +0300, Abel Vesa wrote:
> The PCIe 6a controller and PHY can be configured in 4-lanes mode or
> 2-lanes mode. For 4-lanes mode, it fetches the lanes provided by PCIe 6b.

nit: I still think you should use "uses" over "fetches" here.

> For 2-lanes mode, PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2
> lanes. Configure it in 4-lane mode and then each board can configure it
> depending on the design. 

To avoid confusion you could avoid the word "configure" here. pcie6a is
a four-lane controller (and PHY) that can also be used in used in
two-lane mode, depending on how the system is configured and this can be
read out through a TCSR register (e.g. the PHY driver adapts
accordingly).

So you should perhaps rather say that you are fixing the description and
compatible of pcie6a, which *is* a 4-lane controller, that can also be
used in 2-lane mode. Or similar.

We also discussed this here:

	https://lore.kernel.org/lkml/ZtG2dUVkdwBpBbix@hovoldconsulting.com/

> Both the QCP and CRD boards, currently upstream,
> use PCIe 6a for NVMe in 4-lane mode. Mark the controller as 4-lane as
> well.

> This is the last change needed in order to support NVMe with Gen4
> 4-lanes on all existing X Elite boards.

I'd skip comments like this, or put them in the cover letter, or just
rephrase as "This will enable 4-lane NVMe on...".

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Re-worded the commit message according to Johan's suggestions
> - Dropped the clocks changes.
> - Dropped the fixes tag as this relies on the Gen4 4-lanes stability
>   patchset which has been only merged in 6.12, so backporting this patch
>   would break NVMe support for all platforms.
> - Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org

Patch itself looks good.

Johan

