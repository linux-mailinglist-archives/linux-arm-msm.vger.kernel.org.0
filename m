Return-Path: <linux-arm-msm+bounces-80024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB3C29235
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 17:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FDA53B09B8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 16:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C846626D4EF;
	Sun,  2 Nov 2025 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p53m/ig+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B223B609;
	Sun,  2 Nov 2025 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762100660; cv=none; b=OQ1mMLnHr3dj4ZoTCgnKawhi3EjcLI2vA5wIL75/LkODo3umnZgXNP9iEf5x+pixnbbxWJb5jGB6w1pMnjfP6ddIU3p7yyIRo3FXZtO6oOeNOGtQgfhv3HTXER6ornljxyH2NMqJys/3Pg6YMXBIdC3/mKv8nWOupHOhAtKE3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762100660; c=relaxed/simple;
	bh=afjVgQdRvkfrNutYuwzuOPWeHt0icQysGk3VakdUmMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMLGrHTKb3DUrR4cxQcCj/NzQsqqilq4FU522VfrGwbnuQc9aaM1v7slLB4IL5qsfR+ojzIrSvddjjo6sbFIc8oFNBkobSRm4PkGHKdf/BQSih3keCTCQpWNmx5+G+VeQAstzYLu+5TG7ASWf8jfygpWbalJLo0XJ/bmJmQOgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p53m/ig+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C58C4CEF7;
	Sun,  2 Nov 2025 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762100660;
	bh=afjVgQdRvkfrNutYuwzuOPWeHt0icQysGk3VakdUmMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p53m/ig+40fjHg20GxS5WT0jBRT+lb08yl/SZKt8hO4Xm0GRqoDD1j6aaZgDS3pfx
	 lJWUOcvit613vnFLId0x3eF3CuqEwwSThOaBJkK5jr9MiRLJ39XwFaDjil8j2asr+c
	 w79YDdg74kNneZrDREyGv0bigbWluFl022FknNiDEw9tQZL2t+U3rg9KoGutkcq1mz
	 lN42oGh3quwmxH+hiojgnypDOKLDRmGXkDjgWpHWNDDVDnCWajyORFM720s1xVVXaC
	 le5mqRIL1P11OBYIoL+CB1p9fRroQiKxd7kbDAsAtCdIlp4YE2w4teXYBXYdWsRC3l
	 6kBYpWmbJlXhA==
Date: Sun, 2 Nov 2025 17:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	srini@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 4/6] ASoC: dt-bindings: qcom,lpass-va-macro: Add
 sm6115 LPASS VA
Message-ID: <20251102-able-rhino-of-triumph-a6aeb6@kuoka>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251031120703.590201-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031120703.590201-5-srinivas.kandagatla@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 12:07:01PM +0000, Srinivas Kandagatla wrote:
> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
> VA macro codec. This SoC does not provide macro clock so reflect that in
> the bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


