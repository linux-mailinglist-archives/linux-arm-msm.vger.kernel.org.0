Return-Path: <linux-arm-msm+bounces-67300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E822B17D97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0F318904A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 07:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8289019CD13;
	Fri,  1 Aug 2025 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOAJYBB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88AF1F5851
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033436; cv=none; b=FkJ3LqYioxD5ll0H9AtWnPav+hJREVULlgAyIMQ+dr2hgPOCZg4GE+2D11iBI8KgWpe2w16/AwNGVETjzpoRAS/0mZOAbALqaB63vMfHrhZhVRy4z3I94iyTbFe/YoloJz9KR+HgbfT+yOD5k/eZcrJ0Y2ZNAAoxs87ouIi2tBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033436; c=relaxed/simple;
	bh=MzX0Jh6n8Ty+/ZLPyxf1Zf4TOjPvMaYRWibYwYGwMJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfKxhzlA+kSZSqLl7YMliZ4stflkRVf08g7jwmxXwEzvEYDvlJ4s/46LGYNuWapAG7tF7Iiz7wfr3RqQLxVi+zQsuUtdYlwmbKEXc5+aodZaFTpZLMQMDFaOa6mpbT4r4XFFnPKuHV/CoUSvb01ucJpdiyFEDbzPUZU09fcok3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOAJYBB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5715DNXb009982
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 07:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DS1d6uuJTVVlh+sODDiMs3u3lzDiNe6wejq9+G3vOk4=; b=lOAJYBB9pHterVsj
	+ihKJGqKSxCW5YyPkxNvkQGi3kDcTPz7tKatNm4V5n4lwg6hygMjP+vckiVf5rv9
	s+JbVp/zW2FPXtuHa4+gQ9vWM4e38dRqZm71mlUNZPTR4rPaXmKK5gSb25ksYxLg
	WzcVqNfjdZ/mm11/cK6AhhkF1aKLUhJ3gQi3YykGj5unIQp9kgObEbGJ+LRyy4rJ
	HxbYcDBav7OQ1RGUeNeqWtPkVp4CXvVfo5YOcWszezu7+ncblgwsjdjRjVAY/j4R
	/7WvToa15rVBapfKmJoa/JH0+PJ1esxntVDuifpBnUUvApAx4zZpYU+6UsZPTqbv
	bZFFLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xrcs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:30:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e3452c060eso47253185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 00:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033432; x=1754638232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DS1d6uuJTVVlh+sODDiMs3u3lzDiNe6wejq9+G3vOk4=;
        b=kns2DA3qV+JrCStFksQh9PpFrYhMAd+BHVDJRRTtUQD753d+i/PrVkotfsAWNY/uCm
         3X3gXYtj7NjboLfDmzaXiwXVkWc0670upVvT/necEigFlOsJEPKwcy2jXFUJKTBIaWv3
         NGa7InKr1aVny8koQM6n7cT8q8PDzfCeaLvM07ogOyhb4xEwXBLtWYwtEoO6XNxHOGgg
         OUfn9cne6PbHFd6YFehOHoL1fcgb5zHqm7hG41Nu7MJU5zOaFmKfmCq2atJZ/6tIUkEK
         KBow1zi/z5YuLSU7bZxbJW8l9qddg/75l6L8qrYsZBjvldwX5iArGQ0du3BeU1mIh4Gt
         RSNA==
X-Forwarded-Encrypted: i=1; AJvYcCX2vhQOsqWnSrD1sE6vOhyv5BjAqFoJwU8KMIIqMyuKDYAcEFMZSmc+MoXJnbuYVSYjuPOW7FWc000xnX78@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qedQIQADjPUp1jTDajpe7LeIv30PCAxzFfcnTC/HKVLM9G/U
	sB1qns4swyHc6XwE+tjRe87XiI1sYh7TWUHLIFpoKK3LAQDAtG4NFgREW2R7RvTa88pOlTjnHUI
	6fkcGYFXxBYe8EBkHa50Lv+nRmUvpUpLfagyLiHXoqIRyMVE2SHJhOY5/P8IzNQ2qp/Hk
X-Gm-Gg: ASbGncuseLAIAKWZk/2OKsP9pMSmeKl99Ahpat0B2k5UFm0+rsDKAXSH33CJzl2U+W4
	dJ4a1IZ4D2H8vl385jhEvW5Wq6VZqtlFU0jIY4Md8bjz3MmWNfp1OOvNGmlfSWzXx/R3x2hzAHf
	u4tKs1FIo6PAMCJlXBpyn2NqVjJ/Y0XIec28lFBddwPEGYYFKdCv/hR2IAl22cKshNKBbDeSKVd
	+bxhs+EgA47cmQ8bl2e0bC4wwn+Tcg4W5jc8RDo6DaO57TbXSw9Wf4rhGJNj6q8VeRX3Ki7J2PC
	2PsvCtVBdmxB6v+FG0NRIDWaatzk+ppanXw6byk0+9frGmrUZzHgC2yHXh84UWNCJi1yI7O667c
	xTinXKhxmoKLhhyFskCSRBLYwL0JNcN6bKEMWeWg1BOYjWPaBSRaM
