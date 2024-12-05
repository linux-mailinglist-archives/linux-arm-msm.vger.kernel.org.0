Return-Path: <linux-arm-msm+bounces-40554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18E9E5B72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5DA281B69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02493221460;
	Thu,  5 Dec 2024 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ui6o4i+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243321CA09
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416237; cv=none; b=kwKIG3DLvyhiS3p6be7MJIDvA2xClvHsmPCMn7MQnbljkR0Pwt7ubsC06l+h7u6i7wBnzR4H5Uo2Kr/SEedF9R6/UGb/wREFqzJji5rQxV5f8xQicWR7ZRRB54MkaPGrbnLTHaUI9WDLx+D+4ZL244caTKoLSvNGuBT1ehOy0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416237; c=relaxed/simple;
	bh=9eF75YRr9yMLy1HuQzVAmxyT8451+Is/kHMEOB4NYdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkrYesJhVc+Z8vHZyaF/o2lmhrfiQksluAJ029/H20MZQmGMoQxw8vimD/9bAZcBqCmIXzc/zQzTfjwHjtCskrfqy2mvgbqCu19Gtpt9/BWBaGm1hSBYxLHRtzNnnC6J0zBvIc0WwfUJgHE7UG6l1iV7PC0U3IX0rkKd5XmNQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ui6o4i+R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59x2jV031306
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJqs3LBaHS0qNxIlK9e3tbBAjY2Ry/AmnabvELxwND8=; b=Ui6o4i+R9GCCGSGY
	R4H58ceUWi2la9KOlE93gfazq0Vri4v1gQpfe1+ZjyKgv8nPBvhbWCs29c22GX4w
	aFhDiTign1g7rdaI1/22Wx6bdtodhM1CVGCb/xkEgkiVaQdUafNppDtr/cnPPlWo
	zXiJOg5BDbBy1iWMbOqs2HrZh5bzA9fg36w8C6x8Cyg8fyX3mv1NX5IYB2IxRew6
	FlvdizntI2KWMN3CZM+T3P5AvVvWpF4ns3oZfHDRen5EjYZQDCjc0m2JiafiBjw1
	e7DdP7m7/x6TuGJIzM+25e6kuE2BmFWWL0gC1IeMogS9jCaoD+OkQLEWWV/WEWc+
	CaUxGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba1412k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:30:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46692fb862bso2257551cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416234; x=1734021034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJqs3LBaHS0qNxIlK9e3tbBAjY2Ry/AmnabvELxwND8=;
        b=WE7P8CDxSyJUhO9SdHGmLZHtq+eRGGCbWns62a3ZNLDu/a2ss+Im0adZXM/jMreFAW
         2GDeA/HEZRpidyGF/cAuv22yNvyeh+0CAGMc0xsMpmUf1jt2skip8eymxSiShZwwhQVj
         QqCjeszEn32eybvYg53UeyqmOFoDcIoRhO12jjmZlqPbDF6wkfdp4Vj1PRkoGWX8+YGb
         KwOK0Hxi8I96wK+4ePOokdDVgu/QtBGbKHzyT67yihvJMIMjxAKj5ITUgByTHz/RsuKZ
         gUGpTfxeL6lgQoG57B+/DF3QrznVTrUbhhG5X5l/f/FiNH6BuIPQ2E8tR2MUNZ5bRcyL
         bjfg==
X-Forwarded-Encrypted: i=1; AJvYcCXsuIaPFM2LBGmrmnvceZwAncoitMQqrwqiSaqaazIK2f4NPB6zWCWYCM64iUiwd7vpKWwfEjiFftAX64pm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4+ja8Q8X2usSqwBiKQ92dmPPdiAKOwdlBUZRyschTZDaSRGvB
	4Sd+bv6bvaq3AP+IkmbswAtG4JQlhpLEaBfmR5Db13PipkhhyjiLmD9RXyFiHDcf3hpq/W/yj6m
	L13qE1CUzFKkLvOoiF3aDEq4FHYfQk5w96jpEH8DkQpVPHSZMGLDpHZUv6UZ6ayYM
X-Gm-Gg: ASbGncu7cqSUKLXFRqy9zjiN2+Ew4B1qIDeqowvZG9uSgaiIwFuGVfWrI2Uc1coAst4
	T7qgAtAJ3NXnxQZ/9ZxmYVRkZWnuOeovhvrq2uUEe8OsMWBCSeOFcgOVFGfW//aQET0kTALPVuY
	OI1bTLjNb+yBmdZ1UNLdby6c9iffOjGDagzGJbKqzvc/+djGsP9fmv7nt93SVrbOGwtSRykSpXO
	+oqMbJBg7oUE1VjuC/ViVWqGFUGsjCFe9L2EorVALKrAiWnoNuthrL1rSwTbAzE4omQiwLpxg4e
	KFs14R/xyhu2vhq/99wSL9v3XWazw/c=
X-Received: by 2002:a05:622a:a:b0:462:fb65:cbb5 with SMTP id d75a77b69052e-4670c75dc63mr66770461cf.16.1733416233572;
        Thu, 05 Dec 2024 08:30:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZeQA8RbgBR7LIKk6MDXuqNewHF3QPDsiRdWfNeMAgVb5kGQVSn+F8U8HBX24n/Y8PMgcsYg==
X-Received: by 2002:a05:622a:a:b0:462:fb65:cbb5 with SMTP id d75a77b69052e-4670c75dc63mr66770271cf.16.1733416233198;
        Thu, 05 Dec 2024 08:30:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58dbcsm112253966b.15.2024.12.05.08.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:30:32 -0800 (PST)
Message-ID: <cf90f570-57ea-4ce2-9592-82a009f198af@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204100003.300123-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tB4AK5NvumBSKjFZ8uJmcsIGeUl4nrt0
X-Proofpoint-ORIG-GUID: tB4AK5NvumBSKjFZ8uJmcsIGeUl4nrt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050119

On 4.12.2024 11:00 AM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

[...]

> +&camcc {
> +	status = "okay";
> +};

It's already enabled

> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +	status = "okay";

A newline before status is expected
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +			csiphy3_ep: endpoint {

Also between last property and subnode

[...]

> +
> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		rst-pins {
> +			pins = "gpio78";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

Please sort these by gpio idx

Konrad

