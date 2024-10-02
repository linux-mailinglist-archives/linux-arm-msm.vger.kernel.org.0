Return-Path: <linux-arm-msm+bounces-32924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFC98CD14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 08:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C946A1C210EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 06:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F50383CD4;
	Wed,  2 Oct 2024 06:22:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82584E16;
	Wed,  2 Oct 2024 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727850157; cv=none; b=uLNWIhZFzSIES+anEmqu3STNZ5npL1ZS0ilb5di+sDTT6/xMbuhVaCXNYObooenGqWs8hbDLIrjY7L9Y6ZSh7dFHyBa8Tw9K2DcUsGMwPiGLuKoG215MjR6R30WvmBC4O1diLEKCF607aCztabAep51eKwHRUuN30H7QD7FuPzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727850157; c=relaxed/simple;
	bh=qhtMKLfMrHWg7xcq22fCBHpt4Xx3c2YhTdS/dFAoA3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgJq3TiiV7CwbwkzlODv6zufT7bXikFEW6PT/ckh/ClykH2uZ8CrEVjgJATostvmBvX7Cyz9+vKlinlYZhPYzJGTcWsT4GCZhGx2tSCrToL+ZWk77ZnkhOjpVF5hambrmlAifYaBiNAnEK7neCQRAzwrr2AUWwx4MfX57whK9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616CEC4CEC5;
	Wed,  2 Oct 2024 06:22:36 +0000 (UTC)
Date: Wed, 2 Oct 2024 08:22:34 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	dmitry.baryshkov@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: qcom,sm8250: add
 qrb4210-rb2-sndcard
Message-ID: <wcrkdgri4o3v252dzdimp2qng3zqlthynkozodukuxecm6k4tf@bglumhiwiwri>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-2-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-2-alexey.klimov@linaro.org>

On Wed, Oct 02, 2024 at 03:20:09AM +0100, Alexey Klimov wrote:
> Add adsp-backed soundcard compatible for QRB4210 RB2 platform,
> which as of now looks fully compatible with SM8250.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


