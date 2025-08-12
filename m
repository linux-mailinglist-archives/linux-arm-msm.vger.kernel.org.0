Return-Path: <linux-arm-msm+bounces-68727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 023ECB223B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D74933A7253
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5A62EA178;
	Tue, 12 Aug 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mg6n//dN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8492266584
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992319; cv=none; b=Z5AbqID1hdysYYiBNl82ceaA59vZVLi5JrnfVhz2gzWeti4xyc6Vc+UGU/nY7kpwLSKB9+Ybnq9AezJ1o+IWFPJdPuxrYCthp5oAe+pCRLgza/ZUNaGl94dRT2o/MiYQ9HIJhKPUpaI71lvrKVVFlopJNbWFbdnd3zSiTOPbADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992319; c=relaxed/simple;
	bh=jd+E5iukvLUB/eB2TM0K/oVyyoLawcNM8WFyG7kRj8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMIvqh1rbBjUE8IP0jGV4TJ0g7Kc0K8fQ9LrkIz0LY6WW1JZutwc9I3yDPFcgBAK9RusFTE7tKneuuSsb9S7X8aM0CuQHKIKTCZOqCknK7DZYNjGKeaJIrqz54gFupiAzwG0yYmgfj+EJXSEZcE63/FSlcldLnwlbT3tDhukSEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mg6n//dN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C8Rx1n002240
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lSBKcNhfzLdUg9Kuw93+xqCsYQfCxwmTkPBOpkw/Mg=; b=Mg6n//dNinmh5sTO
	HqQaBWZlPKZaoxThd1ahlMB4z/w1l4XsUiJEJBlXgT9evSEifZi6+1EyDzoX9DvR
	IfPf9pkO9kgEb1LxH6e2SGYDmBEDhttHnFw+ADJPkaxuVtYu6Fyb1WloGxhBT1Y9
	LxAYr9On01J1+b3qOQv76esSlTbq9GnBANpFREBsYbwNYislGBzocVTHyBH0vi/K
	3ifCp5flG5u95S+wNNrzzFq8BfW2bwM6wYTj2BGtrPhrYSEBvq0iIAZqyA7D/hQd
	QfiqylN+WfsQQJOGg3/G9aTwU1pDlLgf9XMMwB0BJgwaCA7N3rUgB+uSj6KeyspL
	wX0i6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g7m27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:51:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b805068so11880441cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 02:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992316; x=1755597116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lSBKcNhfzLdUg9Kuw93+xqCsYQfCxwmTkPBOpkw/Mg=;
        b=XBNC4maLknFMTrTdqcxfhRx1wvQqFXb4CmKAvsCw5lcIcU7eg8AidXVWmDnxdehynN
         pPXHtXFKB+ATpd3YmFTehULdn9e5ifsMRZFRa8ORQfOS2lpyCOg9JNNd8IgSiTAbHS9O
         hRohkxW84O3wiRsMejxayp4n4uxizf153z6gcCTVWzvhRQMBbhxGTukeCHKM0eO+So7n
         zJSfQF5R4It8bDrEaTi1Q2JcRSlOeYV14rT5FOgEClC2URnsIv5bgCUbG/BUHkhprSzx
         /ImznyB1qgiYPPhhwbEK9BtRQfEG6Zvn4spK+Kq5E0ibsr5krzjFAGyH5WqpTzNbGl18
         mWFw==
X-Forwarded-Encrypted: i=1; AJvYcCXBFspneR84roq8Aa6sPLy0o7UrVqCAKJULXRZ/TYR0yPcmpubIfWfwpIEqNl5vRtn7phGQfxMvk4afDRiw@vger.kernel.org
X-Gm-Message-State: AOJu0YytAeStRQyUq5OYAdixQkid2L66X3/GIY4fCCbZCoNEPf0l/no7
	b44ymI43t7PFs1N5YaNyyiJftJzH2/32/hrEFeD+1PhUi3ckZeGt1bNMkOQOqiAIbX4IAPGvWHA
	KP/V5UhAmsnBwNJkaoO8g1pK3VFQp8RziFuqABaYm5PGi2IJSTaA5AqHqjpnPF1/2mlfO
X-Gm-Gg: ASbGncvCLpF/9AAMiZLoRJy+fvqR5inJpyAqBLxD1j1oOfIeaZZxxhp311Tqpgbf3Gy
	tbgW9D6obbwTmiVw1o7F/FfPOcOEV3J4Vphv/Nzwo03LVW/lK+eo7RBTReaDK7xqvsS2zHydbci
	uB/gp+WIYPYkn7bNUUZNEqG2Zkii/G+QWNw/hZk7AtHH2TfX3uzpWyJ12nT0/J1CeY9IzF6Poza
	v6iKZmnm1hJERT1VRAlK6batKmJBeAsN8QjJ9xyqUEk3X8YItieVkFRG5U3JuYHWlLMwzfwwisL
	X7/lB+2HhxskXVC8xr6zeeAkgBJLJl9cZmv/PLsMuxN/6pbySn4FY4/t7ZfK4Yuxs8xZxE38hAn
	AzxHk/wcEGqlYW4p3SA==
X-Received: by 2002:ac8:590a:0:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0f49eec04mr3747661cf.0.1754992315577;
        Tue, 12 Aug 2025 02:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMkGZ42DZIE9vi6e/XnKS20D9Bo9TKQfpGrdhAifj0KEa4CZRyyn2UFU/k80p2/ZCuRsbrfQ==
X-Received: by 2002:ac8:590a:0:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0f49eec04mr3747451cf.0.1754992315103;
        Tue, 12 Aug 2025 02:51:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0766f9sm2219676666b.24.2025.08.12.02.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:51:54 -0700 (PDT)
Message-ID: <857f56a9-0fe7-4c10-a55d-b00740a8be02@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:51:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689b0ebd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=M9tGKf1UEhd6l-wMVe4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX0jw5cF+amizl
 mEc5YxwK0IUwe+745e62fTWn8X1VOs0VKlNDZ8gcD65SO+j0ZkXCH217X34gr5S6fhCRdvfXMTK
 sW0K04hiudVtenXtnPK+dgJ2jrS3Z6qiu73fed9IWyQDb6qUsAN499xXf6A1pgRaedfW5PIuLFh
 N9Exqm0lCQcfowE9VsWAS/2OwG2NMGng8QXurkhu9xt4ydFZ2IRo2xTxEoIzFB0Eifotonb1w+c
 CiDoJjBevFyYIa22Hk2b/ag3eE+OG4MIwWXEb6QCh5einG8pE4M6lNYn0d40k/KS6ooZ5YLfRHW
 GVCvv88Utncv2Ga/EPiy91GgJwGb5qVBaZZqjSgjzO2Ke8HkB7WRgfZbCeyGUF4kffkLXIZRJQz
 n8O/Nzt6
X-Proofpoint-GUID: f4n6zg7HpVcKXAqdW8pdL-Y5C_hHMXEG
X-Proofpoint-ORIG-GUID: f4n6zg7HpVcKXAqdW8pdL-Y5C_hHMXEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On 8/8/25 4:03 PM, Odelu Kukatla wrote:
> Add register addresses and clocks which need to be enabled for
> configuring QoS on sa8775p SoC.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---

[...]

> +		system_noc: interconnect@01680000 {

stray leading zero

I also see there's a camera noc.. are these controlled internally
by Titan nowadays?

Konrad

