Return-Path: <linux-arm-msm+bounces-82880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CCC7A7BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE7634EDD93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451F62D73A8;
	Fri, 21 Nov 2025 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCPaurN0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmLxhY7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E75E2D8399
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737728; cv=none; b=MJLOQn8O55sLgce463zSF5iIy5uYgYXQ+RUP9K5T7VdVtOJeR83NYXmQXDMP0Ao6EgjmPU2rdcE7+BTOBtHam07roBZuf1p8Y2mvuEx6Ky/8dx/L80SvrZ2bFyGfaedUOlNmiFuiblAy/BnJJYKmqlfB5fTNhBn47OJAaPdOSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737728; c=relaxed/simple;
	bh=uvPi9ASKPbADZRK8UKix4C8KIl9QlRR9xU1PJwogzMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muHJN2zPBYxQ2C9vR4jsOt9VUByoH8devknqnnbS+QIPV1XknYQOfASqQwxg2seenHSCfPJm79cdnwP1mf1fuU4XaClyEhwyE07nzPRyZocKBgVco5HtNTn+sBgPvFPm+vPy3lV9F+La6k4Q7wuXxD4kLVH0cjSC9a0GA1wApnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCPaurN0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmLxhY7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALDYEIX1638465
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 15:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXeMU2t/+YocV/lrKmcdn7FJ/vQLkZ3h6b3+GNAWoV4=; b=eCPaurN0MWzonVcn
	T4viz7ty/3JGsfRv6ahwhXmtROfnpg7wqhlFlVjtiEv99roNMbuEYU/hlukePkaR
	EUJNuFK9yd7ajGVJKVqB9pIEW9ZnQx3rcaqhxR7+VWbYx3SYn/BPsmgFeR8YLLP1
	WCH6BQSvkt+Kkwmx3lnC6Ypl6ASc0ibmT4CTOmZkxojkUH8WTF01NfEo9g5IrEeh
	bLkkLKuL/Nnbi3kDJgIeFbO5BPT+3YxUOXepuT3Y+mwgIOXi2VaQmnA9M+3YB1W+
	Q0ITWnip6ZTu0UmE+x+qz1OcpUumB/lSub0wwqzapUqEUTr5iE8E65XSU0CqX5Tm
	Lgh79w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagau2c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 15:08:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfa98d915aso340369137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 07:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763737722; x=1764342522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXeMU2t/+YocV/lrKmcdn7FJ/vQLkZ3h6b3+GNAWoV4=;
        b=QmLxhY7RMA82vlAxbGqIaoNbuxZICoFfy2Ou4tJQ63AnM2g5wenitjzsEimI1+tEuT
         80S63tLhVDuLPDeC4F5yH4fyWiz+oRy5w69ohwlAsWpMof+CiBbxN9M8/l0nqAVfWGjO
         PSdWiibn+Q0ZD/3itDmrckZcpuEYq1lkIZzTPK7vRMJALMRdj0oerzjGDcyRLLbS7lKg
         0+0hMsv13DR50Kyt2UqXOXWsz4I6gj1atOMvvMI5CABOXJZf1kO804iG/wjLWir9s+Pt
         YotJSEW6axJJgtHKEXG7fiGys/ouDTStdxtGPVis3iQZkOKyxhfTnIwxozlgTouj1ejO
         iS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737722; x=1764342522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXeMU2t/+YocV/lrKmcdn7FJ/vQLkZ3h6b3+GNAWoV4=;
        b=mv2xbpQ/jt+o7kMAraGseN3/65xVreBD7M0wPsZBDCtiyehp/f/hsKrQZCFp8dejnx
         niA7a7VeDbg1hBh8n0920g1KVoceb7NQlezAv94YAcQhLwhyh/sWv/ga0nc5PEAnqWTy
         SMWWQAlm3Trf4fXpB12MiK88RjsRXs6YOV8fd+ruvoo3xhKG+EdGP/WNtgB5Xbic5Mhe
         fgK+/kLQreddbYL+cTh2yvDSD/U7aSZvIT3UgL0+vSvH72x5BsgTM4tKZNVH9EJnSBv9
         uZbVM9zUGd+uaBrqsAMds7me7/tjE9mPPzdEtMWumlOXoyHFu+NOsIuQKmh+ozWSRBgm
         wBsg==
