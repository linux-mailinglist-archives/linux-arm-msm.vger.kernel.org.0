Return-Path: <linux-arm-msm+bounces-47867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8930A339B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F02341887900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D181A20B20B;
	Thu, 13 Feb 2025 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HRi1o3Hw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012C20AF82;
	Thu, 13 Feb 2025 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434221; cv=none; b=Yf5qXEbvzRyWMNJ4Xh9suObVVKWz3Q0O/kNZyaeGs+cAEmFdQQZKy8x/2KFFqzr7j2nCB2nurWKg6Y4IgcIgL0CT4/h/7oyvfCnPkC5GfuZvs4XmWkeX/oHtdjJp0Lg7TapBcNzUJtc9e/Q6+XdiNtOszdm7S7vGcxyhpaKIYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434221; c=relaxed/simple;
	bh=7DHVYrB1piNwVc4gJVmBnpK+nOIN57XoDX+W+G6P7gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WHOP8UICbGnvCWWqRi9esuOg3J2m/7Uwq9FRdj3CcKIaEXfLW0igxfvqoeqe8t+72Id1MkOXLczwD4OC0UHlaf9bHjCqkIs6YolvbYMr8uXVG7kkfejcfjpGJMreir4f4vwDmoVJ6l/P+TIGL9+jyThFSqY9DIyo+FCDIz/Ukl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HRi1o3Hw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CLRYi7013725;
	Thu, 13 Feb 2025 08:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y864eHeHSAEv/3coz6iIkCoZUwrDr88ZpoAZMvN/W7w=; b=HRi1o3HwkxhHD4dH
	cqQqd8ciqbN7cvXULBAjLukH6QSnz4wbe8u9vmrvz35awi6UWHs6cjqdgBG8y7QT
	NS1sEmTkK2uWMapxZzm2u0k6UT18wzACiB+5FMvbEZH+Ihf0juoU7fCM5MHOPqiu
	6yNVUCy+O+L7DVMO24/7AGEXg6WaXXlB6fJMhCK/XDYUqJTGpYKITKbeXWZWUzGU
	WmA0obwr6FVKNE2cE8CmOivKmjv5c2U1qis1IQf5pRG70vab3ZRHULb0KL/3Jz4V
	3DIf5YUTWGC+w6HRc/aZs07pOeHhLnf5kJi6Wx9LWb0cCuzLtyFYPU/EJ9w26XKm
	+p0uDg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rsd7tyyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:10:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D8AADi015183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:10:10 GMT
Received: from [10.239.28.138] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 00:10:07 -0800
Message-ID: <5bbd6b38-5c8d-65b2-f910-b125519bd037@quicinc.com>
Date: Thu, 13 Feb 2025 16:09:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/2] phy: qcom: pcie: Determine has_nocsr_reset
 dynamically
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <abel.vesa@linaro.org>, <quic_qianyu@quicinc.com>,
        <neil.armstrong@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <quic_devipriy@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
 <20250211094231.1813558-2-quic_wenbyao@quicinc.com>
 <6c38b6e028858662aa5d45f4a14b993860b73cc0.camel@pengutronix.de>
 <93f1f01e-e6b4-4dc2-9485-aba168c6d88c@oss.qualcomm.com>
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <93f1f01e-e6b4-4dc2-9485-aba168c6d88c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3mvR0qXlMqjg2uBt2sDeiqHdIXHJTI6Y
X-Proofpoint-GUID: 3mvR0qXlMqjg2uBt2sDeiqHdIXHJTI6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_03,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130061

On 2/12/2025 8:31 PM, Konrad Dybcio wrote:
> On 11.02.2025 10:53 AM, Philipp Zabel wrote:
>> On Di, 2025-02-11 at 17:42 +0800, Wenbin Yao wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Decide the in-driver logic based on whether the nocsr reset is present
>>> and defer checking the appropriateness of that to dt-bindings to save
>>> on boilerplate.
>>>
>>> Reset controller APIs are fine consuming a nullptr, so no additional
>>> checks are necessary there.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
> [...]
>
>>>   static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
>>> @@ -4203,11 +4196,14 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
>>>   	if (ret)
>>>   		return dev_err_probe(dev, ret, "failed to get resets\n");
>>>   
>>> -	if (cfg->has_nocsr_reset) {
>>> -		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
>>> -		if (IS_ERR(qmp->nocsr_reset))
>>> +	qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
>>> +	if (IS_ERR(qmp->nocsr_reset)) {
>>> +		if (PTR_ERR(qmp->nocsr_reset) == -ENOENT ||
>>> +		    PTR_ERR(qmp->nocsr_reset) == -EINVAL)
>> Why is -EINVAL ignored here?
> If the NOCSR (partial) reset is missing, we can still assert the "full" reset
> and program the hardware from the ground up. It's also needed for backwards
> dt compat as not all platforms described it when originally added.

Seems like we really can't ignore -EINVAL. If no_csr reset is missing in
dts, it will return -ENOENT, which is turned into NULL by
devm_reset_control_get_optional_exclusive. -EINVAL indicates something
wrong in args we passed to the function and the reset property that need to
be fixed.

>
>> Without this you could just use
>> devm_reset_control_get_optional_exclusive(), which already turns -
>> ENOENT into NULL. That seems to me the correct thing to do, as from
>> driver point-of-view, this reset control is optional.
> Good point, I forgot _optional_ was a thing in the reset framework
>
> Konrad

Will use devm_reset_control_get_optional_exclusive function in patch v3.

-- 
With best wishes
Wenbin

