Return-Path: <linux-arm-msm+bounces-82422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 458D9C6D0F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EEE54EEC38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636312E4266;
	Wed, 19 Nov 2025 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFd35Sdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D192BD033;
	Wed, 19 Nov 2025 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536610; cv=none; b=O4t3IrkwP9k6tkuUAPNt1KbymzcDYUMyRXE4fcR2pWJFrIXCvGfzehqScQ++e7dSk2gas34VhalLnQNrLLElkBxozecBXGrFi805T1M53sCxxbvFPh8Z4f/EE83mzQ9rDJxT6RkNcYziQNQ9IYinT4ZoP2/Yk3Uu4kn9OJSNytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536610; c=relaxed/simple;
	bh=K6fBoYewA0W2GUFp/TEVvPakFM7aTKgK3hNCpBa7nNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S86fRG+opV9mHvpgSb/KECdF94ZVqa3o2+Ru9cFZUoEOx4zC8jMi1AnNGkMltkwQBhC7EdnpE1z3JVqU0D3Ll1cgjIWIV9yA+cOKAbn1B3atrlCft7myoZb56unLaxzKZNDO7rc9TxAjA+drmst4OxQQJE2NWEyr9NT4oLmtZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFd35Sdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E4FC2BCB2;
	Wed, 19 Nov 2025 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763536609;
	bh=K6fBoYewA0W2GUFp/TEVvPakFM7aTKgK3hNCpBa7nNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFd35Sdp7SsVOFRkacZi4ILA4NnIPtHKmU/DA7ZvBkQvHrz9TMCkcu0lQz5nbfREY
	 JnehFsKbRk0OdEnfHu1EGhSh+YluFD3hUliVo7nmqioo8gtnPY9Ld9nAtGPdLYYPMp
	 LdaKqhxYWGo47fB8VXp9sCRr1ow+cnOvQnLgIZvA3hE0foT14RpLJ+GW9duIqqRPvf
	 2n/p06d00BTLGeTh1LdGybbada7/oXc3w++50v3mU19S8zOX425OnlRYJWzLehT/L8
	 Nq6eFYo5D3QCE7tRfFrYzj7dBqo0DT54aDNSq/eRMza3CpzjU/0Sgz2+EoRstsn+PF
	 GA7VOrmEPn0lQ==
Date: Wed, 19 Nov 2025 08:16:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
Message-ID: <20251119-loyal-aromatic-lionfish-c56c22@kuoka>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-1-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-1-317a2b400d8a@ixit.cz>

On Tue, Nov 18, 2025 at 12:30:36PM +0100, David Heidelberg wrote:
> Document the bindings for the Pixel 3 and 3 XL.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


