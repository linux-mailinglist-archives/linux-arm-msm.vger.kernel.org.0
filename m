Return-Path: <linux-arm-msm+bounces-84782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9ACB05F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 16:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C44D03015FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53642FE053;
	Tue,  9 Dec 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH7AwVSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbnQwoyL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE02FF177
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293255; cv=none; b=oNRclsZVNF2q2zEPSWHymkIMSSnf7qndriQHcdjpImORPegslar37fxozA6YPCx06pU2KGl+psRBdvVJKG3G5/IlFesXtEGGRD7sw5liCkIGQdgouMJ9u7m8ju1tYw9hnVlBvv6dNkXCAJwJkDkEcvZYOegu8KyX42xyFGXLOwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293255; c=relaxed/simple;
	bh=FOMD6U1DvpjRdPVkx9tK85NtED4e25mi2iDMNC6fXqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTUFxjt6ZA1nK9bUwndb1cE5bqBBBtpOx2hVPnhJHINOuvBXPSeVBTb5meFTwjisXKpprH52lZ+Uo5IZ3yLNW40jyghgOGWrPO50QYMPmuuIKm6eAAHjsNYLJ5YyS76te+xiR9meqrkaAYT6aYJjnZH0GwZYy/utJ3pD8Dfi7b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH7AwVSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbnQwoyL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9F9GtE030114
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 15:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7ire97PnRkZFa6lbtkmqUdBf
	J7CD1UcmGngbNRC1tcg=; b=EH7AwVSw65I5p3aB2q1FjY0+3/tLM8+kuGiLttb1
	xMI+0YNWmiBMyAn87TlGeVzHgoLCuEsRIVA9741d17O+fqafjzDqTLg4bLvUOc9T
	SK4kFABAlcDmyfmPlx/MaAKK+/45DeKykMMwlgv3dzURvfksAFPmmjqYLmeQzDDa
	d+H6wJPSkKVxbY/I9XWQYWNkso1uvc0RwUNh12xzkVgeLj6heP/Ea+3c0mihmhWI
	B5y129oQjxl0wbnbz7Mtk1uHyG2S1F/ML78REhSEQ/oNYaLap7s8iS1nU8iEalNh
	Struk5RovjF85qK8XbeDJGSQaOyhd9/m+lXWlw4BmmRCoQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p00np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:14:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9371caa88ceso3184639241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765293250; x=1765898050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ire97PnRkZFa6lbtkmqUdBfJ7CD1UcmGngbNRC1tcg=;
        b=gbnQwoyLn07zv/vpKHZWatZDbK0FZlZzh/D4Y1HcrYsV+Q3qr75XAoqP36FsS/bCG0
         38zL27EnvSo+A2hj1KvPGPEwli1pQ0QJvzLjwL/GoWzPATrugYzKPPU9hiO+gtO3hkpE
         jDSDH/KQxVprVgKXv4JzCxe0QGmIj9tptgzGmm/HftbzSmkFPDgLnl/cO3bua4WPeDcM
         n40IUDZ790D3qC6ugaURdTVoeMXexicA51WTGT4q8JUv2wL/OsV4jKWCNgp6/wFYQTl5
         9C2+CR6GI7YGRWrp/lcMdi/Xz7pkVieWUJeEik9dz/dIM3xqrECgya10V1ByG+/tck+g
         CwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293250; x=1765898050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ire97PnRkZFa6lbtkmqUdBfJ7CD1UcmGngbNRC1tcg=;
        b=Ge8EBiubTY7+F00lFxXFvNGmsC+1oktkOPF8qE7ZX3Cbp7Y4hsdqxTjr7vcrtXNBJz
         Dpxvhh576Aq+tcQEqDmxmZPLjZRJb+UQjXwjW1i0iJyQ95/oQtBAJ/CMMJYJ6tTRX51z
         RnweWZ7tVgZRE7adx/rfqPk66CEG1d5JD1AQaUJY9V3gpFbtSEhMzvwECxM+XvaIvFgl
         39dN1VL0zK7yu9N5DK0EPu0prONptu2WX+niZusO9Zr7FP8Fq0nQgG+Tp4ln/CQ+Qdgu
         K7tigBE9foZK5VVnamkk0eo8SokmuP9YdmZk4mS1a/+0azJ0Nn17AMqDkndYSj1L/5i9
         Jr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb7TyUnrrFrXQMgVobkXxsMDp8mB6hFsEmiI8U+UruytvAkCn3tNYWS6Lahbj6ZRBtabLFiFkRwlADI0s6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtz7YRfwqjTSV09mib31ZUpEXk6n20wgPQ8qbspi5v7jmYoVmI
	rcVUSC/Vj+hMfhRmKAHPP2OenZnw3vXb0+kPWPLC4fdxKiiqjiY/xrZiYzEXPryzAjaob+eknWP
	gqeyOHEodPkj7A0Qz8j2ZhoVBfYTNjwz1NXgx3hPf4smP+BkDTeliJm0uMLv57EkhEtv+
