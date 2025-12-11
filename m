Return-Path: <linux-arm-msm+bounces-84952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52531CB45B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B5BF300D48E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 00:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B9421FF38;
	Thu, 11 Dec 2025 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D97jvr7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXz4yMJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5821B9DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765413428; cv=none; b=TE4HBgWeMzNUJLikq0tD1jBA1kRinXYfoimv4SyFWksCUZ3Y0p3aVUQGZFQILpNiQmNot8UgOO5TcjJL/LFYjmVIdxDzBkqAlc0gEIqXDnoCXSOAUY+fEQXq1MAolKHW+3KxM+zT0NlA++l6GbfqTcKt3A1ney3/YO7P3QQaX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765413428; c=relaxed/simple;
	bh=5Zbz2/ihUm25IV0J/CxcR1/XVi2xCINTqW/uN3sJyfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxPVQWVLwTfbzNHSRTcc0pI7MH8nm06HEFGBDXC7Aa659vktUD/3P53d+tHNWuesUkPhrHc4o6S32YA8r4zrdoVTzZpN8uYN3IjVEacfoGynWXGZMGDwZcqabihuz/LvmLg0ImqvM6foOpy+ICHVDCYlVvx1V5ZNyWoABpZUfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D97jvr7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXz4yMJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPnaH3736367
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZzAZ1zm1N4FbJQbSE80XG/1
	cSHskcB/DOZCdQCyfNQ=; b=D97jvr7vxEW/ywGpKeSi/HiLaUijYq8OHC7xgWxm
	MgNDqf/tbXfgpmXrPB9v2Y9PdNqVOLKB2jWDnJ8gSfPwiPxR1sIjRyHOFoDqWtoy
	/0il/5G1q4UBlRAVapJ7Bn0ETj9mBnAwXvwxD/CfUtU+4HiSksTh+G+5aP886S+L
	edVF3g5WAHOV/8VjbekHyd85XRT7sJ1OI0a3IYptnZrkRqQLn79q7XjHABDEMSvr
	PrchPTfpfzw9IRgJD82T5tsQ6kdIQeZCrmZjyXBS7LfhobmZ0FekdG5iOynaKH1/
	mHWsXLqdb7YsGDhTMNsGNFwMb3iFcde5SQT3c1xyw9AS+A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0prjfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:37:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-559836d04dfso704018e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 16:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765413425; x=1766018225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZzAZ1zm1N4FbJQbSE80XG/1cSHskcB/DOZCdQCyfNQ=;
        b=kXz4yMJpffffhs4o33VE7/MLQduk2F3w7n4O/ilR21Hsp6yINnYziIq024E0YreFuG
         gUKYua9fBA8UfcYM/qlrfnlgGkEwESvD/tggQbjT7yuHR/0zB8ETHWj7KYz4AHTc8/ys
         z6tZZIaZAkJ1TnhWC4bOIi7yUP76ouZvvfRTpo32GRNFq/cqyaIB5MSkPX+D7i0q18tz
         /Vdb71aLbql5yd4Ume2V8nEiB/zDziyAl0RuABpTSY7inVWfm7l7tcN+b2uOah9002vx
         D5F2V+NEvwe9vrQu9gyB2nq7h5RHsquQjPV1drG13MTFoBRB9qnf6MkPOVcL9NOXS/N/
         k6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765413425; x=1766018225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZzAZ1zm1N4FbJQbSE80XG/1cSHskcB/DOZCdQCyfNQ=;
        b=l09qmA6lMsppYss9qSJKOrJy8621GGBKixWSvAObIxwsG/Ka2HEbyFHdz3oyTfCiWt
         3l66bsdP5+UWWyz7q1y/afnr82J53Pl/myeW7wRhZP3TycoT+UMpE0YbzMwhn8TmABVQ
         N09IXhn0j/OKxZBhflKAyQz346cnOLmocW3I1fJ/afjRL/xJdxunK+pcJGqbyx+BbLMZ
         RYEq+R6boMmBsfcCrjmFn1Iuv7O1IEZx3tIv6HKnVcw4wOmIar72rxl+fOONSrTIx3ky
         7gJ54NG4bRGppPD4x9XhyxvT1XjOMGl1BDi403AUnESVMQXEFRCrHq6CiQ5A/jl2+tXG
         rpOg==
