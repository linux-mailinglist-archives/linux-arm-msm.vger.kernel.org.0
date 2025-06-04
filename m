Return-Path: <linux-arm-msm+bounces-60236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F76ACDEE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84EAD189A362
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFA628FA96;
	Wed,  4 Jun 2025 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNlwsKKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657128F950
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043313; cv=none; b=IW4is6FGADNxpy4eLiJmduQzEF4LMXJnbyHfJ5G4X+/Ce6W4CJbjkSeBxLpnOcue0p3apiKxbAYoY0kp8FKaeW/OLMG+o9q4HIvrnigdLYpJTXWAZfqvn3vxivRNmBOY30Gm8RUKBnhoPUbUmBoaI4WLwmIhaWEeAAKVRE+X0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043313; c=relaxed/simple;
	bh=Z1tbkPEjU7vxBp838sB95jmERxuwrYr3hyTQmVluvOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trkD+ECgJcHIqZrcvZE3oggBIJ/DEM9itqXNaJ1kXxcJV7WPBPRavXM+KzUYXIVCxQh6rhuzo1v2F5NNa2pT6fOb8H5wlbCANq9bdpvorIxDp/1F8oahCMEI1npeP4IFY259g8xx3IGT70WDwbABItsY7t1Xcb7dFG7wd7PKc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNlwsKKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547AkwH010398
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XdjpFZHO8pEeHGXIBs/kB9C9
	YUntjyLrTqtUkQARpak=; b=SNlwsKKXsjrPqZ658617XENwZYli5fvwViFzCYUr
	gM6lv+yzDhkmTAMK+K1BaIdOVBnm6S8zrM33TylwY/u+4G28m6Vlk9jdSPK5oXZ3
	UD32EydJ71nEjo8YauNb7Klfmt+x21yFpNrD7ogbkZXquoTsoYxGzy5kVdNFK/PO
	xf/7c87qP06DJPbwuku0H5lBzmYC1QMw4Xx/gg99ILmq26uP7t3dxSXNO6QVWvio
	B5+41y0Bj1TCIzb2Y+bkSFewQoDotyhvMwo9Xh6Lb5R/vnA2HwwaAvDkWyu055Km
	6Hj9gjhnaadhy0sE8bdd9zpaLsY/ZAiPAlJWVfMkMaafqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yp4pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:21:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee988153so1141234085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043310; x=1749648110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdjpFZHO8pEeHGXIBs/kB9C9YUntjyLrTqtUkQARpak=;
        b=A0x0322Zh5Xl1NzEdHUD3uU0rEY1SkJmNXIWNIOVQDB9B6rTdi0Rolc8Kcmf6oXEjG
         iMGeNHtEqyNGiUedao/rSTavm5rPCTySwwwJT7EmgEUx85nSnGFDGhRumZ00TJxbec0s
         W9S2949+FbbOUInNRw3mAgvnsH8G8e8/18QSjsXExj/LhfKHhmDURCRjGSGzoAkqdvh0
         brF0hbOD2ZzfOh9rPMChOh5R2cldJiZrDw/PFaBbi5+GUbK/8tjBiWb9gK3w10bY0t+x
         o3pOmsMruJMzc/LLQ7nVjiH8TIicZnnn/nGgB5s96LqBeMz+9fdQE8VJytSUCwtZDm5R
         ftJg==
X-Forwarded-Encrypted: i=1; AJvYcCWWJ1zJv9710U9UP1GL5MyYZJoUc1SCbxYqBTu5gy5P+dL38XkP6GQJPEbMGCmA5BXNjtU9kSXq9vXuaSI9@vger.kernel.org
X-Gm-Message-State: AOJu0YxFN5XicK2dw7aQpMe32Ig/6UbPltkmWXrO4PR7rlYcBMGBxWWt
	W5eK3gsMSio5ZKXORmzB3rnvEpAqrE1zGDu4YrBGQfwzPxgEdjgXqZQ8kPlYq/avoUn4eRYKKlo
	J3Vkpo7BRqedo13Jc8k6OU4efO2x2V9trA9cZMh5rS/9ognZ+Pf2EZZ4p+oXhZRGhRed7
