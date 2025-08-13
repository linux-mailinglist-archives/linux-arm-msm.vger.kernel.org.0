Return-Path: <linux-arm-msm+bounces-69042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE682B25322
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 20:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59895A4945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05522D3EDF;
	Wed, 13 Aug 2025 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aed+iGeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB262E11CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110469; cv=none; b=nOvUgLPrbJQm6diZLO7lX8Myidz7WqrIp2O+sjwipjkb5Cby/er9u+W2YvhDFFGrJHbvht3ZILfbsHj2foPWNJZszGbbA45CgmWHbcpCHiUQgIA0kWtA9Pheu9UlGljNzpLgtey8P6Bxy3kMg+W27rgV0Ffqv0+4YzF7+neOHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110469; c=relaxed/simple;
	bh=eH9oi9rpc+k7AxxneQYhOC0hBZYrKLHGcN0lSh1UkwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwCBsrl1ImnKz34h2RtH5jb9Q+5xS56y0q85ULKn09k+ae6r2JI7xsEszP7jqmEF9Av/Eru9pw63MWrqqReOqNHzIr+LuGr8rZf3F+zExjnO/hm6ee0h55ZWHAYmhRQX1rL19nTGTosJt7nML2hBHsELm06ubuqPRwd1P8I4J78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aed+iGeh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLcg2002794
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NJMt8zZbyeh6EXv4mGiSbveA
	yKRS8h6k1z8cIBJj6Ls=; b=aed+iGehdXicoMpPnR95OeTqFraoNFsaZxfakmv4
	2LWMSU5teMYVNHh9NpnkLKGAu9jKe0kk5Bq+bwld5rIQDqNvW/Or8pWBpmMdUeXq
	8vP89WNngDLEuBKqNRYFDTohnbTjiexXrmuGVK/srs+FOVkQt+Jj32pT9t/7rYU2
	5c8Rvi9OcO+WAlJOtRuQpM6s/YrZY5z5ojlCGcy5UIdRcjpf1cg0SClcTbtDjzwq
	dawbyJRRbulB2dZo2gS75GMEZApT3sC+SeA+vfGVchciMSweXFBloaMXqX8hQlhv
	XnEF8RCNv8g6tJMrcHRL0ZjzT2GyXluMdonTBaF6mn9SfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv4wmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:41:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e870316b85so27190485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110466; x=1755715266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJMt8zZbyeh6EXv4mGiSbveAyKRS8h6k1z8cIBJj6Ls=;
        b=R1ebb0f3M9Tt24+huGrwmdAlzn+sKpBJjrVFDIZF7SuqbNcEWJMuiRKcGXoscgVOn1
         bcPvdawpwCp0vECPG1OxuA3qFfbD3ZPvTnxhYzegwG+mBtZrXsfi3Mcx0n+Wpa7QzIAP
         KkDLmOxrzSixUAPhogYyyKOjDQnCRYIK3WfwXwaPg8aAf2huxF/hMc9fMwBSsDyK9Pp1
         uZqM9/VqTiSwMyqZWrVjLSZAdlKuO/hILdrKzVdydFG9jmfjOrWZRN172c7V2c3AjraP
         IG/PIHhO4fp31OI7Gju9JsRLbRWgrowxtXYPF9IwHq/ZgELnhLeoAB0UKVmosk6p/WqE
         ctmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXFm/DdjF8aySsinHjYyYvTpNdmOkzdxeOS4sS/B/6Hx124awCoCeoxhMFvgvpYzt0hXdxBYX08qKr0loG@vger.kernel.org
X-Gm-Message-State: AOJu0YynU6C1yhPRAFdh2c7sG84xOjz6f52sV1E1tkOlitRNRS5PNmIZ
	V7kj5wCFENIDJwUZmhUdUiLoMMIvUZolpFvJEuPPizId18hs5NmJ2P+XTr7f+ZSSS/81QxuclFc
	mHWEVf+Z9rEzaXtsvs1YAy0IzGDKfFaIs9ijWXmAKZda0ScmvdbqqOq6FGLxgDjMfQtYH
X-Gm-Gg: ASbGncsjBpkId48QN6V6r0HgzNgzmyyRxHVgAsHAZZmDhWaI1y7XR6v/Te6DpH2B9bl
	D1wQG8ZrTjvBngKvFr1l0Ne3G+zWAvNkzQeXEnHgq2eDJVQsGCZXogwFhGRYljan3OrURJcXM+7
	z29nPxhEVQTEL5BU6l01kqhJgoevDRoZPjYyQiZdrOQizc98MWvj2ph8dhR6VwjW/ONPvXSU+e6
	X8Nu3aMl1kVF64vtZRj6Xu3PcBIZLR8O0UtIAiBCnxUom1Q8D4etYlrWlu5hpjGURC44oYkluId
	KQbbPCM6qQvS3HR4t5hiTuFaR/f/UG/jrsTyMV92mbcXMEmGL0jIC/RvNqZ/+F0H+WgrHt+bO6t
	uNeNYmu/XNYBCoyg6mMz0MNwrD3PlNqiXxa2c9HAdzv5ri9xEYl8Q
