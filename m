Return-Path: <linux-arm-msm+bounces-69231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C158B26876
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D431894345
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411603002D7;
	Thu, 14 Aug 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imZmxmTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BEF3002CA;
	Thu, 14 Aug 2025 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179860; cv=none; b=PC/8/bXWwcp8hcT1kRkMptRmC6eVwh+UFVQeSuJ6fU3iDO8xCEUpTDVUavRKZHtZYYl/2adCLPtt5UOSKQm8Owxti2nOBINtAxfyXG7x2sIxKomd3s11C2xvYZEls4znA+I57EabshnzoNM+Npk630GsQHBPf4jTySVU70VNFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179860; c=relaxed/simple;
	bh=HDp76a4HRw4RvUGfcdrg8MD9/AGTIv3ub3NY3or0h6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzAw6lp8pywjPAbjpqyyJSWpb2x8kIuCatIw/LTRlXD4+s4I2+WuCmMNHmHxtFi8JYFzV/UVDNhZRV7PThtWTme9KCzCeWT7VgJLCy8NkfZFR8f6GCOk89zDKDa/b32OVXJ4hGlkY9cvfo3oFdZEgqXlll0Hq0+xQEde8vtPbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imZmxmTd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED100C4CEEF;
	Thu, 14 Aug 2025 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755179859;
	bh=HDp76a4HRw4RvUGfcdrg8MD9/AGTIv3ub3NY3or0h6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imZmxmTdpe1DpQe2hutFLPJnz6FQ+NtHcttxRVtIWRW1vjq6Cz5z+4MRI3Qcdv0hp
	 0iwGzCyH4QvEh27XhRp9eROPm3kXdLBTUNId1qvLK7Y3Vhd0OXSJm+kHW45xQyVck8
	 GplxT5bs5/vAEjtXe3UhrJZXe9XQdvFgFd5prum3QO4z93uT+FRnRMyG9+bG5hAtI+
	 HSXxH/2hMcuv6Zsa+q3583JvcYa+DvwKHLGwGVnAImA+/IAWueIoFFAuikuxGa6HRE
	 3I/kNxoP7WT19h6GnMRJ2/CGFFD2uhEIZfBM8DCrztMzDvFCcPGvATyFPD7NoAjmTv
	 NHRvFICWhyOsw==
Date: Thu, 14 Aug 2025 08:57:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Harrison Vanderbyl <harrison.vanderbyl@gmail.com>, 
	marcus@nazgul.ch, kirill@korins.ky, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
Message-ID: <r52n5wfjsfrdotrawjes5pscrcyd5jwnsxkue7v5x55gq3ad3o@egwactada25n>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
 <tlkv63ccpnti367am47ymhaw3agjnyuonqstgtfaazhhptvgsp@q4wzuzdph323>
 <57ce520f-a562-471f-b6b4-44f0766a7556@kernel.org>
 <aa0ed59a-4eb6-4f7f-b430-4976ee9724d8@oss.qualcomm.com>
 <433e1189-e2b6-4299-9fa7-13e7994ec89c@kernel.org>
 <25c5vwdgrfar6rz657nyijan7ozo5nzyyxb2w26wf5rvxftkvm@wy2fbsi77prj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c5vwdgrfar6rz657nyijan7ozo5nzyyxb2w26wf5rvxftkvm@wy2fbsi77prj>

On Thu, Aug 14, 2025 at 02:26:07PM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 01:18:46PM +0200, Krzysztof Kozlowski wrote:
> > On 14/08/2025 11:46, Konrad Dybcio wrote:
> > > On 8/14/25 8:59 AM, Krzysztof Kozlowski wrote:
> > >> On 14/08/2025 04:42, Bjorn Andersson wrote:
> > >>> On Thu, Aug 14, 2025 at 10:59:04AM +1000, Harrison Vanderbyl wrote:
> > >>>
> > >>> Welcome to LKML, Harrison. Some small things to improve.
> > >>>
> > >>> Please extend the subject prefix to match other changes in the files of
> > >>> each patch, e.g. this one would be "arm64: dts: qcom: x1e80100: ".
> > >>>
> > >>> "git log --oneline -- file" is your friend here.
> > >>>
> > >>>> Describe device tree entry for x1e80100 ufs device
> > >>
> > >> This is duplicating earlier patches:
> > >> https://lore.kernel.org/all/szudb2teaacchrp4kn4swkqkoplgi5lbw7vbqtu5vhds4qat62@2tciswvelbmu/
> > > 
> > > (that submitter clearly expressed lack of interest in proceeding)
> > > 
> > 
> > Sure, would be good though to reflect that - provide summary of previous
> > discussions, changelogs or at least give links.
> 
> ... Also keep authorship and SoB chain.
> 

If it's based on those patches yes, otherwise no.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

