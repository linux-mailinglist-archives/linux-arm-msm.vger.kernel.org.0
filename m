Return-Path: <linux-arm-msm+bounces-116990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a4sYDkDoS2pUcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:39:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB53713F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:39:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WH0qJUeN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RzO7Ep5c;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116990-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116990-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19F8E301ABB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26AB3ACA65;
	Mon,  6 Jul 2026 17:39:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E213B47CD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359549; cv=none; b=IPRZu++Lhm+bI4v1Bfa4bNPmAGL3wmfEjyy/JB5o/Pnktlp/F8Rwdrya/d9mrwIxMNGJs16HpfMNsCugRvXaRbh+hTG8N+hKdlYVTCQX0EEI4mYranzy3RXHJ2tcG2jxr518pQh7Cpw1GxooR6jhg02tBTcGJ8W5dTGRuIMzWNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359549; c=relaxed/simple;
	bh=xre1ylS24RKmpgFEAZDl7Niim2XnBTvW/DrmPOJ6a9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpmjbiDLKfrVBjpvL42Ikob7ovw/eXg3DrtOzxHtvlbmZ4PdgfTBtvHg4jA10iOVrU7gq4iQBofgilgHuYgjYfOZ5xktsivQ5IZBxvLJ3787o/Oeve3GIhI2LYSBNqBIUaITIkk2ciDNeXr+FnKKfxCLa9IqD+09KFoSA/Ajm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WH0qJUeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzO7Ep5c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF9gb900738
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YGOdWSibWy2J+WMzG5kjYx1/
	GW5ewADeIBUplqEh2Mc=; b=WH0qJUeNVYS7Hd/3LByKsTPskXpLO4fmyO/Y3ydE
	IqVkCbncnX0WmHjSLfMyDdk6T/Zy6uuVUaSSY9492sNMmvdaMcFtLFd0xPvzzLrc
	rsouCxI6KHCQ0MJdYSb4ILsgh0qy2mSoz7D7+Ly02Ee+N+D/hJ0sIZ3d1F7s2L5p
	qym5hMMAOTODns2f6b2r/lcRmvwTJLxJ2fMRngyLx6YwR4Of/7OARmvm7R8EENq9
	fwBGw2HAo219wcBF0Uyn807adlS4Te/FLJ9iaXC/2D94MjzWD229OgBuO8kT2Xuo
	VhN9KWNNMqnGdoCvN4BcGYBpdfEcjsXOIvTlQR6TkbjlCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jsdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:39:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so310374785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359547; x=1783964347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=;
        b=RzO7Ep5cED2g7IhALrayoP84ctM8WwZuUTX0enmhZRGPH6HenLOumL/WZVkUcplykG
         ydVBA/T6dpi/HNixuT/vjCW605Hccho0wR0OwmWWm9lUPBps3n+KXEALinCDYr+7Km2g
         +F1Lezv3eReMzARNvvMb24htHQjYCIVVLv2s9xPmO6Zub1j8eNXfkgSV/ai9rqU9xyPK
         t/KUGKGOx9T/zkqq7CVC5wxYqu4sUrgulhhUEpTAB0PXWF1dAEdcFsMK/Pl9Y/k0mSU7
         8sscJdOi14hBVSVBS4SDjNRZUkz37hY3xWcx4IoaZ+fBB2pp9AUu/bI7rUo214bfbfaO
         DMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359547; x=1783964347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGOdWSibWy2J+WMzG5kjYx1/GW5ewADeIBUplqEh2Mc=;
        b=qN9U172QNVONxYaTYM3PXENtF3qhdfpvKh4JacjyJxLBum1aBJQK8iEBwEl58ybfXF
         L1rlBDSUDp9xSJJXBO/aHQEWColMpyT4g3kknjGPacNnViQ6RnP0HpW7VA3Xf38tSfd0
         blI1ilhBQ9nOpiJz7QynHZCxwm3+muZJpfrnr5Hp387FiyY1DUHSUoIFMfs1dzjP/Q9y
         kbhaIO0K4QKMcBTr41Sd71TVgd0FaUHdCFKN+/SOSfweKjPP2qn40eUtaNI9ZWiD7FKM
         o0BOtv1CnfZ9Lfd7+mtwHaEJS54Itfn8ary0GeF8E8aeMfRmAJ8336/qNhdWrM8aMu5M
         Jwew==
