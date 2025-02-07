Return-Path: <linux-arm-msm+bounces-47176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5DA2CE14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 21:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1251E167D88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 20:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4331A0712;
	Fri,  7 Feb 2025 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh1ZZVQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45F23C8C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959840; cv=none; b=dGL5zEGGLmBVGICDkm57DAs5JDXfPX/07bHUNuWRyJeuxPXli7zKr6nbThsVEHFNiAYX9da/fRvB+wlm9mviqAsQ7ifh/CJoE7YREJC7oj5eeb3hM7LLlGZarndtIuWZMZJohv9xybF8an4P/6Q2iL2jZaxkE+9SofgXDovO7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959840; c=relaxed/simple;
	bh=egjQMllB3+k3lOaECmT4kWE4WQJMawVgWsZwDrLBuOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+X6Geju4FSd/7zrbfCicuzwiy9SMbYpIxHbOce6w++QnPVasehwYFhONEt1Epp8BPqbxAKq6wk6W87qd8q3/X3+ZCZptAbFox8WOj+jfhlqOkGo05fVpJBDRQ2L+Cr9BOxeNTWog/ED81TU8aMe0Yv/iHoSU3bYUrpwgFOoz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh1ZZVQp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517Hfehr013852
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Feb 2025 20:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFMK36cFjt7AxMSjvYc/ux9LOfI5AxxB9bO9exg5uBU=; b=mh1ZZVQpfLQawCWo
	0W0/kSZLgXyZXhWCjofe6iQRdZxiC3wMigL8rI7qWgvwkXXUKHq6qxkZR6lr/x0h
	yKKZdLzLdU/TakklVjQEZXIW0fvdrQyOHfBRz1ZBv9psxDQVP7xmsniKxpbA2dxX
	eAlkuL3qbcKuMvbHy/fqapaJVSnIwc1Yr+NyKlkRPFoaPRLO7yaYMNvOocbF/OAS
	wnJWYUsI3EBXJO+9BijhbiOcwWhDH7d0yqrQ3SYyTbwDVJLFLPwe2NBOTMPIJ+Hf
	gDX+WwNE+GJQPzvoTFzBtVeYNkjZMjSGO32F5Ai0M7WBvujTjGxRXXWAll4nZtZw
	DpNW7w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44npt18bbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 20:23:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e42556eab0so5208946d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 12:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959837; x=1739564637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFMK36cFjt7AxMSjvYc/ux9LOfI5AxxB9bO9exg5uBU=;
        b=UkPf0FRrR0YI01HnSTZcN6X+BuGBZzDw5UtEjNoO1Pb1snU3O64PsJ3e8DP6u28KQW
         MwrzHhuLe4E4dXIlDETOI+Uqrqj8vnroviUFmE62pG2pYHQTvW9Xe+p49ikiv68hMqkk
         12fWpGlrJ9bvkAtc6ZI+yiZZP2zzeBDQU8ogkdl0Ycy2jyCFVPE5fuTpX69W8Qd+Ht8p
         CF/bsvQ9rBJA+j8PC2/KqeWmQTBJhbTKtBH/48OkNHJx5TcMA/p4SGiFWy4ey690V5Sf
         JRdOVXPQ2IvHxFeBFZol+K1ky3WTwdciJZyBYqHXlLLHwf8VCgUx0eLm7iIFPAnltsYt
         nwJQ==
X-Gm-Message-State: AOJu0YxGInp2BE7jfZqhZgkvJCQsFU+3RxD6RzSnpw61vqJsKu5hOIF6
	bAkGa+tIt/ll3N2F8dlT2InM2fG5KPutYe4dUztq+XBhlr07kuML1j5R/b1kIPFEJJb56/lbs2B
	KoeLkmw9dEAAAoKdQXHt+cuhq+9aJC11NqXyIgGSZ1qKm8OrHfqOjkh1l8C8NBe+T
X-Gm-Gg: ASbGncsgQYFyPY7KMFDrPA669wnxNyXKnpNbFspAjs1M48yf9LVSde8Kkdov4siopcI
	SH7LMLFlpllYZ4/6R03mCcVP2vmo/tFSV4iUy9sAGY0UXBTytyYj0GBZDNJCIslOtuWuXMgPptC
	A5SdOg9VAZhB/4e2yshJ7mu3fRtzDOYwyQM3quqrJjBQF8vNwWTidyxYKmWg1eNjdXZeCZak6eH
	TJaBZ5FM3vBvxLqNhutRbh3CBgvWsSmESZrA8P7Wr1LgggsuyczdCQHtDxzKCjQI9Sp2aDilhkC
	LgvImDS5gynxMMZXC9YpG/BRQ6aBY89c/wGVCAKsGSaTpp9Z7dM5mWry42o=
X-Received: by 2002:a05:622a:64c:b0:461:3cd2:390 with SMTP id d75a77b69052e-47167acb69fmr25559811cf.12.1738959837130;
        Fri, 07 Feb 2025 12:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfOKXoFApMhJ6QtE2PUWZAh1oiPCmRbIWwSd3IcovCPv/+UAtw2bYxLPW51FpPfoCUUAk0GQ==
X-Received: by 2002:a05:622a:64c:b0:461:3cd2:390 with SMTP id d75a77b69052e-47167acb69fmr25559581cf.12.1738959836679;
        Fri, 07 Feb 2025 12:23:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78b9b09b3sm175323866b.99.2025.02.07.12.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:23:56 -0800 (PST)
Message-ID: <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 21:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7HXcKWw__M5RA757XArpvkPe_CXDr8f6
X-Proofpoint-ORIG-GUID: 7HXcKWw__M5RA757XArpvkPe_CXDr8f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=759
 spamscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070152

On 7.02.2025 11:31 AM, Neil Armstrong wrote:
> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
> partition map phandle as the 4th cell value for GIC_PPI interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

If I'm reading the core right, we can leave the fourth cell
uninitialized where it makes no sense

Konrad

