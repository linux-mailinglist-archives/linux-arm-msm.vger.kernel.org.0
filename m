Return-Path: <linux-arm-msm+bounces-71805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28426B41C61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B37BB1890540
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5782F4A0A;
	Wed,  3 Sep 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKPCQNP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19FE2F5332
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896789; cv=none; b=Abkm56LCH5a7FzKBQddGxfZfxIzqvxv175EYUgrOQer+k2RSOdCnXA06DzAIxX1U98UH200NohnFfJls0zGfRbKOb4PAKVXQYVn5TqsT1FjKEOZtGImW3aJgo5i4HZt5HPnB9zb+dbM6zqmaDt1M0ifhGAO2zHFoqL/VM9R6Ihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896789; c=relaxed/simple;
	bh=0JsCaLzzil1TY+KiNKyqe/k7zCPamDfM/hBakfXAQIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3vF8bwS7USW+BuisoxtJ6veeMgkuCtvoOrV8Q+pek7FOxhei45cYsJ8aufzMggK2SUyWwkJlyN6gdIp5KetfjmhTtCYKbLOZVFMw8Y7VSdEgIvVmyB5v6xN83i/iPlRPWTijfoM5s1jGYa8qXBnTCVksAXksZfpX/KgLHXEWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKPCQNP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AB8Ki021832
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 10:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nk/aD07bI4u37nmHFKVnLrthW7H+D84XS76rtbwDMsA=; b=JKPCQNP3EKr7o6/h
	Cpay4YV4EGCfkmKPvPOmBWcha6HOB1OQugPMveQIh71h8QmfD0I3bj3a+5cS4pO9
	ZyvNAJZoXMBVuY7IUZNWQaV0Y0+LiaDqGessa2ZxI+ZSzm8g7yx4IYLsqFOFkLSz
	HjBbEaNhkqffC6U3i6QEkVhDT/1xXo33Q+8bJr9gxpp+FCE3SKVZI3IPl7VyTHbM
	L9wyAKOutkkKH2mYtTSX1aOYru7yBVcIFTelkCRkyEqplMCiMK7G2CazRrRaXC2L
	0cM3Mk0mn2Iaf/B1U6FUNWFfota2tHyM16Kt/BjczWTayRdJhM6axyoYPWOWmyk9
	zkSKAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3e18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 10:53:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b331150323so9595731cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896786; x=1757501586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk/aD07bI4u37nmHFKVnLrthW7H+D84XS76rtbwDMsA=;
        b=uqWQisT4nQTyK60VrfO18ujz3THda7ly1ffBJsbuqaOSO2KUZWEw02uaa24muUvgTL
         S7+AaF79I0NBAHiCpFCFKDyFVJcI3S24oLxY9gfD8hnc7GD+FQvcmc63UAj3lQTKVk+F
         AJAApCA69Bjgk3xRQ26dIkkrKmLeTTFqcjK5rOlVDcLoZChCCjLad2IuhYKlPOKfUaQw
         VORA1qSYSTMJfVSnBVGtQ1e2UlIyZkF51OCqp4pv/8A/6WGCPovSnMiTrnie9/oIb3PG
         b9peqoSLU1UT8WwbULquDQDGK2pQJKqfHPbtGpU9z059n9Wp3I3n/2hCzg5zUaObwWif
         39ww==
X-Gm-Message-State: AOJu0YwLmzBT1RraUuwAKfMXyy6VbuXkFAFKRmy9l519QG+u8Fc9/Pg3
	kjK046DKf+T5z585a2wf1dF5bIWANw+WgJj/NyknMp6WZ1NXHMd2PmEa7KBMynq5j8NrvRVPTGh
	RBjVzAyTRROwfQ54N1NzZvBG2WzmkX1gOO0zUSeDn3aYg1I7D4pr2YTSanCzTzC90XTzb
X-Gm-Gg: ASbGnct/nsrsqn+V78E4tv6oJtuO86TcoJPzELFrHifBFzX0DJKk8Sp88QiJ54jyz1K
	Oa78nQPy5uMRxgshsfjh8JNMlERS2jcIldMKjlAH7Z8AhsReT9uLCBCE4o03zYjwgtL7VpXNF6F
	bfJEAzuLJT6xjauNirrcmbWq9LhMgXKtOBGUiP3Ulj71sCTPVbrxo90JZfahzb2IURy/mMyqHkQ
	aAkUNM1e4tvdEwmOKb7QkjR3iF4x7oXzJj8j+h4Q4uhf96d1XUCy79Z+WATuA3jvBWPkQtDoLQ+
	4CcEIuBJf6oRFTaa6/osA0m5YQ1v2kTz2T/SVGIyFxPcLfTnmUUyl4CyXpmiSjWVvLXtYBY3n94
	UF1+Z9FblYI8uZeBg2gdKtg==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b30e906341mr136817911cf.2.1756896785651;
        Wed, 03 Sep 2025 03:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6DHpztMpPTybl8ilZYNgYnaTyfWSXJC32t+1unhFqKny8Zv6s0B7MHj0N3nPJVj7uZZHvgA==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b30e906341mr136817671cf.2.1756896785056;
        Wed, 03 Sep 2025 03:53:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm931051066b.29.2025.09.03.03.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:53:04 -0700 (PDT)
Message-ID: <57e90560-2eef-4c16-84cf-cfca58240885@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:53:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100: add video node
To: Wangao Wang <quic_wangaow@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Qiwei Liu <quic_qiweil@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
 <20250903-add_iris_for_x1e80100-v1-1-410e9e6c79f0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-add_iris_for_x1e80100-v1-1-410e9e6c79f0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6SzgIkjbcyGP
 UfThruK/ZPHDjtd9gSrty7+Yb+t1GA7hkB4dxRz7IM9OzQJh2tISIqJgErj9k3e+Ug1z+uSUwJz
 yIqtFWSSi4xZyRspWls59Jxb9x11vuysKoCjlR32qhZAQpVA6Ph43JigWI03D2XZG6j9bN78vQd
 /NjjYf/Hr0gszYzNrTIWLqODwcrA955seJo9abOtaREmkq3ugsFZvtHQX5ABknEy/4HCCKBt25P
 E0cd5Po92v4rU94JBTNWKhken+RAwsAbuohh/yWhbwJblEGb1pDtNX5eBPwVCCBNnFXXaXKwWYB
 SZlBQcFz8rK8pByoNH7DWvOWy1YGRAqmnR/cKg2zLpaO7dKmZvkiWYBuqNah0e/BoCgarildDzv
 Txgr+06l
X-Proofpoint-GUID: GvaqXFiCzWvHbsp6QCOgo2Uv80wqDTbK
X-Proofpoint-ORIG-GUID: GvaqXFiCzWvHbsp6QCOgo2Uv80wqDTbK
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b81e13 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=k-zUgsc7-9G9n07UOVQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/3/25 10:27 AM, Wangao Wang wrote:
> Add the IRIS video-codec node on X1E80100 platform to support video
> functionality.
> 
> Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
> ---

[...]

> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				     <&apps_smmu 0x1947 0x0>;

the '<'s should be aligned

Konrad