X-Forwarded-Encrypted: i=1; AJvYcCX6YXYoHtqIjlX25K8y/ncF3Imm9CKrjELJhrmtQ4Du4BSEAYP1UGWNrTixCUS1wXiSWK1DuBJM9vN9FJhP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1m5mo4NnT8ceG9XDzfWQ8UtsHKI042oxK89B9uceQa894bQMp
	D5xr4G7jtq9r6XqGXXWaXBHDuDcFs4lWQJXVQ3UgGpDrf+oXQeuakhHig4nGEixDOfmItY+HMUk
	ihP4EsbjCPPzzVsFFMLYAmEEwtppEegG3Q0Zw4tpQ7QnGl7ZN0grDvaNEtCQDLTyDakqC
X-Gm-Gg: AY/fxX5l+cELxgwIBBjWsjjIi5EcpyP9m1poG8IXwNpfQFdEE1mJTu8gJdtjUzsHmBj
	lvnxIm2reL1HPxMxG9lkx2uz8WwoWj+cEGLnlx3DV6pcNENy6lkFFJ86XXZu1dyXDHan7PU7He0
	H+YxOEEP//e3NpqYOiwbp41CJuvBFAtxh/GJAyBYHVBmDG4vXF8tuVnCWHLrUwnjba9XvfzztBZ
	RebLTtYf3ezASwMb8KC31Kf71GMqLT8JcSmG0G4xufROVbTBUoVIZebyUHy5Oz+osNuJhO/P+xW
	yqn8nNjDeIhvXn8MD2IE7tvFFDM/FzZcmgRM3FNvulWQ0+vFnX6Pwka6YJc4iMMG0eEuF1ucu47
	BJoBG3GXAeTYnt4SMV4TQGQXMWh79zTTpKjDd3lkaS/OvokQ6V2ZtYQoOz60xqz0a7lFuNsCPEO
	oow9txA+2GFMN9IfYuoUjdnsY=
X-Received: by 2002:a05:6122:3c93:b0:55b:305b:4e35 with SMTP id 71dfb90a1353d-55fcfc75df0mr1515211e0c.21.1765413424693;
        Wed, 10 Dec 2025 16:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKkw0sCxCLy8yx7BA6u+OWcK0baof+gmuLoAvEjnlXyvNsyZ4djMWZObTKNZnEHvIN617ngA==
X-Received: by 2002:a05:6122:3c93:b0:55b:305b:4e35 with SMTP id 71dfb90a1353d-55fcfc75df0mr1515204e0c.21.1765413424120;
        Wed, 10 Dec 2025 16:37:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9a3b77sm2759181fa.10.2025.12.10.16.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 16:37:02 -0800 (PST)
Date: Thu, 11 Dec 2025 02:36:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vsfhltxguUU3ZZiNu8ll1dWa3d7XYp7Y
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a1232 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1kFrs4HfXbbYKCOWPsIA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAwMyBTYWx0ZWRfX1hQanwCCIZ1B
 y1QgQKpbfq/1DDnmi1FpNUmbtJEiLS/uOcc3656FL1GO+gYcV3D22CCtRtI0LkDxREvDsP6N47C
 GZu3Hae1GWW6F85yr/1QyBFWkheUbqoHpvlyG0IktZZevP5G7caMWnmdsV1W8F47dyf7crNO67a
 9BYV4y0KTpcEWJmRc7qXUi8ZgWDWxbFIdoDfWw0N75hrYTMutQyfqqqWyhXUtggKw9UyP1XsFQF
 8N/w7zZiUGZ63yPqnvU2zotXdXjW2jfn0kXEdMS1C+wYZ3Vz6kFqVKdkh+eHm9Sgk3f/19rJbjB
 gb6BNaozwCiL6lnBEvWt+7lNY7U2yeZUUsTy44ltyrk6yGgncY53wt06pEhpBJO399HDnrljPH1
 RjyO3SQCznMVdBJMSNcGA7DuxkIwRA==
