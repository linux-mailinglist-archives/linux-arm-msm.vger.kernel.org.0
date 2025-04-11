Return-Path: <linux-arm-msm+bounces-54074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B782A8691A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5D41B8471A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 23:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6210E29DB60;
	Fri, 11 Apr 2025 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIxDHCjO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DAD29B238
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744413646; cv=none; b=M37KRr3Ah0TTvBA3zs8m61OQ9jcX2HIpJv9eSA5FphVK96TgzaMgw+okU2jYUNn/UVFVNDXHAkgx82P0y8AYv/3UVR4tpOkWNgFyuEJKM/+ieQU8g1KY78OjVKM3I1fSh0oIArY7xvNoCwwWN6ENftnZgCdLgpg+3LOYF+5mhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744413646; c=relaxed/simple;
	bh=ItVv9aECvS4v/j8NAaEYqjsxXiY/DwMuKLH03BU4TEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzr16IXtpR2NuQhQ4uHkSucx5zh+mYSHL6twNtc4NW6GLLBKmSPk2FO+zGlLIhk3ENYNuyYl2iD+5Ia0QQUqD7SKrkqXSft6fmxcn89yI433lv1/D6jBtMhzh+3n2w7N06sEhUsRcE7SqaKrlFLHzz2d5aS9ALRKf1Q2kaYx2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIxDHCjO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BGmLEl030632
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 23:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ynZ5lGPahO++H1E3LeYAHNYzJtD91JsU9K6PqBRu/8=; b=GIxDHCjOIQbX2CIA
	DxLe36WT9vyNNzSE0DqQK7L1dzfcgY5VQRdsA4Ab1uuBBujqoq8bO2d6BSbCL3ff
	JmAZrEYEL7P2pqagVDoqThzRVceMPWF06wQWiTgEiGxRBBUdD7FzL3FO8ZrQVQFD
	r9Ex9FHKotbZPjFfAc4GIsfda9u9OoYx8Q+8gYjwlHiH/IuGMuDx/kuM+ozCKrEF
	93wCNtjCGsGDKaJ5ndn6og76a2GC1X9ZVXoaJjWawxpiHshZSpvZwgMs38mq+zqx
	3nQscxhnHt6S3+GnE/hcH0MCQ1R9UnuFhWt44Rx/86YcU9HRaZ/x3dXSiuCLDBlV
	R1uXLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftumwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 23:20:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso64742585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 16:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744413642; x=1745018442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ynZ5lGPahO++H1E3LeYAHNYzJtD91JsU9K6PqBRu/8=;
        b=MkhWd4NmA+CS6rymZ1RLxLOZcapFek+a6L0bXZKD3+8RUv/3LKcDouRMV9RHwy3sBq
         VxnWFYJEuDZAI5DpEXUYqSSWvAErQBdDSbp9SzVS3cOTXDDrBtVvgM4jiR/xwNwaFE7g
         9hwj8UjTQZPcpKJS8IGKu0M5FcPi/uQh4uHmCMPyFM9FrkEBnR3uqxbk4SP9SCFtywOf
         hzjSDBp9T5/2CWXiaqkIsDdQJLCBYx5p+mRM3gi1JBqIUxo8t1UjKkKnWqfRctIx4mnY
         O5FL9DS3F5HAyxKW9qNsWYjWBmabHCqB55NrEY8FYVlw9kiWY3IaUv6SW6nhxQVfQySK
         vmOA==
X-Forwarded-Encrypted: i=1; AJvYcCUVO/LBaAP4Yq4dWXAs/YW9obm39n+x6NQL6+GrWdaPqtCvogCa1KXYrGNewuESWB+BjDedjRcnSsMdnE/F@vger.kernel.org
X-Gm-Message-State: AOJu0YzOumvk7fTrWw4tKjmL6MGbioMRkJtVJFHqn7NW3e5PnF5qPY3H
	bsZn1k3l+lopOwjNRvSzPtodQXiwPQvzG5LJOhIcOG0aNT6tOkycrLWqZeJb3PVzdw19RS95D+l
	lL/mTCOG64btox/V2SOxeK/0V6sEtVv9MwPSyuEnrfqu4k/8QTeC78GU5XGPxVays
X-Gm-Gg: ASbGncvTFCUjup9sOHVgfSu2ILPyo6dWv7Yr3kFXl9dObZnyauiciJ7yYsJo5IlHhml
	tgw+o0VNP7r/IF3uPjtcsUjmQcE98YyBc39/He96IfCYZF7bBPDH9qCJNyj9Mf4pnt5FDpkB191
	hQ7e4QjD0tPoGLnf/O3/yMHG+hChpbQp1lM0MvvSToTnIjpmzwTAVHFF2KLedHmKDVMtDTpDua6
	srC+za08kiSqR5BpkO9Cx4r5/EcTyxTC/cj4z6ZQds3URv+l97GpXaZQmdT9gbtBoPQixrsFJyy
	05m8mZs5gRb/hX9cPaBE25SDrc4L8TjRWNidSYHMwg2vkOatBLrv97YnhJXOOMBnUQ==
X-Received: by 2002:a05:620a:404d:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c7b1af6badmr181748985a.13.1744413642515;
        Fri, 11 Apr 2025 16:20:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErC3V5L5WaKtK5ntsNCBMz1sCeflCPCZiPX/TOLUhw62NWHCCe20rY0BgJeksBKJFfhu2ytw==
X-Received: by 2002:a05:620a:404d:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c7b1af6badmr181747385a.13.1744413641914;
        Fri, 11 Apr 2025 16:20:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9c1csm513064866b.58.2025.04.11.16.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:20:41 -0700 (PDT)
Message-ID: <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:20:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Qualcomm i3c controller driver support
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f9a3cc cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=XURAWvRzPrrx6AlyFGwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _J7p5trOGVFnV1AEI_WJP6ssncIBQlZi
X-Proofpoint-ORIG-GUID: _J7p5trOGVFnV1AEI_WJP6ssncIBQlZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110153

On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
> This patchset adds i3c controller support for the qualcomm's QUPV3 based 
> Serial engine (SE) hardware controller. 
> 
> The I3C SE(Serial Engine) controller implements I3C master functionality
> as defined in the MIPI Specifications for I3C, Version 1.0. 
> 
> This patchset was tested on Kailua SM8550 MTP device and data transfer
> has been tested in I3C SDR mode.
> 
> Features tested and supported :
>   Standard CCC commands.
>   I3C SDR mode private transfers in PIO mode.
>   I2C transfers in PIO mode.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ----
> Link to V3: https://lore.kernel.org/lkml/20250403134644.3935983-1-quic_msavaliy@quicinc.com/T/
> v3->v4:
>  - Dropped "clock-names" property from dt-bindings as suggested by krzysztof.
>  - Makefile: Correct order sequence for i3c-qcom-geni.c.
>  - Indentation corrected around print statement.
>  - geni_i3c_probe() : Exit with return 0 instead of ret for success.
>  - Added sparse annotations around i3c_geni_runtime_get_mutex_lock()/_unlock().

So this is the third time I got this revision in my inbox, previous were
<20250410084813.3594436-1-quic_msavaliy@quicinc.com> 10.04
<20250331164648.2321899-1-quic_msavaliy@quicinc.com> 31.03

b4 should be automatically upticking the revision counter, please don't mess
with it manually

Konrad



