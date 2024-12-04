Return-Path: <linux-arm-msm+bounces-40311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A339E4030
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D74F6B2DA61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532AD20CCC4;
	Wed,  4 Dec 2024 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pt9V/SIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808F1433C4;
	Wed,  4 Dec 2024 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733330671; cv=none; b=OFOQK6sv07s2islB+ftDmQf4LyvTCO5Gw0RzlqBl47e/X0zvY2m3qD1xsrj0YkI0vOcXbM6D2ecpYbTK50Jr8Qjh/dKqGYBSnviAk9P1M9jUXhEWU8aNpJN9KWAJnE3nZgMNPvfYJm1XU/bEDd7lGJTu0enfS8+lV+JHFQiXMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733330671; c=relaxed/simple;
	bh=2f5XonaelA3mjOVwjimASfcGBRCwJeItUFo/UzcLIs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OtY7sKxBShEdbGxTnnGoolvUG6uyxBjFHWFd8AmVx0wyseZik8a7NDB3aCfy+5NuwLbrk3ejN69Ka7rUgRqzUxHzHQ8j6splqUqMma++z3QzpnUgdFhXgFdu+rvtc23vioqoAW7dd2ADLcW6fncWzjFWRvYioJUNBtewn6Ejv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pt9V/SIM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4DwBE3031913;
	Wed, 4 Dec 2024 16:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XuEB6fL8smqpeJlR0UGp/sqUDXqOcOq79XmbRvYVL4=; b=pt9V/SIMLJjZIO/t
	g3/xAI/BnKnh270xE699DgsYWM/ILEHUuLNfEbxXFjHWZtOM6IT11Unk39/QFBmR
	42BHugfdVTm9sCXYMDdqxfs1lBtUD6yqSnI2L8WKVI1XXG1/I+cBPwLxvpvonbQq
	CwlrnOKniyH4+RLV65ftDQpZHu2KLu+etQ6CFWVYKi7xFekFUzSjb/MWoZXXR1lA
	GpOflkEi5G5VCIgMtsMqj/pnl+iO1rnDnF7uFNc0gyoJcXUXPR+PMY70xAw6KUgI
	jSIRKA4/1XmGSVMtayjXZ+xUICAjxW9vwU7aCwqO+LahdKLM1t9uaJ83HskT2Z8+
	zJ6pdQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439trbn8n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 16:44:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4GiN9l029017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 16:44:23 GMT
Received: from [10.216.58.11] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 08:44:20 -0800
Message-ID: <f9e93864-f99f-449f-affb-d513ab5476a7@quicinc.com>
Date: Wed, 4 Dec 2024 22:14:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Include missing header includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
 <20241204110348.100841-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20241204110348.100841-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jFrPrecSLt-fyMPqgXtXq-yfArBtW1kp
X-Proofpoint-ORIG-GUID: jFrPrecSLt-fyMPqgXtXq-yfArBtW1kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=673 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040127



On 12/4/2024 4:33 PM, Krzysztof Kozlowski wrote:
> Include mod_devicetable.h for the 'struct of_device_id' and
> clk-provider.h for the 'struct clk_hw'.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sc7180.c    | 1 +
>   drivers/clk/qcom/camcc-sc7280.c    | 1 +
>   drivers/clk/qcom/camcc-sdm845.c    | 1 +
>   drivers/clk/qcom/camcc-sm6350.c    | 1 +

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

-- 
Thanks & Regards,
Taniya Das.

