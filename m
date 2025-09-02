Return-Path: <linux-arm-msm+bounces-71528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7147B3FAA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4DC1899C86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148DE2EB873;
	Tue,  2 Sep 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoCTbPlW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7E2EB86C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805772; cv=none; b=GCsAe/9FBrX56Ixhqg5EksyGtIYdT/iPaYHd6dqNbd8Pfum75sra4orCfveJAQHCEhwrlsP0PuvHc6W9ecp3FzDVT/FsQLIm1aHgrjHlbseiKIa1AsVOHtrg33J2Ii43gd65kn8yWZAxDo116OiCwAN3Iv+Om+mqu+bOx+ZWAUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805772; c=relaxed/simple;
	bh=T+ush01pThxveIf0yG0grCHC7b6l5Pu8d/79tGLvJb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjWyuOKYtN3qWN+fN8v4aSWNRKjBwbMkshWRoQ8ETUNcuq1/ZTN3nTK3Ie5Q84vYvFOWOEFa8P58gZQos3Sm5n8ktcyPktKz7CCPZdCLc4rFTpg9NEM0TvbI7phtnI/NsqMJu2Z/nNeBB1vQX5cN1yaieEjsGjQVcCCz47M1R9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoCTbPlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5Cd022217
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl/lcg8Vvutgd2X0nRCKCHGLUZWnWVuMPA89h352iRk=; b=RoCTbPlWxVKYakv6
	KKQaoyQRyVVuJWhXkduNvIRHO93U2I6kCQ5uw1pDJitUJCocwKELR6i+8TlT3SiU
	jc+ePAQ61Y04brd7oqfkT9x69OQ7IHUi7FE/F9+uyhCfjqYLH5r0JZgaAoyTXAhY
	dQj3LCNPECR+qkzrXxU/YqVSpCRekgtEn0v4dXi4fEwJEkkP3hhgheFjyznOAnrg
	PlyPhf4USp9muDHJBif6yHt7WMCqvgLSGeTOYT78IQghhp3pluCf3uJT+O6g5C+0
	8V1CDxLeOsKFQ+PdCRJL3h9wVD0rJ0lXq3F0d0sPpwv48sWhRYfvrrW/Y6Msu+55
	njEhbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7fac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:36:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3387c826eso6811351cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805769; x=1757410569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tl/lcg8Vvutgd2X0nRCKCHGLUZWnWVuMPA89h352iRk=;
        b=hUm7MrmfsZ3TExUAWD5gWfOm1589eJsDFvzhsJtCxkpPkP5lyv1p9KkQgsZcRfQous
         DGPY8tzxkRDkz1MxfaLTNn32PsfsaTSNd0Cd3iu0oww4FKTD4SgRtifAT8E0gU3dyBOJ
         d9214wW1z8J6Msx+jBRx9IcKSRXOy03FTJPEBQGkZFEtC5Cnu7J+F5s3dh0MGDRZPoGn
         LoWJtKdzt3lYB2jJ8s2c53eM/2eM13kPlRBxAWPIRzWf1TCOvCmjoOm7uOHJuZSAmyp/
         6vq2h52ucq/FiYtY2BMdQDZIkKtROf6YglqEULxUM9Ac3kCtbH+FW4a3wdE8JJ0AexbY
         1hZg==
X-Gm-Message-State: AOJu0YyoIKZQ/SuGZVpTuIYB3Q5gNSskfKq8DK94X/zVC1z2VCx4Lz5c
	euj7/WRn9J25BI9wKdlcn6GJ2Yq4doHFoNbZafpbdnzjm7LKoMlRk0wcfl2i5eC/DI9Az2A9wK0
	P1iiQgvBwcLncnc4jYaXK+zpi+ImbKKTiRafaWBCLkFhIjFgXRbLivgsbT/jK2OMc5L5kClRsEa
	GO
