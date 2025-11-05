Return-Path: <linux-arm-msm+bounces-80407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1767C347E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 09:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043DD3ACB1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB54299954;
	Wed,  5 Nov 2025 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzgDD2lB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0JYG3/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD128000F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331654; cv=none; b=kfQqQ5z1/r/T8AGWDcJyBmyutSx3LGywhNL79G4c5qclW6DN4zZyGI/Dynj6S6EzVE3ncJ7BYQXbgjkMZwaib2Xl0wmU8VJVFQT2uVyHg37YoYFjR1VxVrZLvj9Hig2RUhOR37zL3p6e55WjBez2J6bUWbmgd5keqasT5O9kl4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331654; c=relaxed/simple;
	bh=NnSGWr6f8UUqIioqQVhV6tQa6JDXAIcMsUZ3hBk7+NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw+o9RlGLmsnQcUa/vkJZH9J7TqieR0dFKD5EvnWth3E7cBA7vSz4F3cG7dRVgaucvkpXtYwZtx4Pd6C8S8AIjOqap3pKvjGozOH6tV4pJe2C2uqKjNf53hntw2nDkkMUERhjpDM6IDRf5taTND+dydTxAxZI0sCU1aEw3jMH+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzgDD2lB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0JYG3/B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53sInx3913967
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 08:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V6iVgv0dpsKodB/pMhacMSwm
	+tuxtOcBfpnB1qtn41U=; b=HzgDD2lBl5Tg+YPWoiAXMH9rR1OKO3jYigTuzOlr
	r1gUcKtZT+o/MrXzkj5CqlWYeTtzKUmrX+2rCBwipD9xHR2OmhH2ZarAjGZjOGTp
	yZYpHdaW7ogzwf3Ls5oHYC/b5R7s8xMSBbHW6r0OoM/JYYB3K4mfFnX2xG4Lc7Pc
	imClJodQB9gBaHRBwdWKC6ZZc55daBGI5cMIoHXPB6fvvpyevgttXJSHNquUpDeN
	bQ/nAPuAnzCNkudkha94l0KgCYXUC/ZRleJ5GCBvUI+RNuktTmdpaacep/nJD0T9
	c62MZBPKjLvcISbIyIBFsRhSc+FkGNhdDqkf59NWfAkj+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y378nj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:34:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958c80fcabso87008075ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762331651; x=1762936451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6iVgv0dpsKodB/pMhacMSwm+tuxtOcBfpnB1qtn41U=;
        b=g0JYG3/Blm8OKImWXmf4ksU97cFuN7DFiu3ZuK9fL8hE0ZCPQOVdqEL4bu3y36fFl0
         DLuTAzQvV4A3aldxQ2dUb2EH9xT/2z6Md33+65/royP5gvlH+5LVjpLOPDtU0mShvgoi
         cgeetmwaBDJvoK6DoUdDE0sWrK7RMgwWjDTKk8DUok7Tw1FW3RBd20H9xrzitkq8Pmry
         nsY+fVxortpjbmTYfiScHn22cDJ4ZePFt4+GaBfG/PsORa6DypHd8Q/m35ZWN5wGIWs8
         HBtuHGbIzkYJh5vDnTEUo4feBOu/gY8VUjamm9LjSSgMyKgd8OB4zo0YsK6W124Hrz7/
         NmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331651; x=1762936451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6iVgv0dpsKodB/pMhacMSwm+tuxtOcBfpnB1qtn41U=;
        b=CUyS68chVr0RKRCdGazJyZ5h40e+8maYeWyuU0SlfG/F95HhrNYTHjI2aa+oCojH+2
         auu5RITW50olNDslHhk8Qr2uZwS2SrfxScwqJWy5S275nKMascNhzqHmyO14hVqxugkv
         3tgSDMsswaOJRRTYJtEKmQ1g4EeHhhCqK4I/mHuF49DtgbDRQWaaG/TEVL+77Bl3F6D6
         HTHUktAb6y9AKbYafSr+fpSFrl07KVREeviaeniI4MNMbFTimo8NseLMTjoClRS/nLB8
         eo5j1PhZQyrqO7h2noRmANsYQns5pIh80kycXMNJt0FfvGPcWZKRB1J1fmg/DKwoaxhT
         RH2g==
X-Forwarded-Encrypted: i=1; AJvYcCV2JYtb3nCj3fWLX/SzjiCo4vkWMuzL2NeepeoeJJcMO3pCmc5zxyAV7khpD9TaA8G3et8k2SBFjfg6ZeFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qxcLpIoMDuSmFCXZtBjjk+wYGI8HHarXoqDyf1Mi6kS+Pxvn
	e1fyicqnfKuKIdTVut3SKPRSN1VfzN111jpghFEDQTqzVpX3AAtCP/v57tTsoDKlBjTeMb2cxXX
	PIzGnOW22+Tp44TLL6UtZUhQSpW8lYpvBkZh2WWXFmWaR8noclZkog6fd6FNhCCPIIJcJ
