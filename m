Return-Path: <linux-arm-msm+bounces-75747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81FBB2301
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B1751C6D31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1023117BA1;
	Thu,  2 Oct 2025 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6nKV1hA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706011F956
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 00:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366690; cv=none; b=sAz1Wncat/pPxu1zgf0KvJpWQx33xwoJTJtk67DHHPXuTLGhTRYGoBYx0TFdoqFCHE18HeISK+nISG52O361AxhIzvljXiZHOIBuwO0xXXBnnIFXFXdPaB5aFsWEctSkN6FbhsUdJWrQn5KNOfW9xABi8r2ePRVfVPyiMEMahCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366690; c=relaxed/simple;
	bh=9GLTLmwGqdXXPKoZ7WpbocaYojYCtAxWM+EOO+G2PFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlBZ4JQqH20hXdQbzEcOuAhe2Nuan2hdcwgcUizJKt00JVHMDvzBwHxqM/SfYj8HVw0e7PZ276Cs96lKA8jhb1Sa8R0b0jd+Z4Nrfoz3cfClf13GxZoevBfSXONkaNtsZWkzK7/rFUcSgQfOeHjd3oguDsoT1dBS+fwkzAiB5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6nKV1hA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic76X005598
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 00:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WRQA0Ldbq6oCOYaqBj8lZbHs
	x2KkWTck4TAuf9FIAqA=; b=m6nKV1hAoCyWGfwflOJQiPh5vG0P4usGhVpxva3h
	k3NSh70TmWve4FG00qa4kfMRrh6zkll+wUHWGbp0OQAO1vpfm74FQAqG0U8Z8pAh
	ZlxCpxWR3bbc5eAl1+ml4octXbXibRRSWBVkd9loSudBQAQHeb7kGaGseX3v44QQ
	P7TQr7FV5v7KZXSKSBls/hk4Ql86jym0ZYk9ONsRPCyc5t7vBmCZaiFwrLF6rNFU
	W6JUid5dLu7+Kwvs1o5WGHnGr7LGqEr9dcPZg8wsLLgxjX0ewYnQ5c/XNgnE+f8G
	2WY0hIHxghNHicY4HABW++VeYc350mvTP/g6pMTr3S5+fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851pag5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 00:58:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-82968fe9e8cso117822685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 17:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366686; x=1759971486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRQA0Ldbq6oCOYaqBj8lZbHsx2KkWTck4TAuf9FIAqA=;
        b=NEEPsJiafyvNJ4bj9TQP8NXYjnRQbv0mxNaYqVqmj7pEcwmnb76Dg6ScfyrsRrIOAu
         Flvl5VGWcIYeQhy/DjAPvynLIZ4OlNGURS2yv+eBfI7kT1+cOoUb27+P2feZ2yG8B8ro
         ZwUQIEWm1TPZ+tRdoFjsB29BBaeMznN9Lsef3K2Fm56bmCUQbvluCEcNVJVeMW5JOum3
         gxYHTM35ayqgR6oJ+qhyuPCT5n5dcznUDT1klUkKgcOJjPRcGRriV8yjqm45ruch5oWJ
         6q93EmLXefniGyIF8RCjvkvtuS45sqe/LEuMnquCtUaAV3Kw2p9jOkl56SG8tfREuP3j
         Kqtg==
X-Forwarded-Encrypted: i=1; AJvYcCVr9dIcZGurPMtAmqyIugPApxJ2/4C0bwZ83V466rT/R7CeAUGauwO9rNmO1aHHtJnJmbJd4YnSb/vP43J8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gFyUh7zF7xlMg61Z6oMmipW9KUTYs31dK46UJTYHWmNSfM9u
	EgddIddDJ7LiCGtkBZIszlL47+0CdOaxbjB16YbecF55VjHPvdfgi3xAgdet2+v6o7Ks0wLwJ+5
	+kWbJu3X89qef7by5RpdE6M2xBVR3Xu2Gwusi/Ado2RfAwcn+2PH8q70QxCMtf/QRZtEq
