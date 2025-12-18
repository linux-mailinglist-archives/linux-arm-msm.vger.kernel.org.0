Return-Path: <linux-arm-msm+bounces-85616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1ECC9F69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 02:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01DD630AEEAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF452475CF;
	Thu, 18 Dec 2025 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8k3hqd4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHlvPLVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001F7242D67
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020484; cv=none; b=J9V/oCyWqiBuYoYs8ZxgwnaVrPfrT+dwyTUdQkzjXgpGAiOhTYIXxwZ5EKWAzRB8p7C/oZAX02FYv3WmwjQswy/Wevomcv4btO3iaBsIL1CBuPE4iYj5+9LRYNU2cyYNFEz8RccdPLz+IBfGHuuxMn9/XSKpPzrukvejTcYtYRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020484; c=relaxed/simple;
	bh=3GyqW3DrmSySs6gwQA4l91jGV3+yTRHWEM3WkZNJ58I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1cWpHBmQtQx4GqMcf8u6gjcWV093O79w0VJeaMIuJmpyETqyJ4pHAx05z3b4s6OHPBJG1slIE6qXUh5ShjEIt1wHIMWhPHiMtp9NhQV8uiKOSv/q7mVdYUvQVfnhEHeqUHLMDLIrLFQ+VJH2P5ZBQ88zy2EaPj4REbTeJBk5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8k3hqd4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHlvPLVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHMSUS2296430
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HQnr3dzmL4d8EP8vVA2TzDK3
	LoJt3uHQ9Cnt1cjFu9s=; b=S8k3hqd4uhaxomb2Pxw2qpCtOf78OiJKVQxZDBSI
	XPyJ+ailriSyRU0OZ7LgsPoEdrVBau/NzUBbDeWUErmU+1gzta4ot4bTKUXLlDQV
	tYGXq4yI9zht6clWBF4Dk9RT8ImzJ2EUka6yQ/9wvJQ5lqMedzSSV2aEQs7e3687
	yPixbaIJHITeV6et36bFxVFOjZpwFT2ihmTZhoHG405AQGJwEhWdSY0Tc9xEtLBo
	bNNq5KgGRparYWgLaGg838KK44+uxr/9d8UoJIVqIyJ3k3k6mOgHWjUyxf5O+Kj+
	jjV1DlS0MlkwFxE0hMDj5UYx77HQEkZEczEwX5To4NkmuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhgarf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:14:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so2333791cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766020480; x=1766625280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQnr3dzmL4d8EP8vVA2TzDK3LoJt3uHQ9Cnt1cjFu9s=;
        b=dHlvPLVHtToTRLEBATETCPYNbWrlPUS0q/3FIvkrWXF/Y85XAFis12TSR2LfYawV6w
         eXKiaWKHcwRGFsdHrUsvsoIuU+8I6uXaSgsbNAW+nvKdgIO4DqXIIXKk51YBCgpDd+P9
         ajD2/tnv/WL/GUFHwgxhgPF2GdDlEaGlEFTsrQw7Y798Z0W/EINcjuUXNGmtWA2IMIIk
         +ba8dUFnMZ46mHcDMwDV9FuYN9XcI9GfuIOJcg5JADIXPzUJ/vy/9h9gpnS3oMwNeuez
         wAm8KMN54g4eAsIP/17V4dT0wcxKUA6+gFKIwzcuJQo3Jq3yS2ImzlbRohxw9zvj4KQL
         Yl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766020480; x=1766625280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQnr3dzmL4d8EP8vVA2TzDK3LoJt3uHQ9Cnt1cjFu9s=;
        b=jbZwyhgoMe7JN0y1MeDjvyDMVFAkm0F6rgkK7269w0tgvYavK3ck7uXGp6/GlxM0Lw
         rjJdDunyncZs35HXxTOntt7pXlTifb/e7XBRqUG4MgYYPQgv36btYMePgDMXMMMI8clC
         Ujdsgk27TCIRH95TNTHa1hM34wNAMYDli9v9L6EWxkvF0mbPLOQ4BpGXJ/TGhoIO4V5d
         okgqf7Odc4dH7LUuNRUDfhLcjxyz0JHZiUVWHfYsh5VOI56owI87cN+o5u+Hxu5JLQHz
         M1PQITZOJql7EHiC9KwkrZd7P2/xTpbJQPWJJ3HsHU11UxM10jzxczJPx/HFm3o5zBRF
         YT2g==
