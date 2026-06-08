Return-Path: <linux-arm-msm+bounces-111899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KNACGTzIJmr7kQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:48:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231F656CB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:48:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TpUEp5hF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G2BUoylr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111899-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111899-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BC7F3014378
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED8E37CD3E;
	Mon,  8 Jun 2026 13:48:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349335203F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:48:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926517; cv=none; b=o4D7Ol3AXcuALfGoW7gxKhj7JG3Nwn/uhh1r+H8Q1vhaQlHEcewnUPlyKMNGb6WAC2UWd7qclsyTWhRGKNBnp+tDEfx15dYaqn3B62NYvkVogtxZjv0sCLqh/MHUkI8Cf0lFElZK/uqvZLdt2sl69pcoHVr/zwAGR4f5Rz77imQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926517; c=relaxed/simple;
	bh=PZ4B3OBIBssvfzWxhVQD2t650FvBAlhF+2EGFB6vkDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl51vBJRzlZV3Qpdqybd0ItxUVZApIi3rFQZpC7kUxLPzpnJLHaqmdtmqDmS68p/g/BeWERylEN2Gt1OUERjtIpjKdYTYVUrodJlXEG+UQuZYU3p8ovKdjRNAtFRrK7BA2DSVkGKU9p7HNDJAbLHHXCfZ4lu+HCIPHJtmeKBUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TpUEp5hF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2BUoylr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR9Do3763849
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gZMjcfL56nfEqXpkbtHqbJ4I
	XYaeM4YQuE8a5EedgTw=; b=TpUEp5hF4OSr2snKAVhZ3CwqrUqUi1H+2q5h0/ku
	QUktKmkVWdMq5/iXyGRRgBAJbDKI0cKuY1MQ/ZKjdzpHcyvO6TFdbqhWhxI1/GxW
	qPbzg7uDMuPIHIcnN3o++rsPeS31eFrB+e3vk60HLVbIBeGzVI0or8tXmE90Vdn8
	U9sEOPXSrw4WZoqoRYZoSlcpif8sQeSyk2uLMQot82LMjulxribpFT3Wo1fjT9uE
	YdkmAyw0R6dwe1ZaHtaxvhNdv02A/0dxFwCIhTBsZDVTQ4KGuQrmfGgB1hz+Edng
	sUK/zzkBBdxKMIzLjwbYlzY56pQe1md3KZ6W+mMnCsHkmw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8gyq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:48:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfe512e871so1979072137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926513; x=1781531313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=;
        b=G2BUoylrOLBQKcNvjm+GPoredjDRJnuQ1BW2OBydAVod7ugRBufYHTxRmErW8uE8iy
         5kdttjdLuNfl1Ot5PzfHbITW6TVJQ1oRFmnM1wl0ZAAgjfSiExFAwfSwGlTW8mIimL7R
         PFN7F6xpTeiLAKr6yS/QVQFDNJPSrrvi9N3aAqzd7xbemeKg4ZlzZaDYsETfw9bUxoLO
         V3/EW+0tgt68CUeHjk8zpsJMy2OGmAoo3rc2F9W5KmMwpWNEZr9tovA1Jo9jplA0Q2El
         SDBE6Tv2lZz56TjjVpqz1lbQMLEgPPwXyYx2V8zBPqUmSFSuoL4k2rtaJN0YKePujIDo
         p4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926513; x=1781531313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=;
        b=NWt8zYXR+xl23XihjH2beXB0GThLkvsTJbpDiWgYOYfVSm0Rs3OFfjIEvFZrOWWcL9
         gItkr43gl/Nn4Und5uHiVyk0sHL9fjYR9dv0eqHdrNfrOPBFNrjhQZ3g/LwEWGA5qI43
         3bWh1yQmT0H+K74XNmzMYi8jfc8kI4D79j/xQJ4gywHADiQI1KTpSip17RJMiFztPSdV
         5ipPbzM9Y8s2dFLbs29ocmoCz4htJmUh0Perhcno9O1wuiEc/XgKtdgKJnhPJTeNAQwI
         n8nnGTsvO+kgaiwN/wic/LAOfwSMO2QtZpd9JQGk+UO7mGhGPckIgYQkBid0DuPqclYQ
         6Lqw==
