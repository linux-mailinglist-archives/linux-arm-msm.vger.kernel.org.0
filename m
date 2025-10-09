Return-Path: <linux-arm-msm+bounces-76719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0FBCA2C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CCA1A64851
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F31D22541C;
	Thu,  9 Oct 2025 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcUpjNGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB521B918
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026837; cv=none; b=MUh1OzVsOyfdc6IfWCZqyL2ghmLA7FbKUdb796Nnn1FSSn341y2wo7va/CVSbhRFyY6n63T5mUlEWQKTEqsOr7ceoODX6r83ZzJCDqD1q17T/XbOGXRHglIgps53z6o8DYSmoEqakSU76kH6iWBUW1juQ1vlAXUWKYUsY6hp3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026837; c=relaxed/simple;
	bh=VbQsVyRsuWloA1O9V/3twwb3hcbjIIv9Hp3Pl6v70t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8q2fY+8TQtNcNxkDAM0nx++/P3T9z4jcP5chkf/A7vYvnqjeQB2NgezWEocP3A+a1XgdpGR8thd061AOGig8OHObz4fPc0IxAyQxpRmVYTQAe8AqsJvjkGGvNI7P9PYQnmnF9cKqTg80KJbNehFRs4SAp3/zQNLLwvoZ/3H5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcUpjNGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599F0GH0024408
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 16:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aUrMD37peXtVojgoLEAh0gbY
	11kyxgxZwVOkAKeKJMI=; b=kcUpjNGab2GgcvDjxDOroV6bmU94ubzm7qnW9Tpy
	eLe9TXkOwmYBHxvuqDv5sT7oDgdjqzrYJXtxMLiy61FvEndl3ADg6jr7urNmuYke
	B8Nbjso8TQgY+bM3G1j8o2qldn5vpZOmaFrr/rBnF43KhDaKMc39fo4E9ziJcn5B
	p7U3DjkV1Hxq+xWnuLt/94CxdcOjkoSvP9knM2VgPrYcaiKLlP+F1acCX7SLmX3B
	lhGwXjfz0kmVn/igIvH395qjvtoxWpRICv1vSYEZn36EdCDZEUyE3Hz1zvs6gbxD
	8Vyjor4NUJebC8a/TM2N3eOGOK2w9+PnVyFh/Q2pY8vTkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m3kk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 16:20:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dbd8484abbso25545061cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026833; x=1760631633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUrMD37peXtVojgoLEAh0gbY11kyxgxZwVOkAKeKJMI=;
        b=L5y9cyH++rn+LjDpR3LuwJvp/1uJfPaqSBXTjspZxaVdEXRfX1+6rOzsfPAcn0p6gn
         l5FlNkCUnvwv8+f6epVSyVelmX8FTiqUQuBc8Vg8JAdCgAy+lEvvKhcwpvPaESB1MQ/m
         ri3GovhHvWJgjzjgt8lmPWBMoYMexvOgYabeCBh/0Xv+xH/iszPBuZ18Vs5AKfWzFyKO
         f6c7Sp521Uc8j9wojMOekfhgUdAzZK/U56mznIiZj8LQNuONN69LLMyNBTtyJEJ9eObF
         Qv8nQmDneKSJy4Afvnju1J77Pz08reCwQZ5WdKIPYEyjyJHa106i3RMiACxRgIdxnpLq
         0Tdg==
X-Forwarded-Encrypted: i=1; AJvYcCWhUlqK8F3QUKmzNJshOJ0+kOZhPXlenXOzj2Xi3LJlCAtHkZaYL2f0JKShtoso2QBI9XErefn1Lx3R1qqU@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBTLXTSY9x/uGHAB+VZTI7woPCTiup/3TrHTBRrdK7V0+KvEq
	lblvUTnAuV0/ZUWHekGteV6667gH5GMztoxXamCsQWFILYmSlHoCgoU9IIrU6wrPyeSRaXyHdI0
	d3k9V1FfLf6f0jafkSyFlinZ1Y0SPIS+s/VHKaW0yu89UxmfBVQoYs4WAYSVOAb3tU7y2
X-Gm-Gg: ASbGnctnL3gffLK6V6ap8Aus1mwFzFXuqKN24NncVwuCqWqMs5wOdgqt4MjL4/BAiih
	AJNhWmNb2Bti52E5vTIXFm99YrNEqClMlULnNL5QsjeDQUBlF0g/UUYwcQFItmNpJtGv8tRgE+g
	GtOMCuWvTaemSDKIjycfm1CvKTk7xrcSSbWYfzaHwkxGgbQW5RXIMoVLBtJXVFIg4ukqllegqry
	ni6iFqw1AUd+A0jxDQz2lKned8KjQ+fBs43XQRcqpcwuHPJOwVtfFAbRhfr+e7itnlucp6K6nAS
	RpZVKIycEB8Nad5ICA1dBcQD4e+foPaDgcSJUPWgfxXM560BEqCPXbIXt3/vCOyh/u3Qpqb63+Y
	AvOufe3aTlUhThq2ZT5dcDVAsmY8i5+4XV180c2Btf19Y1dt/OBzS/U0cZg==
