Return-Path: <linux-arm-msm+bounces-54160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFAA87942
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34F2D188D45D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C6525A623;
	Mon, 14 Apr 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FX7WHlli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAC2259CAA;
	Mon, 14 Apr 2025 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616420; cv=none; b=Bch/EB8ISv9jB9PhP46aS0p7bf4Di4CcD2uiqg1jSCazAihvDLIFYPxOlzMaHJhZ2t1buxmeZzt4i5me7b9DRelFxufRdy2ywXx9+PqXr6DqEYwfXdWqDO6esgV587qej+oT8veMhGsX9rk47q4flUpfRM1cRoPSWw1EIgC3jY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616420; c=relaxed/simple;
	bh=t2r22kypL7dkgR5icGf+FItZxkqG4+5fcqunKc1xsiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4v5+mSJvZaWLgjbP8mhRpVpewAJZmA21Ynx9S4ue5McYv9bBhqvJevh44Vrglpm6L8RzVTdPoziscRIer8a7rZspfqNGbbZfgvnYcVYOp5qxWSSO93hByyIcxaRuWg8UXQ7qfMDkd6omZEmA2bo+EJx+4quC0emtgwZxobEkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FX7WHlli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DD2C4CEE2;
	Mon, 14 Apr 2025 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616417;
	bh=t2r22kypL7dkgR5icGf+FItZxkqG4+5fcqunKc1xsiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FX7WHlli6ntZdKYS5xf1F3wb3fLcfj/ewa5Pb4N8s+GkRSbkZsgn6fB3R+oL7V8hO
	 L1OTVYTlRsfuRJqWEcFMqymXAqw03e9DAgaOPrfh+xziTPDwVjUtvm1hASLNkoMGML
	 r+3iKHcBc3VIjAw4ekjZlTw36IfQMAFeeRtjT7xkgBRNNSu0BoDBGGkhXx3K0Xky/p
	 IPBcP2lJg3Fv2uSHcx5JQ4MPfxoGxmYrWTj1LkItKbNDkP09NrKzeE8H6oYbF11Yv/
	 +KjqCMX/puR7+DXXvvRxwb+VckQyqE6JmMPLraf06CQb5Kn4LrHb7+Ico6K376sNCc
	 e6RPJiqAoTF4Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4EQP-000000001tW-2uQ5;
	Mon, 14 Apr 2025 09:40:13 +0200
Date: Mon, 14 Apr 2025 09:40:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>, vkoul@kernel.org,
	kishon@kernel.org, lumag@kernel.org, quic_kriskura@quicinc.com,
	manivannan.sadhasivam@linaro.org, konrad.dybcio@oss.qualcomm.com,
	quic_varada@quicinc.com, quic_kbajaj@quicinc.com,
	johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-ID: <Z_y73a5IDO66AzY1@hovoldconsulting.com>
References: <20250413212518.2625540-1-chenyuan0y@gmail.com>
 <22ec4fc8-9368-4955-ac97-c49b3317d3b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22ec4fc8-9368-4955-ac97-c49b3317d3b3@kernel.org>

On Mon, Apr 14, 2025 at 09:30:19AM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2025 23:25, Chenyuan Yang wrote:
> > In qmp_usb_iomap(), one branch returns the result of devm_ioremap(), which
> > can be NULL. Since IS_ERR() does not catch a NULL pointer,
> 
> No, that's not true. NAK.

I'm afraid you're mistaken here. See __devm_ioremap() which can return
NULL.

Johan

