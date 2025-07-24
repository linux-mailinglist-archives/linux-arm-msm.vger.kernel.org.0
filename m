Return-Path: <linux-arm-msm+bounces-66615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46335B11163
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 21:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD88F1D0040C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFDE2D5A18;
	Thu, 24 Jul 2025 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxghhJcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A82ED14D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753384075; cv=none; b=stHqE/6zA8gbOUTQqeBLSD1GUebr81CMvtNdc5T6SlVLqDqAM4dLl3MsUa+myVvyRaab/RWBiFjqq2KrBIsbDmVtxF1alkNjYxOTpNXAOlVQ8Na0TfgshlN7J/I8VKzyts/LPJKsIB59wz+CPiVB2VRfWkwYBK52P8VPKvefopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753384075; c=relaxed/simple;
	bh=26XDVP5566GAnWIYeOLHW+dlq96NO4/Osy8Txa6q1gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFKZu3G4XOPv1Rm352HrX+KqayYfke1KYTgVupsWoAAvBGQ6O9Ks6nL1TcBiEPccZ8dRY8ZKihfv23sK/QeThcKPwOAtZMQitkFeLAYce7gNB7WRH2k8PLL8oW87LUZs9ljWA+o0WTbki9kbmfBlm79uK/GUxHQlD+Nan0uvjYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxghhJcd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9Zlcs012717
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7gLTH/iPfyYd7ztc/IvTC63q
	u18XmYjP9dX1gtpz5vw=; b=AxghhJcdmkVlV8A/LFkqNi4x3192Kt+rBYmEFZaS
	IF7YKhOFYHTyTug3dzCfg2+4qN3KYpuGaXyxbXCUheRyYPklVK/MPsIhEDJ4RJFP
	TPKy9ekePpdtgXKz4jpf/0rHQlySHIOWR0RHkY5ViBo7wIeLNxHn5TrKBMAER/9q
	g8tvXBFkD7/RjEil2nODxKfNoo36W/+dNRCJ+Bd2YPL07QY6MJXu0xRadVSOzGnl
	jXtQ8vpEyIfhZvlKYDnsZ1w0v80Mim1ES1Z90l7Ju2t7zWv/Olfx0JYmukfLw3xk
	yv8TvWPe1t0RYRZxOiXZro4NPxURKkkWK22cTg+D+sNfEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hyug9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 19:07:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so26164516d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753384066; x=1753988866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gLTH/iPfyYd7ztc/IvTC63qu18XmYjP9dX1gtpz5vw=;
        b=uaSICvs+u8cHtI3PMeTmG3gMUztMZCjiarp/xF7sc92nBg55YWD+SXriQYCYAzjXDC
         g5WAiNxB11NBdOml29kKyTyI4SWnxIgBlltCmWf5e9e4KzZEKNjUDs7jg8zQwOZVhO77
         KonQIyG6kgvNgVhk45jqKqsiCvnVPTqUzpjSsnoCnnJJWx84mLkbSpG2Ha0rCl6DBZYO
         kriuJMxd4nBDFTMzrG3HzNLGQGEOqgshD+Vu3ey6x3SoK4TKLRZOfId145mXO+Y3sOIc
         v2Alt64kWbvgVMOK1cLIwKug/EaAQ69HHenn+FF1uk3mmJsQSmIap5ny8rk1Tju1wwKf
         kt8A==
X-Forwarded-Encrypted: i=1; AJvYcCUYys0VNqrpjsR2swbDEzidqQw+9Lg1949tOIdCVLA3EQWzUu5pmt1sWeSoMu7nzKok7Jh70HKIXW+eHNKX@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkYUJ2nOJeJYv7ApwgD2jvy8oyfrqpN3RCLNcUiNtiWrfsk8q
	nOkvi6xcmDWIBmPA6NXs7QE0v42LN7B+yh4rMS154XSP+VF/iGwptEpaJP6A7L8vTi+vtrPTUF7
	sAELRRgHmLe+DPNy7M0TzvRlHaQajw/NmLAleEBsS3akMRRV990f6ldLPb8xWi3ZTIoYv
