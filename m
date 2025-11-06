Return-Path: <linux-arm-msm+bounces-80625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39022C3BF9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A4F3A541A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955EE23EABC;
	Thu,  6 Nov 2025 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErN99+zn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdNdYMGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9DF302172
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441559; cv=none; b=iloqpWUQ8/3dM5yPIP+NSShhDRpr/i7BGSCtjKpAqW3tF30MMeP8cgTBrid8/+Iu31F0n2OEMUxd3CjKXQs03B3cdguRGO3E0lypGUhj0EaVUlr8KKMjxwbzpDKHMjYn1IYfXofxfAcV3Ytsh0uHsRVMqJt5qYmoWr6KigvxjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441559; c=relaxed/simple;
	bh=wHjCF8IEFhlkHVeBtODMM0Twhtinbk9jVlqp9J8Ua4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlvXF5MmC6HdvSVwyqyrQZozd2H6iVMqhJqpx5xH33kDCw+HTQDKees93pq9I0Lsccu0Oo1Z38ve3vnECA8Pxnt6dRzs2q659MuuWp+jq1Pn723LtWnF9KARY37OHYmCeRkPmIiRUai5FClLNSTTEUYXRUNw7GSV+X7IBNYCt3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErN99+zn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdNdYMGo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6DEBlF3217752
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 15:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0f0Yt6BImgfsLX1VnK160zjY+hQZVBZMn8DoklT0x+M=; b=ErN99+zn6TORx8P5
	MbP4jS6yu+eedDMXyYq61cyBKDfeTwTOxwr+McB+MnXCSX/Yvrt0OQEFPoeO785M
	R4e+dPTDHba/WDlqZ/MRn9jxR9/3ZOOAkYNRBbRraGUJF8d7O8syCaVLHJj392/i
	JYNuLKgWa71i4iOMQW+TDcjoPU0P35qOOAv9uJepBbjBFo04WNVCvznhwD4eCBlq
	Fm5PQ4aZJqCclbG1pIb3TVrCZqBvf34uWZsSzgZgVZBqkDUhA6sq/GXE/9Gdr5YD
	2N5sQXdYmKnT8Krs/pTNh3SVejMpc6ojFj/lqC/mrKuFMa/iDA+kesQq7nH1S45o
	gLtSBg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8n7phnq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 15:05:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-3e30001866fso451635fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762441556; x=1763046356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0f0Yt6BImgfsLX1VnK160zjY+hQZVBZMn8DoklT0x+M=;
        b=GdNdYMGo134p5rMxpSQvQcEkxZ8R24zbqC3WcYU5QBb0kynguqyuO0LRQGvOT/6X4W
         cqW4QkQtTWU7FSP/xUTFGxrAlwT23mflif6TckbuyPiDlpW6XELUinWm61BnuZoxX3e4
         udogZPtu5WDFMUQwRtFdfH/yF5QzanH7ObbsRE4fXfRpTgZiS7HG1c40cLPlA3suFamh
         0CBPQDv3J8bLX9NUksvDv/KsUfefC4G8syLEJ7PS7amXy+soFnuk24dHtjEQ0UrBzwas
         MJe0IaPu0XkzaZ1kJUkrTkCnJeGexN9jtIfHd24qc4NHt22frPlxlr8ZC6PT3iWHx3S4
         061g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441556; x=1763046356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0f0Yt6BImgfsLX1VnK160zjY+hQZVBZMn8DoklT0x+M=;
        b=gOSGn00VzU4FGBXDukLcrlOBXqQt54+vjAWeMiijBCzIqEFk+xv7jzC5qFSuvwTX0J
         sxVY27y7OPXy8kP5tc/KcIYPe1t5FIwvdJU2ofrxbnhmhrveHdOzrLPdSV42OQeMmVPz
         UeSu8qVjxkUFuZvKGhW8YOx1k7krUYY7Zx7FjnrL981DTuj4ZKsDmN7wr6ONhl8oP4MF
         zZ0OAUVnoa1wEYsTUSVAp6qgshXd9chtv9VwanF2QC1G4wWe26zdhHeFW+Uj/6blCyLP
         UEw1dMjO1/347/Diz30hnbTP+1Q2rbPyHJLrbIseLN46u7AYfzi+CYYX8Q7GW/Aa0P3S
         2/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUpdRCmR2DZiYgJchRNrpCaVVIfAqsJ8S75rtv9DEFGrDIt06nPMSIgDfGlTl1xexhXCuxHrcrHjRePG5k2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0BuO5kt0uIO7p0i9mTm+DSBR34qOi3/6zdTtUnLcFvl26m0xX
	C9zdhEvpIgP5e9idzjWFmSqXjoIfYemm8vAZ6hNJQclNQhQZq0fKqUmr2MjsxStQCMQrsqGAb5L
	K+yPXcjhkh/M8DI3Tj/yuXMHmnjU71l90BgKOJdiZTZ1LYgY1m5ZzP542lo9LBg/YioW8ERVwgC
	IO
