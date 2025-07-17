Return-Path: <linux-arm-msm+bounces-65544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B00B0959C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3DB37ABE42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293822185AC;
	Thu, 17 Jul 2025 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gB0BQhVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26FF1DB127
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752783596; cv=none; b=moZi6GkbieRfstvWQlxRtEAK2LQQ3YNBv/IPIKhMJrPUmjlzT5hMFZSU5EobSYokqUmme6hVYyGvaj0A5D58UjUG5J8NDVjvdmkDoOmj1fkkUwrEy3rwz8TwAXLdKK5n4S+Rses2+mfMDQYnB9GJVsTT8VNouptZeBx01exlEUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752783596; c=relaxed/simple;
	bh=uGvCYrukNZZwoSmrot74EXpAei0dSrGbyqHHO4K6ryk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7+nhxi1CAgVe5azNqpWIP/tAfPUWkDy9e/tjCO6aYtoqTMBc6QPSpe9juR+vw4/l1aLrFDHtrQKuqJoXuhAn6CQK7XrKF7rvXMeGSZ2jeiT4i09HFiz9J/z23t8l5hyJzwxeJUWPe4+E6PEDzfAVGsPO7SCmtkUT0t67Om9ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gB0BQhVr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCEgVe008701
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCO+Uhw1043gLOruw0DQM2a9wT6gHy7vro34jpT9ZAE=; b=gB0BQhVr53dVptpG
	c5ZEn9wfjTI7bMofr2Uf8QxK9+RhKZzbkxDTFICNDy8yxKhghlWf+qgIiPec94lc
	PMncieHe+1InknedaUo3N37fTUUStJuFhuIQS+G/p6rHlYAjpSxCUnwGXiT9UBeN
	URpNpkXM82HUvkaJEpherRh26SSDKLmDlc0V2rnDp7cUfDwfNRbzX7qB+shsaKw6
	80Vn5C1b6DgkDKlVuRVrI6KVoosNWGkrLlH9cgtlsY4mmhQod9qjqSTVQuCzxQ0y
	6sKxghRgEj6JX+Ttk5crGNd5I/MHHnXuNfSfF3vyOwmBhnAVbvaWqw+CEgjHA7+I
	R7JMzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb92t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:19:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2ced79f97so24663385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752783593; x=1753388393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCO+Uhw1043gLOruw0DQM2a9wT6gHy7vro34jpT9ZAE=;
        b=q2JTynAOsrvDo7YTPHgrcNcQnNDZ1RYGFdKh3RnVIa46+MzbqJGDAXCGOut98zPdrh
         IbFjigRojDnzjiq1z1pDhtgAp+ssK2ZPD54RQjSp/JtM++xJrxYWdMUTTnb/wCYj9W/P
         ccf7bUHGrjpCNlmkBEiNVwsCNoh7CwN4/hxh9K6Iysgv0pOnbhJdEW59cO0juPmYKsf9
         TGLisprxGFm6SgtHNbtg8Nm/+DdyRCiqERxezC0tkWpxoCWDM5DtEeb2eXts29zXjBf6
         mLa5NxtLW73wLt4OS8KXSO7MfMJ7POUezhjOLavTQZiIUUi/sUTRbZEk70dk9g8+ktYC
         B9yw==
X-Gm-Message-State: AOJu0YzS/GadUYZ2H2g72UzzDKpbDHZszgMtGTMzzYfqkxjjCv658FJn
	fPr7qixH5deLBKTHm9l1JYm0oZTFz50AYWViwvloZSso3OAMjPdl4z9fx08CYDxNKzAPA905z7y
	IK9HOTQtXmvf978clpQSGPPlUfJa1ir0rl9b+nygAd+0ir6DYtQkRxIC1z+xLCutRqPyb
