Return-Path: <linux-arm-msm+bounces-52427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C9A6EAAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4FDC7A20DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 07:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CB425291D;
	Tue, 25 Mar 2025 07:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lZp1wMYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0292040A7;
	Tue, 25 Mar 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888291; cv=none; b=rQ6UQ3Pb9JSw7xdBLyJgrrTqDjWXSR0316zn/rqANsW2/tTq9+PMUVuZkiVHjoM3rd500Lgvnz8iCPOzhnuen/SLwP4Y01S2IiVk7npBGWWRiQ4QxzbekYO7pq98xp6lJHGr1h38lzls0mwkrV18DhIAQ2lz5GqJa58olVZge+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888291; c=relaxed/simple;
	bh=cA/rKW5GtyQ1bvoG37/sZRFSGtJ72OefmBegC5mtbGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C1bza69q7zlX049vyjSjPn1KRXBSdJJzf5f6uJiYJ1DRgNYGZEsAApAA2IbGw0CJcWlIhQsbMI0Ljs2PxX1F8Hgs40IcIDePnc/SYh2mMIvXZpVimjYtkuM7VmtuSglmiy0vfosjZusChb3I4sVzPHM4Ig6cRXvtpnLMfxjJOB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lZp1wMYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vVpH022513;
	Tue, 25 Mar 2025 07:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OMow6D8ixjOPzePi5u4aOLZ4okP7AbJZA1FrFIgLn3E=; b=lZp1wMYMdwr/CfJP
	272cJFxeKYDsosa2Yp7lAmte/hlZFWyjO+WEoRii/eLBm2Ibets556znOfiYI+MD
	E53+TD3JwlwcQ79ijBJEzV4xcKyWdy8maUNiFfF7vgX/miEQG6BvwGuZFg/3oK4Q
	3JQ7vpI6q74KSmJF+z9TJyskfIKmkDLC4HvbMt3ufOSaghvUN1uQwAJMNk4KrTzN
	g1k85qeqUVQDECOu9Rc/bQV3NP68rt6xwrMz9tUXDi+A0fLcXV+rWePUCmeHQ2dx
	yqvZhtKMVRFLTzQCa5l6nyeHCJuW45R7c5QDnigAhpwB1jyot4DVCb6sZhvaaaS9
	xzP3+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmt06un2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 07:37:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P7bg0e024222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 07:37:42 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 00:37:35 -0700
Message-ID: <7b08c860-e5f1-4665-8e5e-2a6a3e26a2fa@quicinc.com>
Date: Tue, 25 Mar 2025 13:07:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] phy: qcom-qmp-ufs: Add PHY Configuration support
 for sm8750
To: <neil.armstrong@linaro.org>, Melody Olvera <quic_molvera@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Manish Pandey <quic_mapa@quicinc.com>,
        "Linux
 regressions mailing list" <regressions@lists.linux.dev>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
 <20250310-sm8750_ufs_master-v2-2-0dfdd6823161@quicinc.com>
 <1526d8a4-9606-4fb3-bb86-79bd8eb8a789@linaro.org>
 <430ed11c-0490-45be-897b-27cad9682371@quicinc.com>
 <731f1ad1-8979-49a1-b168-56e24b94f4fb@linaro.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <731f1ad1-8979-49a1-b168-56e24b94f4fb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PMrtWukH1iiwMdKyachegeb5fb3oeXVh
X-Proofpoint-ORIG-GUID: PMrtWukH1iiwMdKyachegeb5fb3oeXVh
X-Authority-Analysis: v=2.4 cv=aqGyCTZV c=1 sm=1 tr=0 ts=67e25d47 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=nFbOSJeC2IPyvr0jA-0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250052



