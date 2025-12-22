Return-Path: <linux-arm-msm+bounces-86163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7BBCD536F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C1E1300DFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4367130DEB9;
	Mon, 22 Dec 2025 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eReCte+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhdLUXME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591D30C62D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393928; cv=none; b=ZA8HzVRpPEAhNQW306KKMdd67TCQjTPIw0hwOS7NFXpz/COnwnM3FfzJjtTT3fTy2+UbDUFs6vNlDhLEEXq8E8MZVWLarTXVWdB3qmG7VPMwxGf9ZfRu9trn10w3VV1MJICqXr85eG5OnuxcVqDHRKQr9UIVCX7wPiXonsFfe+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393928; c=relaxed/simple;
	bh=s5LA6nWBUVzC8gaQ2z6YaI31y6HaVR+XRz/f1uLYsFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMgBaIRahhMGK0YvsoQc9cvi4FXGaLKNL4z44VeAmJkaluvwq1yW3OaM+3Mz3cdUK6dpteDOj3R2ED204991I51iEsE+IDSJggvTeP6JN8EO8EWm9wa7mARkdNP820/F4A1aq4UAb2WUgz47NAgvZUgJvnd0+3a36PXxaFAm7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eReCte+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhdLUXME; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8PFDk3871485
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcWNosw/CDJcdIG+Z5ZrcLXWdMK1YzwSOWxZEdkfYRw=; b=eReCte+3Mea2TQ0d
	FYZXgxBeH2Khwe6T/+u5augikKCUikNqWlZ3wX2STkpZ+pFKT/bNF0++fcqUkZpd
	ZVUYrFWGoQ3sBp0jLyzSkNsBM2c08eMzmwgg3AS1L2QpEhHqspIzNwLqqwqBM+ws
	EmlXARnOYAt9m5tnFDVq141fzC3PRILP0Nv6wWc13ot/tY+WtoP3kVcK636s9Nu0
	UnF6ne3Kj7q/E04gT3+BtpJUWPjKutiM092L3lmzCqGjtCo3KYt2H4Ap2gNi9tbg
	IS4y0uSQ+CSfuywRw6zZ+o55sWT83R9F47n89xfavaABI2CStmQ1DM94sOJ86OwU
	oM056Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4cvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:58:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a31087af17so46459135ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393925; x=1766998725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcWNosw/CDJcdIG+Z5ZrcLXWdMK1YzwSOWxZEdkfYRw=;
        b=AhdLUXMEXF8hN5Qf0tcOTHLl/MSL526otlZ2psxJs25MHcuapsHri52mREag8Ivo8T
         mGHXaBM3v2+Ur/FE3TblmElrvapUdEbYFLhXO8o/KRhQKE1Vhwt/U0GpRIkv4h0ccf2/
         3c2KkWNFHjS6FcbfBXzYOIaFiywf25pVyc50kpUvq9Geo6ye14RC4tk4STBJEO8Cio25
         8Dv/l6G+rCuNdRsmnKjgIi+jKdZrfYcAlKqJmnT26Tt27QvZSWPEDaY8fBla/99Jc1NW
         HYByrkXM5tPGAZbMP0TqqdAwvd9iFHfuJHj3ErZ1zKUCbg9K+PtNqyZ2yNMvATai3G5M
         a3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393925; x=1766998725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcWNosw/CDJcdIG+Z5ZrcLXWdMK1YzwSOWxZEdkfYRw=;
        b=DZGbLFeOp6Vihhx0ZUI1/AzrM5RSVfiFA6Xil2B/5CUBJyAjDCza+vQt7tMqGL0PSl
         QHn/UbQQKz+n6jEzSJmZK2+OYxpaV91lSS03WSxGZ2Xy4UKTPlHB/koHyFRo5s1s607j
         hgz8lSS8Hj3YAjfOU8exa2rsPMeaf/KNya7hUS+s5xTzLaYduSE/GrlxcEB3T0f4DrEJ
         VqVcpJk/ljVbCXAEXi2g8yot9YXPwiYisE/2jiiMqYa8ZL3tbYXSiLjCQ5ZMW1f+Gs/W
         shoX2cFvnJUlm1WYfAUPQBaUxeSiKVAatGXnUNYQwiiYbSU3ENIYFDXfbsGK2D5s4Rq6
         S0Jw==
