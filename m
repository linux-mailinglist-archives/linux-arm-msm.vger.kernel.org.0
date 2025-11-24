Return-Path: <linux-arm-msm+bounces-83047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EFC802DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A593A1B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655DB21A444;
	Mon, 24 Nov 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYjOOBN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5lAdNdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DC2FCBF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983231; cv=none; b=Rwg1WILyXpHb+eUC1Iry9/kKb9ipHsDR72aB1FiHnRdIdE/GodDUy6oXL3CDScu56TjygPAcRbtWqzbCoKx1OXCbftF9yfdSsejL7MmGzmnz8jivTTgwkq09+g+0fn08hqanH8xss3i1dn8trs1/qygC5skJvA6xN0P38ra9O2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983231; c=relaxed/simple;
	bh=ryVs9I5M3l65+eAMSkFhEug5JYyljUURrwLgdtsuCQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lv8baedJOn7EwJWJx1UqIgQ++ztU6yC38u+85FEthFqQNvclF8LxV3Bh41nngQR5OS9uiZj5ROQ3CLuGksm6uSYEH9zAEBd6kA+6pD5zWcuQZutUI9OQB4YeoVm04XpU3xW0mgCj8J+Ifop0xSq8h2VlY9K4e5QKk98Wtmt6Eng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYjOOBN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5lAdNdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO89Oqr3821487
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSV3sAHeeJVuK5Pcnq3kcJfhY8DOScHIXuVIS62Z0TY=; b=OYjOOBN9i15AunCK
	fEq92QoAvYS5+3haguFb3KD4G6+kVRMB4oqcO8w6G8f/KWn0oTihZOS74QHVyFw6
	UF/TpUw9tSHgZIXVCq+RRezSGrBwCH3HvlerYnJhg3tv5CnJ6vLOUWsOcUCG8lAY
	ID902xxrf2CXk36X2p0/i93ranTGIT8Zdu+D0Az9gji+CXLeqmLEPQEe3/twam0B
	IUJO98EXtCPMBr7ua66zGgnKTkeglaK/hHNm1ZXdd/x33bcdWDovuhecI7txuQxR
	IkiMqYbtUHkGfVRjxtw9BDpiQtPkeN61x+av7HrJ/ZNsmEtBHQQApPHbwe5U/Rn0
	li9Kkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknrjjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:20:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6a906c52so10795111cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763983228; x=1764588028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSV3sAHeeJVuK5Pcnq3kcJfhY8DOScHIXuVIS62Z0TY=;
        b=B5lAdNdFg1zKbReTb678KTlnI03vWIOvtNCV0T6SC5YDht0xXa+R9d8iSc+K6CDKek
         ab7LSA4EZD5OMPyr6J8QVNJasxvzjccrBMavuhxJJe+Ldv4AH2XA0TRYubsHNG0v3p6T
         YZ1MOSnwKjjizVBZggaKgjNh/qajMapk027KaQ4VVx5cdgkYTj/hKBj8oaXJ8PBhIBaZ
         9b32RHvikMIAoYBxN+gO/LNUedElFUg2XyyBgz37hdKU7IpSSXsTwIv7Mc5K2tIcSiFR
         fl6OHl1CI0Uqzbm0FQj3AzARfAFaxXtIYJgzpmVbQVU3ZDV5Kw4+B7VPIL8jn+VCiTaQ
         Oz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983228; x=1764588028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSV3sAHeeJVuK5Pcnq3kcJfhY8DOScHIXuVIS62Z0TY=;
        b=uhyZkkxx+tXA9cvM+yGKr14BOWtKKUoP+/A8izVubEKMXkmOSvFMjFpHjCXu+Rj2o5
         bmhXCNpHwwtfx5UbFouhbSNNEaKTpcrmr4XcVV0lO/IMo9wTcDptgD1MxHuhYVU2lwMh
         QJ2ZTti+MieMLo0fI4izcXX2lYye+U+sAQzCkNumgRNHakoDejm/kchZKJ/KgJV7Lmf/
         d8uShwOHMjxWXfdxoSfR2hO190+20yVmfov3uHt3lzxCuRM5wOZlI5mmBJot2DvbPKiB
         6zzmAfmv5wKkqBj9VtOi0Mf321G9Fj9WMEr3SV04EZX83DjkMnEcg5dwl6lBI1Vma0wj
         uWXg==
