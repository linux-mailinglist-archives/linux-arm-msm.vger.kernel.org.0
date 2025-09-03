Return-Path: <linux-arm-msm+bounces-71935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919BB42B2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 22:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FCF3166D8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 20:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D063002C5;
	Wed,  3 Sep 2025 20:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgtUkDtT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2E19DF4F;
	Wed,  3 Sep 2025 20:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756932181; cv=none; b=cGe3+nXwCFohx2g5te8mtE/QQPaQLplYesHwKLVYBCt/T+UdZXPl/PYynZCs4AuGV3r11Dk3SM5od2JTWuBXvopYrxsI40CM9Y9aRBgsHJ8zKLS/Cv2BXXafPK/sFU09GYxy9c1N9XixypDnP5a5mLglxfNqzj4gHjxSBqBjxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756932181; c=relaxed/simple;
	bh=OTKFLx3AZmnlm9iS132S11exfYMGclgGd7dSe0lctWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRwo6k6vQKbWp3KgS0rph9Zu5yDcbREUnU9raU9GuBmEgWtd8TnvBDS4Citoj+lI9QLjW5nu7oTYkKEIbCjwzo9AF6YYspzucJElHpTJ930pgXB/wqQEzpyB+uFaDyhrLpKS9NSJlN5FVVMEVXapg+nuTt2sBwD3fD4XiWxaMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgtUkDtT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9127AC4CEE7;
	Wed,  3 Sep 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756932180;
	bh=OTKFLx3AZmnlm9iS132S11exfYMGclgGd7dSe0lctWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgtUkDtTNvA8lCZdooJ+/klQIRyw13Ga4vK006+8TPUKgL1YQyHplowJsXgBilDzd
	 0dwDM/KUxkWJTopYZTzMIHDdPLIO//Nx/TC9ioRFaAvna/AynaPPzlRcp1rllX88b/
	 R8cB9bwupg1JKgcgGF9XNFnQ19NwQP12Uk0/apA+npD/7URUN/SDkPupsHTUCs9v2S
	 1YoSp1GldkL/Bc/DPJkSBfOCvAErFlVaySDMxSB3vcXv/Slphz+8kwWgPB5qQxAQzM
	 nlhlBDiTvw8HqyYfJo/OyuUQ+FWpvbf+pMwpaSylmvf3ch+i+o9uZF9606+FTwo6OD
	 pronS80wXpb0w==
Date: Wed, 3 Sep 2025 15:42:58 -0500
From: Rob Herring <robh@kernel.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Sarthak Garg <quic_sartgarg@quicinc.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com,
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V5 0/4] Add level shifter support for qualcomm SOC's
Message-ID: <20250903204258.GB2663015-robh@kernel.org>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <3453985c13aa51d068c0174e51e378fb@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3453985c13aa51d068c0174e51e378fb@manjaro.org>

On Wed, Sep 03, 2025 at 10:24:55AM +0200, Dragan Simic wrote:
> Hello Sarthak and Krzysztof,
> 
> On 2025-09-03 10:04, Sarthak Garg wrote:
> > Add level shifter support for qualcomm SOC's.
> > 
> > - Changed from v4
> >     - As suggested by Krzysztof Kozlowski Renamed the property from
> >     `max-sd-hs-frequency` to `max-sd-hs-hz` for clarity.
> 
> I just spotted this series, so I'm sorry for jumping in late.  To me,
> "max-sd-hs-frequency" was actually a better choice, because it goes
> together with the already existing "max-frequency" property.
> 
> Yes, "max-sd-hs-hz" is obviously more clear, but to me, consistency
> is more important.  Just my $.02.

It's about defining the property units as 'frequency' could be kHz, MHz, 
etc. Unfortunately 'max-frequency' existed before standardizing with 
units.

Rob

