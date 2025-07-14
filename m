Return-Path: <linux-arm-msm+bounces-64798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A05B03CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2563A9B2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ACF1DDC2B;
	Mon, 14 Jul 2025 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RK+GTZsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95B24466E;
	Mon, 14 Jul 2025 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752491100; cv=none; b=mAh9rBIqLNBEt2Y6W3yhdrhx2OTcECOYvstQdS7tKyaBOUH9hq5g14bruIAE4iHP6CcwduBnKxoX45ra/lA0SV2lld6YJ9DXlFeLQRHBGTuPIyJcb9Qd1TS8pD9PAXAXRgfcecn7BsWU0/py0V96KSwffC406b2+KKtfqn6D3OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752491100; c=relaxed/simple;
	bh=TAq8jWR1H6Dk7nwNylfnCyAy6GWTywF5ZgTZrrAoYVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ukbDYKZiUCzkGMMDrLXgJRhtUYdrCGt7cCa6Gv0gA6quvFP62H3Gkq5axJBXy82Yikqy7bPaiMdD28wPQN1oHLUtpmUqnO7y6TNX6Hu9MzfPatUBjqSiILxbiTrGi7ltD0N2abhJghdKg4W0gYJm/GsCj//4muRSdhGXKQxIUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RK+GTZsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9alLa007564;
	Mon, 14 Jul 2025 11:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZ9yVraLjcMb5U62q1yreyl3/qOyt2WOU1ZNpLGeVy8=; b=RK+GTZsM/pj3lPv8
	VP4iro/uk6t9cV+viMHjrfEf3aYLM/7LrGJ4uO4iKrFv8hOpX+RtNm8VD927vMwK
	B0aI/Lsztcc3l3Vorzn/i5qZsfTwUvwF2D+P/c/lJOb2+HzCkkGR32WJY9OGIIqE
	rDWyfj3hYsCUzOvQAEF1enBRICZb9+YMmF4QZiAYBF/yqx1Mp0ZIXS1ff3VAgtyP
	zRLmt6y8lC26FEwhMzOTNO8v7AR+QKgInEFmXwmy/pnO/Ox4IczGl8oSh7XebRvM
	Pobv6oErygmVtcVzEvnmuXErOduSgyApr2w+BWTOlUmKd96Vt4B0pX4mPDGyD4vc
	IROOgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmvf8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 11:04:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56EB4nKu007835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 11:04:49 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 14 Jul
 2025 04:04:43 -0700
Message-ID: <b60d3297-8267-460f-9c4c-1519c511ac36@quicinc.com>
Date: Mon, 14 Jul 2025 16:34:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
 <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
 <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bhOCkV7K9MXd5t0hyzNCDuNHTArGI11v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2NCBTYWx0ZWRfX9tawY0sOuwiS
 Nv2XRFBrVATzygrWSl1YUw1v0aD2edcX12TfpXGzjEDCjfgFd0wbrIzX9DOsygKZZS/fL0ou6eF
 HqPnS+cye2e4MJot3+mpZhOW5qZRFoRjH/voRhxKFdxnd15YpbeZEcdyNPbHvSpEDCFZY80IASc
 g48yFwRukmYJhiQxM5hqBy8Y6tRnvnpnF0cOIBa2Y9RdF3tEt6DHEUD1T+u0b33l6uynI5Ykg0i
 /3E5DeMGITExQDFpLaUOfrqNv1Rnl3gkks+gyFKkSeEozoFTC6W8oV4hNtPWPxjrXumjHRJrL2N
 /V7k1+gRnXBq5WdpdInrJo/Wz/OEa5KULPX66+NDX0KHCOwDPW8j4CwoiPzgbJ+RXCAe9lwj6Zq
 n0QGi1ZCSzsLFqS0J9lX2Q13rryxg2C9WRB2G2Lc0OGtqZ+A4m88nmqGx8swhkQiHpZWPV9N
X-Proofpoint-ORIG-GUID: bhOCkV7K9MXd5t0hyzNCDuNHTArGI11v
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6874e452 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=SgGjurSckTfw-wXoEH8A:9 a=QEXdDO2ut3YA:10
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140064



On 7/9/2025 5:18 PM, Luca Weiss wrote:
> Hi Jagadeesh,
> 
> On Tue Jul 8, 2025 at 7:34 AM CEST, Jagadeesh Kona wrote:
>>
>>
>> On 7/4/2025 12:46 PM, Luca Weiss wrote:
>>> Add support to register the rcg dfs in qcom_cc_really_probe(). This
>>> allows users to move the call from the probe function to static
>>> properties.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  drivers/clk/qcom/common.c | 8 ++++++++
>>>  drivers/clk/qcom/common.h | 2 ++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f72603b694966e216 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
>>>  			goto put_rpm;
>>>  	}
>>>  
>>> +	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
>>> +		ret = qcom_cc_register_rcg_dfs(regmap,
>>> +					       desc->dfs_rcgs,
>>> +					       desc->num_dfs_rcgs);
>>> +		if (ret)
>>> +			goto put_rpm;
>>> +	}
>>> +
>>>  	cc->rclks = rclks;
>>>  	cc->num_rclks = num_clks;
>>>  
>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac9022e608a6aad35f 100644
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
>>>  	size_t num_gdscs;
>>>  	struct clk_hw **clk_hws;
>>>  	size_t num_clk_hws;
>>> +	const struct clk_rcg_dfs_data *dfs_rcgs;
>>> +	size_t num_dfs_rcgs;
>>
>> Since all other probe configurations are added in qcom_cc_driver_data struct, it is better to
>> add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_desc.
> 
> Dmitry suggested to use struct qcom_cc_desc:
> https://lore.kernel.org/linux-arm-msm/w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow/
> 
> I personally don't have a preference.
> 

Hi Luca, 

As other probe configurations like critical clock cbcrs & pll configurations are part of driver_data, it is better
to include this DFS data also in driver_data.

Dmitry, I hope it is fine to move the above DFS data to qcom_cc_driver_data struct instead of qcom_cc_desc.

Thanks,
Jagadeesh

> Regards
> Luca
> 
>>
>> Thanks,
>> Jagadeesh
>>
>>>  	const struct qcom_icc_hws_data *icc_hws;
>>>  	size_t num_icc_hws;
>>>  	unsigned int icc_first_node_id;
>>>
> 

