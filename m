Return-Path: <linux-arm-msm+bounces-47143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5AA2C230
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 13:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED49116AD22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 12:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C1C1DFE20;
	Fri,  7 Feb 2025 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="StKrhOji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D91DF73B;
	Fri,  7 Feb 2025 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929965; cv=none; b=VtYTwsSB2iZF2SSJ8AMQ+cJe38VSlQnT8ShnB18RoeJZb+POuFxL4eiQruY0hPInfrg0hBL177XAXbg0vQ+ldeQ9b3TDVGuBE/pdhrXtbZu3eB0qKGCAkEC58w/OdhiSDy1Bz22W8Sk1JEFjrQHkYlQweMbC3Lx4+mM746NGeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929965; c=relaxed/simple;
	bh=90ALkuxIPaV7zvMY92t/88IsGzMcqTS2ihJd4YGdkiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P2dLPfU19cM0HBPIk/rcbVHCTFYu955qwGSVlwYQt/Q1JLm0gpBV+QAyF8LmM+HtGSDM8S/Z0qlzw6/MqSNZPnWtC20JjRTZpaQobYZ27x7r3sSKFrVsdg4vco9QboBunTEPQTEY6hBjkjN3qrG5Ppa4Rmib9hhUb+DzA6x/Vq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=StKrhOji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5176WWhe008285;
	Fri, 7 Feb 2025 12:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX2fRni3VlDgRLhRmAQ2ij9iIbkWH1v1gTy6Vdln1ok=; b=StKrhOjilL7eYgeS
	SQVOI8IcAQeMnPdn9IciOpiAzNJduR/VYwcFo97ShnIJsasf4k4Q05KwBeaO3UA3
	EF/T5gAjyfqx1bymKtt49W6IG3LviWuJsbl1Vr9BhovVe4yPhPbKwX46PoELnxQR
	EBFSZoqq0SC+UDpPgLB++QwIu+GtVikVi8Ge3ynMLY9Tam8R9bqQ9Vwbs3UmcCXS
	Y2QW+buzJsEUWGEIqACpltUjgX9Io6z27h5jEm6lsv5AKzcIyMYLK+srMHQG0cvU
	1Jw1lpx6nsMRChsOi6OpJtSViTnNV74Tw6VnOcL0bAgmZKRz1E2lZCicdBhG8Ee5
	AkLROA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nd0f0uvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 12:05:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517C5mBb028485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 12:05:48 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 04:05:44 -0800
Message-ID: <0670d046-a69f-4840-b80b-3cd1d3b1ef43@quicinc.com>
Date: Fri, 7 Feb 2025 17:35:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Add Qualcomm i3c master controller driver support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <Z6OQb29Ca2tmQs2Q@shikoro>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z6OQb29Ca2tmQs2Q@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dw9mIXA4CBA4rLWnZ49OcEC2p9C5hghG
X-Proofpoint-GUID: Dw9mIXA4CBA4rLWnZ49OcEC2p9C5hghG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_05,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=898 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070093

Hi Wolfram,

On 2/5/2025 9:53 PM, Wolfram Sang wrote:
> 
>> This patchset was tested on Kailua SM8550 MTP device and data transfer
>> has been tested in I3C SDR mode with i2c and i3c target devices.
> 
> Can you share with which I3C targets you tested this driver?
> 
Tested with Prodigy : one target as i3c and another as i2c. It's not 
having on board slave, but internally  we have target devices connected.