X-Proofpoint-GUID: vsfhltxguUU3ZZiNu8ll1dWa3d7XYp7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110003

On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> > On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>
> >>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>
> >>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +			gpu_opp_table: opp-table {
> >>>>>>> +				compatible = "operating-points-v2";
> >>>>>>> +
> >>>>>>> +				opp-845000000 {
> >>>>>>> +					opp-hz = /bits/ 64 <845000000>;
> >>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>> +					opp-peak-kBps = <7050000>;
> >>>>>>> +				};
> >>>>>>
> >>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>> or mobile parts specifically?
> >>>>>
> >>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>> here.
> >>>>
> >>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>> except the 290Mhz corner. We can remove that one.
> >>>>
> >>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>> speedbins from the mobile variant until that is supported.
> >>>
> >>> No, we are describing just Talos, which hopefully covers both mobile and
> >>> non-mobile platforms.
> >>
> >> We cannot assume that.
> >>
> >> Even if we assume that there is no variation in silicon, the firmware
> >> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >> wise to use the configuration that is commercialized, especially when it
> >> is power related.
> > 
> > How does it affect the speed bins? I'd really prefer if we:
> > - describe OPP tables and speed bins here
> > - remove speed bins cell for the Auto / IoT boards
> > - make sure that the driver uses the IoT bin if there is no speed bin
> >   declared in the GPU.
> > 
> 
> The frequency plan is different between mobile and IoT. Are you
> proposing to describe a union of OPP table from both mobile and IoT?

Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
has speed bins. How comes we don't have bins for the IoT variant?

Mobile bins: 0, 177, 187, 156, 136, 105, 73
Auto bins:   0, 177,      156, 136, 105, 73

Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
starting from bit 21).

Mobile freqs:
0:         845M, 745M, 700M,       550M,       435M,       290M
177:       845M, 745M, 700M,       550M,       435M,       290M
187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
156:             745M, 700M,       550M,       435M,       290M
136:                         650M, 550M,       435M,       290M
105:                                     500M, 435M,       290M
73:                                                  350M, 290M

Auto freqs:
0:         845M, 745M, 650M, 500M, 435M
177:       845M, 745M, 650M, 500M, 435M
156:             745M, 650M, 500M, 435M
136:                   650M, 500M, 435M
105:                         500M, 435M
73:                                      350M

290M was a part of the freq table, but later it was removed as "not
required", so probably it can be brought back, but I'm not sure how to
handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.

I'm a bit persistent here because I really want to avoid the situation
where we define a bin-less OPP table and later we face binned QCS615
chips (which is possible since both SM and SA were binned).

Also I don't see separate QFPROM memory map definitions for Mobile, IoT
and Auto SKUs. If you have access to the QCS615 hardware, what is the
value written in that fuse area?

> Another wrinkle we need to address is that, so far, we have never had a
> dt binding where opp-supp-hw property exist without the speedbin cells.
> And that adds a bit of complexity on the driver side because, today, the
> KMD relies on the presence of speed bin cells to decide whether to
> select bin via opp_supp_hw API or not. Also, we may have to reserve this
> combination (opp bins without speedbin cells) to help KMD detect that it
> should use socinfo APIs instead of speedbin cells on certain chipsets.

We already have "machine" as another axis in the GPU catalog. I'd
suggest defining separate speed bins for mobile and auto/IoT in the DT
(0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
mapping those by the machine compat.

-- 
With best wishes
Dmitry

