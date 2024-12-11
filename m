Return-Path: <linux-arm-msm+bounces-41473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 679849ECB7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 12:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDAC3165781
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB11C211A04;
	Wed, 11 Dec 2024 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prW8fMoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97C238E27;
	Wed, 11 Dec 2024 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917343; cv=none; b=NUu3uJun+GWsFTrq/0JXwiDL/rulDspNfM9oQVKQifjcNNfVyd+7sFJKWppvqyjsL1NWNH6LecmsBzzcD/Kz6HTf37vq8scEH017gaxbU60uBPAYD+gwYvpiiXxjxhzR+StDPhxI5nqMGN11lco8XS3iLIlbltuAHFP1DW5m1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917343; c=relaxed/simple;
	bh=yedsCnzVN74BVIIARNATqyJIu4NbvsCe8HTrkCpphMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lV9Z+WNkSSaXfewmtUiXdetTmzreQa+dTxfLpoOCnuZQaxyTKCPcG/FeL2caFOe7nejk8BxozOAxTrrEw3+enc2+NAPWcsCvHyO/GSIWboLqKGAh0BuiBsq6iF1Sl4da9JUSdN11orl5qRRyMKJw8KLIri13wQrP+s04BJO8Lhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prW8fMoh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0909BC4CED2;
	Wed, 11 Dec 2024 11:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733917343;
	bh=yedsCnzVN74BVIIARNATqyJIu4NbvsCe8HTrkCpphMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prW8fMohAf8HEEmGWWarvi6CXE3aB8pEsbfCs2fqiF76+pyZbFFpz3wByAildGDgd
	 0CC/UI3QjptdF7xpSTJmkqgufOXLQrWDBpIK7ql/DNIMFZCQQPCrmXaizavSWIFA19
	 jhK5HfLmN+3K/86DRdHr7xcn7+cNjbDYS15liX30EArh8wW99MscUJSuhDHlyZuy/G
	 W8WJmH831FMEOzFQYBrVUJLAL1gc2yMV4ssb0nm6pp3lYCtIBrMWFdpgxwTsvFUCaA
	 rnMKvVMxMI5+vGMV4drhz9Nr9gIcN3VE3Q9ozoUBtS3LD+4VWK7R1Gg/+XM/Jh0sCT
	 4wP5JphFsvqkw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLL6o-000000002JR-1ZW6;
	Wed, 11 Dec 2024 12:42:26 +0100
Date: Wed, 11 Dec 2024 12:42:26 +0100
From: Johan Hovold <johan@kernel.org>
To: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB
 QMP PHY supplies
Message-ID: <Z1l6omxQoKKAyqSS@hovoldconsulting.com>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <20241210-x1e80100-usb-qmp-supply-fix-v1-5-0adda5d30bbd@linaro.org>
 <CAMcHhXpvwR50GCkTvtkmWW4mvV5o9vbMvrvqLiEkJpKDHP_REA@mail.gmail.com>
 <CY5PR19MB61475B208EC527ED7143B536BA3E2@CY5PR19MB6147.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR19MB61475B208EC527ED7143B536BA3E2@CY5PR19MB6147.namprd19.prod.outlook.com>

On Wed, Dec 11, 2024 at 11:35:37AM +0000, Tudor, Laurentiu wrote:
> 
> Internal Use - Confidential

Looks like you need to fix your mail setup for when you're interacting
with the community and mailing lists.

> > -----Original Message-----
> > From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Sent: Tuesday, December 10, 2024 10:45 PM
> >
> > On Tue, 10 Dec 2024 at 10:07, Stephan Gerhold <stephan.gerhold@linaro.org>
> > wrote:
> > >
> > > On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> > (i.e.
> > > USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2 are
> > > actually powered by &vreg_l2j_1p2.
> > >
> > > Since x1e80100-dell-xps13-9345 mostly just mirrors the power supplies
> > > from the x1e80100-crd device tree, assume that the fix also applies here.
> >
> > Though I can't verify schematics (perhaps Laurentiu can?)can confirm USBs
> > still work as expected with this change.
> 
> Yep, just checked the schematics and can confirm.

Thanks for confirming.

Johan

