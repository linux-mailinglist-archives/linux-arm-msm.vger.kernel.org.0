Return-Path: <linux-arm-msm+bounces-48840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F43A3F036
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 427F3188898B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD52020469B;
	Fri, 21 Feb 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="JhScgHJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183E7204698;
	Fri, 21 Feb 2025 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129889; cv=none; b=k2Poo/Eb2Oqu+sr+dcZ1ED/N95zpMvqgIXAODGcUTIb9hFpVSK47hkPvtArIs6GEuufnrHBMx8ZRKbTwX6NAiUcjurRreqV7a3i1EDV5W6dFHFxfX/AGvxHSZ7Al9cMdVLJZh1SBN56CgBei0K2NvmYB8sTsAWbubq/KsIqtWqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129889; c=relaxed/simple;
	bh=AAhzNWrchG+hGSr4mhaPtLJ8UhuPrFonFRtyi6ur1gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK7fyuB5FmLJWebcOSGpjvwjqYGWl43PJ3dmTpfecmSHrWWVjcGEUiemxpPWlqUXGban3s1cHxLu+Ax1MSHEAeKgXhe5DgHgIfrUMbaLCZKivwEqFdsRIaIMoo+FNiWpd41+9H30DovXvAlWZ/dkNB/D6NbWzOvd8OAKSfDJ0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=JhScgHJj; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Mqh+2C9vWGF8WY8llBEoQCvJjWOvLlDot1UeDn21GSQ=; b=JhScgHJjQZ92VvtWJHB+Y0dZuW
	4ajt+o6OJ5pmetH0E0ul2Jh5Gw/1Qc0QY3nl3PJgqeOv+Uxf92o4mAipPC3F0oqy/Tb5g30D7U/QP
	1wJET/O7KBzaah0j1Uql1REGHvAE7uZ8ot7u/fnjxTPbrTAiDGWwpe5p/oJ/2jDOPq2+u69YdxeBg
	TmMPisy1qjWfX/6vxuK4BltD10itVbOVvcF5cLpwZZUVF/LquSW5XatxhzwN7ofwYDA+y6UZC3ZtF
	NpxXLJAMMCONLP7iEY086lBV38QXp2qL7r81gEe5vcvFefHJ1BcE84d629aevKNh06dS3iwzstPVK
	N282AoPA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tlPGx-000YNP-2W;
	Fri, 21 Feb 2025 17:24:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 21 Feb 2025 17:24:39 +0800
Date: Fri, 21 Feb 2025 17:24:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom-qce: Document the X1E80100
 crypto engine
Message-ID: <Z7hGV9escUKrTXtD@gondor.apana.org.au>
References: <20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org>

On Thu, Feb 13, 2025 at 02:37:05PM +0200, Abel Vesa wrote:
> Document the crypto engine on the X1E80100 Platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

