Return-Path: <linux-arm-msm+bounces-83976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C8C97894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C636A4E1AF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3303E3128D0;
	Mon,  1 Dec 2025 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcyfNaYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvS5ZkIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF6312835
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594951; cv=none; b=U9r5C95PQ7b3gSuvGUApysijGq/SFqS4gFG23geOtWtADFX32KTydhxZ8Efh3oCP5DX6oNQ/hb4FMAhNmL3TzuvxU/AU4TOo4Q8BBbEuRjBjam4NE5VcFkvhkDnhRumPVznJC97g7Oe1iatziXHp5bhUK/pilNh7l+Z2VS1dzh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594951; c=relaxed/simple;
	bh=nbo9Gy1z9me7RbbbLnOg4ADpNmVnEU8hm0G2ysDXIWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lt7mA0nI4a7xtW1u7Ckirz9BtD+nmHBVobji4SBS5F5IB4DDf9NA11tP/78jQevkh5OYLX5HawhlMjBWObDLhJcPrKF3hSHKAu8O1qvIS1PIubnnIP3C1AxZSXs3AZI542D8JnBwWaGHeVFdMGlIkFkTZumiqRGi6kUsqQgIKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcyfNaYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvS5ZkIG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19rHCb211939
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=; b=ZcyfNaYE3hsYKWhy
	MjTAZJIxEM2TybhgAE05GpjxkfRiBf77qzbGyC88uK4tY6zjfTtxTjW5+PJALtbl
	6PZ9Wk/G19i0HJclMgzxFvyOTugwfHKOAoU/cAvjaKRkNYtVzjHen95AmaURrcUn
	0iFL9GuGtAhCGMxZX9POJuzGZ9yKAnRwWqxhpbcqm/sgarTjvECBsh9pNb44kjQO
	37mPAS3/nGeaOZwyBdGB5zYP4KLuqWS96nTZKLrzdNE+/+U6C07GE4/9eaw9Ihpq
	lA8P6RMKG1tMXHyT0Cw+S3qgeFets7YwkTIPh0UfJ2FNd8VZcrHdM+dq7WMdaaOg
	eSkABA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8sj0h0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:15:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b227a71fc6so66520085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594948; x=1765199748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
        b=MvS5ZkIGCxhz802jj6+PT9Jo26BpXyOcom97k/i+NUG5jV98UlCjdIgkbXrgmE6JVy
         XDZBWkEKixNWwdg66FNhRyjAPsSCg2i24q5T5qe7TkbT0Axk/MeUDxdPatTA7TalapPx
         I4eB+/M4yCh4KKJNcCbC2XJ6DsrFb2jy2mLILzPkLnmnOKvMN4tJVTeWHNut9YuH5L2f
         VRr5gnJCokQNYZCdRCuu7v5lZod096E8sbhzaWlTZFBPUhMa0xyAoKXvXbg0WPPkkuA9
         4sCYgOIe7Kq/WStWMfp4c1iji+JIdOVviRxSl+f73G3fOgjLAxVCikLYTmi2HTEKlJ0w
         2v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594948; x=1765199748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
        b=CZbXh9CKY9KOlBTXkhv9+LKmxkH8B3GY4QD3xkKtl1rFW1Wph09XJVx7rRDXQU+JpD
         R3ATLJPoBLFe8bDKe6Qha6nj6rSTQXA7KSIx1hO4NSnQZhLOyW9TtdC1rAKEh8ZIFxBB
         hRWLXlo1qeQDaGigOpc9MygOwGzljfYtX1+6b6tOZasPH3hIK04UDa5gAymR7GAROwdC
         QcK+uy2sPn5FGH4dnAYH/5q3JssvMbSHd+HLSv7Wen9tHkKPG5KjdM4ppg7S8RBTNGMB
         WjvtEeQeBvyBwO3ZnO7ZqKNPSmadXEzkRpOFtV+3MX1V7SdOtQgDM1D4e1Ogh194XRXV
         auYg==
