Return-Path: <linux-arm-msm+bounces-71511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32188B3F8A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADED3B3E15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128F42EACFE;
	Tue,  2 Sep 2025 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOfxfH01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB42EACF7;
	Tue,  2 Sep 2025 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802025; cv=none; b=kniS5FzNMeBk6AMvGgqLendRnepswlO/Sb0QX0tRaNQuZsHWMce8kTT7tLckicUlU9GdUUAnK3spcntU3N9FqOqykd8qLPXAbxRg2JxVhcgny4P4Tu6uNgPdB7QfW4zzV6dCqlPaQL8AvAn5t/BbT0B6t1SHi/u6OrrvqBmK9uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802025; c=relaxed/simple;
	bh=12zafy0/ryRdHHOWmOb3bmG4FdXNuAu84Y6LNCYxwbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xo8c8q1zs9rZMar65IZJwCmWoWtiZCTAKTkRYBXKtXo4nmi0hc9LXY8Wql7RZ0XWsYS+CtgT1rvaHk6b60/gq39LJxwaHmXCdje9UHkhbODg+esvpSeyamE+4F74OT/HTgwiWlfbW6BLqMhvn1lDGzN7q1lYLEW5gAvM9WIZyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOfxfH01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A31C4CEF7;
	Tue,  2 Sep 2025 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802024;
	bh=12zafy0/ryRdHHOWmOb3bmG4FdXNuAu84Y6LNCYxwbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOfxfH01HPfZ8s0zoXxVR/MSDHgVC2Kwc2B1R3OaoaQqEfnyIS1bZ1t/icICMknek
	 F6BZDWAtBt0vwqtZb1/1IxzGR6koJ7Xp/LFo3NFQZ2ojfZ+y61yxBQS7o9nh6ugEjR
	 0c0kCyFq70hpnZTGR4Al7j78ktrfdUmgujvpvjsbj1a5JHd3Mlozv5wGC5NzTALSiX
	 /au1pG0RZ8zPVtibc9EDTVIqJGTCmlqr1J1a1WcPK2gVD9o63M4mEx0Sv8TfzACtby
	 LjP0u+2tY8FtcOl1m+yckLNKrsL2Cw8a8dA3V8pvkRMkmW/BtuVmdRMvdzKiUwni6v
	 b3f4acYXEQB1A==
Date: Tue, 2 Sep 2025 10:33:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org, 
	conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: soundwire: qcom: deprecate
 qcom,din/out-ports
Message-ID: <20250902-ubiquitous-screeching-parrot-4b967d@kuoka>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901195037.47156-4-srinivas.kandagatla@oss.qualcomm.com>

On Mon, Sep 01, 2025 at 08:50:33PM +0100, Srinivas Kandagatla wrote:
> Number of input and output ports can be dynamically read from the
> controller registers, getting this value from Device Tree is redundant
> and potentially lead to bugs.
> 
> Mark these two properties as deprecated in device tree bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


