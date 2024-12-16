Return-Path: <linux-arm-msm+bounces-42335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272319F3058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5923E7A0F39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 12:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4498204C03;
	Mon, 16 Dec 2024 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljwNsghQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60294204592
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351604; cv=none; b=iR53z6aOexaSxW711/XdRy7uC0ja7NWND21v59T5gN5KE6C5pBu+jgGegRwGGeol69WbwVE+tLFiEV4IT1NEfpOBA+6Tw46KDhJiHc0xbkYfNS2gghii80YGbTLlcxTvr+zMlNFtliy2sRrZUcFpaCTPwqS3oLnRtSzDpDrYGnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351604; c=relaxed/simple;
	bh=ybgRkqth+vwtYw+ouWiPcZbJPYXXDnMbtY440TFFZKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma2NcGSWBtCIUFsxtIzWG4s4S4oeDKEkOk17uEH1DHjR4AjJQm3ehO//ty1Se1xERl9RkdE/H176jjLdCBd5Vqgx6TqL4ovTpTeyIB3TJxpdcIbCJEiP04XE2j8nuEFjUTwtPPK26PsFGhkKTVn4P+N52RqTQHToXR3e6eePmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljwNsghQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG7Sdp5025421
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 12:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOsyJZCKFlaXhdMetjiPjn7ZCm+QcoQaD1OHyhj1lNg=; b=ljwNsghQHT1/dn9K
	UdHd2TXkOk8OLqslle2mW6hDI6SuRkEjJiBVqGUBMPtFRs0M1YKjFaFbcifMCvlZ
	r0Y3Sn6O6B+GsEAxW7Iiqttk8NcEeP4oRGzXIetRwkWubTVevNug668xejMbd9L7
	0Cw9dgc8+NJv1suU3L8JZ4mVQxJowFU18cIhRcQoU7bYBcCYwy5pCzXZYXc/5jzE
	jpE7mHHYXByDFgunE8CNzn5W7vIvG+hAPakuOa1z+bVAvh5sJqd42fsnHBirgHQK
	89p72pO4ag+U9fBJD6vfaY3PvaKivKz4sJY+28xaIQdlOV0K1by0Q6oLcYc7iaDT
	gLdmKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jfus0spe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 12:20:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a97dec51so4056981cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 04:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351601; x=1734956401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOsyJZCKFlaXhdMetjiPjn7ZCm+QcoQaD1OHyhj1lNg=;
        b=dCToQ6schE7by8xarMLxUkIs6xnTHDxTlBP9IhiyjOMQ7ldBLtY2NOvNVoRATKGVmi
         ElHRQ8DsDhdrmetB/hPq0u40u69eAN27cIUvUJGnWtLxBzD0YZJ1Uc10s+ag54Bbbzt2
         CvuwrgHj/LrrgmutmZdLdrRPLwKbmYX7kE+pJ5ZynE8W9rT/uP1aKUbf3hfWdoMG0Ixo
         zMcmNbDYQdFHnbRbgwLQyRH4aL6ozOvW8bkxRbiUGmcZq4JzfRfG+QKnacDZvqFqOqXB
         sy7RG7wpmMSMLw2dOfSlxA5rZ10YyYQ9KUW+/ArQ1UV0wuphzCeSzRNTHqevGq0NLQBk
         iGcA==
X-Forwarded-Encrypted: i=1; AJvYcCW05p5rvyV8uiBiteQHvgp4AzOWcjyWs7SlG80CSUPmQRkRY5CB8fQQIDKeOOutcW6TkNk1EpUCxhJHn5Rv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjx8q/nXsbYxYFqTpId412Gzx3VIIzvyiawWK/vhN9GW4gK+XQ
	XZ7SokiRjsDCbp1vpU57TY+qiT8QHpvatAw/pZm1yiUDQSyNEZIx7eixD/qhgzJ9zU4VhvZmaIb
	Yw9+PMkjtNCQ/LjvHvP433iSgWTeFCNwCm8lt8tWkWAbbjLHBjQDtuB0w9l//izCF
X-Gm-Gg: ASbGnct8PVaWmD8MkqqZZ71/FyDH/78OEY3EhisoDt5H1eGotvX6cg0on0VXYF1GAy/
	ViLu1FPmcKiYkU+7PjxU0kAaFyd+/J3917RM38fAxaRPWfQgeEOyvnbMI6rxwcWBCsTCI61aYJh
	YRTjV8nfIdmh4GI8WHPCgUcu3WtLK68vNEfi1OLU7JtKiPRCQEGRSansFmyPk0K4hkMZoadxBaY
	SSoJ38ehcEwS447jiNTqKl+tHwrxNayrRcntMi1yk8W0u2Zab9BJo+JHZva2vnxMDAf7wB3BcDd
	vFjo/k5Lr7fqeDEbLXM4QIZAJhPzmWYd+3o=
X-Received: by 2002:ac8:5d0f:0:b0:461:3cd2:390 with SMTP id d75a77b69052e-467a58137a1mr86824231cf.12.1734351601300;
        Mon, 16 Dec 2024 04:20:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9pG1Ysvkr5Hyq/nig+qT8t4gtr5EQRe9497XJuqjF5LANAYeaCtwgGtk6X8FjF5ldW00HDw==
X-Received: by 2002:ac8:5d0f:0:b0:461:3cd2:390 with SMTP id d75a77b69052e-467a58137a1mr86823711cf.12.1734351600845;
        Mon, 16 Dec 2024 04:20:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae11f8sm3285148a12.41.2024.12.16.04.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:20:00 -0800 (PST)
Message-ID: <3a67bc1f-dba9-4ab3-9c01-f889dd24359b@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 13:19:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] Add MSM8917/PM8937/Redmi 5A
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux.dev,
        Dang Huynh <danct12@riseup.net>, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
 <CACRpkdZ-ZEiGMUPObHU=kw=OUADrRGtxgMc-QC3EaBevp-Shng@mail.gmail.com>
 <vfwisdkjg3czwesi6yqaznvxcz2z5ksqezhsh6ytrc2g2ypszy@wqkr5cgr26vq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vfwisdkjg3czwesi6yqaznvxcz2z5ksqezhsh6ytrc2g2ypszy@wqkr5cgr26vq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PJUjlzTPYZl12AOLBg_xblh4oF6C1RL3
X-Proofpoint-GUID: PJUjlzTPYZl12AOLBg_xblh4oF6C1RL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 mlxlogscore=886 bulkscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160103

On 16.12.2024 12:28 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 11:33:30AM +0100, Linus Walleij wrote:
>> On Sun, Dec 15, 2024 at 12:15 PM Barnabás Czémán
>> <barnabas.czeman@mainlining.org> wrote:
>>
>>> This patch series add support for MSM8917 soc with PM8937 and
>>> Xiaomi Redmi 5A (riva).
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> (...)
>>>       dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl
>> (...)
>>>       pinctrl: qcom: Add MSM8917 tlmm pinctrl driver
>>
>> Is it possible for me to apply these two patches in isolation?
> 
> I think so. They have no external dependencies.

Green light!

Konrad

