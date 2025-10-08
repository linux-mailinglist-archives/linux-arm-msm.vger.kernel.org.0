Return-Path: <linux-arm-msm+bounces-76333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35049BC3D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2479D1883950
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A3E1C3BFC;
	Wed,  8 Oct 2025 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jn5x0UvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6419E98C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912263; cv=none; b=MgbzV3Kc/e1HdbRdaB+nMSg+tEPRDBG9CU6htFrf194M1ppNKtWmBXcbNlvpOXjxYGDi03ozpNgdvKEa4Sr06Y9Xve44u4XzxgwxZEz+CEPPXRhAKQEjZ6OtahbNtzmXywiLllUWGzzpfx/grQ/Eq8IIw+vvUBvvU1QN4xOGYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912263; c=relaxed/simple;
	bh=MlOQPUrFbRM7lzb6+6+OsElMAObdrmpb4oWngR80KNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0RF/Owzh6GUHQAeVpGV2RvhPOyZcsUTlHLOTbNiXnCkY1H6n/6PXKHevNjxYuBhaktMora5EuQRPCqy7e2GmzhamMNm5NxndfPb4sO6nUR0GMtymlCphjjmPrWhHZib7hvWYU9QznHqcFjMIiPiABy8485iToeiTuoqzBUhr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jn5x0UvG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aXV7002390
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+msSb2AQCXuitHlyCPM/RkFMjkfHAZ9Xm5Da/gnVsS0=; b=Jn5x0UvG1v++ZhOx
	EakpkYX6Pf8tlTjMEVCrbKuoS0APFpTQRmwfyt6QRqh/K3OInFOeX4A+mYQaGGzf
	37G3lTMUbchAcbPgRWFAnq+ztDooXRZh5yWTAPZgllN8f2OiPb9jv6N4eU60O2h8
	JrCpbFXWcj6zg/ikmwtDpC13GbC5PJMksPDO1DJTSWbvQAY9ireEFIANTTTzykqV
	Dz18+ve2SDiVXIJfzYPPgn+MLVQEtZmEur3GWwx6WUDrYweJSO4kDCniGHdktyhd
	YpZbMprBvU/EByUkOMQ8uoBOfsCjTITXoOLrmuG+cAgu3PyDVHYBZdJMnJA27lkY
	CcbQ3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxna45g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:31:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6c3d10716so13398491cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912260; x=1760517060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+msSb2AQCXuitHlyCPM/RkFMjkfHAZ9Xm5Da/gnVsS0=;
        b=HDhUtPpjQGMmMhoiIF5KRC4bIEMdQ+uUjht8kMLlhqjlfvTVvi+p+FtaFPfSio9I3Q
         FE6+80rTbl25ggBggLSbx4NvYPc34N9K/s/GhEqLARvCml1pdlv5mO4hJs4Z0Gm/baue
         z422TJPlpJ/iO+2Jse86y6AHgu4mD47DUaSSlDqPOfosCFbSnKfg3AeUUL0twDSMt6FA
         lXDz1xq/g6le5V+p0rxXKl8KdhoqW52Xh8ktyBs8+4uGewgo9C3B2UPg5OuMIwhTc7zu
         iYFNhsGCcPRYCe76A+2QFQsweLp/cD63lUJ0OICitRc7g10n13dm5qRviCTul+JX8jSV
         /r1g==
X-Gm-Message-State: AOJu0YwyHXXZnEIHr23g+71Hx2Aulg4IQLDbDyAc3FpJLwS9SK7h2U50
	xUbUvcge16KN0H98U2mO2VKuqGAKAhlrWRCBg0Q/WvQ1fCEF9DeoRegBuMo7lfHnFxcLa1uqUok
	IBbbImQ/a7t8HZYsoo05ZftjX5XKSDDtHCg/QDm+lrWF9PBulms6XPEES2LmsWKw4ArQ2
X-Gm-Gg: ASbGncsh68kAwCCd+8WdUUYOhSLmhbCWnf67erLFSTvIiRg579QZwDo/NcvJWXkEUX/
	9tcx+6ajmh15dODTxV0DTJxIUDRZFj0k1/CuAdh4l4gC2l3BL8/bDmsuUVjf7C+tyKFQDucRf9a
	FX0tk4ccUMxFUh4QgCgaXmTeHRVH8NvbRC+59HNzIei+kmqxB94oa1ESdtoCut7VLz+C51oPGSu
	Vejl+mCI8X9tsRSV26kkELUgvVN3vecyeyE58sQLjTjFE2VDTKptemKb5zBJQ5lEHRJP2r5dupU
	2JzbvWy5Fg4lsMT1vT35vNiqD+xLCMeWjSZ5LFl+C2MgYF+SPj+h9mmdUcfjizm8cbx6YsWwQzo
	52azJaeGQRNSAx1jMBaxeiqDEAzU=
X-Received: by 2002:a05:622a:1a28:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4e6eacf31e7mr24483661cf.4.1759912260309;
        Wed, 08 Oct 2025 01:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEho6Mv27Giv6bxZJ6pXvVDhyeR4MaSk/nV6G8qKCeFZZbNjnhay6CBU2IK8uL6Zhs0P9fM9Q==
X-Received: by 2002:a05:622a:1a28:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4e6eacf31e7mr24483461cf.4.1759912259775;
        Wed, 08 Oct 2025 01:30:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000besm14230201a12.23.2025.10.08.01.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:30:59 -0700 (PDT)
Message-ID: <6429dd8d-d610-4393-9863-b856dcfd0cb0@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:30:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] arm64: dts: qcom: kaanapali: Add iris video node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-20-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-20-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX//nUap1ljodc
 IhRGSm3YAL+IHOjqwh7MlRDel1Q1knthkmOMCCJ6P9EWWLn60qmVQoawvBQ26kEV8sJPFa2Qaer
 DFXbvQGF3ELOse+ast9pV6o9ayh5l1qa1uzRa2PXqwnG6GpdoLSbarDRg0+I+dxrJ8pc8Fp4MdH
 35NnY3PS3E6LGsBeEf/Zse3PUkRPvJSY9ofI09GeUunMzd25qIG9w27Q23adhKvU4o6LtvXEiLH
 rQ5I5NaYK4dDZ8V+Z9X1BimhS4ZtSyNg+R1tw+XHF+XLVt3Y5XO8YTSpVpchkuvxEeg0jM6d2Px
 5I57olsvsZX6lSnT2ChN4CzI0Z0fC/wwaVjsxBdCJkMtqVDm9a8AxqIsN6pTE9l/ARBLsEH98Xi
 wQEFcdkfoOiZfgB4jFatwuor81AQ1Q==
X-Proofpoint-GUID: p8nkdgyYorwmHtp40MoSXVq275DeAESE
X-Proofpoint-ORIG-GUID: p8nkdgyYorwmHtp40MoSXVq275DeAESE
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e62145 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=nVCHojuieXwSnDvak8UA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 9/25/25 2:17 AM, Jingyi Wang wrote:
> Add DT node for the kaanapali iris video node.
> 
> Written with help from Taniya Das(added videocc node).
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

I think you might have lost Vikash's authorship here

[...]
> +		videocc: clock-controller@20f0000 {
> +			compatible = "qcom,kaanapali-videocc";
> +			reg = <0x0 0x20f0000 0x0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;
> +
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;

I see that the PLLs can operate at LOWSVS_D1 at the same frequencies
as they do at LOWSVS, although they need _SVS to fully stretch their
legs

I think we can do _D1 here? +Taniya?

Konrad

