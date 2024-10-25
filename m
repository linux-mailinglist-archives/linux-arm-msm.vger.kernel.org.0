Return-Path: <linux-arm-msm+bounces-35938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63D9B0CAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31A81C222F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E38620EA49;
	Fri, 25 Oct 2024 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vw3NMJvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B61FB89E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879666; cv=none; b=UCImd9SFkZzvuqhiIsngnmCMvylCOb+U42CoYzh17GLzFu3sB+97ij8OmCQEJcAcUQeAbZCEMLXGPFbVHwvczJlSxKjLV3MTGV7jdnjs6oRPMQEH/qgaJCRm7/AI7HOOzWYQ++vcjEULmvdIg7u2zT5kvSEJjjqZWE++y9Iu+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879666; c=relaxed/simple;
	bh=t/xrCPBpX4IQs7qMaOpki3bpzxoML3WGXHvWaXgRNGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r21KVWEpaAOu7OCzWYMEL3MCOXvP0E4qP8tiF0cEsZKgmdP8oOYYmS8SoQljv4OJYDKVx5yQqjqZXna70K/Bl/0XSGo0/SyOO88nrP8XiuT/QCUyQZdIvSf9ZCtrVg462RRg0APRhmQoQkgday7VJsS0WEValWMTxuVs4f9Omh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vw3NMJvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P9tGBV029632
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEmK1BMqucZ0C/k7tFNaUt2VXWOjXrNa2caGsrfdp88=; b=Vw3NMJvZUnX8nzJ5
	B71t+AeB4hZROgqWjdRx8HGjd0QQSepIvjRXgMudK527mNQ/J1AMycuU6NUSuiYA
	vBU//qQaAApUOEsrPqVdybXMjYwn41a4XPU61DyVOPgTWf71jFCXwlEhdhM9fADO
	ge+GsuZ6EHXdj5M4sGb/XAmyxIPNVBhuOZ8F0vpARinUizv1fiWFs/jwwx7mUk5B
	0a2o/ZE+DH5h5+TXKjp4bshMDsUEKmWPnYqAj2riwS+cxfh3Q4UGPg7Ol/VRbn7p
	xcnDn15VeFSp4qmB1vyc3H8QJI10hJiPzDeZvEaOuyOPLLbOEgDfSb7geWrfadhe
	4WMWVg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wa20h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:07:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so6658826d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879662; x=1730484462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEmK1BMqucZ0C/k7tFNaUt2VXWOjXrNa2caGsrfdp88=;
        b=sBDRk3SMHnNTEXuSJJo1Syzl+QafB90fG+NqIKpNoQEBeBPA0b6XzsRoGb/HwxuHLv
         VbQUtvwr/ooZRLscUR9xYvt5jxp/2T97FMEyn6MZikn5brEMYXsORNzy6ldy/xS19jd8
         oOLxWkPRgccUBEjWWuHGWHK8UkAM8yU8x9HJ7QZ8YjQgcj/95lHxGiqYiccBo66xz7Gy
         lAayV9CePMb4OVLZ+9E+yFOMUH+Ll7fK/iZzi7JjLcfMfKd2b3Oh4r9t+0Gt7XUSZGMl
         qFryKbOh/55ah/LWEsDD5b7FC6ufVhZHRnrDtNqOkTGql9ZmSJPtrxUg4yxCP0h09qlZ
         HbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Il1eabKBDmR4apzFry/yK8a6ekdfF58j6qc6VuYdX4w36dCjaxPvbv/dXKYsv3y3YbXB4Cpd76b6jFUY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6BRIjwYc2VHc017icVtgiKAqBSvC1FIQZny9JX2sonJCayTbv
	qhk0uMUZ0fG27V+faQfzSgoF0TGkOyYwHDmMkxURLtEfmmJZDUcYSidqS5oA6FjccGihGeRizdu
	9TXveXxNj5cA1tF1feAp2DoMXVILrZyBIVu4buLYR32WjyEmTG+8+1UP4SfNLv8KH
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id 6a1803df08f44-6d18583be81mr1903486d6.11.1729879662369;
        Fri, 25 Oct 2024 11:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK00E6HWmhXwZzwTNTlPrpRgUxZ0JpTzXSxFTem0yV5d67LzVPL4Y8aZ2JDnm7bLd5A2AH0A==
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id 6a1803df08f44-6d18583be81mr1903246d6.11.1729879661968;
        Fri, 25 Oct 2024 11:07:41 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1e0b2346sm94957066b.3.2024.10.25.11.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:07:41 -0700 (PDT)
Message-ID: <4982b7be-da80-409b-b701-b065b565fe20@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:07:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Add cma heap for libcamera softisp support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w6MT0wnUYGD5tSCJ_0yUKYgwxPetyyvJ
X-Proofpoint-GUID: w6MT0wnUYGD5tSCJ_0yUKYgwxPetyyvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=615
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250138

On 25.10.2024 5:43 PM, Bryan O'Donoghue wrote:
> libcamera softisp requires a linux,cma heap export in order to support
> user-space debayering, 3a and export to other system components such as
> pipewire, Firefox/Chromium - Hangouts, Zoom etc.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Same as patch 5

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

