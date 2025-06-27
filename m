Return-Path: <linux-arm-msm+bounces-62867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E1DAEBFA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25DD9560E10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3165D205ABB;
	Fri, 27 Jun 2025 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgSXez3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06244200110;
	Fri, 27 Jun 2025 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052010; cv=none; b=VUZJ8Tqal/nKDjtcAZtRu0IAGBWjMTIQahWWm8o/Jjc7OjCe7zpXet2ylHh7WXe82Fk5PuaDDc5FNUDDIdS6DXcSpbvGjJyh+xMfz81KEaL1Zgn+I+BBxjaPxXyPzPQCoeET5+/XU9WAr9eQaeOpau3NdjKFFR4ZPONVtkT9P9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052010; c=relaxed/simple;
	bh=rlOHZjZIEspl0q/GBx3OYaU1/H0UqF4UUVO6+aOekBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlqCQNZb6eeFG6AUgsYzxyZfHoBKLJIlFPf4ZZAsoyMoewJIwQd4j07BiI5olnWqAMaJ4rRq1jvHOoB9Ei9leLu0pSVwqVZRljMHnt2ktIEDJNSlNjhoFO8ZXNHmoMUUbYGzQH4VtybqfRS3qfi7+zRv8+lrOJreYSwSObvSoEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgSXez3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A246C4CEE3;
	Fri, 27 Jun 2025 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751052009;
	bh=rlOHZjZIEspl0q/GBx3OYaU1/H0UqF4UUVO6+aOekBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgSXez3gkFbYLioFF1Fbh7TfdWdk1g+mL4gRgdBv3mngkruDkm3DWglLsA+T/otE3
	 vZmAGxTOGI5eIRRUD7YOqdvWvcyRmVH8JeEnJR2IaxgZZhzjyg8lD7PNujHYaae5Z+
	 d4wua3Nb2eJ6dUPa2w1m5wdnaj16cHcGm0BE7MWK2girIwq/FX2WptGY7cc5wzHYTA
	 oGfU0oDaXpv0NltxRqLVlCh0uj+wkBQuqH6tO8IiNJbBihCuP0Sy06kNX2ESc4vlWB
	 QPCfPg+D9AfJkypXNTK7rWe4nj/gC/cp+wJ20Cqlxu/T8fSD939GEvmDfP/saBCgID
	 RpQCvFx4V8dTg==
Date: Fri, 27 Jun 2025 14:20:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eric Biggers <ebiggers@google.com>, devicetree@vger.kernel.org,
	Benno Lossin <lossin@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Ingo Molnar <mingo@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-arm-msm@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Ntmer
Message-ID: <175105200813.4031932.897263178678419405.robh@kernel.org>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
 <20250617092929.1492750-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617092929.1492750-2-mitltlatltl@gmail.com>


On Tue, 17 Jun 2025 17:29:26 +0800, Pengyu Luo wrote:
> Ntmer is a Chinese company, their website is https://www.ntmer.com
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


