Return-Path: <linux-arm-msm+bounces-35389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2B9A9F75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C13ED283599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D353A197A8F;
	Tue, 22 Oct 2024 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lVU+EmLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D80146580;
	Tue, 22 Oct 2024 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729591237; cv=none; b=Jp10nXcgpCbcg+HKP3WTacelObtXryDgrwOEvtcbNXfrvNoaGuOtR0fhiL3vJWwScFQ35OFo+ryNNiyZX7mApBoi0CGqwX8E2/xzS0iCBzfm9ZIa7AxPaem8VYcjiwK2PYfkMt4PV8ADUeTJRmK4s+/dGsKVKdSq6j011MI4NsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729591237; c=relaxed/simple;
	bh=E/PyuqWigmmkv0b74BSfKVB++IVYH1zXU+xcp9MeEfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i82FtHuunIz7is81p+D/i+H8w+78Vf75YDj6S7IS9ZefzHssaXO+qYiSOQQlWFG87/R8yccRJHKRUe9YR63Wf9/8nDA43PGPm5G2pCm3GUBlEehjzZ0Ky+PM7//150bgX4P2OUhboZX2iQin1/0qXwHfP2awxAyk8jaCMEHYXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lVU+EmLY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M2YCv8024145;
	Tue, 22 Oct 2024 10:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViTJw+DuVNGpPUo56wn0ST7i6MXX2hfRDsBBf6zEB9M=; b=lVU+EmLY446P8JOA
	QYIxZH40hQvhQIuvQabX+DWjLC9vg5Ci5KD46jCQQW8W6pPgV/GAvKS+SRTCwmKQ
	5dpoB38Wx8Ma0gqTP4Lv81csiUZt6fyM1xV5SbBI4M7KkFJt/1ITocTNBKxehgvp
	K53m+9Ttc1s60i6XeUCsCimY2EMwszcR30pi94oMMK+YI19MYCnplyQy4t/KRu20
	UCh55m236o5g+0bGu/XhveM8vkr9T6C20ipPT6BpHa06jVz42kueOxic/risck6/
	n6/Dmjx4ZA3VepBpK4txdJPeRxIFJIP1AsNIwAfeFSZzagGp+ChoGUTugZuN6Xod
	RCPXlA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42e3cgh5wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 10:00:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MA04t9012945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 10:00:04 GMT
Received: from [10.50.13.1] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 02:59:56 -0700
Message-ID: <ba1bf2a6-76b7-4e82-b192-86de9a8b8012@quicinc.com>
Date: Tue, 22 Oct 2024 15:29:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, <netdev@vger.kernel.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacob Keller
	<jacob.e.keller@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <Zv_6mf3uYcqtHC2j@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Qid-fCyf9ps8S6kkkk1UdboHGTp5c4S
X-Proofpoint-ORIG-GUID: 7Qid-fCyf9ps8S6kkkk1UdboHGTp5c4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220064



On 10/4/2024 7:54 PM, Russell King (Oracle) wrote:
> On Thu, Oct 03, 2024 at 11:20:03PM +0530, Kiran Kumar C.S.K wrote:
>>>>          +---------+
>>>>          |  48MHZ  |
>>>>          +----+----+
>>>>               |(clock)
>>>>               v
>>>>          +----+----+
>>>>   +------| CMN PLL |
>>>>   |      +----+----+
>>>>   |           |(clock)
>>>>   |           v
>>>>   |      +----+----+           +----+----+  clock   +----+----+
>>>>   |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
>>>>   |  |   +----+----+           +----+----+          +----+----+
>>>>   |  |        |(clock & reset)      |(clock & reset)
>>>>   |  |        v                     v
>>>>   |  |   +-----------------------------+----------+----------+---------+
>>>>   |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
>>>>   |  |   |       | SCH |               +----------+          +---------+
>>>>   |  |   |       +-----+                      |               |        |
>>>>   |  |   |  +------+   +------+            +-------------------+       |
>>>>   |  |   |  |  BM  |   |  QM  |            | L2/L3 Switch Core |       |
>>>>   |  |   |  +------+   +------+            +-------------------+       |
>>>>   |  |   |                                   |                         |
>>>>   |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
>>>>   |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
>>>>   |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
>>>>   |  |   |     |         |         |         |         |         |     |
>>>>   |  |   +-----+---------+---------+---------+---------+---------+-----+
>>>>   |  |         |         |         |         |         |         |
>>>>   |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
>>>>   +--+---->|             PCS0                    | |  PCS1 | | PCS2  |
>>>>   | clock  +---+---------+---------+---------+---+ +---+---+ +---+---+
>>>>   |            |         |         |         |         |         |
>>>>   |        +---+---------+---------+---------+---+ +---+---+ +---+---+
>>>>   | clock  +----------------+                    | |       | |       |
>>>>   +------->|Clock Controller|   4-port Eth PHY   | | PHY4  | | PHY5  |
>>>>            +----------------+--------------------+ +-------+ +-------+
> ...
>>>> 3) PCS driver patch series:
>>>>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
>>>>         be enabled in drivers/net/pcs/
>>>> 	Dependent on NSS CC patch series (2).
>>>
>>> I assume this dependency is pure at runtime? So the code will build
>>> without the NSS CC patch series?
>>
>> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
>> PCS's MII channels. To represent this in the DTS, the PCS node in the
>> DTS is configured with the MII Rx/Tx clock that it consumes, using
>> macros for clocks which are exported from the NSS CC driver in a header
>> file. So, there will be a compile-time dependency for the dtbindings/DTS
>> on the NSS CC patch series. We will clearly call out this dependency in
>> the cover letter of the PCS driver. Hope that this approach is ok.
> 
> Please distinguish between the clocks that are part of the connection
> between the PCS and PHY and additional clocks.
> 
> For example, RGMII has its own clocks that are part of the RGMII
> interface. Despite DT having a way to describe clocks, these clocks
> are fundamental to the RGMII interface and are outside of the scope
> of DT to describe. Their description is implicit in the relationship
> between the PHY and network driver.
> 
> Also, the PCS itself is a subset of the network driver, and we do
> not (as far as I know) ever describe any kind of connection between
> a PCS and PHY. That would be madness when we have situations where
> the PHY can change its serdes mode, causing the MAC to switch
> between several PCS - which PCS would one associate the PHY with in
> DT when the "mux" is embedded in the ethernet driver and may be
> effectively transparent?
> 