X-Received: by 2002:a05:622a:586:b0:4e2:ca4d:2956 with SMTP id d75a77b69052e-4e6ead1d1c2mr103131321cf.37.1760026833437;
        Thu, 09 Oct 2025 09:20:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJTouOXP+EABlCOSGus56DedrTUrViwKuBlKhFr3F8onfjvCRC5pfiuEb5yBFGb61EG16HEg==
X-Received: by 2002:a05:622a:586:b0:4e2:ca4d:2956 with SMTP id d75a77b69052e-4e6ead1d1c2mr103130711cf.37.1760026832905;
        Thu, 09 Oct 2025 09:20:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcbbesm29121931fa.25.2025.10.09.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:20:31 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:20:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
Message-ID: <6n6teatqlppmstvcymwhf66wvfwc3upquvph3i7eina6htbxqt@ch23apdeykz5>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
 <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
 <um6d7e2su4erqet5fxyaxpyulfrzqvadq4izxgmxu3tol3i7jk@godpxwsqeqzs>
 <0a0afe32-7814-4901-bfbb-6694cd846257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a0afe32-7814-4901-bfbb-6694cd846257@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwYpsKKNEWogd
 FN42zx7oOF7+4JjXOhutEX7JOfKQyTdjDdvTH3r6/eOh9plsg4xEy8qrPxifwhVeZU5FSmr1NWi
 k+YFZJwb1cbG/UJrKiR0WtwF0GrglTkWV4KrVqU/wyzE7/+PEKSPNgUGp3dW02c187RuDsC/BX3
 SNM6LthbJ12uK/njgRyH5gHUlvdLZTQTd3s3usz2zvENNhCO72+W660eE+PPLe0ZDQA3bEzDjAw
 Pv9F1dJVht3VC51dn8YIE5tHz2WeYRvzPmoWCtipkkubLPT4vhopR1TYGvQaMvwKiYZ4dlIuDEr
 Z1px9iov+cPv4UJlaP4+XBJi5YSy+12eeW8/49iuMxyIC9WXr8LBnBHJNQZTvMXqsPvz+kKzxQa
 z43eW9p4TCSxYIbDFzfo/PJ/VBvPFw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7e0d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=t2CvURYCdbnRCxKuSPgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: 54H_tqss6w3YKz3T3fTLHhUguR_GrvV_
X-Proofpoint-ORIG-GUID: 54H_tqss6w3YKz3T3fTLHhUguR_GrvV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 05:49:45PM +0200, Konrad Dybcio wrote:
> On 10/9/25 5:00 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 11:19:31AM +0200, Konrad Dybcio wrote:
> >> On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
> >>>> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> >>>>> As a part of migrating code from the old Venus driver to the new Iris
> >>>>> one, add support for the SC7280 platform. It is very similar to SM8250,
> >>>>> but it (currently) uses no reset controls (there is an optional
> >>>>> GCC-generated reset, it will be added later) and no AON registers
> >>>>> region. The Venus driver names this platform "IRIS2_1", so the ops in
> >>>>
> >>>> Which we've learnt in the past is "IRIS2, 1-pipe"
> >>>
> >>> Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?
> >>
> >> [...]
> >>
> >>>>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> >>>>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>>>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>>>> +
> >>>>> +disable_power:
> >>>>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> >>>>
> >>>> ..for this line
> >>>
> >>> Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
> >>> AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
> >>> iris_platform_data.
> >>>
> >>>>
> >>>> but this could be added to that one instead, since both clk APIs and the
> >>>> Iris wrappers around it are happy to consume a null pointer (funnily
> >>>> enough this one returns !void and is never checked)
> >>>>
> >>>> similar story for other func additions
> >>>
> >>> In fact, initially I had them merged, but then I couldn't find an
> >>> elegant way to handle AON regs. I can squash them back, if that's the
> >>> consensus. Any idea regarding AON regs?
> >>
> >> Digging in techpack/video, I found:
> >>
> >> commit c543f70aca8d40c593b8ad342d42e913a422c552
> >> Author: Priyanka Gujjula <pgujjula@codeaurora.org>
> >> Date:   Fri Feb 14 13:38:31 2020 +0530
> >>
> >>     msm: vidc: Skip AON register programming for lagoon
> >>     
> >>     AON register programming is used to set NOC to low
> >>     power mode during IRIS2 power off sequence. However
> >>     AON register memory map is not applicable and hence
> >>     skipping AON register programming for lagoon.
> >>     
> >>     Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
> >>     Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>
> >>
> >>
> >> lagoon being a downstream codename of the aforementioned sm6350
> >>
> >> Meaning yeah it's bus topology.. so I think an if-statement within
> >> a common flow would be what we want here..
> >>
> >> perhaps
> >>
> >> if (core->iris_platform_data->num_vpp_pipe == 1)
> >>
> >> just like venus and downstream do for the most part, and kick the
> >> can down the road.. In an unlikely event someone decides to implement
> >> IRIS2_1 on a brand new SoC, we can delay our worries..
> > 
> > But this function is being used for VPU3 devices too, if I'm not
> > mistaken. So it becomes a bit ugly... Also I'm not sure if this is
> > really related to a num of VPP pipes or the CVP.
> 
> Oh.. hm.. maybe we can add a .aon_shutdown op? I'm not sure how
> to proceed either

I think, if you want to merge those codepaths, I can add .no_aon flag to
platform data, unless maintainers disagree with this proposeal.

-- 
With best wishes
Dmitry

