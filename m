Return-Path: <linux-arm-msm+bounces-77469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D24BE08D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B7A54E377A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B4C2FE57F;
	Wed, 15 Oct 2025 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVZYanpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F31D90DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760558045; cv=none; b=ZLesp0LGoTn8Jq87Kv7MV4SYKp8lXeYy9wIvQRhk/3/UUobnhFGArADzdXXyLdSnwqpgSIjjuvoiBIAmtWfjVMIKQOuYsnFQLCAbtLhMVgvo6PR2mKyKYcnDiqcFl13mjhjwZNXXr8NEoczRKCwcQUGPDgdcud1dONPJBxp0Ahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760558045; c=relaxed/simple;
	bh=E1mSK4DtRW376aeS4DLRibG/tHG9H4wmvFypBSpxzc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usOkft28IxvOuXjYq8DFYhO+Lcfmhnp9k8zw4tdXtwJcjuQCmmV1I9AEEuk0XAuaI8BKYdzqz+eyCAqmDrnqJ2MhQePS2Z8Dvmemp1qDBwWA+IqIMRpmTDax1PFTltswhQlfZbgPwxd43OSHhvRAhK3yWccKhg1C6nMd2JIUwTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVZYanpF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIFqKh024868
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TX48lldHpN6bC+BPsWUhDcw+
	OVmNzRgnU/ggfqvvlng=; b=nVZYanpFHB5dOiVP1dsdCSjjhIlOC0kEUr97Jx7C
	/WcKvaPOf64FyR0e6cP8bPTq1KSwNxBz4wmI1HxXL2duvnxsfxidpqJVz+jGV/eK
	3JJ8t6FoQTH0tMiWbC9ScHo5ZXqW4OEFhnWvdtL7SFEIOrSfjC3cIq0n5SwV+BD4
	adUsCGmBZjzb77LGrYxE73acB/LG3SP3RA2g6W8JjBzcFG66db4Q2XwU/aI3gCpS
	3EyAeacqhnXb/o5E2Q62vpAE1+HW4jOvqb8BDrp+0tGxqo8bALR/3GwLPA0Ck46i
	mqCKL80mjxSjdxLIm44c36eDcRKsw1cNwscz93G1u8THyw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0wqja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:54:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26985173d8eso214408815ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558041; x=1761162841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TX48lldHpN6bC+BPsWUhDcw+OVmNzRgnU/ggfqvvlng=;
        b=fEqTC+CNcY9x5/HHBSVdJ2YeYOXfQy/skdVGgNs9Yimsu8S2Ba9fCjQe7TLo62iwfM
         bGdp1gaYuue9A+C8eLBlqhAopXUoO9aX/fqmSrqr9UwJvii/sF+/t0L41fzSvpUZbxRk
         Ak548P3VZ2rMhI0o7ACeLxa8E7MXE9HXtU8oN5qI5KjhJDjiRN6Wspd9tXCCirRmYRan
         pkWFjOHXUQ0A2g6qg9DncYOs4UbvC1dXXzXe8ELSnoGxw2scetJdHA7ftL5iJKarxsJP
         1QDrmb3fbqKvLPKkqnLLdHECGBoOT5YPjcdz/uBzzs98rVqc+bKaLdkuNg1j0z4lQ2jk
         qmXA==
X-Forwarded-Encrypted: i=1; AJvYcCUq7xiXM+20oFdfm0B5ztMBvVq5iG1t8oPcBsjQq6KExXbEPsXtBobDMwbTXmt5uaUBhe3XFqs+yh/Ot+oo@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2qJeIa53GVtoNW6WyxQiNbGcwUbcQ9iBvWxBFeAE95HLN1aI
	kB8qZi7GcLmdW2QO46M80C8lxJk3jx1F5sP695eL276dsDt1SR1HHYfuC6ZVhxhlZxIh6Pq829o
	hk6dFtWtjRlW9LatweCM6EERWv4vZDbMVU4bpuTyaJj4+/O+jke/NCUOHyIDYeh0yXde6qrZP0D
	28ot9p1kpG29cbJArCvqUbOrxdH3VH/wEhu6Ceb4nfLdQ=
