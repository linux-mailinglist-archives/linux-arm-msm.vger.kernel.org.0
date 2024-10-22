Return-Path: <linux-arm-msm+bounces-35323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A36749A97F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5697F280D84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8F785656;
	Tue, 22 Oct 2024 04:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hubSYBaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6354F1F2;
	Tue, 22 Oct 2024 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729571920; cv=none; b=QHpK0PZOHPH0AvulLkLtIwJAyVJwN8XvZT5x/hQ85HvXAsZXpJVJYrsudFZkCOOnRrIBZ1eIG06DeV7dO4OjdPIWZ/mzQOjptfWuyMjuK7SdJcaDO9Lk5L3eQM6aBuEi4/n/aipw0K2NkHo3KfwiDLx4XccXlX1O7Eqv6xhUpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729571920; c=relaxed/simple;
	bh=za3YqSqD4Wfcsj/D9CW+BVvGkZaGQkM47ir4X4Chnc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XSHvk72JxvKGEl1fLuCl2JhI/uyELV3c+WjegZpTrqMsAU7Dtx9NUymGtXiXE01qGW3oPnSEVkoggVeNPGQp1v5edGmtxlZnKBE9u3PHerHToAbyM1Z0knqlPJBxHbCXjzhG6tPlDP2Vg15fwlWyeT5l5ojx33hX0Mfs6LiTICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hubSYBaz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LIE6Bj001055;
	Tue, 22 Oct 2024 04:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ve/hy7uOdV9SIh9rFk1tNdtPzkxDZdPB7C19tNaF4I=; b=hubSYBaz364uxPLd
	KP/4GbFlIQB0AW6yl0a/euzMt7sygSMFARA9jpc862cazoJzQyg1U7cSLEm/PP9h
	oUUz8AmPJspdoRUBJ1pXa5qjWANHOrJoq2p6zvQU4x1Ta6STMJSS32BcquSmYJHC
	hc7kYGmjA3kxlb+k93boE0At8TvbJKCDI3bXIbsvYABbXHYZOJkb0IARKs7gWOKw
	+Q8LLl4IqhQHlz/u70nCiU5DNUz5h3qfrte4lVMaB5sfvgaZtq76iSpLxgRfTq/Q
	cRmGwnOz8CH+Ch6ts8ejuzZyMat/w+p0QPWMB0xmjAsJJw13w4l1cqOR5WODLwoo
	hnxbsQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj12udm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:38:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M4cXGU006789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 04:38:33 GMT
Received: from [10.216.44.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 21:38:28 -0700
Message-ID: <af978f3e-31a8-46ff-9513-92cca96063a3@quicinc.com>
Date: Tue, 22 Oct 2024 10:08:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: Add support for Video Clock Controller on
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-6-859095e0776c@quicinc.com>
 <2wahtcgpz7juse325f6vp5od75pwrwyl5v3c2ln2xa64qzpvid@f43c7uxx34r6>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <2wahtcgpz7juse325f6vp5od75pwrwyl5v3c2ln2xa64qzpvid@f43c7uxx34r6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3XZIkn0qZ_bQoKo9gjg8bDBOoNXgyRuk
X-Proofpoint-ORIG-GUID: 3XZIkn0qZ_bQoKo9gjg8bDBOoNXgyRuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220029



On 10/18/2024 5:38 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 04:42:34PM +0530, Imran Shaik wrote:
>> Add support to the QCS8300 Video clock controller by extending
>> the SA8775P Video clock controller, which is mostly identical
>> but QCS8300 has minor difference.
>>
>> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
>> ---
>>   drivers/clk/qcom/videocc-sa8775p.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
>> index bf5de411fd5d..d0494ba81f5f 100644
>> --- a/drivers/clk/qcom/videocc-sa8775p.c
>> +++ b/drivers/clk/qcom/videocc-sa8775p.c
>> @@ -524,6 +524,7 @@ static struct qcom_cc_desc video_cc_sa8775p_desc = {
>>   
>>   static const struct of_device_id video_cc_sa8775p_match_table[] = {
>>   	{ .compatible = "qcom,sa8775p-videocc" },
>> +	{ .compatible = "qcom,qcs8300-videocc" },
> 
> Sorted, please.
> 

Sure, I will fix this in next patch series.

>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, video_cc_sa8775p_match_table);
>> @@ -550,6 +551,9 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
>>   	clk_lucid_evo_pll_configure(&video_pll0, regmap, &video_pll0_config);
>>   	clk_lucid_evo_pll_configure(&video_pll1, regmap, &video_pll1_config);
>>   
> 
> Comment?
> 

Sure, I will update the comment details for qcs8300-videocc in next 
patch series.

Thanks,
Imran

>> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
>> +		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
>> +
>>   	/* Keep some clocks always enabled */
>>   	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
>>   	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
>>
>> -- 
>> 2.25.1
>>
> 