X-Gm-Gg: ASbGncu6zzSez6v2zK7qmNLPFr2+BUdngbyZy4o1o41lao6KWtQeA6GWMYFLzI+obta
	G8VotAjqBe7aVBmmk20+mVKmephAheXpU4nMLfnzw89aVThEgaLRrEKAKoKKLyfp2NtQJTG8/qu
	KOi9lbZpwTsKCxmlBEkECCauaz8Au03o8WTQjTWqk2Ww8SC746LrWVl7VR5b2KYNEyO35kFbC/0
	25TJOMXK2enPg/bPsbmVE7f3wdoq3L1YUf6a0o6tLvbRnvqZDXLO5m5rSWMXB4z24qpnDxL+k83
	oSmHtsLM4PQRUiD4avDn25uEO1u74OaEUCu4oS+lvOBZGe5U6VyRymxru2la6qFKcVMzOgROrZX
	RKBnTw+DXDt9rLGii8PZ+uw==
X-Received: by 2002:ac8:7e89:0:b0:4b1:1e8c:13af with SMTP id d75a77b69052e-4b313b8c812mr90242781cf.0.1756805768972;
        Tue, 02 Sep 2025 02:36:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl44Pco1b/qvJrJe/DJPXSQCR9wDNYF6uLVy6zduo7vkFZyrpgXm2kKC7QlUx4jo7DSH1DkA==
X-Received: by 2002:ac8:7e89:0:b0:4b1:1e8c:13af with SMTP id d75a77b69052e-4b313b8c812mr90242631cf.0.1756805768360;
        Tue, 02 Sep 2025 02:36:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0421939da1sm527037866b.27.2025.09.02.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:36:07 -0700 (PDT)
Message-ID: <f9d6106a-d59a-4565-bc80-fa7816a1d6ac@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 11:36:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8550
 and SM8750
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, mani@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
 <20250818124110.8136-3-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250818124110.8136-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LijHAOp0ZPB6e1UNGln2dJaiZL9ubOT2
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6ba8a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=FoF8l4-XPnHLV7uwFA0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LijHAOp0ZPB6e1UNGln2dJaiZL9ubOT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX54wCYszeGxCx
 t00LE+Vc/HC/w6N66ywR1cOuYTLcbNwKu7FoA+ETR+S0xyqbwJGYAOwf+GN397XJ/nzRqO/ZKBT
 /CbPh3BCIwOSU7e7EHyv9ClT+pVefugQjRXHrJzNj6CaqKcI/JXGgQFcWyxPkHqmn1BDrOgxSV5
 RzN5kWvYyhCZoImWxOtrsR2k6G2toB1bqRNbLmX62jpYNx3ikkHnyGCcZj1LbyO0LRBolp3laNg
 INvFIzv4UZSDD8DphibLqIkQECfEQJiLwILwNF4GPyPd3mIrfkjFqjgMeSPEwZjZRRTbbewBAB7
 r7ItstYR8cvtt0CBHS2FpxiYWIoIoRIie79ZntPNdYphBOk9MuMxIqvbbcN9q+oZXwpjfgFZlC5
 tv42g8ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On 8/18/25 2:41 PM, Nitin Rawat wrote:
> Add regulator load configuration for SM8550 and SM8750 UFS PHY.
> This ensure proper regulator load management and mode selection for
> optimal power efficiency on these SoC platforms where regulators may
> be shared with other IP blocks.
> 
> The load requirements are:
> 
> - SM8550: vdda-phy=205000uA, vdda-pll=17500uA
> - SM8750: vdda-phy=213000uA, vdda-pll=18300uA
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index f7a4a8334026..50875d9609f6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1172,6 +1172,17 @@ static const char * const qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll",
>  };
> 
> +/* Regulator load arrays for specific configurations */
> +static const int sm8650_vreg_load_ua[] = {
> +	205000, /* vdda-phy */
> +	17500,  /* vdda-pll */

Is one really supposed to be 10x higher? I mean, it may be, but
it looks odd..

Konrad

