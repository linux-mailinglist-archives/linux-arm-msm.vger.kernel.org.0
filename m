Return-Path: <linux-arm-msm+bounces-36914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC769BB2D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB50B20B66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCA61B3936;
	Mon,  4 Nov 2024 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpQkT8Fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0A1C07EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718298; cv=none; b=jSoxnQgHeuz4RTq0If1CgXlntjhrMbC27Gkos0h8oBLx4Humuv+XETzEGAlzG/LGKFvfcHj0yVH1TILtZOL/g7lbezhnd12tX71LYdxNXJzhcjCc9JEft3osU5nTa7EpcxP7x3SR2VluKurCbD0d0S4kO7Ofl2q8BZrvi19hfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718298; c=relaxed/simple;
	bh=I/5gETtrt/Fa6lNHOtIIaeymRRmnjg12Vu+wm7JzrjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rQsVKJ13heksR5I4ouPs8BVRJT/nv+JJuKuEew/CB4GAwO6ltmCQZDjCccpCyS9AQrAuL/sicJGIENZYwFbYUx53bL2LFi6qNQVVAt6L5DvKFiY2a4rcI9eCBDClRRUvox/swawnTEk1QWdQ2bpN/khy5Tf+8lZ95hXh/rJK5XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpQkT8Fu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3MUCHl029976
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 11:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdHc0ZoqFxF7Q7WwYQrv0H7Ct1qLbT5B+jGo58Bi22M=; b=JpQkT8FuM08hd2Z1
	bwZ+lJVnuPjaivne66PZt0TtBZc71Tr/xQQXCTIUpz6j9eCpDBZpNlTqlt8Fnwf0
	rNLI4zLnDL6HNMGvQoNxGL9Gcjbs2gOu+bPGYFRnNksLxCBYpSsSZIi1wEjTD+Np
	ZmtyeXweCEgN/+IlxLw3x7IPBMbPyuiUArU45OObEvb8psvTbfVfLMO+RCUC3jWg
	vAEvJ2TFBFQR1sw3DxxrLZvH4io52sEOc16qwN0umd782MGxX9D7bKamMovPmHmO
	buPrlwGqBU3sh3wONah9OJoxu3A+I+ld9jpcCsJCBQ+/BIX3TgoUw5rqHH/N2/0U
	0/Y2xg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxux4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 11:04:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cc290898adso13886876d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718295; x=1731323095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdHc0ZoqFxF7Q7WwYQrv0H7Ct1qLbT5B+jGo58Bi22M=;
        b=BKRUQsAz1NRzp/DO1RSM9nsWs03LvDPi32L7AVi5tm7Dudnte4pmz01QqAgkjzagV5
         CD3pP0dCBZwGDZw2BSI/TBAtMYhknvwwWkGZsr1vdXXbHlLDa63aykjof5bDYKYGXEjr
         +WcTwMjQmSy818+m8biKjjdZEkPBxEmtIFPcHyIXZUCdHgv/7vK3crC0PI7lPWaNcg2I
         ESpu7YdVPdbmgK8XD22cVHwh82PAMFKzjgDMeJx/ia7Dwu2yaV32anAth1Q/sgmEbyC4
         ZQEfR+Dvrf2DUs4Cf8D1NAJPxqvktxF4mNFQ50PEL/yPtlRXFG6pOYhtYg0/qhgCIu/2
         Ntow==
X-Forwarded-Encrypted: i=1; AJvYcCUtp2aCbpUU6HzVfJYhPaZTNobG5+HSnbQhuoqm6b6E/dwQtMn8D9e/VoLdN1I2xGlNFPo1v9P3Pm1WXx43@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtp887sawVTVSI1u07o6u2oeTGGGbzoRHHP7zdByaiuY4P+sBk
	GR1nmVwI2sNCrP+J1RlQBiQADS3xNMkSDpeZUIpM3eXIbaZ1Nt/05UnZaknzrDaDkzw2wcR2WUG
	fJTZOEaQnZA4pQEuAeHdmXMcQjneZ4L6Nrj/iQWwBOMZbv8HgTPoN2a3U3A4+dnvR
X-Received: by 2002:a05:620a:2482:b0:7af:cb6b:b506 with SMTP id af79cd13be357-7b193f4a13emr2059352985a.10.1730718295333;
        Mon, 04 Nov 2024 03:04:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3WjxlrjlA5DdSF1tEeCy2S2Uy34h5UvJJnk9BTjjQTrKgg86yDWD16c0o9LidKmu3KblEOA==
X-Received: by 2002:a05:620a:2482:b0:7af:cb6b:b506 with SMTP id af79cd13be357-7b193f4a13emr2059351585a.10.1730718294912;
        Mon, 04 Nov 2024 03:04:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56645ecesm544377366b.178.2024.11.04.03.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:04:54 -0800 (PST)
Message-ID: <b69a8d94-6607-4345-ad9e-16ffd5dc119b@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 12:04:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
 <20241104073840.3686674-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241104073840.3686674-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 343iVz7HgRIxl0yCHOgzCudmdR58ixMh
X-Proofpoint-GUID: 343iVz7HgRIxl0yCHOgzCudmdR58ixMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040097

On 4.11.2024 8:38 AM, Varadarajan Narayanan wrote:
> The 'broadcast' register space is present only in chipsets that
> have multiple instances of LLCC IP. Since IPQ5424 has only one
> instance, both the LLCC and LLCC_BROADCAST points to the same
> register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +static const struct llcc_slice_config ipq5424_data[] =  {
> +	{
> +		.usecase_id = LLCC_CPUSS,
> +		.slice_id = 1,
> +		.max_cap = 768,
> +		.priority = 1,
> +		.bonus_ways = 0xFFFF,
> +		.retain_on_pc = 1,
> +		.activate_on_init = 1,
> +		.write_scid_cacheable_en = 1,
> +		.stale_en = 1,
> +		.stale_cap_en = 1,
> +		.alloc_oneway_en = 1,
> +		.ovcap_en = 1,
> +		.ovcap_prio = 1,
> +		.vict_prio = 1,

Many of these are booleans, please use true/false values

[...]

>  
> -	drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
> -	if (IS_ERR(drv_data->bcast_regmap)) {
> -		ret = PTR_ERR(drv_data->bcast_regmap);
> -		goto err;
> +	if (num_banks == 1) {
> +		drv_data->bcast_regmap = regmap;
> +	} else {
> +		drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
> +		if (IS_ERR(drv_data->bcast_regmap)) {
> +			ret = PTR_ERR(drv_data->bcast_regmap);
> +			goto err;
> +		}
>  	}

This won't work. See for example

https://lore.kernel.org/linux-arm-msm/20241031-add_llcc_dts_node_for_qcs615-v2-1-205766a607ca@quicinc.com/

Which has both just one bank and llcc_broadcase_base.

You probably want to introduce a quirk like:

if (IS_ERR(drv_data->bcast_regmap)) {
	if (cfg->no_broadcast_register)
		bcast_regmap = drv_data->regmaps[0];
	else {
		ret = PTR_ERR(drv_data->bcast_regmap);
		goto err;
	}
}

Konrad

