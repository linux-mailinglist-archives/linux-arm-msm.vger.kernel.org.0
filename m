Return-Path: <linux-arm-msm+bounces-55153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD78A98CAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95DFB7A99AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50827D763;
	Wed, 23 Apr 2025 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giIuG5ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357F27CB35;
	Wed, 23 Apr 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417982; cv=none; b=NwBc6GrYe+PXebvllOAKjcx9Kz1XsAyUuFYLRv0KBdDrfNW6Eowi3cKCfaSO4kYKPShSgtZHglV9RS8lkOGpYoEJV8rxIQV5+41XuoFH8Xu8M5VXHrq28AQZMOpuyU6gb8SAb42w3DYkq8hX6lXkWoDGSdxxWpHWeUeOFKVceaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417982; c=relaxed/simple;
	bh=H7VKMi1sNJwxTo8SG7/FeJuv6rTA5vRu78DmE/SRRpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtC1LyXDORs1RdVD5JT6KE8N6EKJ4TiFZjLjkthapvY2OB6s8v8bX9dpTV8x5IFQZMmaAQcjOyUMfW/Gcd1kFGIgtPHioH2ruixNBPIz0ZbOzGWHOk/+TWghPxW6XErroq4nGbQekG4iVQ/f7jWElrAK7dd+6xQWoJ/iurKfeCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giIuG5ad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C6FC4CEE2;
	Wed, 23 Apr 2025 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745417981;
	bh=H7VKMi1sNJwxTo8SG7/FeJuv6rTA5vRu78DmE/SRRpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=giIuG5adOkPH/Qd76+yMAWa9Oybymk3YNx90OP6N9DZXuKiPVx4A7fqgXCrk/dwFL
	 yNrDY9Rwd+5TJlvyrG3dVgCAuBjyuoFDiLbADASmjVG+uG6PYzQ9NgU3JcuBkFfyAw
	 f89CxESqDfGFfnXd++QCeu0YLZoVknjRAH24IN3MzhlfSL5Vm8ibUahY6eteNRUK2G
	 r/JG5lgpvoXGLWIRDnUXSrjAMiBsl2pRrVvaEXVTComUNkE7y6nCvrDyKM1aNRmW8Y
	 RuUpOyU2LfVBFZod7i08GNYutPsAcdOx9rOCjIXlVSlZXq/caBfxQC9Mavdes3/Dcy
	 Gu7lCd4dtCpTA==
Date: Wed, 23 Apr 2025 09:19:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-sound@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Banajit Goswami <bgoswami@quicinc.com>, phone-devel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Message-ID: <174541797905.464695.13554645794793845850.robh@kernel.org>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-1-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-1-05d65f084b05@fairphone.com>


On Fri, 18 Apr 2025 15:13:42 +0200, Luca Weiss wrote:
> Document the bindings for the sound card on Fairphone 5 which uses the
> older non-audioreach audio architecture.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


