Return-Path: <linux-arm-msm+bounces-22193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC590221D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 14:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B46551C20DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F65811E6;
	Mon, 10 Jun 2024 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="k4wONGvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580DC7F48A;
	Mon, 10 Jun 2024 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024149; cv=none; b=hVrOKI86M3oz7lhDX20D/iwwvJG7zreLF19rIeuVROmaGz0zxoGL46irlFZpM/GD6lPfslBUZHHmynOUXdGI96zVoeso7H4eIKKA41JQPoR68T1Ip4hcZ377KNi3dTwqn0psV3+FxlSzQ3jFZBGnd7SOxYtkmbQESS4EQ7zjGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024149; c=relaxed/simple;
	bh=E2qltagEAsvtxt6g+coHjPM+8DNU11mSj5dXmlyoK9o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfLwHnzQdum5Y5c+8nae9J6UIabYKuO8zJTZTY+bdePWW1FTe7aZpGVHCbvnl9ENQByzvykVfGWPl9ZMn5kG0dgGsHWjb33ObLtsEWOkBKGS9rd7RZS8YZnqS8zRb38ao0orRNsii8whdYHJXUC8Ru2WRo97a9KNn7V1HyfsAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=k4wONGvY; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A70BOx001595;
	Mon, 10 Jun 2024 07:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=a75p9llWa8WuzLKVRn
	GBQqGFG8jwUyJBhiBBGCkNtpE=; b=k4wONGvYzYczKKnM8yU+q8ZZv9xmqiRENH
	UweHDF2nCmJ+gIbKP3U27m1MhEDA5oV94EczR1xLghSysbnAqC4Dkuo25VAmo/4i
	Lb/navy5AqylgmE/YPsgn3wWZ/Fv+OGmEtHh1XvOIfn1wg+3qDsSTqEy636fEbCW
	hajgrLojdTUv9YnPVK45Mx3mgEC4EZPLm6qhEUSBElUr6uwv7Zq/GBLXfDh0oWCU
	PFyyN+OwGA+AyabgfkAbWNTJXwg0XxU6mrZYZ+JXo9L/eXu5SHsvHUZJU5SRyqdH
	HsJyFbxXrjznAnyUbjp1kE6SquxLU2N/uiEUAFMdKM2bjxRC2zmQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ymmq09fss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 07:55:11 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 13:55:09 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 10 Jun 2024 13:55:09 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 08DFE820249;
	Mon, 10 Jun 2024 12:55:09 +0000 (UTC)
Date: Mon, 10 Jun 2024 12:55:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Lee Jones <lee@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Liviu Dudau
	<liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: add missing MODULE_DESCRIPTION() macros
Message-ID: <Zmb3rF0mw4CGaE88@opensource.cirrus.com>
References: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240609-md-drivers-mfd-v1-1-47cdd0b394e9@quicinc.com>
X-Proofpoint-GUID: LYWR5txcg-hjymbZ02OBdLvxzEczqfYy
X-Proofpoint-ORIG-GUID: LYWR5txcg-hjymbZ02OBdLvxzEczqfYy
X-Proofpoint-Spam-Reason: safe

On Sun, Jun 09, 2024 at 07:21:28PM -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/timberdale.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/intel_soc_pmic_bxtwc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes mfd-core.c and vexpress-sysreg.c which, although they
> did not produce a warning with the x86 allmodconfig configuration, may
> cause this warning with other configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

