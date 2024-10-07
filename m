Return-Path: <linux-arm-msm+bounces-33324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA1992517
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D60EFB21B0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EFB158D93;
	Mon,  7 Oct 2024 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jOUgs5K/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4176800;
	Mon,  7 Oct 2024 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728283911; cv=none; b=b5z6S3tas56lGIDuLhb9i3s6SKI5KTlQqEbP7/JD3xiVpOESGKyREp+dEBrCF3w0slFT88y9nDzPJzlI12ZkOLgwyTkBSVZK4AbbyTZxAOga2Qlyq4ou12KjOmRqO8MnAsWW1ZqvyGdFEdJVjqpg4axEzX5sdKHwDof1UcKGeuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728283911; c=relaxed/simple;
	bh=/JweR3xqAxDcauTr/jYWHpf7GDl5xRXNxmQ1c6O5eHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JdPwHsZX6E1YLw9SY9RmPgFDVGPRsaWs5ai/j0SqGGrzpiAYCzSeakeruSEdbmbQBFnFt5IPINR38bfnsIP6hfi14ansqAG9RRWFrjK21Ld7olvFQYTF/kz/sm8tVF7iT+zLZaDEw33/9OOWvI9Oaw05imrVCXWQ2z0sPs9aPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jOUgs5K/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TvrT026116;
	Mon, 7 Oct 2024 06:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAQ0kKqRsMi/jC7SU+S24Pm3kxzvayqQn/O+Pi0oofM=; b=jOUgs5K/GmqfQGOR
	zd4xAE73w5QiFdxgh1rB9y1dMQDd7+xau7DVyQGum2KSUW6vhX4/5VBvRAuDCdZc
	xGMTSo89Ch6om/f/mkTfEUqK0PYnIyQd+KHjWFDd3Iu817y+b76MVpR/K1Gp8l5E
	Yn+/7bZemJbAP+PLqUpoWowjwZA6x1/05lN5IlsR/VQvLySeGDGw1d7A9QKhnb44
	VDkmi/QQKe22TEr+ldyBFoAo9kfxW+o60b83r0BZRRnUorQe6Qd7i/M8K9h4LPkv
	5aLpXHXaUrOSO6wbmKxIiU4pF/+P4QVBmyQx1F+tqm3irLvh2+wvjtWXjsJ/wqLM
	sd4VIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xtb388b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:51:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4976pert014996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:51:40 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Oct 2024
 23:51:37 -0700
Message-ID: <d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com>
Date: Mon, 7 Oct 2024 12:21:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla
	<sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <johan@kernel.org>,
        <konradybcio@kernel.org>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com> <ZtiG7YLcnOR9IIuE@bogus>
 <ZtiI0u0nAUbWEAAR@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZtiI0u0nAUbWEAAR@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ofa122x5U0fNdhfxhGTfqKFeox41HwKv
X-Proofpoint-GUID: ofa122x5U0fNdhfxhGTfqKFeox41HwKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070047



On 9/4/24 21:50, Cristian Marussi wrote:
> On Wed, Sep 04, 2024 at 05:12:29PM +0100, Sudeep Holla wrote:
>> On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
>>> Ensure that the bad duplicates reported by the platform firmware doesn't
>>> get added to the opp-tables.
>>>
>>
>> I am really interested to know if the platform firmware is presenting
>> duplicates intentionally for some unknown reasons and we are just speculating
>> it to be broken firmware or is it really broken firmware.
>>
>> For me, it is very hard to digest something like OPP tables which is there
>> for a very long time now is not very well understood by firmware authors.
>> How many duplicates are we seeing on this platform really ? If it is
>> just one I can understand. More than one is hard to miss from the OPP
>> tables in the firmware.
>>
>> While I am not opposing to make the driver handle these duplicates,
>> I am just worried if they are put there intentionally for reasons we
>> don't understand yet or not published.
>>
> 
> The number of duplicates reported in logs makes me suspect the same...seems
> like intentional/by_design .... but at first I stick to the general issue
> of handling bad fw replies and how to survive kernel side at first...but I
> indeed share your same concerns...

Hey Cristian/Sudeep,

The number of opps being duplicated is limited to the max
sustainable frequency before we see the turbo frequency. This
was pretty much the case in older non scmi perf qc cpufreq
drivers. They just filter it there, but I've gotten word that
this will get fixed in firmware for this SoC and any future ones
planning to use scmi-perf for cpufreq.

-Sibi

> 
> Thanks,
> Cristian