X-Received: by 2002:a05:620a:2584:b0:7e6:67c2:a95b with SMTP id af79cd13be357-7e66f3b4567mr1356785385a.51.1754033431902;
        Fri, 01 Aug 2025 00:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQuekGzv0jTOloZYm8zH/eCq5x2X1Bb4QDXyOYS+z3nUEHpAUxNETANKjB+YB8wrtb6aK+Og==
X-Received: by 2002:a05:620a:2584:b0:7e6:67c2:a95b with SMTP id af79cd13be357-7e66f3b4567mr1356780185a.51.1754033431109;
        Fri, 01 Aug 2025 00:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88caf6dcsm491610e87.159.2025.08.01.00.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 00:30:30 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:30:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
        quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
Message-ID: <x4ozwgcti2vrgorgow6nttcjmduk5e4kkd3pjj6xfsgihk6u4n@klfpypor6ya6>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
 <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
 <w3rwao5wbmstdyics6qhp7beulbbp5ludqkwpfsmevgqmzz3d6@u2e533zlitkr>
 <e5a3f05f-9775-4e3d-ae7d-ebbca14b4df5@oss.qualcomm.com>
 <ffdvzupefzhqq7fqtloycc3xzu57i55ths73xcjftor2cifuzr@5vhq2hfmkvda>
 <bd8f8643-a8c8-43d7-b293-acdba5ff798a@oss.qualcomm.com>
 <ad4f53eb-2f4b-4e62-a162-461de431e3de@oss.qualcomm.com>
 <2de51bf2-baed-4bf9-a40c-1681b2efcf79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2de51bf2-baed-4bf9-a40c-1681b2efcf79@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688c6d19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=Oh2cFVv5AAAA:8 a=OU9VWU6s7H6VDRzcY4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: dpuBaWl0P3lAQ0leaYg40AFcgHCzR25p
X-Proofpoint-GUID: dpuBaWl0P3lAQ0leaYg40AFcgHCzR25p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA0OSBTYWx0ZWRfXyCPBCnLQcqL1
 UWjLAvxN/Wv8yaKKeMcJD2I+VUWlFKx5WsZa/FU0FqEu4E7LbyOLvsdyxtECerdOqHPabturLnF
 Yw3jcDDry3o7hkXVBb9yLyDPPZKFLe/aO1oXNBK1ineYF0b0ihla5yejlYu4PMuGN/ssZAoCnUK
 AbAPCGBufW0V+IM0k+J0iyRCvvedHv0wNgo5U5igAyQcXCmMwdd5zOyJxU3kXAX1z2ps0s92eY9
 BDLMakl4kgS9xZvVXKDjvHE79oLLprfxg39ZEdCkYw1uOnwqbU9psiNVAt/rQfH/To+ce8gv7CF
 RFFRmYfEdaSYbvu6qjvI2JPhQcIv3WmQg4lTKjkS3ewDhHzV3SLZ5VxtSnuE0D6ZnQJEcBzo933
 +Y5Iuz/v3JlvvAAWgJMtnuFFX23NgJ/UmT7o0LfL3opSpt/91B0Cy26GN32Jei+3FAPaD4XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010049

