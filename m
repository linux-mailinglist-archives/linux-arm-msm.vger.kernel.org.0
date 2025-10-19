Return-Path: <linux-arm-msm+bounces-77921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D47BEE7D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DB5405314
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 14:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B0C2EAB81;
	Sun, 19 Oct 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVrfCPYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF1F2EBBA2
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 14:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760885623; cv=none; b=WlzmSQprqnWVCO2SKOFxXwZY5qudSKTDEaEguw2zfT3qwQs6dOetOmCD7kFdIYdnbcmjqLFaegNM3OvBJSn4pHwOc9VbaTDhZcZjm2sRwVVDXEtg7tPoWfMsh02F5xje0liiuEZj/oGa+yLBgZFeZhv3+8S1qRJtkh96vkg0ock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760885623; c=relaxed/simple;
	bh=v+DNIJKC7LVTEFir6s+qL5nG6oYv9UZBgPlGapUsziw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7kVaD8NrY78EaxBQUlKsbQJOMb7Ko2hfydlTJhtcSVM8bppxLs6MfkH9XFHIsheVrWMM+6nCSJPHJ8vWYm4veB6kFgGJorQCLoiKRpxzRPM+4GD5+E5ais5RgCS7i27CJ1Rgf8JA/Nykc7webWu4mvNJxSPdDyPsZMd35J01bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVrfCPYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JBj3kt028904
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 14:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A24maVFATESsTlySoqTQhxy7
	kngNIH/LwnVSqaac+uw=; b=eVrfCPYbRz/fMbWC1ppsBPH4Sgwf2vftsGKpSwmO
	R4loZ0N2FOSYWhCh7NTUmxYRXVc8Z9G36vfEe7TOSSCU/1L17yGoQK5e3TEgt+o0
	AZisXhWb1r94l1v5nMqv7PhgjQxU0bIQ/S00TfIFD+KSYZscHV2sIACHOJkxQKh+
	JWkEbrC2hyDDrGGCxBB+W/uNwwQ31lhNr+al72GgxRxnSPRB/pNCe1/GlfVcui74
	CWdIdCIy7RNztMGx38Puib7dGhw4q/uv2AROR/SmpLSBrAjGUyCOFyRy5V6Q5niB
	kZxgOzViuCge83M9615W6VISstmn7wyaMd5IvgLxHiM+QQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7tkm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 14:53:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87a0e9be970so131056796d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760885620; x=1761490420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A24maVFATESsTlySoqTQhxy7kngNIH/LwnVSqaac+uw=;
        b=qpi5Oeldq1YmIMUr/tkclVeQqKb3J05EHGtf1fFhUsWsfSj4wXdrgbxwBNTiGaU81V
         +IFImZmWV+B3AKWMR/h8bQPwPuf583E4ir8MgRnOxtmSjJq5dh2KwcqIb3BnfMZeDCNH
         JnxeBgQg/Xwn2A0SuYziQIhkohxMGh4fa3xEuWzN/Yw3BVqW38CBSbkfXZschI9f0itv
         kA1aqBkxyD43JhGWU6/f0WpzcEcnQ8dwjpk/0yK1Kv/v6/M7sJKLwijG3XEr+d4dKF/G
         sVWxq3f9hbHgfh5kgliFD5P/GPspmeN4wSORyZgPrHxkEMJp9OdnLpMzxnX2bwKKhViY
         IO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQp4lzU642JPYh69BcQVdE/altnMj1Z2VDR4yI1LOekOM8rfftk5HQtxAGPPFnPByeUUePXsmTEBuyecsF@vger.kernel.org
X-Gm-Message-State: AOJu0YyjE20RqKQ5+uVBA2C2SFpIUFzAV79PsFT7+xuLBCWYDzvbUmMD
	MAX46LsvqrcWmbNPydMvpAh1aPKa1qwXiFCViaTiwm3CkF6O66htGcDYhXmlvv+lVOO9Baw1bIl
	5pCnC3j4AZN14WzU/1gZ1wkNv8PduH/DkpOX5yDn0fZTcDAOn1rz0XooruWZXqgvqhzpQ
X-Gm-Gg: ASbGncunBv7IOWhz+lrD+sRKUQza96B4c2SqI3jdAmA3P3NLjtq8a5UdaYtfyg8odUX
	cFJvexYRqYQsvXjdffgrr2PVz3K6bOLyhIaN0MGN3kHtzFrWKkpaMh8Yhc1uaHGf7nLQC4ILBBI
	e7zVdsVVD0xgJqfJSmJ2xJ+cnP6C18Ga9ut86v8O4EF8TijB/1eD2R+FGOPfhty+fqetmsE39eA
	rl2FqJWaXsztF8RZkRLi6AjosVjhO2rm8wVari3AAHhY0IJnsSs3FsVGwnzIj4PbTEe+QjHAZvk
	mS/78Nzu6V55HTz8+VjF591l6G2k5aUj4R9b91SdzNq6Jomc5sjXPYfxIvimLPr9V+IDC9oFuqQ
	RCva/HT7I0iuYtedACxy+UDrBjFdgDT4vYsC6mJ/3sw5zCjQ03AmFvk/Tc2vyhbe8Q7BQ+UPOgO
	eBXZZqFsup8ck=
