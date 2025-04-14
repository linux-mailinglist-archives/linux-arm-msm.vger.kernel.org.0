Return-Path: <linux-arm-msm+bounces-54234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37213A88026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6831639A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77D529C32A;
	Mon, 14 Apr 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNnmEjje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8EC27EC83
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632861; cv=none; b=hyklrO8B2fI60d6SPqlnA8saMxgbv602uXXyLmv0BIuPEzlpx7oQkPm4D6nnSfwlpOrkXNX0ibDt2qbecTPedBKAztZrp9e7MtCQkd6Zpg7ishz4VfiMxMXT1tiq8XTK+M9lGo6p6vZPKGpRXRMXo2OQawQArWf+ZbbTPM9R5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632861; c=relaxed/simple;
	bh=rzumaZ7iog0sCf444cKDLVPB1GndQIrZZhy1nlc+LS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ+ZcLpsKNH9nLlUn1YHUbxMJervl3Q1wDGvo5hdD99LEi3LKqLfGj34cH4tkKow2FOc5xcOOc/axq/5MTbua2TOG34xK60l44wCKb0RayKH9KGfbr441Vfldss6CXBKRC6YfYK4FbfBe4Hdj2lUAgCywfZRCwCNYApvs4Hj/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNnmEjje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99rQm013121
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGrXNa6dHXvr4kroK+MTw5NQ
	iqX7zWwS0Ak/+A0yv10=; b=ZNnmEjjePUV+BrjhfwfZTyG1deE26VgjPzjuXCo2
	YWBhbuGcHoo2EGQ7wYQa84DJiFY6uKeFTtqeAq2pA4PidWV0R6BqXsNcSSbf8MBe
	YF0B3Y7ghr7H95bhvH9LgPrqCSdABJrEiOPd5UpukkduE75MokYhKwkrc6nQwGON
	1WPuc2Z2hQA1rfj82vrIGp/zNwzMH2ygBfWAFOtNX7k6ch8kF/5ijpbVTnYBZTwi
	njM6B/f7Ox90/VGAKNDEnn+Z7cORaoJQxSkMSPUzkunN++eE+slgLMUCYwFYX4RW
	gTjDEUB0NwlU3JemWDeeJiW8oyF+fZxUNvumTEkU/zMIuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj94fed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 12:14:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so644957985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632858; x=1745237658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGrXNa6dHXvr4kroK+MTw5NQiqX7zWwS0Ak/+A0yv10=;
        b=Zr4UAM6Rk2qQynjOsaePny65sOvbM8lvWwSa6nIBuEOd0hs/tUyHCgoR2A5YrRx8nm
         YrTF9tc2XWyIYUn73wWYZ/M95LEhqeO9L0Vdn3UqznoaCEU/Pk0ZUHMNllwCYE5Py+NG
         bDUq7tzuVdtIC+kcySDZ42/1ELVxa5r7Jxz56g49arpBu+kEmClyJ1vLIEV7iVeNzRTE
         ih5YtKuZw2sfu0DSM3Pe4s3Jn8kU+T/J1RNv2DVwaQ7XnIk0j4aROSvhtPmQ5TTPUqgE
         GzPCTi87Dw4TlaSAsrcX9Yu3iHi7+NRXCsREfYMGl42nZ8ADi/lWOA2jOosowRoVeH4A
         hmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN2kCG+tJIoCxkKjvTKx2Dd48XMYkh7dccQkP4hJvNx/t10vnYuc9CeUhR3Dwf4ryvRE5DRECILIH//6pl@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVsUefPXAfvtWDFnQUJG6+Z/UPescaOGi47Z+q3xgbyGz7LYV
	Rh4WQkwXqw3J3chc1pMHq0czrdUq48k4Hv3orXX0BrcQ+sdhAXGAeX0YqQNLNYcSQLZCdUAP5QI
	iOkZ8GNi5q00GRZCK4wJ3HGCjDG7s+A/ygfNjsFkAFcwTD4QQCHA9IvEFwFzoiPJ8
X-Gm-Gg: ASbGnctk0OCLXUZSO01uvIAY/de0dy9RJ3xh/gkIwTxLuFR8/vzl7eRP1sQwW8gdZZ6
	p1CAx6EGuVH1WDsmclh5M0QjzSQRqipuRmjPZjjqYJfpvu+DVZnqUNYfkLKTZsg90nQQDukSX42
	f/9ziF7X46cHSxbk+Wyu7iTxrSicVKYGagincfdm4+9vpAcZ/wOi4azdzjUiUZ1eIsrtoelXm4q
	OQTNXsAfvh9sQB1kn9YqafphF7GfFqDSilm1wEQ0Bzfk3Yv3Jkc4H6Nar8qWY0EWljGz1By4zoE
	6m91BHaNyDU7cl9tYU93R+7ah5wmZqxD/gBd9k2wA7UwP1PYdFmOhmX9crzPwB1vrjXmeFFRbqk
	=
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7af0e0f5emr1701933985a.29.1744632857835;
        Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxzp5iYZiEnUZWE3gvlgW+sXTiIEbnk35cNdFG+zRQtIEUe8+f5w9ReiZy8l+u4jZmVg+wwA==
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7af0e0f5emr1701928685a.29.1744632857299;
        Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2386b6sm1128164e87.72.2025.04.14.05.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:14:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:14:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hPQBmWhm4Dy4rnlr2uJvDxqXmzdAsyay
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcfc1b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=nRcdhEhJI-3p1s1dT_wA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hPQBmWhm4Dy4rnlr2uJvDxqXmzdAsyay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=630
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140089

On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
> >> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> >>> controller. Link DP to the QMP Combo PHY.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss_mdp: display-controller@ae01000 {
> >>> +				compatible = "qcom,sar2130p-dpu";
> >>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> >>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
> >>
> >> size = 0x3000
> > 
> > Existing platforms (including SM8650) use 0x2008 here. Would you like to
> > change all the platforms and why?
> 
> The last register is base+0x2004 but the region is 0x3000-sized on 2130

As I wrote, this still applies to other existing platforms. I think up
to now we were using a mixture of 'last actual register' and 'documented
space size' with VBIF using the former one. Should we switch all
platforms to use the latter one for this region? In such a case I'll
update this one and all other platforms. Otherwise I'd prefer uniformity
and still use 0x2008 here like other platforms do.

-- 
With best wishes
Dmitry

