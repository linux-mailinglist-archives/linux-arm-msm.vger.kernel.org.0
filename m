Return-Path: <linux-arm-msm+bounces-79489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9FBC1BB1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A18D65A500B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33E83321A6;
	Wed, 29 Oct 2025 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="farpX5Em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADE3314BC;
	Wed, 29 Oct 2025 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751754; cv=none; b=pzqs5mk9mZlL4kPwUbmFV4CTEa3HNsoCGXkHq/A7eMdB5ltB6s0QACoiK9qSfIOHA1jiVwCu9Ca8lfBZJInzHNkK14uKbVTZcxQtzVQBpgL/D9NiwllN2BUW0ypZbfWckF9HDq6BMRA2QSZ6ssvCp98hInijEjv728CoTJq7lO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751754; c=relaxed/simple;
	bh=wWoixZCw24s45PsgOeN8M9sNYsvmXz/+08ZTkUHm6Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTzxLfIYOXCdD2GWGenvmcIWv3q3zT5r6c7V337n5aBDIGPYQduA4XCPXWrmJVGUbvaJZEE0Gd+pn5SmCK2J8emZ1R8hQv2cWT4c0ws6TIFtb6NG1Hy67O6i1YNNQvI3YxKduk+NzeT0FKtQAu+QCYjyJOIyANTYkstm5Wsl1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=farpX5Em; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88EDC4CEF7;
	Wed, 29 Oct 2025 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761751754;
	bh=wWoixZCw24s45PsgOeN8M9sNYsvmXz/+08ZTkUHm6Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=farpX5Em0n8WIvwICAuanHhaFFfgrgnUhG2BRtKnkPhmdOx2VjJc48+5oVg5z2HHd
	 WwhKlYZp+ZpvldT1gs14oKuRlBT4YT36xdIwYUZ284QgE+oY0P6lQw0Hyv9+5+8uDu
	 HIB4Zz+VF93qyT+n8mQRo5feA13qNpBtAmIgbMifXJxB6ZVNZbo2qFV0rR+/SHsXbU
	 QTKa6qkOcECjVsSHjd2nww4biUU9IRz3v5wuFTixZLBW8ifd6Bu2VMpjrXckxMN0K9
	 3CjkdulEPsVDdzBvQhlw/RZgbTGAXXo1XSQpZZXddX5H/xjd6dpJbJZhwZNgRQ3N6G
	 keD1tNEmX1Wmg==
Date: Wed, 29 Oct 2025 10:32:16 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] crypto: qce: fix version check
Message-ID: <7ohylqbvlcdu36hbe32jydpfx6ecaajqjzcmvyhdgktci2mzi2@3lcuydcqbzmp>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
 <20251029-knp-crypto-v2-3-b109a22da4f7@oss.qualcomm.com>
 <a41e45b2-6e50-4236-a71d-ec3fbaccc2b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a41e45b2-6e50-4236-a71d-ec3fbaccc2b1@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 10:41:48AM +0100, Konrad Dybcio wrote:
> On 10/29/25 9:25 AM, Jingyi Wang wrote:
> > From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> > 
> > The previous version check made it difficult to support newer major
> > versions (e.g., v6.0) without adding extra checks/macros. Update the
> > logic to only reject v5.0 and allow future versions without additional
> > changes.
> > 
> > Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  drivers/crypto/qce/core.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index e95e84486d9a..b966f3365b7d 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -21,7 +21,6 @@
> >  #include "sha.h"
> >  #include "aead.h"
> >  
> > -#define QCE_MAJOR_VERSION5	0x05
> >  #define QCE_QUEUE_LENGTH	1
> >  
> >  #define QCE_DEFAULT_MEM_BANDWIDTH	393600
> > @@ -161,7 +160,7 @@ static int qce_check_version(struct qce_device *qce)
> >  	 * the driver does not support v5 with minor 0 because it has special
> >  	 * alignment requirements.
> >  	 */
> > -	if (major != QCE_MAJOR_VERSION5 || minor == 0)
> > +	if (major == 5 && minor == 0)
> >  		return -ENODEV;
> 
> This also allows major < 5, should we add a second check to reject that?
> 

The comment says we don't support v5.0, now the code says the same.

I think it's okay to leave handling of previous versions as undefined.
Given the current way this is expressed, there's can't be any existing
users...

Regards,
Bjorn

> Konrad