X-Forwarded-Encrypted: i=1; AJvYcCU8RL4rqZbRd7aZXtzqqII9gCimLZYzr6LIrCQjkdffLnVjXOSYL9uaRnKikV5Ap97GpQ8TiS0cxxIgjs9c@vger.kernel.org
X-Gm-Message-State: AOJu0YzSN8htiWVAGV7BOM7MW2czRRf0a3Etq422Yq87MSgX7lhLXJNQ
	rgcqoMmlflHGHCfboJqPQNLfyv+RvUOJ3B8iDJH+qjQt2x7bqNEgGoNc2JEIAKfAI+G2EeV2KDc
	NMSemirZykz2Qz3gIparM/ivA7HPG0TkYu6RP7tKDGDsxjLuHpinYT0FEOJFDRw9rG2bt
X-Gm-Gg: ASbGncvOK0OLAo34I0GMdhTa0iVbny6JtEaweFJOwIEngvBiv7SEgatRMxhdENwnqaP
	ce+NwUeq4iOg++sMN9hoaAutcpPOOXCYsTITKAYcFkNh6gYYiiOmXwXj0HmSSJ9j+/IPn05bSbZ
	KqgsFrm+5CVeOsybltFBDhwoEMwA6ToP0yTjeIoJuKb1lKM4mjjvMyEfi6DT+DbSdy0oglyzpXX
	jfGzPg976+ouL3PJVgietIdV6QipzDPxRfaWElfEf7NwZwq4aXZS+WIHJX4LEM1gN0EjSPrbDHv
	MjOJgxeYIkbC+I8vl0KAYhEUjyb2cSyj6rL3Aoy+Uz7r9Fdu8Z+F78Geeh4Odfy5+7+x6E/15lA
	17nHf2DPRy6WwUcDSk7L5/2xK4KhoMOLmreEgSMLaRR64jI+AfO4iQUkzNixsnNrUbmY=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr390589351cf.4.1764594947302;
        Mon, 01 Dec 2025 05:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsc43YZ5vfth/ieBcfBTnzwxswN44JaEXdbd0f7CPZ1tdQd9HPE6e1lDuQM4FJ+9etruHieg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr390587631cf.4.1764594945691;
        Mon, 01 Dec 2025 05:15:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm13559964a12.20.2025.12.01.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:15:44 -0800 (PST)
Message-ID: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:15:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7DkM3q3We1-3-VnOe9rp42DA_3Qv_lX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOCBTYWx0ZWRfX/pLbmFipaTAr
 rj6bJyCZT4oXty6s1zB+XcBo7L1ZSRVUPKLpEWB+4Z8kJ2354+vzjmBjW3rxh5PEOIRTKyDl0bN
 HKyHsB8SbIXPN6QmPfU83gbD7srntll2gZwViuMdqznVdHV96Ts4Yqwd7Jnkq5r2GFy6eO9Ehpp
 pB5oQbrYfrTafkQh04Cg3MY7qajInlY129nskDR3bepjTF4m2II600fjufaIITXzx8E/1k6cJly
 TVxbCDsu2g9U6tqDVKxTPojTs8O+qxMmarkrjEUKeeGOSFqQKv6LwWVwb0WMB5n1PM0fkk4+1lB
 oWs/O9/BQZF/JE3QzR6eLZO5u/sSjF4E0iyWWlLw2SrBTXv8g3Xcx7uAKCSjlmFsnmiZfyhrR5F
 LBUr1ezMB91Er8iil7Ed8OO5xnJnwg==
X-Authority-Analysis: v=2.4 cv=Lr+fC3dc c=1 sm=1 tr=0 ts=692d9504 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1utaWbyG55iW8k7krG4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7DkM3q3We1-3-VnOe9rp42DA_3Qv_lX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010108

On 11/25/25 6:45 PM, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
> +	.mem_enable_reg = 0x80E4,
> +	.mem_ack_reg =  0x80E4,

hex must be lowercase

> +	.mem_enable_mask = BIT(3),
> +	.mem_enable_ack_mask = 0xc00,

GENMASK(11, 10)

> +	.mem_enable_invert = true,
> +	.branch = {
> +		.halt_reg = 0x80e0,
> +		.halt_check = BRANCH_HALT,
> +		.clkr = {
> +			.enable_reg = 0x80e0,
> +			.enable_mask = BIT(0),
> +			.hw.init = &(const struct clk_init_data) {
> +				.name = "video_cc_mvs0_freerun_clk",
> +				.parent_hws = (const struct clk_hw*[]) {
> +					&video_cc_mvs0_clk_src.clkr.hw,
> +				},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +			},

The indentation is a little malformed 


> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
> +	 * during core reset by default.
> +	 */
> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

lgtm otherwise

Konrad

