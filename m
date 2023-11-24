Return-Path: <linux-arm-msm+bounces-1837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 184EB7F7313
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 12:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD521C20A9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C1B200A5;
	Fri, 24 Nov 2023 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZJmvVtq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD9F1A5;
	Fri, 24 Nov 2023 03:50:09 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO8GaX3024034;
	Fri, 24 Nov 2023 11:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WioykjLZIEzmqvcqqpGNeyMQihVdBnwLtxAN4aQW36M=;
 b=ZJmvVtq0dWWzfz/PiZ/98+LmAueLy5p1oC/PJ58O5BDGCtJlW4h8P7VAwJD6M69cIy4q
 OJ15ypy40/seKHpxe2cMhMd+dM4yycLpLbhlPxicz3Z82A2n3xi2DpofUDMJP7zaJ80x
 mrYmuUU6op/22ygowItD3HD88a9cubzfFhvDExzcaQtWdZzN5m7ZUL1KRPuAJM0rvXdk
 oo49gtqZqnDgoTlcnbBWDAke/Tznl7xsc27p1rMY6ub18tV+wLbSNLTyY1VjeHLnp4t/
 bJ7y3ZhK38rjztJtYKEELWJEJVxyky23I5w/trtSWZx+F7I4ZJLXfyryfiEqPJgDyD/6 9A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ujp8x0wrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 11:49:38 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOBnb6B004975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 11:49:37 GMT
Received: from [10.253.33.181] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 24 Nov
 2023 03:49:30 -0800
Message-ID: <367c0aea-b110-4e3f-a161-59d27db11188@quicinc.com>
Date: Fri, 24 Nov 2023 19:49:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Rob Herring
	<robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Daniel Golle
	<daniel@makrotopia.org>,
        Qingfang Deng <dqfext@gmail.com>,
        SkyLake Huang
	<SkyLake.Huang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        David
 Epping <david.epping@missinglinkelectronics.com>,
        Vladimir Oltean
	<olteanv@gmail.com>,
        Harini Katakam <harini.katakam@amd.com>,
        Simon Horman
	<horms@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
References: <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
 <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
 <655fa905.df0a0220.49d9b.7afd@mx.google.com>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <655fa905.df0a0220.49d9b.7afd@mx.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jLknTLU7yaNEfTc2et0lNIX_kyygQYkY
X-Proofpoint-ORIG-GUID: jLknTLU7yaNEfTc2et0lNIX_kyygQYkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1011 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240092



On 11/24/2023 3:33 AM, Christian Marangi wrote:
> On Thu, Nov 23, 2023 at 03:57:58PM +0100, Andrew Lunn wrote:
>> On Thu, Nov 23, 2023 at 02:35:31PM +0000, Russell King (Oracle) wrote:
>>> On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
>>>>> Just to be more precise qca807x can operate in 3 different mode:
>>>>> (this is controlled by the MODE_CFG bits)
>>>>
>>>>> - QSGMII: 5 copper port
>>>>
>>>> 4 slots over QSGMII, plus the second SERDES is connected to the MAC
>>>> using SGMII/1000BaseX?
>>>>
>>>>> - PSGMII: 5 copper port
>>>>
>>>> 5 slots over QSGMII, the second SERDES is idle?
>>>>
>>>>> - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
>>>>
>>>> 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
>>>>
>>>> Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
>>>> can use the second SERDES?
>>>
>>> I think what would really help here is if there was an ascii table to
>>> describe the configurations, rather than trying to put it into words.
>>
>> Yes.
>>
>> And also for ipq4019. We need to merge these two threads of
>> conversation, since in the end they are probably the same driver, same
>> device tree etc.
>>
> 
> For everyone that missed Robert response in patch 12 let me quote him
> also here.
> 
> "
> Hi Andrew,
> I think that the description is confusing.
> QCA807x supports 3 different modes:
> 1. PSGMII (5 copper ports)
> 2. PSGMII (4 copper ports + 1 combo port)
> 3. QSGMII+SGMII
> 
> So, in case option 2 is selected then the combo port can also be used for
> 1000Base-X and 100Base-FX modules or copper and it will autodetect the
> exact media.
> This is supported via the SFP op-s and I have been using it without issues
> for a while.
> 
> I have not tested option 3 in combination with SFP to the copper
> module so I cant
> say whether that works.

For the option3, the last PHY works on SGMII mode, then it can't be
used with SFP, only copper is supported in this mode.

>  From what I can gather from the typical usage examples in the
> datasheet, this QSMII+SGMII
> mode is basically intended as a backward compatibility thing as only
> QCA SoC-s have PSGMII
> support so that you could still use SoC-s with QSGMII and SGMII support only.
> 
> So there is no way to control the SerDes-es individually, only the
> global mode can be changed via
> the Chip configuration register in the Combo port.
> 
> You can see the block diagram of this PHY in this public PDF on page 2[1].
> 
> [1] https://content.codico.com/fileadmin/media/download/datasheets/qualcomm/qualcomm_qca8075.pdf
> "
> 

