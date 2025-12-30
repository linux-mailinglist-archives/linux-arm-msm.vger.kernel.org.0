Return-Path: <linux-arm-msm+bounces-86989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE39CE9F44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69696303C9BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7073627703C;
	Tue, 30 Dec 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QquzcbbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeu3i68t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D90A248886
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767105628; cv=none; b=RPpzyvvLFuydVhnrdy4ELdjJDj4VM29jQscYOSxShu9VsmrlslwQrbQCeyKVIOhjoIWQhp/dVMX4TehToPPnJtMWPtvswR6dIaIp85ah7pCVmCClguNUq3orJa7NBXTcwDseS3EzcBCEpgV78LsC1Ba0vLJC8/Md1NKs16oxxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767105628; c=relaxed/simple;
	bh=QYWVOA0gqaFFJ61UIJSPoAX42ZJBlV4qwhBi2vjosFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6COH/GClFk8oIjtPIwX4PCCOgBMn4IlXvr7AUsphsHZUPpGQ+qCwiHyaJNDHnV+Y0clGJIRUII+7LYzN5ar5zfZsyH417lCslpEk+Gag+w+uRTrlSJW3G4WDZLY86MO8Fy25bBSDUx5alXuEy1yN+NmqbzvlECr+lM06t2cnbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QquzcbbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeu3i68t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9f91V2692886
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=II3Je9L8iVzOvF+Rxm37ymP0
	DmJfLVRaUzidp+pZdJI=; b=QquzcbbCekbaYYTyx3W62K1/g4IiH+31jf2YiJUs
	XP9ZSRrNAkszGg5t+X/CEykbCAGcS+xs6GoZK0MnJfERpKhtC1YXnCDNvNPdxW9V
	sia6f5E8WYg1GO30wtA3o1+jO+eiYrXynSdZTppCflJFxMHs2IRe1QXhVoPL8TX2
	PniOw35rT8+hxNm0aew2xCudhP/y21FHTIQzLKWe1fwlYy/OKAdaZyWEhosC3b8B
	K8Fd5iPO32P1cZoudKLQv1YnUUL56FMF09bbFLxSR0lHoHkl4YoE06NQV/X3LBYg
	zN7oHZXwlCSiluEVfF28rXjhRyD+Prsu/q3j1dYHxjunTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skj48a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:40:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1b7293e7so371591571cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767105624; x=1767710424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=II3Je9L8iVzOvF+Rxm37ymP0DmJfLVRaUzidp+pZdJI=;
        b=eeu3i68tDPOoCp8HakR3hYcL2BpQeDNnzSBfFfodNke2ivkPatYSdAJ4ToBH6orpUF
         1qFwNPQYrxV3dQodT1EjnuvS7hTYkHmhiSV9qS7a8RY6xEgIQThCxWUrXfhr3UrCiwv8
         O0VV5PtW7KdOGM5blGJXtLZkqt8FU2jgJ48F34SQ9Z2Yu2yen5kow8UeK8pHWaSfonTa
         Y5VZXeyWU+9tcCBubycWMB0szfaHBLQ+7ooIck4lgee8LajsbPpysBUe9ESLu47k1O2H
         hpzaQO8CVy0LB5NeqPQuvWiFjdS1m8ysc7Il4gzpogWTIyoflTswg17HLoz+5yo8Crog
         hmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767105624; x=1767710424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II3Je9L8iVzOvF+Rxm37ymP0DmJfLVRaUzidp+pZdJI=;
        b=LJUJ0uRbWrBNXUNHcfc2ZUAFRZa8bpD8hqINI0fo4qMuDclFaLLWtMvyc6cNubaTnI
         85YbKMGdUNQUxayLRUgsHAl0QSb3znza6tBOunswB7yehVLR11EN1j2BNjzPgad129U1
         w52qVdR9hARgjB8woKi0++ipmqWW/LolVdN5yOvUarMnhSZrIkml7tsbvmtqGgK8q6P6
         MuxBIYzcFfYYb9DhwbQPHipUzNCUd/A27qMcepXOuaxT0pQKVw7yz3epCX2q09fyKNo6
         2Bo4jQxmjcRPaATIpHznEdexwPJPn1UoYC0H3dAbXVf0zQov84/I0FbSpdrkkRQrJtOy
         t1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwnWRJel3I8ABTkzMABwdhnC0YavmC5yH8T17VEznmdXQli+dY6BlowlnkHXL+LotK/uOYc+75192lvbUR@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuDPMVMet9n25jIOdU0MKAjwZ/yA8ROk8YwfHTmQUakzN1beu
	Cgh9sTf/35XU9vdnbm0G8eOAl3nKiRJ/Tf5VH8c5Mhb+VwWb49EwuQWPHhg6QlhBQDPJYH4R+2t
	Jsr0nHRfn0bRTKp0VREj8d6Ji4BWFue2RsM9ctJqsU9k6tuUZ9yvOcEvLyVQnmnIbGSlS
