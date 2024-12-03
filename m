Return-Path: <linux-arm-msm+bounces-40015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB99E132A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 07:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4695E16476A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 06:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6EB17BB16;
	Tue,  3 Dec 2024 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pz8eVPpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D75336E;
	Tue,  3 Dec 2024 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205995; cv=none; b=uR4cbBqwsoKMMBWvQ1jNGDwf6Y7w7ZUVR2+yoBQ57uYj9ggjC0psk37KSQ0Vk17qXBoCdDi55n+CHTjwfYlXbV39BEzc9pzn1KbhVmzUje3SuQPLpUXuhaqxa8tTtraY8HneoB2B9MofwXaRl31FaJ/nYZYVM/+/PakfrVqK+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205995; c=relaxed/simple;
	bh=Nrw7iUWHIpL+/DqE3emd4bt8QkxSVXXzBcU+V9WQbfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O+haKdUC44v2TRRq2L0ZfB//Uwy3JKuvSrhC+d12vZEJd5l8kdt/KzDTguy7rqB5Va+/0JuexULQ8aufJB9sCFWrWBNZZRMxGiWB/eIwagA8nim5E4GAoT+rf1GMDKszwxhr9UiLL5sIhAJp/sBbYB8jI3GBUSN3sPkLPSrPqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pz8eVPpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2HdwG2011455;
	Tue, 3 Dec 2024 06:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNKyC2eH49WBGrt9/0h9HC/KBJgu6BTqFfJJDNXMLt4=; b=Pz8eVPpeIQr8RAYN
	d1mF39h0PRmEAF1+v1VFfB0LDYMLCC52Yl+L4fREFmSnRZYGv8j4/yrm1XL/a6pp
	+LJNj4K0ZLL2hy1YXCa/15AEhRPSP6jKxFHGSKHRHM+I67fTvtYNKI/eoeQP3n5F
	Yb07B+zZ1wuzGcOCdR4nFx2DHC0Gt9NKi1HzTjg7koGJfERGlpiZZgeX96QJEJLl
	9i8ZPtgX6Sy1aXsr6BzkjkA7LQKZwcFkGwuYWEv+BdqqbTxd6BaFvU0aMEJE5uoB
	KqHWGAafxDUiGEJnr8jEIeyjvyszNLfgnHbbS/IVkQsGf17SNnLu4z6EB239Yub5
	cjzfBw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstf2vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 06:06:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B366SYY018214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 06:06:28 GMT
Received: from [10.110.67.80] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 22:06:27 -0800
Message-ID: <518ee3f1-b871-4349-ba85-3b3fc835a4ca@quicinc.com>
Date: Mon, 2 Dec 2024 22:06:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ERESMQkKch3DWCEq2trZTBGAaxgbPwhX
X-Proofpoint-GUID: ERESMQkKch3DWCEq2trZTBGAaxgbPwhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=788 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030050

On 12/2/2024 8:19 PM, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.

The first patch series was RFC and now you had removed the RFC. Can you please
provide the reasons?

https://lwn.net/ml/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com/

I understand that you have now changed to tee framework but I want to check
if we should continue with the version and increment here or start from [00]?

-- 
---Trilok Soni

