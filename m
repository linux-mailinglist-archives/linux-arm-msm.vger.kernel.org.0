Return-Path: <linux-arm-msm+bounces-3469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F0805A46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 17:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D171C21243
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 16:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1BE56B70;
	Tue,  5 Dec 2023 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cSB2ioMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F30612C;
	Tue,  5 Dec 2023 08:48:40 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5Gipsl004962;
	Tue, 5 Dec 2023 16:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iEELI+drcZPd+0r9PZ1l4RJXQNt1AAeJOMaHk8xqoaQ=;
 b=cSB2ioMhjUkt5CVbO/r5UP6ym6H0xNR5QdF9NtBk4Oj9U1xrDegMDl0DetCW2ezumX91
 ovnlc70/iJNqKzkiyOF1MQ2F6b8Z2+VOrBLJplp00Po5BZQWXGeYTkpCdY952hL2Z8b+
 Za+bowDZEuHLXpnJiFGgZzc9Qa+SBF60mTGKNP8ginz5SST1xatVv+oRy3OQYJ4EO5a1
 DnyT71Ti07fmEKogvb+VB2SVoO9Sg3wNokvXH/BL9WvM2Ug/hARuFTmakHUnlGlfCvfM
 b2/1fK8RofeIort3k/V3oLPDL75Var10/xYoC2GXfKDXm2UT71mXv77wxPdcmV517Pso oA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usghcu6s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 16:48:22 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B5GmLwG011521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 16:48:21 GMT
Received: from [10.216.48.31] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 08:48:11 -0800
Message-ID: <0a5f769e-a474-40c6-a886-135716e90dd2@quicinc.com>
Date: Tue, 5 Dec 2023 22:18:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ support
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>,
        Andrew Halaney
	<ahalaney@redhat.com>
CC: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>, <kernel@quicinc.com>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
 <rw5vfdvre5rt4rwytfsp3qy6sgsdr3dm6oefr4sap2aqbvpw42@c2dxz42tucby>
 <zzkw5obc3z5fndowmrycy77gtjf6wscvkj7klnn34f3ycs3her@hmh5aebpbi3s>
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <zzkw5obc3z5fndowmrycy77gtjf6wscvkj7klnn34f3ycs3her@hmh5aebpbi3s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Mc9QZcB1-hKsYyPl6PdhGgV2kxS2dhsL
X-Proofpoint-GUID: Mc9QZcB1-hKsYyPl6PdhGgV2kxS2dhsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_12,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312050132

Hi @serge,
there is some more DT_CHECKER warning & need to fix that before uploading the new patch .
Will fix the warning & then will update the version ,

Thanks
Suraj

On 12/5/2023 3:35 PM, Serge Semin wrote:
> Hi Suraj
> 
> On Mon, Dec 04, 2023 at 02:16:12PM -0600, Andrew Halaney wrote:
>> On Mon, Dec 04, 2023 at 06:56:14PM +0530, Suraj Jaiswal wrote:
>>> Add support to listen Ethernet HW safery IRQ. The safety IRQ will be
>>
>> s/safery/safety/
>>
>>> triggered for ECC, DPP, FSM error.
>>>
>>> Changes since v3:
>>
>> This is listed as v3 in the subject, but it should now be v4 since the
>> last version was v3.
> 
> There are several style-type problems I would like to share. But as
> Andrew correctly noted the series version was incorrectly left
> unchanged. Please resubmit the series with the version incremented.
> I'll send my comments to that new thread so the discussion history and
> the lore archive would look cleaner. Thanks.
> 
> -Serge(y)
> 
>>
>>> - Fix DT_CHECKER warning
>>> - use name safety for the IRQ.
>>>  
>>>
>>> Suraj Jaiswal (3):
>>>   dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
>>>     sa8775p
>>>   arm64: dts: qcom: sa8775p: enable safety IRQ
>>>   net: stmmac: Add driver support for DWMAC5 safety IRQ Support
>>>
>>>  .../devicetree/bindings/net/qcom,ethqos.yaml   |  9 ++++++---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml    |  5 +++--
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi          | 10 ++++++----
>>>  drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
>>>  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
>>>  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
>>>  7 files changed, 45 insertions(+), 9 deletions(-)
>>>
>>> -- 
>>> 2.25.1
>>>
>>
>>