X-Gm-Gg: ASbGncuzAf1P8GokIPdgTij+yI8dLgkEnZdtxLdSCy8FzQdNzFo2514g007hhoTEVz/
	e0skBcWcBKfTHBBw5Jplvbw25SaJ+NvOGjyoIUQZSn+oOZHFRnBypJjw6+QOIYSbfdBQUud7dD4
	WPVhmsSELXLB8498Gn1tdMPpOZGlmtyDJ2w99bvdqib4opilvJB00Wha03t3dJoTMmtc4uK19HD
	PqIAA6yK26XH06cU7WC2NnnTijgayL36quiNHbOVhbICiTPRwZ9EviaDuBf98RbhtyPu2aZeb/a
	THSBPsefO3iRJQpwdFRfkLoJhBcjcvC+L8b7K1ELBzqEYNlmb8URabpxzKl9TDNj1HNO0sjnD3H
	4SB3wDCAYT1r6Ib3oytE8
X-Received: by 2002:a05:620a:7001:b0:7e3:3996:f491 with SMTP id af79cd13be357-7e342a5f37emr494235185a.1.1752783592699;
        Thu, 17 Jul 2025 13:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNmxt5o2S/+vAadYSwZx0yX5RUb51pFNWBZpzZIibY18kUapm01ygu3TXq/XZeIrZu1uZPPQ==
X-Received: by 2002:a05:620a:7001:b0:7e3:3996:f491 with SMTP id af79cd13be357-7e342a5f37emr494232585a.1.1752783592100;
        Thu, 17 Jul 2025 13:19:52 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8266992sm1405498466b.82.2025.07.17.13.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:19:51 -0700 (PDT)
Message-ID: <1ca25402-8f57-468c-b4d5-7b52f526ab28@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:19:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
To: Violet <violet@atl.tools>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250716231710.99983-1-violet@atl.tools>
 <20250716231710.99983-3-violet@atl.tools>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250716231710.99983-3-violet@atl.tools>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5hRN-hiLODbdLJHrPjyeYio6CcHc9BDz
X-Proofpoint-ORIG-GUID: 5hRN-hiLODbdLJHrPjyeYio6CcHc9BDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE3OSBTYWx0ZWRfX5YFyc9vpdTo3
 cl8E6ZZAw8IMhaVDORk0qpKam6RU464s+2zk0nbtlplVI6SS6IiBmcFPpnAeAybYX4ULwe5ekBu
 uL5cQCXhdHbSH7VmCV+3IOsbPeCPv/27PeIQVXf+36yF1ueUKsrniW90uxvPmRiV0Le/ZHYWsqC
 11WlItuA87S5nUwW41O67k00caNlByJggRXvQrpXvh1Fgt5q4b8LiANXqllaN3LJgYHzSQzTZKw
 gam4i8R/bh6gFcNVRpm6XZAj4SGVCn11y3nmmUDzDWZn73hba41EsLbLEicp8cSOQbkBerCYbwO
 Q0Lqiwno2Yg6KWkz9jpfVJyuNaVl1DOcAJOio/sgk+YWbf9nPVcRbKA1aUPChoItQ9qoFci+nql
 KQCdviCRZIRkbo/rQoeNysQ/rE7YNa9Z7g+Nnq0sjKhzMVTNcY5deL4Er9C6qo7EeJDC+FTN
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68795ae9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Pfut3a2_zQbZhcqyhhUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170179

On 7/17/25 1:17 AM, Violet wrote:
> Add new device support for the Samsung Galaxy S22 (SM-S901E) phone
> 
> What works:
> - SimpleFB
> - USB
> 
> Signed-off-by: Violet <violet@atl.tools>
> ---

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <36 4>, <50 1>;

Do you know what these are connected to?

We tend to document it, see e.g. x1-crd.dtsi

> +};
> +
> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;

Is that a hardware limitation? I thought these phones had the necessary
pins connected (for DeX)..

> +	status = "okay";

A newline before 'status' is good practice, file-wide

Konrad

