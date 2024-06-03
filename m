Return-Path: <linux-arm-msm+bounces-21486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D988D83E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 15:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CBC91F23047
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9F212D74E;
	Mon,  3 Jun 2024 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XsUrbzPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21384D10;
	Mon,  3 Jun 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421252; cv=none; b=eP4h4hkB+4JqlW4w6hWQ+F6D3SW7sfo6DdFOkjsTHqxTC6ZR1bxy7sfungWymnkkDzbY0BAXdEhvVvLBV1vgYfBEQioaTYWzLdGODWRhjaF+qnfCLsp0xfhwLc/YT2OfZ9zmNki5NFRLUYyicaQ1FYRq4wPKYfpx4f3Z5rVEFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421252; c=relaxed/simple;
	bh=BGLE2ydGyT5k13bf27ipsYW4dpVKD7dMZ0cNLeetX4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fu5E3r8R3iQBK3Ur13UohJkYCRckPLh+S5c6hxg42HJNuWpFCU2eDpI2sup0mkho/vb09Bmj9xMestuTcGSbM8lqKrsqQilAK6W++e7FqSaxrvd3I9HX27YHLqUo3nxA6yD4Dl5h+MnSNXDM6lwbDzFpIwuJtXFUArzSuUVNcRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XsUrbzPS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453BmK7e022589;
	Mon, 3 Jun 2024 13:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCdfILUH8bDwvIKqTVl3VJ4mtMctJXqeghKXeCn5C6g=; b=XsUrbzPSwRFV12CQ
	N21N7ePgORmvhYLYI/1ZZKkqY/vFd/BDws1DRljCClnVqp5/kKIgBud7wrlmXV57
	3kDm1/MzE7ozRlaSq0jCUm5uzCFJPV2qYgMjL4lYfozblwZ1H6WMt5KMj8FJPihR
	/UOfGuuxpxa8jSZaaZ2cEtNGm5/jLrMWOlG3whHLKMUUjx/xhkptuDqYFvobVPFK
	+N5yNm2gehWbm0+eHidSTkSms0EGSJ2b/ekeiSrrMotCElmtKkaiDTW5+UEi4TbO
	6v681rJMMbkjeZ/89Yy8fQ9JUgBV8u1AnYiu0nzsWCBf39T7pFLL9ENIew9LPvHX
	J2p6NA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw59kur3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 13:27:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453DRPjI024784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 13:27:25 GMT
Received: from [10.216.21.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 06:27:18 -0700
Message-ID: <4c0c2cfe-c287-489b-944d-c909de4fefd1@quicinc.com>
Date: Mon, 3 Jun 2024 18:57:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/8] dt-bindings: clock: qcom: Update SM8450 videocc
 header file name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-2-quic_jkona@quicinc.com>
 <921bb7cb-3630-4d08-827f-b5a9315316f9@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <921bb7cb-3630-4d08-827f-b5a9315316f9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D1Ddl5lx7nBr8Mroh-rG3E9kJPsdePCQ
X-Proofpoint-ORIG-GUID: D1Ddl5lx7nBr8Mroh-rG3E9kJPsdePCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_09,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 mlxlogscore=875 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030112



On 6/2/2024 8:54 PM, Krzysztof Kozlowski wrote:
> On 02/06/2024 13:44, Jagadeesh Kona wrote:
>> Correct the videocc header file name in SM8450 videocc bindings.
>>
>> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Where did this review happen? Can you provide lore link?
> 
> Best regards,
> Krzysztof
> 

Please find the lore link for this review:-
https://lore.kernel.org/all/e9109e46-4e72-4b3b-a995-4b2af3c31e45@linaro.org/#t

Thanks,
Jagadeesh

