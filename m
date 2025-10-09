Return-Path: <linux-arm-msm+bounces-76599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8BBC867A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8DF3C1DE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54AB2D77FF;
	Thu,  9 Oct 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYpgwDP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDC86352
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004483; cv=none; b=s0bMz4NkxVR45x2T+XwOo4RsLRMPElsgYFNO+PR+IKRx1ooRI89PLq4oIquUl2Y6HqrZyJBp8rqjOLiHfX8S1RHc1HbETKEbAqiJK5p4DSHM3aVLV3nuVdeo4PDyV/FqWTpsulB+aqURP2ITxO81Om78/tsw0nvNFVcZe8HNpbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004483; c=relaxed/simple;
	bh=kT5aSsHLMvJcFYqS9858CtPC7VkwZb+zjN9Q38ZnC4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqLu+gdoT0yZi8H711QEgM7lZzdIveYv52cAGLLUZQNLIF5YBNHP3K/wp9gblbrdnDT06mHghaCaMvcOgYN5gkba1CmOXVyIgx3DKZ7TVw5jfHMSNChCml5o+7+isLWvx9jZLqhEePXWNRepsWfz2WAWlyVb6GvZPQ5zOpAMF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYpgwDP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eb68024093
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 10:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+lyzqRYoN1PwxO1BIU31aKfB/fnT5JSDjuNND3aBzQ=; b=QYpgwDP1D31aOMyZ
	YywU4gnkuL956SZkp7cBGO5LaGfKNEZgHqi5NfNiQBQxnp9A1zjhbJsRRmahjk1i
	o+AzAphCR8lYi9fUzbfU9z1l3Li99k1/AtAnJzQMN7lypuO8d/2sm3INOyY932Om
	EeXe+yIhHT7xU7GBe4s4hLVAji2cmxqBn+RdfCuMZJwlnZJUV9VvOigMtcbXbOFH
	5GwojK7LWKJ1D+TdXSVka4uVL/avCw6qmNYviX6s0DKO7s7Af4bIz0DCw6rJZRRs
	KO8aowESXsejlQKWn4x+Rw0e2I0S2xExV1xBcKmdLDxa/jP2yzuTJI0LRplvAxED
	owkkeA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m2cka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 10:08:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso957427a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004480; x=1760609280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+lyzqRYoN1PwxO1BIU31aKfB/fnT5JSDjuNND3aBzQ=;
        b=XLAAPZDvHIgiZlSBQXo8ckQgdRjF5kxVRzu6OLsqb2NTxmchwYpG0qgoTt6YIiDwrG
         I1SG+Kwj4fjxSTW4qFGXAtqVlLC2xZYFEf9A3Sj3BoCC/SlPnJViYdQcf9XEyegwO4Ap
         mluZeXE8Sa1FtIXptcQO89cL/F907odsPMe5xkMp0nvvhKtFbvj3DeMXl9vzrwcy2sLx
         jp59gQyjoGHKeiuwDVEQlxJdzZ6LKbRNsf6o9IDanjuc9kxNLjZLAWRtmuNbxRLgb5qx
         zRz+zks/OuXLfU+QXrPaucplQYPayobtS5S1BEefaDTbjVXZTD/29HGUaYXGNoeECaiQ
         1lZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVFfDNGda8PK8KHvHHwqHC3GKknkB4LZ7Cp6DsAp+xY/B/fDzLgPsQQ1akSQrj3tw+2o9Qp0wBHOHlS2Ox@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0eb4b4BXaGAbv7C7GlXdvsDt9LC71JBFBMp5JRqzjKKq9N5/b
	+0/VCiwb0xuGsNEBCQRv+CMRO0X+GDZradjEvQrVAMbvVdT0XXst15+u1Cu6SjAPxoC8XwSeEsz
	jZvwVkbgaeBUGgm3Q1Omrx9zTUZcevaFclRGhLYaciEqc5imoG4go+XGI/VIAXo3H9VNs