X-Gm-Gg: ASbGncshqm7C84kM2hYBEKPbSFtZkU9++596cjNnwanmPUrr8ZAhlYPYJu8oRYGw8Ev
	WZP+PU3kNRQ6w9KD+whOsdF+tOxturg1acbctSP5F0+VeQfeWi+tSGza0GO8rAmOZOfRhD+EDNd
	Rz2/XSncHcThKQM4/SUgVH3R8d+plDNiEgFSeZxMMZ9Pi1OSStPbb+H/nKai9ZA9t9xWnGEbgbB
	hQ5yerLvjart3w=
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr422269145ad.18.1760558040722;
        Wed, 15 Oct 2025 12:54:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5z2DxBR/Z5Mpt5OTV9XjMmY6/lFsbRWdHvRg5cMZlYIBEwXcQoXzMYM+A2htVGGIaWs3BTv95RvDnImPGt6A=
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id
 d9443c01a7336-2902723d3e5mr422268855ad.18.1760558040268; Wed, 15 Oct 2025
 12:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com> <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
 <bngdsqmcxtlolmwr4it3wy7rldikzffgwwuyj443dc3v3ilaju@eiveujsf4up4> <6b6a6cd1-faf7-4ef5-ab24-171a59c99085@oss.qualcomm.com>
In-Reply-To: <6b6a6cd1-faf7-4ef5-ab24-171a59c99085@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 22:53:49 +0300
X-Gm-Features: AS18NWAmm9hGxMXkOPorFbS6ZmuVvAN5j6Z8_fAoHeMhwo7GGfmhMgwew6Gfwwo
Message-ID: <CAO9ioeVdFU_+yt1KuF87c9S7Tt9Q8goZGnrGaz7NohKRPjp3NA@mail.gmail.com>
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8fImhU7X8R6+
 +VrcjDCp60wTt4dWP9+Kh/HsMagXZ2F8NXcrq9fSzrU7yG0w8WDh7OTpRTnTnodtBVdm+qMoJwE
 3lER5Ea3uOdFhETH3x1dSLc76gzN/6/AgbsM5nwrQxkPnUuoo3dh6lgxEY/g70hb6hkHMh0P+Cy
 VAChIgW6V3rKn5/AEMicZ4366/VzTdiekhjM56XUw3XWAbkNnTAuUhBl2YregN1LHLrvcwxwzfz
 FccK7DsTfSm0EPFhMnMJdLg73t76xoqvBXRhfC949eVWkXPPB2c/ZWSix68p5pt44SoBbH/3kLp
 9pPYUGLvJ9MCtXva44cdxCAP21kJ6JgO5DSfwNXEw==
X-Proofpoint-GUID: W2kqJJGzBuBWoVEQWampTwUX2r8x1Wcn
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68effbd9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eaa-GZcDK8UfARH1VbwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: W2kqJJGzBuBWoVEQWampTwUX2r8x1Wcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Wed, 15 Oct 2025 at 17:12, Jyothi Kumar Seerapu
<jyothi.seerapu@oss.qualcomm.com> wrote:
>
>
>
> On 10/15/2025 7:03 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 15, 2025 at 03:58:31PM +0530, Jyothi Kumar Seerapu wrote:
> >>
> >>
> >> On 9/25/2025 3:48 PM, Konrad Dybcio wrote:
> >>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
> >>>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >>>>
> >>>> Add device tree support for QUPv3 serial engine protocols on Glymur.
> >>>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
> >>>> support of GPI DMA engines.
> >>>>
> >>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>> +          gpi_dma2: dma-controller@800000 {
> >>>> +                  compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
> >>>> +                  reg = <0 0x00800000 0 0x60000>;
> >>>> +                  interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +                               <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +                  dma-channels = <16>;
> >>>> +                  dma-channel-mask = <0x3f>;
> >>>> +                  #dma-cells = <3>;
> >>>> +                  iommus = <&apps_smmu 0xd76 0x0>;
> >>>> +                  status = "ok";
> >>>
> >>> this is implied by default, drop
> >>
> >> Hi Konard,
> >>
> >> Do you mean we should remove the status property for all QUPs and GPI_DMAs
> >> from the common device tree (SOC) and enable them only in the board-specific
> >> device tree files?
> >
> > Could you please check how it is done for all other platforms?
> In other platforms, the status is set to 'disabled' in the SoC device
> tree file and enabled in the board-specific device tree files.
> I believe it's fine to make the same change here.

Before implementing something, please, always check how others did it
before you and ask if you really need to deviate from the existing
solutions.
-- 
With best wishes
Dmitry

