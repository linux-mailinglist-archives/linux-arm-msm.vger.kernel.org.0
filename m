Return-Path: <linux-arm-msm+bounces-64078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB1AFD4C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A8D3AA498
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC862DCF48;
	Tue,  8 Jul 2025 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Elv9pl0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74102253E0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994357; cv=none; b=LJrKppdox1RExjljO1zwgrYL4CiATs5h9+pCzYKlFdsa7FKhKXA8ZEyz9u/GlVzLToUAie7A8nQXjcya8n/iEQk/5QuaCG6txqruQtcCbzYxsSLO/IwbaSdZapRItpAzydA74PEYgphovg2866dNdBUUsT4poxowG3EZDaxO57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994357; c=relaxed/simple;
	bh=JkkoRasbjut5jeEzMBbaFs/deflEAfLkvWph7zunias=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIRVr69xWl3KCdv2C8ZfVS6p7PA1trTprtUwcMLM+UVyfMtD4QmBpK8f5kLpziYK7CpfhFY8ccGb7ynFwcXrBWk7KiHX5rv74QD+qqZUvF/wIY35bYY25XJz6o3Wm6o0mLsJcUoIoWq/X6/hhy5mEfTJpVH6Rb9CjqkGKdsym2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Elv9pl0o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAaqt032649
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 17:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO475jfbdZtuUnAEEFejjl9IeIhw70hd63tcQP0evVc=; b=Elv9pl0o+5MZFAaR
	LAVj+oBZl/wr4/pN4jBlBNCmyWyV4dXEj4GbqpPXQ0DpXNR4JB/2NayF4qwXjZyj
	AoAbzxEbSK4TnNPCwDrDYc8ZciHU294JmiV+wQTNqDve5Scc/WOJkq6akMzqUrWp
	FaO5lkfSc3ubII7n8tLipOuf7h9n61BnGN+JIR6s3833dDbMMr/AmsPv4TQ5ypiE
	thOYe8ZI8bUYTpqX/yRnOJ0DSPKJxKLlIPnbQef35YHjQfHlVT0rhXNgxGeB2B2J
	jVOk8XvXnMQ41+UYieWCFF4K41r37iWcbJa7Z75kGKyH3SxK4V8uL8B8ZpTfhges
	HQbTHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq32mtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 17:05:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ea727700so30669485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994354; x=1752599154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jO475jfbdZtuUnAEEFejjl9IeIhw70hd63tcQP0evVc=;
        b=v4IQ+JN0NUIxOoZrwee7vxpFIoFYNF0jmPxZNJvtpTYi0MYGDW+q/Uv0WQ1MpUePR9
         WnJzGPQLH0GZW5Z0tf9xRXJKXF+C6csSSoMeyIATzzlj3LNxSUlYmQN/PaTfHWMb6CSY
         3yMJJuXGnZLElMRfW2HM6x5czMTJTRefno9y7Hl6xgSH7e9wvR1bhqU2qdxcugfj13mj
         pZIel43HJzsh0/dZ5MH1aQX0uoOJuErWO4WcsiUDN/d6hv/aGb9AXsh2biwbTsRRKGU7
         gAhbF8WopUwUahagoRD+4SA9QMpsNEnyS0JcNG4FdeAwhh7svh2U2AH9W1Dk/yfQauxs
         6d1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcmiGs8vI4pBgloLCcNvlCD0v70axdK5PDHTgh8G5MIvi/bX1VHkhfgO2tuADJ5jygnonZVXQsK/VYUmPU@vger.kernel.org
X-Gm-Message-State: AOJu0YzQH0L4Ok4kfl1LXWJg64pYz+QHWQZg5bMTpHK+MkChHG1uSF5k
	b7FGGybK9IorzHj+T9cw0T0QgrkuKaTcl+IBzA3xa02zSwUIWHwaTqpFqyZS5y9wFww22ts9xwM
	U2VACmnB1cx+JV4fUCisEDZXKDNHLiztVeSB2zLaGQs/4qRILyK9oAokBqOcwOfRjNDNy
X-Gm-Gg: ASbGncthjflFJ/v341LJTYPxQGTLncW13J9gYr1tZQGFKlw10nOT608B75UompyUlg1
	cI1RKnyLDM8tEscqxOJ8oO4KkIB+q+mmcyVTIn6cD7ju6PfaDz1M/g9p8Y3zN3nI1CldjheaZ/E
	+uechUIn3eMF02Sgk+UQtjPekYWxdZsayukbflEa98KTOQj5x6PXEvqa7lK6T/M9WVYvkuSu3kG
	Y+VJkyWaHmMAiAtBDPfHj6OV405b3u5ghHcjPD5DupJ7FcLU67UtHPon7ErwC/ERZvL1M0MVKnM
	usceJCcnhvqCPqir2QEi9w/5VDbGFwP9TU9IHhllw02tcksUf77KIDmIijWudISsdphx8iJ81ee
	tHCg=
X-Received: by 2002:a05:620a:4620:b0:7c3:e399:328f with SMTP id af79cd13be357-7d5ddc6a375mr819210285a.11.1751994353677;
        Tue, 08 Jul 2025 10:05:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBQAgQK/OIkLhExQIO7Vx5N12WVddGC+qRYQISOisMxT+bNVcjk5L/dx/BL3EDDSLrEuk+UA==
X-Received: by 2002:a05:620a:4620:b0:7c3:e399:328f with SMTP id af79cd13be357-7d5ddc6a375mr819206885a.11.1751994352952;
        Tue, 08 Jul 2025 10:05:52 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca69657fsm7480922a12.26.2025.07.08.10.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 10:05:51 -0700 (PDT)
Message-ID: <cd48db9d-109b-445d-9aa9-06f20efcbe35@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 19:05:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0NCBTYWx0ZWRfXw1yBGD5yXCFt
 bVftpV+lpqBiUPWxN0BDHjRmtFKuOvFYVBJWhyJjjpN61lchwAAlAz3aLEl8vCpT9kS2pEP7OnE
 zhgjt7xrZSPFmm76z8ElXPxm6Npb/kRDOfmacFUfT2O3q8CSSOfdgT9f9/ILz+s3VlYjkeCXN1n
 88U0T1tC1YENzWYQB3PW+i+2K8VLvWxxoNHKbJf1ffzBkbtiLKdZnoyNjbKfpw4s7VZI9FI3tQb
 k8jEcxTr67/j5bzsqYmfyjO5P+yxU+BY8WpHt2yW9RNYSo0cTjPfFKPZ4Hhs5bHK4RZGZJHWzkF
 vxew53NYzEzv6yYqJ8sQLxNiIihT/wiLU17xtQrD7tGe/towe2ti1wPDk7vZGwx+HOiTFz8qlY3
 EfOmmZetZajpqy6WfVLhX9oIHSqiaFi7gHrlaZMo/XM6iE0UyNRzrYOw0Pz8cdF494htWOuQ
X-Proofpoint-ORIG-GUID: avlVN5TMedPnCCZm-AtJQxwDFtdbnud-
X-Proofpoint-GUID: avlVN5TMedPnCCZm-AtJQxwDFtdbnud-
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d4ff2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tov9PLxJY7Hhyj_3EZwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080144

On 7/1/25 7:28 PM, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> Adapted from gcc-sm8550.c (with adjusted addresses).

I don't think they changed

> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
>  	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
>  	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
>  	[GCC_VIDEO_BCR] = { 0x32000 },
> +	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
> +	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },

Hm, so this is actually gcc_video_axi0_clk (same reg), but the bit
indeed is described to pass on a reset signal to the hw block on
the other side

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

