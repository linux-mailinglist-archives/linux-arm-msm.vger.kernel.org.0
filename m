Return-Path: <linux-arm-msm+bounces-71345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BEB3D820
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 06:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059C01897B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 04:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6591F5617;
	Mon,  1 Sep 2025 04:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWNC2VsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9AD249E5;
	Mon,  1 Sep 2025 04:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756700128; cv=none; b=urd/pgXOHKgOXYU6qyF926DbzCZnSFdMoiPvQIpSfkpwNoZQVEjZxoC2yiVOT/tIW5qVSHj4rla0X4CJD058RcvsPhZnoDwocbFRrlSOe0Hg2jG0mcOcMZ46UDI1l6vigZak8M8k9RXzs4CBJeX1jtrC/rcQF7V22+p01OF2JN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756700128; c=relaxed/simple;
	bh=YXk2KfK92/eOnyJwfxhnrO/hY47dgjiPwaZoS8YSIYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utP7T7YWmcMNIbyuecd3jF+JH2hOeX9tcMZilhJWoLuDZliH9nbJsuGv/O4pSDchpgeCtiysRfsls0Oxdqte2HcPkfBM6uneYzhKfWWIdnvMfDL0K4Fk+NCxzV7zc5F+c8x4TELAFxKLcQiPl93v8eYqN1OBo3ejSZkct/OUqdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWNC2VsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C245FC4CEF0;
	Mon,  1 Sep 2025 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756700126;
	bh=YXk2KfK92/eOnyJwfxhnrO/hY47dgjiPwaZoS8YSIYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWNC2VsP37aZlHVay7W1Reb4TiZbR8y7Q2prQQEGZvtLTiIVuQKZpOvBysQWWBxyI
	 I9BqnvBwMffKNi5i8N7I239+9AbeGgZ04zxCJpN516voLaBE0UK4n0CCmJ7HAAA3Zd
	 HGLfEnLJGic6i55WZA91g5xPFnaZbzZ9091/ySR6wweH4HYBZ8EeHQf1VNzSkHPf1B
	 jqdFB1zHutY9y8qe8POEHbreKbniAvDjFNjoX1mUJJ7vHzraQ2DP8gny8G+U85gfIu
	 6zQ412plsLmnnyFky8j5TB0cH7VrXuWyzGRagwZCz+TY6T/yuvclwomWY1YZLNyf3o
	 0tbNsbHQKxepQ==
Date: Mon, 1 Sep 2025 09:45:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
Message-ID: <aonf4hobz6b3a75lwiblu44gxvae4hnp2mcnh5sqlyzo6k7hwe@a5toymspbkdy>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-5-quic_rdwivedi@quicinc.com>
 <eeecc7a3-8ce3-4cfd-8d40-988736fc0c59@kernel.org>
 <34aqaxgkykyhenrjfj3vrarin2c3uebgfaya7rxi7d5p5skhom@ie4gitcw36mr>
 <ba227580-add8-4ea8-a973-c39083301e67@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba227580-add8-4ea8-a973-c39083301e67@kernel.org>

On Sat, Aug 30, 2025 at 10:43:09AM GMT, Krzysztof Kozlowski wrote:
> On 29/08/2025 18:18, Manivannan Sadhasivam wrote:
> > On Thu, Aug 21, 2025 at 01:49:36PM GMT, Krzysztof Kozlowski wrote:
> >> On 21/08/2025 13:24, Ram Kumar Dwivedi wrote:
> >>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
> >>> on the Qualcomm SM8650 platform by updating the device tree node. This
> >>> includes adding new register region for MCQ and specifying the MSI parent
> >>> required for MCQ operation.
> >>>
> >>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
> >>
> >> I don't understand why you combine DTS patch into UFS patchset. This
> >> creates impression of dependent work, which would be a trouble for merging.
> >>
> > 
> > What trouble? Even if the DTS depends on the driver/bindings change, can't it
> > still go through a different tree for the same cycle? It happened previously as
> 
> It all depends on sort of dependency.
> 
> > well, unless the rule changed now.
> 
> No, the point is that there is absolutely nothing relevant between the
> DTS and drivers here. Combining unrelated patches, completely different
> ones, targeting different subsystems into one patchset was always a
> mistake. This makes only life of maintainers more difficult, for no gain.
> 

Ok. Since patch 2 is just a refactoring, it should not be required for enabling
MCQ. But it is not clear if that is the case.

@Ram/Nitin: Please confirm if MCQ can be enabled without patch 2. If yes, then
post the DTS separately, otherwise, you need to rewrite the commit message of
patch 2 to state it explicitly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

