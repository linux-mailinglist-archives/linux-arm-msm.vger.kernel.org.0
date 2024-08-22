Return-Path: <linux-arm-msm+bounces-29265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497FF95B319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 12:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10AD6283DB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5DB181B82;
	Thu, 22 Aug 2024 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HxLmPgeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37014A0B8;
	Thu, 22 Aug 2024 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724323396; cv=none; b=kw6pTQU0D0/TK2LP54bxx7r3KowPy0AIAnMRCjcmJ2CHqbQ+dFKDR4U/K7QJBJHCPnweakJ/SXi/Dv30KLV0Fq8UDPkFTX7fSnBs9hPOaYZS+L/Mu0VVOGm4wZpdjWvZ+E4UTlMnnwOaKKYYrXHWGk1Gr/1vOHhraMGWcXSQSNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724323396; c=relaxed/simple;
	bh=fpVem33D+69grzXobRjgZMqRFbVQXeX7AgxHmOmo6qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LmZXyWcIcRph51DcyFe5uYKptDKPUsZzOvbyjnEAcTgJsgbWEz9UupfQRmaZLkAgxCXgwWiW56mSraL3DlSmmMNRjktBke+E8krv3qXr1Nj0f1hgFPt+0B3arBy6szNaZB9AlDNSCPEKEeOgET8u9uKnDmQiRyIi3xCv+LFLHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HxLmPgeo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MAEgjv019074;
	Thu, 22 Aug 2024 10:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQyW5VfaY0Obw4r4NigChgacwm6QBnZfPZ/0IXOPeQ8=; b=HxLmPgeoR2cELSUW
	Xv4SAwFEbZOmYg08QAiOBNbum+qfhzy7TO8JcpQJYgjrPHKB3h/BT+6sgzdaEaE5
	fyDPsNLqgMcN4C5RgE+Boy6r5/5PeWbqtF45tOYDN2QY7c4b8AbC7AzcEbT4VGAt
	f6sOqPIml97H0Lq+xBm2FfbvyHbtmQFVfUgHm6CGn+JwE1GzWlgnEgUgFg2Ddsz2
	hp9F5jcTFMW0HXekJlvj57Q4caCEc0q8A9QjevvgnBW8pqkapSDYmcElpF8q19Fq
	Gfc8C9XgfR9CQnhKx/tn77dIZTXrfwI5nCa/lYmAfjhPJVXFxs1BvHVeX7mnUkFz
	kGAC2w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415vsah8pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:43:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MAhBO4008204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:43:11 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 03:43:06 -0700
Message-ID: <807c9315-bf88-4a0a-9632-2ce471b329b6@quicinc.com>
Date: Thu, 22 Aug 2024 16:13:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add new driver for WCSS secure PIL loading
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <4d1c0d17-20b8-4989-9757-61031e9f03a4@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <4d1c0d17-20b8-4989-9757-61031e9f03a4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mJwCyVfArXUEWTriWtdPqJgoudWRntI3
X-Proofpoint-ORIG-GUID: mJwCyVfArXUEWTriWtdPqJgoudWRntI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 mlxlogscore=945 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220080


On 8/20/2024 4:42 PM, Krzysztof Kozlowski wrote:
> On 20/08/2024 10:55, Gokul Sriram Palanisamy wrote:
>> This series depends on q6 clock removal series [1].
> How? So this cannot be tested and merged?

Yes. Though TrustZone enables these clocks, since Linux Kernel will 
consider these clock as unused.
These clock will be disabled so we cannot bring Q6 out of reset. So we 
have the dependency set.
I posted this as a separate series because [1] 'remove unnecessary q6 
clocks' series was already reviewed for some
versions.

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/cover/20240820055618.267554-1-quic_gokulsri@quicinc.com/

Regards,

Gokul

> That's second patchset to day with some totally bogus dependencies.
> People, stop it.
>
>
> Best regards,
> Krzysztof
>

