Return-Path: <linux-arm-msm+bounces-76395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC448BC4C21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9867C19E1EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47DE247280;
	Wed,  8 Oct 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwoqL+id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474AF223DEC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925976; cv=none; b=uNRVPMBYq6zyKRYcN/yyCHVAHfELgIOeonlZ9jC4nn9Nu+J6R1fq0lHmpE4/xAhluef0aJLw8geuezkBehfv9Ci3ZGgWnjq9lhS9hZkkwNt3O0OBxf9472CML1EpLyOPPZkpGZ3/2NjQHt2TEO0vRo7mwXBM6gHLSj3Jxq+ZfOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925976; c=relaxed/simple;
	bh=3C9eaopUZAw455bC02kQuNPxhWzWB7+UMP3o6UT0ZJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcJv+7GOBL8jifOOVFc6BTvQA8MZnnn5hqzNllIPob3IquU4ialeVI1uACSk1L/VzEA8qBzsEkKzbr5/2hzNMPQtMuPvOfoSLi+ZQeeFunhFoq7hLsERgRAdHhKt3JUwVWPVTg74NRPflg93N9R0kVi1Qn+P1+eX3jVLAl4U5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwoqL+id; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Njb031349
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQdcxBOzfpxWOin6rPGZyHGNvUTr15XcQLcwaAQwN8w=; b=jwoqL+id+8d8xELi
	EvNKl9YWFoZ4hKQTVdyeXRtvEOtgzS8zZmnG11irduQEIQkxeLR2VIBgI3s04xEy
	0dR/adni/1Y4VmnnWXiuA5NIvTMDfgI2TDBdaFK1KA+K12qtO210zAwcD/E2MB0y
	HXLlZRF5TFRPBJsxbSshabw8+UA8U/6ptkBw45jQpZVLDjF243GvXMuX8sD9La08
	Vi427iRqQNs08tMqreb1jxZ+KLUdLgl5YrsRJ4JFDmgswVqvXSDMfreBp2oKQhxz
	dmwkdqs8ooi8KJoCgO+E4oxBMk8ZF6MRs727mJ9RczFX7GdzKAXxc/ygv+3g/Cd0
	HJDLOA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7t9gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:19:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7958a07a5fdso22682016d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925973; x=1760530773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQdcxBOzfpxWOin6rPGZyHGNvUTr15XcQLcwaAQwN8w=;
        b=xVZ7ofY4l8M1z6VqHv/1devwC0af7xkn5YL86MdsARPubwVf46clZKjkCoVox4HHG8
         XnaxM9YrcZwu9QG6slwZ4hH9D1iTJQXVTvjHohUI8DghsviKiowo915YxYk6V5xCfvLU
         cViCEMS7MI9+9kaRfOHIkdjDGTIv18jgR7STqCAvEz9PAZljyphVwOEC41jp/sRMmNvW
         Zpb15dd8H62RGzVss3KOfl595I7WJmLqU/PI2xlFGsbm51Xh6F/7l2s7pqvElOdlPaMb
         /UahFobcgwHVw18QYkWRKIr99ASpNhxrjiXmTu5pMkHuTO0fFITODcXbDa0+FtIxFP0O
         xULw==
X-Forwarded-Encrypted: i=1; AJvYcCXkEJq63l1O8xEl1GFFEIcFnBEN8Mm5E237MLhkkqtfjV2iNgydrcCnXDB9Xwe7gXb/7s7fG5ou+Hv6YQZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7sDhLTxE8ls58TaY6N5sO0zanUsX2hLUA1NksotLUgdCdq7G/
	kQU9d4zHS9kFmnieZ018VvBS511GYo2peiLlnLLRFuRAVrRYJaLQNzD7Smj3qPxq4yQ7Iv+Dy+I
	ohcbqUz8tTPRlVwTLr1ECxTEBB7Rcs9T97Iuz6P3qHJVvSQWmlsO1oRytgc3gIl/k9idi
