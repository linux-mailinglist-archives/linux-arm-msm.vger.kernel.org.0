Return-Path: <linux-arm-msm+bounces-26584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DBE9350A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04C4FB2236C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EED1B86D0;
	Thu, 18 Jul 2024 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bR68FRly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC70E14532B
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721319846; cv=none; b=TPaAOJdVIk0LAt3jBQnViFJ7yr/gur1X4FjnHUuXBF//SKFSBtT+HBlcv4gOlGtjoB9rerm0HXUmBlym2C7vfzWmOwIYjJghctfeOL79rPG1RCUSqcTSYuv5AAYf+RCGyUZ6aNyrrAYU2OnwsrWbKgV/SIlo4KtKjV3/GpDYin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721319846; c=relaxed/simple;
	bh=p7x6SAlFKw/CV44ahsZPwmwYtIUhvtKravo+lC/468M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y9Q3cj5qK28tbOboRmxjqZ9X0jsQEha7AsNM+i0M+RMZi1FMQahtzHzYptFs8L0sXRMTX1328B/8jMGdzkny8dsXPGpmfUQE0UFjGspsNBsT3V4DDVr4BwzJD4GZ5SO+kHebUrOv+N5Jrp2H6aFJyB0yw62Lfl18oWjO6+K63+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bR68FRly; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I9rWG2012877;
	Thu, 18 Jul 2024 16:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epU4dQpdT7OFXum9eK/ttSHjH8WCjwiVI5XtX6zq5p0=; b=bR68FRly2vNCcGJX
	dYFsf075N1WPlfm8uonIBwfDtnDTA/h5JAYNbjzatl2kjNV7fltDGAXk3mnfDCbz
	VJPEo+ppkPKgd/UCG/1obfTGlerEK8lyV9x5w9u5UTPEQKz3BN4yKchUYFOqyymA
	h9sq5uq1w+C6QkLEj1AEkjuZiLoTAg0h8O77HDIpzBBaYLyYJDBi7qluIF8n9K13
	Ahue1bXwYmRkWDA1B5UsxxMdot8X8uw9x7GDWizMA/QcwTliCuKBs86GNqn7CXS/
	P49mTzJP9rt+mw7XkTpuZQoZes9pnmr9xRCzCPkSD2OKEGdHsv11knM/S6OVZgbl
	4AE8Qw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40es1wsx39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:24:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IGO0YQ032591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:24:00 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 09:24:00 -0700
Message-ID: <ad7c6dae-b682-b01d-3850-40858bed4c2f@quicinc.com>
Date: Thu, 18 Jul 2024 10:23:59 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/6] bus: mhi: increase RDDM timeout
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-4-quic_gokulsri@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240718061344.575653-4-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KV5BNz8FgcDYyQQlT7n7ocEZb_DxAPZf
X-Proofpoint-ORIG-GUID: KV5BNz8FgcDYyQQlT7n7ocEZb_DxAPZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=752 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180106

On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Host sometimes misses the EE RDDM during kernel panic causing
> RDDM failure. Increase RDDM timeout to overcome this issue.

If we are in the middle of a Linux kernel panic, the host is going down, 
so why do we care about RDDM?

How did you determine the new value?

Really seems like significantly more detail is needed here.