X-Forwarded-Encrypted: i=1; AFNElJ8TCbo91NoBmSb0OX3ggMZQrrdsvJcXp8kvl7KW6gyPaSNR2NyYpsK3xelo5Fklcm6qASgaYxgOlBZ4YogO@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5x6DX9XOtJDIu8J/92/4HOYj/nuKGWRrIMTFMl5SuSc/7jng
	86I79F0NqyhKu68uaD2IUufdaE6E0lzYMF1smFgimLv2kiba27ObZ7QqGEGwbvZBmUc8rs+q0Q1
	M3s0Yc2p9xNKZLhPJRHQ1a85j4Fel9Uf9FldAcrsdRFYsg8TIbuNYRkP/FETJUIvh90sYS5ODgW
	cNfnw=
X-Gm-Gg: Acq92OF5QJuaRjT4ngMponEIV17mn3od0EolB+wDxjSrxOz+AXVn+kZ9ZuU/ShQHzpW
	4o3sBHBcOb9iBVHvr4jrSRs3jvzOfN42zqMmY8JrdgrmijJfUHnqsX4rIsEB9W0VZTxXtH1sKLI
	5cmWTJ0KjqEQEHCGXFKyRuZ7/FF+/6o+77Tqs9RzZsJfVRtDmz5KolmNOlQEFmv//Q4MUsX8MJH
	Te7AUiPOHZ+2gTS64gcgvkDum/Qms/MwXiuQTACs44s1oMYTMvLc2Efi6LeaQm8g3JVgWIw/69r
	GnkLuH1FGlLisru/6r2MNqzMyHv8Uw3FpgCBc++bOjDIObq0XuCrVkGIPXGurbixgxxf9LreA0C
	xqsxqE0loKjMg+lz4i+oIi5DNo5gZnPdnsE9yF84JbGaECeFnSj66DU5YuC7FJDzXVIZh8jzx0C
	bZjUULzoIHiLiTN4XqfhLsseFaRAMOeNydeut7nuq94+jdQA==
X-Received: by 2002:a05:6102:808f:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6fef26cd8b4mr7121145137.12.1780926513415;
        Mon, 08 Jun 2026 06:48:33 -0700 (PDT)
X-Received: by 2002:a05:6102:808f:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6fef26cd8b4mr7121083137.12.1780926512933;
        Mon, 08 Jun 2026 06:48:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed77esm3885124e87.17.2026.06.08.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:48:30 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:48:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfXyh+SHisF59pE
 EZQP71SwUN2doQt00CBwvFOc5RKefVA/ENUBtzlWsbKBLEwYNOFnl3UAWgKBQIpeUrOjfenuphI
 w/Wgu6YK7Ih/PlaEXdWNemRaR9MgtsoCwJxXOMbZOxGRGcmUuBNysDv/mEVuwsQycFdSsTH/xAr
 FeeoMZYdsoO9PEpj9Jy+FEfOoChSA8/ygm9vLYTyuZJ9v3Tu04ZhWtkAelIYzmXehtlL4V3TWD3
 V3ylXwv84NERovfNq7NqXROWm24Sh4wEXdC685NUare0rgZFEl7Vf0OV2+KwsHkW9beHbF0EuOK
 9h8Df8gsYPl/IYEEuDwRmr0LViROUYD9763mcSBiV6MPgawpG1p3D9J8S7OnP2xYAmhghONKQbo
 VG9BzntW6AdZpsOX80cm2+xaJ18uL34AO77o1UPSq0M82jddauNmwz7yf7jCSXNd9i2krbPjhcw
 6Gr276byq75qUFPE/+A==
X-Proofpoint-ORIG-GUID: pyTcD2KDH259JL2CzZXAoA9A6bDjTL3_
X-Proofpoint-GUID: pyTcD2KDH259JL2CzZXAoA9A6bDjTL3_
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26c832 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3fmthTPW8Nr5gDDPHxsA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111899-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,op3qmkovxz7o:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0231F656CB4

On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -243,6 +243,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -602,6 +609,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500

Only these platforms have the interconnect which needs to be voted
upon?

> +            - const: qcom,adreno-smmu
> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500
> +    then:
> +      properties:
> +        interconnects:
> +          maxItems: 1
> +    else:
> +      properties:
> +        interconnects: false
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

