Return-Path: <linux-arm-msm+bounces-62084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB70AE4650
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92ED0444748
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5F8248F4A;
	Mon, 23 Jun 2025 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AStK30X5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDA07263D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687779; cv=none; b=SpPMk+2PekOZqrC7SIhUdZjL8kv1ukg6AwkTeL3Q6C1pyN3weYg3RMvGr4zYa+8ij6dMl6rXOeCjrnT0nKzQ/RYZb2br4b20d9SckH1QxiHZJ5CFYB05lqTWT6233s0wl2ScS8KNn9lYgxaFhZfrCRf59DkBYkBkI64AjcQsFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687779; c=relaxed/simple;
	bh=J/FuLbVN3hNiRvuHYitenfWF6clJnuU08gAStP/Nqlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebybP3BtQYsWOtEZZTT7DRWMh/901Q/LyZ/uE4w2rPYsTIC5zIDbQYTO7+AvRlqSf++Pltr8Dl7Ln3jEfUag2opSUW5t+O1xLHeq4i8EfN87Vwh5u8QT+Weu4Buxp+ynS6PSbfpq8CRxcN0fOdehxASbS4QnOk6339DEm+gdVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AStK30X5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fYdQ021714
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dsiybX/HWDxpP9dbMXEwUD6RQ+0f2abW6Z5Exqzf8o=; b=AStK30X5Ob4/MLNu
	s1ymiMXGpjuo4SOqbZbOr5qN3aJHuwETDQhBXPSoMJKkBBNaBjV45Jea37XM5z6K
	z+zeTUWgMAf6Aryc4KsD2r1LQlbWXKuId8dHxf4HLyPg/HmZJmsNYnTsBKAYwPkD
	a34MnByZQn/P+DNVpztcv30xRS0fzIStOpa95DbAePSsHBvPvAWrtBz1Rmh70hVD
	bplhgkG46zmByACVlQRIf4YV3YDILM+sj/Z8NQxSBVJWIFkgYIKix9E0rKduYBbf
	8sHzj+CoMAx84EXrhmiOLGACk4ddoD+vwZRSTUNOI6xrULGpKykojMQWcyqyCqOn
	PkPkug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rps1nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:09:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso107490185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687774; x=1751292574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dsiybX/HWDxpP9dbMXEwUD6RQ+0f2abW6Z5Exqzf8o=;
        b=V/NpTZwXJ0juKrR/xkFPZ40od4RgO2cEio25D4ma8L5thhdIKLQqo1Ndcrdua3CJLg
         REYRVNmHx7E2nNhZzqhdi+1B1ADpS0SFGC/mRFejkkB8Gtryj3kKDjjAtVaCKnZUDhUM
         AaPqWNTI2pZwaMpU0SLdPQereswK/2zqHn1Mjv1pE8I8k+5MUDiGYiqUHERRjECAZqY8
         aFb4Wu1v3TZirOYMjWYOz93Sl21xdYULEaTEx0EXI59Aq31oTtmsPAbNrggx9udQdFRP
         pXy8+XKPGHqGSNsLIbucpfu0Cevc7vziRNa3pEr6oATPUAA5zHFVI6Xo3UpPbN2uOoef
         e73g==
X-Gm-Message-State: AOJu0Yz35+3+iGcnHxiIYMjWvnAz379uw87Oaryh4RkklYq2EfYNCcPA
	G9pB05qh2Eg5HtANjpmfc20TXTHi+DDxAKlgAo3SKEbdjXkKgYX1Tj9JeQd1UUEikjMNimQ4s8z
	0J1wk8bZwpzXxV0E4AP9BXA3XyjpOAI/4nkdJNTE7bA2AgfzjwT6AziHAzix21RusudVy
