Return-Path: <linux-arm-msm+bounces-77252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0055ABDB216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 21:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 974D24E01D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 19:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077953002BD;
	Tue, 14 Oct 2025 19:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnIzFCOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619DE2FFF88
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760471536; cv=none; b=Xgqf9O+OQajetgtdNy2jkjwA9Fz3ovlVvJNmU7BmMfTqw3B/P3n06MwFmAwHYQqgrqQiALi9BkvnMIw+KiBkEeBY8Duk4wrsGaJAwJoX5WIuHOO/aPSqn8FgwL1SZNfTQ7+jSLXkqTMoFKY6CPW+DMEQ8T9mrsmZ3/hM6qACaRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760471536; c=relaxed/simple;
	bh=MldrdjjVbk2vSLcfcDGESxPH9MtFHvBHW7Thz6YJ8nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpLIELubFtI89bv5c+78xHGT2ir/vvuhRTu+bgnLs7IzpTn4U3vap3kk4r6sw8/cO79fkxzrknpxFhIORNfR6XPMGq3WTTO4XBzubNx7PjummIDeyGTCn6zyO/Syug4DgucP4UpUE9VZkVrpB5i9gd9FW6bLQTSjSiODyemhR5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnIzFCOZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFIYia008814
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FE8ab9b1Aojs54zfzqipUaznRoSyN2GE+suwbEktyuc=; b=CnIzFCOZZxGC+d1K
	epihuDKB4rboKQN/WAI7C5dt1d+VWxWXmqWzWcBUZH2Ki0/iwXJ3Gp9ckbrC3Q96
	eh5jPNHyrptQlE4U8kp3KwcLuzQQbD2y/PT9+uP+PmkkYKxtFiPxNk314UAXZnng
	1iFV+cSBInt2OOg3Hi6WdYFp5UKBSBY9Gxx0kDcI9mIFtizDxI+rpySyodzxndSX
	JrbXQb1+uaCVSITumwUDcNOkSeUL4GiHV8qKBuV+nfijXClbNMmUD9rJjNxQi9iO
	oqd75UxN98YgtoqIRtdhpL0wCwfz3aBgox8/jwdukfGfQbsnb6iWBIB1ZSc00sAm
	sFng8A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt6nxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:52:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78f6250f0cdso254040206d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760471533; x=1761076333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FE8ab9b1Aojs54zfzqipUaznRoSyN2GE+suwbEktyuc=;
        b=VCndaSszmSfvI9QksHyIklsgrXJSVFJFM+l8KnQXG+Q+oP5kPk8qjAeB3GFu8o5fJd
         E/9QpUuRJpcklxo4OG583ESB1zJM7vxjPckCnk7UTgLzWapBZy9BPVEK0bGHH/RE1SBu
         2ynyZ7UEchx0e2MRLaBCj5sNqRVRrruxfqokWFPe6aZG1ZvTXh9XG8KyuercJ/xbMxAy
         45LD/fWcxfpsEfYNbcNCNc9p1tQqk6eAGTdoW9OBwj80X7qYSzoWAGEgdNs655E62fEJ
         nIoqTxvQTdOCXWmEkNyKAgIvYp3EKduT3/usY8l3/53VROk05I/9XhyCqXI+TL+GcrNX
         2pAg==
X-Forwarded-Encrypted: i=1; AJvYcCVaOkbfVsL9uKA4w4yAD5g9VX+HcBwrmagtHBie3SjDwvENr3nZfxQJ4PddYEkOdwiI4SXvw1xCe4WlFRkR@vger.kernel.org
X-Gm-Message-State: AOJu0YzYkZucyfkMs07ODxKsbILxrWH/5T1T0I6SbMQeT8OjKv138dVx
	Esb5128NzAdkUSmkYabDOFSV74+cdaDkaRnjPUevXlTJJSTXOUBbZY20Am95r/gOapI7IdU+jAM
	tx6hDmo+7Q31meKAtIduAS/nxtEVBVpr7wRty13k5bEfgHEfwZgxEbt+/NXipwyl85rYc
X-Gm-Gg: ASbGncvJrXL3lkL3/ZjA9TpkagLcHBD+ZlYiqTogrXQMSAmNPyJLGCgv/j+Zwk/ugFf
	pXywWWVKwgkyVkVRJC2N6oi0Ap1LS28xmumuRnRt+gEMh8PWadbvqd9hOoX3SSCmE5jEzbIhRMr
	zAgfqgvaD4o0uIUEvgVULA+PTE/ql9oxuml6HnNqlmJOWi/w3QRn9EmWaAk7l98Ki+BfLnUvQH7
	Mc1N9jnE7H4XvIbLjYJBtkONzyfFbK8o4B+b8MpblqFbOaifL2gJmNIJkgz3XKGZK0Igy2va3y2
	uCD4lz6wNjEtjnSZwL0PbSGTR0+0ufqvspTzTAiYk8BE2Zb3N+TFhuUud9fkUxgpEDGqEbnp1Nl
	SHMUJiuH+KZ6JQXo1qYGFxphiK8NMF6MgVIaeMhEpuJXJYCEUxRIh
X-Received: by 2002:a05:622a:1109:b0:4e7:3a18:c50c with SMTP id d75a77b69052e-4e73a18c6a7mr38823611cf.29.1760471533233;
        Tue, 14 Oct 2025 12:52:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/b54gij/Z9LNqxtZyviJcaCwCE73o4iaf3lQkWjY+f7mz3xk3dVSt5hsvqmSCN+n4FLev9A==
