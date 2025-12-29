Return-Path: <linux-arm-msm+bounces-86875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09314CE8192
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D874630039F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794082441A0;
	Mon, 29 Dec 2025 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIpchFXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyXl0Fef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8423D7CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767038416; cv=none; b=rBBx97NF83KK8Ja72N1FMMc4r/R4evZY1iHIZWuwa6kUw6Xe+jZy0huMAE81J9Yg4NxrC+QZMi0VYz21XgSz2HKsTP3nalui+O670d/RjiMj2BtAm2XcHlHaZBynCx/5+2EVaKk3aLvPoFRSQfrZMbkB8BU6m92YPF0NLl6BMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767038416; c=relaxed/simple;
	bh=CvF6FYFxOxSnae9woZ5z7Wwkhxha2ElUJGKqKUxsqQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCXEINHLDvm1XLltWtkyoAxZiXJqj06kHP6c4sajnOVQFY4gZqLr5mP3Q4YQu2agGnHwtYQdcwmAHmittH5yUGgqqNLm6p3IQEP66eyThn39ageqiwi2WPB39+9+6CNvzrqsHPHimwexom7XvXt62El1QpGM9c6h+Q2eD6rUGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIpchFXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyXl0Fef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9kfRr243710
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2ZUs2LDcuQkOS0+JMHMC4JM
	Gpn/Yfg5MP7jihxwB4Q=; b=pIpchFXZl2TXDArwKD9ElwvaDqwe+dHveI1uYn90
	wYx1JJeSiKT+eXFlxrdblKOCrNHhCkfj8R7LT/6n3bGNC/1vbGqSXZOm4shp97rC
	5S3S/nXsdxCGW1FqilJGL7y6hiSr3LxEsTx6XSq0z9VhQrz8EOWUmB7R7jB1XQar
	iWQepQWnQGAiGjvKYkVocvdJQj4M3CutfgGmC4e/ZZthGQn/CYG/kmvPS/P4ss7Y
	SBeZkkUJGnoIVjzzY8LQ03BItx3MLq8XR2pcjwqWstvxRlvL5vjXGZ56TpVsQFok
	K46QgeUUNlRjKJWTcvvHo3vJ9VsfNpShYVbkU45FCrkjNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v2h56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:00:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3dfe072dso247757381cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767038407; x=1767643207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ZUs2LDcuQkOS0+JMHMC4JMGpn/Yfg5MP7jihxwB4Q=;
        b=UyXl0FefspD0XCinAct+jK/eBdqP82VKhu5eHGA13vmj9UyPn39DKRRTV/6H3+u9rR
         Uw4StuLjSjWQxdhAxDERqh07bHVipfvsc/Ubj+osVAcBuxlzUiJ0kWYoStgCgTMdunZg
         +TaY0w5No7fHuEYn+gKm4rPPxGRrJeWBMSL/N+Sf+/1+XfKd79PzgIcNKEiVi4us8hoW
         R1Jr8jzySCk41DSUgWAOh/MHwfdke/yy+fXnUb2fD6FAT2xOARGLZ67A5tJMg91GifnW
         R52E6Me0iPXbJzKjqx0YghyK6MDayyAjcLLK2aHnQAujNt/vClTzkMOeCSES1kXtiyti
         lZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767038407; x=1767643207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2ZUs2LDcuQkOS0+JMHMC4JMGpn/Yfg5MP7jihxwB4Q=;
        b=Bb2on4nwJPQtjiX8wNNRTAzQMjzjdbnX+TLegz9uv8olO0gaGF/nCJUwLwow8yE4hJ
         KG0CICNLIPeh+Mt+HNuCg8t8fznVYvXRVuqYYFllwBgMWULe1q9FYIvF4o3jNR2I6ecr
         FBUZM5rl2oIn5bWVtBdPDcyI1HZQq5i9KJYOThq6jNAyUGGUi1MqWQhXtpNWCrD8k47o
         FIAEoWsXRwe7LAmSTuZXnff2w2hU0SNUVNz0kLFG5cm/spJENoPgu2y4Grv/N0p8+Ktb
         2XK654RlaLtf+63zKqWG1q1oIo6ZZ6cVVptCGtL6IB7O98Jua/mJAuMa5gehQkoa0bsD
         CWHg==
