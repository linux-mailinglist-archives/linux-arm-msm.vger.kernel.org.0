Return-Path: <linux-arm-msm+bounces-37566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 828449C5117
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42C302835B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C837420C01C;
	Tue, 12 Nov 2024 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MnZSFvts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E820DD46;
	Tue, 12 Nov 2024 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731401151; cv=none; b=cRBaijq4B0wsj8Fv+k7J97/ukZmsKjH+uWjTLloX1N8vyFFdIOxltVxrrhqpyl6fedFYhtRHWiupD9BFxSnUBd0zILtqgKod5xD2YUReyUeiyY89VaQWs3uO3N3GCflc6GUaoVDN2hpTFEA8jdUq1Kzg5cSs1ssEWwxpwnrK/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731401151; c=relaxed/simple;
	bh=uDAGSQXAl4RyThWZstFF+HdLRWA2cofSdWvYJ4UhEHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vn2zU/1VyHEt3EZGhLAwuCBaM6HdLy/aPnu/a5tfdiLeqDwAmYgredqG+1Zj8W0ydgyGWuTSmXqxR7ZlUR0rHyUnFoMf2MvVr8sjBf90BU/TBJsxL/LPJk0vSLaAkfGmdp6OFQ/Mm2YWjhv4xZcvju6myGZOpH/DvbwAj0X6K80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MnZSFvts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC7imq2022161;
	Tue, 12 Nov 2024 08:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3Kx6A+HxO0PSsyRbb6sZh4Cj7WhwVYvP1jvwzlaQPo=; b=MnZSFvtsrDSXZ7km
	4Aa7TFCUupI/zlza8UxquoA3drr0ZKqL/vHvtLJwLKS1y7rr5KySAqAU3MUWKNtu
	b6xa+GSPxCVYkO3jLrlRuSFNBKcQUuE+sSRLlgNKoZSCEbwAWxBE9JsmZaJzOosX
	71GT+d1aiWyP2opmqoEVY8owRXqtdFd6A8TVAXDvONPIPTa3FtvAi2vKKyfgLqef
	uM+mZL1WC3InQV0IG5PfdNhuhI+ajCPNgCkJpfFFeHtU/pOpW8ySWCSuwcYkCHjM
	/Me7IyjzZFZtYJtJ8KxvU8KrOMoO5RtVdUWwAm+KtxCUjyzCXEHCUtUmlRSrFU5o
	FQmnhw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc60b9yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 08:45:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC8jglg015679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 08:45:42 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 00:45:38 -0800
Message-ID: <9297bd0e-f972-41fb-82ab-a4428a64135b@quicinc.com>
Date: Tue, 12 Nov 2024 14:15:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: remove unused data from gcc-ipq5424.c
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann
	<arnd@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Manikanta Mylavarapu
	<quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241111103258.3336183-1-arnd@kernel.org>
 <r2se3v53h7pnx527bgsswpkjhkqx2csrwlxpzai7l6lanbjjty@e4nljcvgors3>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <r2se3v53h7pnx527bgsswpkjhkqx2csrwlxpzai7l6lanbjjty@e4nljcvgors3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RGwt30XiaRFeSePHvkwoFPjpyTH2omO0
X-Proofpoint-ORIG-GUID: RGwt30XiaRFeSePHvkwoFPjpyTH2omO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=926 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120070

Hi Arnd,

On 11/11/2024 6:11 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 11:32:51AM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The newly added driver causes a warnings when enabling -Wunused-const-variables:
>>
>> drivers/clk/qcom/gcc-ipq5424.c:1064:30: error: 'ftbl_gcc_q6_axi_clk_src' defined but not used [-Werror=unused-const-variable=]
>>   1064 | static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
>>        |                              ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-ipq5424.c:957:30: error: 'ftbl_gcc_qpic_clk_src' defined but not used [-Werror=unused-const-variable=]
>>    957 | static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
>>        |                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-ipq5424.c:497:30: error: 'ftbl_gcc_qupv3_2x_core_clk_src' defined but not used [-Werror=unused-const-variable=]
>>    497 | static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
>>        |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> In order to hopefully enable this warning by default in the future,
>> remove the data for now. If it gets used in the future, it can
>> trivially get added back.
>>
>> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/clk/qcom/gcc-ipq5424.c | 18 ------------------
>>   1 file changed, 18 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

I already posted a patch here for fixing this [1]

[1] 
https://lore.kernel.org/lkml/xvkvhu3qvlsjnlkiinbm6wguttpozyvlyy5mbbjcpg7vnhrp7w@trjvrm2zpylk/

Regards,
  Sricharan