X-Received: by 2002:a05:622a:19aa:b0:494:b3eb:a4b9 with SMTP id d75a77b69052e-4b10aaf15edmr3855381cf.51.1755110466216;
        Wed, 13 Aug 2025 11:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4jt90DJnLvjoalbZvV3KYe+N5pVXmPZaC4JrESoD0j4ijiK56kStPrvbXWgLx5NYrU/37ng==
X-Received: by 2002:a05:622a:19aa:b0:494:b3eb:a4b9 with SMTP id d75a77b69052e-4b10aaf15edmr3854171cf.51.1755110464835;
        Wed, 13 Aug 2025 11:41:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca30c4sm5472138e87.114.2025.08.13.11.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:41:04 -0700 (PDT)
Date: Wed, 13 Aug 2025 21:41:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Message-ID: <2vtxgzwsr6sztu35zeebuho3ie4bbifb75v5usxfzcys2ufx4f@fnig7kqij3us>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
 <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
 <2ok6o4e5pz4ichhchycqkns2afzce5y6ppjr2av4yz3wc3iatk@m3cdck7csavt>
 <956e5828-303a-44ce-d41e-0f7b977581a8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <956e5828-303a-44ce-d41e-0f7b977581a8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689cdc43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=0tCpNLKLXZv0WORs85cA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: N_qTTZwf-IZQ82S6WQX08OFhA9x_LICI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXy/XV0XfWrrQy
 TQN0/Oehu3HPtVTLK0YUn3RQMOdzoDOcCCheNtDHsLlpj5runqbJGysA74YzzKKV45h63DVus+R
 l7bN85qc8Tnw6eM+dvz6TibZaH5zTGrtEwOYb1WDrgduZPrFTAWimqYgtkOsl0wyH4ES9cA+aZl
 pzyf0jkvj6E9vU/FsmMNl6QhUOeLfW7KyR+NPXMUhDZu4V6tmgHT+e/k2xtSJ4p2TC4787uKubq
 a72H8hzcoE6dajZNggkWBm8VuhLFWbWfZhDL9Gh1u/eZETYFokqgEyBxl53dyVgpIaMWnfFaAuH
 Ku7lWkFA7Kc7vR5+BT9oMwZHtGetvz+F0Uk6QDqZTqtDaL7JCjw3CC3i4LpIH6trlmZpPNA71N2
 itlR5D3U
X-Proofpoint-GUID: N_qTTZwf-IZQ82S6WQX08OFhA9x_LICI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Tue, Aug 12, 2025 at 09:01:36PM +0530, Vikash Garodia wrote:
> 
> On 8/12/2025 8:09 PM, Dmitry Baryshkov wrote:
> > On Tue, Aug 12, 2025 at 04:21:12PM +0200, Konrad Dybcio wrote:
> >> On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
> >>> Add Iris video codec to SM8750 SoC, which comes with significantly
> >>> different powering up sequence than previous SM8650, thus different
> >>> clocks and resets.  For consistency keep existing clock and clock-names
> >>> naming, so the list shares common part.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			iris_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-240000000 {
> >>> +					opp-hz = /bits/ 64 <240000000>;
> >>> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> >>> +							<&rpmhpd_opp_low_svs_d1>;
> >>> +				};
> >>> +
> >>> +				opp-338000000 {
> >>> +					opp-hz = /bits/ 64 <338000000>;
> >>> +					required-opps = <&rpmhpd_opp_low_svs>,
> >>> +							<&rpmhpd_opp_low_svs>;
> >>> +				};
> >>> +
> >>> +				opp-420000000 {
> >>> +					opp-hz = /bits/ 64 <420000000>;
> >>> +					required-opps = <&rpmhpd_opp_svs>,
> >>> +							<&rpmhpd_opp_svs>;
> >>> +				};
> >>> +
> >>> +				opp-444000000 {
> >>> +					opp-hz = /bits/ 64 <444000000>;
> >>> +					required-opps = <&rpmhpd_opp_svs_l1>,
> >>> +							<&rpmhpd_opp_svs_l1>;
> >>> +				};
> >>> +
> >>> +				opp-533333334 {
> >>> +					opp-hz = /bits/ 64 <533333334>;
> >>> +					required-opps = <&rpmhpd_opp_nom>,
> >>> +							<&rpmhpd_opp_nom>;
> >>> +				};
> >>
> >> There's an additional OPP: 570 MHz @ NOM_L1
> >>
> >> +Dmitry, Vikash, please make sure you're OK with the iommu entries
> > 
> > We still don't have a way to describe it other way at this point.
> 
> I could validate the extended "iommu-map-masks" proposal. Given that we have a

Was it posted? If not, let's get it ASAP.

> new binding for SM8750 [1] , does it make sense to add iommus min/max as [1,5] ?

Why [1, 5]? It should be [1, 2] or just [1, 1] + your proposal.

> such that later if new property is introduced "iommu-map-mask", it does not
> break ABI.
> 
> iommus = <&apps_smmu 0x1940 0>;
> iommu-map-masks = <0 &apps_smmu 0x1947 1 0>;
> 
> [1] https://lore.kernel.org/all/20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org/
> 
> Regards,
> Vikash
> > 
> >>
> >> the other properties look OK
> >>
> >> Konrad
> > 

-- 
With best wishes
Dmitry