X-Received: by 2002:ac8:5710:0:b0:4e0:24c5:5137 with SMTP id d75a77b69052e-4e89d3627e4mr138238721cf.51.1760885619679;
        Sun, 19 Oct 2025 07:53:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHly3/EfmiSEOivc1I/hknQKtS52LSHutywrccRSqCRSmyWqUn16HN5RNyUGYetTlLKDXSZhA==
X-Received: by 2002:ac8:5710:0:b0:4e0:24c5:5137 with SMTP id d75a77b69052e-4e89d3627e4mr138238361cf.51.1760885619115;
        Sun, 19 Oct 2025 07:53:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a95789f1sm13418781fa.41.2025.10.19.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 07:53:38 -0700 (PDT)
Date: Sun, 19 Oct 2025 17:53:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
Message-ID: <r6icx36qpns6sf6btjtjssmjsmkmcvtgq4jyo5yeiect5j6tlu@pe6kfmdaxlbh>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
 <n4xims4y5sssqxkchg2tikc7idkzds5ru7ayidcgxdfx77je2d@qo34qucbebnn>
 <a5da8d40-f194-4fed-9118-037bd39ebe2e@ixit.cz>
 <st7oizyyih3fnsi7jgcp47pl7s6n3gz2rdcv7iryftol3bqvxk@buam77hiqnl6>
 <1eff5dd7-5229-4ee3-9856-ae61b4c82f9d@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eff5dd7-5229-4ee3-9856-ae61b4c82f9d@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXySTNBD9i6Qoh
 eA2lvgqgO4r6H5zANiBSNwsM1TPQhWJq/D8WuIREq36dre0WSzMqXk6KHCbUZ7kinfexURiJioD
 adoeZkQ40jFiBD6bzpWWsvdOcJCctqVcDssbB7r7siGOa9ie05UZijKYkLEWczbZuYyHEnFnr9f
 erbLhkEb0KboFOQ23S6lbXQ89k59lRbC+D9MX+dR3EPyWpXHGH45gdTW68ss5kiOOAb+4NIjmhX
 /LVZGLABYp5TtJfE64ta0a/RapLnwmAjztAvPu1xusgq+4Qb+pLrqkGGWvt44i5f3CNQAYCIxp4
 SpnLYm6NrAhned6rKB9kbnXodiHlApgLK3UtItUjjj2Z6C76xI8kG1o91oFExVE7qFlNnY9/8Eb
 dhMxl9YAHWA+Yi4FoxAnIMA1PvK1vA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f4fb74 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=hOZ6dJPvPovaWAsPY_MA:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ql9XgCDAjYYB-2pwGmlul_9_i3Xnqsk0
X-Proofpoint-ORIG-GUID: ql9XgCDAjYYB-2pwGmlul_9_i3Xnqsk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On Sun, Oct 19, 2025 at 03:02:36PM +0200, David Heidelberg wrote:
> On 19/10/2025 13:51, Dmitry Baryshkov wrote:
> > On Fri, Oct 17, 2025 at 06:59:14PM +0200, David Heidelberg wrote:
> > > On 06/10/2025 00:03, Dmitry Baryshkov wrote:
> > > > On Sun, Oct 05, 2025 at 03:16:29PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > From: David Heidelberg <david@ixit.cz>
> > > > > 
> > > > > This adds initial device tree support for the following phones:
> > > > > 
> > > > >    - Google Pixel 3 (blueline)
> > > > >    - Google Pixel 3 XL (crosshatch)
> > > > 
> > > > Great to finally see it being submitted!
> > > > 
> > > > > 
> > > > > Both phone boards use the same identifiers and differ only slightly
> > > > > in their connected peripherals.
> > > > > 
> > > > > Supported functionality includes:
> > > > >    - Debug UART
> > > > >    - UFS
> > > > >    - Charger
> > > > >    - USB-C (peripheral mode)
> > > > >    - Display (Pixel 3 only)
> > > > 
> > > > No remoteprocs / IPA / GPU / Venus / WiFi / BT? The firmware is
> > > > accessible to download from Google and it can be further repackaged (but
> > > > not redistributed). See [1], [2].
> > > > 
> > > > The phones share all firmware except for the bdwlan, so hopefully you
> > > > can add 'Google/blueline/foo.mbn' to the common file.
> > > 
> > > Would it be acceptable to use path format qcom/sdm845/$codename/ e.g.
> > > qcom/sdm845/blueline as it's used elsewhere?
> > 
> > We have settled on qcom/SoC/Vendor/device/ long ago. Could you please
> > follow? All upstream Qualcomm devices follow this approach.
> 
> Sure, in next version it's done! Would you be open if I sent changes to the
> existing firmware paths for sdm845 firmwares?

Yes, please.

> 
> Thank you
> 
> > 
> > bdwlan should be sent to ath10k ML:
> > https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html
> > 
> > > As I'm looking at the Google scripts, I assume both blueline/crosshatch use
> > > same firmware (which makes sense, as only the battery and display is
> > > different).
> > > 
> > > David
> > > 
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry

