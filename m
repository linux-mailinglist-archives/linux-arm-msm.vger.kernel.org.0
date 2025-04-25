Return-Path: <linux-arm-msm+bounces-55638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1753AA9C885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079879C33D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EAE2472AD;
	Fri, 25 Apr 2025 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asbZVeQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C5247296;
	Fri, 25 Apr 2025 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582562; cv=none; b=F4gZerYc7RdflqkaajYc5d2Le9V2b7fpnh+lUGEift2EOBmgYgNF35pEPvnEypMLv7e61m0vqzVLlZ9iR18alCAufUrCOs8zUA2pSzI9JcUWybB21D9yNzNNoydQfWeV0ItD8ibCQ5Spb1lQJ+1nxlmmfVUXnZKMK89BVWSmiy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582562; c=relaxed/simple;
	bh=eZPFTBz6yM2gMfLd3A3QWowYwwQJiwoej0l47rx+zYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRVl7Vq7NxNazrigw9ZX0btF7aKXa8Cx5adf6n8J5khG64NMwoPu9vd894TAO3E4URIqB117EvYmzcVKPxXzZfnEBGCRu+v0M7jyxGCP5h9PLjIw1B3QuBz8KuvwLoumnL2e3DLbf3W5TadGZct3Hfl2D03WGDLh6xc7qq4QbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asbZVeQl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6A6C4CEE4;
	Fri, 25 Apr 2025 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745582561;
	bh=eZPFTBz6yM2gMfLd3A3QWowYwwQJiwoej0l47rx+zYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asbZVeQloMPeww+Qs89fskH1vrKk4nw4P6Uupf360RcaPWx8ckq8AADihAs+vKaUw
	 HLNqKZmXb7SsCA5sRtCy2woY7aZbcd8AsuWOfSr1JZ5z+ozi5m4r/+D1aj8lFqGI+E
	 3zOfgQ8LsBYkfOGwGYRk26LuYGeFgB9TsKSCCDYVQOqSou0DkKRF7y01g1+cXyacKN
	 qGbjK063ViwCpe5HzWubE+mOsxWStsfoFQrepkTXz23JCwg+89bd6QlwqRcRj3VmIV
	 vqDunnWeNwp+zmkfQJ0cttU1Cv4gLXrDURVOkENmmbh8xPxeF8fveXNrtolTE5Iaqi
	 e0nY0pbVnQPcg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8HlS-000000004qm-40F9;
	Fri, 25 Apr 2025 14:02:43 +0200
Date: Fri, 25 Apr 2025 14:02:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
Message-ID: <aAt54vikoREWZyGY@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>

On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
> On 4/25/25 11:51 AM, Johan Hovold wrote:
> > On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
> >> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>
> >> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
> >> missing in the current PHY device tree node. The PCIe port can still
> >> function because the regulator L3J, which vdda-qref consumes, is voted by
> >> other components.
> >>
> >> Since the device tree should accurately describe the hardware, add the
> >> vdda-qref power supply explicitly in all PCIe PHY device nodes.
> > 
> > AFAIU the PHYs do not use this qref supply directly so it does not
> > belong in the PHY node (but possibly in the tcsr node that provides the
> > refclk).
> > 
> > Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> > qref supplies") it also won't have any effect for pcie4 and pcie6.
> 
> QREF is a separate hw block distributing the reference clocks across
> certain on-SoC peripherals
> 
> If its power goes out, I don't think much of the platform would be
> functional anyway, so it's redundant here..
> 
> It doesn't have its own single register region and it's frankly
> one-shot-configured way before Linux starts up, so there should be
> no need of describing it at all.

Then it sounds like the qref supplies should be marked as always-on. Can
they be disabled at all?

Johan