X-Gm-Gg: ASbGncvCfNdld8tLBTr15jo77ngjEKahI6bm3tzwgFJEQlP/RWarfE8SyKyiVGyfA4m
	1PvqIBoLqmCngb3qzzWEMhBpdbzwvqtS4eDDKrYB8MPfsFlAILBf5c9E74lcDduW3Nz5VQmI1C6
	LRk4CCFiPCHzt2sO4cLlJwKU89C2xOkaRqLVO0pP1x4GPk0dOEa553GsEkn63SfNAY68dOvvsQR
	AkNdG9XnzrvT0SGgvyJ5oQ7DYIKpPkWnqCmdpYLLKPOnsqmvYNzVENkuzt0zvmNO3DL/a6O6Ags
	OeouM71a5ZMAxsM78ecxBXYSnxcYKUSRfTVX+qcVfm2OEGnDZORr88g8qeuSnIuaBm/M64uld3F
	AWc5mYuFRIKtnKMUVQuRrOfSE7zYQ/wf+JHU2WYVF0IKg5B26m/Rw
X-Received: by 2002:a05:6214:509c:b0:704:8e3c:7b4d with SMTP id 6a1803df08f44-707004b3635mr101404186d6.4.1753384065287;
        Thu, 24 Jul 2025 12:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ezANv2YxvlF9vrpMbyVqY3MqWwG4tyluV4xdmyQRehKExXlS4PDANRKq0ZCM55RnwD9Y+Q==
X-Received: by 2002:a05:6214:509c:b0:704:8e3c:7b4d with SMTP id 6a1803df08f44-707004b3635mr101403786d6.4.1753384064736;
        Thu, 24 Jul 2025 12:07:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b35dd1sm480953e87.65.2025.07.24.12.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:07:43 -0700 (PDT)
Date: Thu, 24 Jul 2025 22:07:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Message-ID: <blexn4zno3azgfbh4vzh7daizy3lbh5s26z6sivtyqgb36phnw@neorhsyqrgz4>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
 <20250723-swinging-chirpy-hornet-eed2f2@kuoka>
 <159eb27b-fca8-4f7e-b604-ba19d6f9ada7@oss.qualcomm.com>
 <e718d0d8-87e7-435f-9174-7b376bf6fa2f@kernel.org>
 <fd1a9f2f-3314-4aef-a183-9f6439b7db26@oss.qualcomm.com>
 <3cbbace5-eff9-470e-a530-36895d562556@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cbbace5-eff9-470e-a530-36895d562556@kernel.org>
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68828482 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=PDmsC6A1k5bsBzTUqyEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0OCBTYWx0ZWRfX2ed5rBK3VbHm
 htD+r6pqHEuzRJqJWfX0KN3OCzVnbcy19d29IlYM0NRoXT22osR93HeX8t6aT6HeR8B/YJMZYzj
 kvO6Jj3l3mANOGfsEdtJf+pbKGLEusbTvoSc4+npOy3zfLQJLx5RsCvTsO/R+oyUqQmnrDCIcRy
 PPrMnUqud2unwlS3cTxveNS1NlRkEjDBIj3xyTntJSCwHejHblHi6pPjEAPACwt7jZ86KaimEPX
 SRHgp7L22s4y17yOkGfnFdlHN9l2w2xPTpRrtyMHCOfYwL5EnPOPQxmUZmbjfkyuNlfj0YPEQKA
 2iSafi5YW1QDJI52prfxo37cHb/8qxCtERisUJH83ZHmrZKVBZKnTp+LsJu2ffGxVrzectGcc7q
 eD+LRqMOA1azbQelJ+nRJ0vPAncY1EykmE1BGJa+A6u+3zh83I1+uBd3bkfq2/naOfCqQAAS
