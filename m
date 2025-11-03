Return-Path: <linux-arm-msm+bounces-80101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08FC2B954
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 13:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23082188E011
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 12:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E90309DCD;
	Mon,  3 Nov 2025 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUzK5wEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9rBkmvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797913093D7
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172068; cv=none; b=A1Ucgn2Py0IZn7Sk14o9LPxeVnvKeybUVmawUxxKPzYHZkpO9ADqzKuU7RxTFtinhoOh0yLVOv0YtGnbCD8LF8MKezjJh2+YUVauV4jLvVlXMOHlEPW9w4S572K++Pq04YWKSeX3WtVLQRHUTpZRa2T7Nwbk2mfggDGl7A3Ezmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172068; c=relaxed/simple;
	bh=JTYZcKugNZOA0vYR2o3dVvUjZjHQpyWvNa4nAUsB1/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHgJ0VaPaPMTv5DueOH6Pnx4+9DJEkih40uKi0xy9GHZFJJjAEz35sNn67DYaom4M/FTS82Lwhfay9a/tmkECu9cP+AfHqqECBU6W/GdUKE+Z2jPWlpVE8amZ/aXwK8dQG+XBasaBO00K66TPHOQ1jwRL/i9DF7bZMkAfIhglB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUzK5wEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9rBkmvk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3A9koK1941157
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 12:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PPtwZvy+gqvwwYYjdp01cD8qHwlSUjev3sm8V5A7n8=; b=OUzK5wEFC9V0CHDj
	GQ43SzIWe1qeGLVQY1cULEJLKVNG0kDOlmmNJ18aN7Jh1VKQFeWE0iBawNDgzRUx
	5OH8EQEKRP+LE3BFKvwnlUHHXB2ySN/OQblyq4oUHHCOrU7PNDJunlAWBN+YGOoY
	jJM/nEhg3WZEhd0dQkaEYj+rZVD9oy1tWqIsnTJI/x3K3UYTo47za0JAPamLkPeW
	+vcz12BHIqe+vyrzAxRPtvBk6XJaxKJM9ESxX/G/QMfT3EPrJ7YPCAvEwGYSg590
	KnC8hHSzVjq4OhpvUHLsC9tB8X9pXAIffG+/kXv7oWZPQXyseiwP6bWfYRWerTg/
	kdkz2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w9dxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 12:14:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-89ea549dca5so218125385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 04:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762172065; x=1762776865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PPtwZvy+gqvwwYYjdp01cD8qHwlSUjev3sm8V5A7n8=;
        b=J9rBkmvk1GOnN25d25O3EaY5YN0KjYcx2ZTZKs4r+myUKXwP+qHkx1Tqz+L+ZiJzEh
         Sbx/eB3yeEZRg06cc/17N1v9Ee1BKt1ZpAO+7EkqNHWOeSCFgXAmgBiwt6KxLUIf17hE
         8vSXpWx7SheOXAHsQECwu+kzmFl9hN8VlZk8UQr8qucIJAahnIJKnLY/ifp3/8xUXFeq
         9AMb52vLSUD54hsYQR21jMV5BWKIg0B5MaPU/h76H+489B9rutA7KRLxjZ4ELmSgLIXv
         rpNK+1YZxzol3kArRfwovfQfrsQ+Ix++Zfd2Cpvs+YbPNpv8bY7sLDg8Hr7TxUzFvZEJ
         RWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172065; x=1762776865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PPtwZvy+gqvwwYYjdp01cD8qHwlSUjev3sm8V5A7n8=;
        b=UqPNWxwM4AwzJRAi6zKNxZOinltnarFKsHMB3ljuKA6MPCbXMKOsBdTjmsB4oMo3gS
         3mpv/ZAZwG56sSkVlcnNrxa9bxJluUw/QuF+Toa68PzBfbJVexmVIIbKF+o9Z72pkNfe
         78k+523YaaTt3Oh602l5WGT9Kqa3jLAWI+CohCE1wqhMXOdjijoz+EcrKp2kiBRF9Och
         YqwYpko/3Ionh5wBzrWvWoZYWyAvJN2xSAmo4r9ZfUYKiP6tTB7E4ZxG/LR1l4hI9Qoa
         9+K2YZipd+r/iSamn9Br7xAfZImwwaz3RPDZ+SgIoaXiy2KMwVEIqxC14jpN3ZMMBws1
         yjPw==