On 3/25/2025 1:04 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 25/03/2025 04:12, Nitin Rawat wrote:
>>
>>
>> On 3/24/2025 11:40 PM, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 10/03/2025 22:12, Melody Olvera wrote:
>>>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>
>>>> Add SM8750 specific register layout and table configs. The serdes
>>>> TX RX register offset has changed for SM8750 and hence keep UFS
>>>> specific serdes offsets in a dedicated header file.
>>>>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
>>>> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   7 +
>>>>   .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h    |  67 ++++++++
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 180 +++++++++ 
>>>> ++ +++++++++-
>>>>   3 files changed, 246 insertions(+), 8 deletions(-)
>>>>
>>>
>>> <snip>
>>>
>>> This change breaks UFS on the SM8550-HDK:
>>>
>>> [    7.418161] qcom-qmp-ufs-phy 1d80000.phy: phy initialization 
>>> timed-out
>>> [    7.427021] phy phy-1d80000.phy.0: phy poweron failed --> -110
>>> [    7.493514] ufshcd-qcom 1d84000.ufshc: Enabling the controller failed
>>> ...
>>
>> Hi Neil,
>>
>> Thanks for testing and reporting.
>> I did tested this patch on SM8750 MTP, SM8750 QRD, SM8650 MTP, SM8550 
>> MTP and SM8850 QRD all of these have rate B and hence no issue.
>>
>> Unfortunately only SM8550 HDK platform which UFS4.0 and RateA couldn't 
>> get tested. As we know SM8550 with gear 5 only support rate A.
>>
>> I was applying rate B setting without checking for mode type. Since
>> SM8550 is only platform which support only rate A with UFS4.0 . Hence
>> this could be the issue.
>>
>> Meanwhile can you help test at your end with below change and let me 
>> if it resolves for you. I will also try at my end to test as well.
>>
>> =============================================================================
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/ 
>> qualcomm/phy-qcom-qmp-ufs.c
>> index 45b3b792696e..b33e2e2b5014 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1754,7 +1754,8 @@ static void qmp_ufs_init_registers(struct 
>> qmp_ufs *qmp, const struct qmp_phy_cfg
>>                  qmp_ufs_init_all(qmp, &cfg->tbls_hs_overlay[i]);
>>          }
>>
>> -       qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>> +       if (qmp->mode == PHY_MODE_UFS_HS_B)
>> +               qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>   }
>>
>> =================================================================================
> 
> With this change the UFS works again.

Thanks Neil for quick revert. I'll raise the official change.

Regards,
nitin

> 
> Thanks,
> Neil
> 
>>
>>
>> Thanks,
>> Nitin
>>
>>>
>>> GIT bisect points to:
>>> b02cc9a176793b207e959701af1ec26222093b05 is the first bad commit
>>> Author: Nitin Rawat <quic_nitirawa@quicinc.com>
>>> Date:   Mon Mar 10 14:12:30 2025 -0700
>>>
>>>      phy: qcom-qmp-ufs: Add PHY Configuration support for sm8750
>>>
>>> bisect log:
>>> git bisect start 'ff7f9b199e3f' 'v6.14-rc1'
>>> git bisect good 36c18c562846300d4e59f1a65008800b787f4fe4
>>> git bisect good 85cf0293c3a75726e7bc54d3efdc5dc783debc07
>>> git bisect good b2cd73e18cec75f917d14b9188f82a2fdef64ebe
>>> git bisect bad b247639d33ad16ea76797268fd0eef08d8027dfd
>>> git bisect good 9b3f2dfdad1cc0ab90a0fa371c8cbee08b2446e3
>>> git bisect bad 8dc30c3e4cf8c4e370cf08bd09eb87b0deccd3de
>>> git bisect bad 100aeb03a437f30300894091627e4406605ee3cb
>>> git bisect bad b2a1a2ae7818c9d8da12bf7b1983c8b9f5fb712b
>>> git bisect good 8f831f272b4c89aa13b45bd010c2c18ad97a3f1b
>>> git bisect good e45cc62c23428eefbae18a9b4d88d10749741bdd
>>> git bisect bad ebf198f17b5ac967db6256f4083bbcbdcc2a3100
>>> git bisect good 12185bc38f7667b1d895b2165a8a47335a4cf31b
>>> git bisect bad e46e59b77a9e6f322ef1ad08a8874211f389cf47
>>> git bisect bad b02cc9a176793b207e959701af1ec26222093b05
>>>
>>> CI run: https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba- 
>>> tester/-/jobs/229880#L1281
>>>
>>> #regzbot introduced: b02cc9a17679
>>>
>>> Neil
>>
> 


