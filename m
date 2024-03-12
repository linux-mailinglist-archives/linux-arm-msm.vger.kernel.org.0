Return-Path: <linux-arm-msm+bounces-13942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B518797BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 16:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C79311F2513E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 15:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D547C6DE;
	Tue, 12 Mar 2024 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iHbyIwWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CC7C6D6;
	Tue, 12 Mar 2024 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710257854; cv=none; b=o5fGAJT1ctFlhqCeyVOeiRVPIyPeNKwQi5qnycAlcxa3DKtE6eHLSwuOWtzK87ozYNqAiFM+6QrIkCVnebj8718QjVXpMVmQ5hggIR4btuwm0236jaA2yeLyqkZpkiv+VONRI6JUuwSdFEahTPtGJxGWTlmvqAr1XZh+uUDbUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710257854; c=relaxed/simple;
	bh=I48tOnVn02qB/Zp/RWeby1BA/jlWdLW+79eCJThv88A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PRBB/z50JC2kSwiZfWv0qcQeoplW2cKX+2fsajd0CMQuom2a2ifiqx/FeROEvlm9YLucofrVJdbtNbpDPLVgTb5/Lp0kl6ddRTVAKE1L4+OVgarcSC9pm9dMRtfC1zhW0oLERyN7z66QVQAhlpikZQLtHnTt403xTOSWNEXqsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iHbyIwWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CEH1Ef027463;
	Tue, 12 Mar 2024 15:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YqqhgxdJiNA3UPZi8o10aGus/ikrez1UUAM4omXga9Q=; b=iH
	byIwWwBqD5Nigp5bQyTBYqOwjsArqbRoxZTEzKs8FZlgMnoLYkmPZWy8eUWSKhvn
	dC0nRQi60DOPVPwhAxdRLgoPEJ5f80ljg0HS8BQVg2+Ay9OU/BqTrfmIvYHoe+AS
	Z8SJOQq2ptXaVTh8GTvHh96Q5LxqvjcuSbtADxVTBwVNHjZC+z0Y/EL6LIpyPYd8
	4tcush7Xkt6WIn6UR3zuzEom8AKMUnhWSsFAiMCL6uufTnxkcjaUUjyJDoMdfwCl
	z6AEHIlfjdxDd/qIat/m6IBUO4eUtytX05tRs9Y+5zfijToj4gut3MYTuxHWILk0
	Jd9XDV2G8sRKfC0GGKoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtmewgt9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 15:37:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CFbOUI006255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 15:37:24 GMT
Received: from [10.216.47.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 08:37:20 -0700
Message-ID: <1a4e09da-b19b-4cf5-8fae-822c74cfe048@quicinc.com>
Date: Tue, 12 Mar 2024 21:07:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU
 Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>, <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robh@kernel.org>
References: <CAA8EJpoghqa5r2vc5XXdfVJy1WDBysXs4LdMybgdgqMTcEPDfA@mail.gmail.com>
 <20240307030219.92701-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20240307030219.92701-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uxjsAlAlQ4MykNjDMHHHN_No1on_f-RR
X-Proofpoint-GUID: uxjsAlAlQ4MykNjDMHHHN_No1on_f-RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=834 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120119



On 3/7/2024 8:32 AM, Chukun Pan wrote:
> Hi, Dmitry
>> I did before writing the comment. You have the only IPQ6000 case, it
>> sets  drv->versions = IPQ6000_VERSION = BIT(2) = 0x4. So, as I said,
>> you are enabling this for all IPQ6000 SoC versions, unless I miss
>> something.
> 
> Sorry, I didn't explain it clearly.
> In fact, there are some ipq6000 SoCs whose msm_id is QCOM_ID_IPQ6018.
> But the chip screen printing is ipq6000.
> OEM boot log: `CPU: IPQ6018, SoC Version: 1.0`
> For these SOCs, I tested the frequency is up to 1.5GHz.


Could you share the OEM bootloader log on both these SoCs?


> 
> Thanks,
> Chukun
> 

