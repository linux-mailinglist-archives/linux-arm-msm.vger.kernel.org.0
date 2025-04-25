Return-Path: <linux-arm-msm+bounces-55591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C533EA9C441
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE004688C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5013323C8A4;
	Fri, 25 Apr 2025 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu1hfjbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F645238C10;
	Fri, 25 Apr 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574677; cv=none; b=qbI5/I4q7YC8svbqpH+Rr59sp/+CeaKMbPbSCH+HuJ5WDN62KQW6N4q3HwQvuhf1HvSbYsrZt6cyy9zpWPJqjDJ4W3ltEnK1y9tfjREzfp1zMyC8MqjRLh2cseokAIDmCm25qPrvzYEXfhn+owv0MuQkZeIAKSWyiR0opujGjdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574677; c=relaxed/simple;
	bh=V4rxOUuu1xK/aFRB+/3OFp+T53D84Mc3wNWfZ+MXMHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8DCvhGvNfv+QsDLr7gp7cYTnpmxb7nRdh7l+Nf5EqYNDiicp/ioy9TlPXYWFO1VE9uopqR+06KbRHXv2yyNYbJEN/42OYAfRC6Dzl2cdqEv8rlct3q62q31YeF5zF/gLFbjfkfmZAxXUzxr5r6mWSPcXFPacDBCWwp/TibrX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu1hfjbs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D4DC4CEEA;
	Fri, 25 Apr 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745574676;
	bh=V4rxOUuu1xK/aFRB+/3OFp+T53D84Mc3wNWfZ+MXMHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uu1hfjbs0hDnXQKQs6VrzYJE7UhH86q0wd6B/AcQ53phcmlPJgLA3RZLeJNOa1rIA
	 +ONs0hyjon1DwP0Hx3kINtoHlh6sSr5dc5jCGwc/SB1qInwEkm8NsdU4FOc2r6oUxR
	 nYxYXesmu7hFjOelGfHW2suVfEUKtSKBy7as8NpcOtDZ1dvtc4e0gunFu2AcJt8UTN
	 xDpxDFWXalj2rbUsVZSFqI5Urtjy85N1Rkk3nDiA4EIhwWKDVaLZ7CLToHh6bQ9xkx
	 CmDk/rj/hSBuXOUOvaCUsdySJ6SJ+tiXA3Amt1N1jt+sle1IXpflNR6qRSjPMI0LXW
	 Hdh/kyNhhvi1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8FiH-000000000JQ-1rFI;
	Fri, 25 Apr 2025 11:51:17 +0200
Date: Fri, 25 Apr 2025 11:51:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
Message-ID: <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425092955.4099677-5-quic_wenbyao@quicinc.com>

On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
> missing in the current PHY device tree node. The PCIe port can still
> function because the regulator L3J, which vdda-qref consumes, is voted by
> other components.
> 
> Since the device tree should accurately describe the hardware, add the
> vdda-qref power supply explicitly in all PCIe PHY device nodes.

AFAIU the PHYs do not use this qref supply directly so it does not
belong in the PHY node (but possibly in the tcsr node that provides the
refclk).

Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
qref supplies") it also won't have any effect for pcie4 and pcie6.

Johan