X-Forwarded-Encrypted: i=1; AJvYcCV85QlZchNpz8i49TTXOq1cVyF+vD9n1sHdAuLhWRtYCFbCFUdxIoCb1uoT4YlYQxZuixznsNVvBLjBz106@vger.kernel.org
X-Gm-Message-State: AOJu0Ywce37RjxIMDvic+VNgl9NbC6LRfgs4zbDzzajvwj4JcjKO4KWP
	ZA3fZwxFPM4SuURef9Wa6P0QwpOYMUVw8RfoqtSVo7ng2ICajL8JskThWO8TnIHqoiSiqj+Q8Gh
	Q/ZsPgoK0XrCjSjqCvJeIQFLWiaUO4ugTxKPMsCfwFr9GjgjyjwGoFkQh2bos1llwNPh/
X-Gm-Gg: AY/fxX79cjmequwuCD0Y7U9R/1ZuYbhemeI2k9eaSTj8ajQRXfSbVlGm62+m/yKER5/
	Z0LYbCwoPhr6snYsHO6yB6s7vLjM2pZHhsskYkrBS/ARro/JTjK3bDYRwKOg3SDylOhtr7/GlHv
	/MMW626CWgMus2YgqGS/i7nrwDypDR521d7JqsoQSDQN5tq7tgWIWzC3o/ECIzn3j5tW0+RnTjz
	L+gvSiDrLvtZsav+rbzOq08iSwjqe/L43u9zLjWpjGlybajVwpGUbJsgEWshAsexSE1GgD3UvWU
	XSBqDBtrLsa9vGLV5zP0G8IRAQ9guXhHw0Ybt5t3JghDLCXi899CyWx8dgDUTWQuh0mvhidab3c
	fy7J2F8Z8IAfCU/MR2JwE8jiXcUWUX+YD2LO/RPDUhb5HW2OheCe8y2YydPVvyaf3b3tjOAiY4Y
	CWb8UMBeK+UZrvf3uCgOVoQ34=
X-Received: by 2002:ac8:5c88:0:b0:4ee:4a3a:bd11 with SMTP id d75a77b69052e-4f1d05ee877mr295118591cf.64.1766020480249;
        Wed, 17 Dec 2025 17:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0hnMu6EmldPN0mpKn86EDn4Bb/GKbcC5RxVnIK5DHmW2atir2ty/CdZ7JauTHi/P4Sz3cVg==
X-Received: by 2002:ac8:5c88:0:b0:4ee:4a3a:bd11 with SMTP id d75a77b69052e-4f1d05ee877mr295118141cf.64.1766020479729;
        Wed, 17 Dec 2025 17:14:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381134f515fsm3878121fa.16.2025.12.17.17.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:14:37 -0800 (PST)
Date: Thu, 18 Dec 2025 03:14:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Message-ID: <kpcdekfcs5zmlptmddykaqcros4eiclya75u6fpxhiigc6l5aj@inwwh7t2rp6j>
References: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
 <20251216-phy-qcom-pcie-add-glymur-v2-2-566a75672599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-phy-qcom-pcie-add-glymur-v2-2-566a75672599@oss.qualcomm.com>
X-Proofpoint-GUID: VyvXarxPOYqSMmgPO8jBC-b35V_hLJj0
X-Proofpoint-ORIG-GUID: VyvXarxPOYqSMmgPO8jBC-b35V_hLJj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX3KxijW8+c+7w
 hC/xoAptET4aT30fP2ee8ZgjY5fPsR9y2/HiqxMejgigIjwRLVd1jS3HimsVLv3EZXpO0FIJOVJ
 NNsjTmei8LWUZqiHaZ2X3USpd7R2xT7SJnq0XjgHGPt12xvxpRsHHGXtVuBNwOo6Wv7mCZD9/GG
 TowIfUEKIeb0OstPIsTd65x1kpoo29DqrpXi3y1Ijs+cBY8SM3BkSZ1P8Ctc+wRnrj23ymp8Tgz
 qj0/KcJh6Ufn52d3FtOaAKzPKjgnY/U2I/qaO1RMGNZRE2oOOsDGNcfP9nTe0KdwJxTcifLQzVt
 sOKhXxRMsa1s/51RMCus1x+izvY+XvFox9P4JTJbr2oobVq41SOBH4HQLWXvFb2JI39abc0wZsm
 3RkuMyx8f/9Dj03HeJDwH9tYIEORMw==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=69435580 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwC1aLARxv6c6NPjX70A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180007

On Tue, Dec 16, 2025 at 10:25:05AM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Glymur platform has two Gen4 2-lanes controllers, the fourth and
> sixth instances. Add support for their PHYs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 34 ++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

