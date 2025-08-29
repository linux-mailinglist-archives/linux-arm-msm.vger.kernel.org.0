Return-Path: <linux-arm-msm+bounces-71251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88123B3C073
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 18:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFD61C803D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 16:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242342D321D;
	Fri, 29 Aug 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSVpmAqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B5225416;
	Fri, 29 Aug 2025 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484314; cv=none; b=QWJupE3SWxMatnIyCPdC3X2IQ4lFWDZf5LRsatcJl+42Euw/0C3lbxMBxzRM1nqLSAoyuPY9GQChrIpilhZCwBSfiRi96fGQZh+ksy3RYP8NRsjOTXAYwdGrv0ceqqmcYnx9Za2v6BPIPpf2camH1E6msZc0LmYZI1DuSPVw/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484314; c=relaxed/simple;
	bh=MFQsfv8Cz9Oh1G2afn6djZh8geSo030aLbqRSoj5J+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs+Yk9Hdj+JfdCob/uzD/xArh3lHf5FebovYtcGW+sHexPxUevHml/Amz68ELZwDGtS5+CUMWu1XZAB0VnNTDhky05yPMaHeyc+VTA0lmcEvLmEI8HsQx1eqKPuW9XCgoYORpLdwHoCM1dg/SGMToyWIZTLv4t/9tdTupoSp1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSVpmAqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C064CC4CEF0;
	Fri, 29 Aug 2025 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756484313;
	bh=MFQsfv8Cz9Oh1G2afn6djZh8geSo030aLbqRSoj5J+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSVpmAqEVBzfccSg3L0kOe7HQQ2MdIJDImfKIRoY7pDaC/4VhiG7756xw7IulSsY8
	 /ksu+Y49nSACdEB0VI3vvJFu+QiwOriwa15jIfwP2cc0jv6FCiiGtEhWaQnz03oX9k
	 NpgFm+ExKAShT4785PhhZ1JjHkEZ9dOrf228yfBiy+dU75FnJHHo5PPs0yBkvva41M
	 7dD7OMRXJPELd26COxsysM3mrJzpXtyK0m4972GdrMwxju3KT6+X/TzIsydXY6KGd/
	 pCRyTBUTlQeHRlCvvwnuiI7dsjhw3nozF6d+eGspG0bhnNT23FUdxkHgF7FwR67AI7
	 PC2DkV0l75y5w==
Date: Fri, 29 Aug 2025 21:48:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
Message-ID: <34aqaxgkykyhenrjfj3vrarin2c3uebgfaya7rxi7d5p5skhom@ie4gitcw36mr>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-5-quic_rdwivedi@quicinc.com>
 <eeecc7a3-8ce3-4cfd-8d40-988736fc0c59@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeecc7a3-8ce3-4cfd-8d40-988736fc0c59@kernel.org>

On Thu, Aug 21, 2025 at 01:49:36PM GMT, Krzysztof Kozlowski wrote:
> On 21/08/2025 13:24, Ram Kumar Dwivedi wrote:
> > Enable Multi-Circular Queue (MCQ) support for the UFS host controller
> > on the Qualcomm SM8650 platform by updating the device tree node. This
> > includes adding new register region for MCQ and specifying the MSI parent
> > required for MCQ operation.
> > 
> > Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
> 
> I don't understand why you combine DTS patch into UFS patchset. This
> creates impression of dependent work, which would be a trouble for merging.
> 

What trouble? Even if the DTS depends on the driver/bindings change, can't it
still go through a different tree for the same cycle? It happened previously as
well, unless the rule changed now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

