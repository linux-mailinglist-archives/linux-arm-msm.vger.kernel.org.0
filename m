Return-Path: <linux-arm-msm+bounces-24097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67385916764
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B96A1F25802
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 12:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E0E1552EE;
	Tue, 25 Jun 2024 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="UC8g5foE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFEE14D6FB;
	Tue, 25 Jun 2024 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317741; cv=none; b=LPDfQzHjPHQYMhqMICeC/svR1FecxUjQHQPcz9INR/FMjBkjv5KZB5tYApZw9spjGJmCDn2vmuKzZAOxyHYmYDkjpOi5VHDNE5FWoKBgkAMJF2nuSTZ1IG45FgZ51z22IIi3L9Rtr5oDQvXVxrB6omt9XpS3WSeK4iu6l+M+guA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317741; c=relaxed/simple;
	bh=wQ0Hy1Iyom2IEtqGIwpWSkIQCooAFwOuo7Hz0l3BwUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqXXQtyRfCY3KlgDfjkhcnG2F049tsdflWKIUPB4OwWNFsDN9KBEIldpl+7f9l5moCk1DHcfe3BtO8Z00QqGDxL/96N/F3T56Az6HCOsQ6KseWNC6eXkUf8t0haK9SpJUr2lt4ftbNhYqU6vZ8Fh5Vjao4ySKMzQqsHm0HcSJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=UC8g5foE; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af01e500c6341f51fa179db0.dip0.t-ipconnect.de [IPv6:2003:f6:af01:e500:c634:1f51:fa17:9db0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7D2F01C7B21;
	Tue, 25 Jun 2024 14:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1719317738;
	bh=wQ0Hy1Iyom2IEtqGIwpWSkIQCooAFwOuo7Hz0l3BwUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UC8g5foEUzJspXBOKG0hqkXQiZIJIcdKoDuEkbLoA35oqBOx9SQoACrwKENubqR6F
	 nnbqVs69XVM3AxV+/CIRXZmBecoIIIpg2jbtWoR8MBUpnUoWe//fA/++gFGU38Lb54
	 jsXUHy31NN5mUA/Kh093dUMwPBfCm7KdwD6uilNIsAaVLpKIroibTPOwIBG6MtHzjy
	 rvTY4/BKHnJyzmMVS/CsXscK1OFvJNGQxwdie/nEfNX6KaS+sN0T1dYqSODygrcQsv
	 GoYKEhkB5Hdej6GBq5jR/rq/xFkVvfWhgxEmFsdTVvcFjsl06PbtjyGaN1OTvcpAoo
	 sYZnrzfWcg8qQ==
Date: Tue, 25 Jun 2024 14:15:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: iommu: qcom,iommu: Add MSM8953 GPU IOMMU
 to SMMUv2 compatibles
Message-ID: <Znq06eg_UBXEImGL@8bytes.org>
References: <20240606-topic-sm8953-upstream-smmu-gpu-v2-1-67be88007d87@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8953-upstream-smmu-gpu-v2-1-67be88007d87@linaro.org>

On Thu, Jun 06, 2024 at 03:15:12PM +0200, Neil Armstrong wrote:
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

