Return-Path: <linux-arm-msm+bounces-41913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E769F06AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43EBB169AC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2067F1AB53A;
	Fri, 13 Dec 2024 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M3RQMb7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F426EB4C;
	Fri, 13 Dec 2024 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079499; cv=none; b=DSDyR0eD/v/hWA3rorRapqvgEPDXICZ14/kBBNk0/yBFyr9tKwg1f8JMKJOIYEFt1CaZZF90j0JhJzD37YqFV4rtaajEWikaalDV1ZzPHe/K5gtD+2DoF49V8iZX9rv3TPNAYlkSzt0vUvKiWnEE+E5Grr5RI96rbJoK12OcdFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079499; c=relaxed/simple;
	bh=60au0IL1z0EPeDYLB3ceUrtUyMuVbRP1lxZRnliIkQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q7MZH5HQ/seZFFMmb6UsBj/N7P6xmpTYU5txLFg44RbGdRWxiqy6WCjLZ40GfO42ql8gUPU1/9QeeUuYN9UbAJ/m6MERQvuSeB/YgjDJy1jNa1vHvmjK+x2TuBnhe6vFtW/bW4xcF8Uc6fZf6xFtGNulBYTk4x5VqsGHfLA4WWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M3RQMb7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81cUT022183;
	Fri, 13 Dec 2024 08:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAAmy5Qd7qR8PUEjfEfYrbyLoY/GTp/vpLpoIwdoc94=; b=M3RQMb7UbS/GF3OI
	qy+1k/g2RJKeGDzSgq0MHibh4jKzJHNyXPALbcI5d7JI+hh7vu90njYEn3prnoc+
	4Anjz5oBgQmEpXzQqIZSKl5RUtmBP7PwrhVd2DnFTOtWL+0TEfhO9KXoxq8X9VRj
	v7BYE4WqBKxjtxK0oVeV+ehlhi18etPT2XJ183whsYChuRCDMnDBVBRvs8LThv4n
	deg4EGy7VRT7E5NZ3QU1fgWpmE+96z8C/gACeRhRp6qmECR9gAOA+VJ24A1Odx9U
	zc3PPq1V3JEfFpq4or+UN0JGjWTkQdbei7Fig8CAYN1MLzfEa1CtwnfFvTMTR0tR
	tmB9yQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh270404-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:44:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD8ir4E023465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 08:44:53 GMT
Received: from [10.151.36.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 00:44:49 -0800
Message-ID: <93d9b6b3-0805-883f-33b2-1a5d8a384f99@quicinc.com>
Date: Fri, 13 Dec 2024 14:14:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq9574: Enable TRNG instead PRNG
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241206072057.1508459-1-quic_mdalam@quicinc.com>
 <20241206072057.1508459-3-quic_mdalam@quicinc.com>
 <a2f80840-75d4-4380-aa85-d83242db08a9@oss.qualcomm.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <a2f80840-75d4-4380-aa85-d83242db08a9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8c5ehsftLCYOGGL1q6lGp7jHQ7h8P-46
X-Proofpoint-GUID: 8c5ehsftLCYOGGL1q6lGp7jHQ7h8P-46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=584 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130058



On 12/13/2024 5:25 AM, Konrad Dybcio wrote:
> On 6.12.2024 8:20 AM, Md Sadre Alam wrote:
>> RNG hardware versions greater than 3.0 are Truly
>> Random Number Generators (TRNG). In IPQ95xx RNG
>> block is TRNG. Update the corresponding compatible
>> property to ensure the hardware block is registered
>> with the hw_random framework, which feeds the Linux
>> entropy pool.
> 
> Line wrapping should be around 72 chars, this looks funny
Ok
> 
> Please change the commit title to 'update TRNG compatible', as
> 'enable' implies the functionality is not present as of current.
Ok
> 
> The latter part of the last sentence is misleading, as both
> compatibles do the same thing in the driver. Instead, put emphasis
> on the wrong compatible being used and the patch making sure the
> hardware is described properly, without functional changes.
Ok, will update in next revision.
> 
> Same for patch 3
Ok
> 
> Konrad

