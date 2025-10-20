Return-Path: <linux-arm-msm+bounces-78024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A657BF1D9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D453AD1A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571F51DF269;
	Mon, 20 Oct 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlqvTeos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8E1CEAB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970681; cv=none; b=ZfgA6B7F219u4iJz20BA3zi3VrxRbE+1oPcnLiAuAMSPhAbrwaAUZYVCEsPpqapOdFe6mxEds4jLdD7EPnM3xOohRyPMm2wBcyRIbDFRxUXiXFOcZ7rjqVHnpH+V26lWM8wadM7W0Ry15ZbMlguuBxg0cCG9hBKZMzRjOJM/ou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970681; c=relaxed/simple;
	bh=AWZ5JEQErQEgkIxsRTfnsV0dbvBu3BBNbNNvaGHfU1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ak4z/MApPyRytxhFg32w7UPD0UEHCiFWbjj+8HmCM54maz2k2Kq+XaXgnrQrmP10eYRuWO6dDnr9CgZLIjk71Prub0ARkIi0BiSQXB9/pDRY8wWgzG9rB2SxzoqECNkJNv1xO/qEJqATAXFZLWm0YfW6DTGwNA2vent+KUoVmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlqvTeos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBu5A9016831
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WDwzWmcq4AKDGdpNvyveTUSafU4v7snQckB7LNYwDV0=; b=SlqvTeosTjNrJ8Eb
	sO4+qHexPJuy7bWwTF+Ezj/j9GZBx+dQ1f6a0pBbXo/5d7D5JbgcePTZ3iMUJnc7
	44cOs4QlAuJx2EFC8s0D3pwXt/cgbZffLJ3h+yL40mn2OCUOoBcy7gcuqr1P+8Ck
	S8g9juUcJoUjaoanE6I+bUt8x4sbEtUoPjJe1NW/sQehaVJTATCjxWmpY2Tm7eXs
	PYCj7ZWIMRJGW1KmLCR64VSm+NYR8L7K91Po4vrao/Zu2BNyZLDKc6alu5yjnCup
	C2UqdSFVLLoAVp94yhTIS0TSw3D4aWeRrV5dsjWIV0sQjWlMQFIWl1WKu/JWvKlC
	D2D/PQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k4xcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:31:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1f435b6bso70517936d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970677; x=1761575477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDwzWmcq4AKDGdpNvyveTUSafU4v7snQckB7LNYwDV0=;
        b=l/xlhkflfN8thQ/GUSxzTEz8QdxZdGgdO45LXSotgywurc/EUi0wyf4W/rnrX2t819
         2PHWtlLRDEdrE+dcwFhp6udPCgJJ06qcdWhJqXFwA0JgaNKx8uIut/+o0Ls7luV5ELQi
         kqqAlqqIlCoYKenB/D8C/iYOBAcqGkU9dvYxIGSSrG1qdUbf/NOaKw1R60IFT+egq0Gt
         puxOZ9RObactuDCwAEmtpmBhprBSjTmUyJIUdSiGOCEuKotLVws7PrHbi6BtGGWsZt3G
         483mVHkbSPWbFWl4tiFSKpQxWGsfhX4HoQe7S7SkVUkZ++jeriOjScAGNIhnG/R66Fwi
         JVfg==
X-Forwarded-Encrypted: i=1; AJvYcCXeo8Lyws0CqnN5pVX572q2UJpXumbmI2FpmvCmSc99ciq8aXxIQiqw/LcDvEn0QSgAwgoxiHnpavWjgO8m@vger.kernel.org
X-Gm-Message-State: AOJu0YwAKAAUx0H2eWtW8+b7EIiQjNtcv9oCvhlOcHuAvZk+A2KNvnLN
	CXhfZnmJwr5numWK+vV/oZOw9ZQ0kBwqYZGcm4l7IwAvC0cVu9/YqgvGkoU2YymXlsLhZepNz8P
	GQhjOTFyYVG8ye+eU/Jf7zjNE6TuRIlAYkZN2QefgHENeM3sGTTLTNX6fD3azB8+E7pJg
