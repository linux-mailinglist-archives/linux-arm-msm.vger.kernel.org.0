Return-Path: <linux-arm-msm+bounces-68080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81657B1E365
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 925B8583245
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 07:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E69C233739;
	Fri,  8 Aug 2025 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2muc0jH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D6224AF9;
	Fri,  8 Aug 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754638087; cv=none; b=W0U3pt99vs43I0Dg08ZN/4Si69lBSDjOnxzDuIP6ZgpbsZJPJr0rPXr6rn5Z1G0nu9sDLppn/MfI4HJu2GQZw2jgrEsxsNJ+NCHTwNEJkvtvRuOWqN1YpOQ5rNT4SIueYe70fuePR7gMOxgX2Cvv/N5ogc4T95JyGgOqEQZuY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754638087; c=relaxed/simple;
	bh=3EUTEM0GdjsnBj9cpM37/tdY5SSHyjxt4tpB30IPASE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGt7DpSojG6O/z6pUQEbumDmgU7OOAJTeK81t1Nd2IewWZgfqxNJuC+TeO0TXn8CQMGly5HVXj4pl+alUvOMEx0+JMJ18/Z9Flb6nR9PBSGOzuJMPIjrRq/b6EN42WmwdYEHvzFMewnh5E4/usxU0crulnpYzvMk80ZEGmfKwaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2muc0jH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E84CC4CEED;
	Fri,  8 Aug 2025 07:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754638086;
	bh=3EUTEM0GdjsnBj9cpM37/tdY5SSHyjxt4tpB30IPASE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2muc0jH+b47hb/yuSQHLVy4acDQA/KThuRPqpHVFG4tISpfOOoATADFptuPKCmhQ
	 5gOZQISjAxzYf+j10r4D8tQGAG5rzMO9AO8EkqYW562T/dZBD0fo8vm4jN7vf+5api
	 NUcSTpoaytey7lqGTtBazcNtiks011kEPT8iTZ+ZvuYL23fTAi1rTNIh5VrVQkiqMa
	 DrC+uOBPJ4zioa5Fb2iLoJyZ1oVPOPe9YZhb7WvP7nNWmUJkio1QJa4yOTVhg6vCjh
	 eov+/oBuR3DcdEGD1zhBmxTUMk0O9cyWDEilFe0U6ub0V0mBT72Mnisifgf3FJh8ka
	 SJqI4ohNLKIQw==
Date: Fri, 8 Aug 2025 09:28:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, 
	conor+dt@kernel.org, bvanassche@acm.org, andersson@kernel.org, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 1/4] dt-bindings: phy: Add max-microamp properties for
 PHY and PLL supplies
Message-ID: <20250808-spiffy-vegan-boa-c24dd4@kuoka>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806154340.20122-2-quic_nitirawa@quicinc.com>

On Wed, Aug 06, 2025 at 09:13:37PM +0530, Nitin Rawat wrote:
> Add two new optional properties to the SC8280XP QMP UFS PHY
> device tree binding:
> 
> - `vdda-phy-max-microamp`: Specifies the maximum current (in microamps)
> 			   that can be drawn from the PHY supply.
> - `vdda-pll-max-microamp`: Specifies the maximum current (in microamps)
> 			   that can be drawn from the PLL supply.

How much you can draw from some supply is not a property of the device,
but that supply, so to me this is really oddly named.

Anyway, discussion is going in driver patch.

Best regards,
Krzysztof


