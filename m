Return-Path: <linux-arm-msm+bounces-70627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59F4B33E94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E55483509
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C36C26CE06;
	Mon, 25 Aug 2025 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY655L/+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164026E142
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123276; cv=none; b=JiavOrOM0TfA/TjHfs7tF5F4IjPjfakT+APwp2swRQvunkZ2vtSw4wjH9VWcItPCbs6niVN+/DfzRqBM4DDZ/ELVD7R/KFnnn/079GhDPzSxhO9JXkWJCwIedQPGXFUyW3YuxFyCRPNkEcy0DYL8m9l8W4SjT7Cyc820Jb0huTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123276; c=relaxed/simple;
	bh=BA5HmAKv+H6Mxydli+mbUHaLbFji0SyzGQRhWBVL47U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JA5Q8IBCTqWnLRbu+mblwdgfWmUL7d8lFl/T+WwY/wjCROVZyBRCxNw8APIVILHIXlQyi6Jo2IVc+w/3M6S/IidbnOk+i7cHCt6j78FrfpFstHvj0cazcPddojix9IIzNHEZv58TMmLXisQZocok5oso5zqiisgruDhGN+S/wP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY655L/+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8XFnc009700
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRVTSkGBoMEmp+g9Gn6otA4FZ/Z6oFyRZ6ZEW17q/WU=; b=DY655L/+0606evhy
	Wc68CbyzuvyFu0EfJX74dIlDZLD+ETaxVA+J7wLFV+YMGy3Ho9QeM/LjLR/LvJYG
	ANHZhXwjQbHpw1hd2F4Qr63BNhApyh/2C4MxRxQjqrEFjomV/PeMbFr54eY37Klk
	ZZbQHVLCu139U45QWeBiS/OBOS6vdtoF2k6/AGay69/N2Npa9h21e/5Lj7wuCqdB
	4wMsyUzB1244GZ/SvcjUWuL2YX8MjtFagvlKIys8JB0c6rtQE7vM7mhMfOq0kF0S
	1kgkPYqAYl6ngLnpo9H1kdRQM6M6BqG0sLwiaCwKL9rvjjXKde+yux/TPHQLTYZQ
	ucSVIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2n2px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 12:01:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3252a37fda8so2206879a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 05:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123267; x=1756728067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRVTSkGBoMEmp+g9Gn6otA4FZ/Z6oFyRZ6ZEW17q/WU=;
        b=PIdzWZNIo4sXEERt7IsHOmux6FsBhjMOrtPcQ7+gtBVZJkfPBh2hWE7nYtWZo3B+EQ
         8nEdht9RZ2xXO2aMzAIZKN49rY2h2DaEYAn/MG+bcf5UlVWJLlWRKHprjLQg90l3Btvf
         hV0YUytCY5clKCeBD1Oh4YlGKhMy1DyokWckquN93F/GCI1zUjnH8tmCHqr3ZI+NiDjB
         mUNxPn9YDE4SZn3mqmzYYpQlaEw0lCxzM+lSzTpOC0xnYYjAYZVDBBa1Ldk1dGVvTR0O
         xY5EraHfPHJ/qia4DG4zIy92y6GA6C1RsykkJb00b6SFVN8QycicIqA2j8t4jeEpcZTg
         S4JQ==
X-Gm-Message-State: AOJu0YxOMHj8PXhWg4SDIPXffKWAsebUJlMxFBO2dIMlSfl9jC4xXaUy
	DJw4I/EABB6861WHHRjDTtWH4jpe+5C/54dxJv/nnDKNp/lfPJQF2Q/bSkIN4OxLXn1b663THoo
	0radw1yY2tQCB/ns7OI54qi1fGmNRFIg/5MCyCIQGlJ4KMc7IgUlBwmvZjv2D0Or818Tw