X-Gm-Gg: ASbGncvmxkrm1VOFtpkA7GyPDiDiVPaYqQB5qLTrSQ2/+im2Rkq38RXRiwKk7TgsbwN
	KvnpaPHPTdz14CxH/qV/WPNPjNH/9/aNHzFCDrJ4WNXtk+qz4QKHoU0fHo1GBdK3+OBzMp+h4Bo
	R5YeWeIOZwNNk6qKi1ruQFAHjbqjkGyi9OkPc9IMJuzjklaTd4q9FuFIJeac0NeQW1pMOvvJFnR
	wB9a2x4E/oX0sIwyrjaEiA7B3vBDF8uAfIUw4QxuPxJZNtNOtUFma44aRAw94yCEbdewf4HAf42
	2PlL1uZw5ILgw+dvevnoaX6elJhp79XpoQ/K9px4DFkzB3uhAclVyLxYlNanzFxbu1hAiQI4YmI
	8cFgGIx+byrYxXXtHJyEqRzo5QTtPBjAOa7uy6jBLhBIb1ZO/KanhhQjKp28qBHs=
X-Received: by 2002:a17:903:11cf:b0:261:1521:17a8 with SMTP id d9443c01a7336-2902723b1d9mr94524445ad.16.1760004480428;
        Thu, 09 Oct 2025 03:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbxN93j7VTEPwO/Swvo0O1F5pdyYPalvwxU1PLckRm8Bj1sYEuo3JDASKn6xxZmVSucH7xjg==
X-Received: by 2002:a17:903:11cf:b0:261:1521:17a8 with SMTP id d9443c01a7336-2902723b1d9mr94524045ad.16.1760004479935;
        Thu, 09 Oct 2025 03:07:59 -0700 (PDT)
Received: from [10.190.201.224] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c0fsm23636155ad.104.2025.10.09.03.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:07:59 -0700 (PDT)
Message-ID: <e281599a-b34c-4c68-9848-c3ae51fcd095@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:37:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: qcom-ipcc: Document the Glymur
 IPCC
To: Rob Herring <robh@kernel.org>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        mani@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-2-sibi.sankar@oss.qualcomm.com>
 <20251002003936.GB2672888-robh@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20251002003936.GB2672888-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzYvcxiuSaG6H
 F13Oui5jM88NK0RH7z4oaQz56PAKOQhnWP83RkpUzgu8cIgzFds2AA4E+V8XdcKkbW2eL5sHl2b
 ASwH6udtMLWgpy/0vmH6suqKVttVo6nYaHRQddocne3lXUFsCzX188IAZi/+450VE6HkjB9xyIE
 zgORlCclpBZ+6XwRrzMK0tH/ouAzrE+2K6f1CENLAlbAWBx/8xrJL+Vyg7jj1WsjGG1x04kJJAy
 ctAK4rhWO3TZ/AGvyGjf4jKf7/+XuSv/uKNIkBCgzCin4vsvxjHxrBhh5aoi+JSPcL5Zym24Sb8
 skK80CXLbrMtHBFXk2CSMTkddLbpnKcpx/9ON8w4s38i4daX3jJGC5RDevQT+2RrMRXzT8jPEWh
 B1YpAr04hy9iQP/uRyQFiVc45yQJzw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e78981 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=PTK300C7mqS8JA3qkmsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 72udKT1E5V4YG-UM7ZWRKzJRppFAG6Zl
X-Proofpoint-ORIG-GUID: 72udKT1E5V4YG-UM7ZWRKzJRppFAG6Zl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 10/2/2025 6:09 AM, Rob Herring wrote:
> On Thu, Sep 25, 2025 at 12:07:22AM +0530, Sibi Sankar wrote:
>> Document the Inter-Processor Communication Controller on the Glymur SoCs.
> That's obvious. Say something useful here like how the h/w compares to
> existing documented h/w. Like perhaps the change from virtual ids to
> physical ids, whatever that means...

Hey Rob,

Thanks for taking time to review the series :)

Will add more relevant information during the next re-spin.

- Sibi Sankar

>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> index e5c423130db6..129870185884 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> @@ -24,6 +24,7 @@ properties:
>>     compatible:
>>       items:
>>         - enum:
>> +          - qcom,glymur-ipcc
>>             - qcom,milos-ipcc
>>             - qcom,qcs8300-ipcc
>>             - qcom,qdu1000-ipcc
>> -- 
>> 2.34.1
>>

