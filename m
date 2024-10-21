Return-Path: <linux-arm-msm+bounces-35189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C59A6049
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 257FF1F21B6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55CA1E2608;
	Mon, 21 Oct 2024 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qshzu1NG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38C1E32C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503529; cv=none; b=WTAT2IaVNXxbnJ/DhXiOcYZTZ7yvQONc7HKwnVp5D5LcL8pjvLma9G3/Wtzk8G/gxGpv8tm96SSjuEeJKT/hAsuFaN0aGSSC/zK9TUoMPhrs6ilSqla3ulzuXxNKD/EN7WL/mV9sKBh/5+R+b+dv1Le0JmM7/QkzofnvNxKAMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503529; c=relaxed/simple;
	bh=NhBL1wZH7ZwZciKbpoNjPbtqWf7fDFxHOe8r+ilIxpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfwSq3JnWgvKD/VyNhLNPCiPbDHAFy6d2LzsQ7LEpciurgoZ23hloW0PwlnpptapBSOstLudCHLMo8c+4X2t9SFq1hhF6MSwEV4eaHPkuHDiyDhJY12AGGzbhI+Zeq6SN1akBfPNSUlBT1qqoHMJjSoOI2bfI5Cg1w4HN/gBmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qshzu1NG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L9WiRB016474
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn+gkmOeUyjRBUooDRR+2My5sXvmwkHI88BMxZAlKmE=; b=Qshzu1NGPFV8rsTh
	txIOPB3GFuckqrBScsLkjnrIuuT7jhuJiOz6yvjMOpWyZRN5rKHEvIet1nKtgOxZ
	xRjTgCApXxaGFy5Uspt38X1yhYRPKGdbw5DykooS4TvsXhfT5crN/yTF1rG8WthK
	o/PWB8BUzZUpcpjGci3nE1zaFet6EfRwlt64/kco889eZ/zeYDjKA6vcoaKwJHih
	PbX/R/39BknU39Mxqa1Wu09I1z48fwrNB7LCoTlsfEQ2ambgf+1dyAepy5wDpAgm
	vBTMHBogS3iqAZuJ35s4zfihjB5vgQMoXKc4cOqb9wNNTfkfpVBpyZIP2p2mRejF
	4cI7Dw==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdq80gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:38:46 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83aaad1b050so56385239f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729503526; x=1730108326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gn+gkmOeUyjRBUooDRR+2My5sXvmwkHI88BMxZAlKmE=;
        b=ZxYjS7GXRhdg24G/mjdUAOIcb6k2VCkV/goTVIIiwprn1b8pN4ABfyXLc+ZUC2owzZ
         7GpAX4hQ6OWPW4qeKJ0MQEDc94diJuknzfleQKKTo85r7+CdVuRQIx19v69yXXEUXRng
         Fug7/WsxXA3Gi+2Y0Zj/1Wfo0YcP1zPacSKNBVR2bGX3xT+TCcQaM3if6X84wl1+WSKG
         oBA5qAIs/H6RQR+JKypgK7W/ckf6k2o30Y4ru5MoqldM1ioacWX6s2RFrLBJZulIx2wW
         c2dHDPo31KlbKPGed6DQvCLIP1wWpxSeG7n9UlRllNOcVbdv3VqBXgOCvlXtoeXxW7xy
         8q9g==
X-Gm-Message-State: AOJu0Ywj457sQLC5pLPB0Jz2OvmG+0w6MPgufYiTv5TUbzBhDfbUBsa0
	kaSh8bW6/87QzkYvrfIj8gdbgNAxQmxtsWJ1544/ZGExanjaDThg7QJKYC8S/cNWgIAKxaU7pfk
	rsPBpUr5hKU8pa9MmtyLQ0fqY/nC9r/G2NetA+YtnIc527CPgguh43F0sNXYC4Ucq
X-Received: by 2002:a05:6e02:b2f:b0:3a2:6cd7:3255 with SMTP id e9e14a558f8ab-3a3f40b41afmr29448925ab.6.1729503526132;
        Mon, 21 Oct 2024 02:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/wHHBGM3zQyx0/OSXW35rXmYHrOpG+GrEQovUlYPyc88a/4376jQdZSvI4nY76nZm9i7w0w==
X-Received: by 2002:a05:6e02:b2f:b0:3a2:6cd7:3255 with SMTP id e9e14a558f8ab-3a3f40b41afmr29448885ab.6.1729503525721;
        Mon, 21 Oct 2024 02:38:45 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6225sm185228266b.11.2024.10.21.02.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:38:44 -0700 (PDT)
Message-ID: <1543ae2a-76ff-4b36-adae-37076e48b7f8@oss.qualcomm.com>
Date: Mon, 21 Oct 2024 11:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a0eZrSnGyHwH0Ct-AmRzVKVvbXYznlhj
X-Proofpoint-GUID: a0eZrSnGyHwH0Ct-AmRzVKVvbXYznlhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=914 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210069

On 11.10.2024 10:29 PM, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +
> +	/* Initialize qmp node to talk to AOSS */
> +	gmu->qmp = qmp_get(gmu->dev);
> +	if (IS_ERR(gmu->qmp)) {
> +		cmd->enable_by_level = 0;
> +		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
> +	}

I'm still in favor of keeping qmp_get where it currently is, so that
probe can fail/defer faster

Konrad

