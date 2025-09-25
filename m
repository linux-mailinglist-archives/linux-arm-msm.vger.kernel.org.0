Return-Path: <linux-arm-msm+bounces-75068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68632B9ED76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 162B3163F78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778052F49E3;
	Thu, 25 Sep 2025 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BoO05sa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD474040
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798044; cv=none; b=d0M3AttF2lhLQ30MrqRjBqyj5UuDqdCgUljZA55X4S1Uo75Oc5tNHUsLDXe0xOcKyzCVeRsqY2GE/5rfUX7BemJpWwkQZQ282sc1qHdjr9iyk7PqQ8fljserpDzDlCP22adcWZXEqTm5tOiweZy1vdwcbWF3rFlNKinfAXgoQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798044; c=relaxed/simple;
	bh=C7yv9vmaySIkzOsYJRsjKstA4ZBNeuwL+lps66HoOgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qf53IsnxcbksaCXPHennDYVrK0IH2oGrGiCefaZP/9UBAqM/996SWHs5PtY3Vky8uCVj92WHtc+rlMqANrEQQzP5rHAedQKljbnnWgHkEpWehSS52QdzpXJ1C1q0qZrvqIhMlDpMvsSidv2LbU2/XHoJQg5PymjCu2hCI4v9rN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BoO05sa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9rGqE021646
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QCczuwq8vr9YM4JhxuUK+LaOovpLMWMbHg4KcBFzT/s=; b=BoO05sa/um/OUG0k
	gPPpp6kRoYTkvM73qDL/lqpNXupAlad2k5rvHNf3OaKwA+4r877/3obWIZenfcUH
	pWsJxWaC104uQ5XawWgG6vLm17uAQxRWcyTpcL6xDH1lnkgYPVv+sAVEZq1U0C7r
	yn6imv3QF6G0CihYoGkACDODQNEdgdM0M5lf1jDJ+BYh/Nbk2m0kGj0Cl0bMhy9t
	NzZE017ox8zApqpI31yy/yd3EOaPpzGmUsGR7XuYEyOE+ltdQFS7QrBo3M027wbA
	0MTUOuVTlAeuypaeC+/M+/R0xtoikRZ4m5C0HVY6xYqVWkzHbztPXAmkIF5pxEf0
	GbDCHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafd93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:00:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d88b669938so1762561cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798041; x=1759402841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCczuwq8vr9YM4JhxuUK+LaOovpLMWMbHg4KcBFzT/s=;
        b=PFeOe97f8oWRPZca3NOFSKct5ox+jmm0qgLel7dbzqkYieE2H4/t/2Novy4aR3wu/i
         QUiVjrWuWPAujQHbt9Z7v5vjow5IBEtHuY+vId7mnMaNUuG1JqTFljwnSjaDnsQNojK4
         7ypYtBdwU0IcocxgUFdJhDEENmmKU7dAZ6ysTFi1VVgHUTHVIVyiXL6CU0/djyxHtFkA
         HNrLcA/3X2waiA/m9kqoRU2EwyVM3NKTEJoBs7E7F/65jj/gCCUFqM/Gbmm8GXW8HmYT
         /bbTqLfTF3N5hhiCAANIb93O7lgiflKjhSJR27z3mWwhZxLAPD5hoyIMmjyO3TTO/SuU
         P/hQ==
X-Gm-Message-State: AOJu0YyM3bwn72Lj6dzDnxPSREXqs6iW3AKqnayM1fIKhGuYdMFEVk47
	RInSgywoN0BYfUP/nNjc4glyTSSrqe8QO8Dxye9InMGt1N/9S2d2ImqJVYzYg0+doKS50XkDdOc
	a2sVeYwzhWrkZpnQmbP3QUQMuyCmR/zssMY8Nuhe99ME2p1K/Zv9C0B4R2yYUAVcgIGod
X-Gm-Gg: ASbGncuyt0TmqIumhTmiFYo6ZE5JDx87nWg9O0vNJD3smfnSAMIl2DhZALlzvR+fg/k
	LC+hfai7JcNkKUA0zlg+WxWm+Q6o6xw1QZPw4t46vkhbtG9jLvoZBXWMPGgvVsS7E97b05Mz2SU
	AxilvSu5KAPWHtwVIqFIqlhXhUsksfB1cX8MFY82un11isuORrd6TSn76l2xSRHbXTNwZAUD9uf
	/ZhmPYsWk/ehlvaoiHh40NwMI2Y/pavY4JRpF3JQdnS6vbT6KtW2Y/QnmaiiLxRb33IJmvpTuSD
	o/GJLfwKs6eVn6zoQUZnxFstUoWZo1qngfKpQvBOohynn40XCKps0jztAGvjkeNBQstb0CMwm1y
	QWc4bUnTnckejKzZJ8crTmg==
X-Received: by 2002:a05:622a:11c7:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4da47c0d937mr22183761cf.2.1758798040903;
        Thu, 25 Sep 2025 04:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn2jGP0QZTTpMl5Zj57PzXVDu1Ub21D8fZTsyC8W3OJN86S89MQB+6pORzdjrN9SBWGtKyjg==
X-Received: by 2002:a05:622a:11c7:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4da47c0d937mr22182851cf.2.1758798039899;
        Thu, 25 Sep 2025 04:00:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d0d0bsm146870066b.5.2025.09.25.04.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:00:39 -0700 (PDT)
Message-ID: <bbef95e0-c8f7-4a7a-9687-9b8798ba70a9@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:00:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] arm64: dts: qcom: glymur: Enable ipcc and aoss
 nodes
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-8-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-8-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C9BOBUfvYlwDjcOrtr04FOKiIdU9eEbY
X-Proofpoint-ORIG-GUID: C9BOBUfvYlwDjcOrtr04FOKiIdU9eEbY
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d520d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cNCWYwXn1kmXQoXjcrgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX8EMNKlewae2T
 pLWuUEO/Iuwbsd5FOJDKtLNbo2FvJYHKBhjqKWvrZDGUakkTBlzfpB+R4NpTxF3gpl8fLLwJ6d9
 nkQZUPy4uYT1FeEQDaxdmhBZewf6FXQoq9KazDz5/WdqoLjodl4XYtsFtSVhcgxp/swNITQXuVS
 gPeKcICWovrFDfXgU9JHt2QFx/oP7H/PXbvF6FXnhMYWEazpUgtOzBS/qWO/0zKxe+Lfix9EI/y
 Eezraib8l3/DHwjz1ht00ni807fiWlGQqdFnv7vYoFkqktZcthfYzEVkdgLbGspMvQehdeAm49G
 mvgQRWAiX+AWpK34KXhcELFh2wOydVx+85cEPugZycdKxfj/eyBNXJ7xrTtrS7efHmj4AL9YH3t
 brojBXMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Enable ipcc and aoss nodes on Glmyur SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index d924b4778fd37af8fe7b0bceca466dee73269481..2632ef381687c2392f8fad0294901e33887ac4d3 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -2536,6 +2537,17 @@ hsc_noc: interconnect@2000000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		ipcc: mailbox@3e04000{

Missing space before '{'

Konrad


