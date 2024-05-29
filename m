Return-Path: <linux-arm-msm+bounces-20865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D308D2A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C1CA1F2B6A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135AE15B57F;
	Wed, 29 May 2024 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHKYa9xW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501A15B0EE;
	Wed, 29 May 2024 02:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948134; cv=none; b=LTpd07NaK+C53qkG/2zlql6tvGB7CnzE0BPJ7eAsmfhEAgrfQ7iHHXR9XqhIE6ukuH0NU5cucrP8wSNYiPfO2PFQ/57wCItZWzj+AbGlP3dPOH/77rYUZTKo08hLBCPSnPw8sSCSFm3Gy4YH69KnZRYs4sml7OOK/alDAcK787k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948134; c=relaxed/simple;
	bh=6wEr4j3nqrV3Xer+zYHvj/gdXXgSgZ5QOcoBvjj+iDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YscX9iVRFGwpro/JK0qM/vif1ucQ75JWllWvW5scFVQge7UROFmpXC6/lC3fM4dSd8i/9Tts7y0U0sXXbZULhHUxl8Yh16N4cT9vjKewQccT76YhHTKuaQ+uqjmvHsiinDB2UrEmmQNRVDr5KKJOGUQ9uh/V0ENLS9uUDH9oNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHKYa9xW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E97C4AF08;
	Wed, 29 May 2024 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948133;
	bh=6wEr4j3nqrV3Xer+zYHvj/gdXXgSgZ5QOcoBvjj+iDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHKYa9xW9fJs5D8XSB6pFDfJBcokOLNWhgM5hyb2xd03pAnHH3XVcNe1rT2+2o/AL
	 uafM9N1A5gSsUfF/oSVuh5gqnS3v8ZlcBUjKSBB8CMSGzDMtp14E1EfwV/ioBXbZ5P
	 3pCdwbQXeyrcCMn2G61Xz06ThlQV7ZrEwlO/QIzNt/lVaQvzE1OXmSEvewbQI8S1j2
	 L514I8rkl9i9WrWlMNynpcm5a51gTQp+rm8P3cDOv3BWJtUkQ/0W+slY7JZeHhD8Kf
	 /ICdyDCoMYw6Y7QtvQAViLWHpvzgboM4FMR3CCWlnfTVkkKfFXVRjRtI205h2mPEZG
	 7s6RbLbLFxilw==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 0/2] Mark qcom,ipc as deprecated in two schemas
Date: Tue, 28 May 2024 21:01:52 -0500
Message-ID: <171694812075.574781.12396513809519748834.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425-qcom-ipc-deprecate-v1-0-a8d8034253ea@z3ntu.xyz>
References: <20240425-qcom-ipc-deprecate-v1-0-a8d8034253ea@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Apr 2024 21:14:29 +0200, Luca Weiss wrote:
> The mboxes property has been supported in those bindings since a while
> and was always meant to the replace qcom,ipc properties, so let's mark
> qcom,ipc as deprecated - and update the examples to use mboxes.
> 
> Related:
> https://lore.kernel.org/linux-arm-msm/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz/
> 
> [...]

Applied, thanks!

[2/2] dt-bindings: soc: qcom,smp2p: Mark qcom,ipc as deprecated
      commit: 7ce966eb6f1288eb92bc2eb5df8933acee1ae6ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

