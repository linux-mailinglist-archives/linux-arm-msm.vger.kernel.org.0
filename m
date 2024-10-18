Return-Path: <linux-arm-msm+bounces-34860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A29A35E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E3B282207
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8AF13B2B8;
	Fri, 18 Oct 2024 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSdBCTCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76EF2905;
	Fri, 18 Oct 2024 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234027; cv=none; b=bwQmeLK9K8nzDhqyeLGbY+9zd2gcylZr9ofY1+TnOSifQWKt7zSY8m6MFNlDWB460w/FEH9qQhBgQ5RJjCrMpaLpZz9pNuT61SC8YVVnz3YAqP4V5WlEHpAIadDGU1HQdhTHkVHViKv0UxVfc9pFfL6cRBWHdY10V97Z0vuHofw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234027; c=relaxed/simple;
	bh=gX/IUdt019KD/c4CXMaU9npLiTa913XkU7TUHcAFtGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tytz+9Nk9Na9DdbAOw67rsYo/9CZwa6iefsT2b8pmyHqYeBzq2SRaPLk8iS5kb3WgNCpnqzgCFtogi6lUVKJUWPVBxVSOFZbBU0lxC8sif7O2zaB+aMQIYjRYQxjwY2nVU/zuh7HHFatHv3HF/wVd02JKLGC+1FdPLsLTd+YNMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSdBCTCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA981C4CEC3;
	Fri, 18 Oct 2024 06:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729234027;
	bh=gX/IUdt019KD/c4CXMaU9npLiTa913XkU7TUHcAFtGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSdBCTChmwE5duojmw0KExeqdR/3QJowvX0DLhA2KMysolN/YhjYKSmxt14nbuRnQ
	 DHPEZhTGIP2oetu9RZCCGGg+PGGABumKzCygNa8GtxXnsM/GcBMELAbrnE6uM13bKg
	 Ux3dPNwkWLfQ5apdZwSaa2ndP2JbM/etDwbGj+RVLdnikl41DYT6HiSsYiYFwU0e8G
	 0yCOR3HFt97P0VGUaXUdxscPFl3GUvKUyATOeXuK6JyTNu7XHwr+UEeOFtU8ze9W1k
	 HB1zKwj3MBgDw6oPWv40UeX1jzn8LSjSEAxVWeEk/NHFa2BEhWJ7r+OnDZxIgLJg8K
	 Vw2iQhQFUckYg==
Date: Fri, 18 Oct 2024 08:47:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_sravank@quicinc.com
Subject: Re: [PATCH V1 1/2] dt-bindings: crypto: qcom-qce: document the
 SA8775P crypto engine
Message-ID: <p4tp55z5ju36qkasqcdbeeiaw6lptqdokzembhvh6p53emtxzt@fb2w4gww4vle>
References: <20241017144500.3968797-1-quic_yrangana@quicinc.com>
 <20241017144500.3968797-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017144500.3968797-2-quic_yrangana@quicinc.com>

On Thu, Oct 17, 2024 at 08:14:59PM +0530, Yuvaraj Ranganathan wrote:
> Document the crypto engine on the SA8775P Platform.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


