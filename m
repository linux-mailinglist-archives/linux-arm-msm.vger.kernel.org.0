Return-Path: <linux-arm-msm+bounces-51100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C2A5D878
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 09:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17FE189D458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 08:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3062C2376FA;
	Wed, 12 Mar 2025 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHmsYWCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03662236445;
	Wed, 12 Mar 2025 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741769055; cv=none; b=eucAw5JxgKmbZKa54YlDHOQFUwmw6t1q/APp3pJfBNUKuJnMxX9HJMUUSx1+AvIR41T5iO7ZZvTycHHlQt9QMt8ybnlHfhZps/w3iTUWGs8Ye8RlNa6gbGLLU2sCWSQIPm+A5RRV0vcB74mKIxsboLJVDOYUKAcW2irPryflHLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741769055; c=relaxed/simple;
	bh=90jj+F1PoWmDkHrasAfWGfMv1PJi2auNqpCIRetLGdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5xUCopZzOclKZtn4od92OxNmfdgOLR1GBS5nQPZfV05UAVJ7n6IH+69QLNPdfgGWmfWoygVyoMqXE16z4KMTvUJoP36p0YswvVEhw64mswpmMhvLKMsrqZUJ6sONKZ9B97+hMPZ68x0U/qfdL9QNWlbnZwHQaNzOYm3AxyfmrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHmsYWCH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6A1C4CEED;
	Wed, 12 Mar 2025 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741769054;
	bh=90jj+F1PoWmDkHrasAfWGfMv1PJi2auNqpCIRetLGdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHmsYWCH20ivwHnzwwENo7L3r+EjwK4dZp/ZLdRGgej60MBYAkt9v7bGB2hqwjnxi
	 ER/Wsr7SZc3QVrLQbRzD3CztAk3qOviT+4+chhrq9vJ5uLmCihcdmdmZHdU1Qy7FsR
	 7feOyGXeGFo1eX7XgQ5vcdqn4amzn0WojhF3z47oR6dq3OSQeGgHdriSqTbYyPjGL1
	 3kabv87vlyazujPXpPF3vyI7au0smv5CnOxWEkNH+B5nZ/WByztkQWRkFl7kKirkyD
	 WlnKeCsdOAduV5VCMhiB1tPDbqSfNU/WooQP3QWPdc/7UYZ60DDJuF5LLDxVX5GcrO
	 6FMS2a1OlNuhw==
Date: Wed, 12 Mar 2025 10:44:10 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
Message-ID: <rj4jtqchuetrbtczbhvaa5hcp5olumwdbao3x4pulkxiqcq2ag@v6ftffk6bcc5>
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
 <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
 <43450c5e-837c-4215-9bb4-69066b175832@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43450c5e-837c-4215-9bb4-69066b175832@quicinc.com>

On Wed, Mar 12, 2025 at 12:41:38PM +0530, Pratyush Brahma wrote:
> 
> On 3/12/2025 12:23 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 06, 2025 at 07:13:17PM +0530, Pratyush Brahma wrote:
> > > Add the PCIe SMMU node to enable address translations
> > > for pcie.
> > > 
> > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
> > >   1 file changed, 75 insertions(+)
> > > 
> > Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > Though I see a little benefit in having this SMMU node if it is not
> > followed by the PCIe enablement.
> 
> Thanks for the review!
> 
> PCIe enablement changes for qcs8300 have been posted already [1] and [1]
> needs
> this patch as mentioned in [2].

Ack. In future please consider posting series in a logical way: if PCIe
SMMU is only useful for PCIe and it is required for PCIe to work it
makes much more sense to have it as a part of the PCIe enablement series
rather than having it as a separate patch which can easily get lost.

> 
> [1] https://lore.kernel.org/lkml/20250310063103.3924525-8-quic_ziyuzhan@quicinc.com
> [2] https://lore.kernel.org/lkml/20250310063103.3924525-1-quic_ziyuzhan@quicinc.com
> 
> -- 
> Thanks and Regards
> Pratyush Brahma
> 

-- 
With best wishes
Dmitry

