Return-Path: <linux-arm-msm+bounces-86291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C132ECD84DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83672300FFA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 06:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF88301704;
	Tue, 23 Dec 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxW4FzKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNBvCSo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0922F1FC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766473091; cv=none; b=OTYHhaw+nqrrkOn8vXBCRy/9eIreFDmkVMSOV4CrLqii15/V+ryeAJfxhDyUIkmbqOyTwW9mFBgyHjSKvyW+S/B/D2nzcEKV6rh5kgQBSFTXRzDz2boRvsPaK2BVasnxawRtZJjgJT6ja9C6EHV51X9tZEwn2vGpd6d6/4BgYJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766473091; c=relaxed/simple;
	bh=+NEjT4mYvRIgheEhvbVKnLb/qmekRgP0yYJbZD+HuV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP/q3O3F4sZ2Q09C+aqEJE490Hqx3PpWBHC1nIq9+sxtswo2eQmdut7zp4sWIR5iOUIIbvzZ8n7p+GR0ZIp+KWbqRsIJ+DpGcH06lw1CyyfA85DotQ310Uoak0LMnO5WjipXGNofw/O1yd3CYYMGNDsZRTPkhpJay5zRo/vfraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxW4FzKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNBvCSo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN185VU2747187
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BzPdUWow8eBkjp3by//W5rwk
	q6StKJlp+bBgZ4rbBMk=; b=hxW4FzKzjgDHUzm4i20UQgfVH7SnvzhB+5BxTGgc
	mGvhfJIR1sO+3125yNzilyatALbWsXMduFGIkd17CIEgre6jLyqtvJmBToWPPspH
	KY7DG8o21XI2zGj5UnBYrgG2bGDf00drIysSePaeb9NJ5HCOGiFXVsuSsBuQBksz
	yIyWk/4SjUi/4fCBVt84Laf37pPiJriXyKe3toQWzSlzraKh3a2+ebqjQdm9Cm0X
	tsxCYY31qOU87z+mtVMOSpYUxAtm2Le1cYqd1MtaDlBIjWtQJqEnHtrclgjQ+Rde
	k7KL2xQFNmo7UQWR9ZmDrxIPn1n7EXGdA4Z/eyAp/Ip0yA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5cs16a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:58:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a089575ab3so62041495ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 22:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766473088; x=1767077888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BzPdUWow8eBkjp3by//W5rwkq6StKJlp+bBgZ4rbBMk=;
        b=MNBvCSo2I1C+/d8W09dG1i1mirne3ll5Li6S9lCJbJuvQuPSY1zHCV1GRvo8764XXT
         GKjdXkZtIwnY3KdnkUPM5Rfof2twY7Imu62eE2TfYMH9+X2MXRYbwuqgPO81psALN8kL
         vd8IngBsJnEKgBseQiqVBgzz+XroGxTkSsCoC1LWbXxbKHAgFy9HKt64j+i17eM3brTM
         UcGEUQzgkY17AZQfWZkncv8pZtd3uPGCYAs+k7/clpky4cWyMjcUX4kZROfAgXRKHZk8
         KIrkMzHSCt1OAyBB0DrImW3VyAJkSwjypbyhDim2uws5OxQn5du7nli0csqm+LDnfrb3
         qCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766473088; x=1767077888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzPdUWow8eBkjp3by//W5rwkq6StKJlp+bBgZ4rbBMk=;
        b=QeCse13YnYGp9nch23/nIvDVU8McScXPofZYfnGuD4Ew5zVTmgnjxp7iV2TE95gs1p
         y59/99YIbV4rM1KJI67kQiBhPUt/fs1GJ8eTtBh5CxLvHgNoYeIygIDfkJKt+b1FDA0h
         eVLQPx82PnF/6XGQ5Zk1Fc+ij5FrjsTSOE8FBALH61WDcuTs047fsQjEUaNA6NfvDrdm
         5YVLrTUDzJHLVEpY691/il8EmBjVmvlSJMdPGfhoBuBIgjYQ2hShnGXfxUypE9Gj4drI
         Rhse5rvGlrQBLNUveXjS2onUwZBMvjIAxnb2RNn3dc2rRX73BKQtVa00WiFZHy2lCjP8
         GkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ned6bRvR+Y0yGYi1Yk+i8T3ObpMXn1UrRjyvk8CoJxozsVjUb7euoS6/AsVPIMY6xEyyx9mxIKYFrKVn@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1meKu31v6ELVnWHSRBnSv9Iy59r+FFev3YXlAwzFxNMRaOPt
	qjHWKBOtl1GyebSrLDjW9F15a2u+38n4diewDTZzY1MN7Guyvr9z76bv0LIeYKKb/N8wSa5mC+Z
	MgtWun8zLTe0eu+5OSe7I1gFya4oR+BaJZKE6Vz41CqOVgZDyqwrclm59X9wjjtpOnUxe
