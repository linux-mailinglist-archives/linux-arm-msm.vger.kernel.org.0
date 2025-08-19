Return-Path: <linux-arm-msm+bounces-69798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE37DB2CC27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77FD7B29C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687C630DD37;
	Tue, 19 Aug 2025 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6VzpCZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7759C30C345
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628564; cv=none; b=tt9PSh4xhmNwbPhsYGxr0VvSN0NeNl3263GKIzB1aDekyooREYWTPeOsjtYjK+ZeIyGfm87pdQ2Lj1cD2k7At8ccjSExqjf0qlJqSDD8OIIb3+KD0/312ZFvvOXR2SpxPVaNv3o2Sd58rRLHjjc5UZUID07rk1y/vky6K4lqGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628564; c=relaxed/simple;
	bh=sTgf/CNCkxGhEaAwMV5unINPuICI+staVH3F5LIk2ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbcU5SaZsbyd4eDhXrj15BT9XQCaSmjYxu0TNIagxJCwlzRgLjndSxONHZzSEwjZAaEr+S+NygPtOAiiJq74vC2uW/oucPYdoyLFIwykxxHK0uh7gtkQSiGnie/xsFArlMuyChA8k8ctjK40p5YPq6AOW0CocAH8DDzg0bWeAFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6VzpCZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFKt46005503
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o240rpXb1npe1ccsIe0LIiBv
	/L8C+NSjEqGnuz2YrN8=; b=b6VzpCZf/0uYO01WP/f9h+p02aXCBYd+sRRaZtT3
	C7YQEOhHbR0zykWWrlqAOKk0UZ4UbaP0XQIUDgxf1D5g8MCP7QK0qtrgxldGqMFc
	VT5Ywg8FHXTLEvcsUh4+jUYU5+B1rETKver+48vO3KuLqZbEmcJDS5ftHSC4GgPZ
	bKCIhEOGiIcoYt7E2iEJ58RUkMgrdNGaIDNQXkYTIJxoKQrOsKSelhz3dAvxLESm
	gBW/3n2e5NfC+95lKeMb+yQ+Me+E3909Mb5cOMnPCttWMOOVizhYdmCCZF/B2dv/
	4SQ4SJ/lvBrO1wSsfMj9Pz6tKssgpOPPIj2ejj63nnPk0Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0gmc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:36:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88daeb18so124577526d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628559; x=1756233359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o240rpXb1npe1ccsIe0LIiBv/L8C+NSjEqGnuz2YrN8=;
        b=UbhCIRA0UPWqiZKzbLLvCx+KwkZtnCS35/13CVe4I1NWkvBN4ZBxcfdD8NWWX2nkkD
         R8r5Fql7ujBFa7SC3x0s5Sz/GFDXPwSYQVo5aN5SWFfXP2IvKC5m2chA9jbGBp7pHLhY
         XRltc886jfSPRsD6iP62x5ez7NclK5p6ZrwzQicESH88gm84gKfXpRJhP5k9Q9ZADQFn
         jDQlJl6dOmzeocKTLNALPwSO2MJBq6Vw7fG+TJO27cgNBCKLox2HTDxYbyzFGv394oQn
         QEMjGsXIl3Pg95AyGDngIuNHTFZcrLYbLbN7MmDVKcqqXd3H/a9drtrseAJCnlebbVLV
         rtlA==
X-Forwarded-Encrypted: i=1; AJvYcCWJIUm2XrZYH6pBIc1CjpFHPogaTO24aWjbLQ4XzYPjvxkXvr5ZFIFFteobALFPTI1HijRlvn1ma7avgedw@vger.kernel.org
X-Gm-Message-State: AOJu0YzWJRN2CBLEa+ffcltcziurG8C5dL8Jy2YutNYfZNdD2yvZIZte
	2eQcrsD4zUnJuPxGPQVSS75x/G5hibvST8aqjXoDrdGqQbk53g0ZFas+MzEK13DKiUWgkA8Yz+4
	4fMGCYmVOm0MdkK3+7SuPFfxk13GJ6cE2zhPZxFtmAbInF2LYMH94UHemmntbYxbHpWls
