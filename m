Return-Path: <linux-arm-msm+bounces-35563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216B9AC130
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5072850D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD952158536;
	Wed, 23 Oct 2024 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SI7EUNMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF950157476;
	Wed, 23 Oct 2024 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671184; cv=none; b=dPv44tJgbFziUVheTqtFzkwbjZ88hHRTBsj1XscCrUir7IlmcAMzeI+Be3KxT5Q6Bw1XsOIyDZEmBiC224MqegagyxDpKfZFsQI85GhcHO4r2rmI8xFg26bnqCTJzPfliR0TePxs5K+ubz7kXFa8OQpppYI3HIVE4Qkh9l0Bxds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671184; c=relaxed/simple;
	bh=8J3YAEI5ymgvph4zK7ncOEzXxqUjFg6dl0aEFe5PEnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqpm9uDysi/Eoz+DcE9s2KKUjrmRE0WauOds8H6g4SMng+6//+mPgw6tyaC9fbgX1sKewKROFkP9W38yGWZHUSa4Kif8cnu/uHyPl0wzOA2awqoImYOz62Yh2AVnScWc3SwESHEAV3NwAeMrS2YXp5pLDhB7h7ueHs89SWqR+rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SI7EUNMh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E512C4CEC6;
	Wed, 23 Oct 2024 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729671184;
	bh=8J3YAEI5ymgvph4zK7ncOEzXxqUjFg6dl0aEFe5PEnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SI7EUNMhGFzmfewIPepR5qWd9AqqoNWb1gJzE8lSrd7sX0RyCPnhDis+fkKxor6B1
	 M3r5erW4QFpCcFXPxd+xmWmz4Y4SqO5F7H4pcP1jFHgPFy/SCwonjO469JWO9O4tD7
	 +uxd429C4/QiKy9eZNjeo8BwDvfwsmrFAUS1ONj6eaBvc3f1Om8ANnYEMVbv/Ziqxa
	 QrrGQ4VnVFVnB/mUAjV2mCTMpopzE0/ruY4tsyOgCNzbJd9hA9IeCry3uEmHb3KNn8
	 BkSY6p9pU1MEbrLKcqaHkSIUE/QwdrGYk2T+mmwsfJAWSzBZ4nH/oWAq7Jd9HkHqCI
	 6g9mvcK6rbrOw==
Date: Wed, 23 Oct 2024 10:13:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: document SAR2130P and
 SAR1130P
Message-ID: <u5gsyn22qm2syhkp3gdvvqasboq3jjybpkrsrxiisekqgpjbm3@gdawddb4kt7f>
References: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
 <20241019-sar2130p-llcc-v1-1-4e09063d04f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241019-sar2130p-llcc-v1-1-4e09063d04f2@linaro.org>

On Sat, Oct 19, 2024 at 07:26:41PM +0300, Dmitry Baryshkov wrote:
> Describe the last level cache controller on the SAR2130P and SAR1130P
> platforms. They have 2 banks and also a separate register set to control
> scratchpad slice.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


