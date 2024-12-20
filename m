Return-Path: <linux-arm-msm+bounces-42947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E89F8F30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A44169B60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC8E1B0F38;
	Fri, 20 Dec 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXk8PPEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F861A83FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687733; cv=none; b=THGMRV+vgEwhiZ92VKG87uv+PF5EEzMC+mCVwkqZCG57xcPuUlL4GS8jOqGuAD/01CeOVWiPmtpbUXOLYxLcrlphfKgB3Pfdtla3tNh/7JVOUe2ud0BINFRyk3XbGOByshw1J1NUyujTVV0PjQaaGXUTdiNokdR/ihckZOHCanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687733; c=relaxed/simple;
	bh=XbNct4c76Ic9uCHPcqgGY5elj+bO80ByXs4FfSvDnls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocy5o7D0Z4wKjq2zq942a/047fQkvF3LeoCtJNq8+W125O00gjAswONHv0I5IJl1mVE5QipJEXL1zhbsDsp2r/OTacjL2DZVVPTKqvXYuSqkTepxZkhiWTIn15iR4IDmv5+gzKctRsVsWjg+Z4dLtTUZ5z2S5Ij/5hfErH49HSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXk8PPEI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5ejcV005092
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upEuZgACcGPccteNXGsHcBPQQzGSh0ZOSBP1SMmeJg8=; b=BXk8PPEIElthn9uS
	1RlQKDRU81nifa+wViZyd4TcddzOlJrAFB4RDs3kS37dSsbv6ZKfkXOGeJoorx/M
	G4Syzb1A+BIOa/qdOjZnPGZVtg5nomXkYAsmndSjs65HY3C+jlAS7rMShuaFW4D1
	x8Dsiyv2MUUjW6Diz0cevzv/Z6u/CtM6wdOjKrHgfBcKO0Yq3WTWt4MWu4RNjahd
	RWosAvYyxYfyKwW0gocmvkaVr8/rrcdtrCbo0YlszLIRJiB5jNInzAZj1Uo0MLYc
	sSXLsTBu4fuLyeZOXsMtuSfi856MpZ/OMsm/ja67FWvfe7lrqGU7zzXqZJggnDJF
	vlZAog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5rmtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:42:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e8153104so4247116d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687730; x=1735292530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upEuZgACcGPccteNXGsHcBPQQzGSh0ZOSBP1SMmeJg8=;
        b=H2O9C+v22hzBD1JEB6BorM+z0fwynHCQ1SKEwLfMrx1731F3dsa1k7zgiYHR5Ruf8k
         l38yz0xCyuD1n3EVdDO6ZHJ/565MUhUlPPMCw+JBhKOfLwdQj3dSiKG+HPIfXwFc0VUe
         +h0SGN8uJ6XmN6WtZKYdEEMhAzTA+tE9ebC4p420a7F508Zfzi/8zOlrB4azOL5EbE7A
         YJVCFt0Cgqq00FZKYGZE7enSqH8y7t/LPRcFxm+inTxQt7hXvUNQJhEO2GIuYtSEASpX
         hSuM+cevpUc7L7sCNmbkrg7VRcMycqRkHnZgfhSKJvrwQgxiMfxaWCJhSssJ8Fiute5k
         JeRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2lW3BZC8xCITihoen7QoNluBRBWrZ+h1UnlunUOMXrMvcDaTufT7gTtfhlrRIk0kcfSyD+vg+jLMq3QUT@vger.kernel.org
X-Gm-Message-State: AOJu0YzdN6kxNJaqUmIDxwfGb+VRxq1TnHEZSqZNbsBpkgIGWH/7nUy3
	jn2eyckCIY5Mc/6cc/h0L1isSCLZe7azqt2MGVqUMWV13peh9RCKFlDcKhb7MiVf53uJXGnoDyq
	KX7L76DmPktgrJc5h+IZejwt90u9F4UH5qHhX9Zfs5viz2TO2hg75WOoa8/QwmLw62RZfU77W
X-Gm-Gg: ASbGnctUAVsowy3+BmXbqj7dc95iAY5ZPPcGtv/uKWKWQW+ifvb7QF/ZFoQfEjKSXVl
	0ad4eEi8uQ/ETQ1eaQt4peJJXIxAYGIpMndWKCC0CXEI/CmNn+P9g5ZeD1Os/xllceuLpc9fSnZ
	niUpq7QgmjTOvjuBkIy7yFvdK1gZE+pO9Ne5DOrhOCsvdBL6zOXh6vHurkAIvXhp0iV76qVlRzj
	Yrfpv+fer1kAdjHGfhepGWT5U3s3mvjZ/7j1CpVnV/00cr7RBxiBNro0RVdifHXa2pT7FQfoMwz
	DDiS4yy5gFs/JIJUUtFjx5OU1mQSp9iUci4=
X-Received: by 2002:ac8:5d0f:0:b0:466:92d8:737f with SMTP id d75a77b69052e-46a4a8fae4fmr14883591cf.8.1734687730193;
        Fri, 20 Dec 2024 01:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfnR1C569lsJcHofBTD7Tj37idjv8eOfCgixtSaFptqF2Mtevk8lxBAJ7GLYBUU39hwBD6vQ==
X-Received: by 2002:ac8:5d0f:0:b0:466:92d8:737f with SMTP id d75a77b69052e-46a4a8fae4fmr14883441cf.8.1734687729883;
        Fri, 20 Dec 2024 01:42:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f595sm157358866b.10.2024.12.20.01.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:42:09 -0800 (PST)
Message-ID: <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:42:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for two
 clocks
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SZFBPaXzv0j1drv8aWR2Ejh05d2wbw_V
X-Proofpoint-GUID: SZFBPaXzv0j1drv8aWR2Ejh05d2wbw_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,

                      ^
                        freq_tbl

> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:
> 
>   [    3.388105] Call trace:
>   [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
>   [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
>   [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
>   [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
>   [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
>   [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
>   [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
>   [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
>   [    3.455886]  clk_set_rate+0x38/0x14c
> 
> Add the parent_map property for two clocks where it's missing and also
> un-inline the parent_data as well to keep the matching parent_map and
> parent_data together.

The patch looks good otherwise

Konrad


