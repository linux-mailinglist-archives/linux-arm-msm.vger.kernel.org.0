Return-Path: <linux-arm-msm+bounces-77193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD7BD9602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E42B23544EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29C6313547;
	Tue, 14 Oct 2025 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ekj1lzXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E31B30C371
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445428; cv=none; b=GwCVpQC3hTYllEMfuyUsaEeRvrUAVCod6bk6V0Y+Wt9AC8ubx99tpzcpO2kauq7k8ozjR3Vsw2nFhHpAsvIn9eiFX3PLtJZ0y9n8Jx2JPiqMvUQQHSAB95DKJ1eRz/RjWkgzlv7PUg/m4+nkrewA014sG9QVFGjEAzUFUzuwlcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445428; c=relaxed/simple;
	bh=2i/9DWpcFPS1pMn2FEUvaWf0SzvJmHWgtMuwoZMXL64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLCho9bfH0Xncj4af4jQbGGu+P+bvS6NAialhgnv74tgwdQji2YGFVMg6TTibQ38zT38Hz8BmfgyXRe+io0SwlI+ZQBoh8XvRj/VqVw8rq5FXbABwsm/qmstGtosvEGP8IK96LAYxPf6gfWvZEOwm/KjZDAz+Tr/RsWSXsAvO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ekj1lzXf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87OGB018280
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIxMrSYPKSOc36A7DVe+LtuzT/Ctad9aI8MUfRjtCvg=; b=Ekj1lzXfFgBk4YVL
	lNfuRCuaQineXFoBYsyaDZd03eozU/9Xll4e2xiRe7Kh/NlOljIPCunGd6x0FFRQ
	Rh1RfKTJK+Zlyr8/tKrwJnevetPTvne9nlnMcrrTyQ6OdKkoUmgSeDhODRtMpC+b
	KkkMvHxI/6+iOCeGP8B741fOsjknu0hW8INSEJkY1XMR2HLb/xLslKBl07ZdmBX8
	3r64MtqhvBTjhLYDgdq2YiUkXz/p07w43my18rjQfyrf+av/oywRxNkueYKzim04
	Mep5FNuTS0ziqYY2pASlLHtHMUGDQwH1BTNIZfW0g9Djrguz2s2fugCWLgGrt0na
	79uJdg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1act2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:37:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b632471eda1so9242779a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445426; x=1761050226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIxMrSYPKSOc36A7DVe+LtuzT/Ctad9aI8MUfRjtCvg=;
        b=IYTSN9K0Yqwp3TZYn/5WhquPBY/LdNvhBwSVkMB6pq6q96nqqg4y446ONPcchfaby0
         XjC7Ek/3iiS+eErLoNsrO2brtSPi53MP0DqzNuFlwxminU7kGV1+o/yeDn50jgcNhhl6
         BUr79rI5U0L69gbfS7S1p3uF/8SW+6/gXlSMWt2wDSJtr3DHmlbeTXKR4fwu8qKMLmS4
         eYE8avdqQ2KUCiOu1Iy/mXnqSGwptHdGU3A5lKnTCc4niuO4oQIGPWm+kibevrutJZ48
         0cTTChr1wJ/hiXcJaMzatOLjV8E7y03/tzJP8110LpzpFjuB0yzNFycnn3Gm6HVYpPVj
         P9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Q++Ap8JjpDk80yndtPBniu9z6QpvsnoZYweNOVL7Wk09VnvWZM9IoqaRbcQAbu5CDuhjrkhUiziZD+m9@vger.kernel.org
X-Gm-Message-State: AOJu0YwaWzqMnwbaOh0ihcDQTaKLdKysMOcqvCEpfgAop/LEMvY23e5t
	v8dsXBp8V82mKsIe419DhaXmjWbhBYPzUMscysYYMgjM9Od1XKV8i++QeE0yAQp15c23uOESLf9
	3ag1tScQme3WKj85ipOcZXmqNQFnuFMzvzSSZyW3951sofJ24CL63BE4/j+d8E6JlH/Bw
X-Gm-Gg: ASbGnctuWBCf4XEBMwF0EbiDSAC5LZ+oqejGLFtZKJOUyps/mqACVFhfqvL9WXCIQo6
	+8Ifs9MmU2gCuUsg3/IdwfpbCU49gLqvVKSZRXTFw0Iosd+J68HQ3zd0KUv3mbBmQSzbUtqN01o
	364MffCiZuf1Cvjn3zDisa+lCeXd7rTW5hVBOTJonvK2JTjlMD32QeII46L6wQlh3p7nJGU7Hw0
	NTW9ry+1CaJj7oL4kt6Ezw4fNRlf6/ZVMepH2rq26oiN/LLSQ1BDaaIHYnmnfgAuxKngxdJz7Rc
	rwFaWL0YVol2hMH0M1efD2GqewOPks0611to9IGFIzssQUwOjOvwEoCu6z8mPaZvy+CjHbHXwvy
	vE1uFDllZYDeQJKh6NvP4ygDDYw==
X-Received: by 2002:a05:6a20:9183:b0:32b:83af:11ff with SMTP id adf61e73a8af0-32da8139347mr32608554637.2.1760445425699;
        Tue, 14 Oct 2025 05:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj9gLDhN3zLw56SIwWQu9Ntr/nll9EvL8/XTaZlSlmUqmVQq4OR90HEiYkP4sd+g4UWAci6w==
