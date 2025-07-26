Return-Path: <linux-arm-msm+bounces-66757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B8CB12B5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 18:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D78C3BC0BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 16:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26864276023;
	Sat, 26 Jul 2025 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFeD3pzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DA1F473A;
	Sat, 26 Jul 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753546174; cv=none; b=jTbB5FMoXmK65W5vxDez/DM/IV/knJH+jhYKPTo69Cojdcj5XiKnfrBRyRlkdHjrlv8QfU/NacGIfVSXaXT6JBvV0Z7NY+hLM6EsRj63vsby4U4JHhytM+aXTx6e3XlpN5Ax1C+JlOHxykVfzsLNm2Tbs4WXqufhnbabqgPqFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753546174; c=relaxed/simple;
	bh=zGhm9cGrLInk87ZM6CuHQbsPnqmOPsIF+UQoiuaBFWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUbG2VtJdHFgIELjsrEH/8MGq4OiLfRnclS7iSjk+lHZEbjizsFSnt1UDLAUrzD2L0Fhwmsc6hdKnnumXnIA+UwFh+ZLX1Tf63ot/d2srqSpuuTMM3FBQ8UoWX4b4v4FGY8e90yzyQvZfmPKJOhXkQty2FjlISIJ1aa0IAmDRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFeD3pzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC5FC4CEED;
	Sat, 26 Jul 2025 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753546173;
	bh=zGhm9cGrLInk87ZM6CuHQbsPnqmOPsIF+UQoiuaBFWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFeD3pzfrqawsjoygKNa2OYK1mUDi84CYqacznSznpb8EV/75vZsotw2VE1+O2k/T
	 scsIKENP/t7K4OtgtRXw/3wX29CS27Li2lLuHiAF2TAOaIrA9Yl+TNCvezu9QAPKvN
	 DNXVNRDOEsT672eZEIClpB0McFE2sgzMpUKTm45F65iUukO4fVJQqzbDdMPRaxMoX4
	 N2qRum08MdcYEDg0XaW+zqLr8+KXK1qBaqI9YndKjYvpQMEwhE4ZBMwBAsTvmEOGY5
	 MhfsKNJk04x9LvgLMis4rhQ6YQr0Erh90wI7ZF4q2+fERx9l60gz9RTZ4MGrnswwzo
	 d94V/iB8FOOPA==
Date: Sat, 26 Jul 2025 11:09:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 0/7] Refactor sa8775p/qcs9100 to common names
 lemans-auto/lemans
Message-ID: <pzkceoriu5cgvidt4xekauyc2ovqkbuoi32bbornr2wbxmombh@7visdfuos6ml>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250723-angelic-aboriginal-waxbill-cd2e4c@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-angelic-aboriginal-waxbill-cd2e4c@kuoka>

On Wed, Jul 23, 2025 at 10:32:43AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 22, 2025 at 08:19:19PM +0530, Wasim Nazir wrote:
> > This patch series refactors the sa8775p and qcs9100 platforms and introduces
> > a unified naming convention for current and future platforms (qcs9075).
> > 
> > The motivation behind this change is to group similar platforms under a
> > consistent naming scheme and to avoid using numeric identifiers.
> > For example, qcs9100 and qcs9075 differ only in safety features provided by
> > the Safety-Island (SAIL) subsystem but safety features are currently
> > unsupported, so both can be categorized as the same chip today.
> >
> 
> I expressed strong disagreement with this patchset in individual
> patches. I expect NO NEW versions of it, but by any chance you send it,
> then please always carry my:
> 

I requested Wasim to prepare this patch set. Something that would have
been useful to include in the cover letter and some of the patches...


I definitely agree with your position when it comes to renaming working
platforms and I also think there has been way too much churn in relation
to this platform.

But the thing we call SA8775P upstream is not SA8775P. The hardware +
firmware that is described by sa8775p.dtsi doesn't exist.

Reactively and without telling us the whole story, we seem to have
gotten qcs9100-ride*.dts to represent what folks has been using to
upstream the platform support.

But the board where I see people actually running upstream (the EVK
introduced in this series) is based on the QCS9075 variant, which is the
same die but with some hardware features disabled.



In other words, this is a mess resulting from lacking communication and
reactive shortsighted attempts to get things merged. I don't want to
maintain it in this form.

> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

I'm fine carrying this token of disapproval for how we got here. 

Regards,
Bjorn

> Best regards,
> Krzysztof
> 