X-Gm-Gg: ASbGncuryuAjFP/5XCbTvCqQwEiRtWipOZGJx+GQXcanwOK8t3+OUPeSaaeyXayMurg
	a1BsBydRfa2L225+1beF4lztbuGwfcSe8Dhv2YJjqQRLnkAXC/iiEXj9KYNSB8zxUtzlNPMPNtZ
	aODZac9HGejB2S/oic6sbb9q54WF3qZZqOaYEtdWcL9Ty3t4fzKFxfF1mE9Vi2f4agqYMEn8d3k
	k0WwJtd4c9JuQAAhONbnT8WR+r/wTsbQG5KrVBzQ+TswdVh9pZPAZDkJ9a0MdRbha4n8Y/TZMTj
	mF3g5jxWWdjYA3upyyAatG0V6UMIKbKoMD48Bt0+Yb9LmFY90vJ2D6FEtcNAF4NTzyEuH0ExbBF
	BcoCKJ5cfiixoUqE2Yd+iiWLatMvpbNhcWkpmMy491UACYJX6QXWRaNgk
X-Received: by 2002:a05:6871:29c:b0:3d2:9cea:797b with SMTP id 586e51a60fabf-3e19aefcfd3mr1946044fac.7.1762441556186;
        Thu, 06 Nov 2025 07:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIAGacM18ZhwI0THFt+BtjFFO0RmYpDm0B1ry9GZvpBjnFxTd3iqjoXH2/KEvfgGC8+bdwYg==
X-Received: by 2002:a05:620a:4542:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8b220ad7018mr654834285a.8.1762441110580;
        Thu, 06 Nov 2025 06:58:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-641245fb967sm1379654a12.20.2025.11.06.06.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:58:30 -0800 (PST)
Message-ID: <9b024347-21ec-426c-b783-1a9351fc248c@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 15:58:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: va-macro: fix resource leak in probe
 error path
To: Haotian Zhang <vulab@iscas.ac.cn>, Srinivas Kandagatla
 <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106075055.555-1-vulab@iscas.ac.cn>
 <20251106143114.729-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106143114.729-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 40RxRZFjJeejxDIOQRNhCeOtZ85A2FG8
X-Proofpoint-GUID: 40RxRZFjJeejxDIOQRNhCeOtZ85A2FG8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExOSBTYWx0ZWRfX/nQUqTEDE5s6
 pVaGcEftsV7Jz4n4dDD32aZPratdOueH+aEnBVEO4r1O5Gq9ZzRMIe8mObV8yj+m7au53cIr42O
 5cbqKL/DKzCTGWkqjuR1Cbtz9hk5uxiKh/N0nmfey/ze5G0HTgWk/JoBEhqSXDvFKcMQ/3kGVjx
 0vwZ8lQ4nhs0cuA1Vds9xXd00IcYTTCzsIuEP9T9tYDTORNNzgb+rMqqjmJSsLKCBuI0HwzwJfa
 rAIBB4a2sikqwbcmYJJCvPTpjs6qUbzwpjREyb/cTh8d4B4CQ4cM1hPq55NUGICfUPowxTitj9x
 y53GoWSQQJf1KMbdDPdnw0rLWH2ifTdlOaidYESiY433AQO70Q9vhB9ro+yd32oKT0IKuoLRAhe
 zR+DBD5BBH+M8S1+dl5Li4T1NLJ/dg==
X-Authority-Analysis: v=2.4 cv=ErnfbCcA c=1 sm=1 tr=0 ts=690cb955 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_CcdfDJzPmikts8YXegA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060119

On 11/6/25 3:31 PM, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, clk_hw_get_clk()
> was added in va_macro_probe() to get the fsgen clock,
> but forgot to add the corresponding clk_put() in va_macro_remove().
> This leads to a clock reference leak when the driver is unloaded.
> 
> Switch to devm_clk_hw_get_clk() to automatically manage the
> clock resource.
> 
> Fixes: 30097967e056 ("ASoC: codecs: va-macro: use fsgen as clock")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I feel like that's a little much given you found the original issue
and I only suggested a different way to tackle it, but regardless:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

