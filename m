Return-Path: <linux-arm-msm+bounces-19710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F88C28B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B19251F21180
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 16:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4FC17556D;
	Fri, 10 May 2024 16:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O5ocVbBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C06174EF3;
	Fri, 10 May 2024 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715358355; cv=none; b=IXd04HtKpEPnuK4wQS5S68WRTlwXWy4uJC2cLBcZLyj/S8X5xA/9JdIaUBy3NVNjn8XJaNAArrUCnKb3Z8GkrOsB6VuFrmr9HAJll83f25s/S8dWDDJ3chsdu3CqCtW2FZgcVJ2kh7GHJSIJEq7zii+hH+dG9mpx/UOQBDBhhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715358355; c=relaxed/simple;
	bh=0Q07Odd3y+t4wAzGOPyRX38Uvk3uimk5F2XxDAfgMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WorznTTXSe+lSuVt/4ImWSG6zTMl6anLd74vY+Hun7hL+uaRd/wRfSnD5GVPSU8MATREkBDzgtegzcqQp+QYZbte4zFoEjcBmAgf5I2eHZW6r/YlnHT0K1xuO8XNxnfvaQ9yUPb8ikSCOBB3P8LDoIoD6MJAhG+vVhphsOfXtGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O5ocVbBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADKuMX028302;
	Fri, 10 May 2024 16:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=kiiBO0sNrgVZAN/cV8grFZwEXi4MRNC8Hf5cpfM1SPk=; b=O5
	ocVbBUe69+zH6Jv3ISFCG1r/serXG6pqoXdSBpE3156LHDSD7OkCVTetjpZiqbtL
	Mhkr7rIrwP3kD7DOaM/hYcohOXglnHgSpS6k7iqK6FQ2ifGKI3amwywMXRJU/MBb
	xT6CeqWyuRz32drIkfoIREaXi8MSWsfINqd/WG6Jk2L37XgIsN0OrA006LrB4P+g
	hfoHpv6rmxdydSOukTQOwrRd39ZjsvddiEeGDdFOX99wawTf22TdKtaq9c2XrNh5
	hoptfov+AMzqBjytqwri5Qs48MPYiDSb73Z0+oNHTwDrrF88D+y92cOSxQuAgs8n
	U91WVFx5MJ0aPWcsN16Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0t15v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 16:25:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AGPeXB021519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 16:25:40 GMT
Received: from [10.216.44.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 09:25:35 -0700
Message-ID: <21cedacd-f454-4eb8-9b2b-33a14592a6c1@quicinc.com>
Date: Fri, 10 May 2024 21:55:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from
 Stromer pll configs
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Gabor Juhos <j4g8y7@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Varadarajan Narayanan
	<quic_varada@quicinc.com>,
        Gokul Sriram Palanisamy
	<quic_gokulsri@quicinc.com>
References: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
 <baa81202-f129-4ec2-baca-6ca8b476a37d@linaro.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <baa81202-f129-4ec2-baca-6ca8b476a37d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mugNdDju9wveCC9R1YfeAOOsRGr6nTNa
X-Proofpoint-ORIG-GUID: mugNdDju9wveCC9R1YfeAOOsRGr6nTNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=668 clxscore=1011 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100119



On 5/10/2024 12:23 AM, Konrad Dybcio wrote:
> On 9.05.2024 10:08 AM, Gabor Juhos wrote:
>> Since the CONFIG_CTL register is only 32 bits wide in the Stromer
>> and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
>> IPQ5018 and IPQ5332 configurations are not used so remove those.
>>
>> No functional changes.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
> 
> Hm, it sounds suspicious that we'd have these settings then.. Could somebody from
> QC please confirm that everything's alright here?


I checked the HW doc and yes in both IPQ5018 and IPQ5332 CONFIG_CTL_U 
register is not implemented. I see offset of CONFIG_CTL_U register is 
removed in the change[1] by Gabor.

Given that, should we also drop the pll_has_64bit_config() if block from 
clk_stromer_pll_configure function?

Nevertheless, for this patch

Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4f2bc4acbb19

> 
> Konrad