X-Gm-Gg: ASbGnculVuVUlxQ1V1b3of71MKDzodheDrp1Q12Pno+lRrupDN0p6Il8AWVnnvaoXao
	UxTjrpnQv8sYCmLBtScXxuhcX7bt5K/tiAZHTFYYYqUHAcp2qAypkaqvm4O8wikjtfoQgkScEqh
	hAIjQRhh36+9KxCabt/rzw0hR4wlhHb4gEorEbTSvKuRVEZgAeL5m+4eRZGTDfoucOTO/lRbS6b
	SSK27ErVMuZzaHpMU5hYx0Z+5z7OHimkhooGpdo0MfrR8qLVbkUL61ujqMlZoFLr+wPNNCEDUrA
	mgKGhvX2R2l3r7TUkM52n7T1f+2c1/cFK6780QXQq6z2IiBRD9AW+82pGo9Pcq53aH2CcEW5OWn
	/NmOrA+T7dTxzgbnLJsxgTUYvUg==
X-Received: by 2002:a05:622a:110e:b0:4e8:a9a2:4d50 with SMTP id d75a77b69052e-4e8a9a25039mr160564901cf.41.1760970677226;
        Mon, 20 Oct 2025 07:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEos+8Az1kXkegLkZkoK78dfEsCGhaPacnWf31fm6ldL4T9xO4u7snVWYRJLwJrJQGi8f6MRg==
X-Received: by 2002:a05:622a:110e:b0:4e8:a9a2:4d50 with SMTP id d75a77b69052e-4e8a9a25039mr160564271cf.41.1760970676602;
        Mon, 20 Oct 2025 07:31:16 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-471553f8a3asm171487535e9.16.2025.10.20.07.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:31:16 -0700 (PDT)
Message-ID: <4f394672-c7dc-4fdc-b70a-27fa8e20dd74@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:31:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: sdw: fix memory leak for
 sdw_stream_runtime
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stable@vger.kernel.org
References: <20251020131208.22734-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251020131208.22734-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251020131208.22734-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E-XDpBo4TCymBlpQQSKBzt8Re06-b0us
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXwKLQnARLUXRb
 6jPwv+dmQCnfukkFp4kRjUavzvfheYzQPjjtyXSHPcidgWVYtDnX2R4cXLSx7l/YLFKCnG1MrqD
 5ArCnjWkqAR2Lvpgmaze1Dr8EkhuJ9m35A+4+5gF5E+IsPpbXR/5jfQYZ22doNpXjd5Ia0V5W/i
 v/7c0cQnsKC0Fbnu4DEqw4Bf9kuu/1vHrA2xyvtXdk4nH51lgDjffZro9yJqZPjbCsykXbXGxVt
 af0IaVQgNOqkM26TbqmDfTF4hWJsAuUdI0kelZqJRGofWK1PwJi0o7mrsEor5Nt7YjYnSSt1QrV
 VcDF75zKOQSnF8gRrPA7j3GoQJ5pq3g78sJgpAn2Va45Th+rXzmBcaV17XnFDbHJKLw1T5gFq52
 Y0WEhhDptgbd6OVcY/b1LMuyuNqlCw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f647b6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-57JWHKmnLzaxYqXpKAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: E-XDpBo4TCymBlpQQSKBzt8Re06-b0us
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031



On 10/20/25 2:12 PM, Srinivas Kandagatla wrote:
> {
> + switch (id) {
> + case WSA_CODEC_DMA_RX_0:
> + case WSA_CODEC_DMA_TX_0:
> + case WSA_CODEC_DMA_RX_1:
> + case WSA_CODEC_DMA_TX_1:
> + case WSA_CODEC_DMA_TX_2:
> + case RX_CODEC_DMA_RX_0:
> + case TX_CODEC_DMA_TX_0:
> + case RX_CODEC_DMA_RX_1:
> + case TX_CODEC_DMA_TX_1:
> + case RX_CODEC_DMA_RX_2:
> + case TX_CODEC_DMA_TX_2:
> + case RX_CODEC_DMA_RX_3:
> + case TX_CODEC_DMA_TX_3:
> + case RX_CODEC_DMA_RX_4:
> + case TX_CODEC_DMA_TX_4:
> + case RX_CODEC_DMA_RX_5:
> + case TX_CODEC_DMA_TX_5:
> + case RX_CODEC_DMA_RX_6:
> + case RX_CODEC_DMA_RX_7:

Looks like we need one more entry here for RB3.
      case SLIMBUS_0_RX...SLIMBUS_6_TX:

Hmm RB3 also has memory leaks for very long time, good that this list is
able to clean up some of that inconsistent handling of dai ids for
soundwire stream.

--srini

> + return true;
> + default:
> + break;
> + }
> +
> + return false;
> +}


