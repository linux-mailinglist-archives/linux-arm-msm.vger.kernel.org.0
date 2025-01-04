Return-Path: <linux-arm-msm+bounces-43925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD8A01177
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 02:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ACAC7A2078
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 01:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C7270807;
	Sat,  4 Jan 2025 01:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="K5uR50Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E86136A;
	Sat,  4 Jan 2025 01:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735953296; cv=none; b=egawDtHWXpqKHj4twLFemRn5fXieNqcPtdxbABKji/AOM/+U5LpeTmcCqIORG4E2dypFzU14XMVAasS2g11luIjggw1aTLZ25Ce5spUG3XzOFvZU16FB1Yon/2Y1Sf3CBtcdCL+lLEvIt08iT7W5mrJvPSevMHClFo6GIt7QpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735953296; c=relaxed/simple;
	bh=jBAK/wnADkzx3i5iKVMyzSwnmLBerfrM3VkjJedwGoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBUKwwCCT25oRYB7a9CzcOSZL95we2O4tIAI8gdAFdVR8EAjfZPyhLl/yak3W7W0M0l31Y3sHRSyTO1rSegxLid+sWec9C4XUdjkKeoXeU6gYslcRK/xGXqPXQlhpjohTLl/eA3IZU9wNJzjEesXd3brTm5n1r9xD0CrG+MgczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=K5uR50Pk; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZUy8OstUZytwAKEpOkUdbXFsghBvcj1EsdaEZbSbXds=; b=K5uR50PkZPEii0Hxh2ySCYxzGj
	16qZ3hZVdwa3DQEVNN2DnrJw0DIZyf8Ed0L34AkfnN4npyFe9vkN4UbUzFC5ENcNCYrJpfSS1aW1E
	HTHmb5xPjKwnDXEuugFz/OI+iAW8/+GAa+jyUGWedUwJ2a0PvJOv3QhujfkKzW0wK3FrX8I9sHC5+
	RQAKY2RbX90reWM1dhXm9QSyulfQd3PWSsAsmAPJgxD+eXrk/UL0A64wa2uduLQOxlMf8taFC6yPs
	WQDQfge5okdmbYQCwattbfRtsFqLwPDwIHqkTvU7rX11eo1bNx4NmwJbvnum71p3/5uYHhQibLQaa
	RT4qQnjg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tTsXe-005faR-0l;
	Sat, 04 Jan 2025 09:14:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 04 Jan 2025 09:14:46 +0800
Date: Sat, 4 Jan 2025 09:14:46 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com, quic_mmanikan@quicinc.com
Subject: Re: [PATCH v3 1/4] dt-bindings: crypto: qcom,prng: document ipq9574,
 ipq5424 and ipq5322
Message-ID: <Z3iLhrLgaweVF2zU@gondor.apana.org.au>
References: <20241226114500.2623804-1-quic_mdalam@quicinc.com>
 <20241226114500.2623804-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226114500.2623804-2-quic_mdalam@quicinc.com>

On Thu, Dec 26, 2024 at 05:14:57PM +0530, Md Sadre Alam wrote:
> Document ipq9574, ipq5424 and ipq5322 compatible for the True Random Number
> Generator.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v3]
> 
> * Organized the device tree binding changes in sorted order
> 
> Change in [v2]
> 
> * Added device tree binding change
> 
> Change in [v1]
> 
> * This patch was not included in [v1]
> 
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

