Return-Path: <linux-arm-msm+bounces-50692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F0A57949
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 09:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3160B1707E1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D710C1A83E5;
	Sat,  8 Mar 2025 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="UD9yISUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F71A317B;
	Sat,  8 Mar 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741422747; cv=none; b=DApzgo7QHt709io2EJiiVTmOTZHeVeeDja4ZamEUea/R/Pn1utxAK1g1YrTm5m+irJoTjouQt5bYch2xn0di8XReKb3aTupkZA8a/CTRTSqqPKA4718DW69qFIj/zEPBN07sNRK4lOc8FNsvit//fM/2ooZLD+VlSIkm/aEYVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741422747; c=relaxed/simple;
	bh=1UMfJLarVfNnAEQ3Uf796b6RsF2vGNpbCHQA71Avhbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vC3xjP2RtrQVdGMnV5rpcKJaHH36qFvKQpqOGQ9Rhn64kGacr0q11szRqlhnSTGEZ71RzISrx319SkYPJCzSVc1eSFlMMqa37UfVUWaVPuOzwB4BsPlP86TNQZ28NS0h8n0qjwBmnifH+oMY1LvU5dAZjkm3+2nth6eG9tGtY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=UD9yISUk; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/P3F2fhOzADjkWsQMCkbdv/62DvmIAbanNv+LSzfUpQ=; b=UD9yISUkAbyL/TW+rLkAgJRcSl
	nvIYikifiKbHwtP/r9KxIUyJjl7d3WLIqKXs3ZrKc28z8IEs0KqWHxcbt20bGmi1XzWgpAfHszZkz
	H6d7wM/FrE78bRK/GCS6ZJLG1VUi8yjjUP79stCk9Gm1yd5QKFcih2hXE79//a6uutDcGbauAz437
	BFeluCiQD6O3BFPIWKVgejd180AbYRbKVOa2h4QM9mv7RY3wpQL428FSgeVoKAnIMUsBfEZHJRZsm
	sVZy8uxCKmyDmwL3Rg42YNw2DQy7V7UTG4XgeixN7Yp/MRIRPdWwGqzXVJ8rwm6JxUWM70XezwFtK
	c7FTWWJA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tqpbS-004ofG-2l;
	Sat, 08 Mar 2025 16:32:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 08 Mar 2025 16:32:14 +0800
Date: Sat, 8 Mar 2025 16:32:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: qcom,prng: document QCS615
Message-ID: <Z8wAjlz4aQcFJkrF@gondor.apana.org.au>
References: <20250228-enable-trng-for-qcs615-v2-0-017aa858576e@quicinc.com>
 <20250228-enable-trng-for-qcs615-v2-1-017aa858576e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-enable-trng-for-qcs615-v2-1-017aa858576e@quicinc.com>

On Fri, Feb 28, 2025 at 01:45:54AM +0530, Abhinaba Rakshit wrote:
> Document QCS615 compatible for True Random Number Generator.
> 
> Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

