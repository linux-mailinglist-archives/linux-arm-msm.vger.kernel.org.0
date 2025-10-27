Return-Path: <linux-arm-msm+bounces-78852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF6C0C555
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0232A19A144E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 08:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61E62EA464;
	Mon, 27 Oct 2025 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHoznKfo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8E2E8DEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554206; cv=none; b=Pv5FAt4RkR0h3S31ymNm/fmvlUcaRY5kzUWio9r4otS052LR5lFdtvs3//R4QBTcdfnRZG4K3rqRvZpBwffaho0mKpB9rTgY18kIl7OBh61DXKbeX/iHtBeo8NkKDg0cflf1jRHMcQb2+rh5GXr3v2taluSXnICAF0fU/cdJBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554206; c=relaxed/simple;
	bh=r0uthwun3uYanqM5VA6Ncp5m/vK3sbk/57/hXner8c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIA6EkQqDqiTqODhuDs95HKXvmFHHrvR1zfZpNCyr2a7O+DAAA5wsWp3VyrXq7klfSA/+kz2SiTPL/xd1eGl6pcgQvyFjPbE7Z+YKw/MTUda5PSPXgDDbtvLeK9yMYAozV3q210d65QtKgyuwWk3QHiASpQ3jiTpRZmDuojCnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHoznKfo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QNGZxm1011806
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGmrTyCU42ZrdU0m3fMjn1h4iKQkzqG+z7CEE0xZp18=; b=aHoznKfoepIGO6fh
	7JqeC4aO7K2Pg0+CFVldon6EmYYvGQjptvN7eFQf33zE6jlfYK5LI+uTGe1u+r2X
	99oOy2HubxsYi2hS1fLwMNiY5TMWNF6cIQfh0HJxZvz0kSK69t9ajjlFZnIORuLC
	JcXIiZYLJci5KRcV3bl2lg7d4VzXqRHfEDYxOD2UuMmUQJrcB53J4pCJyy9W7knd
	7MZPCcnSUNu4fYDMJ0zz14p47di6rRSf8/3AFl0UpIiAMwBIpWVYixtiXncRxZLW
	kTbHacxxYWQ/70mXd9A1hHbl2H5zBlZIH+oeYxyekwmg5eD9iKsS7ZFGXY2QH27F
	GWmN9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4wbv5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:36:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1c70f1faso19845556d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554203; x=1762159003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGmrTyCU42ZrdU0m3fMjn1h4iKQkzqG+z7CEE0xZp18=;
        b=B9lEnjTAd04Eu+Z106dLL4L7sbjM+fIFOBGHPAValu6E/16/D2R85lDrCv9FScIBqY
         FCV5KPLqppkkwjL/OUeCltvhdG+pCyH94MoC/5WuLg5L4kGaOaT6TjeBy7c4IAVvkAx6
         f/sKhDxCLYJ0xR8JyzQP0PsGfe/ylLi4fnK/biL1ghbMNotRjNNjmd+woCA24P8G6Cn8
         QJ47Y1r6RKQ87lh6sKcKu4d9rRBxCOG7zDtLbW16CxxzEd+/EXNcfNScdNxGAEj7tyrJ
         O6DZYMj72qse/JxDzhgbFsAlj9pBZz4BaTIluMt41foPPc8tHDQs1MdAXNhhPgm2zUR7
         I3hA==
X-Gm-Message-State: AOJu0YxeX4U9m99/j3LnCgLPJctAXUOjE2SPuBXDMIycwGetHq0726H5
	mgHPlvsjbZSEEwChTz1pA0Q8ZlIuadyZYaRMn81JYa+KaA27oWt4FkOeD/P2cs1TTC+Xqvy4bvC
	u4Hy+mDXAQihE5zK0xk1ZWUigqpwHw47adKn5Vs1uIJ01w8rqwZ6dGiLdpTdiExb3EAt6GFlYgP
	wN
