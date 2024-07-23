Return-Path: <linux-arm-msm+bounces-26920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D893A3B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 17:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAF8D1C22601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85086156972;
	Tue, 23 Jul 2024 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ/F1kSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A073D55D;
	Tue, 23 Jul 2024 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721748288; cv=none; b=JSE2xSiLS33dh55LnsXjenEkNq/OJJvlAnbd6+bY7B522bQj/pe+ETkPMCLTgdeXgWGj90SYUY4Yx1MMWHf779CQHPOhTP4V19DtJ/sF813mWltn1TfZND1vqsSKul2n425jMcem7Uh5C/tMKYdg4b9kf4Gs4r+LmsfY0r4DjYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721748288; c=relaxed/simple;
	bh=dohcu7uOihTyTEi4nFcjN51ggUN5yjixHpV42IvzYhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiVqwHflXAWaWeB6k5TETby+VTPNBH8MCqWyIQS1m8Bo2lxLhnjxlZc9XGdynaPJptzEJn44KFuNSNHDK2ep0jGtoPAov6SaE+W/j5CWoXxZKWw9K/LLLdbVNRRYXSvLwm7L+Wxp7SOpWGjb/dW/4Ys4ty+Xkl7qf8oomvLeGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ/F1kSY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61B5C4AF0A;
	Tue, 23 Jul 2024 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721748287;
	bh=dohcu7uOihTyTEi4nFcjN51ggUN5yjixHpV42IvzYhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJ/F1kSY4yfVfn5e8MhSvH15MpkDjKAyU6GK3apBCi2J4S8m5DSLfjcd9xDYG23ai
	 1QElkbqNQdjpWZ6N+APzgsvKTrLs4R47JJBQzTuUTwFldfouNOU7ancgmTACr6TLMH
	 JU5IYcOx7p/PcStGqKVvX5AZ1HplhCdEXPH9LBuP9vgrhn75RWvtFjd5BWU4+5SdrV
	 YQth2LyuHUVxWzxIMFibp/YiHgtWHofXZYdmD3M39joWaK9p8cKIWNbvtl0oxk/ohr
	 HH89Q1lZ1DWYXo4I4Qu2ZyFtQ8uN0LcPh+Q421ziRXnOQKKoBlhiEXka9A9fzSIr7U
	 3c89m4M5Hb8YA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sWHNe-000000000KM-2fqO;
	Tue, 23 Jul 2024 17:24:47 +0200
Date: Tue, 23 Jul 2024 17:24:46 +0200
From: Johan Hovold <johan@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100: PCIe fixes and CRD modem
 support
Message-ID: <Zp_LPixNnh-2Fy5N@hovoldconsulting.com>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
 <172170324360.205121.298903694803259916.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172170324360.205121.298903694803259916.robh@kernel.org>

On Mon, Jul 22, 2024 at 08:57:30PM -0600, Rob Herring wrote:
> On Fri, 19 Jul 2024 15:17:15 +0200, Johan Hovold wrote:
> > This series fixes some issues with the current x1e80100 PCIe support,
> > adds the PCIe5 nodes and enables the modem on the CRD.
> > 
> > The fixes should go into 6.11, but the modem support depends on them so
> > I decided to send everything in one series.

> > Johan Hovold (7):
> >   arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
> >   arm64: dts: qcom: x1e80100: fix PCIe domain numbers
> >   arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
> >   arm64: dts: qcom: x1e80100-crd: disable PCIe6A perst pull down
> >   arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
> >   arm64: dts: qcom: x1e80100: add PCIe5 nodes
> >   arm64: dts: qcom: x1e80100-crd: enable SDX65 modem
> > 
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 110 +++++++++++++++++--
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 125 +++++++++++++++++++++-
> >  2 files changed, 224 insertions(+), 11 deletions(-)

> My bot found new DTB warnings on the .dts files added or changed in this
> series.

> New warnings running 'make CHECK_DTBS=y qcom/x1e80100-crd.dtb' for 20240719131722.8343-1-johan+linaro@kernel.org:
> 
> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1c00000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#

I was surprised about this as this property is already used by this DT
in the upcoming 6.11-rc1 (for the NVMe).

I found this thread were Abel tried to add the property to the new
dedicated x1e80100 schema, but received some push back:

	https://lore.kernel.org/lkml/20240604235806.GA1903493-robh@kernel.org/

Looking at the back story for this, the alternate name 'vpcie3v3' has
been used by some non-Qualcomm controllers since 2016, while Qualcomm DT
has been using 'vddpe-3v3' since 2018. And it's been clearly documented
as part of the bindings the whole time.

Earlier this year, 'vddpe-3v3' was incorrectly removed from the Qualcomm
binding, which results in a checker warnings for a bunch old Qualcomm
DTs. I've just sent a patch to restore this Qualcomm name here:

	https://lore.kernel.org/lkml/20240723151328.684-1-johan+linaro@kernel.org/

If we want to replace the Qualcomm specific name with the alternate name
then this would need to be done by deprecating the current name, while
adding backward compatibility support for the old name to the driver.
I'm not sure anyone cares enough about this inconsistency to actually
pursue this.

Johan

