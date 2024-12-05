Return-Path: <linux-arm-msm+bounces-40595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B6B9E5CCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CDD718844F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782E2226EFF;
	Thu,  5 Dec 2024 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtKGDj2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDA2226EE5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418896; cv=none; b=PO/Dtja8RLmvKO9+WAH9La34dr65Aq64Ps6CfdgHtKMJGwghLGYfrRY2cR3v3my7Zm1QfzbTr4HBf8srCFIbiyTtiwCImAO4QSISF2YV2U98NOy6rpoOdJQ9oN9prlMRezJsvV5YOppl6l+gW/nwBHA1UqqXllK4riaFxyZ3qaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418896; c=relaxed/simple;
	bh=banyuC+L2GNhTvM+FaeTveKxmVu72NKyMITzwe600ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vC5DlU8O+cLM4q21pyrYekMx1Ic1UHO9vbD/Bmk8n4nWYrG7/NbHMSUvKgQA5MpSg/zwjs3gCJyYjLKNFcWk+4ajy+oefDEhMjlv6LPgAk6PrIzxW0YUplUBL/FXnX62zveUrwkuIzd+ODGlKNnxoldTNxlgmYgxUbp2fgRq8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtKGDj2s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59vkTQ026596
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGB2VGYlhX305z9jWjglG6rpxzgkZKcg+qU0mnNMISk=; b=KtKGDj2sRAbHxqd2
	HJTodTKpseHicN5sBIFn5SVMufRHF5XN29jh2U1Fnos89L/H88OFWnfuzJwLE4Ty
	DN6Yuhy9GrYyWO5xoy5ELBLCjuHPyoOJ9hOEArFVYpG64aVVRK1DbL8zbbLICqAE
	5lTdMtODQ9FnX+wAymREQTHtJq9oYH2rktcqB1ObwB68k6I1H/vvcT86TisGNdb5
	SPAGDEc7eU7YB5JaD7zZrz3aVnmUfHgH0eJDILlmiTzJR6SPdDD8kelNzTr0tAFN
	Tn1+jL2X/s6LqP9jojq2Mcm3Bv7JTDWqMS5xzTJJ5NLzq2LGnNzyZfvA0AP/8c4K
	A0v7KQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kh706-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:14:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d3b1d1d8c1so2693806d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418892; x=1734023692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGB2VGYlhX305z9jWjglG6rpxzgkZKcg+qU0mnNMISk=;
        b=waKa3L854bNLGE/XflS/5aLeEqyProf3TanCrQS5HRBcY0A+LePF2Ged+bk2nMgCB/
         zjkswzWj1ZlLH+R8y38kTBhr+dAEeh4nnruN8iohn4BlF7Tm4GCtok+zPQIQdCqc0E4u
         eqedU00op+sqNbiZhCFchSt/mqN4Kx4olGX3rC+DTEjWc8lNWz4T+J5ZpIlSd2q+l0j3
         4o83A6H7pfLHY1Xdv81s8LX1G8AYJDOya03RixG+7Ti0Ctos9Ty6VzYApbI10ZQwA6ko
         h6797BiSFRFhRUHO5Bk7ehX6Mc0VNz7j+dRkVbM4InFXPoVfGzy3CugTMbMqvfAYe/jd
         D8wA==
X-Forwarded-Encrypted: i=1; AJvYcCX1JpOHnRpnUwFRRTlQxjmuCfJ5rIlXHioLPAMplWrdVl5EBxtyL74Gqj5Y7D3/UzvTZAJBOy2+/G37cM1w@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBJw81jBXZUgyblWOwEFWR/bcPLWh5cI5cGqYId9efJAQ2hTY
	DpP16ljwQbQwboON4IgGQoI97y5f4019iZGJToGTE29BeKZilSK1ur9zk6lqFb87JsnEfeQ1lNO
	ZE7I6VxG2rjkjP9aJr3ziV6o4KTCEpgfHNSlBqG6v6IoaB4GyApM3OXtbxbcHsKQm
X-Gm-Gg: ASbGncsVib9UqfBoVxFCjTsIzLfvFpOM8PFHeE7TXqRaIxFj+VWwDXs2rI4vptQd2po
	FvX0ZWKmxACHqFCyZox4V1QZqO8jTH+nHNDdj6zngDtVNJWUywLEUEcDpKb89LZJOLpIjw/k+6G
	1wNdcxjHbHP9E806vHA9nCKC+jl3jiIEitR9mF8EfMv9Rr8e8P+avYIGJ0Ah5SkX0rWsfXnALo5
	k1qYORoA9FDYEYirOLw2pRyxrE5hRVKHvBEbtiUynPD0xqXx27kXv9syIDf7wfuAAmLKbSwL46u
	Kl3WiB0JCgYFrH9f8Kkq59yNCL5LBRw=
X-Received: by 2002:a05:620a:440b:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7b6a6c31924mr667659185a.9.1733418892285;
        Thu, 05 Dec 2024 09:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpQFNNqg7rmu42uahD/Dvr7J0nOr7rhzd/cZhlhHw/kjUQf8AX6RuhDb+fboOYZ38o76LA/A==
X-Received: by 2002:a05:620a:440b:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7b6a6c31924mr667656485a.9.1733418891922;
        Thu, 05 Dec 2024 09:14:51 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b5d2sm119571966b.93.2024.12.05.09.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:14:51 -0800 (PST)
Message-ID: <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:14:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: agross@kernel.org, ath11k@lists.infradead.org, dmitry.baryshkov@linaro.org,
        konradybcio@kernel.org, kvalo@kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, quic_jjohnson@quicinc.com,
        quic_miaoqing@quicinc.com, quic_vgarodia@quicinc.com,
        stanimir.k.varbanov@gmail.com, quic_jiaymao@quicinc.com
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v9ZCo3HaOQq7_FLpSDHBSGZFLpMvgYmm
X-Proofpoint-GUID: v9ZCo3HaOQq7_FLpSDHBSGZFLpMvgYmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050126

On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
> Add a node for the PMU module of the WCN6855 present on the qcs615
> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 

subject:

arm64: dts: qcom: qcs615-ride: ....

[...]

> +
> +	vreg_conn_1p8: vreg_conn_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: vreg_conn_pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};

Are any of these boot-on?

> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_s5a>;
> +		vddpmu-supply = <&vreg_conn_1p8>;
> +		vddrfa0p95-supply = <&vreg_s5a>;
> +		vddrfa1p3-supply = <&vreg_s6a>;
> +		vddrfa1p9-supply = <&vreg_l15a>;
> +		vddpcie1p3-supply = <&vreg_s6a>;
> +		vddpcie1p9-supply = <&vreg_l15a>;
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;

Please move these properties above supplies, to match the style in
other recent device trees

[...]

>  &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
> @@ -262,12 +363,42 @@ wake-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-high;
> +		bias-pull-up;
> +	};
> +
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;
> +		bias-pull-down;
> +	};

These should be sorted by gpio idx

Konrad

