Return-Path: <linux-arm-msm+bounces-37887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203C9C860E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 10:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C63A0B29C9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEA91E04BE;
	Thu, 14 Nov 2024 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p1sZ1C8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1991D1724;
	Thu, 14 Nov 2024 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576346; cv=none; b=WxYhmWfJ7YEJrYU2j4jhyt4jNiudk8ylMcs7367g32a9GqU8F2uc2si3aKRcOoo/jXFJIch70Smaxqyq6/fq+TibRZUGlaCG2lMGy62m/HO9Y2laDtmA48UCaGmJg8HgIsuqQXdEIzmRDcq6tb23Mv96NnwLxBYlAKAU6VBPoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576346; c=relaxed/simple;
	bh=Vl8mXWmjJYumEP09IY1Ncnpabe/c0JjCY2B2aLZGu/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lSSN9CXgreEwgT/CNrV5DOreuMmCmahuaN7naazRVKfOvGsmJcOIWhW4Dplv9zUbMuAPBxTDGiuOKPIcCD6POdqaQRaABxV14hjDhUP2RzkLLYsTFw1kJ1yFA+27CtO04LIBmlPrxnfm88CzFMLd59lxozwOYTXCmh3ZNnKthG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p1sZ1C8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6IKEW001037;
	Thu, 14 Nov 2024 09:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o1a/rLKfDtGfnAqop1ilAZvG286XpfhS8y+030aBT0=; b=p1sZ1C8InX7kHE1p
	KYeVWe8RRJa+2k63pRWr8KMxkcjwtuRfU36KscO7Y3EWt9VUnLj/4IwW9gVMTTnQ
	1Kf/KMNnnruMLbISar67CRNPi+ADM4Wv/2HIIDcaCvi1pN5czHojSlOt0uZPJm3h
	pDEm/dVTXTvsXiP7UU0sdK13wkS5ZgrQwPHcbUehbXaMNvXfGYUPhQ8EknEYPnyH
	FelrCy/Kb4MrBkdmKp5gzum/tYPUPWVR5W4Jgx9Id7GVyrEXMabruvXhqadzhTON
	g4bU+o/WKVlzGngLv5Ms9+TOWj1Z2rvDdKTUAxxdMqkjDt22KHGY4k4C2ub5Lwcz
	OfXfbA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vqbm4vku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:25:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE9PeY3012117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:25:40 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 01:25:37 -0800
Message-ID: <08e2fece-791e-436f-889e-8b20767776bc@quicinc.com>
Date: Thu, 14 Nov 2024 17:25:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: nvmem: qfprom: Add compatible for QCS8300
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gbJhzP_DHSaS4LZwGI5TbEpLHJfshc1o
X-Proofpoint-GUID: gbJhzP_DHSaS4LZwGI5TbEpLHJfshc1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=394
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140071

Hi Maintainers,

On 9/11/2024 3:34 PM, Jingyi Wang wrote:
> Document QFPROM compatible for Qualcomm QCS8300. It provides access
> functions for QFPROM data to rest of the drivers via nvmem interface.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
<...>
> Best regards,


Gentle ping for the patch apply.

Thanks,
Jingyi