X-Gm-Message-State: AOJu0Yz9z/sNkJptsce0RvrfSlFYhQnMzwt/KjyyCm1JAzuDqUjY3Mw3
	nDoCjkvXGNI6VbQuFxWvejFIJpS4s5Z74KYnq8AYk2glYerSePA3lF5l0k/qlWVuxYEBcPViOB0
	rOnQtHWqSHlqUnyB3GBcEx6Hx3gClaljyWQfqc4f9ANL9DqWRBlDKxgzQ96w5iXCXYZrG
X-Gm-Gg: AY/fxX68cQgvPsz/9Q94XmWXZYtsaj4VqWN0q29/MDCxVGCBmSBJR+iwwNUWCJYdzCc
	h9ILBRD3/2COeQPfSaFJY/2Zy7OzHEdGJtaKVeN3WWn+XKs+KCdBCTvruFGSIKg479f9XQXzVBt
	+0vlAxmy4htQsTw4nzZMEOEcG3XmVI3tT8fXiRLNWrZD3IzFIxY/4f8u4UCdtVZ/3khP9TVmumy
	mET5HW+qhXw4sCRJaZzFOkNVIf+4BZlPORD2pU2T+voWNs//nRm+gARNFTK8rmS8dCQTi6Ugo2v
	3z3ACfxCby+h1IIo4KhgDCxGBwNttyD39qCkasaNItuCleHw7gQPqscwXCzF+TcCnxv9sELithn
	Xl+FDGnY1Ku79PVztdXOPR0QboMQyGoFu+6nNfK3sNMWlo5g3W14Dl0mMv5oRJVfjcv7QN2AaMR
	s=
X-Received: by 2002:a17:902:e810:b0:29e:990f:26fc with SMTP id d9443c01a7336-2a2f2736e5dmr99559335ad.34.1766393924618;
        Mon, 22 Dec 2025 00:58:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMQb8zfPb/IVLCQABe1wTJeguw9tvaE7OfSa+BrzSQkeb9jsCjCK6SoyspPFSqEw65RHcvkQ==
X-Received: by 2002:a17:902:e810:b0:29e:990f:26fc with SMTP id d9443c01a7336-2a2f2736e5dmr99558985ad.34.1766393924116;
        Mon, 22 Dec 2025 00:58:44 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7727356dsm5866233a91.4.2025.12.22.00.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 00:58:43 -0800 (PST)
Message-ID: <276a95b0-acc1-45c8-bf2e-5ae6369df252@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:58:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: qcom: dts: sm8750: add coresight nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20251120-add-coresight-nodes-for-pakala-v3-1-03bb7651bc90@oss.qualcomm.com>
 <cfdd0865-9f5d-4c53-928a-9c7bafb55375@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <cfdd0865-9f5d-4c53-928a-9c7bafb55375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MCBTYWx0ZWRfXwYgKF/OsodaP
 +WEXf+sZ0Db8Ijvk8kN0wtk0NqLySnDeuJfhfIIfMq22r7lnuQE/VOLR/UMVAKqQv4E3OvD6OgP
 ahwQLb4K68/DOjnSikELhQYkmHpUl0zz6Bijf/82L/nywgjYiX9poA4wysd8AADp8WVBOzwCh5b
 DMdb78uxbqbl11Rij+R1b9Qh+6YAbVXfXAUjk7svTo0S1rILQzHCJqL9zDFpJcn9aep7Dl/+Voi
 B3yFN9c/lYiUu+b+YUGb2X5lKxGLEs0hszm3yDoGbhNsp/76F3LZWM+jWeDMesXNjmYJi5wigu+
 aDWfW5DiILPieIqjVtkxvmdDuQdYeRUrEL7e9td2pf/x8HafsdDr4uEOwBrAQTVF4iEL+xBaVC4
 IHNF+6DgYI4pgpK+LZlMrLJSTL1RkbQgpG1vKFUCZddi7epzkR1S89952s6S/JQ67dZOzKFT/bm
 yzqROB6enVL4M/k0Lxw==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69490845 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=T6KacKtowlF4jvHgg64A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9E7VR6VrOquE_qH0RQZLRvUh1L9GepVB
X-Proofpoint-GUID: 9E7VR6VrOquE_qH0RQZLRvUh1L9GepVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220080



On 11/20/2025 11:26 PM, Konrad Dybcio wrote:
> On 11/20/25 2:48 PM, Jie Gan wrote:
>> Add CoreSight DT nodes for AOSS, QDSS, CDSP, and Modem blocks to enable
>> the STM and TPDM sources to route trace data to the ETF for debugging.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - replace the turing string with cdsp.
> 
> thanks
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Gentle ping.

Tested on next-20251219. Patch has applied to the tag without conflict.

> 


