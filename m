Return-Path: <linux-arm-msm+bounces-74283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 165EBB8CB94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2EAE1BC2693
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393E22F363A;
	Sat, 20 Sep 2025 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qg2bH4tc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F522127B
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382304; cv=none; b=KUPwey8fSqQCdxEJjZH4lLsf+iWGXn7mqpiROxlXoczQfck3Rs7L/71XQQUCURU8FpPF3b0uugJOCG8kC19Q7Ft9Q1AOt6TxcGdu6oki3Y4ZmcdfZonXJJTrKFdYxNcbAleEgplLEEuzn/OuUXuD/VC6UvOT4r3oZP3c0NO2qL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382304; c=relaxed/simple;
	bh=udxfCGmnVPp3xuxZUomY6Jk5jtbCwqUC6PXYgyxxiTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUHNoyKvhRXcAozedmKs68zL72GQvkf+k6GmC9xZzQvO6Z2wEESeCIl/XelX5QqWvqyHTfpEDpanarWt+5jeQB1jjzuu83GgeAymhysAs6TiTXja/q8fhibtoOND59CyPF4zymLrZ7aXZDvbP/R+CyRwLMNibZYeIUM595uDXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qg2bH4tc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KEe9ar019662
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Agw1jf4xhD2dHvOPSs6hIpbq
	udXfs5BkybpcFGMrFAA=; b=Qg2bH4tcfoIH9x0hMOcjMnqT2Tnhanqu0xSzf9vr
	UxJTTIAX2EDnB/J/yjVXv+isq8NlO4GN3npTf3glkUOHfPXNMxhsRNBzrLOtZJXy
	JHcB2TrR6Nq6W6sqvgUVC0jd3tioWSaHM7QdkKdvJYgJeEc/P/rAJfovXlhtzxSI
	quiRW7Pw4BOZLISYzjZ+hqdU0YcPYPKXk75ZZ91BVXAoaI7vwusd291CYV9Sk6tP
	YVFANlrRhtP3vSoIyFkh2PBzCYRRLGpefFUGBd2uA5JAeaJYzIo8MjF5KMlmyQzK
	spCgGPqtmDKCZkTAZ1ZZFzJqJjppIx6y2PY9gRYmaMJupA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k988yud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:31:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-79a3c16b2adso21556456d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 08:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758382300; x=1758987100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Agw1jf4xhD2dHvOPSs6hIpbqudXfs5BkybpcFGMrFAA=;
        b=iWNkhg9Esp4Y1+XJq91QMFmY1OcuxDp5ea5Q93e1huX2npm7nRJTyl19k6VUSp43sL
         5x6YzAlMKM8K2wwwTPhzXf0vEUnTVcHCnCILJhnwMsL8j2GZUunIhoez85zaJfGAE21a
         OQW1KwMZWwVOLCCskFyVioXG/X3JZNl43suXsqHnS6u8/IO4Nf+f8HTybmy2P+jd+3ZW
         /3sLigOOAYcCwmQu+5RzjyFz++SD1wnldwkuqD5mK4+JwwJYQ7Z9kLiCzQWteKY7ldhI
         pOzI4sbQw3zWYNSqB8sWjttLql4KyDX4pAHRKjMbphnAo9qGWuyaK1zYwAxesciTGgqb
         NvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPQojrSMqbtG1calTsXV9w5dn2a5yikHNYihP+CzyUywV09lrxASj1oIBCNUhP6hvtSuiFmcNochapep/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzHgepj+VtGfsW568gzX0ybyqMYcmuHwnpO6zK7yAhEN0h0FdFo
	zL/+gG8hC3pf8GOpkdO9kosSdSmNeUvXXJAg+CxW7/lxn8Ah+CdSF12cQBw9GDgG6flTVPFGv9x
	BdvuQ3E0ZZuhWVoWvk4lwN2SFwLcLzW0noT3wJzrdbkdXk0lfTUNOBsuvWcqlhWLfmMLXEvNWyW
	Wb
X-Gm-Gg: ASbGncvdUvexZh7htgcImN/vwzDMni/v0J8GTLN3X0mucmzJf4uWBaDdS1A15XENS2k
	qo3e2M6uVzta9b4uhXVnZjImnq2gKawLmQm9ti8wDT4eSuLQ1OYJhFjyWLFjNzwFaIDeb/39len
	tcUR2erGvCZ4LhtLnwfiEjYEpSiNRR9gXo+TnOtS0cFNnPXUniJw10Ruqp+s3F0hSFps5uqhB9h
	xP5fowcpA8yLaDz++sGZa3qjeuGFdUE+aiowfFgWayhRW/SDNm7F+64UkLfR3ymX8zxQ6fn/l4/
	xjWqfdi8gjLmepeq0lecLUI/+CzPc8siqMV7JB7iDmzWMKZ6PMnaaoq/yPY83bj6rCRrl4udNat
	D8iJgBuuz5SCwpqHYpeiUwk9NFQtP78deY/bOek8X4EqwXKVM/z1i
X-Received: by 2002:a05:6214:62e:b0:768:f173:a0a1 with SMTP id 6a1803df08f44-79919dad1b6mr75240896d6.42.1758382300079;
        Sat, 20 Sep 2025 08:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5J8E1oBMgOvgfZk+xaTiZAs81UEBJOVjkmbbKOqjcN60ku0uMpKtLAmm2ZHJO1n+o1SNXFw==
X-Received: by 2002:a05:6214:62e:b0:768:f173:a0a1 with SMTP id 6a1803df08f44-79919dad1b6mr75240506d6.42.1758382299623;
        Sat, 20 Sep 2025 08:31:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57cb7f53a76sm144778e87.102.2025.09.20.08.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:31:37 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:31:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/9] phy: qualcomm: qmp-combo: Update QMP PHY with Glymur
 settings
Message-ID: <kmo2xwxia334fba4nt3eyzijlet7ogv4trxskoog6ymkxmpsi7@2pr2pryaxxgp>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-7-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-7-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: uFC1SbfuWd3ss33k6o2Et3Z_3SFn2mNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX7L+nm6+VORJV
 zj8fzu5yS12SwiaFijciuQH+kyPg+aD7YqZ01ujPaAnxmuRHE5ixKdI+cDZVS7OJKJwaqjiLlz/
 69LEI78bhwyJUQ7rlAev3vvlnqtrNTzRWCHIvztHhod5WDqjzEfQd5ahyhB2CZrMkcsoimiAmx9
 XXoA31/41+SMsxfBn571rOeeIkAIHuDpfbGXAcpEOxzHgb7ai6h8KkMgUWtiA4lwUvhEQ1izCg5
 HwCp2nQSGsFmhDUsiF8Hs32n96t20TIObwwBKDsPwMs7i6MgJ+MnGngyOCYIx37UIq3pGGHum4g
 EFx3FQuyTreg8i1CHhCc6zrh0gYVQ5hmfzoYE5qVHgutQdBsjxEPyZhLpU5+RN5hmWhuelIQZOQ
 xkz4RGE4
X-Proofpoint-ORIG-GUID: uFC1SbfuWd3ss33k6o2Et3Z_3SFn2mNV
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68cec8dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gzIeawRUdsEZb0YUvHYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Fri, Sep 19, 2025 at 08:21:05PM -0700, Wesley Cheng wrote:
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
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 309 ++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>  .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>  .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
>  6 files changed, 1225 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