X-Forwarded-Encrypted: i=1; AJvYcCXZhqw59PZsplHpBI1T96KFX2gRS53fzqDJ9c+Lk8ic/nH8fLhyx/rngN0GHm3ojmQhID7JznXqth8hhw8R@vger.kernel.org
X-Gm-Message-State: AOJu0YySNmJ8xqvK875t+tR+ddvEEFu3re52mMaJiIGtNUJF8XWp4Mk3
	Rz6xaU/y4KgVtcaCdshNkagtt6iugBM2k1Dmxd2kMvs1smJV8srOoemZe9Vl4u0DoOo2azliMY2
	G6i+NudrJ/7qs+Q8cgHv1x0mt6uPLeFi4uavfmjpXkI0+WUWIPYiy4ndCHP13tveP+Ln/
X-Gm-Gg: ASbGncuIKbDe9WKBIYowTqP8ANIdf5D+I9chPZf+g+4uaVriS9SmvfAr32Ppo190qrb
	v6efAyFZ6HqQx8ZdAccUX3ZiqwwWSDgzRW6tpdthEwwTlm/hDE+rBsHZim/a3XEdh9N8oQLfCsc
	F2DanojeNFsj1r7127Nt+STv2rOaDa2Sj7uaYM0Itoe4Yn1sj2mAtCgtKFWlwe/PHjco2zxzBXZ
	2Y0nwlCt+STfxgNjtj+Z4g/9Yqctamosvo9nwUV6kuJp2xTO3LX4RKAdbXTPKxM9uh24fHGpb09
	c4XzgsXo0K/sbPUQk03aLfvXzOJbM8JcvDQIPI0Dpj2XEcZQewlAqelW1o2HltbZQegJ8LNBqzB
	BTdCyyyxOA7vXRDKiVCNUAlM5pM/Bb/Ws4QTPu8aaBg1dS3e4OGJzkHnnh2xlRMc3P6E=
X-Received: by 2002:a05:6102:50a0:b0:5df:aa69:be98 with SMTP id ada2fe7eead31-5e1e6a6e492mr342502137.6.1763737722152;
        Fri, 21 Nov 2025 07:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO4HZ2HHfuPtxZw+pMyOmNu+f3imzE0i+3JXqRHNARVWLe23jAhWaT+EnRuJOBTWX+AoVknQ==
X-Received: by 2002:a05:6102:50a0:b0:5df:aa69:be98 with SMTP id ada2fe7eead31-5e1e6a6e492mr342424137.6.1763737721446;
        Fri, 21 Nov 2025 07:08:41 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d73430sm485852266b.24.2025.11.21.07.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:08:39 -0800 (PST)
Message-ID: <238adfbb-3773-4318-93d3-b23697aa4b18@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:08:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=6920807b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JSAmB6C2vfhm-E4Mg70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExMCBTYWx0ZWRfX1RmpCnXoJbRJ
 Vh5blRhCns3vlWudl+eEChyODmKZ+iSSYOeD7jPGumsjID63YX37RxVMJ31gJ+Rr7WTRuXf2YLG
 02hBJY81JJR9htg9GyUrBWGh2H0eXxTkn3frPdnkOpi1aJccgR9Pr3oAExVaxLGKDJ4xq13e7tj
 3m79lCmsZx4Nsb9Zd2/n2oX5gQDVkdVBE/MRmgHRMllwk4f4MfObBsvGb3qv2avHwzV0OO6iRDM
 XJo08+9kMALxiC4KhLnYF7sX2Btl4MM1Dqo2AvWRi4gkf+lua3LGO3d6UhPBFo0jkno0kik3Rj/
 YtNHmaq9cCySfgCCzIbE0KvtZ8oAvBd3h7W7Hvcp29ZJP396i0vVLNGw0VUILz8wu6im+of+JJM
 thXV560UlKP8CffZ14zFjJEyVL4zZQ==
X-Proofpoint-ORIG-GUID: H5rTu7lIS1W3dD_idP3PvAYXpf35mYw3
X-Proofpoint-GUID: H5rTu7lIS1W3dD_idP3PvAYXpf35mYw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210110

