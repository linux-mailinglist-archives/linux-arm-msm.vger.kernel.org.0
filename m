Return-Path: <linux-arm-msm+bounces-40553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD69E5B67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4DDF28289B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91FB22144F;
	Thu,  5 Dec 2024 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ch5SBvcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C121C197
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416121; cv=none; b=Ou+xQubVem/W8/Sz3jeWlVkit0OU2L97h+QHYDAFoW4lZ2WCgrMetAo1f2OG6m1/Ih5tWb5HyENcwpK61ABB8SDD3HUiTOgt/xizI29wVat3vn6UjkUGSHJsisKgP1u9VhlX52V+abS1MBUhEfdaopeZLNhxct6Q31s49suF0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416121; c=relaxed/simple;
	bh=Hyd0DGsgrgFFk1brp6woAw2Gve8VG2lrqOtM5Buj/pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JW5B2zA6TwgVd6OLOJKhl13LzFLcqgUxNZ6WLbWCYf5q4z0J+/9iwukvwRDyOJ+9ZT0uo/I/J3Xb5+CIL6njqZylklMC2h3K9T6gIGjQPFyI4JkRqmSlstg4O0NT3Lcqq3aV9wcr0ZnXQ2sw9wY6wZCnLlxhtlP/dEX9F8KD54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ch5SBvcB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Bop4a029401
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=; b=Ch5SBvcB0TbZns63
	81Peg1qa9GnWJwaAeVOgwplc7EZrn58imN7b63HagQ6JYvhDMxyBgtcaT/pmueuB
	zkUo2dJezjDsRZE+nbXSJnkLFlBzX3ZP8wC4PzS8mDIZPQpXCp0yy6E8LkoLR/DQ
	V3w+xxssOZOK08jCqrhFmfzGULacHOFNW4ZY23LdjK6pRM42tj28cJeoU6LNeCOQ
	PL+AxoFXYpW29PE4Z9V4mNkiv56UTIzSVPRwI+y/myG9y9EVMLcWumWjOeHxXYpG
	vUTvJlD6zXzVds1K+BYG0s9XDU3kJy7tWW1JTxKmz1qgGrx9ybNFOJMMnQ7eIh8K
	+MCIaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj0s9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:28:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d881a3e466so2950736d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416118; x=1734020918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVewGd+CHap/GFBRG9A4Vc53nu5CRbniCuyyyIyrS/E=;
        b=HKDjguZLwEoSDtiO7nViLhD261nuJSo13VtXCNG+HDjzbuCI39c8+qvqamzTOB3n3L
         sMcFohE5HeUmByskbLdJImR5FPu9eQaOYlL46c2KeIKI4t8AKW/MDCFLlQyEDtwu+2uA
         HzrKu6eCWEgwCj8AAiijak0EVtcuRG4wxRysrKvCM6DWd3pzdI4y+wLsVbcbXb3mU4ln
         QNlVrJ1NRwKcjZHOAfbkZfyJJK3TgcXqD7YZjh/KjURSWot4PHZ8D8cuAVTfC7bANdYZ
         A6r2rnENdwf4aatMix++A2HnpK53m945B8bBKBavrClrdZgmKpo5ZYv6uCXfsBV2gW7m
         X/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVKsWFVi8HXCpJ/fqLiOiSyudczU90C9ctoi7jwn62QuukWEeF2hP77jF8roTQRa3i2OKoS6Tt6DcHwBf/@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBDCw/M70Bc/NDkFgQBzLtaej+URnYvdneB5/7Bm7AZfYa/MV
	wklMFs2DUl08pOmtrcXDomk6SFOOi9igbGhvwPqsB8KzIXRc7v+CQqQRa2HwuxToVbK814pIFmn
	aQVvt3A85xAGDZU/jN8neCMQ+y8fwxz6irl1n9pLWDf/gaFb1UKrkWZ6gAqlgslrM
X-Gm-Gg: ASbGncvzNr16ixWVGPQB913uyniRF0ZsfWujBZGw+4OA3jYKrgBZeWetgjjs5UiNm8S
	041i+GbLVra97x4rYA3eJXisUdm8r4AqqgnYadGKmx+G7QTeyM3tHvBrBW16mnsq+wJhmNmvXI4
	DekYmJP2LX9gX0JDNjyqZl40knU+f5g3+clLIBpMy4vOxlyEB2YR5mHn71pQWbqM+1NEpxNOw3z
	dMUGE2YZsDyFcWaV551E2gBFRCCJesGL/at+QwBMAm94KWg9JHVyy8YRy6JBCQNkmRJukdILgit
	AayEGaEDdqqcVHuZx/kzwB2uYiE1wf8=
X-Received: by 2002:a05:620a:2a0b:b0:7b6:72f6:210e with SMTP id af79cd13be357-7b6a6bddcf1mr653503485a.3.1733416117637;
        Thu, 05 Dec 2024 08:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIQmJDqB7aPqLdNqqxjOXlNlTRx0vV7ECtpg6Wubt2pVIN3Isf/fldXO36qKZaV1jYkkt/Pw==
X-Received: by 2002:a05:620a:2a0b:b0:7b6:72f6:210e with SMTP id af79cd13be357-7b6a6bddcf1mr653500585a.3.1733416117234;
        Thu, 05 Dec 2024 08:28:37 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa441sm964726a12.72.2024.12.05.08.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:28:36 -0800 (PST)
Message-ID: <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:28:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
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
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XphRt-M8uAg2oRHLq0_Tp6CijwTID2IS
X-Proofpoint-ORIG-GUID: XphRt-M8uAg2oRHLq0_Tp6CijwTID2IS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050119

On 4.12.2024 11:00 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

(isp@ as mentioned)

> +			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;

QCOM_ICC_TAG_ALWAYS

> +			interconnect-names = "ahb", "hf_0";
> +
> +			iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_IFE_2_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0", "ife1", "ife2", "top";

vertical list, please

Konrad