Apologies for the delay in response. I understand that the PCS<->PHY
clocks may be out of the scope of PCS DT due to the reasons you mention.
However would like to clarify that the MII clocks referred to here, are
part of the connection between the MAC and PCS and not between PCS and PHY.

Below is a diagram that shows the sub-blocks inside the 'UNIPHY' block
of IPQ9574 which houses the PCS and the serdes, along with the clock
connectivity. The MII Rx/Tx clocks are supplied from the NSS CC, to the
GMII channels between PCS and MAC. So, it seemed appropriate to have
these clocks described as part of the PCS DT node.

              +-------+ +---------+  +-------------------------+
   -----------|CMN PLL| |  GCC    |  |   NSSCC (Divider)       |
   |25/50mhz  +----+--+ +----+----+  +--+-------+--------------+
   |clk            |         |          ^       |
   |       31.25M  |  SYS/AHB|clk  RX/TX|clk    +------------+
   |       ref clk |         |          |       |            |
   |               |         v          | MII RX|TX clk   MAC| RX/TX clk
   |            +--+---------+----------+-------+---+      +-+---------+
   |            |  |   +----------------+       |   |      | |     PPE |
   v            |  |   |     UNIPHY0            V   |      | V         |
  +-------+     |  v   |       +-----------+ (X)GMII|      |           |
  |       |     |  +---+---+   |           |--------|------|-- MAC0    |
  |       |     |  |       |   |           | (X)GMII|      |           |
  |  Quad |     |  |SerDes |   |  (X)PCS   |--------|------|-- MAC1    |
  |       +<----+  |       |   |           | (X)GMII|      |           |
  |(X)GPHY|     |  |       |   |           |--------|------|-- MAC2    |
  |       |     |  |       |   |           | (X)GMII|      |           |
  |       |     |  +-------+   |           |--------|------|-- MAC3    |
  +-------+     |              |           |        |      |           |
                |              +-----------+        |      |           |
                +-----------------------------------+      |           |
                +--+---------+----------+-------+---+      |           |
  +-------+     |            UNIPHY1                |      |           |
  |       |     |              +-----------+        |      |           |
  |(X)GPHY|     | +-------+    |           | (X)GMII|      |           |
  |       +<----+ |SerDes |    |   (X)PCS  |--------|------|- MAC4     |
  |       |     | |       |    |           |        |      |           |
  +-------+     | +-------+    |           |        |      |           |
                |              +-----------+        |      |           |
                +-----------------------------------+      |           |
                +--+--------+-----------+-------+---+      |           |
  +-------+     |           UNIPHY2                 |      |           |
  |       |     |              +-----------+        |      |           |
  |(X)GPHY|     | +-------+    |           | (X)GMII|      |           |
  |       +<----+ |SerDes |    |   (X)PCS  |--------|------|- MAC5     |
  |       |     | |       |    |           |        |      |           |
  +-------+     | +-------+    |           |        |      |           |
                |              +-----------+        |      |           |
                +-----------------------------------+      +-----------+


We had one other question on the approach used in the driver for PCS
clocks, could you please provide your comments.

As we can see from the above diagram, each serdes in the UNIPHY block
provides the clocks to the NSSCC, and the PCS block consumes the MII
Rx/Tx clocks. In our current design, the PCS/UNIPHY driver registers a
provider driver for the clocks that the serdes supplies to the NSS CC.
It also enables the MII Rx/Tx clocks which are supplied to the PCS from
the NSS CC. Would this be an acceptable design to have the PCS driver
register the clock provider driver and also consume the MII Rx/Tx
clocks? It may be worth noting that the serdes and PCS are part of the
same UNIPHY block and also share same register region.

Thank you.