X-Gm-Gg: ASbGncuw/dYORb15uAOpt5wgdB1LZ4pUx4zsn2cVjRAkYd8VcxKc3HjKibut/ROR0ht
	9xbNiZxv8eOSnm+OrBeyERSn2FkhYSKc4Irzr6nHG1vn1SUJcPGRpnvvQEp71wqUc2vewh6Mszb
	r8X/3GKhlljS/6o/+XkJRSTKC7Gqlj+lI9SI/ct79PyU31/T/mrTr0n2m5Xxz2YzNM4pL3uVHkg
	EMhJA52aMOc6/9v42qauvVsrGcaM+CAf5IVnbFY50lGbKOQ1Ws2RCHYLoMeZDiI/Un2XDXiJXaF
	o5QwQT7+BR1Pts+5yG8+evyk8XAxgnSZ8d3kw0rr0Io+tOm+AK/Q0KE0TqW7XAss9Wh4GJ2jQn4
	=
X-Received: by 2002:a05:620a:17a6:b0:7cc:7704:bf87 with SMTP id af79cd13be357-7d21a8cc5f5mr330786785a.42.1749043309612;
        Wed, 04 Jun 2025 06:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaF4yXH3QHGrC86KV384wdHehXheVmFfGi0pAVLSi1rxL4Rab2eJh8WFfbXpmmmsGjs+MfaQ==
X-Received: by 2002:a05:620a:17a6:b0:7cc:7704:bf87 with SMTP id af79cd13be357-7d21a8cc5f5mr330781385a.42.1749043309032;
        Wed, 04 Jun 2025 06:21:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b33c09sm21728751fa.27.2025.06.04.06.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:21:48 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
Message-ID: <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMSBTYWx0ZWRfXz4iBOsIIzhFT
 xKY2Rr9X5h1wfvudAb9M9ivKkdvaqA4als2ND9jTxHX34dcCxiRnuoLxo4MSJZBWqUnCt6arClH
 bvEJjH0BNgQLScO4mfFvGJYsQ8FXJv4wJPhAtQDPUcV1METDgcL/77M3XK7QYtc5xBSRm+elt9n
 RzN1YtHyXq2yWbNuWdi0+cZlN5w1BoS13yg4er5rXw5JKURtcpM1udEc4EaPS8p1Gh7R3cbGezm
 2fKWgN0mt834sBjJ/MLluEDB88cjDgF4lOWX7dsvyNbtRa3UyN4jVhhM0TZBMtSKK72KPvPl6Xk
 sg8WUtScyBoeB4B5L/hbIPzueWQJ76r17fSMUCyW0CBcjs8pCkN8JWbnRt2+Fnas4Z94iV5Epw1
 53C6CcB0Fer5Gm6sUgxaOmXGZq+aj3mXwvg473jJRmyEFWcA+esDZz73gcRO1alOtUbT5BgS
X-Proofpoint-ORIG-GUID: PH3IxInDpwtKrXk02X9lZOf4FEW7-MRa
X-Proofpoint-GUID: PH3IxInDpwtKrXk02X9lZOf4FEW7-MRa
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=6840486e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=dNdsqrdDsggF3qCCPzEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040101

On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > 
> > > SA8775P has a memory map which caters to the auto specific requirements.
> > 
> > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > one. Has this changed?
> 
> Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> the later one is SCMI based chip.
> 
> Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> 
> > 
> > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > inherit the memory map of SA8775P require a slightly different memory
> > > map as compared to SA8775P auto parts.
> > > This new memory map is applicable for all the IoT boards which inherit
> > > the initial SA8775P memory map. This is not applicable for non-IoT
> > 
> > Is there are platform out there that actually uses the "initial SA8775P
> > memory map"?
> 
> Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> map.
> 
> > 
> > > boards.
> > > 
> > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > introduced as part of firmware updates for IoT. The size and base address
> > > have been updated for video PIL carveout compared to SA8775P since it is
> > > being brought up for the first time on IoT boards. The base addresses
> > > of the rest of the PIL carveouts have been updated to accommodate the
> > > change in size of video since PIL regions are relocatable and their
> > > functionality is not impacted due to this change. The size of camera
> > > pil has also been increased without breaking any feature.
> > > 
> > > The size of trusted apps carveout has also been reduced since it is
> > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > carveout and its corresponding scm reference has been removed as these
> > > are not required for IoT parts.
> > > 
> > > Incorporate these changes in the updated memory map.
> > > 
> > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > ---
> > >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > >  1 file changed, 113 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > new file mode 100644
> > > index 000000000000..ff2600eb5e3d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > 
> > The naming convention is <soc>-<something>.dtsi and I don't see any
> > other uses of the "iq9" naming.
> 
> As this new memory map is common for IQ9 series of SoC (QCS9100 &
> QCS9075), so we have used its common name.

IQ9 name is not known or visible outside of this commit.

> Once the DT structure for QCS9100 is refactored, we would update this
> common file there.

Can you refactor it first?

> 
> > 

-- 
With best wishes
Dmitry

