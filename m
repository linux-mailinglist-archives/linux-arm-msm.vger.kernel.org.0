Return-Path: <linux-arm-msm+bounces-68330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74FB20669
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8C5189C59E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C627D288C12;
	Mon, 11 Aug 2025 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXPrg8BM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB3288502
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909622; cv=none; b=nHadTHixeHH6x/aZv8rDwMlWL54q0ZSu0r3iPMYGd7Whif8Ot819NX0PANYoEvbJ9QWXbzo+cH/3Dwi6nvGOVITI2AsJOV8eGc7XCTRWQjfi7XlCmZeyFerxARH2p7b/fPKludJo4DlhLE76ncckY+Z74t+AyhwEd7PRN6BxmbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909622; c=relaxed/simple;
	bh=v3Zo5gXnfAYbVU5S7MFP1nrzOMla3h/TcLyqsr+wtmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJpumK3DPLallc6+62bdQ4fXxTGa5OvJzu3eEzFP2KWZPHwgnDk4glQlTdLf/zp8hu+Ir9odgefrxTG3JUwOUYAy/rFj18GeZP/oz8unNZFCwRUFQs6eZLs0hznsLC/lVUaE57DRv1xXnYHtvic6YE7zn09c/KnV0J4g5S3bQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXPrg8BM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAFp029203
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFjaRBD8hRykiX2dmDQQXhmL
	YVJDekwjr1dK48Ctxeo=; b=pXPrg8BMAQUb/cxSzQjKMUQvNp6SWBf1Tyw4GO29
	Xu//EgJVuIY67KavcpsZPGaUJ//0pkMPm1bMhsUfo+VnnKz3oXKsv+5PVkhRSeNw
	zEKSUpt+i3pVAbZAbawyUUI1WCOjbQB2dW54TXk0R44QsN4rIEG+dh3Eb2raDE9q
	2A4LkS1qD7PRJjAR3KLrdZXMTHjjBE7yNN2maJD5uW/I6ob3WMVmdHwZJGaqoWYF
	1dlGzlAdbSECBW+W+N20p2VJAK/pzf2QDFwAWvLdHtwmsiD12pVV6lEmtkrYopFh
	YDR+kF1cqpp4URvhe6SpOEefvosdVNXxLqUfrlmg4KNsUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmc1dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:53:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4aedcff08fdso80055791cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909619; x=1755514419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFjaRBD8hRykiX2dmDQQXhmLYVJDekwjr1dK48Ctxeo=;
        b=sboo9ijtpmSebvqShuDQhcUuKMDPd8fFEQIldCEdjAYGNdVJr4XKwDdLOOHk+vbghs
         CrpjGg5t8vi35GNOumD5uKvCuqyNNEh1s7wjZ6193K6p1Re5hNptFQhb1pONeMPB4vBD
         6whCo0i6JAZ1nq7fYebiPXvmVilywJDBlHOYspxVmBOnw4KROW8RsG1bo7Dm9cQl8qDG
         KIZG8dW7Ibqom67mooZ/LEDeWCYbRueWMe+oQM2pCYuKYko2O+wrWHUAudNBdLTSywtk
         PIchZisH2xNaH4vSGUS8G91/5JuTm6k/Uy9wkNQl1HXS28HuNCBLlpa9IQ7Qx56zfGMd
         0zNA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1u+ReudmG3N2beErhVzpI/N2I5BuNvJVB1hpPwre52uy+Xs/EsldnpGXM3RFUtBBWDrPbFIvd+tIs16Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbYEPe1Fn4/bbZJG8nsrrgr/EV2RrC+pVSH+zahIDFxoULYhO
	O1NyZ3CQoABFafQ1loYqPCs7M7f49abqpKzNL7jKjCac+wNAJp2Q+e53t4Y9priTlVjG0HC35HP
	R7cCvK8oYSA5BdBKEdViQHcb4r8ajtIprsQDLy9WzQ+dECpp0BUF6fQSc5jvhR34QmE2j