On Fri, Aug 01, 2025 at 11:57:50AM +0800, Xiangxu Yin wrote:
> 
> On 8/1/2025 1:13 AM, Dmitry Baryshkov wrote:
> > On 31/07/2025 08:06, Xiangxu Yin wrote:
> >>
> >> On 7/31/2025 2:35 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Jul 30, 2025 at 04:53:16PM +0800, Xiangxu Yin wrote:
> >>>> On 7/22/2025 8:41 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
> >>>>>> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
> >>>>>>>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
> >>>>>>>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
> >>>>>>>> designed to operate independently from the USB3 PHY.
> >>>>>>>>
> >>>>>>>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
> >>>>>>>> standalone and does not support USB/DP multiplexing. The binding
> >>>>>>>> describes the required clocks, resets, TCSR configuration, and clock/PHY
> >>>>>>>> cells for proper integration.
> >>>>>>> Simply put: no, this is not correct. Even if you go to the SM6150 block
> >>>>>>> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
> >>>>>>>
> >>>>>>> I thought that we have discussed it beforehand.
> >>>>>>>
> >>>>>>> I can quote my comment from the previous thread:
> >>>>>>>
> >>>>>>>>> No. It means replacing extending existing entries with bigger reg and
> >>>>>>>>> #phy-cells = <1>. The driver must keep working with old node definitions
> >>>>>>>>> as is to ensure backwards compatibility. New nodes should make it
> >>>>>>>>> register two PHYs (USB3 and DP). On the driver side modify generic code
> >>>>>>>>> paths, all platforms supported by the driver should be able to support
> >>>>>>>>> USB3+DP combination.
> >>>>>>> Looking at the hardware memory maps:
> >>>>>>>
> >>>>>>> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> >>>>>>> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> >>>>>>> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> >>>>>>> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> >>>>>>>
> >>>>>>> Now:
> >>>>>>> SM6150: USB3 PHY regs at 0x88e6000
> >>>>>>>          USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
> >>>>>>>
> >>>>>>> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
> >>>>>>> can comment on it.
> >>>>>>>
> >>>>>>> But based on that list, the only special case that we need to handle is
> >>>>>>> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
> >>>>>>> it will be handled anyway by the code that implements support for the
> >>>>>>> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
> >>>>>>>
> >>>>>>> Having all of that in mind, please, for v3 patchset implement USB+DP
> >>>>>>> support in the phy-qcom-qmp-usbc driver and add the following logic
> >>>>>>> that also was requested in v1 review:
> >>>>>>>
> >>>>>>>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
> >>>>>>>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
> >>>>>>>>> powering on USB should fail.
> >>>>>>> I think our understanding might not be fully aligned.
> >>>>> I did not write this. Please fix your mailer to quote messages properly.
> >>>>> As you are using Thunderbird, I'm not sure where the issue comes from.
> >>>>>
> >>>>> Also please fix it to wrap your responses somwhere logically.
> >>>>>
> >>>>>>> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs.
> >>>>>>> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
> >>>>>>>
> >>>>>>> 1. About the TCSR DP_PHYMODE Registers
> >>>>>>>
> >>>>>>> MSM8998/SDM660:
> >>>>>>>     Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
> >>>>>>> QCM2290/SM6115:
> >>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x3CB248
> >>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
> >>>>>>> SM6150:
> >>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
> >>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
> >>>>> SM6150 has two different sets of output pins, so the first register
> >>>>> covers first set of SS lanes (which are routed to the documented SS
> >>>>> PHY), the second register covers the second set of SS lanes (which are
> >>>>> routed to the DP and secondary USB PHY).
> >>>>>
> >>>>> I can only assume that the same configuration was supposed to be
> >>>>> applicable to QCM2290 / SM6115, but was later removed / disabled, while
> >>>>> the registers were kept in the TCSR block.
> >>>>>
> >>>>>>> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
> >>>>>>>
> >>>>>>> Additionally, I found some interesting register documentation for QCM2290/SM6115:
> >>>>>>>     TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
> >>>>>>>     TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
> >>>>>>> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
> >>>>> Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
> >>>>> If you check the memory map, you will find the second VLS CLAMP register
> >>>>> for the second USB PHY.
> >>>>>
> >>>>>>> 2. SM6150 Test Results
> >>>>>>> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
> >>>>>>> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
> >>>>>>> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
> >>>>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
> >>>>> Here it still programs the TCSR register.
> >>>>>
> >>>>>>> Based on these info, I believe these are separate PHYs, and only the
> >>>>>>> TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
> >>>>>>> mutually exclusive. This is why I have maintained separate private
> >>>>>>> data for each PHY and implemented Power on mutex control via TCSR,
> >>>>>>> rather than using a qmp_combo-like structure.
> >>>>> Still, no. Check the block diagram of SM6150.
> >>>>>
> >>>>>>> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
> >>>>> Yes.
> >>>> I checked the related PHY series and block diagrams again.
> >>>>
> >>>> PRI and SEC go to different nodes based on the SoC design, and there are two types of configurations: USB3-only and USB3+DP pairing.
> >>>>
> >>>> Before proceed the v3 patchset, I’d like to double-confirm whether the following structure is what you expect:
> >>>>
> >>>> usb_qmpphy_1: phy@88e6000 {
> >>>>      compatible = "qcom,sm6150-qmp-usb3-prim-phy"; <== rename to PRIM
> >>> No, we already have a compatible name and DT schema for this device.
> >> Then current compatible name is "qcom,qcs615-qmp-usb3-phy" and shall we need update to "qcom,sm6150-qmp-usb3-phy"?
> >
> > Why? You _already_ have a compatible string. You don't need to change it just to follow the SoC name. 
> >
> Ok, but just to confirm — in this case, the USB3-DP PHY would use "qcom,sm6150-qmp-usb3-dp-phy" while the USB3-only PHY still uses "qcom,qcs615-qmp-usb3-phy"?
> 
> Since both PHYs are on the same SoC, would it make sense to keep the naming consistent and use "qcom,qcs615-..." for both? 

Either way is fine with me.

> 

-- 
With best wishes
Dmitry

