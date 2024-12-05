Return-Path: <linux-arm-msm+bounces-40580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A69E5C06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFFB428F994
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA06E226EC8;
	Thu,  5 Dec 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmadT7w0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36859221473
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417119; cv=none; b=GfstwYOutpjXYOpRT/CcTM0v1YuHxNxjZZwuLS5Hf+qmun8eQvjz8qY1MPswNCXFZQQdqPblQ5DJ+iDtgYwWIW63e5sx395Aq9lPLcbgezRg2k8IkHZDKN3ejpyaZk0WZBYsEdlyEv8+5e/+FFk4VDawvzo2F5tHHN2uPmPoPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417119; c=relaxed/simple;
	bh=zGxUDR6c4ZU+Y5Se8IU+zzOYqXF4mfTOL3cNhJL7c5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caQqpC9Lr+8uI40DB8hKtFkqtY3cC228wpEfh4yTQb0hFRpziWy9rdshsz5XRqi/qDwOzJpgbdGtGHZ2mlE+6BlK+579EbAnJ8maOuTssPc+eUHMX1mEOpxs+rUWSzfqu1ijb1iOy8S+BgecpSpI+AKdGNDfQZ8DwQM/QLNeOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmadT7w0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5BoZmU029227
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6x0KHCQDiAykCeDoL6SPhnPeHMpJmBzuR92rcSSHCE=; b=MmadT7w0t4FI82xy
	/QDeA8tEaN4ILLY5OyZZ9btHhflbxwFDE/wj5RAIHom883jTYjujOJiZdG9Fl6Ux
	mFlCxztrCxUvSWwSKs6l421UBlr4U7LjQeYzCEoS0XdhJUy1NGIBwXH2u3hW36Tj
	x/vol0xl2GJEmgpORubvQwpbCmw+7qtJFOao4JJlbLR1VUPArGt3tmGrOUIWoMQH
	hDYL9GPChX9QVtVaHnmeDY1TeeFDyGrJHsjULT+XtkF44tdLkEGgQcNzP7VGM228
	ZcWhznX2WNYGcMLvRXQWcTeCYZ3lXPHOkMHvwsb3tB2TWUYi0Hzey9pXO7NWm8Jq
	O1fdEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj0tuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:45:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d880eea0a1so2956086d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417116; x=1734021916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6x0KHCQDiAykCeDoL6SPhnPeHMpJmBzuR92rcSSHCE=;
        b=uHR4b0DtInqSY1h8eE/ZN8pj44Ims7H6Dv+VdUfHsJtaXM0i7hQMjedwSQuGCbjRKH
         u42KjU7IoAwYuE/AVzVJQZEXGQd/2fXBscW1pc4j6Z3PBMWVCPjsdzLU0bGG/8vESK6D
         Qo5SAlRfmhcKup3XJu2quFq9427oaMLSz6MI9WFQ5gviX9fjSeYcDTSgMJovHmqtDrHg
         rA8N65ZcNsSbr6X2Npxo78E7gxojzWjGlWH/JIRfLuxT465dWkvtN7MzLQtWDePzcMUr
         cp1xW/RqeWzBILQlmczVQp/+AwW2biUQUDdr/k1QFrpMqIgsUR9sJ7YCKEJa8Gn9NJbb
         QtVQ==
X-Gm-Message-State: AOJu0YxPermmkbtw5ps7rObvfsz/dccv1zWcZK2zwpki+tsNLXp8GKmf
	qxzLQCmik5QoPCnTSzGLuiOb/kGNcQSZq7T3ylXh7CGOhr9qdHicaiQfBvqhOikmyn5srhSFQcM
	k+rHM1re3IIn513sxGBUsDgrYt5Dz/6VR7Apl3fs+dPk670tcsJUfUW09WVwOrPxa
X-Gm-Gg: ASbGncvjwJQD3KkAUDQsz9DinMRyU67I3kxIq2rb7HExvbqVmmPyS+yU6Fgq31oNEKb
	Od2gTbO4cOqLsiD4ygsWoYaomeMVT8Q66YrU05ArOf/+8dbcQhAF/x6nrVU0q0YrgKyM9wXtCGP
	gbft4jtpxe8h8tee8QcAEvMmF77S7IkSznEAjiFx0re/6m2Qpib9YAjlIHj5SZ2jWvTzYOdlzKh
	tRsVrzLHVggwwlgS32Kc6Vlyv5NdYnBuHUaopBLNoXZqPa+Y8PAtUj8lK+SgOxBqxGGjsmEyhmH
	ezngs/zALkA8CuQ4ENdeu2IWLvsM7VU=
X-Received: by 2002:a05:6214:2627:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6d8b73a489cmr65325316d6.7.1733417116174;
        Thu, 05 Dec 2024 08:45:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMc4CkwAoyme+72kcypxiH9g4yohl2nQ8tC0nVxXgfCDWMGWk+Bw8wSqwheuFgPrHSioLgfA==
X-Received: by 2002:a05:6214:2627:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6d8b73a489cmr65325086d6.7.1733417115832;
        Thu, 05 Dec 2024 08:45:15 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b5d2sm115958266b.93.2024.12.05.08.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:45:15 -0800 (PST)
Message-ID: <b9225284-7830-4aa4-aed2-7f58fb7320e8@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:45:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: Add board dts files for SM8750
 MTP and QRD
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-6-4d5a8269950b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-6-4d5a8269950b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mgA-PUvsbUgKlSc4uwTfuHMp7nj8DCJs
X-Proofpoint-ORIG-GUID: mgA-PUvsbUgKlSc4uwTfuHMp7nj8DCJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=830 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050121

On 5.12.2024 12:18 AM, Melody Olvera wrote:
> Add MTP and QRD dts files for SM8750 describing board clocks, regulators,
> gpio keys, etc.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> +&tlmm {
> +	/* reserved for secure world */
> +	gpio-reserved-ranges = <36 4>, <74 1>;
> +};

Any chance you could describe what those specifically are?

Konrad

