Return-Path: <linux-arm-msm+bounces-89079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D8BD2172A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74679300AADB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB93F3A89B6;
	Wed, 14 Jan 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK4jdVbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEfiUFcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF9F3A782A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427516; cv=none; b=S8/fNlE+mgsaP/FI2RhjPVPAx4AUB/e32vrBYMyF7dKahuGErCSUMki3mHwkpHftSDfCty+uSLgWUvl9JPZ4Fpx7usGupDBR9sEzJF1XKVxXRmJdGPIiYxOMkFIBZt1Bqlb599gK2dEC8BkOmJdVyS/kUyYylrXDoXZYzZL2ZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427516; c=relaxed/simple;
	bh=81fhX7f5PdSvnq13MndLfu9aSTxfFkW72ebZAQs4C1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coM2+u1q61hlAfBFsSIsxAP73cu5zAuDiy6uHPrXLx0GAcHxzn4QgcV7iZPHt2HBJuhSkIRfw9l1SjkT4Z4a03opCu0NBypiDqGvSgphF+Y64mggmIWZ6tg1flWdqmXj3TEhxjxuHLoOqh9UJ432D/c2DMEbjnW2J4/hRGKX9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mK4jdVbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEfiUFcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EIrShq3279843
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtMMomDKoiaa/sSanq0+vo+Y
	fvjfXACcyNDdQCs1B7o=; b=mK4jdVbjr+jfkUTszZ9do7VfazDgk63inmACvPLI
	H91gLx/KctZ6kvLFBd/4DiSFPP1gZRgRTFFc8a4j8TlZywAsxIQQL7ZMrAUku/Nt
	yXDy41pnNW64wQAfAQt9vr+uthpa1CgWCAAiAk1BepSLqVDHPdj1aFvNPzgJbG5l
	8qmctFpucvxwlY/Ly+KP5R6HsnQ1T45TILSfpyRFmPt9brcyqCcclV9aylps5lBA
	BxpiPUaZfInVpDKtW/33oM84t3+P7t2orfiyiWrEcQumBg3q/1a/4Z7QPUNyydfa
	Khz3w8T8DsTRYfe02UjlIDi6VMnxQ0t03efOWcbYma+//A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8t3dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:51:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so57023885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427498; x=1769032298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dtMMomDKoiaa/sSanq0+vo+YfvjfXACcyNDdQCs1B7o=;
        b=gEfiUFcRZsq4tbc0gMqKy5x02KpFN1+ECfqYriYhOGK5ztfyHB9Kg8kBoaGy/hE2Vn
         P0kOnMOrV7MdMAfV3lyh/jqZS0cz2+g98UJdJVGAxgQ07uxFOcn8Q/Wfq3wPDHAqyoSu
         Ia0QYsoYhg1XlE5UO43n5JQIPnlPgTTJjeklQAXdaxj/IyspAG5+wnCpyfCXU/wYTR9v
         qJe8meFjhGWZ2cZ8QYzR+YC5Pb+Cx9nhV12IkzfPNfllsBq5JeDyEGVBFw5z+73mSwkI
         1m7yyDRneSxZwC6JSUYHhqzt3i2EjRJRu+YkKEGPhm3l1Kuds2o2eZ17UWJMQrF1VGB+
         3rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427498; x=1769032298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtMMomDKoiaa/sSanq0+vo+YfvjfXACcyNDdQCs1B7o=;
        b=U9Z1sRdRYCBBdq4kUaq9m1DSF69VbdL+GH55oHuwgsCFsTslfCXZwX/XS4YSfeHg84
         wNJ6b0ukGU/g4SFTV+A6a31nOiVbgv9o7iRhquyPlP+JsUukYbIliuwfevTaxc2ARpho
         srzJAlSDNk03ASMkHo2CNT48zWu4EBCh96L2lJxJleyl0QotQrOQzEe9/ECfqvtuFs1W
         xEjZZyR8L8AS6dWZBQTobj7Y3tSr3Zj4XYVrpgWvZhL3e9i8I8xALkZKBgQ/o+bgRXWX
         QncxYvbEeXYrSTQR/ihNDTqDH4ZR3X1XuYPgwoWSYd5DVIGhC3mwgJ4wELWOWKZVSQX+
         XY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWspblJb8WnIlB9/ZuuTYKUy3WKwBhHIFn1IyZ66oqNX/0SBynqgd6tgTMV2sPgV1cqjvAZuBh/BRzVVygR@vger.kernel.org
