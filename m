Return-Path: <linux-arm-msm+bounces-74029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB6B82FC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A025622F5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CBF27380C;
	Thu, 18 Sep 2025 05:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tUmCjqVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA02848BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172700; cv=none; b=lVmo0icXiYZOSDQSfod26crDfLGiGBq4fcBs0Pb9bysqpq1b124WvBKhsHaU5LNdA0F05rsXmO6eTgrQISTo/J51cf5asaE5NXL2ZOS2/qctk20Zu/WqOHryRLy8vXdXygaG8PxY2t4wXldUl08jnqIk5kNXF/xEdxNLCLieqPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172700; c=relaxed/simple;
	bh=fZf3KUsg7TCNTOWtDcvxpkU6IoooWYXFis9GMSIjWv8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=KYEMX404MY6PToi43pdI8v8r/CHodcMtOBcMxLlvvr66TQAJZqMl0rzv4WhaNmfkmkunXtH9oPWAkZgRN/ivI0g5Lrtk6CKj59B5u9LS6A4KMZl/pzz4EXPho5cPAsKW6CesI1v0cgMYJPTJTnSXspwM7Y9ui5M/xKWz8Y4nosk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tUmCjqVg; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250918051814epoutp04d27dbb7bd916b9c3597960b277157d02~mSMArzYf91094410944epoutp04i
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:18:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250918051814epoutp04d27dbb7bd916b9c3597960b277157d02~mSMArzYf91094410944epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758172694;
	bh=zYYaazXEoaA47Z6YAhN7Q2mEYZHKsAgAX/eQnU0qqxc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=tUmCjqVgDj7ueMX52I/bqfBjZ+pt2JjBaad5lk9lKPA7xhe8PCnW1mWNrCLpank/w
	 TVvBTwF6YfOKzTNgvYIqGcbNmZUf6oMEvZB/bSHQNg6NXIXVe8KO0XKCKgIFAWSxyE
	 iWfpbycULHATqQ84CixTD4dp1koLhekqqPQ42XHU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250918051814epcas5p10ec0d7619d703aeeb316c67653f16c22~mSMAH4rP_2895528955epcas5p10;
	Thu, 18 Sep 2025 05:18:14 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS3nG6xl8z2SSKk; Thu, 18 Sep
	2025 05:18:10 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918051810epcas5p3a5c83da6d649a4729b7276bcef4bcef1~mSL8gmD4f2794027940epcas5p31;
	Thu, 18 Sep 2025 05:18:10 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918051807epsmtip1fb442832e26bc55315d8712329278f9a~mSL50ebAg2306723067epsmtip1J;
	Thu, 18 Sep 2025 05:18:07 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Ram Kumar Dwivedi'" <quic_rdwivedi@quicinc.com>,
	<avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
	<James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
Cc: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "'Krzysztof
 Kozlowski'" <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250917140933.2042689-2-quic_rdwivedi@quicinc.com>
Subject: RE: [PATCH V6 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
Date: Thu, 18 Sep 2025 10:48:04 +0530
Message-ID: <06fb01dc285b$9fb00440$df100cc0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJRoHUYa79wgWtyawBlQOaHwFj68gJOjc3tAfKTdSizi2z2YA==
Content-Language: en-us
X-CMS-MailID: 20250918051810epcas5p3a5c83da6d649a4729b7276bcef4bcef1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917141019epcas5p466578f1a7322594d653ac3c3eb3e7cf0
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
	<CGME20250917141019epcas5p466578f1a7322594d653ac3c3eb3e7cf0@epcas5p4.samsung.com>
	<20250917140933.2042689-2-quic_rdwivedi@quicinc.com>



> -----Original Message-----
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Sent: Wednesday, September 17, 2025 7:40 PM
> To: alim.akhtar@samsung.com; avri.altman@wdc.com; bvanassche@acm.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; mani@kernel.org;
> James.Bottomley@HansenPartnership.com; martin.petersen@oracle.com
> Cc: linux-scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH V6 1/4] ufs: dt-bindings: Document gear and rate limit
> properties
> 
> Add optional "limit-hs-gear" and "limit-rate" properties to the UFS
controller
> common binding. These properties allow limiting the maximum HS gear and
rate.
> 
> This is useful in cases where the customer board may have signal
integrity, clock
> configuration or layout issues that prevent reliable operation at higher
gears.
> Such limitations are especially critical in those platforms, where
stability is
> prioritized over peak performance.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
Thanks!
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


