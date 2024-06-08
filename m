Return-Path: <linux-arm-msm+bounces-22108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC918900EFD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 02:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A671C2178D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 00:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED908F47;
	Sat,  8 Jun 2024 00:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BfEDLqWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA579FD;
	Sat,  8 Jun 2024 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717807551; cv=none; b=jqI9EV3S5X4qL+p+e+ebyk1qm2AImoZRL3qOgek0i2znEPFEqRHgN9UA5P9Nlsw6HiISwTrTMp+I34nZM0Ry/ixSvzrXipXdFx5+fZLa8XK9h42wrQymQqw/biCJDchRZW1zIiqYiYGX5wWg+jZ9NbnCNFmdYDmiTJU6yB18Wso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717807551; c=relaxed/simple;
	bh=A93ZMViXqg3llgTcbVScfnoF99afhUkTpLe2CB5CfQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HMDF43qExK9UMJAQkLmkm4pS3q/iFd7nFfLvAeiHj3GEQwtfxQjXh+Gp6bOfvnl600DDr2aj7DvNycscCh0Wk/fuGaZVnWsCvdsfawJX6ySYne6BWlQwpZVs7ehYRUiSkZOmFG/Tk8ZNVOs64xSUad4szBOOqCgBEJegzXtY6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BfEDLqWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457Ld8vQ025754;
	Sat, 8 Jun 2024 00:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQDQp+6nMU4hWKAqkAUMA4IpY8FXmCQVVeioTiGBzvI=; b=BfEDLqWypeR+1Vgf
	H+Bm5oMuB18rAvauyNilFICFlN8iS16XtP8CeW9SmYGZi80sFDrIJ05ZbT8rpP1/
	T28rrHIqZOPpmpC9+a3s47H/Xo8XMk1cqnGduKxRrhVtxR7r83Qy1KVlIgV06XMb
	d1+YFZwNZQV5swILrZuAFRjtyCWWdwPw3vPRPSMkk7O9R5hk/JS6x/CJyXsA9W1q
	my7L/eQHMvwlScOpkpjLEXCnhGPrCw69vyyBJa0AyL2Uc3VGBSlkT8qjgG6A2CVz
	ci/cyVY5PS+4FDciqcQcjp1ZH4f/D/mgEwMT4mgW0fuevERkWs95r/L4DuHcR8O1
	dgw3dQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ym49w1605-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 00:45:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4580jedT023558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Jun 2024 00:45:40 GMT
Received: from [10.110.22.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 17:45:39 -0700
Message-ID: <ebad85d7-b601-42fd-9639-6d2ff189d186@quicinc.com>
Date: Fri, 7 Jun 2024 17:45:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] soc: qcom: add pd-mapper implementation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
        "Alexey
 Minnekhanov" <alexeymin@postmarketos.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
 <20240512-qcom-pd-mapper-v8-4-5ecbb276fcc0@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240512-qcom-pd-mapper-v8-4-5ecbb276fcc0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YDTUpLcNwqZO7nyc8HbZ6W6UY3P4fT1E
X-Proofpoint-GUID: YDTUpLcNwqZO7nyc8HbZ6W6UY3P4fT1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_16,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406080003



On 5/11/2024 2:56 PM, Dmitry Baryshkov wrote:
> Existing userspace protection domain mapper implementation has several
> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> reread JSON files if firmware location is changed (or if firmware was
> not available at the time pd-mapper was started but the corresponding
> directory is mounted later), etc.
> 
> Provide in-kernel service implementing protection domain mapping
> required to work with several services, which are provided by the DSP
> firmware.
> 
> This module is loaded automatically by the remoteproc drivers when
> necessary via the symbol dependency. It uses a root node to match a
> protection domains map for a particular board. It is not possible to
> implement it as a 'driver' as there is no corresponding device.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/Kconfig          |  11 +
>   drivers/soc/qcom/Makefile         |   1 +
>   drivers/soc/qcom/pdr_internal.h   |  14 +
>   drivers/soc/qcom/qcom_pd_mapper.c | 676 ++++++++++++++++++++++++++++++++++++++
>   drivers/soc/qcom/qcom_pdr_msg.c   |  34 ++
>   5 files changed, 736 insertions(+)
> 

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

