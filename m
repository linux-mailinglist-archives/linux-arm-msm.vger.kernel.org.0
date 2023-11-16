Return-Path: <linux-arm-msm+bounces-782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CCF7EDED3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E709280F21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 10:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD1028DA2;
	Thu, 16 Nov 2023 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jQHul2sV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AFF18B;
	Thu, 16 Nov 2023 02:48:04 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGAU3I0015936;
	Thu, 16 Nov 2023 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PG1zXjM6smP55FHAGfkzq20pC99RpgLWqnjbwEKPGLg=;
 b=jQHul2sVzKN79SqfshkffGUS+8USzz4NxwTUn3LybWmqIkY4eJhGWSSS1EN584u6v6RF
 3GLpDLboMdv3XWwHkQozmwU+9vZFCXdPWBNPbCVVUo7K7vhaWlsgu7JJ0D23pPZgSgIm
 qAFmaVgJddg1wXHn4gkQwzVtjHyqxtbG3O0WxafW3dYVko5RVPEnCR1C50sNh8vGMDq0
 qSdyxgxbvUOUl9cAsqwrUH8iGgSZa2IicIqeR0W9/5/nS+WoYMoijKSHsfs4Tx7Dt4yY
 6r+Ujfxbe+/2ZU02srjJxj/QjbrWBXRB1C9imrAF+4czjzX3Yx99e87v0mDtNQSAVxtK oA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucuac32jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 10:47:52 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGAlqUa029385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 10:47:52 GMT
Received: from [10.253.72.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 02:47:47 -0800
Message-ID: <da446442-5f79-4ea9-810b-f9f0bbb906ae@quicinc.com>
Date: Thu, 16 Nov 2023 18:47:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] net: mdio: ipq4019: support MDIO clock frequency
 divider
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-6-quic_luoj@quicinc.com>
 <3471f665-f935-4091-b870-a42cf2b1eb96@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <3471f665-f935-4091-b870-a42cf2b1eb96@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gZ01dlr2ECSUVWjikFhmj6tCxCQrh-p_
X-Proofpoint-GUID: gZ01dlr2ECSUVWjikFhmj6tCxCQrh-p_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=666
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160086



On 11/15/2023 11:22 PM, Andrew Lunn wrote:
>> +	/* MDIO default frequency is 6.25MHz */
>> +	priv->clk_div = 0xf;
> 
> 802.3 says MDC should be 2.5Mhz. Its O.K. to support faster clocks,
> but it should be an optional DT property, clock-frequency as described
> in the binding.
> 
>     Andrew

Ok, Andrew, will add the DT property "clock-frequency" to support this
clock divider in the next patch set, thanks.

