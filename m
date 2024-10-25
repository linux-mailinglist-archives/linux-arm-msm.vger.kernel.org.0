Return-Path: <linux-arm-msm+bounces-35935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B59B0CA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92770B2116E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5609818C915;
	Fri, 25 Oct 2024 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCzYG8l8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CEA189F50
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879567; cv=none; b=DOWHhpuflA6bWDNblpPtHP9w5sWMI6yQBQGSz0SCFkAXlJqv50Qc1rLPjP7cejzyds+g8lMe0mOiGikyooor1Acdm0dwpQOQNsxehBto+p1WDwVImCp0G0bRSbKBs4SUjYJ706a5bdLfo7xzmII/t2ywrSLrda+FbV2imUud68A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879567; c=relaxed/simple;
	bh=mz+P1tAK2p3uTct0yT1WY3q8nvQegJKjKEEGXEXA08w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyR9wlERRrvjvFsTZZ5tfjQGf54XwIfPiqMlPCZ0pVs0/O/BcbwX97kXYdHnkNvtViVcIqiXRKze/Vpf6WNu2Of9nCfQbApAwlwWMp5RujXUbgQ1RLtNdL/wTq6xdVkgpGH7l9myWM1sYW2wqJrRd6nR5YD3Wi1/TF+4OlKG3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCzYG8l8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBjto0009312
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UinYnpz0bX3TlxY76tXTI2GPpiqAiG3gmDFk9qESCJE=; b=cCzYG8l8NTJt3y0x
	9tawGkHjNOoKCFVPiD2beO5sEhFkohnuytTrDFio3OVN9e1LeZ3zB1mD3FsYgoRm
	VKUj/hn7vVaWb1wxlzTnoF2h66Xnr4o9gGAuwVfm5GvXwR5FZLNaI9YhuPPBtWfg
	tVTK+hB/WFYmU6MGTm2RyRH/pfLtYGRYaoBA4ct6CsVBwhB8D2XUAzv7RhzNBLU3
	pmHBjS8Fxvp2npuC2qlxQbp/BotAcZ1RNGBFMBrSRi+5UI373XNCE9sTQ5iHZ1mO
	73YSxW8uV1KCt1VsZ0twilmiwEOfAnMhVFthwQBxbP9XwH9FDLJbQyFllP00aBrQ
	n9aeWw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43j1c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:06:03 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5eb87df274dso189142eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879562; x=1730484362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UinYnpz0bX3TlxY76tXTI2GPpiqAiG3gmDFk9qESCJE=;
        b=KiDlLJq/huKIPdpQUY0/FZzEOqxolda3RGQORT9eTKo0vBswK1B7x1oxYvbhOlCLx9
         FQbTSO/5YgLwlpmPDe+b6eRKjfmDIge88xxD6V2xdEYlFQKDwuVgEhXbQ554Tl7SYhmw
         FEx3uDrvjTKH6UOh/UXPYRxw439q37cWWZ/4IlA6qNhjrDcDKxo+wiouzHIhynLzIVFH
         1FES2MQH7IUGKGAm6EeC+dlMrUwjIfPCzgByXy/HvPMIQdmiPKJcYbK1AbBRi+okL93K
         NbZ305grYx6DQfCOXfDGUUU8gf2qvEeb7PCwhVoTXI9sjY1C4dtrtkvdK8qWigqgmezE
         /yew==
X-Gm-Message-State: AOJu0YyazFK0OHdza5ij9SP243Gp/DlIT47QPzm0UQ3KJ5tey/hdl7iF
	4b0TsA2lc5e44scVT2hfsjV1IfKtomW55vT2DAUmQNfAcZSYWK40VOd3WylVBjJvGZf2yYeSn/m
	NmnW3WQiuoMV/GSFHl7oDaFiyu5aOW6P9Htd6DYokRf70mJIQt/tsvj0kwysS2RHm
X-Received: by 2002:a05:6870:b6a8:b0:288:8fc5:aecc with SMTP id 586e51a60fabf-29051f750a6mr60775fac.14.1729879562332;
        Fri, 25 Oct 2024 11:06:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4teqjn8eyv8j8nwoj+93RybLf/p9NG1WxVNggZ5/zlR1h9G8K8OnVanPksxEpinKNN9zbxw==
X-Received: by 2002:a05:6870:b6a8:b0:288:8fc5:aecc with SMTP id 586e51a60fabf-29051f750a6mr60770fac.14.1729879561994;
        Fri, 25 Oct 2024 11:06:01 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6347f20sm832942a12.86.2024.10.25.11.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:06:00 -0700 (PDT)
Message-ID: <cf6a67a0-29b2-4a31-99cb-4b8bf583219d@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: llcc: add support for SAR2130P and
 SAR1130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241025-sar2130p-llcc-v2-0-7455dc40e952@linaro.org>
 <20241025-sar2130p-llcc-v2-2-7455dc40e952@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025-sar2130p-llcc-v2-2-7455dc40e952@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: om4C-HJ1HVZIJjsggbwtcTwqZw6eWT3d
X-Proofpoint-ORIG-GUID: om4C-HJ1HVZIJjsggbwtcTwqZw6eWT3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=853 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250138

On 25.10.2024 5:22 PM, Dmitry Baryshkov wrote:
> Implement necessary support for the LLCC control on the SAR1130P and
> SAR2130P platforms. These two platforms use different ATTR1_MAX_CAP
> shift and also require manual override for num_banks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I'm not going to verify each and every value, but this generally
looks good

[...]

> +		.max_cap_shift	= 0x0e,

This should be a decimal 14 (as it's denoting the bit position)

Konrad



