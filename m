Return-Path: <linux-arm-msm+bounces-71711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D04B413A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 06:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D7B25E85E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 04:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011DA2D4819;
	Wed,  3 Sep 2025 04:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="a2FNrJmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905AF2D4802
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756874899; cv=none; b=PF/RV4QEHVZyFpzMoKauDopqCCRkBQwIQPFEhy/2Yt3Bt7PC0nuptHuTGENIMppVglWkaW9EoxdxJGp16oy5UQeZhN70CA8Rnpa+2N8A5Ee+MwNydUdfE2dKdvqRox37+wanI1CfKKSP9PCRu75eKzvYcb2zf65cDht6DEVjjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756874899; c=relaxed/simple;
	bh=I6zNRD3w00lAX47piaPwY1NvvSVWY6LUT0pycpnZXLs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=p/1Wi9fcI+Xf2lpUstPLU+YVqWpznHli6qrqnCynX5beVWEDmTnnGximxGxdo2F4yDDGPgSpfb9n1KOHLXIu+Ivf5QT7CawN3UCOyq+C+C+LhOsi75kYES35q5O06QJhFJcfYxFKFcJMfspArZlW+NcAn2YNo1YDGek127Q2WRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=a2FNrJmm; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250903044815epoutp02fb354119b3d2d744fb185292ef58cea0~hrGi7oRl42539825398epoutp02M
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 04:48:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250903044815epoutp02fb354119b3d2d744fb185292ef58cea0~hrGi7oRl42539825398epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756874895;
	bh=8zXvDNoOwy72sNEXyL1WkEq1p5c03frKH9bQVnfpEdI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=a2FNrJmmOsTo0j35RIxp3rTfXO7J44apBEFsDnYgLHjL9qqXgdkV2jHIKnEuqgKsv
	 Z0Zpv3vAq0Vb+AsMA9KyFiDIeIEJCITjRELzyo5tg0cAsycWl9uXSlChH4UOSRB8kM
	 i5SaUBCwiLccbGKqBO/Juesq3Cp0GJRAMbsoALgw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250903044815epcas5p36d2334cc729bc607a0db3151e4354e30~hrGiheA0L2034820348epcas5p3_;
	Wed,  3 Sep 2025 04:48:15 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cGqqd64yRz3hhTG; Wed,  3 Sep
	2025 04:48:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250903044813epcas5p1020d1e0cd0cba938c7205d018cd72703~hrGhAtNUT0683506835epcas5p1N;
	Wed,  3 Sep 2025 04:48:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903044811epsmtip1a9aef2f137d586d0ecab89f16bf3a338~hrGfT64ld1389713897epsmtip1P;
	Wed,  3 Sep 2025 04:48:11 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Ram Kumar Dwivedi'" <quic_rdwivedi@quicinc.com>,
	<avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
Cc: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
In-Reply-To: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
Subject: RE: [PATCH V5 0/4] Add DT-based gear and rate limiting support
Date: Wed, 3 Sep 2025 10:18:10 +0530
Message-ID: <3a9101dc1c8d$f476b8e0$dd642aa0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMIDrMCzT3okebP/WChCnWdAdn6nwDbtq+ZsiIfvNA=
Content-Language: en-us
X-CMS-MailID: 20250903044813epcas5p1020d1e0cd0cba938c7205d018cd72703
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250902164927epcas5p459352c28c0d5c5a4c04bd88345a049f0
References: <CGME20250902164927epcas5p459352c28c0d5c5a4c04bd88345a049f0@epcas5p4.samsung.com>
	<20250902164900.21685-1-quic_rdwivedi@quicinc.com>

Hi Ram

> -----Original Message-----
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Sent: Tuesday, September 2, 2025 10:19 PM
> To: alim.akhtar@samsung.com; avri.altman@wdc.com;
> bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; mani@kernel.org;
> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Subject: [PATCH V5 0/4] Add DT-based gear and rate limiting support
> 
> This patch series adds support for limiting the maximum high-speed gear
and
> rate used by the UFS controller via device tree properties.
> 
> Some platforms may have signal integrity, clock configuration, or layout
> issues that prevent reliable operation at higher gears or rates.
> This is especially critical in automotive and other platforms where
stability is
> prioritized over peak performance.
> 
> The series follows this logical progression:
> 1. Document the new DT properties in the common UFS binding 2. Clean up
> existing redundant code in the qcom driver 3. Add platform-level parsing
> support for the new properties 4. Integrate the platform support in the
qcom
> driver
> 
> This approach makes the functionality available to other UFS host drivers
and
> provides a cleaner, more maintainable implementation.
> 
> Changes from V1:
> - Restructured patch series for better logical flow and maintainability.
> - Moved DT bindings to ufs-common.yaml making it available for all UFS
>   controllers.
> - Added platform-level support in ufshcd-pltfrm.c for code reusability.
> - Separated the cleanup patch to remove redundant hs_rate assignment in
>   qcom driver.
> - Removed SA8155 DTS changes to keep the series focused on core
>   functionality.
> - Improved commit messages with better technical rationale.
> 
> Changes from V2:
> - Documented default values of limit-rate and limit-hs-gear in DT bindings
>   as per Krzysztof's suggestion.
> 
> Changes from V3:
> - Changed limit-rate property from numeric values 1 and 2 to string values
>   Rate-A and Rate-B for better readability and clarity as suggested by
>   Bart and Krzysztof.
> - Added Co-developed-by tag for Nitin Rawat in 3rd patch.
> 
> Changes from V4:
> - Added the missing argument to the error message while parsing
>   limit-rate property.
> - Updated the maximum supported value and default for limit-gear
>   property to gear 6, as per Krzysztof's and Bart's recommendation.
> - Renamed Rate-A and Rate-B to lowercase (rate-a, rate-b) as suggested
>   by Krzysztof.
> 
Please allow minimum 4 ~ 5 days for reviewers to complete the review before
posting next version.
That will also help to reduce the number of iteration a patch goes through.
Thanks




