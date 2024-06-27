Return-Path: <linux-arm-msm+bounces-24519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB88191AD60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0161A1C2412D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100DC19539F;
	Thu, 27 Jun 2024 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NKCt8F+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613C433B3;
	Thu, 27 Jun 2024 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508006; cv=none; b=o8wPcCQvnUdf3fmeyIdSiL8eJ41XjUPpkXi44LLCTcIg9GkSavxcf2dlYeNWcVzsmoBn+Rz12wiSnbHIPAQZzZ3tiYMc7BemMl4U0pLAAtaR8DVExtpHDwSobVOv2DUiAteQq/ZbeFQXIlYASCvHlNTRkoWWllgAjIIjLJbJK1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508006; c=relaxed/simple;
	bh=hgNJCnxBiMqPaye3s3z7C88onRAx5EJASz+v8yIwNjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VdDOwv1F23caaLAJr4rIb+ujrsVjuDvgqoMLZTMvA/BMcM7ZzBspATPd5JulFXm/VT5mMXEh+04sVbMW1eGED+lPAZGUdVq3hW9EJRT0mkhKyCSH5yWoJBY1+pqPMjVKbg1SGY72O/n+xe5oC1jpkfUMOuiyw0KXgJCYTcvUvBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NKCt8F+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R9Y2gU018096;
	Thu, 27 Jun 2024 17:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD1SMUYBK0O3vgvTkPA3LPzdQgFAJsqJME8HG71np6o=; b=NKCt8F+S1pUg5N4p
	N3E1sMEFs6yuyzGSphE3Jz7wUt7yiOaDqE3b9QbupPoS2CQTbM4eOkhj1AIcNUCN
	ZGe8f0Ms6VVNkrisyzRj/ToEXp+H+m+qjYW0kSrZ5IngDK0LydR/hJjFtrr1Bw94
	IZkvmjQBmMMctJ9NAoe5c+diVCqou850pBVUu5vhSH+MnX4ptuTvhOKWZlOWV9mY
	Al1iqhWEoRxAIuWREnLNTfRTew8T9ANTUwCiJijqygFkftSsk/6orjOUpbs3bK5u
	cJVVIv5qSeMIM/HL9CwQ4RInbDdFij5+s/3vlP1G/sdzH1VrHQCGp12+O20uEJEi
	KddoKQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6vhx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 17:06:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RH6E5Y024546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 17:06:14 GMT
Received: from [10.216.16.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 10:06:08 -0700
Message-ID: <66648233-43f1-c61e-fccc-2c5a150d0bb0@quicinc.com>
Date: Thu, 27 Jun 2024 22:36:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 0/2] Suspend clk scaling when there is no request
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_nitirawa@quicinc.com>
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
 <036f0300-e55f-4f12-a416-93f54be025a8@acm.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <036f0300-e55f-4f12-a416-93f54be025a8@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pj9XH36FQ-zZgN57bYka5b4ZFCFMOaj7
X-Proofpoint-ORIG-GUID: pj9XH36FQ-zZgN57bYka5b4ZFCFMOaj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_12,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=799 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270129



On 6/27/2024 10:06 PM, Bart Van Assche wrote:
> On 6/27/24 1:37 AM, Ram Prakash Gupta wrote:
>> Changes since V1:
>>     - Address minor review comment.
> 
> This is too vague. Please be more specific in patch changelogs.
> 
> Thanks,
> 
> Bart.
> 
My Bad - will update it properly if next patchset is required.
By the way here I addressed code review comment from Dmitry.

https://www.spinics.net/lists/kernel/msg5268621.html

Thanks,
Ram

