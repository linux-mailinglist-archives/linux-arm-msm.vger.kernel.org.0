Return-Path: <linux-arm-msm+bounces-41210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719509EA822
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FF8A168266
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 05:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3421D22619D;
	Tue, 10 Dec 2024 05:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="NtYCX0op"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4D41D433B;
	Tue, 10 Dec 2024 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733809712; cv=none; b=LJBUAUSNMOdAY2roqa7RXr2l/AlFo9YRclp0bWyVYHYDADkEblB5pRInteP3cai0w3FtGHLvdVwHXPqGzR0Vi0bXyKvpmIWwcShYAHWg9njjK0eI6FMVVPslw0cqVitEFl9ssUwhgl59mf3Ux5JHPPq1Dl3d2MAGteYElE+AqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733809712; c=relaxed/simple;
	bh=TxPAlnQ4taBxHrJbvjVXNWpPbU+40+W+ti34vNrhNfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMMUy0tfazhV5JYkbRorqg6Nwk0n/eH3IHChDfmFTIARIzaW7+0AnaNDuhRdXCwsBqac5esElzwmkD7v2ZWjsJ5dQQSkc8Jqy+ciPcXlMjShQ+vJ0k64FTjHp0/radvN3fT0xv1qOrn7h70JyKr0kp4vUZMdlkMuaY0w0ef0d+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=NtYCX0op; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7P+musjCEfAAnUCAnHBDeD71BzWMxl0ywAf6tYayrJ8=; b=NtYCX0oplqLYciSVwmoLa/q1uq
	zVYzyi1d1wO3Vts9jqyk9C9jh0ZqQbRRSxVOy3V2TVAxfUFFpuGoXKO4OYmxqjBhuTpbH6OlBuhLN
	Y8HQf5Ny+NTlcYcpWThi1WH/qkSmWa0WKaTz1nZzTs6LCPTQnJ7ZRlnmiOR6ljmQ/jBkQMkQA/XYD
	2f/J1aKWJ9ODX1rDQGOL8f5SngDWmmLVBuXDWM4n5rs/AVlO03cAnD3VAfNvNYxBUwJzmL6yLb0RY
	r/fK/s5DaocFwLXYmpiDPPoz0zN3y0AIoYHuWyp+BI+Q1ZqtllXvBLYH5/4qq6ABGlwRcMW3K8IHj
	5g/fPrWQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tKste-000OCO-1Q;
	Tue, 10 Dec 2024 13:48:20 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 10 Dec 2024 13:48:19 +0800
Date: Tue, 10 Dec 2024 13:48:19 +0800
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
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: crypto: qcom-qce: document the
 QCS8300 crypto engine
Message-ID: <Z1fWI1kagAuy238q@gondor.apana.org.au>
References: <20241125111923.2218374-1-quic_yrangana@quicinc.com>
 <20241125111923.2218374-2-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125111923.2218374-2-quic_yrangana@quicinc.com>

On Mon, Nov 25, 2024 at 04:49:22PM +0530, Yuvaraj Ranganathan wrote:
> Document the crypto engine on the QCS8300 Platform.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

