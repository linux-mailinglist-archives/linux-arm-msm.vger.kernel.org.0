Return-Path: <linux-arm-msm+bounces-102209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLY5DZot1Wli1wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:15:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FFB3B1997
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D99AC300B44D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA9539DBD9;
	Tue,  7 Apr 2026 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTJH3HPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A0365A1A;
	Tue,  7 Apr 2026 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578482; cv=none; b=F17FacA2jAJSHlAHCIKS24/WIdzWgD3xDrpD7kq1Wyl+XYhUZzCsy9cJgJROmNgRYGyLtB3Yk3BzIR1wm4d3qEQL+z3nNeLxUZF7HL5u8s57ZhjN6XXY6c5RrijaQOQE3cyg3t6eAsIvLBo2zPXVO6qAD9MySlFM9yvIMXyXGOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578482; c=relaxed/simple;
	bh=ZqEGbiuYC/vN2n2e3InviigO+xKELcCeDxb4xLIzDeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=timVkMoSsVwA1RAGFmmRiZR/UnCVMsiIUOtr5sw4IgtlbGa9gFk0JdDWkuHQYFOTtySgbKP8Ok02TCmAyA1geYHDUzhwvEbZe0omBrX1Jgl9ii3c1SeeG0tSbVZvF8OO4Z7Mi3HNK4ZVKySpSbj3zZJiO3O7a2twR1PMt6vUnEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTJH3HPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA945C2BCAF;
	Tue,  7 Apr 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578482;
	bh=ZqEGbiuYC/vN2n2e3InviigO+xKELcCeDxb4xLIzDeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTJH3HPyuyZ0weVFMpoAP2CmOV4b1JshlVkDZ9ruibsnmJm3AyVko/wI9aXCRJ8nK
	 xAsH+7p7pDd80jgSgDOKr9e4LiRV5v6V8z5voB4YH+cBzs7AglWlgZyojbfSV8TGFQ
	 5pgmFlC50tr5Rzp+xwMMge9iKkjU06MMgDlW0P4Li8fq2pR2TIvW5WcEf55TTTThyJ
	 ULK2E3GkMqY8s3a3T/9UuDYZyRmn7E++iRQ8vQiKZzesHRwF9ujozPUcKNu+R8+BF1
	 38srSJjQF0GwrIVUccDLtjCbVm+Z/UWO02L2XFxZC4a7wsQtIj5Ea0QtWpTm3HpHQt
	 fi7iDKc3y9otw==
Date: Tue, 7 Apr 2026 21:44:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Joe Sandom <jsandom@axon.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board
 support
Message-ID: <25g2sasffiq4axsamv2m5nywieucj3vbwfhvn66jtzjxoodfxx@vkswsycqju6g>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-5-895f8fc494fc@axon.com>
 <ehlhjfzekjnscro4ffydjhzfuiqhfkuyuxrk42x53cturzi4do@74y5k5ee6bv7>
 <20260407113925.4imd3lxkcrq47pu3@linaro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407113925.4imd3lxkcrq47pu3@linaro>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102209-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61FFB3B1997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 12:39:25PM +0100, Joe Sandom wrote:

[...]

> > > +&pcie0 {
> > > +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > > +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> > > +
> > > +	pinctrl-0 = <&pcie0_default_state>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
> > > +		    <0x100 &apps_smmu 0x1401 0x1>,
> > > +		    <0x208 &apps_smmu 0x1402 0x1>,
> > > +		    <0x210 &apps_smmu 0x1403 0x1>,
> > > +		    <0x218 &apps_smmu 0x1404 0x1>,
> > > +		    <0x300 &apps_smmu 0x1407 0x1>,
> > > +		    <0x400 &apps_smmu 0x1408 0x1>,
> > > +		    <0x500 &apps_smmu 0x140c 0x1>,
> > > +		    <0x501 &apps_smmu 0x140e 0x1>;
> > > +
> > > +	/delete-property/ msi-map;
> > 
> > Why?
> I tried extending the msi-map to cover the RIDs from the QPS615
> PCIe switch (matching the iommu-map entries), but this caused
> ITS MAPD command timeouts.

I'm not aware of any specific issue with ITS on this chipset. At what time did
you see the timeout? During probe?

> From what I could gather, deleting
> msi-map forces the PCIe controller to fall back to the internal
> iMSI-RX module, where this worked properly.
> 

That's true.

> For reference, I checked the RB3gen2 since it also uses a QPS615
> and there doesn't seem to be any msi-map defined (in kodiak.dtsi).
> 

But Kodiak has no MSI support (no LPIs). That's why the ITS node is disabled and
iommu-map is used.

> Any recommendations to resolve this properly?

I will also check internally in the meantime.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

