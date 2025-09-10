Return-Path: <linux-arm-msm+bounces-72970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8DB515C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6111A463255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4340B2512F1;
	Wed, 10 Sep 2025 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQJLQd2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136DF23D7DD;
	Wed, 10 Sep 2025 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503928; cv=none; b=STQAMk0g+lJy2Q5KGK3nIVN6OEdvlsd6B3FFgUpOjHLExdXdmnLDnxDUIQGBmgoeEfxOir9G7yTS1nI1zJSMSNDNUf0RTOnqfJzNufg2E9BoXZXPaZV4W7igbp9PBg++BZsajggpSQWGETuGQVN1jcqWAo0A/0W7FMs7TL4VXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503928; c=relaxed/simple;
	bh=PXg8c+/ZU7itk4XjCn/ErjOPDbewAs+KaaNAF/jBlz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiDZiSTjJ6V6l5PqWuArViG62R1sP25bGZfFjCEXKpgt2JnKaE84XGWOJ1QKdW3Z5wXsfFMeZ3zVr2Mg10TbOxAbteAp7W3rVRdDHn70imDU7QErNLqzK3eZaZfwWmu0/TG8rozkYX+L9rGpcWJwITWNtOEzJjDjCeJgI8dF8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQJLQd2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C636C4CEF0;
	Wed, 10 Sep 2025 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757503927;
	bh=PXg8c+/ZU7itk4XjCn/ErjOPDbewAs+KaaNAF/jBlz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQJLQd2WDZPRYCRSzQO5Gdfg3EGC0J7ZP+52XfwIlsarvqvRM3mRgv7+wOEgvKg8a
	 y1DdLsRX+eM2jTSSdmtkn8Afp4i4RCmakVoJgy7xj9WB61F6Nw5dmApAsISOZXgsaB
	 NWBISq9rIeHOzzVMzAMMjVo0/bp8JU4p+Fy1Z0oBff/Yao/0VZAgxXlippzCzQ2T+T
	 58speqscfyz4yV60jqzfbW5whcqJPmkGHe4GbUWd8xQKJpPDGFjwmKrdZ/qSu+ZTbm
	 LA6cDxhCtCCbosvgRjP8XfqNA2n7c9DUgiLLjzMHTgqWly5NeB7yejjebVzxs6YqBk
	 q7tBOHSz27CDg==
Date: Wed, 10 Sep 2025 13:32:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add DP PHY compatible for Glymur
Message-ID: <20250910-obedient-ambitious-oyster-5efa6e@kuoka>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-1-02553381e47d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909-phy-qcom-edp-add-glymur-support-v2-1-02553381e47d@linaro.org>

On Tue, Sep 09, 2025 at 01:07:26PM +0300, Abel Vesa wrote:
> Document the compatible for the Glymur platform.

And it is not compatible with X1E? Say something useful in the commit
msg, instead of what we see from the patch contents.

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Krzysztof


