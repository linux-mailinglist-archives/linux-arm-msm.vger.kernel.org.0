Return-Path: <linux-arm-msm+bounces-68017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63453B1D889
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 397557ACC8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F55257AC6;
	Thu,  7 Aug 2025 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTIiN6OK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139BC256C89
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571969; cv=none; b=d37K2KiTjRe2eXQjmULfwNQkMc7lE0Vo464tVulsfE2y/usnT/a/1QdjxoW5SCR0Khj6twFvUDygWAVvc1/LjPhVf/nSTwSTkQhTTOSt244lEtmHpqFZrmTC66P72XTWRKUAI6MxEVe+MhaAACUnIuoj1yPe4nxcveqeQbVdo74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571969; c=relaxed/simple;
	bh=YhkaZWRCFgO5FeHJ2OKKrnXnUc1X6v1ryYXb+OKrIJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Od3qI9H31fAq8x0kFX1Irvj0BzYnvDE/ZLFSaLBNhfI9HB6WDdO/U8QhXKClfZS/fS/VREp474VeLPXAbdlUSXsLNQzMdJRydaj21Z4TR9DhobbkoUW076FpA/NCcbb+DmDK/gP2vvGA7RAyxhwbrTBUa0PaQJ7CqWjVGb2MaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTIiN6OK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577B3muN008481
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 13:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBcHHZfiUOp++mqWXUPK8pryPqtEB0VS2HuB1/078ss=; b=DTIiN6OKDoIjOaO4
	OC8rpTbQGvguholN17OtKg2iqya2D/ELG3j6EOXCe7rwcyImk7mx5OvoPnJCTB1W
	jYG06ZuobdmqDG3RUdRuuFa8Aa4azYMIrYM6WkOR2SlVpibF1gSZ44bC70csptE8
	i1X4/msKGunDC/4xb78WafOpfYasd/80ViVJGd/R52Cn3KswxwECiTBuph2/+Zrd
	EdsivZD166b58WKRT9lbjT1bUeNZJuiAhjZkBocVo9P8B4GZgFR8ksoklSmGLu1P
	Rp7y+DjzgOSwzsyq7lgiiS+1NQtALd8iElw2Jn1qoX+YYdnypwyzkPZ8i9GtG1HA
	MiWfoQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2xb59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 13:06:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7092ee7f3cfso2875116d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 06:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571966; x=1755176766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBcHHZfiUOp++mqWXUPK8pryPqtEB0VS2HuB1/078ss=;
        b=hVLorZPoKoqrqe4tzESzVC/ZWKCY38IPlPQ3mOg1jDhmagr2l2YY4JKmkwXanuesrm
         po6yh0BxlLe6Mw8rcPQCe5Ai4vsUy91m2xDORjfGDOX1vF+4HmwqsutZ4NSyh2jsin1M
         Ecz260x7vuvOs/n4vYwyXR3zx2XAOH2df3j28ooYQcgF5m4YCBKR1qlLKNR9PZWrQPp5
         z0AFkOuhdlj+ChwHNEkKzKYkj27sDh5H16S43rxcbLh4t9Isk6Rdw8vmNyClOAdWYm55
         3gqQTKgNW9HiwbdjnO3xAlNSfRtovn2JK8EAN3yQlLJ+9RT6TIIRQT+UBpBGss1zv/sR
         Lt3g==
X-Forwarded-Encrypted: i=1; AJvYcCV4tddPy1rALXmCDfiZRzd1fxX6SBBBwqgTvmy+Z9S/QElopOUoRAGobRTdv/38xx6ShIJ0CR1n5OT9afZb@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvjSXJj2SZFhbpCt9JH6vRvNhZUb2Nj12kcX/0Ohd6QftxUz7
	2ZZW6yNQY5CKKCVMaQegUnwQg2hqsx8LMVUVazDzKEC3wm9/oCkyKvE+AgxDvgRdJ2fBlwC4hAV
	1aFTU+aXtNtqJr7kgNdlDSlGzYjOxQ1rx9zjJSd0VHBYBNUxJVNKzKGLR5WI3sZmtcj3N
X-Gm-Gg: ASbGncs1GI+Tc2UGAeBrQNwaZHQ6tu3YdynTUmrSI0AzfQPkX6LxAIoT4SQi5maiIEB
	DsDGopH3A5fgPuvPwFOPT0eW6SfENESJkbKOIMbSHwBK6Xw07V0yrZpBv0EBDmvyDMy4xjYJsDF
	0TfbNWB9yEInqv96kXixjCmDmwMjpqppl8pD5JeQiSjpEYrV3403x1riylaPFyyeU35bBNVbxYc
	cFiZLM+D1AZkwOSKBKWEEcjCt6235miTUfv+bswymCFbEb2HJqx+npVOEN7YXPsUlSXcTCIur2t
	pIDN5yFao+FK9LgFFz2BShrzbAK9CeY9yQZaqlabUlNbrebJuvhuiNkj0N8lhutZydc5QQaYePr
	c7myfQl9ze9SVgFsxCw==