X-Gm-Gg: AY/fxX6YcDOMcc0VmI+jfeElChJHWN+d+cPohhgMQ+vpRCfKqiXMSbEn0xnj/owu+IA
	9fEYXIdQ5gPtbZLSFp+GNYSBYh4j6DIUShyEueh3DwkrfB60XQjE/hW7egvuM8x+NJLOS6Z5yfh
	SXNpkjgD2Kmy5NoAWfhW1K+00XbFENtO7T0FriI3PR4/tup6TrUayVxhvhq9t0FmUnSzRRGAYU3
	slLY6bfdg0E4APwttYYYOgNRnpkEb6/Fddv62+OAOwX9REn7w5DmXK8Sky3VcMivhuo5fi3bl7t
	kBJf2fFnfgqDTyHRbghd3jSZH7xvVGBnfz1wx2EpI/2QPfhaHnhF2/Ra5NNuaVzIpzQx8gXbHEX
	Tu01XsfOcycajIOGjHtyOTrCd3IdmA3Py3N5V1TO7dWXG0G3qyH3q/Uik3Pjy8/CyalAbtk76Ys
	7RFNtSqIPZ9h3NiorSP+WZIdU=
X-Received: by 2002:a05:622a:1345:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-4f4abcd8b3fmr562609171cf.20.1767105623618;
        Tue, 30 Dec 2025 06:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxF+W83wJJPMiFDqiPKg8dJxge4oR7BVGGIS8Z6Y038oIyKPJ680q4o7fXDDNFHqEdPC5Gsg==
X-Received: by 2002:a05:622a:1345:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-4f4abcd8b3fmr562608821cf.20.1767105623174;
        Tue, 30 Dec 2025 06:40:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd90esm10465383e87.31.2025.12.30.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:40:22 -0800 (PST)
Date: Tue, 30 Dec 2025 16:40:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <oacyy4r7vsbpcdzripuv24djh2lgjux2danqrc3fwgbyhpgtia@njdjysybobpt>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
 <aVNf-lZ1KcH3tRV_@sumit-xelite>
 <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
 <5a8e3805-588b-4e2b-bb84-35bdc71521fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a8e3805-588b-4e2b-bb84-35bdc71521fa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzMiBTYWx0ZWRfX3jmuU6+1tvFC
 fNFmGgR10TtVZS+MH5A6FnnrJsZOWxa9O07HEwOKLRqcuEtG2iASBYzds8bfHL7fHuHJ0W+LnOg
 p8LV8e9EKl02LTwtRmsCOPav/3yGwEnBUjfao93TfH1jWAVp2LeJxV0RU4lurmsdegZydcc6w4K
 2FVKUTajF1/SDgLa8JWqzr5CDKuIexcc+LHwVYuQ7ANxbWxIL375bg+aa8WFBgpAghpYxE1rh4R
 3/6U6M2beiJ3JCOTx6RbcrRZSYzlwak/g+bT1J7YTm0H0ISJeVa0/q1UTWsIFat49MU+4+jMx5G
 2MCkANPM+qrwLlRBU1RJldaeS9hwD7tbaPca2I/JQ9taLBqThQLOjhJvDm/8iDFK0UNtzewdYGb
 O05oiWTOII2C1eAhLz35gIczuVnZUCr+O3YAQ3HZMVGFAxcc3Ke6hjMpuXbSx8kZ+rcZn9GcvIR
 uOYr5Cp/3Stp9iSVp/Q==
X-Proofpoint-ORIG-GUID: cetN4-0I5E4EG2cXn2BX0ETqpY8pzg_7
X-Proofpoint-GUID: cetN4-0I5E4EG2cXn2BX0ETqpY8pzg_7
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6953e458 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EnwAPaUfI7BCpKeV_okA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300132

On Tue, Dec 30, 2025 at 06:16:05PM +0530, Akhil P Oommen wrote:
> On 12/30/2025 12:35 PM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 10:45:38AM +0530, Sumit Garg wrote:
> >> On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
> >>> On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> >>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>>
> >>>> Fix IOMMU DT propeties for GPU, display and video peripherals via
> >>>> dropping SMMU stream IDs which relates to secure context bank.
> >>>>
> >>>> This problem only surfaced when the Gunyah based firmware stack is
> >>>> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> >>>> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> >>>> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> >>>> hypervisor.
> >>>
> >>> We are porting the underlaying layer. Can we make it to behave in a way
> >>> similar to the _existing_ software? If DT was a part of the firmware, it
> >>> would have been fine to perform such updates. But as it is not, we
> >>> really should try not to break the interface boundary between firmware
> >>> and the kernel.
> >>
> >> I support your viewpoint. But in this current case Linux kernel VMID mapping
> >> for secure context bank stream IDs is incorrect. As Konrad mentioned in the
> >> other thread that for secure media streaming use-cases, it rather requires
> >> proper representation via iommu-map such that appropriate VMID can be mapped.
> > 
> > Yes, I understand this part. I'm basically suggesting that Gunyah should
> > ignore this SID when programming the actual SMMU (probably like QHEE
> > did).
> 
> But the existing DT description for Agatti GPU is buggy. SID 2 is for
> secure access from GPU and it should not be mixed with non-secure
> access. We haven't hit any issue so far because the KMD doesn't have
> support for secure usecase yet.
> 
> At least for the GPU property, I feel that the right thing to do is to
> correct the buggy description.

I do not doubt the change, we should not be mapping secure SIDs. However
I very much dislike the fact that changing the bootloader makes us
perform this change.

> 
> -Akhil
> 
> > 
> >>
> >>>
> >>> I'm fine with the change, but I think we should make sure that Gunyah
> >>> doesn't break existing device trees.
> >>
> >> Sure, this change isn't breaking any DT ABI but brings compliance to
> >> usage of stream IDs.
> > 
> > Actually, it does, as you can see from Rob's email. You didn't perform
> > make dtbs_check while submitting this patch.
> > 
> 

-- 
With best wishes
Dmitry

