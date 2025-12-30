Return-Path: <linux-arm-msm+bounces-86898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A77CE8897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF59F302105C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588F82DEA61;
	Tue, 30 Dec 2025 02:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2wtkVma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298391DFE22;
	Tue, 30 Dec 2025 02:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061191; cv=none; b=qQqNPXh0U/jJS7JoUtFb20Qxw8mlSoLaYOG+H/YxlR/+lbfdy4I6Bfmv7CXKosP1vBo2CMltCkJ4CO3hD0rDbkVevTa10YYwpjEkzEHrLS0xRv4emmFRjDTAm2bT2QPTMDn9CKgiwQBSFl+sNxA31N7xmqLyDN71vOGjPrjLriQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061191; c=relaxed/simple;
	bh=AcEJsGXNVt3jmOn2Wqt08Ks6kV82blO/9BLT/+ASyxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKljWHhNFslbAaqgPb7zRcD69h2odn63ZiWLuUt+ol62SMLl7K1xjaRiqyJacKEU0tJSWcGx208cV7SMutO0IzdZpwX0firXcYh16s4YA6pXjMIB1L5lUgJ4OwZ8Ewqqc34+h80TXKJrte1hd9Dqdz/mpCLv3kiUxkx9+hqf9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2wtkVma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21F4C4CEF7;
	Tue, 30 Dec 2025 02:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061191;
	bh=AcEJsGXNVt3jmOn2Wqt08Ks6kV82blO/9BLT/+ASyxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2wtkVmanB+R5JP6REg0A3j986QdZtMIY4PlYNZYkPcq8m3+UrQ2YAxLdBoygV88S
	 pZ44D4dflJAajbVH/KDIfLi+MNQZzf57/zsDSMvusS6Kh/ufrKnTAQ8YenVJ90WhWO
	 zldN/6s9u9sHUkrUBG5Dpveh7CXdeOfay4o6bFkhnTb2WP86/MJ8M2OrE+tv0hLMEV
	 KYvM2a2KCU2H809IMbDiXVYWOOMq968lp/WDJuo3V44OWrhXVuXQZ1wys2WT53VfYf
	 u85RWbCunqYx20bC9hGn+eNoUudLqkLNoWVLU+Pxjm7GOURzp7qKrIfIFQaYBH6pM1
	 uSWV6YgylqS8w==
Date: Mon, 29 Dec 2025 20:19:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750
 ADSP from if-branch
Message-ID: <176706118935.3209824.5361129598208771094.robh@kernel.org>
References: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223130533.58468-2-krzysztof.kozlowski@oss.qualcomm.com>


On Tue, 23 Dec 2025 14:05:34 +0100, Krzysztof Kozlowski wrote:
> The binding for SM8750 ADSP PAS uses SM8550 ADSP as fallback, thus
> "if:then:" block with "contains:" and the fallback does not need to
> mention qcom,sm8750-adsp-pas.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


