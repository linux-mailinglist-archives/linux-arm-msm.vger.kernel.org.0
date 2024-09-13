Return-Path: <linux-arm-msm+bounces-31693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FDA977DA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 12:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C4D1C24ABA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 10:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E601DA2F5;
	Fri, 13 Sep 2024 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="d+e91Fyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D181DA2E0;
	Fri, 13 Sep 2024 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223497; cv=none; b=dFP21dC4qBSf5vePz9OUgnEjQN4E7/3dxWQqVq0y3BbdsWy3b3T8yn4B4CQu7skrrriBxRbcITwMpgCA5czXz8+Di5uO6T96EuHrodvsfnjq1Ys/1uqrYCSNkgsKwV7YyewF289ULUbep85l/v6v+IxTUaetHoG5mxXUjF9GsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223497; c=relaxed/simple;
	bh=16qCOLFJPrMu5eOTbUdYKk4xjWjeMTKjI/SmQ58MsAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBWGpw8l65G3ZMaio0jdq/xWsE3xfVxWtQcULROoa+zYWsCGahW2Feyd+bvnFNBw44sWid51CXfWdpS+S7ZdhuWqvHIt+iWK59cuE+jbM5i0zkvDpjl6KTMF4nqqmzi2oek0oZj+Ix3BDj5ZjsZPfQtt9G7asT6734WCfov9LxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=d+e91Fyq; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vjDsMPWKjB/SrhLRKU4BZ+KvCQEJb6PvxQRxNDoY5Ko=; b=d+e91FyqC56k6IQnxA4CiUCchi
	lVzMtRCX0bsFbXdMsB2Nt6i/+JG/pMZ9EVP+HdNy/V2UNJf1VpUGL61SYEe9pC8ZLuF1xwNCxqPdm
	mBnCBUDmvR8Et7IBtQbOtJumQxkoI6GHA23GwKT7WbYjuf4Xj2OcYNWPEDCcq4IkBgqunoZHf3EsS
	eFBjP9AuIS6anD5DRxlkNxms3zbw9QEOSvEx5dYQBwtWy2SySxHA/vywd4XulWz/84Ep8rRtWEty9
	rzNzX0P4IW1YrGDyoAsYxaecoKJLM+8gk0fHh6CTdi73wV/XhRjbuRNzjCLcbhhvutCDinXOUVFCo
	STd3jtaw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sp3QP-002DvB-2v;
	Fri, 13 Sep 2024 18:31:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Sep 2024 18:31:27 +0800
Date: Fri, 13 Sep 2024 18:31:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Brian Masney <bmasney@redhat.com>
Cc: davem@davemloft.net, quic_omprsing@quicinc.com,
	neil.armstrong@linaro.org, quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, ernesto.mnd.fernandez@gmail.com,
	quic_jhugo@quicinc.com
Subject: Re: [PATCH v3 0/2] crypto: qcom-rng: fix support for ACPI-based
 systems
Message-ID: <ZuQUfxA1teMeV0Lf@gondor.apana.org.au>
References: <20240906002521.1163311-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906002521.1163311-1-bmasney@redhat.com>

On Thu, Sep 05, 2024 at 08:25:19PM -0400, Brian Masney wrote:
> The qcom-rng driver supports both ACPI and device tree based systems.
> ACPI support was broken when the hw_random interface support was added.
> This small series gets that working again.
> 
> This fix was boot tested on a Qualcomm Amberwing server (ACPI based) and
> on a Qualcomm SA8775p Automotive Development Board (DT based). I also
> verified that qcom-rng shows up in /proc/crypto on both systems.
> 
> Changes since v2:
> - Simplify ACPI fix based on what's done with other drivers (Brian)
> 
> Changes since v1:
> - Use qcom_prng_ee_match_data instead of qcom_prng_match_data for the
>   true skip_init to match previous behavior (Ernesto)
> - Reordered patches so fix is first (Dmitry)
> 
> Brian Masney (2):
>   crypto: qcom-rng: fix support for ACPI-based systems
>   crypto: qcom-rng: rename *_of_data to *_match_data
> 
>  drivers/crypto/qcom-rng.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> -- 
> 2.46.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

