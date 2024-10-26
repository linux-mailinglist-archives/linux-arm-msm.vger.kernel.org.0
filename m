Return-Path: <linux-arm-msm+bounces-35984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 516269B15B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 09:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFFFF1F23E02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 07:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C671632F4;
	Sat, 26 Oct 2024 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ojOkrDs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71C13A41F;
	Sat, 26 Oct 2024 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729926167; cv=none; b=XKuaUNb5o+wuD3DGHAiCLhh/7Qa5PvYMIj4qeoJm9/aJFy/yQ5Hhkuy5vt44enDudjQUfEBl9N2vUMxhX7D9CDy7uv2b8pyqUbFXA1HvJbPPpYo/1abagRgVySuD7qKYlqKEV+oRLkQzHvXAqDNXfOQ9Bpi3goxRTCZ6mrkLayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729926167; c=relaxed/simple;
	bh=WFxpYvbXvofAc6CPg9TSth3RYh/dsSg/t9m5lpnjNow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH1wKuoi2ZB7bglwP8BveRwSXJpyCRpnzv0sUAyGbLnzfk3PYUdHqva4YD78kgCcL+N4FKsxKpVZ2JarXO/mi+F5FO4tRy+q2uN8swyJ6XkjyLr2KCAOQHf126Q5JMgfPQYl+lkfO3iK19e1dsymkK2nWEUqfZE8+pSmmDlXIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ojOkrDs0; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vOfR5nxbvz17I1jUUGbrnOm7gw72534O1iNYxZy8D0w=; b=ojOkrDs0dWMJCcav3D1n9Q3vtR
	YcimPw3KwbUWy8e5jPz29yTuShPNe9ySPrO5RMCoAa/q6fJ2sCQ/WAvdrRpcH1jD0Epd155DqU+Uu
	tCYdj9ZUIixYZt7czJi+ld9J0+2V5MkA7X1yCsVIJjDu8zr6GF6kCC7C0Y7NNfsId/MuKn1PAbKyv
	U0vaYJTMHgZzrE+3+NTk4edxikHzdF4UNEKJ4X2/tcYfrNmyJQklAhAUkk3VZi6FUJyXB8b9wWvDb
	0y+9hfXJMU6DqeqedVHdvfNgrAoIQwW3dzInvwUwemYKgP2owLXGYZgr9Aj9eBtQNUgEa8I0VkRIh
	1YVzA4gw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4aol-00CFzy-2w;
	Sat, 26 Oct 2024 15:02:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 15:02:35 +0800
Date: Sat, 26 Oct 2024 15:02:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_sravank@quicinc.com
Subject: Re: [PATCH V1 1/2] dt-bindings: crypto: qcom-qce: document the
 SA8775P crypto engine
Message-ID: <ZxyUC3j_H3TDZxGT@gondor.apana.org.au>
References: <20241017144500.3968797-1-quic_yrangana@quicinc.com>
 <20241017144500.3968797-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017144500.3968797-2-quic_yrangana@quicinc.com>

On Thu, Oct 17, 2024 at 08:14:59PM +0530, Yuvaraj Ranganathan wrote:
> Document the crypto engine on the SA8775P Platform.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

