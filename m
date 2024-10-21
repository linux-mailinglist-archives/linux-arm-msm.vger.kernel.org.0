Return-Path: <linux-arm-msm+bounces-35178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 128669A5DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B801F20C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 08:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E631E0DF1;
	Mon, 21 Oct 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdnT/bR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D21D12F0;
	Mon, 21 Oct 2024 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497623; cv=none; b=S63VdC45mXdEj/U4XbR/gwR6xsWuuBWXotLzcnkmmuio7sHtFoTItM4/HRnkQ2pYJ8llrjdA+f7x4WcyyIDgoRSFEBXKI0pMBx9DJPiN6JliEtD6VHGrxTmmc3+AWqhh6l5L5LIx5jpEWwDqVENBE3Lt+zel4Ew/wNvj0Dk72HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497623; c=relaxed/simple;
	bh=ga05R4mF6iabJVVNkE+5XHBBJIlXS6xjAWhnP6HwZ6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aH8v6lQ80/b8b/LGEaxLt171uueKPy8S9Vp6mqAkFJj90IeK6QQfRrHyNPQph5qG8r92xvt3ODcCEbUtQ0+AwuDpFv6HXBWUM8brLq4xQDaxjvjtSsUsmvHxad9+5OLPNtxUs7EkETis52hiDHA2M8Hj9cnrtBOHXTE0U8Tianw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdnT/bR2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F977C4CEE5;
	Mon, 21 Oct 2024 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497622;
	bh=ga05R4mF6iabJVVNkE+5XHBBJIlXS6xjAWhnP6HwZ6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdnT/bR2rHC8ef/+zLjltvpRYgqaSnlbOBqYejf5agUF/9d8SRlCOg4lS768UjIMv
	 Nsh2x+QQkQV/knzbMDyIBUZZghs+2n89ujlwsWVxAFcVDZhHIUdl4AOmTtxafcMOE6
	 dxxCc1MUyC5844FnnC4C/rMCS6lSxQtVNROGJMlvxwOiOY0o2YofKfTK3F4oezKa1Z
	 QeqXAotg27mjukejY2cqrXC6T0bCDU5lTb6NYz7UQB7h/iLn5/3hPd95j0dOQdNrW5
	 HtM4669G3ToTJmN2P4VjkDNKxqRI6BwqhnExjABCHCpScZdfq4J0k+c0GrZK/zkRy/
	 0erhK+xDC0o5Q==
Date: Mon, 21 Oct 2024 10:00:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SoC ID for SAR2130P
 and SAR1130P
Message-ID: <ykknmdqyoqpsdfku5swtk7brlh5fdoldowd2i3kpugzdd4old4@5vfiw5fzk24h>
References: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
 <20241018-sar2130p-socinfo-v1-1-b1e97ea963fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-sar2130p-socinfo-v1-1-b1e97ea963fe@linaro.org>

On Fri, Oct 18, 2024 at 07:32:36PM +0300, Dmitry Baryshkov wrote:
> Add the IDs for Qualcomm SAR2130P and SAR1130P platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