X-Gm-Gg: AY/fxX45J4E2yfH8gnGvFgW7OpVBs+Hr4RJayzpM/MK1aVSimzCfN2OjwK6JPYS/5s1
	9D5DZLWcBE3yszty14QkYOWjL3fM/tXmQUpehviz68ZKwytrMnWs5F+kvptyj76bl7nfh5FRokD
	p8DyRwBSjGhGEZ9Vba21QuxKr6GyplRT2h3E+LlgLSmqp8l/jG+REnSQ3DzudPzZ2rrCOVOlloX
	mZ6SWC8VKvUyDaVmflPa27aJpXM5cYFa4RqPu+4OlJR5JI8t69iLyv17Mv1yzK9Z37wdOlmaBXk
	5gLjKb25v6qbfHF0OlXUMg+zdAj/SY6sZYUnS4Lf9Ukjs21HCPrLY0qX9Unc6DGtga0ASm6PSZQ
	vUu+9grBOT+npO/F8d8KcO9t5vVVnaKKvcXOYoihNUhMtbRI=
X-Received: by 2002:a17:903:4b30:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a2f28375dfmr137605615ad.40.1766473088504;
        Mon, 22 Dec 2025 22:58:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxu9Zu4goXqxQKm8Ie54Fu/x6r+vSKPiohxo/3PR78dJCjmzDgIRMQ8Jv8FV8ic0cWQuvO7g==
X-Received: by 2002:a17:903:4b30:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a2f28375dfmr137605325ad.40.1766473088009;
        Mon, 22 Dec 2025 22:58:08 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d858sm118676475ad.57.2025.12.22.22.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:58:07 -0800 (PST)
Date: Tue, 23 Dec 2025 12:28:02 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add QCrypto node
Message-ID: <aUo9eiAQ+XMF6zwn@hu-arakshit-hyd.qualcomm.com>
References: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
 <76fcf840-e0ce-4647-bff7-4d2f6ac09777@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76fcf840-e0ce-4647-bff7-4d2f6ac09777@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1NyBTYWx0ZWRfXyxt8J/J2/fs9
 qpgPb0QTJe1eNIGCnvpIDrLPl2gCzaxa+NrE/jshDQ0gSztcjlblgC6SjHg2kX6Usn/S/KMLq6U
 4/FJ0hXht7rtgEhg0w45Q8fo5egasZv2y05ycCrT95DkcboWR/L5x/CA+oZLP5AoxpbeCztMg73
 9Q1Vu5MgaiRq0wmPmUiYNZt1Wid/SUmzKf3ab0QKORqucIl0XoKFwNClPOv61zYkeR4BiQHk3NX
 9mYpG4c03CvX+Sfd5MvWgyS1wp3/X2yqSfTQIRuPtcyAVeWCKxiQKAReT5iCDXbnG2t6Q20NPQA
 O/WRGrM5+qGt5VFYlKJKI63ticx5RWWIMeZYw+FWWeXUUeetpdqqjM8YGTO8nu2nIizduyB3o8m
 Avdf/EYRkjsmk2SRa+3CHJAlE4GIq90RD6LcEh8CRAB99r6TiS++Pr21J4Eov2ndElqhea/VLBZ
 ixbYXbcbzEeqAI9JnLw==
X-Proofpoint-ORIG-GUID: zB8OCPyLMOjo0pPbu-2Q4HzMQXNhLlN7
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a3d81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N-RZRtAeA9jCEb56goQA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: zB8OCPyLMOjo0pPbu-2Q4HzMQXNhLlN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230057

On Mon, Dec 22, 2025 at 10:44:49AM +0100, Konrad Dybcio wrote:
> On 12/22/25 8:30 AM, Abhinaba Rakshit wrote:
> > Add Qualcomm Crypto Engine device node for Monaco platform.
> > Bindings and Crypto DMA nodes for the same platform is already
> > present in the tree.
> > 
> > QCE and Crypto DMA nodes patch was applied as part of the
> > commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> > however was reverted due to compatible string being miss-matched
> > against schema.
> > 
> > Resubmitting the enablement of QCE device node for monaco platform
> > with compatible-string being aligned with qcom-qce schema.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..dd0b9ea27fe1cdfbf6aba07e98183871be7ee889 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -2350,6 +2350,18 @@ ice: crypto@1d88000 {
> >  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> >  		};
> >  
> > +		crypto: crypto@1dfa000 {
> > +			compatible = "qcom,qcs8300-qce", "qcom,sm8150-qce", "qcom,qce";
> > +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> > +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> > +			dma-names = "rx", "tx";
> > +			iommus = <&apps_smmu 0x480 0x00>,
> 
> "0x00" makes no sense - "0x0" is the concise way to write it and
> "0x0000" would be pedantic with the width of the SMR mask field in mind.
> 
> Please switch to the former
> 

Sure, will update this in patchset v2.

Abhinaba Rakshit

