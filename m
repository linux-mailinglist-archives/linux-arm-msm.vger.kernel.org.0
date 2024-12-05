Return-Path: <linux-arm-msm+bounces-40624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433169E6030
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 22:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A1B168CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 21:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679F71CDA2F;
	Thu,  5 Dec 2024 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ncs6g4QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACC1CD1FB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733434588; cv=none; b=ZgwpiLJrkx+U0Dj4of2oiUMxn2MB0uxe5vuUSNCyKGTEWqNF+KUnBTpPVcuvPapMRxwMQeEbAmcOzSrjP/5ysJSL9nJBdx00RiVkuFaPIZrzfY56lEDDyhR4YSu/CG6UmeQdA9G+i8BuZp0dmbWEbikU7vvQhnOK6StSkSKP6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733434588; c=relaxed/simple;
	bh=qxHeTYzJNmJuLcSV3rPAJwiQm3gS8Z6fFNGrm799O0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8Vjy5thgL8wJOsixFyqZ0ALmihLbEkcC4I/ZzUq8IV4QltI2IIg32UTQdtFAulq7NhUbs9Bz3PEe+DQnjI5o4Kfeu182i8vuVlcg+eR55A/TIEj5Lf4mvzrn8JkyBddISbLwLdfD/NwTz7/VRDoODIPeUaBsM3RW6C0kbcv0BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ncs6g4QI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Hb8fW016877
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 21:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wstxbk1OnzD64Npc360Pi802BNMyNjIUJQlSGDml8y0=; b=Ncs6g4QIGGVSfyBt
	HkxkhJQ8wCjloM7vs0fjN6hyfNBvrYXEEvZBqywUV/l75XiXsoP1sVuqejTHrs/A
	9q/VEBJ5YwJEjzsI2yB9xZ8Flaul0q3N3RmzFRepreX9esokca3TFJCagiV7AAF8
	mgiPlU9NLl1TwkT+73kEAddm5EfMqsmlN+17ZsTkj7x8VK3aw20nfHvF35dKZsHn
	xB5JG7I9uqxHhom3g0yUl0PO4FyAQrd9H/OA2KsiSBZnB17dNw1QrvldS/J2ZrfL
	Nqc36w/S6o5U7V30eqw+7WBvjElHoRcn4CnRs+aUdLHhucCjDbOUNeVf2irMpzZI
	P8N/Pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmhgc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 21:36:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b66a3c352bso13991085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 13:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733434573; x=1734039373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wstxbk1OnzD64Npc360Pi802BNMyNjIUJQlSGDml8y0=;
        b=aZCYedo7Dk+m3J4Dc0wsyjMz9I9jPZFCLXSxRtWSO2NRINL03i0TLUotxCfAZXIu9+
         5hdLf9jA0QuocPgtmcXbpJZmCCgS/+3SHNjcaLo/hXB2UxevVSP5mPLJQ/ALyLCHwbNP
         9GtUxskZrqzju2NeJi/O7xtXHnb2V91kHDHHc3OH98Pjn7R+NrLqfknlQMVwFAeh2q4r
         uP7L9Ob65qg+tSCNJ4pNQ0I4vR7KWqjoGGfXvfJpdQDS5BPOIHMaLYV5YxLt+8bgU+cy
         AcDcuViaOQAqZ87834Mz+7IY14p52yYnTE0gC2UV7EDROlAPIcxcxrIWr6GdG8l2j6mp
         5d5A==
X-Gm-Message-State: AOJu0YwvXIqsYZchQ7zcjTLUCzCljd3ZV6MOldLa8Anz/GGy2riVG5ax
	3VZ2MeTvcZR/0Ea8WmuzfMew7AG3K1bpd1w2mIa8RD3R2aNVycxmobxrh0NpG5HFQjjeP1A6Jbu
	Nb/a0q9HgRCH9FOtaM4b1HawWYE/2kJKumN8YydMSqiiq8CWFrv+Q8nVw0Uw+7PLz
X-Gm-Gg: ASbGncsCmkHm4jf+dxORlpJlKoFuasMg8J0lHYOFv5lK0R4r9+6GoLRtbo9xzS1OI0U
	R9xoDV9ox6Yk0n1IsKR+NGPsBAYvg7r/DNj+KL11AHuEy4NRB1O5UAAmLQEZ8o+soK9eIVvCvIq
	R6cO+YpyxWaj0FqHGbJqM6dAmZCkmOkvLzkkdH7SwvrDhv6KCYT+Bu2qATkxBEsG0ua7jp0I7NX
	MAc86VY4XboLmZqwNmCgzn7E+aSjghgctECS8cqt77jbVjVR7MzAIwda8WMLxlX0RoMPvFvl04w
	d0zSOLvwyzs8opE1zkOUrSHVhO22Dpo=
X-Received: by 2002:a05:620a:450c:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b6bcac4fbfmr41656085a.3.1733434573593;
        Thu, 05 Dec 2024 13:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFV9ITN/o05Lqn7Hr8u38lLoE4ffPCZNKa+aOC+yUI+vFQdyY90szfu5RYo/Ll3Req0anAMFg==
X-Received: by 2002:a05:620a:450c:b0:7b6:5e36:224c with SMTP id af79cd13be357-7b6bcac4fbfmr41654685a.3.1733434573247;
        Thu, 05 Dec 2024 13:36:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260ebaabsm142014466b.198.2024.12.05.13.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:36:12 -0800 (PST)
Message-ID: <45643708-c138-4c77-85ce-fa7d49f2aa72@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 22:36:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: skqLYtkJkvZ0jY6vkikwSh0qY4MUihYX
X-Proofpoint-GUID: skqLYtkJkvZ0jY6vkikwSh0qY4MUihYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=991 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050161

On 27.11.2024 11:45 AM, Yongxing Mou wrote:
> Add device tree nodes for the DPTX0 controller with their
> corresponding PHYs found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 115 +++++++++++++++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 1642e2863affd5af0b4f68118a47b7a74b76df95..28deba0a389641b4dddbf4505d6f44c6607aa03b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -987,6 +987,19 @@ mdss_mdp: display-controller@ae01000 {
>  				interrupt-parent = <&mdss>;
>  				interrupts = <0>;
>  
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
> +						};
> +					};
> +				};
> +
>  				mdp_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> @@ -1011,6 +1024,104 @@ opp-650000000 {
>  					};
>  				};
>  			};
> +
> +			mdss_dp0_phy: phy@aec2a00 {
> +				compatible = "qcom,qcs8300-edp-phy";
> +
> +				reg = <0x0 0x0aec2a00 0x0 0x200>,

0x19c

> +				      <0x0 0x0aec2200 0x0 0xd0>,

0xec
> +				      <0x0 0x0aec2600 0x0 0xd0>,

0xec

For lengths

> +				      <0x0 0x0aec2000 0x0 0x1c8>;

This one's correct

> +
> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
> +				clock-names = "aux",
> +					      "cfg_ahb";

power-domains = <&rpmhpd RPMHPD_MX>;

(or maybe even MXC?)

> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				status = "disabled";
> +			};
> +
> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,qcs8300-dp";
> +
> +				reg = <0x0 0x0af54000 0x0 0x104>,
0x200

> +				      <0x0 0x0af54200 0x0 0x0c0>,
0x200

> +				      <0x0 0x0af55000 0x0 0x770>,
0xc00

> +				      <0x0 0x0af56000 0x0 0x09c>;
0x400

for lengths

Konrad

