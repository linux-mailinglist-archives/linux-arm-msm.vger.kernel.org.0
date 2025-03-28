Return-Path: <linux-arm-msm+bounces-52734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FDA74543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1826917BBB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9CE211A35;
	Fri, 28 Mar 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh+MpoWY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50988153BE8;
	Fri, 28 Mar 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150084; cv=none; b=jum9LNWCOv8XkvtULq1AAsBAN9dJKBK9pMqYOjHPfJCu2o0meHEElfOIumfKsW2FjNtFYVV68nabocBuhKdWJcv9LYMxVn4/zZywP6r7uPJ5YCsc+b9n7i6roOifeo8+SZQTHeZV4N1sHG3NXZeqnY0jNMoPYmz54B41BXpOwbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150084; c=relaxed/simple;
	bh=BqNkL+MzrJ4E66aQutWbJr9PwZVzHeNRJkbzjWPNEPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlFm87m9msZUzTLVyrq1GEUu9XwsJbxJ7cebMLxutkg6ar47Z6x+x0k3Z0b2ykoScLanlbhvFsbmJngybXslKgh63T2NLuV2M3NE45ks6/A+HAnz82pyk/MyjsSgWzPnKzvXMBnQn8uAQ7N6GIZByuDja0vFv3lERy5csaUmbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh+MpoWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D893C4CEE4;
	Fri, 28 Mar 2025 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743150084;
	bh=BqNkL+MzrJ4E66aQutWbJr9PwZVzHeNRJkbzjWPNEPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uh+MpoWYpWUXUm+B/JHwdBLnvZeLAE5t8mOwR4g30C6h55CEumnzjqNSEUaBoyplj
	 Agt/XRJfp54Ma/Pcs3Efi7MFKJqAyLRoAfhgaPQtgk2LsM4w/euvlcfd0fyc4uNPWl
	 ExLi0jmdLu2y8mwkkZbo86H98O9U4araD4KRIEXLyGG63CowhaU+WM4eiJADqOjFWI
	 llyV0N+XfnOeZn7Te9KNUuP7lz/OamVxNYPryGBADiFQjTfEm7XnbDL31FMfuAviHf
	 c7BE12wBCa0291EOXiqB62Bu3cmaM1BNU/Z/fKLwfLdm2bhvrPQ9J4eImXXKCFVbwr
	 T9eUvbyhRvj7Q==
Date: Fri, 28 Mar 2025 09:21:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: add CTCU device for QCS8300
Message-ID: <20250328-liberal-whippet-of-mastery-96cd9c@krzk-bin>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
 <20250327024943.3502313-2-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327024943.3502313-2-jie.gan@oss.qualcomm.com>

On Thu, Mar 27, 2025 at 10:49:42AM +0800, Jie Gan wrote:
> The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
> SA8775p.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


