Return-Path: <linux-arm-msm+bounces-56060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D609BAA0666
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E55C840FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC2429E059;
	Tue, 29 Apr 2025 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7XTGz+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E42929E04A;
	Tue, 29 Apr 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917064; cv=none; b=bG47WioqxUn7+Ou+NNt7+v9Ya+uKBPL2ZROKayXDwM4t9LBIV7O4yXvR0f0sYxt6grnSmePfSb8kKkfjN48ZMobDL/0Ogmm9aLOIpW4khbdMEKdu3U8LwQwSCfz2N6ALtbACBq3MwCXV1wRlai8JBcTVK/WibuCoDgeYPn+txas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917064; c=relaxed/simple;
	bh=axarDXzssA2Bd+rC2EB5nm1vjnnM3xMlH6D/28yh/XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAo288+2NGuSwqZtt0UJeXI+3tqDBa8h/+PLHlwJGzyI6fxymAlTii1tyoiV1M5WTJdk2386d0Pm1VgC/nIpbVsvfMAat+KnJwvk6CndENCzOe0F0gozOHyAXsCgZDDTNxVJOulcgMZm2C3teELTlcskhpzaG1Ki0DQsR2Yqj24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7XTGz+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84362C4CEEA;
	Tue, 29 Apr 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745917062;
	bh=axarDXzssA2Bd+rC2EB5nm1vjnnM3xMlH6D/28yh/XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7XTGz+oWjLkIdTAZOrar6k05AHFuwkZnOU0BeVr0Wo4fhWmTmWtgkzRWDfMpcxsG
	 cGvT/CY2G8VQV1321ZXUfBdTHrma/0/T1aOklwgARzcUyzskEpF6HK20DeSBdy+Ja9
	 dtXf5NH9uUbDUSPeOe8R+oEta2w15gSRJBG4C5x46l+CVwCjE4tA9i99nHyZua3zTB
	 nIsh+3Ul8Pm3chDELttp0lp0CB9eB1PrvxFVY+wvKGBN/KpE3svCA/AYaX0lyxfryZ
	 X9DLO0kgR5OQUOwBa8Vo44O9mAa2dDHrCE1Jl5iO1V6BtABz/7kgZTMivWPofcnvdB
	 dKx9KarmAaakg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9gme-000000000ub-1OUg;
	Tue, 29 Apr 2025 10:57:44 +0200
Date: Tue, 29 Apr 2025 10:57:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <aBCUiIrg3oehMVjx@hovoldconsulting.com>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>

On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> It all started with the support for CRD back when we had different
> compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> is now figured out at runtime while using only the DP compatible.
> 
> It's almost funny how this got copied over from CRD and spread to all
> X Elite platforms.
> 
> TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> beyond X Elite to newer platforms.
> 
> Functionally nothing changes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (7):
>       arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
>       arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
>       arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override

Since this is essentially a clean up perhaps you should have squashed
these into one patch.

Either way:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