X-Received: by 2002:a05:622a:1482:b0:4a9:e46d:ca65 with SMTP id d75a77b69052e-4b0912cb849mr59963691cf.3.1754571965612;
        Thu, 07 Aug 2025 06:06:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ8LROlrHhAO/nx3LuVhJ4aWIUOSeMqQnvYxszMmFd8ZNXQqKXcDSu0gnMVTLJH/zAcvVbmg==
X-Received: by 2002:a05:622a:1482:b0:4a9:e46d:ca65 with SMTP id d75a77b69052e-4b0912cb849mr59963051cf.3.1754571964966;
        Thu, 07 Aug 2025 06:06:04 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21b115sm1282528466b.103.2025.08.07.06.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 06:06:04 -0700 (PDT)
Message-ID: <aed1de56-fafe-4ccc-b542-69400b574def@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 15:06:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
To: Mark Brown <broonie@kernel.org>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
 <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fe2bc07c-8fe9-47fd-bcd7-c2f0ebbd596f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6894a4be cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=kfhvm8o0YWoXJs5BtVMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: GE_1k1QGKJlVnt_1r_PdWcpXvzFAKoub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXz7jdFqpFhmw8
 kC/3aMRo9zT8UV745lVbgGyUA8sBE/FysTcH4+MmPedVsVQJRIyxuYFeEPK2ViJ/xdodxLQowWM
 ahNjLUWT67IL3H7NA2pbOWvfoGKdSsKfoEs2Xtm2XM3rChRPAdZ7+CPsdu+Uz9Ku4cOili9/EJn
 lkYxziKYq2OMUwm+gHRutBpEq0kQBV8jPe9T0Jd83MaNL3TstIqlcLVaaB+NgtHQQgoJ3+BQ+Sn
 WSv1EYDLljsk0cIQuWAq3XdkZbGOGyqHDAcgpkID/4gkZPaU598M2PsHXwVvj2+YFl4hZtJDKMw
 fqZS+vbC2QTw4QdslciKbWhT9M7joQmIatf+w30/gsXZP6HsXHum/wAp/mNvb7eK7M4iYcuhti6
 nxkqrY2K
X-Proofpoint-GUID: GE_1k1QGKJlVnt_1r_PdWcpXvzFAKoub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/6/25 6:51 PM, Mark Brown wrote:
> On Wed, Aug 06, 2025 at 05:58:30PM +0200, Konrad Dybcio wrote:
>> On 8/6/25 5:43 PM, Nitin Rawat wrote:
> 
>>> Add support in QMP PHY driver to read optional vdda-phy-max-microamp
>>> and vdda-pll-max-microamp properties from the device tree.
> 
>>> These properties define the expected maximum current (in microamps) for
>>> each supply. The driver uses this information to configure regulators
>>> more accurately and ensure they operate in the correct mode based on
>>> client load requirements.
> 
>>> If the property is not present, the driver defaults load to
>>> `QMP_VREG_UNUSED`.
> 
>> do you think having this in regulator core would make sense?
> 
> I'm not clear why the driver is trying to do this at all, the driver is
> AFAICT making no other effort to manage the load at all.  We already
> impose any constraints that are defined for a regulator while initially
> parsing them so it's not clear to me what this is supposed to
> accomplish, and it'll be broken if the supply is ever shared since it'll
> set the load from this individual consumer to the maximum that's
> permitted for the regulator as a whole.

Qualcomm regulators feature a low- and a high-power mode. As one may
imagine, low- is preferred, and high- needs to be engaged if we go
over a current threshold.

The specific regulator instances in question are often shared between
a couple PHYs (UFS, PCIe, USB..) and we need to convey to the
framework how much each consumer requires (and consumers can of course
go on/off at runtime). The current value varies between platforms, so
we want to read from DT.
The intended use is to set the load requirement and then only en/disable
the consumer, so that the current load is updated in core (like in the
kerneldoc of _regulator_handle_consumer_enable())

My question was about moving the custom parsing of
$supplyname-max-micromap introduced in this patch into the regulator
core, as this seems like a rather common problem.

Unless you meant to object to the "QMP_VREG_UNUSED" part specifically?

Konrad

