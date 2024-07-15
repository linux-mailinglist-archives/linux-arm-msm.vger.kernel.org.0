Return-Path: <linux-arm-msm+bounces-26144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 697EC931267
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF1561F21DA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD875188CA9;
	Mon, 15 Jul 2024 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="phkSwNQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530DC188CA4;
	Mon, 15 Jul 2024 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039863; cv=none; b=gkQquvVM9JGCFgDMohxD3qeiJKV/xuHh+PkWfJQ3/nq9b9JzLS4cSP7fHeCi9WVnpXw8oXLUu6+OBNWeBkaKh94EmO9iNHzW5JObeYIvcOjRAHUDQsYB3wVB/cLPCBFg5YB0uBT1R1dSU6uet8DDKg+1URiZ+f6XgMrOGWZaccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039863; c=relaxed/simple;
	bh=OLSQHqvZeV4R8tIhm0fu9Y+vzMgcFVohlkyzO1puMD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CQWmRsgmv+2qm/pG6V+xc9NioB5BhL5FExmQmGo32XXfgRrUPmt8c3EOPE9ifZsIxqZ3tkdwdCP+kXsyBNbUdPu4aHGUHHSQHDWVGnb0sGat8UJ3NpWapJKgmKVUKZo94trZT5XbZfHCTsV1A26v+IvmLI7fNo5HG6fjn3WDP7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=phkSwNQq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FA6TcG004051;
	Mon, 15 Jul 2024 10:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUI3A/c5DggFY7R2xMmygOfupjBAxIV01/Lk3i6oUPU=; b=phkSwNQqany2JeAW
	aZ+RZy79YR9aniyRRqtue/z+xGnGRRo0ziOQPIl7c/44gTC2u8GzIg+CawOQi4Tl
	HSypZp7f/JIG6S6kElPR/1cvt0Hb7COTdFt3vL67+agATYKBzK0C+SPsgwFfpFDO
	dK32mu6mIvJcJcRDyBPDqQvngOxkUzvrqnnALbpzcmbvl9xfWsx2cqM8iQxrs/pE
	c1xdu6acGusnh3roDffNh1ncRa0pAHrnml8PBXA4e6LMbDL10Ou9fJMVa4PnLnec
	DOjseFSB4kKry8kmgBEINKfytnrdVUxyMMo2o6pTUxDJnNwdtshNgbWfykLfJcnY
	wOAVbw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bghrkqkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 10:37:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FAb9pT031246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 10:37:09 GMT
Received: from [10.216.4.154] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 03:37:02 -0700
Message-ID: <6124f9e9-3fdf-29b1-128f-c58f5ebe1424@quicinc.com>
Date: Mon, 15 Jul 2024 16:06:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
 <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
 <f4072105-e0e2-46c8-82ed-92105b43a345@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <f4072105-e0e2-46c8-82ed-92105b43a345@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FfaGW4rugQZQSdXkagZQb-Uthemh45ry
X-Proofpoint-ORIG-GUID: FfaGW4rugQZQSdXkagZQb-Uthemh45ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407150083


On 7/11/2024 3:21 PM, Bryan O'Donoghue wrote:
> On 10/07/2024 23:10, Dmitry Baryshkov wrote:
>>>> - Why is cam_cc_gdsc_clk not modelled in the clock framework?
>>>
>>> This clock is kept enabled from probe, hence not required to be 
>>> modelled
>>> explicitly.
>> Yes, I'm asking why it's kept up enabled from probe rather than via
>> clock framework?
>
> FWIW my preference is to do it as Dmitry is suggesting here.
>
> I'm not a big fan of hitting the register and leaving it as-is, would 
> much prefer to move to the model of having the CCF do it - so that for 
> example the clock appears in the /sys clock summary.
>

This clock is PoR ON clock and expected to be always enabled from HW 
perspective, we are just re-ensuring it is ON from probe. Modelling this 
clock is unnecessary, and we have been following this approach for  gdsc 
clock in all the recent chipsets, like for example sm8550 camcc.


> ---
> bod

