Return-Path: <linux-arm-msm+bounces-41805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4139EF58C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE05285FD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CF553365;
	Thu, 12 Dec 2024 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BG8+QpCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7794F218
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023859; cv=none; b=qwSiXw/HXvR+5FXEi6yqVyrnKUevnauz8sxi+NkXPu3p2qOj3Vd5iT0KZ7oWu0l8WqhwDxasgw+nMOaENrEY1iifDRpGQZQXH0LDhwjFpy+GUS/PDZGBW8oSdgJfNTVNXgWMoVgWsXYo3LvRjwnqJh4iBKB6fJR9XH/LNkFtXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023859; c=relaxed/simple;
	bh=y3MazrmsoNv51pshbat6GYWNQd4U99dkLcGpYfeI3i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvHPzKU/VgtRt1bRkGnFmmKpKCg0MDnRKfUGWJH+zhnUhl0Zl9FwIM/xuh8U0BRIQPEsKmHxzhiKCqAPXaNQmQf3wzKQI/Y5Xbp3NfHRrQ8lADG0/EbY8OD1wHxYdmWQ/26XgdJDcoY3pPoutprMbtdbWYM5/GFuj7qrfpgGAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BG8+QpCp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8PTTI002193
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00ew4buxa109w+E1jmiDpwlb8UwdJqPlcJafnF2RHzI=; b=BG8+QpCpLeud7pxD
	9hrQ8mpiI5WlNQ8o1HpeROwURI19l6Ea1MFcNWWvLSIg8tQldOJntCG6y3k79QjX
	gdBveYmwGfEvVcqz7/vMD8lqIxm7u9ZqS7UgyJaBLkugpQbut9TPS92bnVYI4bbr
	aVJte7gma0n7VX2UGJ8ZnXqIjB3c8DvXoTAcy4g7f2wXahB40Vhf/qiQWDW1SjMY
	iCbx379JPGeNT+st2kbckB+bE+In7qvs0xOXvIa0ThrBfIEdhbUCYDyhL8i/Ks8w
	NMCuTHOTevClwhQE5+mqIIrT46SPhKyeN2JZwXFX6h06Phn5HyLFvs2ZrXgymyOR
	uMvJUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg6687y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:17:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f134dac1so4169085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 09:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023855; x=1734628655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00ew4buxa109w+E1jmiDpwlb8UwdJqPlcJafnF2RHzI=;
        b=wWofcZuzdSsTdiWUpAyDsRuWHCqN6S3361D/B/V04YV3vs9+X3/gSDjlj0wdFcfw4A
         q9F1nTDP/wfOwMUFnD0adauoj8YcH+XbCI3syWMHSf6BFWWzmyswXGUCxwVGhxJ9CmBJ
         x7RYd4wIiBjqgaUlMY1gyW4PKtn6YWkJbGT+J1NQUw+linEKzOm6QKF2E/w4UhTg4ns0
         g1VpqhRGy322++hqOhdZVThd931nSiH+Ylbgy+cheVFwBwrJo/bAIa8wTytFQLOqUctv
         tNb6+b9GGxiOnQVGwwSLC7KkAQtPRUfswr2gzPv/lXAWHAQjo3U2ks08M79g7FE+cP/N
         hIOg==
X-Forwarded-Encrypted: i=1; AJvYcCVBfkkx0ekq7LB9kPz61FJo4gPSWw0E4/DImo6JQWT6TgfrHkv6Dr6tZDqCOb3ebdSLFqZJB9cCQ9aVsay5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4ycjVAVe2aC/OdQ2yl4vjrnhvwSPRazz+akOBXDFbB0Zj3VP
	zX5CRDcSGZ5YHFvGQVh7z606M6VbziBZXGPOuXjKVMR4vppjIcn7QKMDL+6uJhfeKNW2ybSAYLv
	7V+7kdjbCZCbCC8PFjmBQkys/wNhNODSwHOUz1spkN96L/VWZ93IJJUc7yyAqrmaA
X-Gm-Gg: ASbGncvSUrBXJms/mL4w8WkNYvLdLzjmTpck/FCBmIo5PboHMQqoApVbcLPuIITL69C
	NBVyM2hXFZ66ZX+WukAW1OSe4+m6cAp5EPnU80sFas9d/3xgp/nZxgGMloDiamJA9DlNgOFdG8G
	uHgn/5RenFH0K0ZbTms6YFD8j49u+/rAq/YBEjz+eDgUGEwtsv1i1aZFHh8AGS2dV2J9ciYdPqA
	Oyzas/oUYAjBLdmddPKIs6bf4JisBhDnfJefnhfdrOik+Wo5n2JRLycfay5pMJM5APsI6bQU78r
	3PS0yPKIzermCRMxEBnNJxAa/qcyHrd8PjGdyw==
X-Received: by 2002:a05:620a:454c:b0:7b6:e6a4:9668 with SMTP id af79cd13be357-7b6f89c172dmr54711385a.14.1734023855222;
        Thu, 12 Dec 2024 09:17:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAUNA8AhhwDMLvTFvKGygWG0d+9M/OXk0CuQAdC7E9rAGjae73oDQl/bxGXM/hJDZHi1S76A==
X-Received: by 2002:a05:620a:454c:b0:7b6:e6a4:9668 with SMTP id af79cd13be357-7b6f89c172dmr54709485a.14.1734023854773;
        Thu, 12 Dec 2024 09:17:34 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3db53b828sm8039038a12.74.2024.12.12.09.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:17:34 -0800 (PST)
Message-ID: <97736082-97a1-4a77-ad53-09d01089c302@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:17:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] arm64: dts: qcom: qrb4210-rb2: add wcd937x codec
 support
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-7-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-7-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DRVfPtkJbnEZAc886fipT9vTbIvDGBC6
X-Proofpoint-ORIG-GUID: DRVfPtkJbnEZAc886fipT9vTbIvDGBC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=786 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120124

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> wcd937x codec contains soundwire RX and TX slave devices
> and can convert digital audio to analog audio and vice versa.
> The codec node also requires description of reset pin/gpio.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

