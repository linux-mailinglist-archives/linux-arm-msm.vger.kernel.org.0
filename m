Return-Path: <linux-arm-msm+bounces-26737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31792938BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6278A1C21206
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9B7167DB8;
	Mon, 22 Jul 2024 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kSZTdHNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC776182BD;
	Mon, 22 Jul 2024 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721638667; cv=none; b=crVXa6DY4oos289X9uB1+dJqlShW2xKSY6hEEXXZ8bh8rReFkORRxMfdodntrXKUtU6QCLg8+bVm/2D8pdkeiOLsNp7eCad9x8Ho6Xmz2PfeOtc656ZiRR2M6WmYvCmWOCceMcmf+UYyq2kqOG3InvobhVATnzTS5ZtBjezEPPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721638667; c=relaxed/simple;
	bh=Ynkt5jht3P7V4msgrdvDPMK/YT+rZLOmSP8colKEDIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jEx6AZBQrB77UQIPoriuBqbsxtTetStQGKwPCEjNY7EZ1IaSLYAkyD6wG6OV7l5iQrvIEaHbllpW20MGMRFnuwvuaXwezI8WGxPUjRl57fjMTDntM6b58I5zycy4Mogx7Cocwz39a+4vACnj/IkjX79rfjndxY5eeeoQaUY174s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kSZTdHNT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNfjQP022070;
	Mon, 22 Jul 2024 08:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSSTUV2TQKIAMaYLBP7gP+3fe5NiDXh0YqWbwhegPLc=; b=kSZTdHNTFkFXMZs/
	L7vpHbuHCVKRGDwSIpGgne07yxFPr9+NDfwSljtCy8h6Bmy7Ym4kDjXNrRsbsd2h
	QWj37cz6W8mXsO5xPp0Cg8mq+Fu8Cwc9kj/gLni9/aTc3uZ5cYwukiKJtSDtCUfS
	EWvZIEwWMcD74G0MMMuCQWJnmgkhRk6vI/L/chbInT07SBeGAzwEDYDojoFZbyWO
	2qZ9kqSu7k3QBRENw5Hg/kVuNCj8aeds9CLjdnz3O+GOZxVhPFJHaTQgW357sP1C
	bCB5ZkHv7pQFI4IegUmyReKCuItEFRdCkW4zqbF0mkmmvq/UGpZT3anMBvVb0JuT
	clT0KQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487b75p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:57:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M8veOl011225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 08:57:40 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 01:57:36 -0700
Message-ID: <6055cb14-de80-97bc-be23-7af8ffc89fcc@quicinc.com>
Date: Mon, 22 Jul 2024 14:27:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>
CC: <dmitry.baryshkov@linaro.org>, <stable@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
 <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
 <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
 <dd588276-8f1c-4389-7b3a-88f483b7072e@quicinc.com>
 <610efa39-e476-45ae-bd2b-3a0b8ea485dc@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <610efa39-e476-45ae-bd2b-3a0b8ea485dc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: atiBSgbYmls0h1wd6btyARUF3lNZED8I
X-Proofpoint-GUID: atiBSgbYmls0h1wd6btyARUF3lNZED8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_05,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=794
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220069


On 7/20/2024 2:03 PM, Bryan O'Donoghue wrote:
> On 19/07/2024 08:25, Satya Priya Kakitapalli (Temp) wrote:
>>>
>>> What is the use-case to keep that clock always-on unless/util 
>>> someone wants camss ?
>>>
>>
>> The clock also has dependency on MMCX rail, this rail anyway will be 
>> OFF until there is a use-case. So the clock will also be OFF.
>
> arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>
> camcc: clock-controller@ad00000 {
>     power-domains = <&rpmhpd SC8280XP_MMCX>;
> };
>
>>
>>
>>> I've tested this patch on sc8280xp and it works just fine.
>>>
>>
>> Is the cam_cc_gdsc_clk clock ON after the boot up?
>
> I have no idea. Why does it matter ?
>

This clock expected to be kept always ON, as per design, or else the 
GDSC transition form ON to OFF (vice versa) wont work.

Want to know the clock status after bootup, to understand if the clock 
got turned off during the late init. May I know exactly what you have 
tested? Did you test the camera usecases as well?


> ---
> bod