X-Gm-Gg: ASbGncsIp2eqj0JtG95h1yluangvz/eJRWAy6Gmw9F9tau37MnEyUwg67mrF7Af25Bz
	oDoGJHc7+eWBVIgFvWL0jof0s1YPRbVjISXxDQuOrDXx6dwTDOiQHpAj4A2mr4EcUmbyS0aGf1W
	4xh0Fnvo5vHxgR2aut+oXmev3SBwt0wgHyxyUEcE/4JhWUBeYTg5dCyC76qaNtT73z4GoDuuD3f
	jrYfJxAba8Rkd1ZT/qcqSiDJye/lJAqjKD8H4q4CEx1ve+19IwoiJ5sKLVHVmyhTIoDn7WfcoUC
	/FjQHE6vrdHSQiHqC7mthKr5449+bfaXQQ8Ufi5INy87vd5NYAQfTAPhmwHVSBLgKMoZdYu/vW1
	srxtkCAMFx/Kwkiv6Lwn1WcfViB0ytLn0W4i2Fl2L+QyoAa+pY7dY
X-Received: by 2002:ad4:5cad:0:b0:709:e1d5:2470 with SMTP id 6a1803df08f44-70d76fd26bamr413946d6.20.1755628559307;
        Tue, 19 Aug 2025 11:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGmlAw5ivpCYe8dKVhVWxeKp6uuPutspQzTTRywH6aArEi8XXmLCe1KM8UMGq0ZEI0zbNZ8Q==
X-Received: by 2002:ad4:5cad:0:b0:709:e1d5:2470 with SMTP id 6a1803df08f44-70d76fd26bamr413576d6.20.1755628558770;
        Tue, 19 Aug 2025 11:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3516bcsm2227934e87.24.2025.08.19.11.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:35:57 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Glymur SoC
Message-ID: <phbil4fflttlcp7s4nxyceyb2a277eablveozggloufowwzplu@c4a2mrtnfunf>
References: <20250814-glymur-icc-v2-0-596cca6b6015@oss.qualcomm.com>
 <20250814-glymur-icc-v2-1-596cca6b6015@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-glymur-icc-v2-1-596cca6b6015@oss.qualcomm.com>
X-Proofpoint-GUID: JjqOwlxT9d9Fg143b081Xq7xC2E9Jdgl
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4c410 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pDoijQcVg5aKu1OD8A4A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfX9CA5jqKdYXYt
 n7fWE2AyE8DnLK2cxFfzdmNFY6PBbqiw0/pdwjN1wk6vMu1L9eD8Zwu+wEn2XybMDKdwwFgCasN
 VDr3vZpOl99YVI3z6RB0ZcZz+zYrxwy3ft9S/qTK2CR2TK2oAfqHVPKq8m3SGwvcRs814v7b0Uq
 +/lyGPTh7oZUBmuWP4Uamod//kN2KlME7HYt+hL9Xt9e5fdU4+1fbB2ukga14X5UPUSKh7zgb0a
 6l+yzOK3WEFKeDExlM/PtYD2JxqcmK7UiJrRiRlv0kAMmplISAgOsVH/IPGQN+siMgvIOS4oytp
 sL6WvD8i6nm9Z+VpZk/fFLPnl88y2szRsGfA4tdEOvvkJvtE0iiWE+94GFYNwNOG23QAEVAk11G
 uF55Uecd
X-Proofpoint-ORIG-GUID: JjqOwlxT9d9Fg143b081Xq7xC2E9Jdgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143

On Thu, Aug 14, 2025 at 02:54:19PM +0000, Raviteja Laggyshetty wrote:
> Document the RPMh Network-On-Chip Interconnect in Glymur platform.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,glymur-rpmh.yaml    | 172 +++++++++++++++++
>  .../dt-bindings/interconnect/qcom,glymur-rpmh.h    | 205 +++++++++++++++++++++
>  2 files changed, 377 insertions(+)

> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-gcc.h>

Please drop this header and use ephemeral clocks in the devices below.
We don't need to point out particular GCC clocks, using
<&gcc_foo_bar_baz> is more than enough.

> +    clk_virt: interconnect-0 {
> +      compatible = "qcom,glymur-clk-virt";
> +      #interconnect-cells = <2>;
> +      qcom,bcm-voters = <&apps_bcm_voter>;
> +    };
> +
> +    aggre1_noc: interconnect@16e0000 {
> +      compatible = "qcom,glymur-aggre1-noc";
> +      reg = <0x016e0000 0x14400>;
> +      #interconnect-cells = <2>;
> +      qcom,bcm-voters = <&apps_bcm_voter>;
> +    };
> +
> +    aggre4_noc: interconnect@1740000 {
> +      compatible = "qcom,glymur-aggre4-noc";
> +      reg = <0x01740000 0x14400>;
> +      #interconnect-cells = <2>;
> +      qcom,bcm-voters = <&apps_bcm_voter>;
> +      clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +               <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
> +               <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
> +               <&gcc GCC_AGGRE_USB4_1_AXI_CLK>;
> +    };

-- 
With best wishes
Dmitry

