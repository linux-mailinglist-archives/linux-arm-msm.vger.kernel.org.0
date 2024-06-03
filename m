Return-Path: <linux-arm-msm+bounces-21476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE36F8D8133
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 13:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B0ABB23F53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B044584A34;
	Mon,  3 Jun 2024 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GJW63uya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FECB84A23;
	Mon,  3 Jun 2024 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717414075; cv=none; b=KCXabN11sJpMo3zmMa+wTvxWMH1dZyagrZ2LUNIS+TqrI3FvYhsJBIIvnPPIA9ZcAYUd26ilURlIeDS8WV7bw9apQIDXsovBL06o1hmJiH5Z7QWBi2tTALWRbsb691rTJDEkc4qa9WOH+7iPJXzfrNEA8n7zqnxsfUNjJc9soQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717414075; c=relaxed/simple;
	bh=kUTQmeXZ9JnfFH7l8tLPGSFoIQ1XtIy3E+4CIkRnQRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mQujJSDBmT2jmUpybbXDCXGjw1OfzM6j1sSC3erGyosHKMiGR15a03xB+XbZaTpKG0ys508tZDM1orRFn/wcoP7ILQ0epMdqf1CZkUy6fNRd6aJjlQwBNJqBJvO5qWNJyeILo97mXrlwjA5E35vQvG0yWwo7sQE7tiwP3e1eOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GJW63uya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4539iu4O031125;
	Mon, 3 Jun 2024 11:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOksZSJ5PozHDIJoVWdlMTf6jW6RoBLoVXN1Y8S/oII=; b=GJW63uyaQBHZzyEf
	J5lu4ervzIqtP58piB/ifoOU/b0sgRdKdYW/12oXSPHwLMea0CKGKmB75y1mv2fz
	jjgYe/HLuhwpqMBrmGx87Q6UwA1fsG9ZK9IGXd7nrIybRW1WO6+TZHO5mI5w2ZEp
	sUwHOQpjSRCe6GX3g2s6loyptFx5VKFt9GOQ3rmMLFRAuSF6CHlQaTKdme0HdVkI
	CAy2hh/SlSFkqmF+o2eV+4g2zM/moetQalUNwY+x5wrI3jZKnXGYsKG1KoJ4ogkm
	MMXiUa5eAZ1OdrVjmA32Uuaw86MauSIkIOqMKqy5QCa0ahgo31/kikDd1P5procz
	MCNRgA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6v3x8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 11:27:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453BRRMc032665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 11:27:27 GMT
Received: from [10.217.90.34] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 04:27:19 -0700
Message-ID: <0ef00c92-b88f-48df-b9ba-2973c62285af@quicinc.com>
Date: Mon, 3 Jun 2024 16:57:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add support for
 2.5G SGMII
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
 <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
 <ZleLb+dtJ8Uspq4S@shell.armlinux.org.uk>
Content-Language: en-US
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <ZleLb+dtJ8Uspq4S@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jqtoM667x7WK9C9nDRZQZsjynG8xdZXN
X-Proofpoint-ORIG-GUID: jqtoM667x7WK9C9nDRZQZsjynG8xdZXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030096



On 5/30/2024 1:39 AM, Russell King (Oracle) wrote:
> On Wed, May 29, 2024 at 07:43:15PM +0530, Sneh Shah wrote:
>> In this version of qualcomm ethernet, PCS is not an independent HW
>> block. It is integrated to MAC block itself. It has very limited
>> configuration.Here PCS doesn't have it's own link speed/duplex
>> capabities. Hence we are bypassing all this PCS related functionalities.
> 
> I want to concentrate on this part first - we'll address the 2.5G
> issues separately once I've got a picture of this hardware (and thus
> can work out what needs to change in my phylink_pcs implementation to
> support the standard Cisco SGMII speeds.
> 
> From what I understand you're saying, your integrated PCS is different
> from the DesignWare integrated PCS?
It's an inbuilt PCS block within designware ETHQoS core.
> 
> Which core does it use? dwmac4_core.c or dwmac1000_core.c, or some
> other? Not knowing which core makes asking the following questions
> harder, since I'm having to double them up to cover both cores with
> their different definitions.

it is dwmac4 core with 0xe0 offset.
> 
> Does it only present its status via the GMAC_PHYIF_CONTROL_STATUS or
> GMAC_RGSMIIIS register?

It is present via GMAC_PHYIF_CONTROL_STATUS.
> 
> From what you're saying:
> - if using the dwmac1000 core, then for the registers at GMAC_PCS_BASE
>   (0xc0 offset)...
> - if using the dwmac4 core, then for registers at GMAC_PCS_BASE
>   (0xe0 offset)...
> ... is it true that only the GMAC_AN_CTRL() register is implemented
> and none of the other registers listed in stmmac_pcs.h?
> 
> In terms of interrupts when the link status changes, how do they
> present? Are they through the GMAC_INT_RGSMIIS interrupt only?
> What about GMAC_INT_PCS_LINK or GMAC_INT_PCS_ANE? Or in the case
> of the other core, is it through the PCS_RGSMIIIS_IRQ interrupt
> only? Similarly, what about PCS_LINK_IRQ or PCS_ANE_IRQ?

we only have GMAC_AN_CTRL and GMAC_AN_STATUS register.
There is no separate IRQ line for PCS link or autoneg. 
It is notified via MAC interrupt line only.
> 
> Thanks.
> 

