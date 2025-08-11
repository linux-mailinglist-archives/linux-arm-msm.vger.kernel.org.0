Return-Path: <linux-arm-msm+bounces-68573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC4B215E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E855A1A22B88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420062874EF;
	Mon, 11 Aug 2025 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cNAl4xij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB218C322;
	Mon, 11 Aug 2025 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754941790; cv=none; b=gUakfOqsuKw/igWhxkMhju0GdQbTML3XTVFA1NHgbGo8kYb4V7EEkGVvTP0h08LNB/haQNw5w6g5hoLPMaJ7xA4byTG/5MByrAdUc1hsAVK/Pzzbc4eevtLyc1PaxF1xFBNJbgqoWqGnW7jRJePl6w/fRtdPToQe8oJf+DGeJ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754941790; c=relaxed/simple;
	bh=rboVk1bB7Jbo8EaAei+dCAWs6rnzVtrl+0yGju+GrqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RC0wdSL2ap+9LEFjToPF6t9x2Bt4BwGDs1zz/MbyYVy6VYVhSQrAg7BepGYXfNvHUqiXTd9Izjd72hOJfTambk4SlPkx2ZCFX8PoI+R/h2wEZjXVD6m7FemC8GYlhed+oMiqeRawGJN1oJlDIWHUiwYKM2ND9JEdyZLU9uM2p3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cNAl4xij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGC0NF013114;
	Mon, 11 Aug 2025 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2oxZ++xDq8dbM7T/oUEPTAbdcUvj6c8DlW4OF00CXM=; b=cNAl4xijGzYFHWTq
	t2N76DHv+ZAUc++aQKEYzE3OII/bpneFfHtwAPMzHGpZNouaB9HDtHvqH9go0j2w
	lmpkd1sixkikQ3bGgeti3C8TENMS7a8vbenj0mWzewzD7+0u/4TGGumOqOsLJFFp
	w14t+/A6ZcTPA5suzDqUb2YQf7WkcvbeQUHiW0fp7xFijFS8StlKBsxf0uci3mxo
	jwVTnWI9gRw5HGquuUvIngFSC47yXXpkapLcl4HIXtdtip9ow8b/DIzPFDDeEXFJ
	BLiKM8ZCVxSGVdGr/0j6B0LVzSlggMTAydns7uJcYB7jAF+8xnvc/4LBP0T3T4yL
	ISlT+g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmnsu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 19:49:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BJnVQh022703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 19:49:31 GMT
Received: from [10.216.45.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 12:49:26 -0700
Message-ID: <331c5c34-9bf7-4c1f-97cb-e78749c9f6b0@quicinc.com>
Date: Tue, 12 Aug 2025 01:19:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <mani@kernel.org>,
        <conor+dt@kernel.org>, <bvanassche@acm.org>, <andersson@kernel.org>,
        <neil.armstrong@linaro.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
 <5nsglhsnqdx4l44r36zmxumcpbbwhns4432hm3lvttsgyjaknb@feobdhpzzo65>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <5nsglhsnqdx4l44r36zmxumcpbbwhns4432hm3lvttsgyjaknb@feobdhpzzo65>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689a494c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=oXI4R0A_xwN3MdgyEWoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dl8omPryo6_9wFkZnuDwPlfdEOr6_J7q
X-Proofpoint-ORIG-GUID: dl8omPryo6_9wFkZnuDwPlfdEOr6_J7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXyZPEnPh1k6np
 cM9zNdbmK9mbNphIOHVzzakNmMU4rjULaPCyRbD30YTwEY2/+MEF/BIN9YQ5gT8LmvU0HHJ8KPC
 jlpYxvrigLfG0lQRHRvxsvE0a8uJUf4IxQc+8pCi6qoX/mUURQq5n8bJvhJrlHrazHTCsQzrGlB
 svNlf/BrzxOK9N3nxcdoVP+Y+j9BfjGpG/OGDH1b23vBRu3IQGWhNIng4i++wEGU4QlkAj//Urf
 OBdumWYtG6FxqFX3VNhPRWn7YDqApCtFLkeTKUe5090OgBLbdZ48hrngJXSoiTU4fX87u70+EHz
 DNGC+WCAG82uwRA97+yvPvkh9r3qPv0xmLivW3bwQzzVKkZqM8+yoYdgEZOk0SbZHSeLiuDBBkW
 9udj83k5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000



On 8/9/2025 1:00 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 06, 2025 at 09:13:40PM +0530, Nitin Rawat wrote:
>> Add support in QMP PHY driver to read optional vdda-phy-max-microamp
>> and vdda-pll-max-microamp properties from the device tree.
>>
>> These properties define the expected maximum current (in microamps) for
>> each supply. The driver uses this information to configure regulators
>> more accurately and ensure they operate in the correct mode based on
>> client load requirements.
> 
> What defines those load values? Are they actually dependent on the
> platform? On the SoC? On the board design? On the UFS gear?

Hi Dmitry,

These load values are defined at the SoC level, although they may vary 
depending on the UFS gear. However, the peak value per power grid is 
determined by the maximum gear supported by the controller.

In summary, the value is SoC-specific and does not depend on board-level 
variations. Based on this, I'm comfortable hardcoding per-compatible 
data directly in the driver instead of relying on the device tree.

Thanks,
Nitin


> 
>>
>> If the property is not present, the driver defaults load to
>> `QMP_VREG_UNUSED`.
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
> 