X-Gm-Gg: ASbGncvqbG4rrmCsuTDjkKIJU3pmoPawDZ9UUOucNISuD+2AaRYEiSgAbTkKL6ewILv
	eRF47rqKpspUdycsKBR80JzuT3fNe4BaPxH5cOXHNDzCoEHAk1QFPqnAqBrmC1nSeOw2AK0fbma
	aIa2DDIomKa/G45zqkRB5nPxd7pRdcGEe7CJlaWO7Lt29H1SmdeactsOpMTUWWeCvBnZgHjjR6n
	3pXWNr+VQ5LFh5mOkIJYSjQCZKgk6yaE8wrlqWd78G+jr0SRcD6ZdC7tFWNLBxU39MTxD3tZjNn
	hxqtS65AmPLfmshr+QP7y9aXPjnx0ZufwR06U67PPtxfhMp8QS0shfGh6WOBbu1dHSdmBQ16YnF
	pxYbQcEq1WCbcyh4bI6/nAvF1zVxWlQUeIlf4jm4KpD+VUopaf4B+7IgQLQ==
X-Received: by 2002:a05:620a:1987:b0:826:ef9:3346 with SMTP id af79cd13be357-8737154541bmr742058385a.18.1759366685845;
        Wed, 01 Oct 2025 17:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoX2gNtGM6G7KSu5OLUymOolA+kZGqBSRedhmredpkzbdydeAaEfMnslOBA8eEJiSCKXimyg==
X-Received: by 2002:a05:620a:1987:b0:826:ef9:3346 with SMTP id af79cd13be357-8737154541bmr742055285a.18.1759366685323;
        Wed, 01 Oct 2025 17:58:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4cdf47sm2721371fa.52.2025.10.01.17.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:58:03 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:58:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <ra3bq7guxunk2n7mbrjlefxvxu45clmwzp74vq7bqd2xvp2fv5@z5skxjxs4yxp>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
 <20251001220534.3166401-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001220534.3166401-8-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68ddce1f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=bgMNcTsuivlx1WpOe6cA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXxhZMHTQzzzqm
 jSHx4ixm7RtAwdQKlO4FBWYuadRn2/3hKYeQNCYRCMAmoNkWKZiP5fov0BxG+iRx9snOwgNrRXB
 ea1J4G994GqqhEYXOuxwU82K2LgY66SBYjKJp7uXlOtss7e4fkwcSVRhqBVKnDFiJriQ2+Y1vnt
 glNXCOLZlca6OxszuYyayE++d0+to5czmW3dGVi7e6NOY+r+fSec31eNjxa8vaYcf/YEHd9w1g1
 vgcIVCYnBOSlM6RxViyOlW98hQs105TnMMGsauntNRWtjcsIp/sxiGFvEWmuO4NygE4YDYXlT60
 um5rhX1/bet3ZmfMdOt6cF+ZPBA0qSsKzCESy06kQEBv5V6BapIsGAYyqKEkwiyF2JfBekN3OZn
 5ulQyKRtpQ1FCR8v9aIWR431qwETjw==
X-Proofpoint-ORIG-GUID: PFZjUGPKUr1aZnQFDpcrvulh8-xXGzyJ
X-Proofpoint-GUID: PFZjUGPKUr1aZnQFDpcrvulh8-xXGzyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Wed, Oct 01, 2025 at 03:05:31PM -0700, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 312 ++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
>  .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>  .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
>  7 files changed, 1240 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index da2a7ad2cdcc..7211c71fe68c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -32,7 +32,9 @@
>  #include "phy-qcom-qmp-qserdes-txrx-v7.h"
>  
>  #include "phy-qcom-qmp-qserdes-com-v8.h"
> +#include "phy-qcom-qmp-usb43-qserdes-com-v8.h"
>  #include "phy-qcom-qmp-qserdes-txrx-v8.h"
> +#include "phy-qcom-qmp-qserdes-lalb-v8.h"
>  
>  #include "phy-qcom-qmp-qserdes-pll.h"
>  
> @@ -60,6 +62,8 @@
>  
>  #include "phy-qcom-qmp-pcs-v8_50.h"
>  
> +#include "phy-qcom-qmp-usb43-pcs-v8.h"

Let's not include USB-specific header into the generic header.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +
>  /* QPHY_SW_RESET bit */
>  #define SW_RESET				BIT(0)
>  /* QPHY_POWER_DOWN_CONTROL */
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