X-Gm-Gg: ASbGncualCIajsatPJCjoFKuZcAayWp/W2JWgCgqSHn7joydYFBX0Lcep0OlHcFJiF6
	xpkPFxLdku3RrTNl9/y5E4D77pNCdkuImQ5HHUQzBTWv3kEC+Hlm7/HpIPGqK6VSa5b8XiYsAWm
	zqus+uLwl99XL94m56Ok9qF//GgsbyPfugchRJCXtTZL+c6cmsBhe/5Nm5ypEkGMWLgsjbWGzf8
	L0QVJVAqlSPPYuPr8DziU1DbkbTw9hLDtAKxtyZMwyRpaDdfAoTqYUGYe5qXwQFMcrpp15n3SIN
	vY7X9kpR+eIMN4YqaXi7BGZpou8DfQHSRqQOxjqXeS1m63xeTG0cyiKzrKeWj3gCmUDKGqBGe/N
	KwROjgRqgpoqkPLWghgL7W/+a0B3xQchiWjbPdhDp7FMznmCL2+Tl4/1w
X-Received: by 2002:a05:6214:1ccd:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-87de70be59fmr193273326d6.2.1761554202985;
        Mon, 27 Oct 2025 01:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBxZSlLSLq628XOcOmQkPcgLeRYWLr0nk7UrCJ/G25yRVawT6YRbJyjiyHjcmiuuMvBfY5Jg==
X-Received: by 2002:a05:6214:1ccd:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-87de70be59fmr193273206d6.2.1761554202473;
        Mon, 27 Oct 2025 01:36:42 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85ba3798sm693504966b.39.2025.10.27.01.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:36:42 -0700 (PDT)
Message-ID: <e83730a4-f270-47e6-9bea-336c142eed11@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:36:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Add OTG support for
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
References: <20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZHTzQiqoLt7q3VjJ2yfRH6BbIgs12qbO
X-Proofpoint-GUID: ZHTzQiqoLt7q3VjJ2yfRH6BbIgs12qbO
X-Authority-Analysis: v=2.4 cv=NobcssdJ c=1 sm=1 tr=0 ts=68ff2f1b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=asFFNcRf_TYdFNsIYgAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA3OCBTYWx0ZWRfX/O2XcZ44enUa
 sMCnLxFhEtaPKlLSP3L3A6f9JGRi42Xu/KRADDEQaH3PvMiL1YC2txzvDTj3nGhBSiLGrY++ntM
 eDKEp7aTmsFKYMNIszTm5PILby5u51X8zuINDGk+93tMPx4gypuWB4jUl8GosRmaM6VZrX28xi9
 r31Vyq6QqQs22dQyjb8D0JaieNJUClfdac4GXR9tprCkWqq8IGMBmwlt3p7JKcqYiONq//2WRG0
 P8Ixnwn40YJL36UAswA9x4V7BslCZhy30HDJMABkTTw/AeScxXCT692+8DvyEUFK9I6kslW4NNX
 hKr6o+JuIMrJknnCTO3iqXcdTSxzgdZgYJLPMA+N8eSYHj9ieUEmwMcW9WDmb7NZr9RUVU8ng4c
 XYbcodSlhMxylX/pYsVFSRZPXC+IFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270078

On 10/24/25 8:21 PM, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v3:
> - Moved "usb-role-switch" to lemans dtsi file
> - Moved vbus supply to connector node
> 
> Link to v3 bindings and driver support:
> https://lore.kernel.org/all/20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com/
> 
> Link to v2:
> https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |   1 +
>  2 files changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c7dc9b8f4457..2baad2612b16 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -37,6 +37,35 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	connector0 {

"connector-0"

[...]

> +	vbus_supply_regulator_0: vbus-supply-regulator-0 {

Other regulators (as can be seen in the diff context below) are
named regulator-xyz-abc, please follow

> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_0";
> +		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";

[...]

>  &usb_0 {
> -	dr_mode = "peripheral";
> -
>  	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			usb3_hs_ep: endpoint {

Please define these ports in the SoC DTSI and plumb them through &labels
in this one

Konrad

