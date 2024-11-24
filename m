Return-Path: <linux-arm-msm+bounces-38981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACB9D77A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 20:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF8E1281E7D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 19:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D1F81ADA;
	Sun, 24 Nov 2024 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HJEKVx+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1F17BA6;
	Sun, 24 Nov 2024 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732475254; cv=none; b=l3aKzJFWo92EZcTgvoFIjMREQGjkzHP87TNOMRQPtYSLBJcsuaKEPGoQsOn4UnRCAyYxUQquSj42hCHAX5rRT62x31iEdY3hBJSyGQS5bCO9r0lqpBbC+bL4FOMk+Ztz/Q5e254zsjZKafG5o2vIKSvKz5+D2OwosAwj3wui724=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732475254; c=relaxed/simple;
	bh=esIeKPZ5uMUcixde5dcDskkQnFhBhetH5uV6GOY/E54=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=li1sPRgMEY25i3Up+v8GaAC7LtKJTyaKnYX2v8F6V13Kb/+81tdhTStZJQRkoFEElr7QAMy2BdUnzEIO1m4MxLdQhE3n6v542NhWNp6oPOzXNPN0n30Bd3SuxpVSVMKFvrvp7ocoWgfA2YiwGH9U+mH3RyYWjGCpijjpPr1zOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HJEKVx+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AO9Q1TI013221;
	Sun, 24 Nov 2024 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bkre2WeoGiPhovYus2RkV3ZM5DAJZ4Ku2XTeN1DLg+M=; b=HJEKVx+0D67xsjSp
	9RpCLAS+OHmQ6u5PiLD+Q+wdS2ppmbMTCT/EuX40FlM1mHRrdiu58m0yhZ5xDiLV
	xetOZXBFDeEOmyio4hb58W7215cxWBqlzdLQYTBa/Dn/XEvMT3lpx9HU85NFswyj
	KT33I+wvYXNmVp8VTiXfUJGX9eNhUEmAv9pCJJ2mE86YFqWG7e6xqB6eKVaNKDv2
	tMYQuTf6c4Yq1dhZOChU/595R5JHejU/MnaNcUvmPoltuqzw7lRwIU8YC4etA5ju
	iRSigIucMWQrcwGZI/Ea8B2t1yUfRFbCCIQpbQS7bg4Id82ieHJNMP4pBkJ8v4Fn
	3OJuRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337e6tmvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 19:07:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AOJ7MKS000470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Nov 2024 19:07:22 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 11:07:21 -0800
Message-ID: <51afee37-2c90-d31a-978c-5681dccd5ccb@quicinc.com>
Date: Sun, 24 Nov 2024 12:07:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH AUTOSEL 6.12 033/107] accel/qaic: Add AIC080 support
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
CC: Troy Hanson <quic_thanson@quicinc.com>,
        Jacek Lawrynowicz
	<jacek.lawrynowicz@linux.intel.com>,
        <ogabbay@kernel.org>, <corbet@lwn.net>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-doc@vger.kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
 <20241124133301.3341829-33-sashal@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241124133301.3341829-33-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P6p515Ej5zV_wAaxb-O7SdWDXz9JZpjc
X-Proofpoint-ORIG-GUID: P6p515Ej5zV_wAaxb-O7SdWDXz9JZpjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1031
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411240168

On 11/24/2024 6:28 AM, Sasha Levin wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> [ Upstream commit b8128f7815ff135f0333c1b46dcdf1543c41b860 ]
> 
> Add basic support for the new AIC080 product. The PCIe Device ID is
> 0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
>  From the qaic perspective, it is the same as AIC100.
> 
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20241004195209.3910996-1-quic_jhugo@quicinc.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sasha, it feels like autosel was a bit aggressive here.  This is an 
enablement patch for new hardware, and not a bug fix.  Therefore, it 
does not appear to be stable material to me.

Am I missing something?

-Jeff