X-Received: by 2002:a05:622a:1109:b0:4e7:3a18:c50c with SMTP id d75a77b69052e-4e73a18c6a7mr38823371cf.29.1760471532781;
        Tue, 14 Oct 2025 12:52:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590971ea4easm4401509e87.53.2025.10.14.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:52:12 -0700 (PDT)
Date: Tue, 14 Oct 2025 22:52:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
Message-ID: <cgfxsjr53dz5i3pjinljywah4b2jgeomnglranaty6cazek5wb@gyjpt4auwchd>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
 <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
 <8f81289d-7672-42e6-b841-6514607cdb38@oss.qualcomm.com>
 <20251013110407.dqpjdrdaw4gzpcy4@hu-kamalw-hyd.qualcomm.com>
 <49004d3e-7914-48ee-8705-ee86d1944166@oss.qualcomm.com>
 <20251014123658.sobt6ab6gnbafyme@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014123658.sobt6ab6gnbafyme@hu-kamalw-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: 04Y8Wk-npdgPyPWBIo650eWweNuof8iR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXxjn98fXnAwE8
 N+l/PrTkJnajGmIQXauPAEssIH7EO1OyT9rNa6WXqJoB5qaOc+W7sx1BZyIzvgUzDQAQDWtZyJF
 ZDx6xevq2S91gvbNpLRGRoPrOp9s9t3adfmy//P1/S0RAEwz67khnVGDHp6DrXs47PMeyDsprVO
 DrTTceGqq7K1706yOIoitaQyDP2CnUS7kAxMRlRS3XhDW6QpwrE7hAziyckbTsFtMqyAtb4bpfI
 ZBDxnOlahGSgzgB4n5LWZ1PG3NJuXwT8cZQcvKFIXgOItMCZ9JlNAsb1Bu3CZqjgoebXR/elrtq
 boNn3ez0TFSME/waRItys2U90Rp7oap2eGIJ+7k/PU0AMfeFMYptgQ4cK19aOYyKKyguhJRtrLB
 Do8i08UhHW32yvq/LK2ZsFILnmn6og==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68eea9ee cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=dw0t6H4-AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CsomoNAreF6FlIaDNSYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=wVJa4CU9-Z26yuRAZDil:22
X-Proofpoint-GUID: 04Y8Wk-npdgPyPWBIo650eWweNuof8iR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On Tue, Oct 14, 2025 at 06:06:58PM +0530, Kamal Wadhwa wrote:
> Hi Konrad, 
> 
> On Tue, Oct 14, 2025 at 12:23:23PM +0200, Konrad Dybcio wrote:
> > On 10/13/25 1:04 PM, Kamal Wadhwa wrote:
> > > On Mon, Oct 06, 2025 at 04:28:59PM +0200, Konrad Dybcio wrote:
> > >> On 10/1/25 2:23 PM, Kamal Wadhwa wrote:
> > >>> Hi Krzysztof,
> > >>>
> > >>> On Thu, Sep 25, 2025 at 1:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>>>
> > >>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> > >>>> <pankaj.patil@oss.qualcomm.com> wrote:
> > >>>>>
> > >>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > >>>>>
> > >>>>> On Glymur boards, the RTC alarm interrupts are routed to SOCCP
> > >>>>> subsystems and are not available to APPS. This can cause the
> > >>>>> RTC probe failure as the RTC IRQ registration will fail in
> > >>>>> probe.
> > >>>>>
> > >>>>> Fix this issue by adding `no-alarm` property in the RTC DT
> > >>>>> node. This will skip the RTC alarm irq registration and
> > >>>>> the RTC probe will return success.
> > >>>>
> > >>>>
> > >>>> This is ridiculous. You just added glymur CRD and you claim now that
> > >>>> it's broken and you need to fix it. So just fix that commit!
> > >>>
> > >>> I'm afraid, but this is an actual limitation we have for Glymur
> > >>> (compared to Kaanapali).
> > >>> The RTC is part of the pmk8850.dtsi that is common between Kaanapali and
> > >>> Glymur. On Glymur (unlike Kaanapali) the APPS processor does *not* have the RTC
> > >>> IRQ permission for the RTC peripheral.
> > >>
> > >> This is interesting.. is that a physical limitation, or some sort of
> > >> a software security policy?
> > > 
> > > This is mostly a limitation for all compute targets(like Glymur). On compute
> > > targets we need to support ACPI TAD feature[1] this feature uses the RTC alarm.
> > > In a nutshell, this feature implements 2 times - AC ( adaptor power) and
> > > DC (battery power) timers, and based on active power source(AC or DC?) at the
> > > time of timer expiry device will either go for a full bootup or stay in power
> > > down.
> > > 
> > > This feature is implemented on a different subsystem (SoCCP subsystem), and
> > > since the SPMI `IRQ` permissions can only be assigned to only one subsystem,
> > > so we can't use the alarms on APPS. This is why we use no-alarms DT to register
> > > RTC device without alarm-irq support.
> > > 
> > > [1] TAD specification - https://uefi.org/sites/default/files/resources/ACPI_5.pdf
> > > section 9.18
> > 
> > Hm, is there maybe some sort of an interface to talk to the SoCCP
> > and set the RTC as we wish, from the OS?
> 
> Yes, the developement is almost done and we have done some testing as well, but
> that kernel driver needs some more cleanup and testing before posting to
> upstream. This will be added in future.

If the series is reposted, please add a comment, pointing out that this
is a temporal measure and should be removed later.

-- 
With best wishes
Dmitry

