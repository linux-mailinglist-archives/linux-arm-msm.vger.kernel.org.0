Return-Path: <linux-arm-msm+bounces-43272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073AC9FC1A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A6381884986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 19:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C5815381A;
	Tue, 24 Dec 2024 19:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfjQ3GKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191D18AE2;
	Tue, 24 Dec 2024 19:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735067951; cv=none; b=d9qMSYgHSm/86Lm06B4FZWBRDpfqgACT2BzqbQFDUwttOqvBTRFFC90LLH5vr1dKGVUDikXmpv11F9a3JI600nyw9Pre/lLjnKAh1a4/E9hJlKTrdcKEoucABkMT7KxSpVxO/5ROLMFyb6ktnT3HF80xx42X+xvKmTy51Yer/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735067951; c=relaxed/simple;
	bh=/S6xr0AyVMFjE/yJ1Flixxto4mjlZUmMMHGYCrP+lLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyQAe/aODBNU5EesxlYBWtT79iGycCCRUHsQAfzpsLLadtVLUwPaFMkyqLP9E17KsDcwhAIf9r9zZt8mwIaC7C0u9vbkwpnRCX5r7HbfKZDI6CzlMtMYyylwBaj56zLO9yEZV5/GlE3zqE0LA5XaoaEK8IWfNGkE5l/LjHp/ohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfjQ3GKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4D4C4CED0;
	Tue, 24 Dec 2024 19:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735067951;
	bh=/S6xr0AyVMFjE/yJ1Flixxto4mjlZUmMMHGYCrP+lLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfjQ3GKhGZVLE3UR5HFV+NpvXj5HPnKhJylH9pJtVmu1zTV9qU/AZesuc9qlzyFIX
	 QbaM4VMwFXxSRQwQOBzkG9PTofdyI8NkXGx+2CXC9qp6OQaXoD53CqlF10FCc1fRT6
	 4gF3u6Kx285+EQ1VPoxat4Awpsi08an+78nmthff0p2sRhqyWiXhuPYHUvFoMrysAp
	 Ewd/HVvDLaJQp3d7g5sLvz3HHFkylcR2PlE87kI2yFP41MWxbht7yh6w4n1x+GqIFk
	 i2UO72TOzM3WgwDn4ORdgw55GMNOla3OtypvnXZXV0nAvadHR1NcEYt2YhrO2a/5jB
	 vEY1App0k8+Ew==
Date: Wed, 25 Dec 2024 00:49:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
Message-ID: <Z2sJK9g7hiHnPwYA@vaman>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>

On 24-12-24, 17:38, Dmitry Baryshkov wrote:
> On Tue, Dec 24, 2024 at 08:55:18PM +0530, Vinod Koul wrote:
> > 
> > On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
> > > This series aims at enabling USB on QCS615 which has 2 USB controllers.
> > > The primary controller is SuperSpeed capable and secondary one is
> > > High Speed only capable. The High Speed Phy is a QUSB2 phy and the
> > > SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
> > > 
> > > Link to v1:
> > > https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [2/3] phy: qcom-qusb2: Add support for QCS615
> >       commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97e
> 
> Is there any issue with the two remaining patches?

Something wrong with b4... I have applied 2 & 3
Patch 1 should go thru USB tree

-- 
~Vinod

