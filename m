Return-Path: <linux-arm-msm+bounces-2266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3907FB979
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1644EB20F55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0DE4F610;
	Tue, 28 Nov 2023 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b/8F5y2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8981A5;
	Tue, 28 Nov 2023 03:32:24 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS5RDVp009385;
	Tue, 28 Nov 2023 11:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SEGnUrmikiwRznz3qOTJpKGnloA4dLgJgwKDt8NRKco=;
 b=b/8F5y2si+YfF9P9XVxL8ASGg2dv6ZwPjNIqZcoYzPdue1TJBaYaZLcJCr2dxqhug8dS
 Uhf0jNijoIDHsUJTxyGoyjV5d/iGcn8cb+TF2mrhJ2M549S5gE2exZZAjWvPqriIl3iG
 oqFjiGJzOQfKB5EYB+5hsj8WbhX6QW4WdIDRywLtrnJa31Tv8dzoHQGYNXpYjbY+Q45P
 /MgMmmQnn46Mmi28KCPnMm/YAfgpYoeYr9V+S2spjOlh7f8Lo4L5l9B57ZPcKx1lgzO2
 wJqfIMAwTgp8bY4QHHNOvwqnTrGEe+uxpqo7waOBqyasZEF235Di1OoeR7f+exPEGSIp Vg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un02h25bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 11:32:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASBWEc4009779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 11:32:14 GMT
Received: from [10.216.9.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 03:32:09 -0800
Message-ID: <6d7527bf-8c1a-49b5-a0cf-99a92098c971@quicinc.com>
Date: Tue, 28 Nov 2023 17:02:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
To: Johan Hovold <johan@kernel.org>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
 <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>
 <ZWCpGdJRexnk98IN@hovoldconsulting.com>
 <004ddc69-1566-4de4-b260-0fca96a9395f@quicinc.com>
 <ZWW_FOAKp95Cf9vN@hovoldconsulting.com>
 <18965bb9-7afa-4892-8b71-981ba29d2cd4@quicinc.com>
 <ZWXHrvUDnF2dMk6r@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <ZWXHrvUDnF2dMk6r@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cG1tIf1mNPlTpH-NQj9j6TjYWAEJOwHD
X-Proofpoint-ORIG-GUID: cG1tIf1mNPlTpH-NQj9j6TjYWAEJOwHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_11,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=9 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=9 mlxscore=9 phishscore=0 bulkscore=0
 mlxlogscore=100 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280091


> 
> So back to my initial proposal, with a slight modification moving
> pwr_event first (e.g. as it is not a wakeup interrupt):
> 
> qusb2-:
> 
> 	- const: pwr_event
> 	- const: qusb2_phy
> 	- const: ss_phy_irq	(optional)
> 
> qusb2:
> 
> 	- const: pwr_event
> 	- const: hs_phy_irq
> 	- const: qusb2_phy
> 	- const: ss_phy_irq	(optional)
> 
> femto-:
> 	- const: pwr_event
> 	- const: dp_hs_phy_irq
> 	- const: dm_hs_phy_irq
> 	- const: ss_phy_irq	(optional)
> 
> femto:
> 	- const: pwr_event
> 	- const: hs_phy_irq
> 	- const: dp_hs_phy_irq
> 	- const: dm_hs_phy_irq
> 	- const: ss_phy_irq	(optional)
> 
> That ss_phy_irq is optional would be expressed as minItems being one
> less than maxItems for each permutation.

I am fine with this except that "femto-" might not be required. I looked 
at 
https://lore.kernel.org/all/20231122191436.3146-1-quic_kriskura@quicinc.com/ 
and I see that all of them have hs_phy_irq.

Regards,
Krishna,

