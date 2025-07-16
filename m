Return-Path: <linux-arm-msm+bounces-65299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B92B07A10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D30927BDBFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F92327991E;
	Wed, 16 Jul 2025 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/Wx82xZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF2B26E6F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680185; cv=none; b=TzGay5NfReryTIo1R8iDfhfE/YpvaFtQpg4+fJavmKPB47wnmCXVSaPS1Ot3qIpTQTf/XXdZZPsuutrDe8jfclNQVD9UFs+PyD+Emo3TzxiWCD0SVlElyFhabv+gnIpXwInkWE4ogTS9sjyLDiTZQChItPP9lyn5GdqcPFa168w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680185; c=relaxed/simple;
	bh=t7DSi05slPCkN4UsojGxy4oP5CIR3/pwbBY7inCPQo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBZRQ3us0zFofNDE1WTB6HuNbtIoiSrIlFmyu3Fo4WTr0zTzTeGPT56zvHqWSt7ZGAHmPVwMi1BKf+w8qSWxkPehfgnuZXbUx+utqFGnK7a7NDQJANpUIhXGc/vY4YFEQJJeY0DJBVv1d2zetgI634VNYxPjkk7sMZVedNpaeBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/Wx82xZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD6oox024674
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q7Y+AqcTKt1Ceta1AaX3XL0N
	rlaKK9iAw6+wkY7W8rE=; b=G/Wx82xZSe2Wc0oWbzWkzHTDG35xXiA2MkyjjaVH
	sqVYAileg22MC05qJnFNUV+8vjzDAtcjKYzTA5bI87UXmzNmt1hzYgc2x5Qgzah8
	vsbMNiFZXXohjuSFLiyC81WKdYYBnaYVn6bPkzKlPonuYiBArFFM85OhMCKS7Crn
	oRIMR0kz7XTJn4xr9S2UDAcVzebIPWlbVtNpd032NpzHuht1fCeFYPZp8vgMmLDK
	9fXDGNBTaFAH84h5EmC4uqSDyT+elVrP1izxx4pqylM0IGvnt9jIyBqtO3594eq/
	+3UC13+ffAndvuiU4vhXedqJGB0ju7FJsxLVthcJKUZsNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpfg2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:36:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e095227f5dso719025485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680182; x=1753284982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7Y+AqcTKt1Ceta1AaX3XL0NrlaKK9iAw6+wkY7W8rE=;
        b=sPmcr6a3QPwJ5rUHbKMf4ayyIqZU/VUwvmYlatkftUuatTMHd12fB46kvuWjsBIKDm
         r1I8DF2mBD/nGEkKyazFDftVSle4XHYCItvrmIfv6Jd7UF3tHCiJcUs+JHhh8aTMlgPV
         lcNXFmVnDDJmW78DFSLxqOPoSrxY/x2U6SHSV+LUxcGf0kLhMTANGUhs+01KDoq9VZ88
         Sa/21lieMWb88XiDqA7EoKQ9Lyo1ULdRtW8cfzDF8chlsn9MSo+ucUwPhREs011SGl2/
         PJAcLJ2tATLc+3J2WuEdIQrOq5U4r4uzUVImrwVKvVrsFnfTlf+WAC423js/BSaeqfWD
         bpdA==
X-Forwarded-Encrypted: i=1; AJvYcCXhw5TA2IjiPf48Byn2d859Vhv/Rb73nER/38vkW0vZX4epBEwcj8ltKHeG0pmcQv+VI31LRcouY1WQh4sf@vger.kernel.org
X-Gm-Message-State: AOJu0YwCs1VCmAFHImpeRdARAe0WVN1nNQOzb91aDHnQLRdqm9BTVRDM
	lsZwqLFFYd10PI56vLj5qrdzFG1BQkwxv3zX6N/JPv0NC3q7iv7Mv6dxVh81pN+QZUW945Bp3zZ
	gkWjt27rMl78elCr7y2919LRNk8I75bo7FxqNS7rKqeKz5UXZB04H8T0mmcFVbaAyCJyM
X-Gm-Gg: ASbGnctFY40Oj2AB0buXnJ1pZ3zIBurC4uhGI5TdZgNyO2Oyhox0yqZ9O87eAKxuS4/
	yS2+kPUqxguKO/4y/IjBUkLZ79rv5pHj5DnBp77HgtKkiPE7ilUaCqxKcDaxaURvzaHcALKsYSM
	8fC05sNkcI0KkglxPgtOHBjQmPmc2qAxEOkyBDXC1cEx1IzdR1Fw94H6mIJu6HEaFEKe1IoY2gO
	sgwHBz4c41J4soL+oQxmGy2flqLBsmC7MMW0V/JL+Vdz1IZAorJ31BPTgLrRLZZOcLRUtqH3Lzm
	ZW+xOUE0VjnPVfeV4g17NiDtgavVURipXMOPHi6oQyTnYYAFaiSbA01oKj9KNN7oCFc7ayXumxJ
	E/f1k2LcY0uP3yBzsKbrHBgNS9i66VHxGz6Omr7KFfA7nbzCKRDJ2
X-Received: by 2002:a05:620a:4546:b0:7d7:2647:da9d with SMTP id af79cd13be357-7e342b5d5d3mr506342985a.42.1752680181216;
        Wed, 16 Jul 2025 08:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhZ0QjrGWwHaDPGp/F9PqlexGFcR5X+X3OWVCipgtBtA0DpbAzcIF8dPzibaOM7PevWMFHeQ==
X-Received: by 2002:a05:620a:4546:b0:7d7:2647:da9d with SMTP id af79cd13be357-7e342b5d5d3mr506335885a.42.1752680180581;
        Wed, 16 Jul 2025 08:36:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbb5dsm2690071e87.18.2025.07.16.08.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:36:19 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:36:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EKO_T PLL
Message-ID: <3exm3tytxfyc2f3vwah5gkxftibf2xrbzowe56gbgtk5j7as4j@ocnobxe7dspl>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-6-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-6-pankaj.patil@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfX6vDqHbw33hHK
 SinEy+ZoV4S+zIS//KFzGnHlsGyDLP48VBT3n2C1V9At/sMuY+Kvs4ML4H8m53LU8ipDC0U+5ck
 3t7Bd1wYAFD2mqAWbQCz/bqIb4nHvsQflBdTpJiGJOQl/mM+W30u18RLhuijd19nvjqsrlgSiyI
 CZiQC91gRHB8bFZh62mi41TTPFirvR0x89qhjD1frkc1Go5NJQOJgZNNb7k8eOyb8lXkIaKYDjx
 Zs1u7WwVNWORIgmonvDfP/as8rky1ALAM4R2fb87e7al3AoFDPmV6aoBNmRnKTkdTBYubJ7lQAQ
 /iaCD+s5irvjh0uCYZqtZfl/ujzxafIFPUQpfhB9ZH8xN1ml8P+Vt6iUP8gA7H4ahQ7/FsA/QuG
 9htUU0abP/UzGYT+42QUys8RjTXm6RTw66H+Wx9KwlA8ReW0vEQggkHdKtmqEe87/Lji8gsb
X-Proofpoint-GUID: z33H1jm3U5NWrDLCniUQ_pW81njmb_8A
X-Proofpoint-ORIG-GUID: z33H1jm3U5NWrDLCniUQ_pW81njmb_8A
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6877c6f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=zIiPdt3-swY5NxfCfPQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=950 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160140

On Wed, Jul 16, 2025 at 08:50:15PM +0530, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add clock operations and register offsets to enable control of the Taycan
> EKO_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

