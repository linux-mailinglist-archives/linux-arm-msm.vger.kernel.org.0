Return-Path: <linux-arm-msm+bounces-80566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33035C39FB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8E01886F32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 10:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3946730C62B;
	Thu,  6 Nov 2025 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifP91DDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KshJYi9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB42D8379
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423235; cv=none; b=ItoWWiLPcnhjrDMoma2of9ycJufK/F6OxWVgFIBEXKhr/6bZqCgzWnjHY0wpN4hHrFLgIGzqUq+7t6sl25anYdtYYcx9zywi98F5LL5Zc8fd9sXcw+i1ivw9t0ezSkDM20mkpGpEW46W5xSVH5fuznnDEWAOLyxcVi3k0slQZGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423235; c=relaxed/simple;
	bh=wF5SPjX6L9XXVGJFNxEpnsrq3oXW6/HgW/D2cEkYYMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnpOPc8Gjhds/UDbT3sQjk46scDFh99f73m3IqiLsqjO5P0kBpXvTVpGAYoG1PVw61DBu5CuOELF9vHr+zqm7dE8ZaADHZOFPIe1URc7TCkKJvwsHtQQAOTBN6Ak7hNvZtpf4kWVGxp1kdeJ/eyWdtSIsku+sw2Acnd3veyEj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifP91DDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KshJYi9z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A69VfUP2799018
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 10:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJ8tFZD23D6pv8VDozl2uS2hfghTxj2rEDZoN/LKKwM=; b=ifP91DDZy6iM3Abk
	cP0JBiKwjDD2eeI4W27adRrP4wcrrtSWDVjITYS5lezn4GN4DkgPbkZVpXlr269Y
	8Pj1a5P66FtMEo9NTHHIGTCUcsA/ZRh5K8FIjSxUn73dnQGQob8PBeRYuDgYQCyt
	5BqyNMWbkL2T/rMT3f1hyrkNY9andSN2wyf0E9gyHwZ3eTmQzMLOfcRAsdM7k39P
	aAGzvKmhxTKcaxjUWJr7IymAdvF/v9viCNyVTvQ9Nl0nmBishHhotMF61nLZYa7R
	bczqwXrHwYisCfFVKAHWW3aHCjnfDl5DAbQxNpli6tCuwagTU6NQnxXsM9xJN360
	dpsjGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8hytsa7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 10:00:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b21f4ce5a6so2122685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762423232; x=1763028032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJ8tFZD23D6pv8VDozl2uS2hfghTxj2rEDZoN/LKKwM=;
        b=KshJYi9z4gabnHw9mHl9w0A7KbXadqIT1CN76Mm15rVuwTBv4B5sVXssGcoVEb2irU
         MuSppzyGCvBc0t0J9M41joO4OzZFIziGk9KwuVfbAhu31BzIf161LxaPPLATfnDazqN8
         6x6SrSehmrFSR6XWX8EP86iJULSmnH/vrTOeELRPL9PganJnuN53qz77S49cR/WmFO4v
         nE7ifM6SlGWlWqMLTNNnRcOXe0eIGc+wK/dOkCQihz9RRiTqfRNsEknSqn0INBPbhYNu
         SmB7IhPkY7sP2wyJJNTvKfpgVk8xUFiii0A+3pXxfMO1eV7IvvIh53C9bYrDwgofGkUY
         4QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423232; x=1763028032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ8tFZD23D6pv8VDozl2uS2hfghTxj2rEDZoN/LKKwM=;
        b=H3BQSNCDWlrzl9543er+mUfsKuKyHLiztMzAFQn71TBDQbogR/Gf6dNiWVsdYeytz1
         ksD4opTNW2tYtu5DEnZxTCzJcFKb9AMzdmcn6CzZ/OwJx6H3eCOnyZdcpanV9I/+XkJK
         8xrRmdFzsrE3r+M32qNasiNvyVllrx0MkYwFKfgGmm+JT3IsO0JqvdoJghti08vJmm41
         g9/d0xYhTQyDCg0YTu5+0CfdQcgLaSpQ4QoUxtz2LwkhgP9HRSEIw017DJNZACzN3rJ1
         052CrkDv+o6SQGBjXSj6bVKFZ5RvQQ6dJTUb930IfvADlIn1zEtNbEaPbswAWOfz35F2
         EKTg==