X-Gm-Message-State: AOJu0Yx7ju5w4u4YrItN3Npr8Aw0YZoUeCSmt6lFEq7HDJ7DY+c2vLr8
	F4o3yXgmbDTgAo0vCfXAhKKHIBj2pGoekeDA7Qe8CZsVC5b79TS0jNiGFv8bB8LgZMRrP8yW+vr
	gccXXCmomSdUmiEaPSF1Klo9uPMxsY5SphgekqGMKFOvrs8kKLe7HkHJEH9Um4dSh1DPW
X-Gm-Gg: AY/fxX5fh52wScfcUCa+NDrlwl1DIjn2fC22+86r30lH6/ZgHwIW7hcvjJxRtmXJyu3
	OVRw1OreObigM920QsdXIMX8XE0vHpkt/7OlByp7Oh8eiPoztE4yxDILEoAfOeWEHsywn2jFZ8J
	DrZORU4+IMOwfQEkcBSetgSfiefuc9NaSgGH+7NPwHztlBpC7f6JRba29Cf3OCx0O65AgcusUKe
	rsyYy6Es/Iz1CYv5w92a/Xp1ernI8rLDWVOWuJ488aoqflZzgeuYENxUqvJSp5WivQW6GIgFcUq
	E9o3eQ9Y6YQUz37/7iqHlthnRnzLyjPHjIaVxwEdLT/3y63Q9xiYbPnn6iwxPOpumYeefJDHKFH
	I5zmE3CeX4VnA9OTGkWX8BkZOIcsk67S6uWV3rbWenQyAZA/zMPhqylxETMCv4YHmZbCZAs6XuJ
	GUn4CQkjWmAvaGVe/hEDEWv2k=
X-Received: by 2002:a05:622a:5c05:b0:4f0:153a:65ec with SMTP id d75a77b69052e-4f4abd78ea0mr462045621cf.40.1767038406907;
        Mon, 29 Dec 2025 12:00:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoszHrq5XQmQjknkTLfMXRDSTUcF5lISg7AuBpGEq3McP5PxEJZV9fRVpBSp1DUK2MHQzwJQ==
X-Received: by 2002:a05:622a:5c05:b0:4f0:153a:65ec with SMTP id d75a77b69052e-4f4abd78ea0mr462045021cf.40.1767038406285;
        Mon, 29 Dec 2025 12:00:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffdbsm9461738e87.76.2025.12.29.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 12:00:04 -0800 (PST)
Date: Mon, 29 Dec 2025 22:00:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229071258.456254-1-sumit.garg@kernel.org>
X-Proofpoint-GUID: B0Nnc3SRwm7VDct4ULLVmDaNVq_F5_hX
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=6952ddc7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ENeXTWk84ZaAIG5uhvUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4MiBTYWx0ZWRfX8K6FGHjbyYkh
 7QQVZghuLCrl26ka0hTZQnjSP2v71gdLZWBVTKjBA5Rx7lfHq4uJw3kV+efU0TdhG+GRvw5IzYV
 ZdivUPYGP+CLwpijqb79tqZGtB47z/yfOAHANQnizm+NfngzzW5/pMpsY06mvXkQQNhv6/HGAho
 UmPjP0OjF0KzTWOs4obrD+9Bh1hzvmD+RAaLhmpGdWgDeVzaM/tR6WWPemLSUhmkiUcQWakxyP5
 wY0c6tAdVtnlJjlxP2lrir5WFsLUPl7dLxw6+jqMqhEwp9zLd3k/QG9UD288APF6xJfcGlnz1FH
 qOrp5s8VSM/xBxJ/sK+F01mrJSfZ2/SHTw30H9hwG5n431Xdl0KeQ5PxQqULlRySDRtOglywsS0
 /Voey0VCz3+AU6y8JHuQTltk6Unt5gUID9y4LU762gyip/IM7+WUnRT58KcluLLHYHie3CQpWeG
 qAO6M6a5+4fWntY+2GQ==
X-Proofpoint-ORIG-GUID: B0Nnc3SRwm7VDct4ULLVmDaNVq_F5_hX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290182

On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.

We are porting the underlaying layer. Can we make it to behave in a way
similar to the _existing_ software? If DT was a part of the firmware, it
would have been fine to perform such updates. But as it is not, we
really should try not to break the interface boundary between firmware
and the kernel.

I'm fine with the change, but I think we should make sure that Gunyah
doesn't break existing device trees.

> 
> The DT changes should be backwards compatible with legacy QHEE based
> firmware stack too.
> 
> Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

