Return-Path: <linux-arm-msm+bounces-83242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6783C84C32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5182F3B166D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41FF30496A;
	Tue, 25 Nov 2025 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fx8z6ymJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmVUKGSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231925F7B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764070779; cv=none; b=HtZ1VJ3M82TDQ+yVtUV0haUf5MOXZie2oAU28OL6CtzRvtsPLdu1UupJqQm7LfMWzDhlVT+fi8T9hq4aUHb9v4PbgpIzXeaJBIHTx+ghItzf/nj7U3LArhB+fTePH+6G/sbA7bln6CxyZ/lh0PO9cjUKWx4Zq5dRpAYoSAZGq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764070779; c=relaxed/simple;
	bh=TIvus4qLeYR6ur8gZQ8EVgijdl4O66+zNL0rBfW+NEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4wWjogKwW1a2uLoed5YWym5EsPwR3pTnrVJl/asF3VyuKwu9Ll8Lxywf8/w4CmOcysg/ZT/cYBY5+e1z57JsfkR4dE9T9bw9LuX9+Mu/cu5AJ0XgbPVkO8GaxuwxJ0O7YI/9heHMrG2vqgq85XA/YXgF3rUmjwi1OEDeMKYHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fx8z6ymJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmVUKGSq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APAB2e51847623
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0mJEbRIZhEi+mIefD7nUyiiWYldDhethjcYK0qWNCk=; b=fx8z6ymJojlbLJYU
	+N7OcIz64FKlWRydKfMexzKLyGPTn8YyFm1qbQT3Nxh3yqbwPaLM/Iyw1Ol6Vekl
	8NA+LeAyo9pqatlhE7axTYT8rWqEo6fDAr4SHWq6FCD8lFKdOJdqozg5wQpKw4gp
	WoHFCml9ytXzk0eOjutZ35jU5LGXzvNOLoVQCl1OIAmHyl3JwW3ipqV8BtITcWsi
	YO2XkxsRzdbSm95u+nxlaMnET6Aj9A1lSBoz638XW5IC2qtxHj3M/bjDUgQaSV5y
	ksI0U2H6glwuKbkkmgCYsHu/c70i4zFXpZ6EYQmAe1VS9E37SkJ7VmDd1+46Yc79
	vYnvgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qaxpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:39:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so67054685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 03:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764070776; x=1764675576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0mJEbRIZhEi+mIefD7nUyiiWYldDhethjcYK0qWNCk=;
        b=EmVUKGSq1rnbY+wqoWnCt3ictpmjIomkXtCEjFyOpf88YkvDifJyFRbJaa7q0tu7Af
         sbD/shbUbvvwPKcgmDsid0TpkGI20QDJaZ9OG8naskoTGVOGiQUmrMvg89E1+Hw6FyBL
         RqVa245i8/8WGWKsIkqnlNnykA/t/NH8GfcqzlGX4rEH2VOsuxM386BYhMigNQjn52H1
         KXqbtbRfOD3ndGnFY/sXug8wX1RKbtBqhBe64hIZewPtZyqCW3MtlupoyT6+s4+hy+KN
         pzsBLJTA+QPY7xJStHCJZI0Rv9qzUTEb9ySLw8xUHs3YPCaQEZRuw8WsIIDz7XLTPN94
         wOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764070776; x=1764675576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0mJEbRIZhEi+mIefD7nUyiiWYldDhethjcYK0qWNCk=;
        b=u4VY2fJR4MY7RL3TzdRR2j/U/iSUD4497HqzMJ6M4BDzbC0HiZnrzKbXIITmnRuQ9a
         v7exrqgChFuJmVGpDgw+x+HhddoAkzpLo9ADQcavJwcTE3rQqVtQgTdRh7CdfsZacfQ8
         NNbDyip3vtG0wu/032xoC+QHFYKYioimjDE8mQWlrC/pIE/dI1f8O/kKJeidofbYDoLX
         d/Rw57RvFvq/Ipz08auI27JpBM3a7VkpkCajO4lwd/oa2nawJTPDL/mtyz79e2RAuk7M
         DYsOrWolDhMv8jmlmaJs6v81T/2Bq1csx0FO0nrOvcLV3+OTrQ3nMQL9iSZe+Y3K+ctY
         qo5w==