X-Gm-Gg: ASbGncv1vdU7tw4lMCKac/eSEBrpdm4Zh+zh+EwXZ8RiY1IUqMEfq3ux+Rm6W9wrq7z
	MPyZjBjPn9L5ozN6kKXUzkdqKz9a8eOEtE3ih5W6R7No0QDsfcxlZjNPPG+pbM60L8WU8oWwHOn
	f4q7Ss1QA4IEwRbbmiiXdiMoC5CZawLdzYcSeLFAJTcYPyOuHEXvPWES/v9bpePUXUO9+cuRxJT
	5AFvf4ZOYCDAVkOlYk7g7i6Xrb3VoBF2d5p2SGIog8fIQ2RRmHjz52et8EooCwKNbysOh2mUeJv
	XalToxHZnSz6+b3wFq41zchyaZuXEfXnMY8NDA1M0mLvFF4bFx4bJSUpgvwFYw1WCCBz4iq6y8c
	VsPc=
X-Received: by 2002:a05:620a:4708:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d3f98b4b8dmr740336885a.2.1750687774156;
        Mon, 23 Jun 2025 07:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnPAvBf8YdMlMuE/0qJYHRbWbS4y//cSXltTSiIpF0YzwoKZPk5uhfCDHboNWUYMZ9nx4HNw==
X-Received: by 2002:a05:620a:4708:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d3f98b4b8dmr740333585a.2.1750687773432;
        Mon, 23 Jun 2025 07:09:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a1505294sm32885366b.83.2025.06.23.07.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:09:32 -0700 (PDT)
Message-ID: <d3309e0d-d751-44c4-845c-e05eec4ac75d@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:09:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
 <20250619070224.23428-2-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619070224.23428-2-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=6859601f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ViSwFiuPWrUJpFAOtGMA:9
 a=R9dU3JXcjent7X09:21 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfXwMjOsAmZgExT
 uY26RcuTUNOm96TQ/ZgHI1vN7UrDECE57E39jpk5tMuE4sbvJPND4EgnCUx5yUOJ34C6OFve+UX
 LiVXRCp/qZc7b06nFHKhX8D3jK+YLsiI86FFgGVZgnMgxe9PwlMx+jhHp1Ca8iNTnI4bEQvSHyf
 WuWJcK7IezGSAhdz99FyTA+Xbtgjhyiv6mYjhji3vGXrnKxO2y9x0AAruiFvHlkBP8MwFjSfeK8
 PR3b/7Jvt5t2MOlIz77HCgIcZp7kmwrT8nzxhg1bPk7EOxgMAC9Libvc1TPzXACWhNYx9js/4fD
 At1BvbWaoYuMvhOpSTfPxk10rYb2QFnOvk/JXWcyI5nenOfai4VuiC171wf0uKp47NaDZ045VcC
 rPhAXGH0vBIrKcz9aDOernmmxGxXJ9qV0ItSP59GzaJy0dXm0QHH5zJqf3zjFRXu9/BJXPTm
X-Proofpoint-ORIG-GUID: scPNAit67U81_ycDaVSiwDUeFX2obKuH
X-Proofpoint-GUID: scPNAit67U81_ycDaVSiwDUeFX2obKuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084

On 6/19/25 9:02 AM, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

It's customary to split board and SoC changes into separate commits

[...]

> +		sdhc_1: mmc@87C4000 {

Please use lowercase hex across DT, in all places

> +			compatible = "qcom,qcs8300-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x87C4000 0x0 0x1000>,

To make it easier to compare by eye, we tend to pad the address
values to 8 hex digits with leading zeroes, please do so as well

> +			      <0x0 0x87C5000 0x0 0x1000>;
> +			reg-names = "hc",
> +				    "cqhci";
> +
> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			resets = <&gcc GCC_SDCC1_BCR>;
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc1_opp_table>;
> +			iommus = <&apps_smmu 0x0 0x0>;

In case anyone's wondering, this is actually the correct value

> +			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";

[...]

> +			sdc1_state_on: sdc1-on-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <16>;

Please move bias properties under drive-strength for consistency

> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_state_off: sdc1-off-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					bias-bus-hold;

Is bus-hold what we want here? Other platforms do a pull-up/down
or disable bias altogether

Konrad