X-Gm-Message-State: AOJu0YyDU21PVC2acnB1VN2ZkRjDH4UynbWqf2jGqh/ihDRtIaMOlR1b
	ozIdV2C/gZ4FiBnPzdnRzwKyRrEDMOvtK3X7VAtcBkbOR8IpzyRtRwBaZy4uzIFGB5jWzJDHYma
	EWKCqemmGqZjwNxbRayZUbtld7WfpxC0jUy4YhUQy0QJampS32CSkQaJ1lu5xkrfBs1Ao
X-Gm-Gg: AY/fxX6sRoryDyIBE6tP4wnWzZ9E59IsI8CclCbuOGYUqGn8nRG0pqZc08Zi21anLxt
	YVdPBAN9UO7C6QLITkw/GNVKCnSpPrglTmJ+2y3fBaEyEqLeSI6dAnKm7+u5dbillt4Wp+w4QRV
	TyNf/wwLNnv8LqbtSCyua1+HytPDl+gJT8BslLsgFxCnRmvvS24fE5YcCMb3CHkOjuvAlSYN43R
	a74CCQXMXlgA4EXcJIdYnNVuMX21zNpxEm/6hnLuXS/GKycgq0PNVN1YPH2GohaLGZZWzqj0YKT
	zg/l66rqeYLhFtXgZ+gD3UKozIpro0SeOw1iJRRn6ez1ffCBpum1svEpqZKxklFhPcJqe5hdb0F
	qEpUB5tLkOvwOev/FM7g8PYiDB2wpi21I1aCTPu+6RbV7caf+vYdhq0IwcsUal4IiJdhFjj2phh
	5vMN0OnRPJhsboVLMZQKIiu9g=
X-Received: by 2002:a05:620a:25cb:b0:8b1:adfd:f850 with SMTP id af79cd13be357-8c52fb05340mr600524985a.18.1768427498213;
        Wed, 14 Jan 2026 13:51:38 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:8b1:adfd:f850 with SMTP id af79cd13be357-8c52fb05340mr600522185a.18.1768427497734;
        Wed, 14 Jan 2026 13:51:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045ba7sm1054373e87.75.2026.01.14.13.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:51:36 -0800 (PST)
Date: Wed, 14 Jan 2026 23:51:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: typec: ucsi: ucsi_glink: Add support for
 X1E80100 compatible string
Message-ID: <gygibrsme3ojwcwp2yq7hclflc3vur65x6cxaru32lgquzlilf@q7bivtqbas5u>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: fP57F8O0oqPyJQTx1dT2LsO51TRQB9xv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3OSBTYWx0ZWRfX3OqASvYKdEPT
 14Q1+ijiMVRuANJ424Xx31K4mSt+MhTRpCZGwEW8PlSfF4ZoNowOgzbEg4SjjcBc1634IzT7xc+
 lRhyrfYQlF8EA/AkrLPHplYr8lFX2U3AGSsy9U7tZdRbPf/mH0V/ephKckBNZ82FhI7VhH3jm9+
 dhmwnYNul6omOlM7Of9+Yw7l7aSxIflggsuu42YmFIDFpQ58Tyz90MdAzVkUYFYdNs5Vspgd3eb
 UcXgssyKjUG1nIyYUGAgv64wPY2/yL0DPy/YDpXB0o7qqE7BuGhUEZ3ydL2RCSr5G3hBjsxmlBV
 jPXh+z+3EDUzRzGcO7d/smFGvzPr/+ljOM0fTR8U1TNSFoL7Ddju/2RrZJZ0in3uvt47s6QsbQA
 WOquJAtK2vGDJc6jxkPXYYfkiew+zqd/GP6pAaO0W4h2leY6J8UR0irW0I/nPhMDD2QQ7gjJ+Ii
 IeXK+IZymxvxEUzhLEg==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=69680fea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BSYFvgBecL4qUoC9sTIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fP57F8O0oqPyJQTx1dT2LsO51TRQB9xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140179

On Wed, Jan 14, 2026 at 01:17:58PM -0800, Anjelique Melendez wrote:
> Add support for the X1E80100 compatible string which needs UCSI_DELAY_DEVICE_PDOS quirk.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

