Return-Path: <linux-arm-msm+bounces-24067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9AA915E37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 07:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18321B221C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 05:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90635145A17;
	Tue, 25 Jun 2024 05:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DRw8OwgA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CA2D600;
	Tue, 25 Jun 2024 05:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719293849; cv=none; b=f6qIJSAwjxPIP6abvUe4/VK5jjfRWUKG4jbFYX6FpnmVKT3vugTF8VbIZNELpvi3EbEFqXd0TqDvqEmjFdUUIVbO+GzfQc5mylzvyzK85rM2wGsO/2iJWGzAepazqI19LkZFQd2aIpIltVZnw1UCWwVr3E01F+3hkVYBxdD0DaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719293849; c=relaxed/simple;
	bh=cauvOpeOY7unR2tmunCYMVLbA/ysI24kHKGPp6WVlZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oeW6jbrKNKBSxGBmNdIKZtcjwxpeddPBzsBMpg8Y0wVROf/15ICASdnzr/g1ADRKGOVoBeNjREQwtCsiUH4V5ICiO9qCJuTlgPjBZQRFLaOUc+LabJDuGl+W51MOPI3NuE2EpZLVw9NKLyB84xwYR4BIiRC7wEKgLsOFMwtdB6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DRw8OwgA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OIflgE029121;
	Tue, 25 Jun 2024 05:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BexPgGDf9tJcoYbSBZCn4jDSoJkFnKshV1VCnWPxvKo=; b=DRw8OwgAEefdoy9y
	g6k7PfKR6IzZmqP3kY4/rdQCMoEQQEEVJ2tscYweeLuCx+o0lMg02sQpigCwOru1
	/mKzHa5ddOO8lPJ/QJME6Qhyb+njN97W3zQ65xuuFgYzPibxwshKBe+s4ha3xdbo
	HHCSaLSvQMYd/NPJHEM80Zj5gGfjJx7UsAHxtZaTt5HH6tJdYsWIRuY9yeI5sZb1
	kNte9BI0pfF0i1yV3TBQC8uZks4hAOX3TCbh4S9aqK4p9r2Vd56jTZdhEgQoyNBf
	GyNlPVTMopsf82JwOsVHkRHWYkQL6yaUb2NeOAWMZR3IZCcekXaJ1FNJrS8BU4mx
	fQG7Gg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywq075e2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 05:36:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P5aj55003688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 05:36:45 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 22:36:40 -0700
Message-ID: <b664d24b-79b7-4ba2-8d93-22ef481b52cd@quicinc.com>
Date: Tue, 25 Jun 2024 11:06:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] remoteproc: qcom: Add secure PIL support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <sboyd@kernel.org>, <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>, <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-3-quic_gokulsri@quicinc.com>
 <mew7kifravbescnenvstmebfxkbpwdnarmagh6v4a2hqnbrxc6@cepyqz4vgum6>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <mew7kifravbescnenvstmebfxkbpwdnarmagh6v4a2hqnbrxc6@cepyqz4vgum6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nO58bK77J79TQiWeULGJPV1f2fZrDPgO
X-Proofpoint-GUID: nO58bK77J79TQiWeULGJPV1f2fZrDPgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_02,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250042


On 6/22/2024 2:47 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 21, 2024 at 05:16:53PM GMT, Gokul Sriram Palanisamy wrote:
>> IPQ8074 uses secure PIL. Hence, adding the support for the same.
> See Documentation/process/submitting-patches.rst
   Thanks. Will add detailed description.
>> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_wcss.c | 43 +++++++++++++++++++++++++++--
>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index 366b19cbd994..e45e79d80238 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/reset.h>
>>   #include <linux/soc/qcom/mdt_loader.h>
>> +#include <linux/firmware/qcom/qcom_scm.h>
>>   #include "qcom_common.h"
>>   #include "qcom_pil_info.h"
>>   #include "qcom_q6v5.h"
>> @@ -86,6 +87,9 @@
>>   #define TCSR_WCSS_CLK_ENABLE	0x14
>>   
>>   #define MAX_HALT_REG		3
>> +
>> +#define WCNSS_PAS_ID		6
>> +
>>   enum {
>>   	WCSS_IPQ8074,
>>   	WCSS_QCS404,
>> @@ -134,6 +138,7 @@ struct q6v5_wcss {
>>   	unsigned int crash_reason_smem;
>>   	u32 version;
>>   	bool requires_force_stop;
>> +	bool need_mem_protection;
> needs
>
>>   
>>   	struct qcom_rproc_glink glink_subdev;
>>   	struct qcom_rproc_ssr ssr_subdev;
>> @@ -152,6 +157,7 @@ struct wcss_data {
>>   	int ssctl_id;
>>   	const struct rproc_ops *ops;
>>   	bool requires_force_stop;
>> +	bool need_mem_protection;
> needs
   Thanks. Will update.
>>   };
>>   
>>   static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
>> @@ -251,6 +257,15 @@ static int q6v5_wcss_start(struct rproc *rproc)
>>   
>>   	qcom_q6v5_prepare(&wcss->q6v5);
>>   
>> +	if (wcss->need_mem_protection) {
>> +		ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
>> +		if (ret) {
>> +			dev_err(wcss->dev, "wcss_reset failed\n");
>> +			return ret;
>> +		}
>> +		goto wait_for_reset;
>> +	}
> Use if/else instead of a goto.

   sure. Will update.

>
>> +
>>   	/* Release Q6 and WCSS reset */
>>   	ret = reset_control_deassert(wcss->wcss_reset);
>>   	if (ret) {
>> @@ -285,6 +300,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
>>   	if (ret)
>>   		goto wcss_q6_reset;
>>   
>> +wait_for_reset:
> This is more like wait_for_start
   yes, this looks more appropriate. Will update. Thanks.
>>   	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
>>   	if (ret == -ETIMEDOUT)
>>   		dev_err(wcss->dev, "start timed out\n");
>> @@ -718,6 +734,15 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>>   	struct q6v5_wcss *wcss = rproc->priv;
>>   	int ret;
>>   
>> +	if (wcss->need_mem_protection) {
>> +		ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
>> +		if (ret) {
>> +			dev_err(wcss->dev, "not able to shutdown\n");
>> +			return ret;
>> +		}
>> +		goto pas_done;
>> +	}
> if/else. Or abstract this to functions.
   sure. Will update appropriately.
>> +
>>   	/* WCSS powerdown */
>>   	if (wcss->requires_force_stop) {
>>   		ret = qcom_q6v5_request_stop(&wcss->q6v5, NULL);
>> @@ -742,6 +767,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>>   			return ret;
>>   	}
>>   
>> +pas_done:
>>   	clk_disable_unprepare(wcss->prng_clk);
>>   	qcom_q6v5_unprepare(&wcss->q6v5);
>>   
>> @@ -765,9 +791,15 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
>>   	struct q6v5_wcss *wcss = rproc->priv;
>>   	int ret;
>>   
>> -	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
>> -				    0, wcss->mem_region, wcss->mem_phys,
>> -				    wcss->mem_size, &wcss->mem_reloc);
>> +	if (wcss->need_mem_protection)
>> +		ret = qcom_mdt_load(wcss->dev, fw, rproc->firmware,
>> +				    WCNSS_PAS_ID, wcss->mem_region,
>> +				    wcss->mem_phys, wcss->mem_size,
>> +				    &wcss->mem_reloc);
>> +	else
>> +		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
>> +					    0, wcss->mem_region, wcss->mem_phys,
>> +					    wcss->mem_size, &wcss->mem_reloc);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1035,6 +1067,9 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>>   	if (!desc)
>>   		return -EINVAL;
>>   
>> +	if (desc->need_mem_protection && !qcom_scm_is_available())
>> +		return -EPROBE_DEFER;
>> +
>>   	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
>>   				 desc->firmware_name, sizeof(*wcss));
>>   	if (!rproc) {
>> @@ -1048,6 +1083,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>>   
>>   	wcss->version = desc->version;
>>   	wcss->requires_force_stop = desc->requires_force_stop;
>> +	wcss->need_mem_protection = desc->need_mem_protection;
>>   
>>   	ret = q6v5_wcss_init_mmio(wcss, pdev);
>>   	if (ret)
>> @@ -1111,6 +1147,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
>>   	.wcss_q6_reset_required = true,
>>   	.ops = &q6v5_wcss_ipq8074_ops,
>>   	.requires_force_stop = true,
>> +	.need_mem_protection = true,
>>   };
>>   
>>   static const struct wcss_data wcss_qcs404_res_init = {
>> -- 
>> 2.34.1
>>

