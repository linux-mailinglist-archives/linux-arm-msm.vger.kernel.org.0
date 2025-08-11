Return-Path: <linux-arm-msm+bounces-68359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF40B20797
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E440F3AFFD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EDF2D29D1;
	Mon, 11 Aug 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRje3tkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C42D238F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911589; cv=none; b=ZwBbTHA5jz6iNawNoQQ3BcvavKBjk5xzOnk6YPhj7RjGMud5Wu6/+X1OyK/vb5GJBpnPpdIX3I/bffNZof2iJT6IFvpUqPNLuDP9KI2PiTbe5liCWT+aA2nM4xSfrZ7yeUWiqhyq4NIff3KTNmjwp5H06QbmW4oc3/QtD8vOTfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911589; c=relaxed/simple;
	bh=eS4rihNg41CqQLMmI9woJNOTxbkZM5b3UZpiF2Tt2MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNUhXOTAdQbG5qz6Ef0Nc3bpmAezTXqiBE1f06DLJZygnCG9Yzej+9dDF8z8916a2WpVEBki1rnd/kxFfhDAXJARW9IzEtJgmLr1bxS9k/pLKeVL3ln4RsJIdKzSAyMEbJb4k5dpFt8udjb6pdqrCJe7d7z0OKWXI93fa6oBIuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRje3tkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dIFf005393
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jHNg0B9zA4M2W5qF7j5jLgoieY0vFIuRYMc68TZ4yU=; b=jRje3tkflwZVfifI
	wjIOsh+89MdA4lSahPDOEQQb3BAXSvjMr9C8pQmqbrdTYbJWszsfJEEKpIhMW/cc
	A0GUBASh98xrXokDD7oXeHU2oK3AYEnvFbvSb1M1tChjAsg884N58IA1F2n/L+O7
	xIoF7SDczevL7E4jKjX+0MgzCTGlgnzd9KbDynbRU+198/9KhKIeI2BqhZgB8nQM
	n0giHrYXMWRXpUZxsIqpzzSJUAIy43LzEBF2x4IzjtzY9gSUIrctJGccrH/srylz
	WMGRVqBpCph+0MFEdUksOISaZzyHqAdXiSJauiPpkmow/o0W6/gTOdv97bnbEgtp
	ZISG4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx2e21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:26:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b071271e3eso10909041cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911585; x=1755516385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jHNg0B9zA4M2W5qF7j5jLgoieY0vFIuRYMc68TZ4yU=;
        b=RXJXr96i3V0tBoQPrGyYihDCzedD8iJYBSrvmLheYP1CopJ7ydV1kH1hq0AVYGLCTW
         +F8+SLT6x7S1ioTpNC/0mv73UsCoAF4Y/tYV5V7d6ImT5LRPl4K/QpSyBYm4p27MTou4
         difKyY3Hyxx02nxQ9YOIzunivqE/ZBLhxqngZENqJ7Ca+VomNL7hWARl+Myt379Fmn4X
         5Tq9vcE3eBYhrBXAT4KcgF22JCOE/Bez+LHxAMIxDfqE7bY3tQjdOyQE6Bpe+8lOA0Tg
         jt5v7mjnwcWdGu8eFjhN36VuJvt51RpRc/t7IxjTNRWuf9qClmAZAMKZmfkEds/1tDqc
         HItg==
X-Forwarded-Encrypted: i=1; AJvYcCUdQ6u5gfMz5uYoF2DaDq50ekx7L9MiEbVZhtcAW87mHlAAMddXLpm8ebDtjraEvmfJzlMFQAsvAKSJlMPA@vger.kernel.org
X-Gm-Message-State: AOJu0YwCI+/N6YqHGFvuGoybVF/6ZBTGdgwAb/QWDgCny9AX+uyYvkNg
	0cAasUh4Kfg8aC1R5ICXVr0X/O3MiDYUwoIMX45YwceatJ4eMU95si4Rnb/FJXUfeZul3ZMaO/8
	KzZ0ECDd6QVIfljUszIVR2aHdR83jwwwVRitCwS13V/o9cUMJ0bq1H05N+ScvvjkCtv/o
X-Gm-Gg: ASbGnctkaZ2+GX8bFRUeE23iPVUuen0e29HMgg1z0k/y6vn4VYEOOR65keg3sbJaPhh
	ihKCfOBjS7q/wngTpkrgpX9968Q+mR7UioHNDPeBkgsD2FkduoZ+cCQaMSYxxEqDVO9wRNG38J1
	2pCYOW5R3mPiK4mM1ICh+rY6vLE8k1po79CR43zTb5dnBlR0PpnFddMmu+1uN50GdLnNuKzaXpr
	3vwNuNBKwvrcad3eUGPHvHv74A6WarbEuGj54xakZNouskmD0BUCMcYsmcXhndB58N4FCltgz96
	OWrWLqkna/aLMYrJ75ce62h5FfqeAZ/Fj/9nu7+b3lzEmhw12AuO5J7dZrl7A4Fl64wNTc1+K1p
	AWatV7f6exDF58RTeiw==
X-Received: by 2002:a05:622a:52:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0bed54be4mr48750401cf.12.1754911585060;
        Mon, 11 Aug 2025 04:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdfPZCXPS0OYVaxZhGB2BQD/z043PUiTBUFlrOndzcMXZnRLOEaHOLYJWbIeIJ97eftPoMYQ==
X-Received: by 2002:a05:622a:52:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0bed54be4mr48750211cf.12.1754911584665;
        Mon, 11 Aug 2025 04:26:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21e44csm1987238866b.113.2025.08.11.04.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:24 -0700 (PDT)
Message-ID: <792a342e-0193-4180-b46a-4abc3a55db84@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: msm8953: Add CCI nodes
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX3fp6H02ahe0W
 YRN2zKFjOfh9VQN5VFo0nwV4pWMIamv2HBOHmRWavqN3uSvqzO8KUJr+Fx4+AfbL6S5HQrRraHX
 HaiLxqpuOJdEgSzSH/ype7xZt8rzR/XEXtcwxKaW503F/BDJvQBmGcgh/TWbvLJ4tsxLWC+5evy
 C8QqpZj4D3L6XahxdF6yWMsJbJaz3jrYyF1AX4z30EXzMoEKpvAyJfS9Ejw66Gu+BG5nGgf5Y7l
 cKZNkPWMx8dWWKBGErSd4gabtHHNSE2HcZWMfng1v/m4aIYxF2XDyzlmBfUn1PDqkhmLM7qHT+X
 3bE+0SHyi4qldUUv9KYw3R25CMMXsZXJcSbeG5amkOBIxmA8DSjuWr3JNBYU8irfkANZ7DYfMw0
 bEElXu7E
X-Proofpoint-GUID: ye84sypBa7gxQGCGY_FcRxhG94YM8p5w
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899d362 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=0h-2F_-C1axGQPG-8WYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: ye84sypBa7gxQGCGY_FcRxhG94YM8p5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Add the nodes for the camera I2C bus on the MSM8953 SoC.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