X-Gm-Message-State: AOJu0YzP2Ktm/8hlGB3ApxhNp/xceNrM9aBF7iutHNq6XK7hwcWO216v
	m5MbUvDJYp2syDmMjQpxZSiePNazCzyvQZvzBap7uvhfdkViT+XSgNK5FhW6VSo0iUsB0cM4oax
	EcB13UZw27caOny/JtZUPbNtvwZB54+KoJAMQju/yB61qqPdL3UAog/odtzrSnCXwk2E5
X-Gm-Gg: ASbGncvRLJosTisowVWr+b90TyYsQ0B5xnx7pFPb3vG6X9TfokrnVckMg9YLjnXYHQW
	FJg89YxCI3ghGpi+zpdJwenj8Peh/Cc7gHtfEAZPLNlWSrGoI0JDj66j2yLjXKV4FBJTXRrEEKu
	BIaeix0X2w2A/3JNkHhGHCu9JjCV03xKbm4HtynunBBNSlkn9qL/9Y0BocvJnSt+Ximix1anO0K
	Rrdo9gzKWCyL+3UnDlLiqbnWHl4qZMvssw7eeGQuUlnzWvdD3ugCA+jeUm3mdN0IXWwOpCvtrmm
	e5Uw61L/bdDZACzj1GvKhZkFPyHRWC6kflGnNf9L0ygm25nk4SjGb9Vqrqz5flcj4gyXMbrgtKr
	3Fdrii7FXe6h+/yxcTDrYY5prUbYoh38r7NkAyl9Ul6mPo3wr1zMXJUe6HPQn/flKtbM=
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee5b6fad57mr103922741cf.5.1763983228028;
        Mon, 24 Nov 2025 03:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR15jx1YOLqQWEv2r9w6P1o+SVbw4CilC5v2yYmQGkKlKIVzrKmx0kXCcc2Pj53olgY9s0mQ==
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee5b6fad57mr103922461cf.5.1763983227641;
        Mon, 24 Nov 2025 03:20:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536442993sm12371722a12.27.2025.11.24.03.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:20:26 -0800 (PST)
Message-ID: <2fc83dc4-16ab-470c-a6b2-379dc3e52744@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:20:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-12-8e8e9fb0eca0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-12-8e8e9fb0eca0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ivB_rbTKT-ns5No0KzsVbhcDfm6amLL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMCBTYWx0ZWRfX2wpYzBLu3xN3
 NoBeTxBMPlw8ZYKLMCoN7hKnbf0unyotbgYl8+VN5hM0NTwR5BZJ0WD3wLgkPW+Bqtf1P2y0B04
 uC+xICKfa+6RxDZt3Z4+C1LkeUzXxb57uP4wmjF36S7g5UqnqoJoRz7ajsnj5EfM2TLfS3SfrH3
 9jVeX6TMOK1JBTIEd6gPa234C6GF6KE8A0PROjSCWPmDHUMSshK0+9awnj0MhsLX6fsgqfHohun
 bioBAemsW1UJJ/tN+sZhaJdU69cvVbg2TSRMDW27icz8kAV0bR4lvPQmej/NDL3YkMXgeMhLY2E
 IJr7IG4Dbi01/B1y6eO8hiixQscMxQi8hcs/yOO2sb8tZ3IF6t+Pionx5CfuMDvxt7Ednz7rg4u
 adyII+YmGmqqnAVswFGkd1b+bK+MhA==
X-Proofpoint-GUID: ivB_rbTKT-ns5No0KzsVbhcDfm6amLL_
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=69243f7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WVEJiFBRDJ0UJk8ac0oA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240100

On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on static and dynamic resources for
> it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> or older QHEE hypervisor, all the resources whether it is static or
> dynamic, is managed by the hypervisor. Dynamic resources if it is
> present for a remote processor will always be coming from secure world
> via SMC call while static resources may be present in remote processor
> firmware binary or it may be coming from SMC call along with dynamic
> resources.
> 
> Remoteproc already has method like rproc_elf_load_rsc_table() to check
> firmware binary has resources or not and if it is not having then we
> pass NULL and zero as input resource table and its size argument
> respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> present then it should pass the present resources to Trustzone(TZ) so that
> it could authenticate the present resources and append dynamic resource
> to return in output_rt argument along with authenticated resources.
> 
> Extend parse_fw callback to include SMC call to get resources from
> Trustzone and to leverage resource table parsing and mapping and
> unmapping code from the remoteproc framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