X-Gm-Gg: ASbGncsPshuTVF9yTGnzyoj57O564kUxUM+8kLZaaEahfwx7HPQqlXIcY8yJWIqk2r4
	HHN/c2DCNGUDu0oi9hkvC4qFZiB955Ti+WZAjQndnnT+tFhVFjmAyahVTOkxYkjoGCMNNAgi8+M
	6Y6dESqaTR3w1kAweqjzsmFakigKbqkXNfQoT/b2DNuceSM/VjJz06L+z+jFuSiOm9m3pWdA4JJ
	lpIf/k+MYxDWSi+19g1ckWw5auI1a9FuJ1/zhcP+WONwQz1YiDkQPm6nVoLjysbwYs+CS9W9srT
	uz0Zq8qfQSZbDMCgg1uiekdk+kXc1uNhA0TSkPDCGXrHqbzhO9abEWUobyeMqwr6c9omLupNm3y
	1mnspPuA1VHwd6yiudsiJhKJthD4=
X-Received: by 2002:a05:6214:130d:b0:763:83c3:5977 with SMTP id 6a1803df08f44-87b20fe428fmr27062626d6.2.1759925972850;
        Wed, 08 Oct 2025 05:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf0NO3O0wMYDy3C1r+xPkcF6ocxQiQ/fYTpALHFypihvfSo0fa68pHt0T57r7qjYpxr+HZMQ==
X-Received: by 2002:a05:6214:130d:b0:763:83c3:5977 with SMTP id 6a1803df08f44-87b20fe428fmr27062256d6.2.1759925972350;
        Wed, 08 Oct 2025 05:19:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639cd144d13sm2953003a12.19.2025.10.08.05.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:19:31 -0700 (PDT)
Message-ID: <f8671543-bba7-4ed5-ad69-297df9bcc43c@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:19:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 mtp and qrd board
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
 <20251007054445.4096630-4-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007054445.4096630-4-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX7x+E7DgBB2QP
 Lvn2NYkXXTHCu4+MAtZTh5j4ehdFv/Vt6eHymnvbrO7qA0OQ8ZlLCIDwC0JRa8Z1SZ7eYaoGhYX
 kLhE1Fu5qeFCOhgDK5g5Vg6sCPJnfePU/OFXgU630LzfZpsFfABGTNIHtwK77inLJLihEJ6FG1G
 Wtrs4MjML/wzzw6V2fAxsSkPNV8g0bJRY4QXd7AldNhShvsxrT1e8vnhQYhip33JXbwt3q1vz0U
 ItnmQVP04B66IY9M94P8Weu2EkDKd9FY8SpYO5554TnDG994QefXgZUQsmjO5RW4St5Q3C7+gqR
 NMcwsMf+QA/KgsvNK/a/4Vy1ug/3M0G6meZBagmJesP/HbnASkNDX644RRjHa8lfBB6c3LmCEYL
 VTBW2ajZasHv6Vjmmbpc34IIFJLFuQ==
X-Proofpoint-ORIG-GUID: xgEIHSH2V2tvtlbWn4m7BVAvRECjtNqz
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e656d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=4QMeK_r5uR8x9m7PPSIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xgEIHSH2V2tvtlbWn4m7BVAvRECjtNqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On 10/7/25 7:44 AM, Sarthak Garg wrote:
> Enable SD Card host controller for sm8750 mtp and qrd board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 16 ++++++++++++++++

Normally this should be one commit per board, with e.g. "sm8750-mtp:"
in the title


>  2 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 3bbb53b7c71f..26548191d95d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -1030,6 +1030,21 @@ &remoteproc_mpss {
>  	status = "fail";
>  };
>  
> +&sdhc_2 {
> +	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l8b_1p8>;

Any reason you didn't place a \n here..

> +
> +	no-sdio;
> +	no-mmc;
> +
> +	pinctrl-0 = <&sdc2_default>;
> +	pinctrl-1 = <&sdc2_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +};
> +
>  &swr0 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index 13c7b9664c89..8d018eef44da 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -916,6 +916,22 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l8b_1p8>;

..but added one here?

FWIW I like the 2nd one more

Konrad

