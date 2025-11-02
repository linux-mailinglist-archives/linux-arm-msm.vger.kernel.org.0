Return-Path: <linux-arm-msm+bounces-80022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9BC291D2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 17:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CFB44E787E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 16:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD1E229B38;
	Sun,  2 Nov 2025 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozV/egWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A8EEBB;
	Sun,  2 Nov 2025 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762100511; cv=none; b=TNh0Eb9y8/MXM1phnexQxv+CVv/Kef2C7PdIZnywoDbWFLvvGRlfPBb128EAccXAw5RmV7ajLVI6xCblHT4BddKOsPO+PFWNNndboagwEvHQdsKNK0HSX8J5XDezlBtYmdmBGggDJhJaTKNKoMHDIl6BRQwiSexL86xs7HfLH+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762100511; c=relaxed/simple;
	bh=gXqeffdC8YCM73WvgyFam5X3GEJR3b/ZWga15myZ0ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTVAHFmQJ0NYE6r3mesK3otAE4V5Kj/aSJlPXc8hy+4qTVSyBz1GJd6oDg9SpQiMFYBHiwkOBRAHH34xAfKmM/jH/QVdnIlnd/SiM/ro2yqaHEKN1YJSGEsNEZcgZdDmSp1J6zC/OrcmpojhoL6BNDR8+aKI/B6JurDFh3U0rC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozV/egWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061F7C4CEF7;
	Sun,  2 Nov 2025 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762100510;
	bh=gXqeffdC8YCM73WvgyFam5X3GEJR3b/ZWga15myZ0ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozV/egWwWWjEgttFFRrDHfN4+CI7z1KSbwsf8mTNn5O6nSJZsOY5B5UakhAU46dtz
	 K2liNHU/UTW+Cf4d+gcM2aD2g3u5b++oyAHPyCkKYaIISLbk8usv470oQqCay6GKGh
	 UdwG/a06A64/GC9+D8fQUei463UfxyI+q9zVMHmvw0dqWs3fQISZdFoeVOyMhL0jZC
	 fi9CW6UcTUlTpUKx4DadW8u5g4T1iXi8BzvAF/mOadr3mEvgb4kkn9red2IMFm3qmJ
	 ydNFHgE6XrYAyObtMWW1xFpoUtp/Z9p8+ttHrambma5JOUF9cPXaJneR97ilv9dZuK
	 50bSSaBs9IhVQ==
Date: Sun, 2 Nov 2025 17:21:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	srini@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 2/6] ASoC: dt-bindings: qcom,lpass-rx-macro: Add
 sm6115 LPASS RX
Message-ID: <20251102-glaring-cooperative-woodpecker-fdcacb@kuoka>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251031120703.590201-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031120703.590201-3-srinivas.kandagatla@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 12:06:59PM +0000, Srinivas Kandagatla wrote:
> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
> RX macro codec. This SoC does not provide macro clock so reflect that in
> the bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


