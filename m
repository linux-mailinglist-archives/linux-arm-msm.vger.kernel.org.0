Return-Path: <linux-arm-msm+bounces-85496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34116CC77B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F25E83021740
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886F633B6FA;
	Wed, 17 Dec 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4mNHrEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdKGRVup"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06F33C50E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973086; cv=none; b=ZH1rhiZ3ajQja/IlP3Ylvc6C+HjEC4KgcZIz7bMKK2//AQPOjRjWGaStzqWi53Sr3HYlHB7yDqp56lb2VxyYKrJDFsdu/TITQ3sc0vrUW3PlIcnmq10vCh3+ewE+9rfs5UYaCX/Jut0QZskvgHNW1sd96V3hEw7VwS7wwYgeA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973086; c=relaxed/simple;
	bh=uBF7jlSoEoiH4BfDXFU84wpBnHQgusEmkCAEF3OwAzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBIQRcYvBZqn9PIiovsD5Jrwhqgct26fMFLr3+bqCJcf9OoqvpYp4XaG42qwP1sON9lzKmGFUrtmOp8sWBw+CaRwZca0Acb7wH1+Csbdi9gbSV+vLwKyP9w6vpO0xVYQ8NX6D59jLU/OXwci9woGK0bQi9//lzwhG/Gt/rgW9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4mNHrEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdKGRVup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHALSN21872023
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLrWVMaiJs3Mq/N5mWp0CleIsSEtJfnYE58vQXmfhy8=; b=Q4mNHrEmtezQFijs
	y7z2XkHIYSaAzf1cfqSMeRE0ZIiT0Ee0njPCxLidqUdok/3VALUw4Ftcj04pL51Q
	ARJ4/O9pGnUwxgxsIXVDmI/Mr7E8JCKJ3azfGmLlxpVYVkwzUzwMCUFfcKd4VhDx
	gYlBHpoo+saSjTaq3uVy698sZoHws2WYJHoP6ZvQTjiBobnTHCJUwbqB3sGUh5HN
	gGmEs3sWexciqv6seAZmm6lzcvZXK2o13NBy1PyJLudnGb09jOSvXDQIO1Om++xj
	I/cu2KdENSzliJxBGF3OwLVsCgWRmRzMSu8f9hRQ3jxWe5H+Rn/IMVRIR4z/6CRg
	NdG24g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq9ur4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:04:43 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64565434d7fso1004926d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765973083; x=1766577883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLrWVMaiJs3Mq/N5mWp0CleIsSEtJfnYE58vQXmfhy8=;
        b=PdKGRVupgV57IeshvSGs39exGCmxdlN73bnILiFoI3Mk09XktveZ5vxXTTMuSMwwL6
         7Yn6Hb9E1OSA+dIDaqVQM2NC/Fl/84M8Vt8H+Y0VIxQKn8P/s9U0E2T+Z6DN9NqZY2kz
         GII+RYsvRltrjbOD+naCVA98Nb0+zcgBMdFzqPpS9yOgSyTOErJQgVSur6TxcxgnSBJv
         ovb5Sha7R9OnyLmmeiKdy5NJztpvzoTsKuexmrtSYxLOhGQctFXuIOi/jS1ldduzv8Jx
         xbPssCaj43YMRLeHapD7Ozy2/q+iSbVGV7XWxzGqSx5iCanlAsNAgJRNOp+tDx98fjAa
         xz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973083; x=1766577883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLrWVMaiJs3Mq/N5mWp0CleIsSEtJfnYE58vQXmfhy8=;
        b=Sh6ehbz/MyHqv2P83MEwZpc8eOhOCWgYX+IRqanEuz3/QvjlFODRl0VILb6YrVEeNa
         qTvujxkhqTbg0ERJ2f0pbvOu5OLowlBG6v3cwKNaoNYCYbRbfvFwzN8FdNGDtvrqpgom
         HWKKPtIGJHT70BAMR4w9HSua3U3g3o9rvMLFms3+uBREB/5Q8lhjoG5OhSXnx8hnBH/r
         AIvWwRlxwwea6CqnyKHcMsBb6DhBuagAHNGN2Tso+M5y+NC8038oGfLrJq5qxvPDtOkz
         Mrwgpph6/lXludUa083TOv0c4fWTrqofKvbvm8u0Ur17sVwQ2eN31idbiHI5rj+2k3yc
         pqaw==
