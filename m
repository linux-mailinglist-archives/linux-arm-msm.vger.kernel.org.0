Return-Path: <linux-arm-msm+bounces-55156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE571A98D91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 16:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D19CA7A3676
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96D927FD42;
	Wed, 23 Apr 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5NytVne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94F27FD7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419580; cv=none; b=iAdeXr88gN8MNecHVf9ZezHyKAst45ly84k7G1v5r21bVVYcbLgiH9lFHZeGTHWlTRO2Q4JT7B2wQy9La4m0rfCUGC1Wqwyfqh/LCLgnpZXetzHBGQX6JR1i68D4gkFSELl1HRwI0UVLQG6DhxZssTO77gGNhB/x3oFNZBX7inM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419580; c=relaxed/simple;
	bh=+RMRgkLvTi9Ut0vis0iXwReq/JK+8jquTMA2E79W/Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Thsrqi9g2MA5IQYzdBz0SCJuMySjYGOhKCaj4DirVZsj9FXn1odIF/GX0MElsue6+bkn9FvhY5whOBdr6SWYZIvDzil5iyxOrZBY5u8llEhG1yIesUbmnVADEWemBXO8P9Eij730gwXiw9+mTZk/LhcSyOUzh+imcsUTcg8kiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5NytVne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAjKf0023089
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RMRgkLvTi9Ut0vis0iXwReq/JK+8jquTMA2E79W/Dk=; b=H5NytVne2rIO2e5M
	ImNouyy8MllnMwaFaSB71gCB/VANIDFAznuIgd6pU1wVp2Y601lVRc2jCT+E6RZo
	7MRZgG/+HrOce0Qne6WZr9E85Mamdbep1S2a3v79dQ06n1B4/43X7u/GJESQKlpX
	oFYuP+Bi9H15YrQPeMGUt8wfAyqzookeBWf12jKmx47ycY3o8m4Q47gz67yBl6kJ
	fjyh1kkcY2ej7h9kriaDV+KgX4HBxMnnF8Rs4ive/6f4HZP97F7tt5/NdI8RsGYd
	kmdJSAQIu4ZWIx0llbspNlmn6JHYFuxZfgClbT4RozZB4u2SZUntuANQtbkx3Rr1
	qM3BzQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2afuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:46:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c9e1f207so83791526d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745419574; x=1746024374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RMRgkLvTi9Ut0vis0iXwReq/JK+8jquTMA2E79W/Dk=;
        b=ta6Nh0+3jwA6emlHRl0cmqmD8NMO+ww6dOVCI/pounZ8fj/DJBwrYY5z8ZAvP80grm
         g1SgbqfiFBkaCBgCzhINaXAZyB3BOB1lOI+sKR1IOU3mN4Gx49zobOn+l23Apttl9zop
         qklYhanYpdfIG2aMIQUEI1YEqh5LxaxKui0ZG+XZQm5xonKMpQIYOf+yd+cFJYMK1YsE
         3HV9tqy1Et7PQ1kBJtDSyrE8G7ucUZgsRds9N4thu5COn3ulqw0rc82kP26qtGaykblS
         FE57VrUdPYvi72pSGQDYYMyOODLbR86nR8ndhYh9doTT0RgN8uTneD4kKSuWTnVQVNsm
         hDvw==
X-Forwarded-Encrypted: i=1; AJvYcCV09RkThckNHBtlpEM22QPSCj+89ph8Y8j4dMNA016RF/Px235RI1FghyNr3UFUo8K+XBOf579e7nAfEgUt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vkIZZigflDz4Ezq7cLFtbd969Xozz7vQZb+SU+b9eek6qR69
	rLv/2ooMiUE800nWuFIW7lIGnGuu+pr5qWsqQo7KK1GJNUPRe0l+GFZLAlIQ2F4jskNhIfna0jc
	s2kXdr8mSvCKGLJybytRdV7zyHhbpYdyKFUUj16VtOg2jqeZyU+og8lvgbQ6GYnV5txvDk4+jlF
	ZpxF3d4n+UqnR7x91w+5pX89ev+7n2bFAyJM22+tY=
X-Gm-Gg: ASbGncsNmKqi2GCkrDECmEX1epN0ENms6snaQoOxhNPX9FcJXPIWkO4JdeKDWGBqoBb
	4TRiUsoIBYikruk6/qqqfHmrJoys5o6lZWv28eaumhGu3gnx0omI7EhVIc2vGO4jf/7RLrXI=
