Return-Path: <linux-arm-msm+bounces-85876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2BCCFE1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A492730393EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00595340DB8;
	Fri, 19 Dec 2025 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOJZeZx3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCV6HPw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80895340A63
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147552; cv=none; b=OSqQUjUZXaMBCio5oFUHSjvdliTq+7bgVFWb28XLFJFvLmAgvL1Vgtp5SDp718PgiWPlHiXdklQKMSfxa9WAOEo8ydJjuR3gOpfBNsFZLsl32ngvJKUATTC8yxAgLAGGNnaWAhlz4lgFtb86xSZaGs79eRzaOpn5e7PKxV3UrRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147552; c=relaxed/simple;
	bh=mZFZf18BY/ufK6zFxztQ9i1a1A/GLj96ahIOqJb5zVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSjAhkipDEsuc78MkrqmDLrTrTjxQo1vB1uAnk9xgoOy401QWdmzWHIX3tr5AkyAXQrR3nNSm7ZUib5wEE/nsCta1EvO+T7sSiUORDJVFppdy0oWLTo0JC945pItlGTDp90CiLkrOzGgINxK6SS0oUT+TuCauxYdFXqSOIUdXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOJZeZx3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCV6HPw/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBBIb44102694
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8u9oyvu1hGtJNJiR4DhBrZamy4UAVZ53w+H+cr2gGAM=; b=bOJZeZx3YgGwsbKT
	BDuhqpcasnPHG5xnBxsKd5rFHbg6tOTv8t56t33asZkM3kvmbTf/MDBS2gsV3BnT
	+rAbQiUWkpKJX7LBx3owpk0GRxnuo8uQOw6jBleIeg50DlehYdJeP3AxRdbnraHz
	AOdIlSw4WAM8v/PByvKQwB1ATLjltLrN20KHW7vkgTyBIA4Zsho2/JAslg+Xh8Xs
	mDzxKXObH8eBImEvWmIhVobw7Vz/l7Cokhi3Ruaiqk3Of1WQD8n3JtGRSOq5z5ND
	2q8Ww3w+Dl0UOnuT+hNu1z2hxWMcGpO+qWL3LQbXKBXpo5otNzwDxEciltxG++e6
	oOvGuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2mju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:32:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so4156101cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766147550; x=1766752350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u9oyvu1hGtJNJiR4DhBrZamy4UAVZ53w+H+cr2gGAM=;
        b=RCV6HPw/CNbwAHzwQfZV4P5g3LOG3Q+e1DAeJFA1tc1I6hpIzhL2nHH6VFyQk6DPlf
         AC20J2/rMOKOGcNtVkDt2J/zi5np24xOCX9Z2NWoze1LJqjAAr/Lg9I9cqgVcj6JSuaj
         79fLghKt+cPgb2tcdU7z1hrzPApmyoaqghX6Cq6+kf7fzr22zYuh0YOxV3hu355EAJrY
         4TuWIvfmWLk6UrczhPYQiWSRYQbxbHXD0Dog9czzjvaLoH41HmY+ywiEuZsBlvXa2dMK
         SQXLFxRR8B6RtArszokvtoyg61TG9L6jgTSyG3D3eYuyX1ygEnvy6LURyoQh5pru5kKT
         1Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766147550; x=1766752350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8u9oyvu1hGtJNJiR4DhBrZamy4UAVZ53w+H+cr2gGAM=;
        b=sPObJ5StkfLgD29qF07R4MTrW2lDn6fEPK8jgB4CoYalk1eqIfTTQXRCnU8O8ETKUl
         v2WSu/6zdZ2KlmreL2psJ0VVBXE+okpEnqeGTeILQmxGJjxZxJOT5FdrpMm8GCblJPib
         8DmsQGQNaNW5HoyjH12z4yEe8sJO/KFN5MbzIto9Q9icKgovmhxvZ4QcOxe2soJYRxfh
         FNDMxh31izfCyGi9ImbMcISchh12oCZdTlMiTw8ikdDVpjq9Qf08dJdAKapOdbINTKEP
         ZYevVhw504njhwQoxzK5tKO7Diq7vXTZwVrKjruj+6LXT5su6ADtj93xiTkHhK3pAmwR
         qMyg==