X-Gm-Gg: ASbGncvrTtkHGUHbwrDyW8nMvDl8f9RWLKoRDhcFH0eBh5HtJ2AV7oq+x62zuOnJEe+
	WqujzkfT/6GHfA33DI8cDdt4KjWTMHe9RoXWwVZFuQhqMtmJB02KKp1d4NePq08kyMvCddh6lPR
	WPdMYbU13Sxg7x8NHDj7UAQIIrBGw6YXPYZL8PsJ18/ytYkQ8dA2vHXC4iQELE8ZOGssMTpNTmg
	sVKuyCh2kSiPI0Oxt/sh2WSw8GKpLqu9UDSk5tf2/Zmri5Lor+gM593z+5OuKvg44p/R4mFecUK
	6LAgnFTF/MaVmIb4OU3imC+2iSMHan9QzUDzRM2anRapUQs/Pj/zTY+aVgpKKrhjtxoEgk9RGGp
	nyABvxu4F+59kKouHZzRLuf04fJh6+7KGQFPWKKVWtEYYYFa1R7iK
X-Received: by 2002:ac8:7f88:0:b0:4b0:6a0c:4dd8 with SMTP id d75a77b69052e-4b0dbb0e93fmr34807481cf.48.1754909618847;
        Mon, 11 Aug 2025 03:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmuGtn+G+PIUmHvSepqBOO3i5VP8a/jwabfoTmsqeozlnKdCMPSQhGrvgd7vbB5jonENpsxA==
X-Received: by 2002:ac8:7f88:0:b0:4b0:6a0c:4dd8 with SMTP id d75a77b69052e-4b0dbb0e93fmr34807231cf.48.1754909618333;
        Mon, 11 Aug 2025 03:53:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cae595sm4265063e87.155.2025.08.11.03.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:53:37 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:53:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Message-ID: <3nscbgwdgodcassyvsz7lpogkq6tz4du2od54wq5s3j6nb33rg@ot7bi3vupyqz>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXyY/72KckDgSq
 Rxdarpok2MPk9wWBHZu3X4JLSGzalxT608IWVPjy000dr5n8+/YyPhE7cVk3qGk2lz9PPpLGPaI
 xnzTCFut7lyWkGHT+QRRcIsI18ti7IVqiBPQTBLHw1MthO6+Wm6C0GKQUClgfC2FRiHYa56r3K4
 OT7hCyquX7oOOQ4o7AI24pjNft2kQP3XBFelYfv2bQBj1S4uztbet7xmBQOThGsmOjvPiAEV/Xa
 Y9VlX5LNk04kDlf+ojUofjDbKRI2VXtVb4jeNeucgj+hOjkj4SqazJ89ywqgNjQbhIAh7DoJ+Jw
 7bdJlL2skW8EJE5VfEeYCdl2810xbQjB7MM/nXFVo9dPz1LNAthaFsve20ZoJNJKOKIi87F7h6l
 kWGRtkh7
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899cbb4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=C6zRi97sj5SIB-rLV0QA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AAwUl8uKP5fpo4uHSImmA5nXDOflI1YY
X-Proofpoint-ORIG-GUID: AAwUl8uKP5fpo4uHSImmA5nXDOflI1YY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Thu, Jun 12, 2025 at 04:15:29AM +0300, Vladimir Zapolskiy wrote:
> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> RFC verion of the change:
> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
> 
> Changes from RFC to v1:
> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
> * added 'clock-names' property,
> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
> * the above implies a removal of SM8250 specific supplies.
> 
>  .../bindings/media/qcom,csiphy.yaml           | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,csiphy.yaml
> 
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CAMSS CSIPHY input port
> +
> +    patternProperties:
> +      "^endpoint@[0-1]$":
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +          bus-type:
> +            enum:
> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +        required:
> +          - data-lanes

 - clock-lanes

> +

-- 
With best wishes
Dmitry

