Return-Path: <linux-arm-msm+bounces-33783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFAD997DE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E86FB24DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ADB1B3B2E;
	Thu, 10 Oct 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J9qSgYTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE51AF4E9;
	Thu, 10 Oct 2024 06:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543409; cv=none; b=GinehJCFy2EfM54Encjd2QorFR5D35KcNmwe6WUW6ZUR+P30479iXeOFq6VIh6hS8cH0uorFZS06sNTRCOSCc1Csya8CfyM8W3yJO3pFM+BSYvn+g9zXm8xMh3ZvQt79g/ydE8xEiRYfObEUlSWVyJJlN6/KqGsNpiBzc0/jHxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543409; c=relaxed/simple;
	bh=cy3dmLJVjnxYBPUZzXcZckNbRvsLdNJPqrIFM83whYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hmx3ry5955eBV9NwVBvNcCTRBJTdTFCoKrEKlSKbIMNmJV2+t1HGk38gELushd82saHrKqTwdDnq4rQDenvrdvcptniycnCYLlppKoYQKsrLMdOmHSgJhnbf/wikUlP2OW/A/XnXVYRDGV9AhMi7HpZeF26e121QvHZ8dgjHy1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J9qSgYTd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bRZL011409;
	Thu, 10 Oct 2024 06:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNdHe2AX2/Z67IOyFyFTmoORdiXJ9Q0adZPMXwZvNZ4=; b=J9qSgYTdYbyV/Yf0
	lZHpIrSHtaXdZcST5owlvnSZSPnFYCIaRzDlzQ2gk5c5jvr68pRIXdK3XcW7y6mu
	rzyd2tKlTL9LaOyknY98pvzdREuxG48Hbn9pAfvjchP+0vKljGExahNzlbsGA+97
	2dKLc4qQ+Bem94MjjKEU6HmeroSGI1ja5N+gCBO9Lq1cCo8LfcAhq+ont9QO4G7H
	W38cyx9kCohu67ZH1ZsLR9W+Wkx3Q13whONMeZXaaOQADZG8J1yj48UziWykfGWV
	SYk2U3sfCCSNHplF54iwm6SHTTsLBwPJUZ88yd5LWQchuhZp0txdE+zhje3gI0g7
	tHDF5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthsgp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:56:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A6uh6Z000703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 06:56:43 GMT
Received: from [10.253.78.114] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 23:56:38 -0700
Message-ID: <7636f943-d8a4-46ed-a9a1-f4c839a6fc3f@quicinc.com>
Date: Thu, 10 Oct 2024 14:56:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: add qcs8300-ride Rev 2
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
 <20241010-dts_qcs8300-v1-1-bf5acf05830b@quicinc.com>
 <znm4hf6pjalknristwhp7kuxyxjt7dchwq42bpubcoxaof6ksx@gxvcxt6joauo>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <znm4hf6pjalknristwhp7kuxyxjt7dchwq42bpubcoxaof6ksx@gxvcxt6joauo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZiWIRtikK3fPQhJZDdoTGu2thyp3q6wo
X-Proofpoint-GUID: ZiWIRtikK3fPQhJZDdoTGu2thyp3q6wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=789 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100044



On 2024-10-10 14:16, Krzysztof Kozlowski wrote:
> On Thu, Oct 10, 2024 at 10:57:15AM +0800, Yijie Yang wrote:
>> Document the compatible for revision 2 of the qcs8300-ride board.
> 
> What are the differences? That's what you have commit msg for.

Revision 2 has a different EPHY, identical to the one in sa8775p-ride 
revision 3. I will document this in the commit message.

> 
> Best regards,
> Krzysztof
> 


