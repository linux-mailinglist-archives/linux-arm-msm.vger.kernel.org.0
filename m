Return-Path: <linux-arm-msm+bounces-96518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNaXJuvHr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:27:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A453246505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F411C3027954
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB223E9584;
	Tue, 10 Mar 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nF2Fi3PI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYWE7u/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734C3E8C6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127652; cv=none; b=WhfxLcLVUNEsjhmF0JtKtBU1lODh5Y6G23BLDhcKWUS4MSpFObg/d7scjgty9DHHxKQeSZjdfn1S/AZi4xdS7Ye89YF0pl+UwkuDsGnM1ctdmvWqn0ZuqS8NbYPadf4Uy6sGKM4xt0zb3Y53sBRapsteyiR71PJnPpFo4p0NYmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127652; c=relaxed/simple;
	bh=ZFUBXN4vPD2AzDV+RalBsCirmX4aScmxWBdY4ri9AhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrEuRMkjM7Vjtp2yeP7+HU/+3tmzdOf504TLS9Id+/Z7ejGMxuddEo7ImEZn6Hgnkmbs6HBK8sEZVyRuqDqeFnwT+DtIFCG/O3rSBVjpnoPNb2MLHRA/v/FQ/y05D4ER1yWZUMCw/EAjCycx3+khuE9Ca/x06hwoklwlcENOJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nF2Fi3PI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYWE7u/h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VKWl2021370
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3zx6nX8eJEkJ/dzTTkUQO7iUUXu4TyRs6dnEcBEDUI8=; b=nF2Fi3PI45xErZmb
	IzIFOrFbLGjbmE0GdqHZ9afch2dtPgYwm3WJFNeqPnYgMkCsnEzqVa7Zx/SjjqI5
	2V/bynwfCOY47SMyJkOR778frcUwL/T7s3sQOnKkp4bWkidodvaOaLEGjZmEpIVQ
	T2Wro5B8eh01k2ZPIgnN4TJNh1kln6eZsfi3rk6i6YHUO55ookOLkpSLJ+3KZlyl
	aS722vJYOS6zoA1VtEO9FzE3PBbJBuhii6iKHJwLh04XInHiKaRWhXirJNPLOInW
	/mKwo+SJuEyrhXF5xqHypNtC77MDX9dI40vTozCgMyJzEdtAr8HdVwBSJN+4f5M9
	y3ESCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w85ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:27:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829793ffc51so248375b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127649; x=1773732449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zx6nX8eJEkJ/dzTTkUQO7iUUXu4TyRs6dnEcBEDUI8=;
        b=OYWE7u/hkGZ6mE0h8wQV/wX4c3ne85mAy8XybHzFzTarWiKA3QyQSf3rX6Jkfw2wAx
         jHktyzSJJUtjKhEO4UBXAXi6ObgMGN9lmYypPfwVinyXar52tF3jKtUfn2/UyL1ih20T
         lzDQSNU9hrmsbDoNHnZmC9V/q2mjRJcCR4TSKdtmXuVN2kcHqWDkc6q1FmIbdTBBNBQC
         ksMXuNDZrv9sOKAKd8O56eRVsEKxQ7x2roJaF2Xm10hmhO9ZgBgeZEWOzxLKQ4cp+4kf
         KX0KfyeWVwsnTgNOmq+l/FuPW5EoiqktBB11pt4rsXzF3aU1BKIWUnNS3WUEJqw8MUe1
         BmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127649; x=1773732449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zx6nX8eJEkJ/dzTTkUQO7iUUXu4TyRs6dnEcBEDUI8=;
        b=g5coInTuUCr4yw21alIOoeGwxGI/0RKF7Nxld1hFMQh2ayMJNnSL9J8k45jafzZ0J8
         rPbzLqM7esaBJp8JvSm3Xm/wBsvZYIOa7B4cK7DM0CgEH3Cplfs8M02EdHRav6HlXYuK
         yLVaN1oBjYjhiy2m/8OXSSzUr6W0nxw+O1NvQPEY8x91YstS1EJbVSpLmaEkiA/ey/ob
         iIg65hAiDgMreJ7KhVOexsjYuMP2Vuq4NXHyXmtteKPSS3K1nWhcUh+yQvqOP8T7qkmV
         3x8K5+/RzRyyZnXOogzD0w4dMeaU/BAD12UFzC3ryTlxZ4KdCTn33Q2UASEzxWIS7u7s
         y0tg==
X-Forwarded-Encrypted: i=1; AJvYcCX41F8dmz4lGhdBScVBzFjX7fKii3SqTHvkgv7DwhAfRlXDAJQcqWKyHDqVz5GR9bj5wPJNaxbPW0MXtZt2@vger.kernel.org
X-Gm-Message-State: AOJu0YxlwQYrlUy9ziiWO+9+8usMkWdUa5r8Nj945jnKRFhmjbTzR4V5
	AVEwxlZT76vJk7GFLzpBAh9NKoLjSxXgM9ZkRz1vd56S+LArZHgm6i7CGUR+OvlJQWRlahImgUh
	XaB7l+JMOHvm4lDH2zXqSCw4A1eqFd2lu2IF/yrX1wde/xLNXwYk42/s5kOSTJ0pL9k1c
