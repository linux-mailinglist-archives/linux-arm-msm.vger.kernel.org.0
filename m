Return-Path: <linux-arm-msm+bounces-36099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D89B2408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 06:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E721C21055
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 05:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230AE18A959;
	Mon, 28 Oct 2024 05:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fiA5OUsI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249F646;
	Mon, 28 Oct 2024 05:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730092570; cv=none; b=MyYt8pi6PL0WhA91DjAJit4psGs8sYb9bt5JpoOy8lgLCwHz/p6her+uATl7WeYu393NJKI0zSrksRWFfY5Vu7IlvP0R28maKh+vKv2K8WCAok3I0gpRmWeF73MoFC7O1T92ctMUWOhJJPm/QUZJ8R1WrFSOL5qEn9PTtE0iDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730092570; c=relaxed/simple;
	bh=NeiDnxW6+CaN8HTntKouJjciT9/fHViKi/g7Ol6iO08=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MEqf/a+kkpfIkuLKRV9hFttYwf/uWJwvoG3capSR/IuFg+yco6H6+up09buK27SvgEk2jIy7VRYQ5KcoEfWntPO4glAotWiqAkrNi+qmCzTib83hObPxtYCyRnZYax0KwmrJsxfOp40bELD7+zRl1BHZnGDASz3nwtRUboOyzQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fiA5OUsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNxiwH017467;
	Mon, 28 Oct 2024 05:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNfJ+VE0McHs+D6MN/SQa8ixaw3qRmSdWP5mkFmCyeI=; b=fiA5OUsIH/n2lCec
	Bd6rfnTjWiaauQSMvmybZvZk8EggUX5cjQJP5MFOMemOlxHgKmI0iwAD5d3E5RaA
	24aAKjNuvjTb/Jhx5ZPBBZGvUz+7Y8JGjNk6sffw2FqFxJ/rwbEhpXsA7f3iuZ8N
	CwxKydS/zpC0/CWN/PW3pB5th6g/Qr5citr3PvkbuZHpt+piETweoYfrux4uqRJ+
	IC+/QNXI0+CLv3SvcQTu/KsfDjXXPhFHB9RGGvmua7FKu+CtskK+L4TJ0vRkn3cJ
	QgBau2d/NlMdGdluoJO2A2lDSw6+2PY7EqRW355sOzYfPcEGFgF+vnEXRDGAlJ+a
	KlgOZA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgkq3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 05:16:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S5FxfZ004596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 05:15:59 GMT
Received: from [10.216.48.13] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 22:15:55 -0700
Message-ID: <0487791a-f31b-4427-b13b-b7ab6a80378b@quicinc.com>
Date: Mon, 28 Oct 2024 10:45:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P4B_djelzvsaKjiCRpCbZzRvWnFhno0C
X-Proofpoint-GUID: P4B_djelzvsaKjiCRpCbZzRvWnFhno0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=776 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280043



On 10/26/2024 5:50 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
>> QCS8300 has few additional clocks and minor differences. Hence, reuse
>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
> 
> IIUC, these clocks are not valid for SA8775p. How do we deal with such
> cases for other Qualcomm SoCs?
> 

These newly added clocks are not applicable to SA8755P. In the 
gpucc-sa8775p driver, these clocks are marked to NULL for the SA8755P, 
ensuring they are not registered to the CCF.

Thanks,
Imran

> Best regards,
> Krzysztof
> 