X-Gm-Gg: ASbGnct/mzDHXESk3pzRY3rVGPU9Nc+EJth8OHPQCBxmtLRjI9RugdpJV1pdSyDA1nt
	+rRW5VAfoTfoNPtWOPgxbWsL0ildfu58y2khiT56TzaLxJTcvTi/h1/q1ms0eemP+I6CFXfA0Hm
	CBPWbm7Kin9MAf/tFsXOhYyIhkZ3XY6RLyiy2KIiZbvyWxLHSMR0OkPdREY0GVWXxYbiW0OfI3L
	sd9I8MoWy+h+jcdC/T/HFENFF3IKrZySNLX8Sj2Y1CotkZZu0HsILJnFu/BwoEdiEHIkqbpntmt
	Em1A6PrQyCc1nFeYiuE9UZUsreT5nlRdweY+H2haftooSBkjZ9zjnLxRXQpQ1+dwNHU11AG1hkn
	ggcjmKktcpmc6rCxhz5BGVbWJH3LmMbcQO+q9KaO8BNmsHQY+NzaHc+gg27iTb4aSdO2PbcGa8U
	F7c/OHitKKErDZApYUQpGUyAQ=
X-Received: by 2002:a05:6122:1d92:b0:557:c467:7994 with SMTP id 71dfb90a1353d-55e84610542mr3014386e0c.2.1765293250454;
        Tue, 09 Dec 2025 07:14:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbbWxeB4rnjgTq1ioAT9szYToVmyeTZMFP9zFTqVOEMCpo51BFim6bjryWjkLUilSbubj7WQ==
X-Received: by 2002:a05:6122:1d92:b0:557:c467:7994 with SMTP id 71dfb90a1353d-55e84610542mr3014369e0c.2.1765293249872;
        Tue, 09 Dec 2025 07:14:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e9e9sm5288888e87.94.2025.12.09.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:14:09 -0800 (PST)
Date: Tue, 9 Dec 2025 17:14:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com,
        yijiyang@qti.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for hamoa
 iot evk board
Message-ID: <gah6rlxl6morhezm5dyknb7dg2uaqdd2uk3y5cvzsznpywal7k@xzfxc3kuvds4>
References: <20251209115924.848165-1-yingying.tang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209115924.848165-1-yingying.tang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6SWooPzY5n-5KPgW6NYqCvL4ZIlnOEpC
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69383cc4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F_M07mZuuNwCdFhuFMUA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExMiBTYWx0ZWRfX6h0jdN+xewyE
 /4EmUyXbNLhzMf16zU7yk2gLTHs5mwsOi/81PmfY96YVSE/uwWcyiagXnZwF6EwSQQWSd3yPz51
 w61rwmPlg5/fB9KjpS2wZq6b3jTztv4b+sIGk9xBhH+fePlITGM3Rh0FawRwvgaXZqgKC9hE8cy
 ddAZHVwdS3Mh4YksirYbCgb4QCyaeJ5jF/Oof8SPGU2OYpBkjd9P087XL6XsVvdpYFtIReGORQL
 SLrEeYxshh4Bljf2mzhChQF1paAelQ3fLoCZ575tmJjBsplmDuRfORh8gbUYDEnj8gnKYz+IYQ0
 BheEIthWVYC0a7wANuMAdZG9Ul9Emyfx/fywFkUAdXilSVEbNuel6lUYr6FwzD20vMdpcMq68Z/
 f4Yb/n6/xxhZUBFuWWQpeSWEJWYJZQ==
X-Proofpoint-GUID: 6SWooPzY5n-5KPgW6NYqCvL4ZIlnOEpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090112

On Tue, Dec 09, 2025 at 07:59:24PM +0800, Yingying Tang wrote:
> WLAN card is connected to PCIe4 on hamoa iot evk board. Add WLAN node

IoT, EVK (the same applies to the subject).

> to support power sequence for this WLAN card.
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 36dd6599402b..d66d337292ef 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -534,7 +534,7 @@ wcn7850-pmu {
>  		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>  		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>  
> -		pinctrl-0 = <&wcn_bt_en>;
> +		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;

So, it was specified, but it wasn't a part of the pinctrl?

>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -844,6 +844,23 @@ &mdss_dp3_phy {
>  	status = "okay";
>  };
>  
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
>  &pcie6a {
>  	vddpe-3v3-supply = <&vreg_nvme>;
>  };
> @@ -1143,6 +1160,13 @@ wcn_bt_en: wcn-bt-en-state {
>  		bias-disable;
>  	};
>  
> +	wcn_wlan_en: wcn-wlan-en-state {
> +		pins = "gpio117";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	wwan_sw_en: wwan-sw-en-state {
>  		pins = "gpio221";
>  		function = "gpio";
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

