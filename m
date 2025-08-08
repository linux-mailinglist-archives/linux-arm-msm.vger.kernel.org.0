Return-Path: <linux-arm-msm+bounces-68079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF0B1E36C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6580718C616A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 07:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135AC24A067;
	Fri,  8 Aug 2025 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXTtI64z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA85F2264D9;
	Fri,  8 Aug 2025 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754637953; cv=none; b=dZ3lmC3jTAJeWX8+c1WKxlNt42W3CbxTGsg0NHS17lySAFqf9jUxRtBGcr+HO6pn49IrYyJlf+w60ONYQm5ioZ+/SeagjDcu9CkMArDiBjhV//aOsVYqT/cG69XbW+NmEutdikGR5abtmFdzudgPMSPqx1+MQ1QUVHaue5dduyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754637953; c=relaxed/simple;
	bh=4dII2zr2lKG9KmcQeK6dVUXaq5kcE5zY11ZU5f2bPgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us9bN5lJqPn/7X7Lfv3vLzc/M9yvPFTBNv+AKL7dvaojjfwMwdEmf5rpLw0Q86sOhgjXWnqIEOWIYsggzQQ3m+wxuQLVfPh8e6LS04Wjc+vK0b5bR/wYttFnqqpw3insNGTGqaOE32EbXkLESkbFu0JyrtGDbvtvbPVKhyDZiAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXTtI64z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65B5C4CEF0;
	Fri,  8 Aug 2025 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754637952;
	bh=4dII2zr2lKG9KmcQeK6dVUXaq5kcE5zY11ZU5f2bPgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXTtI64z0GrM2KCRlY7jZll6v0CI43RH8gvE1J0dHa1btco7q0ce7u9SfUvBjhEkR
	 l8Hpqw60ozUF8506LpOZQ7vAykFNVg7gO6NdgQ5SPjVBnrAN2YJ/B71Y8hDeZFoqU7
	 ASCL5CkasD59/6lhGl/fpisNjKmBe4qyJbXSuznk1s200imVGOAaWU/K7N19hJC17w
	 SgcUopvrdnVYYytb+cqEp1kJ7qXiLzJb1wDDfcCQy2aDgYGBIR4mpKYL8botCUgz/9
	 aVweM7F5c41FPLpQ2taYyAx4OeXec3zGY1RRazGi+6SJSMMz4wf9h6TPkFHE0EzQwS
	 xdVd6sIa4X+vg==
Date: Fri, 8 Aug 2025 09:25:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, 
	conor+dt@kernel.org, bvanassche@acm.org, andersson@kernel.org, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <20250808-unbiased-classy-heron-cd7f3f@kuoka>
References: <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
 <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
 <acf89420-743b-4178-ac05-d4ca492bfee3@sirena.org.uk>
 <599b8a4b-324a-4543-ba27-0451f05c3dfd@quicinc.com>
 <3aa82f65-4812-4bf0-9323-96f40824a004@sirena.org.uk>
 <685e3d36-c0e3-4faa-b817-aecc15976a25@quicinc.com>
 <c1435858-6288-4525-8c92-e27ed86cb55e@sirena.org.uk>
 <31461227-3f3a-4316-9c8a-c851209d0278@quicinc.com>
 <4efc8a3a-ceb6-40dc-b877-328b86348e0b@sirena.org.uk>
 <52625e59-c7d0-45d1-8af3-d9958c5ef01a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <52625e59-c7d0-45d1-8af3-d9958c5ef01a@quicinc.com>

On Fri, Aug 08, 2025 at 02:15:31AM +0530, Nitin Rawat wrote:
>=20
>=20
> On 8/8/2025 12:15 AM, Mark Brown wrote:
> > On Thu, Aug 07, 2025 at 11:26:17PM +0530, Nitin Rawat wrote:
> >=20
> > > 1. Regulator and PMIC configurations are board-specific, meaning they=
 can
> > > vary significantly across different platforms. For example, some boar=
ds may
> > > use different generations of UFS devices =E2=80=94 such as UFS 2.x =
=E2=80=94 which come with
> > > distinct power and load requirements and some with UFS3.x which has i=
t own
> > > power/load requirement.
> >=20
> > Requirements from generations of UFS devices presumably come from the
> > UFS spec and should just be known though?
> >=20
> > > 2. UFS PHY load and PMIC requirements also varies across targets, dep=
ending
> > > on the underlying technology node and the specific PHY capabilities. =
These
> > > differences can be influenced by the MIPI version or other implementa=
tion
> > > details.
> >=20
> > If you've got non-enumerable PHYs that have a big impact that's a much
> > clearer use case for putting things in DT.
>=20
> What I meant is that different boards may use different UFS parts, and the
> associated PHY load requirements are not governed by the UFS specification
> itself. Instead, these requirements depend on our specific PHY design and
> MIPI, which can vary across platforms.

The UFS controller knows which device it has attached - 2.x or 3.x - so
power considerations are known to the driver.

>=20
> Because these characteristics =E2=80=94 such as load requirements =E2=80=
=94 are not
> enumerable or automatically detectable, it makes sense to describe them
> explicitly in the device tree. This approach ensures that board-specific
> variations are accurately captured without hardcoding them into the drive=
r.

But you never came with rationale why given board has that value.

All this is done ONLY because downstream has it.

Best regards,
Krzysztof