X-Received: by 2002:a05:6214:c64:b0:6e8:89bd:2b50 with SMTP id 6a1803df08f44-6f2c44edd45mr338250386d6.7.1745419574706;
        Wed, 23 Apr 2025 07:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFLzN/OUciEZgWHj8vhMsaXJffzc3eydgDlqmd+njLLB2VM/8+PheWxeBjw9q7Ed4r5zUh1d+kgmTLu7QQWRM=
X-Received: by 2002:a05:6214:c64:b0:6e8:89bd:2b50 with SMTP id
 6a1803df08f44-6f2c44edd45mr338249926d6.7.1745419574220; Wed, 23 Apr 2025
 07:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422151314.173561-1-loic.poulain@oss.qualcomm.com> <adlotoi354bh73aolftvmi5xsj4etke3zwyhyrcmkana5vvkv7@gcjp62tk67sb>
In-Reply-To: <adlotoi354bh73aolftvmi5xsj4etke3zwyhyrcmkana5vvkv7@gcjp62tk67sb>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:46:03 +0200
X-Gm-Features: ATxdqUF1ZLhCtozS34X-UQeUJ9yjqYWuOwg6tzC2O1_LKDYYcpaqjGFeTlaYNfI
Message-ID: <CAFEp6-0_Etr0gKYffVb4S-uNrLfbBZuqso07fV+JLSkwWiVjfg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: lumag@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: RhXz7za6oJ5o2tUdLmERmYRhXPuYKZGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNCBTYWx0ZWRfX1QaN4QrAUALu Kt9NpFpX7rWsA6OsSKUBT8xPcC6qMk4OzdCDUmVP7ixVLuo52X0lwWOTRZJrVXedYqfu4O21lj1 cXkv4nzzTvyogAIObryz6YaSUf/Z3P/qHph5yDci5YscVLD8I7XqyJB/yW/9AVPrX4pZgTIxkSM
 msW6Eo3gvgw5d+CwsM42RLgrMwAwq1CVvrP+yOX51TVBBfRrFcfKuTWvYfWtByPGSybnGwhsz5R nY7wBTrqcps9/0yECati0R77sbBrVdjfr2h1aZ0EWpxzkYHpo4NTa5SM2kEfHIH3v6fKcrZized zsnpvgzmZoZ5K0rMfC+3SuOYwJPb4CBKX4wS8FMyWzDcmDK/RocR8UI0GwaA8r/cDJigDNTwByU
 +39Fs5JizVcxV4PhIEWCZTreePQ+8knto8UI7UQg955otA7mooviJgZFcc8b0sYGj8KH+1LA
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808fd38 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=S1guW8T-Gp6VMt8fAaQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: RhXz7za6oJ5o2tUdLmERmYRhXPuYKZGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230104

Hi Dmitry,

On Wed, Apr 23, 2025 at 3:15=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Apr 22, 2025 at 05:13:14PM +0200, Loic Poulain wrote:
> > To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> > be active for MMIO operations. This is typically handled during the DSI
> > PHY enabling process. However, since these PLL clocks are registered as
> > proper entities within the clock framework, they can be enabled apart
> > from the DSI PHY, leading to enabling failures (and subsequent warnings=
):
> >
> > ```
> > msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL=
 lock failed
> > ------------[ cut here ]------------
> > dsi0pllbyte already disabled
> > WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/=
0xac
> > CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> > Tainted: [W]=3DWARN
> > Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> > pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > [...]
> > ```
> >
> > This issue is particularly prevalent at boot time during the disabling =
of
> > unused clock (clk_disable_unused()) which includes enabling the parent
> > clock(s) when CLK_OPS_PARENT_ENABLE flag is set.
> >
> > This problem is often mitigated via clk_ignore_unused kernel param...
> >
> > To fix this issue properly, we take a clk reference from the clk_prepar=
e
> > callback and release it in clk_unprepare.
>
> I think this should be handled by using corresponding CCF flags rather
> than manually handling the clocks. I don't think that CCF is really
> reentrant here (and I'm surprised that you didn't hit a deadlock or a
> lockdep splat).
>
> Another option might be to use pm-runtime and/or pm_clk to manage AHB
> clock, making sure that it is enabled if the DSI PHY is used.

Yes, good point, I think that can be indeed generically fixed via
regular runtime-pm, as DSI PHY is the parent of the PLL. Will submit a
new version.

Regards,
Loic