X-Gm-Message-State: AOJu0YyPT67w+2hzO1uHR4dcrpydS748PphYaj5NS3IFQG3ieOIrAkGs
	CZlHX18GLk91dPrCx6JSU2GqvXfA7mJPgW3X3Q+0a4NwxzqmZrCn0Qwy5UWt3SfOyAs+Vcx/qxR
	GJiDfp4xKIdnUKMInGqeY6kI1ud86r+i9mZfkdpUuAqa7My10lDIT0UCPHuOedDeEWq9X
X-Gm-Gg: AY/fxX4KnZ994zBRIQmrEyiTAVnc5JW/TPFQhVYcn77Ekc7n7sP3KlKFLfUDBlB9mfk
	BW87H+P7L3qVkK7zJuBy3fNiQ4r9zUsybeLY6vxzyJN9mw845px0aWykBeMZJMwEf7NXd15WkHY
	ARsBKNP7aa0I8MFc6zOa34V3u/DnZph3W+QqdrisXZ+tC4EvN5Pc8v9ASZVIGgSIhKNmjC5t4TA
	d0aS2X8saUrU9hFq2EREosDm00tQQfT/aHhsfuj5Ki7fADQewFWstst7MILCE4JlbUNh36dYV3s
	tlyVnxwrT9ACVcYh/b7PWqzg226nF6QCgFjMKYEPCGZ17F/fp/33R7AAzFasyMqdaeQHU7/7llb
	DFZEw6frgN5Pp6THq2X5Eln0Ld8XMzBcbDMvOPHkGTwyMZxyHr0SyphJtALdmcJBRIA==
X-Received: by 2002:a05:622a:5c8:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4f4abd173a9mr28999761cf.3.1766147549682;
        Fri, 19 Dec 2025 04:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCLarACSlXZpDNlKsP8TnF+SwJ7xKQm3Iz2dIDLFiWlhyQ6rlJ+J5TUvkOCo7O4V6PCoN0cQ==
X-Received: by 2002:a05:622a:5c8:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4f4abd173a9mr28999371cf.3.1766147549199;
        Fri, 19 Dec 2025 04:32:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad2732sm223677366b.20.2025.12.19.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:32:28 -0800 (PST)
Message-ID: <b09d427d-0276-46ef-ac85-8f4bd4dbf42e@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:32:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100: add TRNG node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20251211-trng_dt_binding_x1e80100-v3-0-397fb3872ff1@oss.qualcomm.com>
 <20251211-trng_dt_binding_x1e80100-v3-2-397fb3872ff1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-trng_dt_binding_x1e80100-v3-2-397fb3872ff1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNCBTYWx0ZWRfX2bvm0pgpH5fg
 8fzlpZjzn2mzMJD5n0HAqV2JZ3nMUYCHQgy1BbkJ3LtUUoMXA/i8fDhb0Dy9m0w42l2IeWpW6BL
 L1uMKoTJN2xqSOo98Mzm5+2U1XEU4Pu2tC7dPHFZwPo2mT90z6IcAN1OrCHZ9kTOBSbuE8lzJlw
 FWRl1TvYbEB8O1FILX0XlNsT+aC/pp1blKmtqp+q8cTXLaHar+g95PIp0cRKJT9F8z0sBPKd+cQ
 yYPzQ395ZBCEikfGxoo3mjhx+PN6wtHwho6W5j1cZLGv5PsFzaFszNPXkbC+j03czSpat0AebUT
 UBRHjy4DwYOAisT55yZIV7LoroHgMh3ukkp4F2qBSD1tCzGuHn+qW1Jc+u41OoOdAh5XSOpBtcU
 EtBO0ZH2w3e+Z0BtmPdvWA65WggBZbW6P/N+3HUEGWXYdl1EY1XBQRuTjsa29PWCCuB7wG7fptp
 0vQHBhy24PcLXp//L7Q==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=694545de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-fCe_xzhPpQA6hE3_okA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: gum3S95z9FehgbxKWvtkRDzXP_6Wu3iD
X-Proofpoint-GUID: gum3S95z9FehgbxKWvtkRDzXP_6Wu3iD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190104

On 12/11/25 9:45 AM, Harshal Dev wrote:
> The x1e80100 SoC has a True Random Number Generator, add the node with
> the correct compatible set.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 51576d9c935d..c17c02c347be 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3033,6 +3033,11 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
>  			};
>  		};
>  
> +		rng: rng@10c3000 {
> +			compatible = "qcom,x1e80100-trng", "qcom,trng";
> +			reg = <0x0 0x10c3000 0x0 0x1000>;

Please add a leading zero to the address, so that it's padded to 8
hex digits, like all other nodes in this file

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

