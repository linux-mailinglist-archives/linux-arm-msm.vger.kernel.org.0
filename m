Return-Path: <linux-arm-msm+bounces-47584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52DA30CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AFCB3A7D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5132206BB;
	Tue, 11 Feb 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ4lQdem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49A1F891C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280118; cv=none; b=nJz4VLUC3fyc5qy2lKCrTr3uvgO7OTivpCqaq62wbExvR4GjAY3//h2R2Ym6MtrGTHIzXuiD3Ij8ocpKLPRRH5/+gkg+HGIS66zBwKBDk1PweRgjmCguLL3MEY1lfk1pAu0IMQGG/EtBJKWem5OjHdWPbNEhGYGzDv3b6tmrMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280118; c=relaxed/simple;
	bh=7EBzLd/MkkAQO/2gIs3RgMZYWCN0hifel1hX00qZrX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtKgSPThSAoWS70YkVIiEHvGizo0NgU9rXSYT019D1WnKBq6b8+MwsQfpiWJ8UM7NO6U3y9Blun/CL0KtRKL7xWQYqAxlLuL6p/+Pa/+6zMFr9wDNROpXLBCdCWGAVcYDY+NLIuqpoy1e/VAGGa3VUIxn6+VPkT8MH+RELZtmBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ4lQdem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BALsI2012905
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxaAP2OfJQcefUPkd/AkugD6llbStw6Nvz+c51lPgbo=; b=TQ4lQdemhNvxlgq2
	XeHBvjp7cWkPU71K165PmuaP/MupUpjICDswGQAaxophv32VBKQQm/wMs1zW7J4g
	nLsNkkz8dXrA59l+2KM6w4/BYqafJkqh9PRzP5mjqc8INvndb9ytXWBrAP2GBRie
	DQ1yTqAezUDA4h1zCqpeu6Tg38dtKxNu7B/CekTAMb5pDg2vM9eTz7fy9Ok5tdnl
	ljgJDciZLsuCB6+daXRR9M8iUpc2P29t8e+SXdJHDh0Ngi7Z1sWFEhlPCz6tjS65
	5NeTt8A56w6OflbCArJPCQWpVjmFnneAaRnA8t+EOaUWyXNrZzru3g879zgRg6cw
	yWkksw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyqva5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:21:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c057ea5dedso28798685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280113; x=1739884913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxaAP2OfJQcefUPkd/AkugD6llbStw6Nvz+c51lPgbo=;
        b=FoLhxJdLF83G/8RyICRRm+SgcRHhb1JdBFC+QbHuqpMQIGJ+1CTiuyq2gOdIurTk5D
         wN91ErWGplj4GdsXQL/q77ZcQhPIUNQoes+DvQmDG9+byIyEzLu4245Rnt9TPj3sxR2t
         lCWVyExzNIQotV+uQvsOYiihiVgA8ECjI93PDQs6U0CwmY0QtM8VkaDnJzkaGWQZ+8bZ
         AP2Z30ZvtL4C2jS7QMb1VcLce4G5JwERS3XA5DYBC0BbhlMg2AOrHOUAv+igprIt6EdF
         F8wXRYdPyAvEbemrKVwnM61g3wQY92+ndILMwnpU+CF30l2dMp6XtsBzJ6VQal1y2Uvg
         sP2g==
X-Forwarded-Encrypted: i=1; AJvYcCWFLsL6TBGG1TR20X2b6Aj1j0vyOTAgNByfjFODEgvM0JhljSXOJLb76Co3EX1hAuhGM/39FSER6z5rPBQ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8qRLm2b4jHkt9laQPEOwzUvSl/4EiUit3Pm87PZjm+Bxet1et
	0Dn9FT03TEt3gw8Ip2wRq16qPFPbEULjwxZLDzUD63f/rJJoisLAtfGqN9p2ke/OktVZhtmcaAd
	wQdG1J/8WyJJAWbVwIkzmc1n2y/ilDw+Ck57PXnaTmmIonUBuC1glg29NQcAws/Lf
X-Gm-Gg: ASbGnctLGbDSUdQc38gpmfLtgqDHVRnVE/J3EwbKKJmJuI6IS7Ts1jxqv6v6Fimid/f
	jtdvfi3g+PbCpaoxO47f5HwNBypfdrA9q/RWrpAHq4Sp06F8gBeY80GztKoDCyHgBgcfOlVeWDB
	n5w9ZrqIzkoChy5ZoPkdJUaqw11lALu0TVsvQP84bF1flxGr0Wruabqx/MR9M4Kyp/SX6zgT/lv
	wmTU54FQjaaIlcaA9DP1Xv1RbzYiZ/5E15QtWoybqoraAFhRz2h6Qv0v5c+53bowWnhvGsJ1jjQ
	4txihNX/qn+hEs5bpoEOMQOhHJPDG5ZxZ1dqx5YOVEQZ1/GL/l9j/bPHlzw=
X-Received: by 2002:a05:620a:1a28:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7c069cf37c0mr143516585a.5.1739280113513;
        Tue, 11 Feb 2025 05:21:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0dqsw15wKwS/BY+L64XWNIZkK61jXi1TTzfL+uXdnejS6AhoibNvrqpmqVJiiO/CfpHiYiw==
X-Received: by 2002:a05:620a:1a28:b0:7b6:c3ad:6cc4 with SMTP id af79cd13be357-7c069cf37c0mr143514985a.5.1739280113155;
        Tue, 11 Feb 2025 05:21:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7adc4sm9578260a12.19.2025.02.11.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:21:51 -0800 (PST)
Message-ID: <59592224-7e99-4eba-b41d-7bfa6b1695cb@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:21:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750: Add ICE nodes
To: Melody Olvera <quic_molvera@quicinc.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
 <20250113-sm8750_crypto_master-v1-6-d8e265729848@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_crypto_master-v1-6-d8e265729848@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sfUbF1Wrbgfs99MFMOX_PhtAzU6hezEM
X-Proofpoint-GUID: sfUbF1Wrbgfs99MFMOX_PhtAzU6hezEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=761
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110088

On 13.01.2025 10:16 PM, Melody Olvera wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> Add the SM8750 nodes for the UFS Inline Crypto Engine (ICE).
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

