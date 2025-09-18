Return-Path: <linux-arm-msm+bounces-74030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82EB82FDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4084A3F36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D06284888;
	Thu, 18 Sep 2025 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vCiBergy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277727A924
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172853; cv=none; b=sx883Yge5VZ4g+YIPKpeVa5D8yDjPd+FJHd9cg9YXbicBBHk0EIJFWAg7cRX3cxbXxdUu+B/AKIlpOtnuKVVRJhCEAka/OtmbRAySPGK+5CjKiVJYlklC5jhAupTxZKGcpOWeF3OSIUAt0aMacoWm6x+n6PA7aDjyTDsZpehsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172853; c=relaxed/simple;
	bh=V2TyPk4XEK+XkD9ODvcJeJclPr8U78OB+kSII+k/G6g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dEdxKY6DlXg0VGsZgTGNyKtSkC57FeDPZln4ga8dnHDAKSRMS3p8XsgzW0oWQ6jO1++clp+QSsLHtuLJzVsXJHX2tjwYy89Dl8ze2Y8wj38uvciUjFPLNrGYIwklYqvL70NMzf8z8fJ2E/H0O8igJdEVYXqhgGywby91hugZBDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vCiBergy; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918052048epoutp0141fac51670e026eb59c16c15c93509a8~mSOPwmM0g0456004560epoutp01-
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:20:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918052048epoutp0141fac51670e026eb59c16c15c93509a8~mSOPwmM0g0456004560epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758172848;
	bh=AQXYtLG811rspesNjys5torp/eS65WLI98/HzlXajwk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vCiBergy0tiSskEM/uKzbH4InL6MEas0MiJO+qQRXZ9Tz1VuY6i4Z7YVzsU9sZN8g
	 qjUIBcbeG1LGt2dkvUKD5pYMDGZuZoclzWnTdWFEs4zLYFIN8peRCfT8MgESMSiDzq
	 FzYjs3+7GjZm+CVbnfA850OlWpSThI8CG1jXVlfM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250918052047epcas5p4237955d96a96acd0c586ae90f902bfc2~mSOPVGd-Y0748007480epcas5p4R;
	Thu, 18 Sep 2025 05:20:47 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS3rG6CGvz2SSKr; Thu, 18 Sep
	2025 05:20:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918052046epcas5p31bb142541f8c78b87e29725513303a90~mSON9xV6Q0428704287epcas5p36;
	Thu, 18 Sep 2025 05:20:46 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918052044epsmtip22b3642af39e1b3f42516960a75e96c58~mSOL06D1m2005020050epsmtip24;
	Thu, 18 Sep 2025 05:20:44 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Ram Kumar Dwivedi'" <quic_rdwivedi@quicinc.com>,
	<avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
Cc: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "'Nitin
 Rawat'" <quic_nitirawa@quicinc.com>
In-Reply-To: <20250917140933.2042689-4-quic_rdwivedi@quicinc.com>
Subject: RE: [PATCH V6 3/4] ufs: pltfrm: Add DT support to limit HS gear and
 gear rate
Date: Thu, 18 Sep 2025 10:50:42 +0530
Message-ID: <06fc01dc285b$fcb77a10$f6266e30$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJRoHUYa79wgWtyawBlQOaHwFj68gIsk9d6Alr8OoKziTpyYA==
Content-Language: en-us
X-CMS-MailID: 20250918052046epcas5p31bb142541f8c78b87e29725513303a90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917141032epcas5p33b752eff99e2ffee97dc64604d5dc01a
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
	<CGME20250917141032epcas5p33b752eff99e2ffee97dc64604d5dc01a@epcas5p3.samsung.com>
	<20250917140933.2042689-4-quic_rdwivedi@quicinc.com>



> -----Original Message-----
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Sent: Wednesday, September 17, 2025 7:40 PM
> To: alim.akhtar@samsung.com; avri.altman@wdc.com; bvanassche@acm.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; mani@kernel.org;
> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; Nitin Rawat
> <quic_nitirawa@quicinc.com>
> Subject: [PATCH V6 3/4] ufs: pltfrm: Add DT support to limit HS gear and
gear
> rate
> 
> Introduce parsing of 'limit-hs-gear' and 'limit-gear-rate'
> device tree properties to restrict high-speed gear and rate during
initialization.
> 
> This is useful in cases where the customer board may have signal
integrity, clock
> configuration or layout issues that prevent reliable operation at higher
gears.
> Such limitations are especially critical in those platforms, where
stability is
> prioritized over peak performance.
> 
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