X-Gm-Message-State: AOJu0YyP+G5MvcyQcXLPjz8Gdum2PrxR4rL+qV65w7F6jn5W15S3AbG2
	6h9UDxL/pGKSoXUn+eU08vwJlnB/3ksLFIG5COsfZVEPSzQvbS/gc1ITLYl+61I8FMkXRjm5Elt
	Ny6YXqXDwU4nD2RwBWE5P/cN2Ri26HiZmk8ikieN3QkOfDsROjDz81sEe6vtwAVBM3mJa
X-Gm-Gg: AY/fxX4tmipWTfKHeS5DuAc7HqoRduQLg40PwAB6zYFfLAOGq9qOibY1BfJxkc26q0H
	2HawsHTBZX+TlGOuSF2oLTBMv3iUrvtJ+BmI//9vyxr4rmqzJuqNitOIYntmG4AR0zqRdHMle97
	zNWzmaAITSGfCYgpaQJBe/sy6bSI1+Z8M3VTThZlZMh9g13yE4AnSjdnbcH8HWZGa9RyyBaZXkJ
	2Mahq9iX8T8+TFz2AxID27NxCJ1Uo6lWV9TwqNLk9Zky3LudsBTE9cak2ikSu8+Ja5BqKAlXZ0P
	4IKJ+fjbrPeGOuv/qKFStMrVhpPTtLl6ycC8SyfLZ4RGJw0/D7r3apRbDrzcnh++e40hvz5/zu2
	zL9JROv+rGCuAGOhMIgxLHRkIDkuEQuOmPMU9K48UTEQW9FctFxOEd8KPvqIMGSy9qQ==
X-Received: by 2002:a05:690c:6601:b0:78c:4388:8afe with SMTP id 00721157ae682-78e66ef695bmr131567417b3.9.1765973082659;
        Wed, 17 Dec 2025 04:04:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4K0A12YGSZ5RpSg8HEc69xOuJj1UoqCdsM3mEK2bJtsg+facTn//Dvo+Pmf4AwKSSNN8OSQ==
X-Received: by 2002:a05:690c:6601:b0:78c:4388:8afe with SMTP id 00721157ae682-78e66ef695bmr131567117b3.9.1765973082091;
        Wed, 17 Dec 2025 04:04:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5cf210sm1969669066b.60.2025.12.17.04.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:04:41 -0800 (PST)
Message-ID: <f3ad33e4-1924-4a8e-8fe0-56487ea2c872@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:04:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and
 add placeholders
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=69429c5b cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-borPC1GNyWcu_w0NBkA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MyBTYWx0ZWRfX399xnlAES9ge
 SQkYH/9IGIK0Bhye8rqqBad1rMzUzV5YcyQ6qi4OhZ1vmGYr8zsU9bw7tSsQLbdHd4Apvy8rqaA
 gJHFse2CZe3rkvaqRogEsYYKos/10gQi7BcWVUKnoyn4FSesienzq3r7zoimsiZMU5FE+Kpfhnw
 3qg/URovl/PY5GyU/Vo7Ya0PUUvuizf80E/EaA6Z+yU3VrGih4sivCV6UNLik0NDCSlzY4KHn4W
 GNxIORtQkytGsZLHZbtRgEwVQdolsZcnBJ+rlJEnEYrLe1dxYglsvFcDbRPJ79w0Lef6cXGCo6X
 QID9VAdGc2MwrSy8ZNfbH+RF3CDmyXr6O9UjQtal5NSpLqr4E0AB5weFqZ1wFIQayh3UzUoNf9p
 lZCUP59DQEvrg8jNZtK59Crb5LQ+dQ==
X-Proofpoint-ORIG-GUID: -2usQ_nWWAAVv4FD9y05Nu5SkLD2pbaV
X-Proofpoint-GUID: -2usQ_nWWAAVv4FD9y05Nu5SkLD2pbaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170093

On 12/16/25 9:34 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know these devices are present; most of them are supported by
> downstream and are close to the mainline kernels.
> 
> This adds placeholders for:
>  - front camera (imx371)
>  - rear cameras (imx519, imx376k)
>  - actuators
>  - NFC node on i2c3
> 
> This is very handy when rebasing the integration tree with
> support for multiple different blocks at the same time.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* nxp,nxp-nci-i2c @28 */

This seems fairly straightforward to enable - could you just
do that instead?

Konrad