X-Gm-Gg: ATEYQzzRstI6B5YU2vKVz6YRwSnOvPgD8YSap/vbC+HuprZM8X+5A0UOOPZOu1wbxsn
	LIR08A9s4nYJlcSwrHo5xouYZfsUb1cLPhAXZCNWTS+207PFHk/NLD8pVQMNz1TZA0qc8xIqi8t
	FuBhswGnhtbf90cXy1JdyiQkqZMHoy1HQ1V9hchBjy31jCcoryMjyPDFCHBCVFehi+PYqb0MQlv
	atfdZT2Iqon64mm0aHU3H0Rwo/Rs1VuvE3sRN0PCilP7WkmbSDuWjqW7iNc6uwVArMH33NPCf5i
	MqPZXqWvwySHDpiHtIOlr3p01AiWm72lhHV9kNomh3rYkRp8hAPrGYMEZEmY8Mep2331hlaapjH
	80qEeaakW+a2knCaGDNA1SWECvWCs3ZNt/tO0VRKCBGuoiS8SeUBzjXTA+po3pQmBVvOw8lRzTg
	M2ZnD/mQPlPD8=
X-Received: by 2002:a05:6a00:2282:b0:81e:fd4c:fb39 with SMTP id d2e1a72fcca58-829a2ee9cbbmr8194237b3a.4.1773127649482;
        Tue, 10 Mar 2026 00:27:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:2282:b0:81e:fd4c:fb39 with SMTP id d2e1a72fcca58-829a2ee9cbbmr8194217b3a.4.1773127648919;
        Tue, 10 Mar 2026 00:27:28 -0700 (PDT)
Received: from [10.133.33.95] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48678ccsm11596805b3a.37.2026.03.10.00.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:27:28 -0700 (PDT)
Message-ID: <126b0f41-90e0-4284-ad79-082a61c99f4e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:27:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfX6qKcHtTDDmJO
 sI+eRv5xZ5sl9n+mw9h7ppXHZd9OmQWXkIQPFQVSqPOyZP0l8LeQdnygjAAG7FZ7E5D7/Aqj104
 SO18TkMGKcIBPSFk/hLRtVyy3ndGpWuaDY5PJuG+6qVjK/su2hgCWV8cId91Urpr4z4kkOTPxCg
 L9yS7nfoPw+Rf5jgXmaylBNsmc4NbxUFOCQS/Uv+rYPImN9+ijQHWOZaTzqltZXWSb0v2ech1al
 ZWTRrYETNjajulxNfdOPOGthbsEdiUNhzSp2sK25rgebxkuy8IXegZ7990kp8kdMPwLQ8rc6VxI
 +YJsyH0D8L1p1qWg2K1OqQogAoX/m8kN74I9wCb1xkbcT8IlLeQJeYbuCc/bjXTjMYy+0yBEOEE
 ALgGzn17T5vcu8SXWanIdZmQjoLij/5JYW6Gvi0vxqBweXXN5QkkHGNOTMyTUIT3Plr1aTBdNGu
 8iG0hWodoNgjhtGKAVA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afc7e2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1RLpPmuyo5zqltGQsSoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: WC_BAqoSwYEEwZtDFm3oFOzOBmo_pZVG
X-Proofpoint-GUID: WC_BAqoSwYEEwZtDFm3oFOzOBmo_pZVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062
X-Rspamd-Queue-Id: 4A453246505
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96518-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/2026 1:33 AM, Abel Vesa wrote:
> The Glymur CRD features a WCN7850 WLAN and Bluetooth combo chip.

a WCN7850 M.2 WiFi bluetooth combo card.

> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> This enables WLAN and Bluetooth functionality on the CRD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 119 ++++++++++++++++++++++++++++++--
>  1 file changed, 113 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 0de7d35e1148..bcee513e477b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -190,17 +190,27 @@ vreg_nvmesec: regulator-nvmesec {
>  		regulator-boot-on;
>  	};
>  
> -	vreg_wlan: regulator-wlan {
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>  		compatible = "regulator-fixed";
>  
> -		regulator-name = "VREG_WLAN_3P3";
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
>  		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  
> -		pinctrl-0 = <&wlan_reg_en>;
> +		pinctrl-0 = <&wcn_sw_en>;
>  		pinctrl-names = "default";
>  
>  		regulator-boot-on;
> @@ -219,6 +229,66 @@ vreg_wwan: regulator-wwan {
>  		pinctrl-0 = <&wwan_reg_en>;
>  		pinctrl-names = "default";
>  	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_e0_1p8>;
> +		vddio1p2-supply = <&vreg_l18b_e0_1p2>;

may remove vddio1p2-supply since it does NOT use 1.2v IO power supply

> +		vddaon-supply = <&vreg_l15b_e0_1p8>;
> +		vdddig-supply = <&vreg_l15b_e0_1p8>;
> +		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
> +		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
> +
> +		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wcn_wlan_bt_en>;
> +		pinctrl-names = "default";
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -616,8 +686,6 @@ &pcie3b_port0 {
>  };
>  
>  &pcie4 {
> -	vddpe-3v3-supply = <&vreg_wlan>;
> -

Ack.

>  	pinctrl-0 = <&pcie4_default>;
>  	pinctrl-names = "default";
>  
> @@ -634,6 +702,21 @@ &pcie4_phy {
>  &pcie4_port0 {
>  	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
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
>  };
>  
>  &pcie5 {
> @@ -873,7 +956,14 @@ wake-n-pins {
>  		};
>  	};
>  
> -	wlan_reg_en: wlan-reg-en-state {
> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +		pins = "gpio116", "gpio117";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
>  		pins = "gpio94";
>  		function = "gpio";
>  		drive-strength = <2>;
> @@ -888,6 +978,23 @@ wwan_reg_en: wwan-reg-en-state {
>  	};
>  };
>  
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		max-speed = <3200000>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	};
> +};
> +
>  &usb_0 {
>  	dr_mode = "host";
>  
> 
> ---
> base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
> change-id: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa
> prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
> prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
> prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
> prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
> prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
> prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 