X-Gm-Gg: ASbGncu7mtTj+X5XDbXQ2froyZNv4YmX3WZ4v/IIP7XyO/2wJBOZro5i1ILqXZmD8lg
	64KNRV6Lg7U6EaCKerDj9rW6UPKfDWlu2KG5g571cG7AnZe8oe2ODwadpa2L1IgrzrqbqPoK/b8
	gI0VGKKyYJuV5sBqq8dDdn3HwzqD3/poNKsnQkuT/Z7i7ZP6nUx2Be9FMCG0SQdmdP3zHgfKmay
	1pHMN/OaFOUD7krvpDlH/aYeTmHW0I6N4ZBK2wTixw8XxKno1/IqJQdzWw7qTM5o7nahtjZPXvb
	srqyedGKbK3AKvBVMljXQEmWq4mifdgqXAJE2YwGUAzUk/koyXfxcCYfL2SaVM/+yxisUCK2pdI
	CNhLDlA3NyDsV0RFa8C6FuOT0Gg==
X-Received: by 2002:a17:903:41cd:b0:292:39b4:e785 with SMTP id d9443c01a7336-2962ad3e9dbmr40217045ad.26.1762331650515;
        Wed, 05 Nov 2025 00:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFXBpcvRc2G6A4wtVDwU7gPC/Ps+J02LrDaCzleFH1Q7ZBJHgDfbVxaStU2V7miFCNWmuTLA==
X-Received: by 2002:a17:903:41cd:b0:292:39b4:e785 with SMTP id d9443c01a7336-2962ad3e9dbmr40216745ad.26.1762331649932;
        Wed, 05 Nov 2025 00:34:09 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5ff69sm52309015ad.93.2025.11.05.00.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:34:09 -0800 (PST)
Date: Wed, 5 Nov 2025 14:04:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Message-ID: <20251105083402.dvm2w7ezp7spgtz6@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-1-7017b0adc24e@oss.qualcomm.com>
 <0608ca9b-083c-4929-a4e5-7d76b2590637@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0608ca9b-083c-4929-a4e5-7d76b2590637@kernel.org>
X-Proofpoint-GUID: Qs-tlBHgDP0ti5OPRs0FicG2B5jJhuyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2MiBTYWx0ZWRfX05VpMYgsVueZ
 0p+VMOZCTBBFAoAsMzbWDzZE4m5isz3tTr+bq9wAByu4+8KiRwQJFNMpwwNBizWgm8nQwTXXgBn
 8P9LOaQUwx14pXrHyREXstG4rb68+VggV4iMMbqAGGS1iuqVWYOlPMDmeLq4bXtiOyK63bldlVd
 SsvcdlakWz/V6uh5nl0T9SawMjocyeeEs8qpQS4zXFlNvcWxP+lQnYxDLo1zWPr8hEBSul04Kyi
 TFNiEJpvwKdpvXFtrsPJ2HM4A7eCwFtrGF3GAgOQ+vOtg40+vDRNfymbls3nH43hC02ZpxV4+51
 GcbDl3zkZqKZvueTnrDVwFNbX75Gink0FeJGtlwwsDZYQNMeWqcgcggn70gjLztkIGGjz6urmCk
 rl6j6i37pO/3DyIroI43FdLYH+a5uA==
X-Proofpoint-ORIG-GUID: Qs-tlBHgDP0ti5OPRs0FicG2B5jJhuyv
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b0c03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NS1sl2V-mFnim50cphAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050062

On Wed, Nov 05, 2025 at 08:17:14AM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2025 08:35, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
> 
> I don't think that's true. Washn't Gunyah something new? Like since
> SM8550? Look how many Qualcomm platforms we have in the arm/qcom.yaml
> bindings - for sure most of them are not post SM8550.


I should have rephrased it, thanks 

"Qualcomm platform which feature QHEE based hypervisor or a module in Gunyah
 ... "

> 
> > configuration for remote processor and when it is not present, the
> > operating system must perform these configurations instead and for that
> > firmware stream should be presented to the operating system. Hence, add
> > iommus property as optional property for PAS supported devices.
> 
> So which platforms actually need to do this?

As I said above, almost every platform which features QHEE or Gunyah
hypervisor that support PAS based remoteproc subsystem should have this.

> 
> I really do not understand why you are adding this to SDX55 and several
> others.

Firmware IOMMU context bank was always managed by QHEE hypervisor or
Gunyah it is more of never mentioned schema in PAS schema. So, even
SDX55 should have these as optional.

> 
> 
> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha

