Return-Path: <linux-arm-msm+bounces-59563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119CAC5058
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A9417A5255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603DF2750F6;
	Tue, 27 May 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7AujiWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E92749D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354246; cv=none; b=cZTvPBPKOEgbK7apc4hTi/Bope26EQpUpGrCyAfLGG9KQOO8OI8o6dVA24VarxGHFv5WtzkyLS7pPswLUsNZu/EiSQ1FgoGFRSEYFwofJ98l9NmlzwaKU6qTr7HEd2OXBDqc5j0rzfY1TqX4qYoMSv8swVenV7Qq7VPWY2iLQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354246; c=relaxed/simple;
	bh=Jf0YCPf8g0x+7itY5WOSav/lMYNDlkwoS2veAsYnXII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMc9bVb1HVJth+s6qgPX7wxnZW5mgEqFaieDN4SSrg7tR6kXHs7HaX6yyL0ihUDREtJRi/ZmPfK97Nvpx794bAK/eLOc866nYAyAsIH/Wp82FbNOg9qxQkG+sHa/+Rj82+2k6FKM9UmiqZefdb1+ViOY4Td6r0oS2oMJ/dhaOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7AujiWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA2URG007545
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyW9uKYhLOSUBJHa/KU3PEprBrYxrl5Dljp8vZpViOU=; b=a7AujiWHdvmjqQnv
	cEknsSF/Aq3dRo0wPjl7o6AHVK2Z2UUKs5YzTfI9nyEbtB4CBm3LkKtJobx0yLrd
	DmP4IoifQAT+9t822m+ZTVYsK94Nor4yNM3XIxc3tw/JsycII4/EMoPlPFjeJhJx
	49hGHT9ZdOGLGTVE99O7UNbQmFfTRNQ62EudwCA05J1zDNcvfZSmin2/3U+YxyBc
	DeeX/vLxo0VK/bPxCRzM9SU1wQ609ZM7L0r5WnJReQBG1RJQF4wrsg3Qvgc4/2Rl
	gxydZ4UxjM2NYLY3kBkayoH5QE9KB60PoJcc+dW92sGhaU9u6uopWdi6j+Qoa7P9
	KLKmTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8y2qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:57:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so1481166d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354243; x=1748959043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyW9uKYhLOSUBJHa/KU3PEprBrYxrl5Dljp8vZpViOU=;
        b=aQ4HR5V2W5aRo4t4j4/9YpukP5LvHTcKCMEORkRo8TL4ihyMCl0E/nY0yczRJBkpJ+
         Wi3tB2IjMLTZMj6UYHYeGZbUjisX7ZvEm599tO4f6Y4w72XCTdWjAb7M2gbqLzCLHWAC
         x8f06K+yPGw0Jz+vVSD9n6KxRe08YW+gaUF/gGKNGLhx+/LBzbpx+tlzFZ6ANOa7JLYU
         5zYf3Dh3jrkAp0r2vpdcQkUEI+QNNd9CIae4R7PDrrS+wo9shfCXfFvEqVt6+8GFo+xM
         OjdQLu6FBHZPaUz7vB51Cz5DRLyKTRIlpM7T/WyG5sJeRMu2OiurxaVndfLOH8Eb2AmJ
         yQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXnnLQZIQSD6tCoAhwQWgTV44qyfci30qqFj3RHW0PsQzqBLTX8CTO7s1YjOKpeWdpzq4xSrs1bqzYUmQEY@vger.kernel.org
X-Gm-Message-State: AOJu0YxZZjHdyXQPhGsGEWl/oBLt7D1Ra2fhFi0DaAqfR+iTfXEnSM4w
	u1gCxeTkvJnIdknzzFJEgWmuW6Sd80WG6v8KxXvTLBb3cgm8NlXCGUgQwG3wlvDBAkKzBq+tqnx
	cimNUo4xbRI/uRuKpJ8IBd3XKJCasacyWRSpVfxCPESJfY9igAlTQ5U8ysllQNuvigrvo
X-Gm-Gg: ASbGnctaq14Lc70P0BC+LKhIZgRvpCBoGb89pB2CtvjJkWOsjO3g0z3OV3YWl08bf1I
	FE3hWkvBZplhxPtxlzelpeskgfVIZNYVoBieushcWPwHBM5lu7DOOtJm7MkEjpu13nOcEHmIGQZ
	i+akqOggiF9dhL/xK0H0w1XQAX4K1wrzlTndt5PNPVQ6bbnBGU8YfqjR9ta6JGeiUlLWLt5E6QY
	n4dRENvFiECBdtW7GuT2AVD6W/guY/ylBNaxWejf3B1W4AflAqicQhkZhQmeW9HFPcZoenH7eCY
	0eji+TFs4xFfsSHcP4xrn9D2PihAYehDEDZiYS2d1pca0RevNIVXawB/8lnz44b2yQ==
X-Received: by 2002:a05:6214:2025:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fa9d35e356mr81224696d6.9.1748354242752;
        Tue, 27 May 2025 06:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy8CpXFq9dIDx07jLGkQ8eE6QzLzCZcUSNuxAodp8IkcqCYpVd2hVBDPcVrD9eccP7q+X0qA==
X-Received: by 2002:a05:6214:2025:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fa9d35e356mr81224466d6.9.1748354242360;
        Tue, 27 May 2025 06:57:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d443a0fsm1868061866b.97.2025.05.27.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:57:21 -0700 (PDT)
Message-ID: <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6835c4c3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=pe7rIdR15tyH1Ib53uMA:9
 a=6SDWfad8ZZyXS8WB:21 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KKQgmqbmm0PZps4FSNIQmrOu-a8UO8tB
X-Proofpoint-GUID: KKQgmqbmm0PZps4FSNIQmrOu-a8UO8tB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExNCBTYWx0ZWRfX+dStHEnuAEly
 tMaMuPSzxR2ocrAwd5xsoNAaF/KXqbAgguNJuQDoI+rZDyoe01Z81fvI7lnA44NGt2/TlOdvvTw
 MZJJaMeRBSvUH/c/2L54sbOp7RW3iLYLgJKDQdch4BMWLfa/pphdru6Mplql11BtT47ArrZwvwm
 pYWRHz3jnOfwQZwCBZ5azJn+6nUJ3g1SkalO7wehzBhONX3AiHWspb10mggf4jLKpzssSG3TtFb
 YdBELem93pfMMllyKaGftTYPQrkzle2SWb17fB5gVQ9bLb0g7DPdln0iCJ5QKbRkxePBawuouSS
 gVHrSgtK79Rr3z7+6tpzI2GMMWpqvPLut+LRDmx/M+tfwvmu5RMGT39x44pwI5duy0lNF3Q7uzi
 ED9pTCd1hBVInPscbH9QYt6VGQZ2P6wl6p9vZRf1vLVHj62o7Vy1HP7GIMlaGb4e90isRgwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270114

On 5/27/25 5:32 AM, Renjiang Han wrote:
> Add the venus node to the devicetree for the qcs615 platform to enable
> video functionality. The qcs615 platform currently lacks video
> functionality due to the absence of the venus node. Fallback to sc7180 due
> to the same video core.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

[...]

> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>;

QCOM_ICC_TAG_ACTIVE_ONLY on the second path

> +			interconnect-names = "video-mem",
> +					     "cpu-cfg";
> +
> +			iommus = <&apps_smmu 0xe40 0x20>;

fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)

> +
> +			memory-region = <&pil_video_mem>;
> +
> +			status = "disabled";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz = /bits/ 64 <133330000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz = /bits/ 64 <380000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-410000000 {
> +					opp-hz = /bits/ 64 <410000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;

nom_l1

> +				};
> +
> +				opp-460000000 {
> +					opp-hz = /bits/ 64 <460000000>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>;

turbo

Konrad