X-Gm-Message-State: AOJu0Yx9VDx1A+xCwN45nTwXiTf0oXN5SYzwom2I2zzZjPjKH5k+mOlS
	eL6fu+8OhRhUpMzcp79oORQKt3asDo33PPNuP8WBVHrNybBrQfRMMI18VT/Fr+IDmy3XD6QQpBM
	x7l3xhGPnPH1yaLkRZ8x7xuXVlMjcUOmvn0pYIFZ1BBvqE0Azvs7lTlo4P6iFPT3p+ayg
X-Gm-Gg: ASbGncuWFbTkUKg96VpALo/puaR1qkPsnVQim0hbBpTTz4vYMLhqZwPsXQOIc7r8EMO
	Lvf/3z2blZetkfB2fJqQHIisM3mifMQipjAfqKM0YYmUVW+bebVpBCECz4ki31cBbcgis0rgiJX
	d7cvxgYbIFmtXHh9oyW/RC2suAAPBSJlKjgu80BU24XHH7wTmGWoT6WGzgJnK2XqaT1WPQ54qCJ
	WBfg2WfFRQNAajP/CS2muUYbpHe7ckbNE6/2GFdEsTqF5iQ0hXcqhjjy03DUeqZzEDlIY9wvsI5
	/di+rPCN5wta451Q4KRy5Ni5DE7n2WB/RQK3du83+Cg/HQLAtNHL6QWEuP79CfVvpjPLldVUJAY
	LCJ6vroLhGU3RKU1V8igyxNOyxPn2iHBesKXXF1fRlaz7W0+WWKGW
X-Received: by 2002:a05:620a:4007:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b33d4a999fmr1417514685a.9.1764070775645;
        Tue, 25 Nov 2025 03:39:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCzo0WCGR0CTugtyxGSUMJ1i6DuZWHwh9eoGFZ/bneruZmbXg2/dXdzuLYj2oAElRtWJsKlA==
X-Received: by 2002:a05:620a:4007:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b33d4a999fmr1417511885a.9.1764070775136;
        Tue, 25 Nov 2025 03:39:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4e6bsm1542414866b.34.2025.11.25.03.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 03:39:34 -0800 (PST)
Message-ID: <117f95a4-5f31-4372-a2e2-a0a969dc3d5e@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:39:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125110420.2192971-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125110420.2192971-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i32UdUpQtjahT30ocyr6xf9jYTv1I9vb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA5NSBTYWx0ZWRfXy96drM2p9Ld1
 aGuhGB7PPSggnIWfciTa4fawwlfOURoOgEOT/osTl02rubtMbYfRBI/uEqvBEDk7ZaHynBueCEr
 CLby8Z8hJaTR6if+uVogLRY91GFvd0slkikvkNv90aqvaNnsapxD18hq3ZvrH0mfD5N0EaUbN/r
 DgwXuQaiXtzbDCBIAtKL5+WuErGMBheAwn7oO7iYxZx2Yt3SrOFeS9kGKmIq0PkinQXqtqAyT1w
 Ivl3ymPL1ekFpXgiQ0r1vmIT4QqVDL8RbmXZFng++8mkurIBquRlIqmXKzqyB6FnUqAGi0PFpAg
 p0V1rTcqY70Jc3mbDAB4LxVEvoOpgE4CIPHS1DE9X0Q++dqw7dOjZG5+/8WLHnf5lhjA3slQkCa
 yXVfDiHA0x680/PNq5ew+Shfvbo3Rw==
X-Proofpoint-GUID: i32UdUpQtjahT30ocyr6xf9jYTv1I9vb
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=69259578 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=O_RjRo1D4uTvDWjpvrcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250095

On 11/25/25 12:04 PM, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4026,7 +4026,27 @@ usb_0: usb@a600000 {
>  			snps,dis-u1-entry-quirk;
>  			snps,dis-u2-entry-quirk;
>  
> +			usb-role-switch;
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb3_0_hs_ep: endpoint {

The patch looks good, but I'm a little puzzled why the endpoints of 'usb_0' are
named 'usb3_0'.. This will make the DTs look like:

&usb_0 {
	// foo
};

&usb_1 {
	// foo
};

// usb_0 children
&usb3_0_hs_ep {
	// foo
};


&usb3_0_ss_ep {
	// foo
};

// usb_1 children
&usb3_1_hs_ep {
	// foo
};

&usb3_1_ss_ep {
	// foo
};

Konrad