X-Received: by 2002:a05:6a20:9183:b0:32b:83af:11ff with SMTP id adf61e73a8af0-32da8139347mr32608529637.2.1760445425209;
        Tue, 14 Oct 2025 05:37:05 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bc12a8asm14946105b3a.34.2025.10.14.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:37:04 -0700 (PDT)
Date: Tue, 14 Oct 2025 18:06:58 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/24] arm64: dts: qcom: glymur-crd: Avoid RTC probe
 failure
Message-ID: <20251014123658.sobt6ab6gnbafyme@hu-kamalw-hyd.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-17-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdi0+c_FqinVA0gzoyqG6FVFp0jq5WSLsWWKiT12VVs3Q@mail.gmail.com>
 <CADhhZXaB310hVo_w8_CoJLQ3j9dy1eeTwbmk0q=vUV2ga1PAYA@mail.gmail.com>
 <8f81289d-7672-42e6-b841-6514607cdb38@oss.qualcomm.com>
 <20251013110407.dqpjdrdaw4gzpcy4@hu-kamalw-hyd.qualcomm.com>
 <49004d3e-7914-48ee-8705-ee86d1944166@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49004d3e-7914-48ee-8705-ee86d1944166@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee43f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dw0t6H4-AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gWmXDqEIHeUc13t17I8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=wVJa4CU9-Z26yuRAZDil:22
X-Proofpoint-GUID: FkbhAIN-fEMN1A_NF27L_uUQK4WHYVfb
X-Proofpoint-ORIG-GUID: FkbhAIN-fEMN1A_NF27L_uUQK4WHYVfb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXwLwqkOvLx8iu
 bTZBQc0INdZbXiIOM+G0DbUWFqh1Dg0OA6iH+ZOixQDDfhY3vJnGwzMVh0IOD4a04oqaR6mlL3N
 DS9Jc2N60SdxThhUzTQiy5EJf59He8dSKfM6gDPHSRaCK7MoQx7ss8yyt/rHn0VZvr1CQD+KM/v
 ss3V7ItoxF4dx47KQSfxZFqVD1fFmly09PvpTK53FhEkRk+1vHVDGxIQGYRPA3ecDIAAG3pO3jC
 K4yJjZsNvQUcxJTap/VyacDFoQtvHbQQXsoa4IsW+nEiezBVUv31c2j9dna4P/JFK5bC13Rg3gd
 hIXx8ATY0bcobj+i1GxBwZs5I80KSvIAUgYNX0CbuestL0WuELdr38NlPfK+xM9qlvuk5ILXxU8
 jMN633Vrtuxk+4nGkYlDxs5czr/z0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Hi Konrad, 

On Tue, Oct 14, 2025 at 12:23:23PM +0200, Konrad Dybcio wrote:
> On 10/13/25 1:04 PM, Kamal Wadhwa wrote:
> > On Mon, Oct 06, 2025 at 04:28:59PM +0200, Konrad Dybcio wrote:
> >> On 10/1/25 2:23 PM, Kamal Wadhwa wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Thu, Sep 25, 2025 at 1:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>>
> >>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
> >>>> <pankaj.patil@oss.qualcomm.com> wrote:
> >>>>>
> >>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >>>>>
> >>>>> On Glymur boards, the RTC alarm interrupts are routed to SOCCP
> >>>>> subsystems and are not available to APPS. This can cause the
> >>>>> RTC probe failure as the RTC IRQ registration will fail in
> >>>>> probe.
> >>>>>
> >>>>> Fix this issue by adding `no-alarm` property in the RTC DT
> >>>>> node. This will skip the RTC alarm irq registration and
> >>>>> the RTC probe will return success.
> >>>>
> >>>>
> >>>> This is ridiculous. You just added glymur CRD and you claim now that
> >>>> it's broken and you need to fix it. So just fix that commit!
> >>>
> >>> I'm afraid, but this is an actual limitation we have for Glymur
> >>> (compared to Kaanapali).
> >>> The RTC is part of the pmk8850.dtsi that is common between Kaanapali and
> >>> Glymur. On Glymur (unlike Kaanapali) the APPS processor does *not* have the RTC
> >>> IRQ permission for the RTC peripheral.
> >>
> >> This is interesting.. is that a physical limitation, or some sort of
> >> a software security policy?
> > 
> > This is mostly a limitation for all compute targets(like Glymur). On compute
> > targets we need to support ACPI TAD feature[1] this feature uses the RTC alarm.
> > In a nutshell, this feature implements 2 times - AC ( adaptor power) and
> > DC (battery power) timers, and based on active power source(AC or DC?) at the
> > time of timer expiry device will either go for a full bootup or stay in power
> > down.
> > 
> > This feature is implemented on a different subsystem (SoCCP subsystem), and
> > since the SPMI `IRQ` permissions can only be assigned to only one subsystem,
> > so we can't use the alarms on APPS. This is why we use no-alarms DT to register
> > RTC device without alarm-irq support.
> > 
> > [1] TAD specification - https://uefi.org/sites/default/files/resources/ACPI_5.pdf
> > section 9.18
> 
> Hm, is there maybe some sort of an interface to talk to the SoCCP
> and set the RTC as we wish, from the OS?

Yes, the developement is almost done and we have done some testing as well, but
that kernel driver needs some more cleanup and testing before posting to
upstream. This will be added in future.

> 
> Konrad

Regards,
Kamal