On 11/21/25 12:37 PM, Mukesh Ojha wrote:
> On Fri, Nov 21, 2025 at 11:27:57AM +0000, Bryan O'Donoghue wrote:
>> On 21/11/2025 11:01, Mukesh Ojha wrote:
>>> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
>>> related to Secure PAS remoteproc enablement when Linux is running at EL2
>>> for Qualcomm SoCs.
>>>
>>> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
>>>
>>> Below, is the summary of the discussion.
>>>
>>> Qualcomm is working to enable remote processors on the SA8775p SoC with
>>> a Linux host running at EL2. In doing so, it has encountered several
>>> challenges related to how the remoteproc framework is handled when Linux
>>> runs at EL1.
>>>
>>> One of the main challenges arises from differences in how IOMMU
>>> translation is currently managed on SoCs running the Qualcomm EL2
>>> hypervisor (QHEE), where IOMMU translation for any device is entirely
>>> owned by the hypervisor. Additionally, the firmware for remote
>>> processors does not contain a resource table, which would typically
>>> include the necessary IOMMU configuration settings.
>>>
>>> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
>>> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
>>> authenticate and reset remote processors via a single SMC call,
>>> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
>>> TZ for authentication. Once authentication is complete, the call returns
>>> to QHEE, which sets up the IOMMU translation scheme for the remote
>>> processors and subsequently brings them out of reset. The design of the
>>> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
>>> is not permitted to configure IOMMU translation for remote processors,
>>> and only a single-stage translation is configured.
>>>
>>> To make the remote processor bring-up (PAS) sequence
>>> hypervisor-independent, the auth_and_reset SMC call is now handled
>>> entirely by TZ. However, the issue of IOMMU configuration remains
>>> unresolved, for example a scenario, when KVM host at EL2 has no
>>> knowledge of the remote processors’ IOMMU settings.  This is being
>>> addressed by overlaying the IOMMU properties when the SoC runs a Linux
>>> host at EL2. SMC call is being provided from the TrustZone firmware to
>>> retrieve the resource table for a given subsystem.
>>>
>>> There are also remote processors such as those for video, camera, and
>>> graphics that do not use the remoteproc framework to manage their
>>> lifecycle. Instead, they rely on the Qualcomm PAS service to
>>> authenticate their firmware. These processors also need to be brought
>>> out of reset when Linux is running at EL2. The client drivers for these
>>> processors use the MDT loader function to load and authenticate
>>> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
>>> to retrieve the resource table, create a shared memory bridge
>>> (shmbridge), and map the resources before bringing the processors out of
>>> reset.
>>>
>>> It is based on next-20251120 and tested on SA8775p which is now called
>>> Lemans IOT platform and does not addresses DMA problem discussed at
>>> [1] which is future scope of the series.
>>>
>>> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
>>>   - Addressed suggestion from Stephen which was regarding commit message(9/14),
>>>     debug log(12/14) suggestion, and return type change(4/14).
>>>   - Added R-b tag on 10/14 .
>> Sorry.
>>
>> Did we actually come up with a cogent reason to omit the video firmware
>> loading here ?
>>
>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>> getting video stuff done and storing up trouble.
>>
>> What exactly is the blockage - is it something you want help with ?
> 
> I replied to you here[1] and given my reason..till something concluded on
> "multi-cell IOMMU[2]", I can not add video and block what is working
> already.
> 
> [1]
> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com/
> 
> [2]
> https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/

I see that the following files call qcom_scm_pas_auth_.*():

drivers/firmware/qcom/qcom_scm.c
drivers/gpu/drm/msm/adreno/adreno_gpu.c
drivers/media/platform/qcom/iris/iris_firmware.c
drivers/media/platform/qcom/venus/firmware.c
drivers/net/ipa/ipa_main.c
drivers/net/wireless/ath/ath12k/ahb.c
drivers/remoteproc/qcom_q6v5_pas.c
drivers/remoteproc/qcom_wcnss.c

iris is difficult, rproc is done, adreno doesn't need it..

would ath12k_ahb or IPA be affected by this series as well?

Konrad

