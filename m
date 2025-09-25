Return-Path: <linux-arm-msm+bounces-74853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B753B9D054
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 399F13B1905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69412D24B0;
	Thu, 25 Sep 2025 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIVS/4Yl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC011713
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763823; cv=none; b=QwJlNNM3QczYOVM02ao8vcZIl6hUk3RR1EvHOTrFBOBhME5SSfVrSpWdpYemKQMi4nol7CGlPibgY9bB0ETlTYB9tR6WSJTeFf7hINKDW0roCf3R6E14av8O2tn2XBClxGQZQaVZDIBgHi44foLqV4x2BTUr2RaH5ycC9Dv510Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763823; c=relaxed/simple;
	bh=DH4aJWPTM7pVDINdGI0khQskFrk+rsjXqGHqx2g/shQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ft4b5U2yThg6CKRCY4TEt7Tj19BkQ0sGiVaeRJ1CxExq/8vZv6r7hLMp4TakLbBv3vfEAjML5XuNIRv7nh9TCROMBzaoqvCZeh6Uj72tsszuVgI5IT9nCO2JwS76Deg/NynBm5DkG5CziPSjhxsiTTMXp+elXJ2qGGqq416JYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIVS/4Yl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0oZZc017456
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7mUyHQNj70Gz7bixQgpoodM4
	fSwBQ4FeRDzfYe3Kgjg=; b=bIVS/4YlSjx/k9zYtxSjYonLhSq5UZNZ6xUK91sJ
	fhbv9Q0+vEAV3bPjX/RSDh7p+0e+n2yW/UQcwS4wHX/UA+krksvwppcUbWplp958
	r4sgttbm5d8miPC5YgzHeWcZDbZkjDNLo+M66r02rXGCCUWCTA2pnHoKcnD7dxaq
	U0Zrl8+u6skEi89VyGT/F3IRasF7SDXVTe6OMQYkBYjX7T3XhL8Jh+/bZE8EjLTD
	3m6ugBeqEuT3ou7zlJF+s4M2Zf/Ej8fqzpYh9F6LU7bh8oXMxkpm0xwiPTV9l0Iz
	RKj2w9D48e+5YSTSNiWarYEQmquPh2fYeK0c/fsdpNwayg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjympc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:30:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d413127749so9736761cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758763820; x=1759368620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mUyHQNj70Gz7bixQgpoodM4fSwBQ4FeRDzfYe3Kgjg=;
        b=Q1OkQIeyiEZjgUEQNkbMSdLt0mkzwBiwm8uJ98wyrzl787FrwI9BEdib0kAbCwr3ux
         s0cIqhJaiN9hTV6gdzU8eM4X3V09s9ZmKfMSeQaOfItaX0Ce3UJ/fP3uNLwG+dvdcma+
         ycJY4drDBpjKDbB/uQIr8NBeHKfBchcuGf3LtX68glj7E4gbJkN5IRKpiibMGgqjZVu2
         x/Zyut+Ux+uplkBoIpX/JdouzrivwZMqVlClj1LcxH6Mby76HULtEjllJMGQ++47ESMW
         1BFHNiqu43xREns882kcKeBIDnCGWrPYpAJW4dQ4obi9PRTFXCEUV3yIjd0y3FdjoHu+
         L8YA==
X-Forwarded-Encrypted: i=1; AJvYcCVtIe+MOmoe0VevXDHvk6NbIzDIoLGLqVFlzu/Kqt1Skvv65pVkMulQNQWr460g3667ro68y/bmFibwUGbm@vger.kernel.org
X-Gm-Message-State: AOJu0YwtbjFcXzWPtpHpUtZbQx6qu34KrXEZGtg+tG0gAvd2pAy/ga+6
	eIjVEh4Uko674Z7F2zXz1L4s04eA72M6MdHof/WXwYz+gE8cJz4FWwUWCuEydgZFfAXN4glk6bJ
	mcc0GVQafyCO8O+m86M3nJ9Yf/KSPoQA2gvz2eiTeVsjyrtCbyuOjMpiAMGXix6nA6Bvc1dENNc
	3/
X-Gm-Gg: ASbGncsT2zwLzp14KoVAUxGmwdQM6K0ncyRxQ802vAmr7VJ0QPoctLE2Wim3tmmlzY7
	LG+gpiXPUAmrlLKYPIm5v2zfDn2WA5dNlBTfnsTsZ3SXo1yCHQC9Chox4k/4nZbI/dAAVNmwrgu
	7xWVJXatdvyrwEnAicM6zlzc2kOSCNZ98mteDDC0ozkoQ4EbomHQzvKtxWiu4+9TPFe2FE6CVKC
	00rKhBW21pheJHkkjVuD9l776PdZxVnRl43fXdQ9gv9ZBBKOulOKnQk2eHWC8j3bbReHotH+rlc
	cH/MfFLmF9Ra+AU/Avk6FgJUyZsFyPBlEz6E1SyI5ZPQXBjCzq0Nb101b28giDnVSRfUckP+FRZ
	Kre3K5Q7MatIOII2fcWt9qlvubhcACXHV/OjSSej6oUxcQAYv/b19
X-Received: by 2002:ac8:5856:0:b0:4d9:440c:2992 with SMTP id d75a77b69052e-4da4bfbe724mr22592181cf.58.1758763819783;
        Wed, 24 Sep 2025 18:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF456x3zpn/m71a91HI86r+v93v861E9jEgmFun7cueAn6yXuEgN6HFNgHqzD1nVz/Bp3jCWg==
X-Received: by 2002:ac8:5856:0:b0:4d9:440c:2992 with SMTP id d75a77b69052e-4da4bfbe724mr22591811cf.58.1758763819256;
        Wed, 24 Sep 2025 18:30:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fb04dsm211238e87.44.2025.09.24.18.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:30:17 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:30:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <un3pulyn7tv3qihdnqmktsctped32am2eglxzfpwyz3u3tqspf@fnieck3i67j2>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-8-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lmTezT6oJRpazibR6OY4Qttk22t9uG8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX3CCAitK9rydt
 aH8mu2nzPxx9tPz7pQcbwsuCHkfcrulDKEKUiyRaU1VcQQZokfiRpx1jDGnYrPEvflArvW3vQZg
 DpgG5qxj6ElODlVg1te50Lz/y0Pqlf2/lTWEjBXS8YvJTghbeIiwjLT6+LPnQSCZjiapl+bw4Ww
 vxxQnJ/8PhFI3kTC3hS+o0y+UmlaNZupFI9uTBQym/Fc2WNfxUbPiQ8x+WsVo96BD3Z9gLCQq8C
 k+/tOT8stRIORZftuBuym7bsxJHQf4Z7Qt9dcgv+OuAwXHvCffw5p3zMjhn2j2mtsGNyKxWSLCI
 YssBX6YFLeBY1ONKw1qUIJpAi/GfzudYrl8bKPh6dqcT/+9qzf1aTngQksMqZzHDtvZoayxjq/R
 WRsFpV5s
X-Proofpoint-GUID: lmTezT6oJRpazibR6OY4Qttk22t9uG8s
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d49b2d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gzIeawRUdsEZb0YUvHYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 05:52:25PM -0700, Wesley Cheng wrote:
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
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 311 ++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
>  .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>  .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +

I think yo've squashed too many changes here. V5 and V6 headers should
be a part of the previous patch.

>  8 files changed, 1251 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> 
-- 
With best wishes
Dmitry