X-Forwarded-Encrypted: i=1; AHgh+RqT2PR8ZfiijRt2nB9DP8dwcOCvZaI2bygbWfkQfw/1NoLl77OKAkTAxIefOs3XND+TCdtg0m7cO51a7vk2@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIIoFFLBbfF/GJIOCD0pqFw6C4ZkEEmqYPtuMsq1jJ6H05XUY
	G5J785pCkO6I9kG3wEfJ5WISj7exTvnnlC9BuefHDmMLGVax5Tdjm0r5oBK9kjHw6tyd8JfGEsK
	dz7kz9R59URU+vmvcJaOFBvD1+n1clNTI8Fycs39DsocO2lC3W6/u7bgArLHt8iCrApmA
X-Gm-Gg: AfdE7ck5wMls2yanifG5I7rOX0oI9si/1y6TxaU0I//+Ru7p4cG2GDFfp2IcBvP3pkW
	t8cy1onMZoCuKxTsLMzH7UxJrAdHPtKAM+pQL9Q931SFt6mO3PAVZNAkLaU5DoutFwsEFDMMmYp
	fV0T2g1kx9swhBr/t37hfOM5Om8/ydFz4ormV5SJGzd71/0bymp8DGDQBLZX1Rk7PFPBWBt91D6
	6sAHeR4UrYZVRyfGDH7tV0VodzDS2SczRgThV+D5GLMiiYItm+GAqq8BwyYnCVU7P3JdOBuSjv0
	e3KGftiV1ACdsUbO5LU9q8s9kjjXCM4o7Hz5Db5TkVE8xgwJm0MQqnT6xgnolveNwnENjXNZUxZ
	/QNgbfYONb8O11G74lLsaTZRN/SZqhzsdcGAj/DUBHFSnMylpS4Uly9sZmpDuCQxesIv2oVIlR3
	yNBMvk0v9o2gK1GBeBEQJGlnhq
X-Received: by 2002:a05:620a:2904:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92ebb529002mr232274985a.15.1783359546221;
        Mon, 06 Jul 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2904:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92ebb529002mr232268285a.15.1783359545628;
        Mon, 06 Jul 2026 10:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18af2sm20869461fa.7.2026.07.06.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:39:03 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfXyPljqbOHFC26
 vW/76uVGr2G/2Q4fzHiit7hPDlOSd9Nq+VMXhf1aQa3jox9tw8sdftU1I5m5qv+K92rlBAPG2fK
 AUhqZHshmXNWXBJwysvTSVxLoPQuCembLQr/oTFihPyYQom5Vi3FLoLeAgC42E/hssGCfTXE+f2
 T1vdAgReb+lVyNCULfxk9RngXb6iDhOYyaELdxVKKZSIEHQCqX/Vyt+0lKFL1a0OpoSz/JOGQmN
 cNtdBDvlYAR4oxo0us8skrcDnV7zHPp0W6Pln8Z3E9BCMeCHw4yu5CRnE/+rnJxOWDzahamx322
 T4qyfXhc1B/zhf1YvUDI3bElg2uIYQcTMXyBIGX40W9pYcTp5VUMy1dnkkTL2S/HVksKfU1lV7k
 RKT2FX4lJQDthoysXP0MISRhyE0+xr4NlPz2ZkINUdJFN9yrC/qTOtaLj3uLDQXgqKcY9CA08SC
 eHH34pXZLBQO2sO9b5g==
X-Proofpoint-ORIG-GUID: hjPMvVQNtyNj2ew9sQVUi-G8arn55zDm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfXxVW5oTAWwWhJ
 4Tqfc6nbuaLIr2NE0OeojlYPBSVT4r/EAF6UnhAlUYKjDWFlraNkOVsImXXcgj8dGfpWZt/qnB2
 VsgD3/1UxjfjxpTnGOF9avtKutT8XB8=
X-Proofpoint-GUID: hjPMvVQNtyNj2ew9sQVUi-G8arn55zDm
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4be83b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3fmthTPW8Nr5gDDPHxsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060178
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
	TAGGED_FROM(0.00)[bounces-116990-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,o4xei47l6gcj:mid];
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
X-Rspamd-Queue-Id: 9BB53713F9D

On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional

Why is it limited only to those SoCs? Is it also applicable to other
Qualcomm SoCs?

> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a701dec2fa0a..fab8944d7b63 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -246,6 +246,13 @@ properties:
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
> @@ -644,6 +651,26 @@ allOf:
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
> +            - const: qcom,adreno-smmu
> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500

Can we be more idiomatic here?
Something like:

if:
  allOf:
    - properties:
        compatible:
          contains:
            enum:
              - qcom,qcs615-smmu-500
              - qcom,qcs8300-smmu-500
              - qcom,sa8775p-smmu-500
              - qcom,sc7280-smmu-500
    - properties:
        compatible:
          contains:
            const: qcom,adreno-smmu

In the end, we don't need to list the full list of compats. We need to
specify that it's Adreno SMMU on one of the listed platforms.


-- 
With best wishes
Dmitry

