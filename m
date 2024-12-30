Return-Path: <linux-arm-msm+bounces-43642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA29FE6B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0AA1881721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956AA1A840B;
	Mon, 30 Dec 2024 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GngGERgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DCA126BEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566893; cv=none; b=TB5jSwhU2hvfobE8wNzmPRVJEGRs6C2G2i6m5A39Q0icwQNxpevd9jh1gzUzK5Cm/vfXYphvwP4zBDV7Xhf6I8YV4h6iF+AhR4rrjE0NDCJSXqdpAUc57qgrGxGEOciv2mZ4KhBzRJJotYr29UO43pr52yv3AF9CsLzv02/b4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566893; c=relaxed/simple;
	bh=+iHAttbLRN/6eXCEPybAf+3RrIyoVjP4/+q8BrEKzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/nOnmTcPHHhxCUpLUDCkAyPrEMM83qouULaukRzQamC/mwPQjh91Ch8w9aPUfQBeuoTEdPBVfrJpxvStRMh9uW0VQUsP3SihBLAej0r1ESPvroD/niC9dpvBxHf6dBRDGVmHNs+elaCmmx9hUOzy3JLSUW5e9BMYtwab8+vgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GngGERgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU67nor022967
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7CVSRjgLfaKt5V5tnNqs5jqEoX/ptWeSmYIElKmPZo=; b=GngGERgfdqXPnwuG
	T21UFI5A9HKhEuj7E6SMJv/rE5iYUV1UbLfQAJlyFt94Bjg+UbcxI4d/DYOFmxJ6
	J3PNX62VDo8HxaBxILCP7WfMBkeS0WCaBujPdUkwZckfy3upnUYbhQTd19UQEZG5
	ImSQPZfTiCnuGQ1GS2H/dT55N00GbD/5BLrGF/4yA1uM5jx0gA1T+JA6rySlVrmo
	j2+RsQIS4UdVIKyqSTg3Gdx5LLEs2qds1mEbB6g0xhFHnvO1r0HTf13w8Kf3RzzU
	iE/BxkNOaz0Xd/lbebVJULRHMo2H2RbqZ4Dr3wW9MtTeqhtBR9YKfDUk/EiDt21F
	y1BFdQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43unys0wfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:54:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f15481bbso23253906d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566890; x=1736171690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CVSRjgLfaKt5V5tnNqs5jqEoX/ptWeSmYIElKmPZo=;
        b=PZumFHCICOZoqXv15/CUXkKwSH/B2mpYvy+zyx7m/gODm9jdcU6nkBPbMxF/8WgqOn
         VEg4BKyN4Ki1ipTo6LiVeHU5eWxOpagRZ/gQeeacaLydzPDsZz9PBRjPLydzdt/7UOnI
         EAe+/XTdtuctuOTPlJCCjaLzY6S6dS5sex/7tYrurLu/tMr2f8asyHFSn0NLjT7Y6B9J
         DnbWYslK971Ljqz6vh/U7V/dOgfamYsITucr/ozcyx0BB2A2o56qa5aMbwVTjz1YjEOz
         L99p6+0e9j7wDPXsLyFM5Se4m2Bi3J46Xfgzpnk+nthEFoTANmzGUnX7O4YV35iEE8Nh
         4VjA==
X-Forwarded-Encrypted: i=1; AJvYcCVLdGEACN8/kFPhuOT4qFYLdPClOwOC+Z8OkotFUAW71X46O4yOK1Jxc+rjO9tuheKnGABujvkHIGXGzLs4@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvBz/S6/1lP+4W0D41jKPyByxar3lSBse0Y0gPav/c4+8Vhrs
	QA35SruiNMs1nyNk2OQiV0m11BUjFwxykockEQHQvJF4yM4qSDdwNLvVrIjLN/ygagEb37vyKjf
	yB6JzTdgcgJsoWILOKlwZanxRDQBKHYfh4kblj8l4ZquAzzaPSd1ke7kpvyc3HuTj
X-Gm-Gg: ASbGnctdY/hHkvWqsxMZdRQSfVnwVFSVdqxZP5SZtftH+rFpOVGQSzu2H0trRbZ/LfA
	wc9e2vlsh++Z6ASJb5MNa1EhSgn2xRurrq/t2bqGpgjMHD4s1SGWEwx8oCRZ+WZ62u/HDBxV5XD
	Dh7ogO2UPRYBCrhS5SjutHbUTd5nfwvbtpYtbqrJxGPhrqIDl4j083DeRo1h0Uzkf1XA0ARGLIA
	qYLQq4ALEmcwolfhGt+Dy5lkvVPlKL4b0sB56shO5YdBJw1APo5dYpxaxHIJELmLvxqmDnSbXWN
	E3Y7rgxoxr4xmLHJEu/x9Yka1zu/kS3V4S8=
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2316612885a.1.1735566890148;
        Mon, 30 Dec 2024 05:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZdkhj+BV1o4dgVVkLIoaoqu+7Y4A1qVLU9VX+qB0ht+A0G1NdzcFyr5Ff74WKLL3Pqf3bmg==
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2316611085a.1.1735566889850;
        Mon, 30 Dec 2024 05:54:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82ede9sm1458554666b.2.2024.12.30.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:54:48 -0800 (PST)
Message-ID: <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:54:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bp18XV1iM9heCuQOyhdMPAJ9ica3NTop
X-Proofpoint-ORIG-GUID: Bp18XV1iM9heCuQOyhdMPAJ9ica3NTop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=811
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300120

On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
> 
> 
> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>> bindings, GPIO pin mappings accordingly.
>>
>> Changes in V3:
>>     - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
> 
> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.

+1, the clocks are called SPI0/SPI1 internally

Konrad