X-Proofpoint-GUID: hnSL9_sEf35FUBB6lzh_0EBxllne3zDD
X-Proofpoint-ORIG-GUID: hnSL9_sEf35FUBB6lzh_0EBxllne3zDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240148

On Thu, Jul 24, 2025 at 03:20:29PM +0200, Krzysztof Kozlowski wrote:
> On 24/07/2025 15:11, Konrad Dybcio wrote:
> > On 7/24/25 2:51 PM, Krzysztof Kozlowski wrote:
> >> On 24/07/2025 14:47, Konrad Dybcio wrote:
> >>> On 7/23/25 10:29 AM, 'Krzysztof Kozlowski' via kernel wrote:
> >>>> On Tue, Jul 22, 2025 at 08:19:20PM +0530, Wasim Nazir wrote:
> >>>>> SA8775P, QCS9100 and QCS9075 are all variants of the same die,
> >>>>> collectively referred to as lemans. Most notably, the last of them
> >>>>> has the SAIL (Safety Island) fused off, but remains identical
> >>>>> otherwise.
> >>>>>
> >>>>> In an effort to streamline the codebase, rename the SoC DTSI, moving
> >>>>> away from less meaningful numerical model identifiers.
> >>>>>
> >>>>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
> >>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
> >>>>
> >>>> No, stop with this rename.
> >>>>
> >>>> There is no policy of renaming existing files.
> >>>
> >>> There's no policy against renaming existing files either.
> >>
> >> There is, because you break all the users. All the distros, bootloaders
> >> using this DTS, people's scripts.
> > 
> > Renames happen every now and then, when new variants are added or
> > discovered (-oled/lcd, -rev-xyz etc.) and they break things as well.
> 
> There is a reason to add new variant. Also it does not break existing
> users, so not a good example.

Sometimes this also causes a rename, so yes, it breaks the users. It not
frequent, but it's not something unseen.

> 
> > Same way as (non-uapi) headers move around and break compilation for
> > external projects as well.
> 
> Maybe they should not...
> 
> > 
> >>
> >>>
> >>>> It's ridicilous. Just
> >>>> because you introduced a new naming model for NEW SOC, does not mean you
> >>>> now going to rename all boards which you already upstreamed.
> >>>
> >>> This is a genuine improvement, trying to untangle the mess that you
> >>> expressed vast discontent about..
> >>>
> >>> There will be new boards based on this family of SoCs submitted either
> >>> way, so I really think it makes sense to solve it once and for all,
> >>> instead of bikeshedding over it again and again each time you get a new
> >>> dt-bindings change in your inbox.
> >>>
> >>> I understand you're unhappy about patch 6, but the others are
> >>> basically code janitoring.
> >>
> >> Renaming already accepted DTS is not improvement and not untangling
> >> anything. These names were discussed (for very long time) and agreed on.
> > 
> > We did not have clearance to use the real name of the silicon back then,
> > so this wasn't an option.
> > 
> >> What is the point of spending DT maintainers time to discuss the sa8775p
> >> earlier when year later you come and start reversing things (like in
> >> patch 6).
> > 
> > It's quite obviously a huge mess.. but we have a choice between sitting on
> > it and complaining, or moving on.
> > 
> > I don't really see the need for patch 6, but I think the filename changes
> > are truly required for sanity going forward.
> > We don't want to spawn meaningless .dts files NUM_SKUS * NUM_BOARDS times.
> 
> Renaming will not change that. You will have still that amount of boards.

It's still that amount of boards, but it's much easier to follow what is
going on with those boards. You might say that I'm biased, but I think
this is much better than all previous attempts.

> 
> > 
> > So far these are basically Qualcomm-internal boards, or at the very least
> > there was zero interest shown from people that weren't contracted to work
> > on them.
> 
> They committed them to upstream for a reason. This comes with
> obligations and responsibility, especially for big vendor like Qualcomm.
> Qualcomm does not want to commit? No problem, don't upstream...
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

