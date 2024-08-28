Return-Path: <linux-arm-msm+bounces-29825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF4E9630B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7AF1C20A39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052901AAE19;
	Wed, 28 Aug 2024 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XdA9o5UW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCA1A7AF3;
	Wed, 28 Aug 2024 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872147; cv=none; b=dzaCTehUPbX/kI7BOtTvJ8a7O233NL5OBqgMmtUJWPR0pIaxqbE5tnlgIrxs2FtGvLGyRpjHHYMVMV5XLWOPRplYUDAUMYCnKbnEZ5CRIbJRtmhLuDTC59P7kduf2ZCJS4gufUwLpJ1k9ej0shhLpgcAMhdMRz2aqnHaNPVXBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872147; c=relaxed/simple;
	bh=RfIkBE5qcx2NvGM4aiff+YB3i3M2xwPNJdHsDYVW/a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NI6KzLGmsRmyvyVq050P19MEfW2scson0sAvFcBYEkRpNg2kjy+GK+eYFu6AxjP1WccJoXTyM2IK6s3WNA38iqyuKsntwdyGSxD0ZqO8UnFhLYbWjCFDI83YTmiT+MGR+hWsARbKs0MWbg6/9eew0XBv9B1CTgqifImmilADC5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XdA9o5UW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SAWN9F026181;
	Wed, 28 Aug 2024 19:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKpZ0og/cMGjOJGLBrYGLN0y0bcBZ+PDO357ZwRsNV4=; b=XdA9o5UWGHNxxnOB
	lZOToL3+CSAsoCakk9s9aT15bH/RP47WkB0WE0mRIRKp9pdOPyFd1fSFS0zimcNT
	omd6d9cHQnWzLUt/iOL7Zb+HJojiZl2gpGtXGLcHkTdY4GsXmSyiu0ke6WiWR0/h
	NFhLaPifkBC+19YKLevk+i4HKKpTRXtQyiBFCbLiIKARC6tnFJIDuG3ahw0M2hJS
	Hm7uGRdXhnlh+Sejh3z51iLMaaIc4/5wtwc8X2rYe7nxrV/tUJUaXgS7xspMne1t
	nWAzxR3S3r3pVZCYa2pWYR7OLo4kfGPcAN+pU6/qnoouQv/75FJ7rUzQZa172UUR
	heG8MQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putjvs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 19:03:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SJ3wZr017313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 19:03:58 GMT
Received: from [10.110.111.6] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 12:03:58 -0700
Message-ID: <a8914563-d158-4141-b022-340081062440@quicinc.com>
Date: Wed, 28 Aug 2024 12:03:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom-rng is broken for acpi
To: =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>,
        <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-arm-msm@vger.kernel.org>
CC: Om Prakash Singh <quic_omprsing@quicinc.com>
References: <20240828184019.GA21181@eaf>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20240828184019.GA21181@eaf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jYrEaUWxkjc5ZqRoTngFX-O5xE6gPPu0
X-Proofpoint-ORIG-GUID: jYrEaUWxkjc5ZqRoTngFX-O5xE6gPPu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=734 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280138

On 8/28/2024 11:40 AM, Ernesto A. Fernández wrote:
> Hi, I have a bug to report.
> 
> I'm getting a null pointer dereference inside qcom_rng_probe() when this
> driver gets loaded. The problem comes from here:
> 
>   rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
> 
> because of_device_get_match_data() will just return null for acpi. It seems
> that acpi was left behind by the changes in commit f29cd5bb64c2 ("crypto:
> qcom-rng - Add hw_random interface support").

Which Qualcomm platform you are testing w/ the ACPI? Most of our platforms
uses the devicetree. 


-- 
---Trilok Soni