X-Gm-Gg: ASbGncvWVXoLRwFQbPbj3/pXtksjsLUnlgHa0C6Hc4VRa1hGXbmCH6z/GJme9rjS13o
	1NA5Cqo4k1jJVYVjM+tuOTR7jTuvHXEJSlTLk7/aT0n+BHw/m17AUWwr2nAiNonlEjh8Y2N/gN2
	mddXJp71Ef94OHy/D7rvo1Ft8VdTNSt7f36W9l4P0Su+sivnmz6cFprVAYl4ieftGPQqLuug7YF
	9QLNFLLaoLHV9DctsOBmXKW4abuAt3vf7xyYiI/PcRXrodP7BNzq4FOwH7qaOHSEuwG4a9XE00q
	uwcx6LqBN5Pk6gVaM932CekyP2PM1hynV/TGrWsTuC6wLbf7SU/zorYOasExRlF/5J50mWZUEh+
	WqMucAmE=
X-Received: by 2002:a17:90a:fc50:b0:325:c5bb:5555 with SMTP id 98e67ed59e1d1-325c5bb5bc4mr2410365a91.7.1756123267117;
        Mon, 25 Aug 2025 05:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaWwCFvYxdiCGZLFH88GT85dxs+KM4/NkEJ8a+BIXy3tvVdlR5O+Gyf6Cxt6z/vqx0IwsKKQ==
X-Received: by 2002:a17:90a:fc50:b0:325:c5bb:5555 with SMTP id 98e67ed59e1d1-325c5bb5bc4mr2410246a91.7.1756123265919;
        Mon, 25 Aug 2025 05:01:05 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.82.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254a1e4154sm7081204a91.11.2025.08.25.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:01:05 -0700 (PDT)
Message-ID: <2d3cd9ec-05f3-4da2-92b4-f2e9a3c7420e@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:30:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Add reserved memory for
 TF-A
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan
 <quic_viswanat@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250812-atf-reserved-mem-v2-1-1adb94a998c1@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250812-atf-reserved-mem-v2-1-1adb94a998c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac5084 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qL8JkhX1/0pBNNwer7kOkw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=NRvswimxAo88tcifN7AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX763SokN3/otc
 7o4o4PUlxFWlQz6LiWa7IFedROfOn+hZ0JMAiNNk49ePgrCsksFA12NLkggzminVvH+6TdP+Vji
 EHpHSdw+poSviFAQpCsVjv5sd3GVMKa8EEK8VYUhlN+D2BwSaf09u4qBgTfv9dt0YFqNDNv9sZk
 tiBAtg8opuHCAXnkQgSvsZRkVf2+5mYy7drUU2QL5UZw+Mygw0KaXGNa7G8e+gneFlUVuks8s/R
 1PO+xs8clJCWidvajMxtgeMUnhgbbxSDODifBzUU4pQDLWGjHVgtNYdZPPLNw/j3HYP/sPW8l7o
 wdA5uhfZdAKs8SljzUShmBwhw86DOADO/Qf78ZaNFVVGZTcqEVoeSde+WgiSjSoFUu9Qo628uu3
 I2XW0N39
X-Proofpoint-GUID: FTI4TQjgp85YnvPoQPp0lJ30kqCwKKY8
X-Proofpoint-ORIG-GUID: FTI4TQjgp85YnvPoQPp0lJ30kqCwKKY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033


On 8/12/2025 10:22 AM, Kathiravan Thirumoorthy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>
> IPQ5424 supports both TZ and TF-A as secure software options and various
> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
> location, but in the 256MB DDR configuration TF-A is loaded at a different
> region.
>
> So, add the reserved memory node for TF-A and keep it disabled by default.
> During bootup, U-Boot will detect which secure software is running and
> enable or disable the node accordingly.


Bjorn, is this change still in your review queue? do you plan to take 
this patch for v6.18 or any suggestions on this?


>
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> - Rebased on next-20250812
> - Picked up R-b tag
> - Link to v1:
>    https://lore.kernel.org/linux-arm-msm/20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com/
> ---
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 2eea8a078595103ca2d3912f41e3594820b52771..e31e328bdf0e9aaaec3019e5a7bd71c7126e5fa8 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -163,6 +163,12 @@ smem@8a800000 {
>   
>   			hwlocks = <&tcsr_mutex 3>;
>   		};
> +
> +		tfa@8a832000 {
> +			reg = <0x0 0x8a832000 0x0 0x7d000>;
> +			no-map;
> +			status = "disabled";
> +		};
>   	};
>   
>   	soc@0 {
>
> ---
> base-commit: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
> change-id: 20250812-atf-reserved-mem-bf388e366f75
>
> Best regards,

