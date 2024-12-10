Return-Path: <linux-arm-msm+bounces-41208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 057319EA81A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0506283CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 05:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A6C22758D;
	Tue, 10 Dec 2024 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="VUd1VyKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD6A94D;
	Tue, 10 Dec 2024 05:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733809697; cv=none; b=K6Id0nOcxBeEaaAzh6aLYohs3KJVX9qUuD7jn+va3kdpD70INdcNiDNATrPUrItMlcTQn8Ksn3EZaX7p9XS5Mh7qS2rkH13Hl/moJ/qMYku68P2c29xka5abRolw4vnudL9cga+puigoWaC7XlkHERMFW9csAMnbNhpgR572plw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733809697; c=relaxed/simple;
	bh=zEq5TNf/Oz4OcP9Cm3xmYyJ1iZ9odjdP+N1kMbJHMvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU/Bw3jkbgWLaB8ixXlgkfp9jZTHGR6hRXN9tbbHhRHDijJ3QctD/ZfHG4fkFu1hdTR+WoDWE+FiZb98wzVHiE4XsVZhTZdovj9YXBgFE6DoH1MqircFMgMH5f6nSMgmxl3442wGbAoe1of7xXGCXCMWp/d9bN2ibur0SE1KBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=VUd1VyKA; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H2Nyn463OMp0ZR0m9txkgM7/RwImxOEtanSXB3wZcDw=; b=VUd1VyKANK3siG6tkmWHdaE82k
	HHxgT+WcpCn/pER5EzXHPRkMU0cS1Vf7eVggaRDzx9VY/TICVMLk25Chm7wgdZiJvYJkEMX/Q1r9Y
	RKNJPkpyi7Wa11LSdI6NrxQPAurfjEDQP44LG8GE9S8MAsSItowjQeMGc4ZWV0d4MNamA3ZjGW2oU
	J4T5idwlLgyw7idE04X4JMBCNdHQaGTfm2berf/6QjUUE0BlgyvI+5sOtIb21KUqW7hlSadzR8aX2
	5dOqwKDQbB47SlRls+Pvh8GoMMZKxtEbYp6RJwcv04L53lHaryfNip94Dk8SF4LQ9l3SoAiZoSv7j
	lOv3iUew==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tKstP-000OC9-0s;
	Tue, 10 Dec 2024 13:48:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 10 Dec 2024 13:48:04 +0800
Date: Tue, 10 Dec 2024 13:48:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V5 1/2] dt-bindings: crypto: qcom,prng: document QCS8300
Message-ID: <Z1fWFCQgd9uNuHbW@gondor.apana.org.au>
References: <20241125064317.1748451-1-quic_yrangana@quicinc.com>
 <20241125064317.1748451-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125064317.1748451-2-quic_yrangana@quicinc.com>

On Mon, Nov 25, 2024 at 12:13:16PM +0530, Yuvaraj Ranganathan wrote:
> Document QCS8300 compatible for the True Random Number
> Generator.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

