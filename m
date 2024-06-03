Return-Path: <linux-arm-msm+bounces-21479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAB8D82A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1946B23A19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41F284E1C;
	Mon,  3 Jun 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssboo9KI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A9E1E491;
	Mon,  3 Jun 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418774; cv=none; b=OgKUXRRKptIH/ZYDxDr4rEz0c4zTfrVeMGaBXU2pt5Pzu0ZepUZaQroW4MRZmozNMdEawZQDS0dBpeRFjRJrHR+HxjK1CcgtH/OASB/c/HQQVPHDPKw3Obk6w7Q6tiAU29sK8RfAFvV+rhlBTgYlOEedn2GYOOmn3ypCWjcX7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418774; c=relaxed/simple;
	bh=4RsD9/C3pEBXc6FiOISGRqAdcjs1/UJEsDEwucWnhkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMYiMIVFxBIqgFeXMl5RjVsXXM4T9z95mcZwprOfAlOmW4aYeecFm1S9ZeGIC59ViCpkIMTS8i+LeB4EqI5y2dar8sEpFJ0Uz368RkiaKZ9rKT/0CZicqBxVBZxkHQC6MYWg1PXyzGipU6qkdTzX9ADigqV+Ecp85QZ9+sJutRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssboo9KI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CADC2BD10;
	Mon,  3 Jun 2024 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717418774;
	bh=4RsD9/C3pEBXc6FiOISGRqAdcjs1/UJEsDEwucWnhkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssboo9KIENmb5gqh+naudYKIJ+9RWIpHdaOIXmtVsWHL3kLHI3zxKd8E671GAccVs
	 /UN76bXZeO5KUDuLi8QHumctJ6pw2U96o7qAG6oHtKDtl1gzglObXGYY0+3xbfq48m
	 wDlRDLR47Kp5lnh6fPck8e+V8eWFHMkwU1WXCRGIGcwKjJzdEP9MgqXN+qm9Vlfn74
	 VpCiER07m726Eq3t+m+cyLn2X3mnbDWfMBzJLoYhfqGOnXJkLKFS9P1JvSz0PuZu8o
	 g+tosvKVkqjCN1bPwUhOpMAFJMQqsYeuqjfRD5dntj2wF/uGIWpYEdzuSued/aHjpN
	 Hm3/EYfjqXCNg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE74m-000000000jf-1Gj3;
	Mon, 03 Jun 2024 14:46:12 +0200
Date: Mon, 3 Jun 2024 14:46:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add X1E80100 Gen4 4-lane mode
 support
Message-ID: <Zl27FJVU_YHokCiD@hovoldconsulting.com>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-2-5c841dae7850@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-x1e80100-phy-add-gen4x4-v1-2-5c841dae7850@linaro.org>

On Fri, May 31, 2024 at 07:06:45PM +0300, Abel Vesa wrote:
> The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
> 2-lane mode. Add the configuration and compatible for the 4-lane mode.

Same language nits as for patch 1/1.

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

I tried this patch along with the DT changes and the link on the CRD
still comes up as 2-lane:

	qcom-pcie 1bf8000.pci: PCIe Gen.4 x2 link up

so something appears to be wrong here. (I noticed the same with your
next branch last week.)

How did you test this? Does the link actually come up as 4-lane for you?

Johan