X-Forwarded-Encrypted: i=1; AJvYcCWf88Bu7iYRezStePU72UKIrpc3EZ/yMOBXbbm8HLqs4FEmQT5ZJBhKXIcX6BvYX0C5gJqWPObYavpCbn9S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3b8ZzF/bXZaCkZ6X/Uxr8Sun4xNOa1vjxkaMJbikiOBBg0PZn
	MCr+xkaXPN6/HwKI4s9Kj16PvKIqG6YpzLMoOqnLBQ7Rx7P5XmRTGqjfQHkrd8o9rRfV/L36DTL
	bN4/+ZEEqMCnYJjOPZ6al9c2eDsvw+H8A2k43QU2J3nksgfxsKYAAuGRJ1C2o53cQVnoQ
X-Gm-Gg: ASbGncusCevohNI73mviqSBaBVNYJHoB6Rbem+LOk3+AWLSzVxhqnJt+ZfHdZZ991ST
	5O0ri80etdNeJk90Yjk0+z0vzRZtM5sEkKMGtbYQcT8py7eI3IMf1vcIPv/yriPHTbPcqOq3zPx
	p6JnN0DDZMSow459EexWvf4Z5t86PjWNmeVt7XFJiLiJQuN0lYR1AVB6zsHtTFb6JxwKmferW4K
	gIrDDd6GnwvO3W/4Nk3uU13HY3Wv9w3uFzqbJuQNBK/rjkusdY5aH9HT9chT2vIwBwSLn51YoTX
	dw/r6X0GK6pfnSkieGCTxStao3+wEgg6d+/xYYCMsgNWW7NNdZedMKekXN2eS8bnmBrPxV5JElb
	CfLP99T/6O95cZS/PNPNUNkP0XLN21Evqy7kM15AS6gbmZW2eXo84SsAh
X-Received: by 2002:a05:620a:4693:b0:8a6:1a5d:7aeb with SMTP id af79cd13be357-8b23748b481mr153973985a.9.1762423231559;
        Thu, 06 Nov 2025 02:00:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4uHm6Ex0yCpTYXqQ/1sUu8JUANR193GdIulgFOc0pBc4KTLDo406B3DhFtvNvYfqaZzJcLw==
X-Received: by 2002:a05:620a:4693:b0:8a6:1a5d:7aeb with SMTP id af79cd13be357-8b23748b481mr153969985a.9.1762423230911;
        Thu, 06 Nov 2025 02:00:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a68sm1456023a12.2.2025.11.06.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:00:30 -0800 (PST)
Message-ID: <04ef8cb6-8d0e-434b-adee-b7e32a6e0b8c@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 11:00:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: va-macro: fix resource leak in probe error
 path
To: Haotian Zhang <vulab@iscas.ac.cn>, srinivas.kandagatla@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106075055.555-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106075055.555-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wnSc25IureNSO3bnuW9Mjj7pM3BNKUoX
X-Proofpoint-ORIG-GUID: wnSc25IureNSO3bnuW9Mjj7pM3BNKUoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OCBTYWx0ZWRfXzTppKrtCejXO
 hoaEKo4ppQRygHd84ZgyxESGRCETxk3Vnnfl2EgFLBn+ZuxhBpL78A5maZnud0pdBnN96mfgTRn
 oAvK3btaWtFOz4Iyl2JqFCojQJGooCGL7x6bGPZLX7dGb1hifNArpks8GvSQh/f+QUVX++ELmPj
 F3rNKY4KMzt/HXuYtkplQmk5h9BnbcGaOZpWWJTQMoqpqbOvdZeUph6k3YpvYbrV9+f4Q3dXwci
 hpai2a/aEUnGgMOV8bZRvkZThmEyqLMb5gue1FEWGt34zreOooLoz8oBq5KP9G+NRzvA5elpfQa
 0pp5tNae/jDLlXq/Ai+J2Y4eGklCBVQThUKLLt0AE23NdOw/X1zHTlyDETQAl4L4Vc/cl8ERVFl
 N1ZvCbw59Fjv2OHi18LON7qUd/laZg==
X-Authority-Analysis: v=2.4 cv=X+Rf6WTe c=1 sm=1 tr=0 ts=690c71c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_CcdfDJzPmikts8YXegA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060078

On 11/6/25 8:50 AM, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, clk_hw_get_clk()
> was added in va_macro_probe() to get the fsgen clock,
> but forgot to add the corresponding clk_put() in va_macro_remove().
> This leads to a clock reference leak when the driver is unloaded.
> 
> Add clk_put() call in va_macro_remove() to properly release the clock
> reference obtained in probe.
> 
> Fixes: 30097967e056 ("ASoC: codecs: va-macro: use fsgen as clock")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

You can switch the clk_hw_get_clk to devm_clk_hw_get_clk() instead

Konrad


