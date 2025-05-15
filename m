Return-Path: <linux-arm-msm+bounces-58065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF331AB8941
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D9D17F0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 14:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867141BE238;
	Thu, 15 May 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cnwrIOft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01E934CF9;
	Thu, 15 May 2025 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318794; cv=none; b=G+yOVmauTPmRzrTbqoJLYwh25066x0vu86zr9hxFDQeKkGjB+di7ifFEyZaVrLs3J3jiP1JzLH99K3v93ox8o7gDU2MlHHLhZWXbYJyGPV60Mr2WP4HgMkvqqH1GHBvJ10yhLMuuKE1p/GXaPAJfaDZjujvnnPJR4LY+b6ziZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318794; c=relaxed/simple;
	bh=GC6txoSymvE2eUpWMhcc5bo2fCFfhQdksJuOhmz5BVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P51TK+6g0q8ukpCKAyIvGW2p2Jij5jYw6Y8xkAr3X2sU5mgOZcXkqnLbRKzzDM5hc4Bh7B1M9IvO5HPcB24lsgW391zfqwfUyCyKg2BO2/j+wExmrtBa5rohDE0892tFrL4mhyDARW9+rThQH5bfR2oApedUaK+q2CIYLAp3XUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cnwrIOft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFQNr014911;
	Thu, 15 May 2025 14:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urkFCRXDRbwtEJDT1agZIO0oufUimI07N+gUnsi8KV4=; b=cnwrIOftSEWIY7pZ
	+Mgw7T/Yzd3TuK0D6AoUFj1/7fq+3TTsjvGMvLNeLUAOl6Wiwk786fLk9no6wctd
	ZrkwLPdCKRYPR10i4zyf6lv960YuvNB7PdxLKzGyNt+qYO69L0dii+g5jbIDLMoJ
	2m3a8mLpdvk0d6MgTYg82zFlNI6IeoosoYA/6/7Lf11sws/TtIiF5T8RoVTVBwxi
	OUk30vNGbZc+IBISX2C3JV9LCkr4e0xjppWjBKvJECPFz3DRutCn9f7ABjiF1r/J
	HvFnODgGgB080i7maVfrmgsbC2kY52ePq1u1SePM37nqimAgFXJWcUP3Cn7cgyjG
	fiVOGA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpeha7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 14:19:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FEJMUx025602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 14:19:22 GMT
Received: from [10.253.77.60] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 07:19:14 -0700
Message-ID: <27cf4b47-2ded-4a37-9717-1ede521d8639@quicinc.com>
Date: Thu, 15 May 2025 22:19:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
 <20250514195821.56df5c60@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250514195821.56df5c60@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zCNPpK9Wj48CpCbuzAioSutd55ac6o-C
X-Proofpoint-ORIG-GUID: zCNPpK9Wj48CpCbuzAioSutd55ac6o-C
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6825f7eb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=9R54UkLUAAAA:8
 a=1jNZuGh9AS1TBxJ8eMIA:9 a=QEXdDO2ut3YA:10 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE0MSBTYWx0ZWRfX7QCwf30M9hvR
 zgAae22HTtqhOrhMvWSby5cIFay8CChrA08LtRBV8jGcGQVql4W77pNgX/7NtG094YJE5fzjev3
 Y/+YXYaOX6OPxwAU+SlHQDytXUVl8RaAybpUD5WhES7gByIiZjuhNcXmndN95mlPPsD7Xs3bW5y
 ikLjTBGMdOsRVWPQ9d1VT5/hbPpb8f6VjXG2jRTcXRitd4PThzT3HhNhc3wMrVGB59C1jRfUBaz
 WBpPbClCKc5T4Zh1Q5Rzn09TuObWniawQzp3jhWYLgr58CCTDNdckwyTaQU8KefGztsH1/xlH8a
 uWEkiNJbRF5umZiHioYCWG/Y085Dzw0mgqbJrLASDW07buQRwyj+vfN5AxMzKipc1DDBnss5hqk
 8IB6rHY38zlUKPSiLyA2hzzyPj1tYYA2GbsI8FDFALfhb1KkbO4+/KvUK0KB+CicGAl3E/lI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150141



On 5/15/2025 10:58 AM, Jakub Kicinski wrote:
> On Tue, 13 May 2025 17:58:20 +0800 Luo Jie wrote:
>> The PPE (packet process engine) hardware block is available in Qualcomm
>> IPQ chipsets that support PPE architecture, such as IPQ9574 and IPQ5332.
>> The PPE in the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6
>> XGMAC), which are used to connect with external PHY devices by PCS. The
>> PPE also includes packet processing offload capabilities for various
>> networking functions such as route and bridge flows, VLANs, different
>> tunnel protocols and VPN. It also includes an L2 switch function for
>> bridging packets among the 6 ethernet ports and the CPU port. The CPU
>> port enables packet transfer between the ethernet ports and the ARM
>> cores in the SoC, using the ethernet DMA.
> 
> Please make sure the code builds cleanly with W=1.

Yes, the patch series is successfully built with W=1 for ARM and ARM64
on my local workspace.
make CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm W=1
make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 W=1

However, from the patchwork result as below, it seems the dependent
patch series (for FIELD_MODIFY() macro) did not get picked to validate
the PPE driver patch series together. This dependency is mentioned in
the cover letter. Could you advise what could be wrong here, which is
preventing the dependent patch to be picked up? Thanks.

https://netdev.bots.linux.dev/static/nipa/962354/14086331/build_32bit/stderr