X-Forwarded-Encrypted: i=1; AJvYcCUc6QzQyT8pnjU9NS2p0jw5Bm+edq+6GZlHpyk0xiYt/pAq7SJa0txzGw+FqHqpzRSFX1bA11I8I6cgIUcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4WbmcY/PfhVw8dLpohpFz7fPmuk3Tq53gKmnOgvV7KaP9mDH
	GxMentYIVr+PZH4QdTuRTwdCo5miSVpXRbjtKrSJjnzAsJSKfOnGuCD6Ig+wVSOqpIdAJuliLkO
	LPIYl2d5pZjpGt4ZcZfGqQ/YohrGRl3HHIruW8jGfEvpV6U9ewwDBERGxT1cnhuGfF9oL
X-Gm-Gg: ASbGnctgQDjrIFB6BHOTqMMKd4f8hX56dIwTQUxfrtHSEkm+7BViVzeaQyFEnSmzRLs
	/MwfqMpR8E0962WWJIh8FuRNMtNQkBSGuZ0LAP02ITSfDM32nnC4GG5RsEnRxngk/F4pE8LGeNd
	/vR6bfnk/iQ1Ml3FPMQfs/PnPb+t5reaSHJbrJNBDgJwgRSzP+tccdpZ13ANETttArp6mR8pD/a
	+taExAEA3Kt4v2w/FW8MIRt+DGXNRc4BG82as3rklfcXQCtlQ4GI1wFou6mjb/eznNT/dfB8MC9
	UZLcsIqXFXXmVulTHRVtcob+i7eH+WXtJ+YxevgIMgNjcDrAwTvXg7tIdk5zfk5/98rdDwfsZlo
	aclmrhKeHpZqb4eIFlgqwk+aDV/eEQGOE6VkZOBxuHNoalGanvG0orc8r
X-Received: by 2002:a05:622a:14c:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed30f84d8bmr115447921cf.9.1762172064476;
        Mon, 03 Nov 2025 04:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFojfDNx4zUtTBFnI84zhhJWl5ScbUrZr2SjZmrkUFo9wwBQljbRwY0JohB1/KDEp4gMP6DxQ==
X-Received: by 2002:a05:622a:14c:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed30f84d8bmr115447551cf.9.1762172063877;
        Mon, 03 Nov 2025 04:14:23 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc248sm2843451e87.91.2025.11.03.04.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:14:23 -0800 (PST)
Message-ID: <c93afd94-9d94-42fb-a312-df6e26bb2bc8@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:14:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Various dt-bindings for Milos and The Fairphone
 (Gen. 6) addition
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=69089ca1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=PtzdWR5wS_Xl21Jse7IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: _DON9et2njKlXIsrgPQgTCKaktrKF7AX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExMSBTYWx0ZWRfX65utIpY7Ygqs
 ogyfO4Ca0L8HEHBfQv3tOypxPefGrXNNRupJsRIDZ8moF6mDZDHGLmEaDTf2HEbFh63zBTypgU+
 8WhJcxEwV5PkMX3ti0WWJtbJ8HHnLzEBMLgLwdA2Iee//WRujPbsWv2Ln5wUEP+6t7PNUWvsxZb
 Sg/ZNIBCRZPkE9ha/R9AlErvKy05YNub/AB1sgiYyblDFfAUaoyV0ZKV5pAK+8rRxLD/KX53mr1
 3zrf7nOLo4PaiZKwYW863RuzQrbjLe1GXFWbzVNDW4J+sPPlXqpevli4IJbd2bURRViIgTiTsjm
 8lbb+bVVOPSkAZKl4ypfjXljR3hzU9hWbgJskZCHuM62qNL4XrKxEcDuXwt7eI0GHN7J4nhSCCU
 GmGxt7ZIVRDcP2mT/er1dFbkz3JKsQ==
X-Proofpoint-ORIG-GUID: _DON9et2njKlXIsrgPQgTCKaktrKF7AX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030111

On 9/5/25 12:40 PM, Luca Weiss wrote:
> Document various bits of the Milos SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the Milos SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other Milos patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW this looks good.. where are we with regards to the dependencies?

Are we waiting for anything else than the PMIV0104 (as part of glymur/
kaanapali)?

Konrad

