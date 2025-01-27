Return-Path: <linux-arm-msm+bounces-46194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BCCA1D145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FA56165E55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 07:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73021F5413;
	Mon, 27 Jan 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ThE0+qvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B05D802;
	Mon, 27 Jan 2025 07:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737962193; cv=none; b=dYMS6/G3v/fZevX6XHJQjIynYROTuHxblRjIJtzUgabYX4IfeXTR9XGQn6LXGdWP+Tq5KNb3Ci0qxROzoYU+WDX1e4qkyNgBu9atnVQee8mMcUwwZOLogdnXr5ClGgI8LalQ/5PpEe9BKXOoghgE8rPbjHi/3tIsUlkR2iSZadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737962193; c=relaxed/simple;
	bh=z2cZXoX2RfhWdkhkEOPCwIwymN0QDXu9XSFVJI2iz0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lQGqTCZ3FhcMs4+95H43DZvhKHeXE03byT2HPL3/2NDzAmstVBKWqlDqfEr4WLC18O3m2sWS46GBC5lVCjsSgoZzHpaJ9YUddEgjTVV80qHjxBfUpCxvTfhdeBHUqL8P25LsEkJt/gztMjJrFbsM5nn/5QcbY3BhKpOEfnNuQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ThE0+qvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R2K2bF012758;
	Mon, 27 Jan 2025 07:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbUBlCZwJD6OMgsm5bwkiEp7fSEDxHTpx/FoW/lN6nQ=; b=ThE0+qvbz4t6yUrh
	EsQywVhqw2IQJThXE9lnpdktuhQimJ8/3/pN4wcAK82TTyPac09RxEFO9PF9yXD5
	Hl8SKmSQE0qJakEAmxBEP7IW7smsjwg3KYqCqNlHUKx82GimskyzRKbhlYy4KuQ/
	FTgZrfplE8CB0R0TW2cvl40QFWpxlgJCv4k8jSSUkQTjHBXK+pOzW5sShV0/n9hn
	1COVyMCxEzAJ2vGwfptPs8z42PhqZBETNsmDMsJ0oWbWDz6h4cGxfqr/oVNyT8cw
	r4aAHY17MoE1UwOtBcCjTv0M7MD26C2AVjSkp4CU+2INc200xfDqbgrdUSswemSU
	5jyFAQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44du968tv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:16:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50R7GNUr031609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 07:16:23 GMT
Received: from [10.219.0.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 26 Jan
 2025 23:16:18 -0800
Message-ID: <9cad2d98-09fc-45b8-85b2-0ee08d0552dc@quicinc.com>
Date: Mon, 27 Jan 2025 12:46:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] Enable Bluetooth on qcs6490-rb3gen2 board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        "Luiz Augusto
 von Dentz" <luiz.dentz@gmail.com>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>
References: <20250127064940.1360404-1-quic_janathot@quicinc.com>
 <2a277ce0-f4df-44b7-888b-202fef36f4c7@kernel.org>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <2a277ce0-f4df-44b7-888b-202fef36f4c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vMadqQ51Xnv5U4iSb-7b7aEZtIkizWgf
X-Proofpoint-ORIG-GUID: vMadqQ51Xnv5U4iSb-7b7aEZtIkizWgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=856 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270058



On 1/27/2025 12:24 PM, Krzysztof Kozlowski wrote:
> On 27/01/2025 07:49, Janaki Ramaiah Thota wrote:
>> Resending the below  reviewed  patches after fixing the regulator warnings in v7 P1.
>> - Patch 1/2 Add and enable BT node for qcs6490-rb3gen board.
>> - Patch 2/2 Use the power sequencer for wcn6750.
>>
>> ----
>> Changes from v7:
>> * updated P1 & P2 with tag: Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> * Link to v7: https://lore.kernel.org/lkml/20250107134157.211702-1-quic_janathot@quicinc.com/#t
>>
>> Changes from v6:
>> * Elaborated the commit message with more information.
>> * Link to v6: https://lore.kernel.org/lkml/20241223135700.22660-1-quic_janathot@quicinc.com/
> These are entirely different patchsets - bindings only.
> 

Thanks for the quick review Krzysztof,
Initially we are getting below regulator warnings in patch version 5(v5)
and we fixed those by patch 1 verion 7(v7-p1)

  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 
'enable-gpios' is a required property
      from schema $id: 
http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 
'swctrl-gpios' is a required property
      from schema $id: 
http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 
'vddio-supply' is a required property
      from schema $id: 
http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 
'vddbtcxmx-supply' is a required property
      from schema $id: 
http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 
'vddasd-supply' is a required property

Explained complete history here : 
https://lore.kernel.org/lkml/d3bd97d8-43fb-452b-adca-ad03eb628031@quicinc.com/

> Why is this v8?
> 

To maintain complete history updated to v8

Thanks,
Janakiram




