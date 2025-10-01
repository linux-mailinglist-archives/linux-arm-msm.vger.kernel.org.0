Return-Path: <linux-arm-msm+bounces-75640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31471BAF995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1455C4E2263
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4F5283FC2;
	Wed,  1 Oct 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDwGIaN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345F270553
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307061; cv=none; b=VTWyz+MwDNda/TpbhfcdNM2ihNS31fFsKHUVpVH4E0RlEG3+XRQdshiHJs9lLWTvtpK3UNFww00CrRrOpMKZ4Mwiwt4llIjeK54T1JbBzmM+Q64+bcYylJOn0beUak4/K8mNrVI6szIg5fXXyrdcmpb+AWx01aVyPhwy+E07VWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307061; c=relaxed/simple;
	bh=2C9amxCrD4gmuZzRHFFROYAejnvb5hn0iAbtlaA/Ujw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7j2aEEwNr+p8wP8hO90XZfKTumET6BNtkG0lJtyPWU8wQvCLcghjjXklGPRVC+slxkUfhelymmfOIqFWBRI2SCgoI1tC5ih5J9EiD7VYnKShnjGh1L3TJ2DgO4iC0oxUcDXiO+cKQChS2cR97itzrq9DaHvl0qUo7M7rXD8xZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDwGIaN4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKpXGL027376
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jo9b/6mPaEeK5PkbErgGIXrd32k0mUaxbolG0MoaK5s=; b=UDwGIaN4ksh9PcZk
	GXfb2oEcQ333hHiy4GgLWyZSIVW/irxtve1zYmAo+fdXDWic0m/jI8PlrmNroZFg
	miuJrsaTzjVgFo2b4JGjqEHIBanHjhyQc+FAsNB9PHfx8pqQ9qBaUXG3uE2oPURJ
	5e8idrwC9x+WFc2UN1K1ALTuKMaY0N1FVXu1RWrN7M1VSghlnUUBqISONRO1pHxA
	PYcjd8JiPzYh0XHSSQESCFj1TP6nPVdQtyLbXFH31dtpb08Vyk0dn7KqFmVLQSl6
	jo2/xvQnIcpQVbEej/+GA4nv1fdyeUCLaZ0d5QvxW0kMsHNWAdEFxxNqqDTudw8g
	4xPogQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851kug7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:24:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dee3f74920so14234341cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307057; x=1759911857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jo9b/6mPaEeK5PkbErgGIXrd32k0mUaxbolG0MoaK5s=;
        b=XBYRt0Juel1BRuv/ZOPYKxM7q7qscu/6zDk8RwcZZpzjDk9h3eOUhlAcJ6cHeN7dDi
         ZAulhsMHfpbTqeHmq//UFK9qmIwOItFNmI6GAvnbsd+jZOmNE4ODBEe5GQkchqdhLr4r
         18EB8W7gHjzczSzDNOWH5ZD9vBVd2WlMmSu+DmqygR72fe2qBPyNdPsn3dpHBZ7XABZm
         Y2DheKdIn2NO+IRvuFUIW98+ybGRULhTc8zT1xdjTeMdd/exF4EZYXRTTfLQbXXZuNv3
         Tl7IkVnsjxepai2K0ms4dUmdjmPWwEQvr+M9UaLSmCes7A9mBY3Za4/rWECXEChgGQqE
         l2jw==
X-Forwarded-Encrypted: i=1; AJvYcCVH6jMQypfS9L/SLsVAlZrib4kAFWYmB8nVk3DqPxBpuI/vzE8uCLIfIGPMr0nCinWfjjEwsnamUEX4LeUr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5OyACimqA1bKasKecNFVCS3O4TX26wdngM0yTybj3H4PKwt2
	jSB0wfS/p9Zk7zbIP7O+IoUj+gR6A8rcGqZCrH009d/cX7yjDDapbW0i875NN4rrFjqlIIYrKFv
	QqHugM/0sbZdzJeih2DicWenkQ4Q5kedfIkAb6gaKucFzzgjh5Fj7gPS12KQ5tcGIYK6x
X-Gm-Gg: ASbGncuoDaEsynGZfijr6Q+HGgzlrwC6Za/4RvodiWx2A9Chh/yfNG4rdyi6vqyMzie
	0e8FWurmTgAiW28k6iyoUjybm6NYEJ/0g+GSI4c7el9vRS3gc6LyQ1rEY/UjXpFkl1JwxJs/dm0
	zLpGmQkcCRVkAsEHz1yyYYf0gW2lpEh/m8pw7a4esdSy4bk6bXhMI0esD6dpJF3ctqhFotx7Xc/
	tfsLKj7thK7AaN2iAI9HE0XZqJiqHsP6ZrK3LBUcxLoErPIoY1es8I6DiEkuLOU/dqG+l0s3jIP
	sJOjH7aDDl2fx/TBR8e6FCcUt5uhp+QJ6if0Est0ilWRUVQIW2wk16X3NgXCZojoF5yJlKUh+5s
	wxqbOQO5TMYNMmBABrjWC2NE5FdU=
X-Received: by 2002:a05:622a:1a0c:b0:4ce:8b2e:feaa with SMTP id d75a77b69052e-4e41c5470ebmr20268231cf.6.1759307056665;
        Wed, 01 Oct 2025 01:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4EwFukVUgInauIpgABmEZOY8yZJgYyBZcTIW1ccuqqRJmcHUXlbWU9gHnVB6KeRteTgKJ3A==
X-Received: by 2002:a05:622a:1a0c:b0:4ce:8b2e:feaa with SMTP id d75a77b69052e-4e41c5470ebmr20268001cf.6.1759307056025;
        Wed, 01 Oct 2025 01:24:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f772528sm1320320266b.37.2025.10.01.01.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:24:15 -0700 (PDT)
Message-ID: <0d799aa3-20ea-435d-9c56-150fea07aa49@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:24:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix sorting
 and indentation
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-1-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-1-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dce532 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX9egZz+4MVN7y
 wlKl4rBJFN4F6BC70QbX0Hq5N8Ykuz6ht8wghJ6ylZ1X0V+eGXGlskeGZ+W9/MHgsC9U+ZDwOaP
 0UusHR7+XZHz88+iaHfZwS0C9GXz83zL6vVzA4272t2/4Ic5KQGvps+lvGwla3Chl+kea2r9oFt
 w7tpMVKkK3EGRLt3mFz7vgiTyqGHGo3sbhFjy8rS5M1VK0jLlUOV8eqpCkr8oPWhyCEh3NHvPGv
 slSw2gOmnFp9n8sHNHpNEmFHbm+EZz39+HCQCPm4tgAFs75tu6enFhUeeLw6RyQUHtIu7nYv/4m
 SpJFt+YFdP5VbAnlmV+4U178GzpSVflr192NdhsHK2kOjn+ab1ubw0oXIxmNwWCv1rfsfEQnDZB
 XKehBuNPbF/Y1R0/pvsLmgmOXQrI+g==
X-Proofpoint-ORIG-GUID: Jm7To_gZQWQPmEKwVGaqM44Dj71VKmbJ
X-Proofpoint-GUID: Jm7To_gZQWQPmEKwVGaqM44Dj71VKmbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Make sure the nodes are sorted correctly, and the indentation is
> correct.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

