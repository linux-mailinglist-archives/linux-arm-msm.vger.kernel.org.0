Return-Path: <linux-arm-msm+bounces-87725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6010DCF97BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 17:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B82DB30DFBED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 16:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734D7330667;
	Tue,  6 Jan 2026 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SptdqJ7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD93BB48;
	Tue,  6 Jan 2026 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767717719; cv=none; b=ZLOMNwZbQV4RGmPtyRs1K551pXSkD30B0K3d1awTkGLuW4I2KwlCBSwSedtJHbihnkl5//SNtnOp7ZrzUxEO91PexepS/76SQbuJsqOlKbfU8yfmq5Y3voHJ1ogwglZuQ3gEtF5t6gfNf25LO+apkHy9rC+9dQxuCPHQqAMKeBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767717719; c=relaxed/simple;
	bh=5gY7fsBr9ub+zNkpZCbnrzp3q8QYMx0byeMr42X7x3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovDI1iUO+XQqFttD/VxQsdAKV49SAJDxtCWSQ9Omt9eg7lze6dB19+CFJu6K+cguKmBN367EVnfNi4Uc5lpgyohM2wBad0M5/dl+nU1kupwKaw/xnWfzvipkGsD1Hqr9OnXXJcSq9Yu0YmCctd6w9OVHtL3UMsQVZ8CJAEPjv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SptdqJ7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF87AC116C6;
	Tue,  6 Jan 2026 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767717719;
	bh=5gY7fsBr9ub+zNkpZCbnrzp3q8QYMx0byeMr42X7x3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SptdqJ7Hh+gwiBxEisM0+nE3hLFXLv0kxiifAk+aJZa/j9MqYbSarzPSZuI51n82f
	 w3EpKLcePo5HG//jvEIzO/1XVRESqxcLDWmgOuLIJXZ1QaN6GRqSM18zxU10CXkgWg
	 Q+TG9uZkW4mX9kxtD1RPW53kJZaLnBi3ND9MjUBNE1eFrIu+8nbFV0bXRz7lrTT9rs
	 FXQFSJJ+Pj88u1BAObuQ21Qwb3hLn2kiVv/Dbj1p8sCLEXBAAvMSzDm/VWmSjFpRYh
	 0RIskqNZWtDg+GPELpm6LdxFAHwX7xBPSjeQc9T0gZoatTsXbSwFXMnnE1iiNM8Bwg
	 BvJ0tCu502GNQ==
Date: Tue, 6 Jan 2026 10:41:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	martin.petersen@oracle.com, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V3 0/4] Add UFS support for x1e80100 SoC
Message-ID: <l67bnlyrrirb3rnz7izqpe4soqjuvkbi2xawit5w2wrcc74vdo@exo4mbpac244>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <y7lm6zqgbhk4243diyotvox75tcmzhgbkypbkaskrtjcjbruwm@ar7kjmiyv2wr>
 <0689ae93-0684-4bf8-9bce-f9f32e56fe06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0689ae93-0684-4bf8-9bce-f9f32e56fe06@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 06:33:19PM +0530, Pradeep Pragallapati wrote:
> 
> 
> On 1/6/2026 3:50 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 05, 2026 at 08:16:39PM +0530, Pradeep P V K wrote:
> > > Add UFSPHY, UFSHC compatible binding names and UFS devicetree
> > > enablement changes for Qualcomm x1e80100 SoC.
> > > 
> > > Changes in V3:
> > > - Update all dt-bindings commit messages with concise and informative
> > >    statements [Krzysztof]
> > > - keep the QMP UFS PHY order by last compatible in numerical ascending
> > >    order [Krzysztof]
> > > - Remove qcom,x1e80100-ufshc from select: enum: list of
> > >    qcom,sc7180-ufshc.yaml file [Krzysztof]
> > > - Update subject prefix for all dt-bindings [Krzysztof]
> > > - Add RB-by for SoC dtsi [Konrad, Abel, Taniya]
> > > - Add RB-by for board dts [Konrad]
> > > - Link to V2:
> > >    https://lore.kernel.org/all/20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com
> > 
> > Where did the previous changelog go?
> i missed to amend, i will update all changelog in my next patchset.

Please just adopt b4, go/upstream provides the documentation you need.

Regards,
Bjorn

> > 
> > > 
> > > ---
> > > Pradeep P V K (4):
> > >    dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY
> > >      compatible
> > >    dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC compatible for x1e80100
> > >    arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
> > >    arm64: dts: qcom: hamoa-iot-evk: Enable UFS
> > > 
> > >   .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   4 +
> > >   .../bindings/ufs/qcom,sc7180-ufshc.yaml       |  37 +++---
> > >   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  18 +++
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi           | 123 +++++++++++++++++-
> > >   4 files changed, 164 insertions(+), 18 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

