Return-Path: <linux-arm-msm+bounces-42826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD49F83A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85DB81677E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E838A1A704B;
	Thu, 19 Dec 2024 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFfzvbQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7B1A0BDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634699; cv=none; b=GHESBtDTd3BbUJKBdgbmzdWxpKStbl1vn9MF0xDZjdg6pao29ScnS+DX+khayxdN8/A9Fc3Zfxpcx52mtPy2nWikdgPZuM0i52gAoZGK07z2jz7bMZLU2BuzzF/lMZW3IYqerSqGfj4TbPcI+iC24kwLIeGcwk3x4xHca9YC3P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634699; c=relaxed/simple;
	bh=MPWr2Z7ey3vbhnCxtxv2xQfKisW+w8pgFcKZdciZjIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5p2HQAWRhgvtGhmT6iQgWi4mmsk2nDWg8hk44cBiKP728TxvlWlBo6gvYarzMFMfxDNre0RBOYflM/xQMGEbL1wvsq/vv8WHZPXtG/KZSSDxqfoB40PQvCp0bJmXHXCUUjaTbXLHwl2RJyl8XwHRcADPGc/ZMb5SFQ4w39XfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFfzvbQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGIiaI005375
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnwaAAbp5WbgCRxu3ABznDVWvx/2hJf/4w2Zf38ljkM=; b=lFfzvbQk2az0n9Vl
	eetQHIFVqfC3AAb2+cVYNNCb7gnoES3d2WqNFhpZOrvMDGTInKydGvUd/0Xxf5zy
	umjv7dtOCRMTQ9SUTo6WiI5ZpQQVwJyyvlh9alVRcfBhpcqKo3eFSkLyG5+W2nx9
	/oh8RHOH/rmxGH/8eNefPtQjp6jyNuwBExClPFTHK2L7g10orKg596qLb/W6YXwA
	0IhLvmuOS3kFzinWNIWLvxojLzL/PSxEIBySc/4/+vJt81YgsGM0nB96SBGNcAWa
	bdA4KuMtKjjUWPoNmiCJt9lk1PEzyriPLNcrkMaRyJYRnpQ/9xinVUH3Er7+2iXl
	r/DdPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpw60d67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f85325c3so12653885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 10:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634695; x=1735239495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnwaAAbp5WbgCRxu3ABznDVWvx/2hJf/4w2Zf38ljkM=;
        b=f9lWip8G03PFfDsNDWI4XjYwPvFwlsaUzATusezq4M/c3f1HRczSq11TRw0vChTaXT
         Q5bByFvTLHfU0gUK3Pm4PudxU1ZGcYT6ca3tm/zaK+rBzO9sGmhbyAG9SZhq95hXWVpt
         mjQ5eW8IH2h0jQyWOf9C1vmx9xqMzNT//AVisTiKwRJBcKLX8G9qK9edOlz6cXvEaq2a
         O94y4TJ/YFAvk5PRFdSap92eGR6MpmIb5edqtZQvg4KKKSc9or2pGveoRAZqPXiFS3lB
         f3Xl9t3fyzTF0hBHgRTXxVzSzkOKUm77Eesz8fjUmma52E1gBh6DwFPWM8IYz2TDE+sr
         tkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkomjajWXRMtIzBR9zD5bRE0xGbtYcssmXx475rhaGO4b9RmrAxm2lQOZ/LD2qPyjaQQrZyHobjn3z8Ic0@vger.kernel.org
X-Gm-Message-State: AOJu0YzV79vfup8x9fmbqouSmG2+rW3tEsMcCeK4DhtgLf2t3cAZPC1i
	OUOgAGP7DKAekWngAvkr3iAEdsUhYYI43hcpZWnqj7XaisC5KTXrdns5aiEZXha+Hjs4QnDUfHF
	Y/RE3i/pZJSmL8BMrEJSPUczrmER+URoy+p3iOFtMQqSrhZpU3OrOeNbHfAUo4nBB
X-Gm-Gg: ASbGncsFBQky8QlOv0Hmyquhp6rXP81M0A7YDUcs1VhUooDDACbrlulhjYkvRTN6n8a
	3jMbQaazxeh5Ez5WndYk2qGdYlv8lDmMw9Mulm3ssdDf1U9YzP88LqtyHnmDFiRc8Y8aasNNdmt
	zYKVfC0jPvS+iLLCPhoYW1ZxPoUMNhy6RXR28skA7ivaiEJHFNQyL6zHRUronR3g5ErE2jkDJ/J
	axP0irnioTVx508xL+aOY7nKL9ht6GWtmpJQutilFk2Wo1ghHOd3UPZ1Rd2Us2YJIegxrZ5R1V7
	g41Mp/WXtkuRd+31JxGwvcdTDowYU8B547Y=
X-Received: by 2002:a05:620a:29c9:b0:7a9:bd93:ac0e with SMTP id af79cd13be357-7b863771076mr430391885a.8.1734634695440;
        Thu, 19 Dec 2024 10:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFACbbbKxDleouBwlZ5hWqfs4z3/CgYgVIR1O5svm4tTus+yvvTruFI6Haivp+pmwFJwPH9XQ==
X-Received: by 2002:a05:620a:29c9:b0:7a9:bd93:ac0e with SMTP id af79cd13be357-7b863771076mr430388585a.8.1734634694995;
        Thu, 19 Dec 2024 10:58:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f016aaasm92295266b.165.2024.12.19.10.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:58:14 -0800 (PST)
Message-ID: <b627dfb6-3d73-4ed1-8b4a-5ee6c5473c9c@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 19:58:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] pinctrl: qcom: correct the ngpios entry for
 QCS8300
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-4-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-4-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hQVYtr8LzA4qkq1ThanTotvXttdGukgo
X-Proofpoint-GUID: hQVYtr8LzA4qkq1ThanTotvXttdGukgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=872
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190150

On 19.12.2024 8:59 AM, Lijuan Gao wrote:
> Correct the ngpios entry to account for the UFS_RESET pin, which is
> expected to be wired to the reset pin of the primary UFS memory and is
> exported as GPIOs in addition to the real GPIOs, allowing the UFS driver
> to toggle it.
> 
> Fixes: 0c4cd2cc87c8 ("pinctrl: qcom: add the tlmm driver for QCS8300 platforms")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

