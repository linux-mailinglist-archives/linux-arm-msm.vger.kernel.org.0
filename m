Return-Path: <linux-arm-msm+bounces-22164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B6901DBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93E2B1C22B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F032139D15;
	Mon, 10 Jun 2024 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oMfrJh05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F51274065;
	Mon, 10 Jun 2024 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010021; cv=none; b=ngUf3Xtd/YLXwUI1wY1zkX5filK7FQt7wqJyEbldMsZ4YbSiPTnUiJOIMAdAOF9NBUt9zx8g7Hu2sYr6RWlV7U+3FxNb+BKZ+HvrJ5yFklgoJFpzyJ0mBhuXaMV/RiFIRT10+SSDuJNHsowc6NI8lga88PsF04MShUu3ERi4/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010021; c=relaxed/simple;
	bh=oq1lmp+TS4rl0sT8ll0zVvKfpehfL1PdYkWAiaFkI50=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fCLAqNQbxinWOSycVummlScA3J4ZcjLWpU7MUecZlEbSru+p9383DIlMj8uXs+gVoPEofdS5OpGHNA2FAzMsSaWUsGc17oeiJM0eJiojWqynchzhvDK85omSEncdn/3WIZBnZav+SI4G22vigs9WC5VeV9AVVnTkw74LEJudSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oMfrJh05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A5Op44000827;
	Mon, 10 Jun 2024 09:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Sz35LkHFlkE2gLj2f+MMUzQwI1DUsoCNHbaVlSevaI=; b=oMfrJh05uL/EEDxh
	q4l/cKrCWQhofY2uUQmDqjxXlYIZ7e/PFwLYsXSWneQzpDu65D/CelfFCJAA0Jxh
	hXWsto0jj6geYgn01h/uva6OhLzPG8zo7HrnCcd+Z7PrJlIfM7Mah5Gxsl70WQJF
	xgQOqLTBT51cPt1CBFoXxZglBJorCVHP1lvBuTtybhFQJ4WTXSewoCw+xU7nlNGV
	dATkq2lbuCCQgEiLMlltWe1Pwx8ZU7C/zBA0hLC/a3q+ndpVX/lyPGYI78vwaUjH
	POHleWnT6bSxc3IjaiH/XQcKt8FwB2aICHPeYCjZiTA2t+HQP+jRnDonP2adrXru
	74TAdg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfcv302t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:00:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A90FW5014728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:00:15 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:00:10 -0700
Message-ID: <c5cbfc25-3d86-432f-b054-440d972f8c6f@quicinc.com>
Date: Mon, 10 Jun 2024 14:30:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
 gcc_ufs_phy_ice_core_clk
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-4-quic_tdas@quicinc.com>
 <d1ce852d-bd40-4d1f-9983-cb6706a6878a@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d1ce852d-bd40-4d1f-9983-cb6706a6878a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1dR9YJrlRis1qNe2-qUB7C7tX_hUuDVw
X-Proofpoint-GUID: 1dR9YJrlRis1qNe2-qUB7C7tX_hUuDVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100068



On 5/31/2024 3:27 PM, Krzysztof Kozlowski wrote:
> On 31/05/2024 11:02, Taniya Das wrote:
>> Set FORCE_MEM_CORE_ON bit for gcc_ufs_phy_ice_core_clk.
> 
> Why?
> 

Yes, my bad I didn't update the commit text for this series.
Force mem core bit for UFS ICE clock is required to retain the logic in 
memories of the subsystem across power states. Will update the commit 
text with these details in next series.

>>
>> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
> 
> What bug are you fixing?
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

