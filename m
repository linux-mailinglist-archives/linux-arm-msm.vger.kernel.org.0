Return-Path: <linux-arm-msm+bounces-41209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A49EA81E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A983166D59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 05:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A31B228366;
	Tue, 10 Dec 2024 05:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Un4L4jwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767322836A;
	Tue, 10 Dec 2024 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733809702; cv=none; b=tW6DyjHHRObRkIUta1ROQAQKbcB3utcpVRlO5zFZEdfLV2PbIVpBtFC/b6oNidq258OWOwXdFGJVMqUMOQJ4Y4o86IwDgj3jv9DvHvuFF0k48v5yAUj1RJgI6TOaY8sBexc2i+H5BdYn6B81i7ct7D4f1CxhwOhJ06abYgkVmzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733809702; c=relaxed/simple;
	bh=iNg6bmkReMWSDLobob1iQ9Ol3Naj6Cu4ygwN9KPU5eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/xYaP6OQupDVkywPh8bHxIa+PYq3H6/wbXkxUet+4tIhjwbbfDrXF6RT/p1RkxVL0NX0rjKefr8qvK2JQSIaYEZWDW+SX4PiLOP+3ylG3IlW+VLLA30cTxR+ZHAflYeuhu/wWnUgrncPptSVWjGYgDsVMP7VBigD4ma8jSl2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Un4L4jwE; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Pc45zAueWX6bInPNULcphD1UBs8CSt7KEOUfWK/GDaY=; b=Un4L4jwEYtJ1ihPFqlbDCAhL6z
	JFXkh5ewA6UJIxCURxLfMfeqjfKRgI+/AJq0xiOhcRSzjJjzw++nOD2wQQzV/qZVgnN9vz0cGcUd6
	EuF6Na+FMapcQxDQGGKu2tGE3sHJab/NyAZnxDXN/ihr8A6SbWzg9NVt3fmAJ7H0wbh8Wx7hkCwe0
	3lCkWdbSoSiwzyeivbxncprGEoFGxPFn8X95NIFQxpD4pXOvf0ICBdDFjK0hvbGcdzURkLgB6RM3h
	9hPv1kLhRUoYUn43/PAywvub6vbljSTQqpqREDQDsPOcoGCbcBvO4Ul+Dk4GVNcp5owrUiak/bsLX
	bRFyjygw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tKstX-000OCF-0P;
	Tue, 10 Dec 2024 13:48:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 10 Dec 2024 13:48:11 +0800
Date: Tue, 10 Dec 2024 13:48:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] dt-bindings: crypto: ice: document the qcs8300
 inline crypto engine
Message-ID: <Z1fWG-_tVq1cxHEU@gondor.apana.org.au>
References: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
 <20241125065801.1751256-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125065801.1751256-2-quic_yrangana@quicinc.com>

On Mon, Nov 25, 2024 at 12:28:00PM +0530, Yuvaraj Ranganathan wrote:
> Add the compatible string for QCom ICE on qcs8300 SoCs.
> 
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

